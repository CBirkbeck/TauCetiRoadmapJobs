Verdict: design
Name: HyperbolicDynamicsAndThermodynamicFormalism
Base: none
Owner: none

## Scope

The roadmap builds uniformly hyperbolic dynamics on compact manifolds and the thermodynamic
formalism of continuous maps and flows on compact metric spaces, up to the Bowen–Ruelle theorem on
unique equilibrium states of Hölder potentials for transitive Anosov flows and diffeomorphisms.
Nothing in the library, on main, at the open heads or on the board owns any of this (see the
report): the library has Bowen's covering and net entropies, flows, ergodicity, Krylov–Bogolyubov
and the flow of a vector field; three roadmaps own the measure-entropy foundations that this one
imports; no roadmap defines a hyperbolic set, a pressure or an equilibrium state.

**Carriers.** Topological dynamics lives on a compact metric space X with a continuous map
T : X → X or a continuous flow g : ℝ × X → X (Mathlib's `Flow ℝ X`). Smooth dynamics lives on a
compact connected smooth manifold M without boundary, with a C^r flow (r ≥ 1) and its generating
vector field X, or a C^r diffeomorphism f. Riemannian metrics are the smooth metrics of
DifferentialGeometry Layer 12 and Mathlib's `IsContMDiffRiemannianBundle`; the independence
statements below are proved against an arbitrary such metric, with the compact-manifold
equivalence of two metrics as the tool. Invariant probability measures are Mathlib Borel
probability measures with `MeasurePreserving`, their weak-* topology is Mathlib's
`ProbabilityMeasure` topology, and ergodicity is Mathlib's `Ergodic`.

**Owned.**

1. *Hyperbolic sets and Anosov systems.* Hyperbolic sets of a C^r diffeomorphism and of a C^r
   flow without fixed points (continuous invariant splitting TM|Λ = E^s ⊕ E^u, respectively
   E^s ⊕ ℝX ⊕ E^u, with uniform contraction and expansion rates C e^{−κt}); Anosov
   diffeomorphisms and Anosov flows as the case Λ = M. Theorems: independence of the Riemannian
   metric; uniqueness of the splitting through the characterisation of E^s and E^u by asymptotic
   contraction forwards and backwards; automatic continuity of the subbundles and local constancy
   of their ranks; existence of an adapted metric with C = 1 (BowenRuelle1975 line 19 records the
   adapted-metric reduction for flows); nontriviality of E^s and E^u on a manifold of dimension at
   least 2 by a volume argument; the time-reversed flow and the inverse diffeomorphism are Anosov
   with E^s and E^u exchanged. Transitivity and topological mixing are hypotheses, not theorems,
   stated with Mathlib's `IsTopologicallyTransitive` and a mixing predicate the roadmap defines.
   Examples: hyperbolic toral automorphisms of 𝕋^n (a matrix in GL_n(ℤ) with no eigenvalue of
   modulus one); suspensions of Anosov diffeomorphisms with a positive roof function; the geodesic
   flow of a closed Riemannian manifold of negative sectional curvature (Anosov's theorem, stated
   with proof route through Jacobi fields, see Risks).
2. *Entropy.* Topological entropy of a continuous map of a compact metric space through
   (n, ε)-separated sets, (n, ε)-spanning sets and open covers, with the equality of the three
   (Mathlib's `Dynamics.coverEntropy` is the spanning-set form, `Dynamics.netEntropyEntourage` the
   separated-set form, and `Dynamics.coverEntropy_eq_iSup_netEntropyEntourage` their agreement;
   the open-cover form and its agreement with these are new); topological entropy of a
   flow as the entropy of the time-one map and its invariance under reparametrisation-free time
   rescaling h_top(g^t) = |t| h_top(g^1). Measure-theoretic entropy is *imported* (see Suppliers)
   and only its flow version h_μ(g) := h_μ(g^1), with Abramov's formula h_μ(g^t) = |t| h_μ(g^1),
   is new. The variational principle h_top(T) = sup_μ h_μ(T) over invariant Borel probability
   measures, both inequalities (the inequality h_μ ≤ h_top is already ArithmeticDynamics §2.7's
   and is imported); its restriction to ergodic measures through the imported ergodic
   decomposition with entropy integration; affinity of μ ↦ h_μ(T) on the invariant measures.
3. *Pressure.* The pressure P_T(φ) of a continuous potential through separated or spanning sets
   weighted by Birkhoff sums, its basic properties (monotone, convex, Lipschitz in φ with constant
   1, P(φ + c) = P(φ) + c, invariance under coboundaries φ ↦ φ + ψ∘T − ψ), the variational
   principle for pressure P_T(φ) = sup_μ (h_μ(T) + ∫φ dμ), and the pressure of a flow P_g(F) over
   flow-invariant measures with the identity P_g(F) = P_{g^1}(F_1) for F_1(x) = ∫_0^1 F(g^s x) ds
   (BowenRuelle1975 lines 182–199; TsujiiZhang2023 line 485 takes the variational form as the
   definition).
4. *Equilibrium states and measures of maximal entropy.* Equilibrium states of a potential for
   maps and for flows; measures of maximal entropy as equilibrium states of the zero potential;
   convexity of the sets of equilibrium states and of measures of maximal entropy and the
   characterisation of their extreme points as the ergodic ones; the ergodic components of an
   equilibrium state are equilibrium states. Existence of equilibrium states whenever μ ↦ h_μ(T)
   is upper semicontinuous; upper semicontinuity for expansive maps (and expansive flows, with
   Bowen–Walters expansivity, BowenWalters1972); Newhouse's theorem that C^∞ maps of compact
   manifolds have upper semicontinuous entropy, *stated as an input* with `sorry` and not proved
   (Newhouse1989, Theorem 1); nonexistence examples in finite smoothness, recorded as Checks or
   as a sorry'd statement with its source rather than proved. Sign and inverse-temperature
   conventions: the roadmap fixes P(φ) with the potential added, so the "inverse temperature"
   form is P(−βH), and records the dictionary once.
5. *The summit.* The Bowen–Ruelle theorem. For a transitive C² Anosov flow g on a compact
   manifold and a Hölder continuous F : M → ℝ there is exactly one equilibrium state ν_{g,F}; it
   is ergodic and positive on nonempty open sets, and ν_{g,F} = ν_{g,F'} when F − F' is a constant
   plus the derivative along the flow of a C¹ function (BowenRuelle1975 lines 213–219 for the
   uniqueness, ergodicity and full support on a basic set, with the flow-coboundary invariance
   as the "constant plus ψ∘g^t − ψ" statement). Likewise for a transitive C² Anosov
   diffeomorphism and a Hölder potential (Bowen1975, Chapter 4). The two named cases: the
   Bowen–Margulis measure (F = 0, the unique measure of maximal entropy) and the SRB measure, the
   equilibrium state of the geometric potential φ^u = −(d/dt)|_{t=0} log Jac(Dg^t|E^u), with the
   characterisation of the SRB measure by Lebesgue-almost-every time averages on a C² Anosov flow
   (BowenRuelle1975 lines 421–425, Theorem 5.1, and line 616, Corollary 5.7).

**Route material the roadmap also owns.** Whichever route the design takes to the summit, the
general theory it passes through is owned here and stated generally: expansivity of Anosov
diffeomorphisms and flows; shadowing and the specification property of transitive hyperbolic
sets; Bowen's criterion (expansive plus specification plus the Bowen regularity condition on the
potential gives a unique equilibrium state, which is ergodic and fully supported), or
alternatively Markov partitions, subshifts of finite type (Mathlib's `Subshift`), the
Ruelle–Perron–Frobenius theorem and Gibbs measures, as in Bowen1975, Chapters 1–3 and
BowenRuelle1975 lines 110–160 (symbolic dynamics for flows). The design chooses one route and
says why; it must not special-case the examples.

**Not owned.** Nonuniform hyperbolicity (Pesin theory, Lyapunov exponents, the Katok entropy
formula); the Buzzi–Crovisier–Sarig theorems themselves (consumers); exponential mixing and
Dolgopyat estimates (TsujiiZhang2023 is cited only for the statement of the pressure and the
equilibrium measure); stable and unstable foliations beyond what the chosen route needs; the
Livšic theorem; structural stability; the construction of the measure-theoretic entropy
(imported); the Birkhoff ergodic theorem (imported); the ergodic theory of homogeneous flows
(GeometryOfNumbersAndQuadraticArithmetic §4.2); quantum pressure and the lattice variational
principle (OperatorAlgebraDynamics §D9).

**Generality.** Everything is stated at the generality of the sources: compact metric spaces for
the topological theory, with no manifold structure; compact manifolds of any dimension for the
smooth theory; hyperbolic sets (basic sets, attractors) where Bowen–Ruelle prove their results,
with the Anosov case Λ = M as a specialisation. The filed wording is already general; the only
restriction it makes, C² for the summit, is the regularity the sources prove and stays as the
hypothesis.

## Final targets

Each is a `Suggested.lean` headline, stated with `sorry` against the pinned Mathlib and Tau Ceti,
with its locator.

1. **Uniqueness of the hyperbolic splitting and metric independence.** For a C^r flow (r ≥ 1)
   without fixed points on a compact manifold and a closed invariant set Λ, the continuous
   invariant splitting with uniform rates, when it exists, is unique: E^s is the set of vectors
   whose forward images decay exponentially and E^u the set whose backward images do; and the
   property of being hyperbolic, with the splitting, does not depend on the Riemannian metric
   (constants may change). Same for diffeomorphisms. Locators: KatokHasselblatt1995, §6.4 and
   §17.4; FH2019, Part II.
2. **Adapted metric.** Every hyperbolic set admits a Riemannian metric on a neighbourhood for
   which the rates hold with C = 1 (BowenRuelle1975 line 19; KatokHasselblatt1995, §6.4 adapted
   metric). Check: the geodesic flow of a surface of constant curvature −1 is Anosov for the
   Sasaki metric with C = 1 and κ = 1.
3. **Examples.** A hyperbolic toral automorphism is an Anosov diffeomorphism; the suspension of an
   Anosov diffeomorphism under a positive C^r roof function is an Anosov flow; the geodesic flow of
   a closed Riemannian manifold of negative sectional curvature is an Anosov flow on the unit
   tangent bundle (Anosov 1967, Chapter 1, a work the design must still record, see Sources;
   FH2019, Part II; KatokHasselblatt1995, Chapter 17). Check: the cat map
   on 𝕋², with E^s and E^u the eigenlines of (2 1; 1 1) and rates the eigenvalues.
4. **Variational principle.** For a continuous T on a compact metric space X,
   h_top(T) = sup_μ h_μ(T) over T-invariant Borel probability measures, and the supremum may be
   taken over ergodic measures (Walters1982, Theorem 8.6 and Corollary 8.6.1; Misiurewicz1976
   lines 119–121 for the statement with a potential and lines 125–126 for the two halves of the
   proof; the inequality h_μ ≤ h_top is ArithmeticDynamics §2.7 and is imported). Check: the full shift on k symbols
   has h_top = log k, attained by the uniform Bernoulli measure.
5. **Variational principle for pressure.** For continuous T and φ : X → ℝ,
   P_T(φ) = sup_μ (h_μ(T) + ∫φ dμ), and the separated-set, spanning-set and open-cover
   definitions of P_T(φ) agree (Walters1982, Theorem 9.10 and §9.1; Misiurewicz1976 lines
   96–102 for the pressure by limsup in n and limit in the cover, lines 119–121 for the
   variational principle, proved there for ℤ^N_+ actions, of which ℕ is the case N = 1). For a
   continuous flow g,
   P_g(F) = P_{g^1}(F_1) = sup over g-invariant μ of (h_μ(g^1) + ∫F dμ) (BowenRuelle1975 lines
   190–199). Check: P_T(0) = h_top(T); P_T(c) = h_top(T) + c.
6. **Existence of equilibrium states.** If μ ↦ h_μ(T) is upper semicontinuous on the
   T-invariant probability measures, every continuous potential has an equilibrium state;
   expansive maps of compact metric spaces have upper semicontinuous entropy (Walters1982,
   Theorem 8.2 and Theorem 9.13(iv)); the set of equilibrium states is a nonempty compact convex
   set whose extreme points are its ergodic members (Walters1982, Theorem 9.13). The statement
   of Newhouse's theorem (C^∞ maps of compact manifolds have upper semicontinuous entropy,
   Newhouse1989, Theorem 1) is a sorry'd headline whose proof is out of scope, and the roadmap
   says so. Check: a finite-smoothness example of a map with no measure of maximal entropy,
   recorded with its source (Misiurewicz's C^r diffeomorphism without a measure of maximal
   entropy, Bull. Acad. Polon. Sci. 21 (1973), a work the design must settle; Walters1982,
   Chapter 8, records the remark).
7. **Abramov's formula and time-t maps.** For a continuous flow g and an invariant μ,
   h_μ(g^t) = |t| h_μ(g^1) and h_top(g^t) = |t| h_top(g^1); equilibrium states of F for g are
   equilibrium states of F_t for g^t when t > 0 (BowenRuelle1975 lines 225–233 for the use;
   the design settles the primary locator for Abramov's theorem, see Risks).
8. **Bowen–Ruelle theorem for flows.** Let g be a transitive C² Anosov flow on a compact manifold
   and F Hölder continuous. There is exactly one equilibrium state ν_{g,F}; it is ergodic and
   gives positive mass to every nonempty open set; and ν_{g,F} = ν_{g,F'} whenever
   F' = F + c + (d/dt)|_{t=0} ψ∘g^t for a constant c and a C¹ function ψ (BowenRuelle1975
   lines 213–219, Proposition 3.1 (a)–(c), specialised from a basic set to Λ = M;
   TsujiiZhang2023 lines 485–495, Definition 3.5, for the statement in the consumers' form).
9. **Bowen's theorem for diffeomorphisms.** Same statement for a transitive C² Anosov
   diffeomorphism and a Hölder potential, with F' = F + c + ψ∘f − ψ (Bowen1975, Chapter 4,
   Theorem 4.1 of the second edition's numbering; the design fixes the locator).
10. **Bowen–Margulis and SRB.** For a transitive C² Anosov flow: the measure of maximal entropy
    is unique (F = 0); the equilibrium state of the geometric potential is the unique invariant
    measure μ⁺ such that, for Lebesgue-almost every x in M, the time averages of every continuous
    function along the forward orbit of x converge to its μ⁺-integral (BowenRuelle1975 lines
    421–425, Theorem 5.1 with Λ = M an attractor, and line 616, Corollary 5.7). Check: for the
    geodesic flow of a hyperbolic surface the two measures coincide with the Liouville measure.

## Suppliers

All are on main or earlier in the merge order; sections are those whose statements this roadmap
consumes by name.

- **Mathlib (pin).** `Dynamics.coverEntropy`, `Dynamics.coverEntropyInf`, `Dynamics.coverMincard`,
  `Dynamics.netMaxcard`, `Dynamics.netEntropyEntourage`,
  `Dynamics.coverEntropy_eq_iSup_netEntropyEntourage` and the dynamical entourages (topological
  entropy by spanning and separated sets, EReal-valued, on uniform spaces);
  `Flow`, `Flow.IsInvariant`, `Flow.fromIter`, `Flow.restrict`; `Ergodic`, `MeasurePreserving`,
  `Ergodic.of_mem_extremePoints_measure_univ_eq` (ergodic measures are the extreme points);
  `empiricalMeasure` and the Krylov–Bogolyubov theorem; `birkhoffAverage`;
  `MeasureTheory.ProbabilityMeasure` with its weak-* topology and Prokhorov; `Subshift` and
  `cylinder` in `Dynamics.SymbolicDynamics`; `AddAction.IsTopologicallyTransitive`,
  `AddAction.IsMinimal`; `HolderWith`; `IsContMDiffRiemannianBundle` and `RiemannianMetric`;
  `UpperSemicontinuous` (`Topology/Semicontinuity/Defs.lean`).
- **Tau Ceti (pin).** `Geometry/Manifold/IntegralCurve/{Maximal,Flow,SmoothFlow}` (the maximal
  flow of a C^r vector field, its openness, joint smoothness, group law and completeness on
  compact manifolds); `Geometry/Manifold/Riemannian/Geodesic/Flow.lean` (the maximal geodesic
  flow of the geodesic spray on the tangent bundle); `Geometry/Manifold/Riemannian/VolumeDensity/{Measure,Volume}`
  (the Riemannian volume measure, for the SRB statement and the nontriviality-by-volume lemma);
  `Dynamics/Flow/{OfLipschitz,Conjugacy,Lyapunov}`.
- **DifferentialGeometry (main).** Layer 3 (flows: `flowOf`, `flowDomain`, `toFlow : Flow ℝ M`,
  naturality and conjugate flows), Layer 2 (orientations), Layer 12 (Riemannian metrics and the
  Laplace–Beltrami operator). The generating vector field of a C^r flow and the Lie-derivative
  calculus come from here.
- **RiemannianGeometry (main).** R1 (curvature tensor, sectional curvature, normal-coordinate
  jets), R2 (Jacobi fields and the derivative of the exponential map), R4 (Cartan–Hadamard,
  complete manifolds, space forms) for the geodesic-flow example; R4's unit tangent sphere
  bundle and cut-time continuity.
- **GeometryOfNumbersAndQuadraticArithmetic §4.2** (PR #851, merge order line 67): the
  partition-entropy API, `finitePartitionEntropy`, `countablePartitionEntropy`,
  `conditionalPartitionEntropy`, `partitionEntropyRate` and `measureEntropy` of a
  measure-preserving map. The roadmap's h_μ(T) is this `measureEntropy`, by name.
- **ProbabilisticAndMetricNumberTheory §§4.1–4.3** (PR #1421, merge order line 256):
  `birkhoff_pointwise` and `birkhoff_pointwise_ergodic`, the pointwise ergodic theorem with its
  conditional-expectation limit.
- **ArithmeticDynamics §§2.6–2.7** (PR #1335, merge order line 318): the comparison of
  partition entropy with Shannon entropy, h_μ(T) = sup over finite partitions, conditional
  entropy against a σ-algebra and its chain rule, the Shannon–McMillan–Breiman theorem, the
  ergodic decomposition kernel with h_μ = ∫ h_{μ_x} dμ, and the inequality h_μ(T) ≤
  `Dynamics.coverEntropy T Set.univ` on compact metric spaces. This roadmap imports these as the
  easy half of the variational principle and the ergodic reduction, and must not re-plan them.
  Note the direction of supply: ArithmeticDynamics is earlier in the merge order, so the import
  is legal; HyperbolicDynamicsAndThermodynamicFormalism is inserted after line 318.

## Consumers

- The Buzzi–Crovisier–Sarig theorems on surface diffeomorphisms (BCS2022 lines 61–64, Main
  Theorem; lines 195–213, Corollaries 1.4–1.6): finitely many ergodic measures of maximal
  entropy for C^∞ surface diffeomorphisms with positive entropy, uniqueness under transitivity,
  Bernoulli property under mixing, and the equilibrium-measure and SRB corollaries. They need the
  measure of maximal entropy, the pressure and equilibrium measures, the geometric potential and
  Newhouse's theorem exactly as defined here; a future roadmap on nonuniform hyperbolicity would
  state them.
- Exponential mixing of three-dimensional Anosov flows (TsujiiZhang2023 lines 123–127, Theorem
  1.1): needs transitive C^∞ Anosov flows, topological mixing, Hölder potentials and the unique
  equilibrium measure ν_{g,F}.
- ArithmeticDynamicsPartII and any roadmap comparing Lyubich's measure with a measure of maximal
  entropy in the general sense; GeometricTopology (PR #903) and TaubesGromov (main), which name
  Anosov torus bundles and the hyperbolic toral automorphism (TaubesGromov §TG11.2's Anosov test
  matrix) and would import the definitions; MathematicalBilliards (TARGET #6012), whose dispersing
  billiards, if ever filed, would consume hyperbolic sets and equilibrium states; a future
  roadmap on Markov partitions and zeta functions of hyperbolic flows.

## Sources

Manifest keys as recorded in `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml`.

- **BowenRuelle1975** (certified, author page: Ruelle's IHES publication list). R. Bowen and D.
  Ruelle, *The ergodic theory of Axiom A flows*, Invent. Math. 29 (1975), 181–202. Hyperbolic
  sets for flows and the adapted metric (lines 10–24); basic sets and attractors (lines 25–34);
  pressure for maps and flows, P(F, φ) = P(f¹, Φ) and the variational form (lines 160–201);
  unique equilibrium states on basic sets, ergodic and fully supported (lines 213–219,
  Proposition 3.1); the use of Abramov's formula (lines 225–233); SRB time averages (lines
  421–425, Theorem 5.1); continuity in the flow (lines 524–527, Proposition 5.4); attractors
  and P(φ^u) = 0 (lines 587–591, Theorem 5.6); Axiom A consequences (lines 616–619, Corollary
  5.7).
- **Bowen1975** (uncertified, Springer paywall). R. Bowen, *Equilibrium States and the Ergodic
  Theory of Anosov Diffeomorphisms*, LNM 470, 2nd revised ed. (J.-R. Chazottes, ed.), 2008.
  Chapters 1–3 (Gibbs measures on subshifts of finite type, Ruelle's operator, Markov partitions),
  Chapter 4 (equilibrium states of Anosov diffeomorphisms, uniqueness for Hölder potentials, the
  SRB measure). Cited by locator only.
- **Walters1982** (uncertified, Springer paywall). P. Walters, *An Introduction to Ergodic
  Theory*, GTM 79. Chapter 4 (entropy), Chapter 7 (topological entropy, the three definitions and
  their equality), Theorem 8.6 (variational principle), Chapter 9: §9.1 (pressure), Theorem 9.10
  (variational principle for pressure), Theorem 9.13 (equilibrium states, convexity, ergodic
  extreme points, existence under upper semicontinuity), §8.3 for the nonexistence remarks.
- **KatokHasselblatt1995** (uncertified, Cambridge paywall). A. Katok and B. Hasselblatt,
  *Introduction to the Modern Theory of Dynamical Systems*. §6.4 (hyperbolic sets, adapted
  metrics), Chapter 17 (hyperbolic flows: §17.4 Anosov flows as the issue form locates it, and
  the geodesic flows of negatively curved manifolds), Chapter 4
  (entropy, the variational principle), Chapter 20 (pressure and equilibrium states).
- **FH2019** (uncertified: EMS Press, subscription required on the landing page, not open
  access). T. Fisher and B. Hasselblatt, *Hyperbolic Flows*, EMS Zurich Lectures, 2019, Part II.
- **Newhouse1989** (uncertified, JSTOR paywall, no open copy found). S. E. Newhouse,
  *Continuity properties of entropy*, Ann. of Math. 129 (1989), 215–235, Theorem 1 (C^∞ maps
  have upper semicontinuous entropy). Stated as an input only.
- **BowenWalters1972** (uncertified, Elsevier paywall). R. Bowen and P. Walters, *Expansive
  one-parameter flows*, J. Differential Equations 12 (1972), 180–193: the definition of an
  expansive flow and the theorem that Anosov flows (hyperbolic sets of flows) are expansive.
- **BCS2022** (certified, arXiv:1811.02240v2; the Annals 195 (2022) version is paywalled and the
  design must check the numbering when it cites a published theorem). J. Buzzi, S. Crovisier and
  O. Sarig, *Measures of maximal entropy for surface diffeomorphisms*. Consumer statements:
  lines 45–55 (variational principle and Definition 1.1), 61–64 (Main Theorem), 195–213
  (Corollaries 1.4–1.6).
- **TsujiiZhang2023** (certified, arXiv:2006.04293v1; published as Ann. of Math. 197 (2023),
  no. 1, 65–158, the "second article" of the issue; the design must check the numbering against
  the published version). M. Tsujii and Z. Zhang, *Smooth mixing Anosov flows in dimension three
  are exponentially mixing*. Lines 106–127 (setting, ν_{g,F}, Theorem 1.1); lines 484–495
  (Definition 3.5: pressure and equilibrium measure in the variational form).
- **Misiurewicz1976** (certified, Numdam). M. Misiurewicz, *A short proof of the variational
  principle for a ℤ^N_+ action on a compact space*, Astérisque 40 (1976), 147–157. Pressure by
  open covers (lines 74–102), measure entropy by finite partitions (lines 103–118), the
  variational principle for pressure and its two-part proof (lines 119–126 and the following
  pages). The standard short route to Final targets 4 and 5, stated for ℤ^N_+ actions; the
  design specialises to N = 1 or keeps the generality.
- Works the design will have to settle itself, not yet in the manifest: D. V. Anosov, *Geodesic
  flows on closed Riemannian manifolds of negative curvature*, Trudy MIAN 90 (1967), 3–210
  (Math-Net.Ru record Mi tm2795 offers the open 23 MB scan of the Russian original; the sources
  service timed out on every attempt during triage, including on the record page, so the host was
  unreachable from the worker rather than closed; the AMS 1969 translation, Proc. Steklov Inst.
  Math. 90, is an alternative if held locally; needed only for the geodesic-flow example, which
  FH2019 and KatokHasselblatt1995 also state); L. M. Abramov, *On the
  entropy of a flow*, Dokl. Akad. Nauk SSSR 128 (1959), AMS Transl. 49 (1966) (Abramov's
  formula; Math-Net.Ru holds the Russian original); R. Bowen, *Periodic orbits for hyperbolic
  flows*, Amer. J. Math. 94 (1972) and *Symbolic dynamics for hyperbolic flows*, Amer. J. Math.
  95 (1973) (specification and Markov partitions for flows; JSTOR); R. Bowen, *Some systems
  with unique equilibrium states*, Math. Systems Theory 8 (1974) (the expansive-plus-specification
  criterion; Springer); E. Franco's Berkeley thesis (1974) and the Franks–Williams ideas, as
  BowenRuelle1975 line 240 and line 592 record, for alternative proofs.

## Risks

- **Two routes to the summit, both long.** Bowen–Ruelle prove uniqueness through symbolic
  dynamics: Markov partitions for hyperbolic flows (Bowen 1973) and unique equilibrium states for
  Hölder functions on subshifts of finite type with a suspension (BowenRuelle1975 lines 110–160
  and 204–235). The alternative is Bowen's 1974 criterion (expansivity, specification, Bowen
  regularity of Hölder potentials), which needs shadowing and specification for transitive
  hyperbolic sets and, for flows that are transitive but not mixing, a reduction to suspensions
  through Abramov's formula. Both routes need the stable manifold theorem for hyperbolic sets
  (local stable and unstable manifolds, their Hölder dependence), which no roadmap owns and which
  is far above the pinned library. The design must own a stable-manifold layer for hyperbolic
  sets of flows and diffeomorphisms, or import it from a roadmap filed first; it is the largest
  foundation gap. The design must state which route it takes and plan the whole route in general.
- **Measure-entropy supply is split across three roadmaps** (GeometryOfNumbersAndQuadraticArithmetic
  §4.2, ProbabilisticAndMetricNumberTheory §§4.1–4.3, ArithmeticDynamics §§2.6–2.7), all open
  pull requests. The design must consume their exact contracts by name and must not re-plan
  conditional entropy, Shannon–McMillan–Breiman or the ergodic decomposition. If any of them
  changes before merge, the import lines change with it.
- **Sources are mostly paywalled.** Of the standard texts only Bowen–Ruelle is certified (from
  Ruelle's own page); Walters, Katok–Hasselblatt, Fisher–Hasselblatt, Bowen's lecture notes,
  Newhouse and Bowen–Walters are uncertified and can be cited by locator only. The design will
  have to write every proof route in its own words from the certified texts and standard
  knowledge, and keep the uncertified locators as pointers. Anosov 1967 is open on Math-Net.Ru but
  the host was unreachable during triage; the design records it when it fetches its sources, and
  the geodesic-flow example rests on the uncertified texts' locators meanwhile.
- **Newhouse's theorem is an input, not a target.** The brief states it with `sorry`; the
  roadmap must say so plainly in `Suggested.lean` and the README, and any Check depending on it
  (existence of measures of maximal entropy for C^∞ surface diffeomorphisms) is conditional.
- **Geodesic-flow example.** Anosov's theorem needs Jacobi-field estimates on the unit tangent
  bundle with the Sasaki metric, consuming RiemannianGeometry R1, R2 and R4; the unit tangent
  bundle as a compact manifold and the Sasaki metric are not in the library and must be built or
  imported. The design may state this example as a sorry'd Check with its route if the cost is
  disproportionate, but must not drop the general Anosov theory to make room for it.
- **Mathlib's entropy is EReal-valued and entourage-based.** The open-cover form must be
  reconciled with `Dynamics.coverEntropy` and `Dynamics.netEntropyEntourage` on compact metric
  spaces; the pressure has no Mathlib counterpart and is built from scratch, with the
  same limsup-in-n, limit-in-ε shape so that φ = 0 recovers Mathlib's entropy definitionally or
  by a short lemma.
