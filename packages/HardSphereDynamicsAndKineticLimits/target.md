Verdict: design
Name: HardSphereDynamicsAndKineticLimits
Base: none
Owner: none

## Scope

The roadmap owns the microscopic model of classical kinetic theory: finitely many hard spheres of
diameter ε > 0 in dimension d ≥ 2, their almost-everywhere defined measure-preserving flow, the
transport of densities and equilibrium measures built from that flow, and the Boltzmann–Grad limit
as a target statement. Nothing in the library or on the board plans any of this (see the report).

**Position space, in the generality of the sources.** The two certified sources set the model on
different carriers: GST2013 Ch. 4 on ℝ^d (GST2013 line 833), BGSS2023 §1.1 on the flat torus 𝕋^d
(BGSS2023 line 119). The roadmap owns both. The design should build the dynamics on a carrier
that covers both cases uniformly, that is, a position space X with free transport (x, v) ↦ (x + tv, v),
a translation-invariant distance, and a translation-invariant measure, and instantiate X = ℝ^d
(Mathlib's `EuclideanSpace ℝ (Fin d)`) and X = (ℝ/ℤ)^d (Mathlib's `UnitAddTorus (Fin d)`, which
already carries a normed group structure and an additive Haar probability measure). The filed
wording, torus only, is the primary instance and the Boltzmann–Grad statement is made on the torus,
as in BGSS2023; the ℝ^d instance is the one GST2013 proves Alexander's theorem on and the one
DengHaniMa2024 uses. If the design finds the uniform carrier too costly, it builds the torus case in
full and records the ℝ^d case as a Check with the lemmas that differ (only the position estimate of
GST2013 Lemma 4.1.1 uses the ambient geometry).

**Owned.**

1. Phase space and collisions: 𝒟^ε_N ⊆ (X × ℝ^d)^N, its closure, the boundary pieces where exactly
   one pair is at distance ε, the collision vector ν ∈ 𝕊^{d−1}, incoming, outgoing and grazing
   collisions by the sign of (v_i − v_j)·ν, multiple collisions.
2. The specular scattering law and its algebra: involution, Jacobian one on ℝ^{2d}, conservation of
   momentum and kinetic energy, exchange of incoming and outgoing.
3. Hard sphere trajectories as paths with a locally finite set of collision times, free transport
   between collisions, scattering at collisions; forward and backward trajectories; uniqueness.
4. Alexander's theorem for finitely many particles: a Lebesgue-null set outside which the global
   trajectory exists with only binary non-grazing collisions, finitely many in each bounded interval,
   and the resulting maps T^ε_N(t) preserve Lebesgue measure and satisfy the group law almost
   everywhere.
5. The hard sphere flow as a measure-preserving flow defined almost everywhere; invariance under
   relabelling; the grand canonical phase space 𝒟^ε = ⨆_N 𝒟^ε_N with componentwise flow; transport
   of a density W^{ε}(t) = W^{ε,0} ∘ T^ε_N(−t) and its identification with the weak Liouville equation
   with specular boundary condition; marginals of a symmetric density and the first marginal.
6. Equilibrium: the canonical (Gibbs) measure on 𝒟^ε_N with a Maxwellian velocity profile, the grand
   canonical measure of BGSS2023 (1.1.6) with a general one-particle profile f⁰, their invariance
   under the flow, and the rescaled correlation functions of BGSS2023 (1.1.10).
7. The Boltzmann–Grad scaling, the empirical measure, the hard sphere Boltzmann equation with its
   collision kernel, and the statement of Lanford's theorem as a sorry'd headline target.

**Not owned.** The proof of Lanford's theorem (the BBGKY and Boltzmann hierarchies, the Cauchy
problem for the hierarchies, term-by-term convergence: GST2013 Ch. 5–7 and Part IV); the Cauchy
problem for the Boltzmann equation itself (GST2013 §2.3, Theorems 1–3); the fluctuation field and
large deviations of BGSS2023 Theorems 2–3; the long-time derivation of DengHaniMa2024; the
infinite-particle system of Alexander1976; short-range potentials (GST2013 Part III). These are the
consumers' subjects. Symplectic structure, Hamiltonian vector fields and Liouville's theorem for
smooth flows are HamiltonianSystems'; Koopman operators and transport of densities for smooth
divergence-free fields are IncompressibleFlows'; Poisson random measures and point processes with a
density against a Poisson process are PointProcesses'.

**Conventions the design must fix once.** Diameter ε (not radius); the collision vector
ν = (x_i ⊖ x_j)/ε pointing from j to i (GST2013 line 846, BGSS2023 line 126); the scattering formula
v_i' = v_i − ((v_i − v_j)·ν)ν, v_j' = v_j + ((v_i − v_j)·ν)ν; "incoming" means (v_i − v_j)·ν < 0. The
one-sided continuity of velocity paths differs between sources (BGSS2023 and GST2013 take marginals
left-continuous in time, GST2013 line 1229; DengHaniMa2024 takes velocities left-continuous,
DengHaniMa2024 line 166; the issue form takes them right-continuous). The design picks one
convention, states it on the trajectory structure, and proves that the other is obtained by composing
with the scattering map at collision times. The Boltzmann–Grad scaling is μ_ε = ε^{−(d−1)} with
E(N) ε^{d−1} → 1 in the grand canonical setting (BGSS2023 lines 212–217) and N ε^{d−1} = 1 in the
canonical one (GST2013 line 672).

## Final targets

Write X for the position space (ℝ^d or (ℝ/ℤ)^d), d ≥ 2, ε > 0, N ≥ 1, and λ for Lebesgue measure on
(X × ℝ^d)^N.

**T1 (scattering).** For ν ∈ 𝕊^{d−1} the map σ_ν : (v, w) ↦ (v − ((v − w)·ν)ν, w + ((v − w)·ν)ν) on
ℝ^d × ℝ^d is a linear involution (a reflection) of determinant −1, so it preserves Lebesgue
measure; it preserves v + w and |v|² + |w|²; and (v' − w')·ν = −(v − w)·ν, so it exchanges
incoming and outgoing pairs and fixes grazing ones. Locators: GST2013 lines 843–847 (formula
(4.1.2)) and lines 1222–1227 (the pre-image formula (4.4.1) and the involution σ); BGSS2023 lines
125–131 (formula (1.1.2)).

**T2 (trajectories and uniqueness).** A hard sphere trajectory on an interval J ∋ 0 from a datum in
the closure of 𝒟^ε_N is a map Z : J → closure(𝒟^ε_N) whose position path is continuous and
piecewise affine with slope the velocity, whose velocity path is piecewise constant with jumps only
at a locally finite set of collision times, and which at each collision time has exactly one pair at
distance ε, non-grazing, with the velocities of that pair transformed by σ_ν. Two such trajectories
from the same datum agree on their common interval; the time reversal (t, x, v) ↦ (−t, x, −v) carries
trajectories to trajectories. Locators: GST2013 lines 836–847 (free flow (4.1.1) on 𝒟_N and the
reflection law), DengHaniMa2024 lines 140–172 (Definition 1.1, the dynamics as a system of
conditions on paths).

**T3 (Alexander's theorem, finite N).** There is a λ-null set 𝒩 ⊆ 𝒟^ε_N such that every datum
outside 𝒩 has a trajectory on all of ℝ, with only binary non-grazing collisions and finitely many
collisions in every bounded interval. For every t the map T^ε_N(t), defined on 𝒟^ε_N ∖ 𝒩, is
injective, maps 𝒟^ε_N ∖ 𝒩 onto itself up to a null set, preserves λ, and T^ε_N(s) ∘ T^ε_N(t) =
T^ε_N(s + t) almost everywhere. The proof bounds the measure of data for which one particle meets
two others within time δ (GST2013 Lemma 4.1.1, line 867: at most C(N, ε, R) ρ^{d(N−2)} δ² on a ball
of positions of radius ρ and velocities of radius R), removes a null set of grazing data, iterates
through time steps of length δ using invariance of the measure under the partial flow, and takes a
countable union over times and radii. Locators: GST2013 lines 862–863 (Proposition 4.1.1) and
875–910 (proof); Alexander1976 pp. 217–232 and Lanford1975 Proposition 4.3 for the original
statements (both uncertified, cited by locator); BGSS2023 lines 132–139 for the statement on the
torus. On the torus the position estimate is global, since the torus is bounded; on ℝ^d the
exhaustion by balls B_ρ^N × B_R^N is needed.

**T4 (the flow, relabelling, grand canonical phase space).** The maps T^ε_N(t) form a
measure-preserving flow on (𝒟^ε_N, λ) in the almost-everywhere sense; it commutes with the action
of the symmetric group S_N on labels; 𝒟^ε = ⨆_{N ≥ 0} 𝒟^ε_N carries the componentwise flow and the
measure ⊕_N λ_N/N! on symmetric functions. Locators: GST2013 lines 211–215 (symmetry (1.1.1)),
BGSS2023 lines 158–166 (grand canonical phase space) and 184–187 (exchangeability).

**T5 (transport of densities and the weak Liouville equation).** For W⁰ ∈ L¹(𝒟^ε_N) the transported
density W(t) = W⁰ ∘ T^ε_N(−t) is the unique weak solution of ∂_t W + V_N·∇_{X_N} W = 0 on 𝒟^ε_N
with the specular boundary condition W(t, Z_N) = W(t, Z_N') on the outgoing boundary pieces,
where Z_N' differs from Z_N by σ_ν on the colliding pair; ∫ W(t) φ dλ = ∫ W⁰ φ ∘ T^ε_N(t) dλ for
bounded measurable φ; and the L^p norms are conserved. Locators: BGSS2023 lines 145–157
(equations (1.1.3), (1.1.4)); GST2013 lines 911–918 (equation (4.2.1) and boundary condition) and
941–958 (weak formulation (4.3.1)). Uniqueness of weak solutions is stated for the class in which
the design can prove it from the flow; the design records the class.

**T6 (marginals).** For a symmetric density W_N on 𝒟^ε_N the s-th marginal W^{(s)}_N on 𝒟^ε_s is
obtained by integrating out N − s particles over 𝒟^ε_N; it is symmetric, satisfies the consistency
relation W^{(s)} = ∫ W^{(s+1)} dz_{s+1}, and inherits the specular boundary condition. For the grand
canonical measure the rescaled n-particle correlation function F^ε_n is the series of BGSS2023
(1.1.10), and the expectation of a sum over n-tuples of distinct labels is μ_ε^n ∫ F^ε_n h_n.
Locators: GST2013 lines 919–940 (equations (4.2.2), (4.2.3)); BGSS2023 lines 218–237 ((1.1.9) and
its inverse) and 267–288 ((1.1.10), (1.1.11)).

**T7 (equilibrium measures).** The canonical measure on 𝒟^ε_N with density proportional to
exp(−β|V_N|²/2) 1_{𝒟^ε_N}, and the grand canonical measure on 𝒟^ε whose N-th component is
(μ_ε^N / (N! Z_ε)) ∏_i f⁰(z_i) 1_{𝒟^ε_N} for a one-particle profile f⁰ with the Gaussian bound of
BGSS2023 (1.1.5), have finite normalisation (on the torus the partition function Z_ε is a finite
sum, since 𝒟^ε_N is empty for large N; on ℝ^d a finite-volume restriction or a confining profile is
needed and the design states which), and are invariant under the hard sphere flow when f⁰ depends
on the velocity only through |v|; for general f⁰ the grand canonical measure is the initial datum
and is transported by T5. Locators: BGSS2023 lines 161–181 ((1.1.5), (1.1.6) and Z_ε). The
Maxwellian normalisation uses Mathlib's Gaussian integrals and `gaussianReal`; the Poisson weights
μ^N/N! connect to Mathlib's `poissonMeasure` and to PointProcesses' hard-core density (its Layer 5
hard-core example is exactly the position part of this measure at fixed velocity profile).

**T8 (Boltzmann–Grad limit; sorry'd headline).** With μ_ε = ε^{−(d−1)}, the empirical measure
π^ε_t = μ_ε^{−1} Σ_i δ_{z_i(t)} on X × ℝ^d, and the hard sphere Boltzmann equation
∂_t f + v·∇_x f = ∫_{ℝ^d × 𝕊^{d−1}} ((w − v)·ω)_+ (f(v')f(w') − f(v)f(w)) dω dw with (v', w') = σ_ω(v, w):
for data distributed by the grand canonical measure of T7 with f⁰ satisfying (1.1.5), there is
T₀ > 0 depending only on the constants of (1.1.5) such that on [0, T₀] the rescaled one-particle
correlation function F^ε_1(t) converges uniformly on compact sets to the solution f(t) of the
Boltzmann equation with datum f⁰, each F^ε_n(t) converges almost everywhere to f(t)^{⊗n}, and for
every bounded continuous h the random variable π^ε_t(h) converges in probability to ∫ f(t) h.
Locators: BGSS2023 lines 291–321 (equations (1.2.1)–(1.2.3), Theorem 1), 324–349 ((1.2.4)–(1.2.6)
and Corollary 1.2.1); GST2013 lines 668–674 (Theorem 4) and 2069–2080 (Theorem 8); Lanford1975
(uncertified) for the original. The roadmap states this theorem and proves the reduction from the
correlation-function convergence to the convergence in probability of π^ε_t(h) (the variance
computation of BGSS2023 lines 352–371, which uses only T6); the convergence of F^ε_n is the
consumers' theorem and stays `sorry` in `Suggested.lean`. Existence and uniqueness of the solution
f on [0, T₀] is part of the sorry'd statement (GST2013 Theorem 7 and §2.3), not a hypothesis the
roadmap discharges.

**Checks.** The two-particle case: for N = 2 the null set is the set of grazing data and the flow is
explicit. The torus of side 1 with Nε^{d−1} bounded forces N ε^d ≤ C, so 𝒟^ε_N is empty for N large
and Z_ε is a finite sum. The scattering map fixes v = w. Time reversal of a trajectory is a
trajectory. A constant density is transported to itself.

## Suppliers

- Mathlib (pinned): `UnitAddTorus` with its normed group structure and Haar probability measure
  (`Mathlib/Topology/Instances/AddCircle/Real.lean`, `Mathlib/Analysis/Normed/Group/AddCircle.lean`,
  `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean`, `Mathlib/Analysis/Fourier/AddCircleMulti.lean`
  for the measure-preserving identification with a fundamental cell); `MeasureTheory.MeasurePreserving`;
  `Measure.toSphere` and `homeomorphUnitSphereProd` for polar integration over 𝕊^{d−1}
  (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`); `Flow` (`Mathlib/Dynamics/Flow.lean`) as the
  shape of the everywhere-defined part; `gaussianReal`, `poissonMeasure`; the ODE uniqueness theorems
  (`Mathlib/Analysis/ODE/ExistUnique.lean`) for the free-transport pieces.
- Tau Ceti (pinned): `TauCeti.flowOfLipschitz` and the `Dynamics/Flow` files for the comparison of
  the free flow with a globally Lipschitz flow; `TauCeti.Probability.Process.EmpiricalMeasure`
  (uniform empirical measure of a finite population, to be rescaled by μ_ε rather than N);
  `TauCeti.Probability.Distributions.Poisson` and `Gaussian`.
- HamiltonianSystems (PR #480, open, other author): Layer 2, Liouville's theorem for smooth
  Hamiltonian flows on a vector space and the comparison with `SymplecticForm.hamiltonianFlow`
  (`TauCetiRoadmap/HamiltonianSystems/README.md`, Layer 2). Consumed for the free-transport pieces
  between collisions (H = |V_N|²/2); the hard sphere flow itself is not smooth and is owned here.
- IncompressibleFlows (PR #237, open, other author): Layer 3, items 1–5 (Liouville's formula,
  volume-preserving flow slices on the unit torus, Koopman operators on L^p for a measure-preserving
  flow, transport ∂_t ρ + b·∇ρ = 0 as inverse-flow pullback with its sign convention)
  (`TauCetiRoadmap/IncompressibleFlows/README.md`, Layer 3). Consumed for the Koopman group of the
  hard sphere flow and the sign convention of T5; the specular boundary condition is owned here.
- PointProcesses (PR #417, open, other author): Layer 4 (Poisson random measures, `poissonLaw`) and
  Layer 5 (`HasPoissonDensity`, hereditary densities, the hard-core density example)
  (`TauCetiRoadmap/PointProcesses/README.md`, Layers 4–5). Consumed for the grand canonical measure
  of T7 read as a finite point process with a Poisson density, and for its Janossy measures.
- StandardDistributions (on main): Layer 1 (Poisson and Gaussian moments, mgf), Layer 5
  (multivariate Gaussian) (`TauCetiRoadmap/StandardDistributions/README.md`). Consumed for the
  Maxwellian profile and the Poisson weights.
- OptimalTransport (on main): only if the design wants weak convergence of empirical measures
  through its narrow-topology API; otherwise Mathlib's `ProbabilityMeasure` topology suffices.

None of these is in `merge-order/ORDER.txt` (the order lists this author's roadmaps); the three
open pull requests are other authors' and may be consumed at their heads. The new roadmap is
inserted at the end of the order, after StandardDistributions on main; it has no supplier in the
order.

## Consumers

- A roadmap on the BBGKY hierarchy and Lanford's theorem (GST2013 Ch. 5–7 and Part IV), which
  discharges the `sorry` of T8.
- A roadmap on the fluctuating Boltzmann equation and large deviations (BGSS2023 Theorems 2–3),
  which builds the fluctuation field ζ^ε_t from π^ε_t and the grand canonical measure of T7.
- A roadmap on long-time derivations (DengHaniMa2024 §1.1, Definition 1.1 at line 140, Theorem 1 at
  line 291, the grand canonical ensemble of its Definition 1.3),
  which reuses the dynamics of T2–T4 on ℝ^d with the modified dynamics of its §3–4.
- The Cauchy problem for the Boltzmann equation (GST2013 §2.3) and the H theorem (GST2013 §2.2),
  which consume the collision operator and kernel of T8.
- Alexander's infinite system (Alexander1976) and short-range potentials (GST2013 Part III), which
  reuse T1–T3 as the two-body building block.
- MathematicalBilliards (TARGET #6012, open target) shares no object with this roadmap (a single
  point particle in a convex planar table versus N spheres on a torus), but a later roadmap on
  dispersing billiards and the Sinai–Chernov reduction of two hard discs to a billiard would
  consume both.

## Sources

Manifest: `packages/HardSphereDynamicsAndKineticLimits/sources.toml`.

- GST2013 (certified, arXiv:1208.5753v2, open repository): I. Gallagher, L. Saint-Raymond,
  B. Texier, *From Newton to Boltzmann: hard spheres and short-range potentials*, Zurich Lectures in
  Advanced Mathematics, EMS 2013. Used: §1.1 (lines 180–221), §1.3 (lines 323–368), §3.1 (lines
  662–716, Theorems 4–5), §4.1 (lines 832–910, Proposition 4.1.1, Lemma 4.1.1), §4.2–4.4 (lines
  911–1230), Theorem 8 (lines 2069–2085). The arXiv v2 numbering agrees with the book's chapter
  and theorem numbering as cited in BGSS2023 (reference [28] there); page numbers differ.
- BGSS2023 (certified, arXiv:2008.10403v2, open repository): T. Bodineau, I. Gallagher,
  L. Saint-Raymond, S. Simonella, *Statistical dynamics of a hard sphere gas: fluctuating Boltzmann
  equation and large deviations*, Ann. of Math. 198 (2023). Used: §1.1 (lines 118–288, equations
  (1.1.1)–(1.1.11)), §1.2 (lines 291–371, Theorem 1, Corollary 1.2.1). The arXiv v2 equation
  numbering is the one cited in the issue form; the design checks it against the published version
  if it can be read.
- DengHaniMa2024 (certified, arXiv:2408.07818v3, open repository): Y. Deng, Z. Hani, X. Ma, *Long
  time derivation of the Boltzmann equation from hard sphere dynamics*. Used: §1.1 (lines 134–175,
  Definition 1.1; lines 246–257, the scaling; line 291, Theorem 1) for the path-based definition of
  the dynamics, its continuity convention, and the long-time statement the consumers will prove.
- Alexander1976 (uncertified): R. K. Alexander, *Time evolution for infinitely many hard spheres*,
  Comm. Math. Phys. 49 (1976), 217–232, DOI 10.1007/BF01608728. Open on Project Euclid, but the
  sources service received a bot-protection page from projecteuclid.org on two attempts; cited by
  locator. Not needed for the finite-N theorem, which GST2013 Proposition 4.1.1 proves in full.
- Lanford1975 (uncertified, paywalled): O. E. Lanford III, *Time evolution of large classical
  systems*, Lecture Notes in Phys. 38, Springer 1975, 1–111, DOI 10.1007/3-540-07171-7_1; cited
  for Proposition 4.3 (the null set of pathological data, as GST2013 line 855 attributes it) and
  for the original theorem of T8.
- CIP1994 (uncertified, paywalled): C. Cercignani, R. Illner, M. Pulvirenti, *The Mathematical
  Theory of Dilute Gases*, Springer 1994, Ch. 2 and Ch. 4; cited by locator for background only.
- Spohn1991 (uncertified, paywalled): H. Spohn, *Large Scale Dynamics of Interacting Particles*,
  Springer 1991, Part I; background only.
- Uchiyama1988 (uncertified): K. Uchiyama, Hiroshima Math. J. 18 (1988), 245–297, DOI
  10.32917/hmj/1206129724; Project Euclid refused the service's request; secondary exposition of
  Lanford's theorem, background only.
- AlexanderThesis1975 (uncertified): R. K. Alexander, *The infinite hard sphere system*, PhD thesis,
  Berkeley 1975; an eScholarship copy exists but answered HTTP 403 to the service; not needed.

No `needs-references.toml` request is left open: every text the design needs is certified, and
the uncertified ones are cited by locator as settled.

## Risks

- **Almost-everywhere flows have no library shape.** Mathlib's `Flow` and Tau Ceti's flows are
  everywhere defined and continuous. T3–T4 need a flow defined on a full-measure invariant set with
  the group law almost everywhere, and Koopman operators built from it. IncompressibleFlows Layer 3
  assumes a continuous measure-preserving flow; the design will have to state its own structure
  (a measurable map on a full-measure set with a.e. group law) and prove the Koopman properties
  for it, or restrict to the invariant full-measure set as a measurable space. This is the main
  design decision and the main cost.
- **The measure estimate of Lemma 4.1.1 on the torus.** The proof in GST2013 is on ℝ^d with balls;
  on the torus the set of data with one particle meeting two others within time δ must be bounded
  with the torus distance, where the straight segment x + tv may wrap. For ε small against the
  torus and δ < ε/2 the local geometry is Euclidean; the design should prove the estimate on the
  uniform carrier or do the torus case separately.
- **Uniqueness of weak solutions in T5** is not in GST2013 or BGSS2023 beyond the transport
  identity; the design should state T5 as transport plus the weak equation and keep uniqueness for
  a class it can prove (for instance bounded densities, by the Koopman group), or drop it.
- **Grand canonical measure on ℝ^d.** BGSS2023 (1.1.6) is normalisable on the torus because
  𝒟^ε_N is empty for large N; on ℝ^d the design needs a finite-volume or confining-profile variant.
  The filed statement is the torus one and is the primary target.
- **Suppliers are open pull requests of other authors.** HamiltonianSystems (#480),
  IncompressibleFlows (#237) and PointProcesses (#417) may change or be withdrawn; everything
  consumed from them is small (Liouville's formula, Koopman operators, Poisson densities) and the
  design should name the exact sections and provide the own-words fallback statements.
- **Headline theorem proved elsewhere.** T8 stays `sorry` by design; `Suggested.lean` must state
  it with the Boltzmann solution as an existential or as data supplied by hypothesis, without
  sorry'd data, which needs care (state existence-and-uniqueness of f on [0, T₀] inside the
  theorem).
- **Sources behind bot protection.** Alexander1976 and Uchiyama1988 are open but unreadable by
  the service; the design does not depend on them.
