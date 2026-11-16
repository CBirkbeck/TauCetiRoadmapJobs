# PKG-HyperbolicDynamicsAndThermodynamicFormalism

Deliverables written: `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`,
`packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`,
`packages/HyperbolicDynamicsAndThermodynamicFormalism/metadata.toml` (`topic = "math.DS"`, as the
one roadmap on main in dynamical systems). `sources.toml` was checked and needs no change: every
key the README cites is in it, every `cited_for` section is one where the key is cited (checked
mechanically, section by section), and no new source is cited. `design/plan.json` is unchanged: its
`gaps` list already holds the two gaps (`sphere-bundle-embedding`, `connection-map-jacobi-derivative`),
which the README now states in the TangentialBordism and RiemannianGeometry subsections of the
supplier contracts in the form `What <Supplier> must provide (gap:<slug>): …` (the design had them
under a separate "Required extensions" heading). No `needs-references.toml` was written: every
text the README cites is either read (certified) or settled as uncertified in the manifest.

The README is the accepted design's README written out: every target, Check and worked example is
kept; the changes are listed below. The accepted review (round 12) had no finding and no
non-blocking note; its one question for human reviewers (ClassicalErgodicTheory is an open pull
request by another author, not in the merge order) is unchanged by this package and is repeated
under "Ownership" below.

## Headline theorems

| Headline | README | Status |
|---|---|---|
| Upper semicontinuity of measure entropy for Bowen–Walters expansive flows | §3.1 | stated: `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` |
| Bowen's uniqueness criterion under weak specification, homeomorphisms (unique equilibrium state, ergodic, fully supported, Gibbs) | §5.2 | stated: `existsUnique_isEquilibriumState_of_hasWeakSpecification` |
| Bowen's criterion under weak specification, flows (unique, flow-ergodic, fully supported, lower Gibbs at every scale) | §5.3 | stated: `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` |
| Unique equilibrium states for transitive systems with hyperbolic local product structure, maps (with positive entropy unless finite) and flows | §6.8 | stated: `existsUnique_isEquilibriumState_of_hasHyperbolicLocalProductStructure`, `existsUnique_isFlowEquilibriumState_of_hasFlowHyperbolicLocalProductStructure` |
| The uniform Hadamard–Perron theorem (graphs (i)–(iii), uniqueness, invariant cones (iv)) | §8.1 | stated: `exists_isHadamardPerronFamily` |
| Local stable/unstable (strong and weak) manifolds of hyperbolic sets | §§8.2–8.3 | not statable at the pins: the plaques are embeddings of balls of the varying subspaces E^s_x depending continuously on x in the C¹ topology; Tau Ceti's weak Whitney topology (`ContMDiffMap.weakWhitneyTopology`) is for maps with a fixed source, and the charts adapted to the splitting that would fix the source are the theorem's own construction. Their consequence (next row) is stated. |
| Local product structure of locally maximal hyperbolic sets, diffeomorphisms and flows | §§8.4–8.5 | stated: `hasHyperbolicLocalProductStructure_of_isLocallyMaximal`, `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` |
| Geodesic flows of compact negatively curved manifolds are Anosov | §9.3 | not statable at the pins: no geodesic flow of the unit tangent sphere bundle as a `Flow ℝ` on Tau Ceti's sphere-bundle manifold (the corestriction theorem and the connection map are the two declared gaps) |
| Bowen's theorem for basic sets of C¹ diffeomorphisms (unique, ergodic, fully supported, Gibbs, coboundary invariance) | §10.2 | stated: `existsUnique_isEquilibriumState_of_isBasicSet` |
| The Bowen–Ruelle theorem for basic sets of C¹ flows (unique, ergodic, fully supported, lower Gibbs at every scale, flow coboundaries, time-t maps, rescaling) | §10.3 | stated: `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` |
| Bowen–Margulis and Bowen measures: uniqueness (the case F = 0 of §§10.2–10.3), positive entropy unless a single periodic orbit / finite, Haar measure for hyperbolic toral automorphisms | §10.4 | stated: `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet`, `isEquilibriumState_toralEndomorphism_zero_iff` |
| The SRB theorem for attractors of C² flows (μ⁺ the equilibrium state of the geometric potential; volume-a.e. point of the basin generic) and its transitive Anosov case (a.e. point of M generic; absolutely continuous invariant measures equal μ⁺) | §11.6 | stated: `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` |

Definitions in `Suggested.lean`, all with real bodies on native carriers: this roadmap's
`HasWeakSpecification`, `HasFlowWeakSpecification` (§2.2), `HasLowerGibbsProperty` (§5.1),
`HasHyperbolicLocalProductStructure`, `HasFlowHyperbolicLocalProductStructure` (§§6.1, 6.5),
`IsHyperbolicSet`, `flowGenerator`, `IsFlowHyperbolicSet` (§§7.1–7.2), `hadamardPerronBox`,
`hadamardPerronGraph`, `IsHadamardPerronFamily` (§8.1), `IsLocallyMaximal`, `IsFlowLocallyMaximal`
(§§8.4–8.5), `IsBasicSet`, `IsFlowBasicSet`, `IsFlowAttractor` (§10.1), `flowUnstableSubspace`,
`unstableJacobian`, `geometricPotential` (§11.1). Restated from suppliers, only to make the
headlines statable (the module docstring says so, following the pattern of ClassicalErgodicTheory's
own file): GeometryOfNumbersAndQuadraticArithmetic §4.2's `countablePartitionEntropy`,
`iteratedPartitionLabel`, `partitionEntropyRate`, `measureEntropy`, and ClassicalErgodicTheory's
`invariantProbabilities`, `flowInvariantProbabilities`, `pressureNetSum`, `topologicalPressure`,
`flowTopologicalPressure`, `IsEquilibriumState`, `IsFlowEquilibriumState`, `IsGibbsMeasure`,
`HasBowenProperty`, `IsExpansiveFlow`, `HasFlowBowenProperty`, `toralEndomorphism`, each with the
body of the supplier's text at its head (fully qualified names differ: the namespace is
`TauCetiRoadmap.HyperbolicDynamicsAndThermodynamicFormalism`). Measure entropy, pressure and
equilibrium states are not at the pins (searched Mathlib `Mathlib/Dynamics/` and Tau Ceti
`TauCeti/Dynamics/`: only topological entropy `Dynamics.coverEntropy`).

## What changed from the accepted design, and why

- **Supplier gaps** moved into the supplier subsections (brief's format); "Required extensions"
  heading and the words "proposed extension" removed.
- **Duplication by object, RiemannianGeometry → Tau Ceti pins.** The design cited RiemannianGeometry
  R1 (curvature tensor, sectional curvature), R2 (Jacobi fields, uniqueness, variations, constant
  curvature) and R4.4 (no conjugate points). These are at the Tau Ceti pin and are now cited there:
  `CovariantDerivative.sectionalCurvature` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean`),
  `TauCeti.Manifold.IsJacobiFieldOn` (`…/Riemannian/Jacobi/Basic.lean`),
  `TauCeti.Manifold.IsJacobiFieldOn.eq_of_eq_of_alongCurveWithin_eq` (`Uniqueness.lean`),
  `TauCeti.Manifold.isJacobiFieldOn_variationField` (`Variation.lean`),
  `TauCeti.Manifold.IsJacobiFieldOn.exists_eq_curvatureCosine_smul_add_curvatureSine_smul` (`Model.lean`),
  `TauCeti.Manifold.not_isConjugateOn_of_sectionalCurvature_nonpos` (`Conjugate.lean`).
  RiemannianGeometry (main) itself lists these as Tau Ceti's in its contract (its README lines
  410–447, 569). What stays with RiemannianGeometry is what the pins lack: existence of Jacobi
  fields with prescribed initial data (R2 §2.1, `exists_jacobi_initial_data`) and the Rauch
  comparison (R4.1, `rauch_norm_ge_of_sectional_le`). The §9.3 route now says the J_T exist by the
  absence of conjugate points plus initial-value existence and converge by the Rauch comparison
  (the design said "Riccati comparison of R4.1", which R4.1 does not name).
- **Gate stems.** ClassicalErgodicTheory's lemma names (`measureEntropy_flow`,
  `measureEntropy_toralEndomorphism`, `topologicalPressure_eq_iSup`, `coverEntropy_eq_iSup`,
  `flowTopologicalPressure_eq_iSup`, `isEquilibriumState_iff_toReal`, `exists_isEquilibriumState`,
  `existsUnique_isEquilibriumState`, `existsUnique_isFlowEquilibriumState`) are now prose in the
  contract and in §4.1's *Needs*: since `Suggested.lean` declares `measureEntropy`,
  `topologicalPressure` and `IsEquilibriumState`, the gate would read them as undeclared own names.
- **Lean names in the README** for every declaration of `Suggested.lean` (checked mechanically:
  every name occurs backticked in the README; every backticked name with a stem among the
  declarations is itself declared).
- **§6.5 (F2)** "for every small δ > 0" made exact: "there is δ₀ > 0 such that for every
  δ ∈ (0, δ₀]"; new Check showing the bound is needed (periodic orbit, δ = 0.6).
- **§8.1** restated precisely, as the Lean states it: V a finite-dimensional inner product space,
  orthogonal sum E^u ⊕ (E^u)^⊥ (the source's θ_n = π/2, ClimenhagaPesin2016 line 1846); the box;
  |A_n x| ≥ μ|x|; nonlinear parts and derivatives below δ on the box; explicit
  λ' = λ + (1 + γ⁻¹)δ and μ' = (μ − (1 + γ)δ)/(1 + γ) (lines 1853–1855) with max(1, λ') < μ';
  **graphs through 0**, with uniqueness among such families. Correction: without "through 0" the
  uniqueness claim is false when E^u = 0 (for V = E^s, f_n = Id, λ = 1, μ = 2 every constant family
  {p} satisfies (i)–(iii)); added as a Check.
- **§8.4–8.5** local maximality defined as "an open U ⊇ Λ such that every point whose whole orbit
  lies in U lies in Λ", equivalent for invariant Λ to Λ = ⋂ fⁿ(U) (both directions in the table).
- **§11.1** the unstable Jacobian made concrete: E^u_x as the span of the backward-contracted
  vectors (§7.4), λ_t(x) as the square root of the Gram-determinant ratio (basis-independent); new
  Check that the square root is needed.
- **Conventions**: the truncated Riemannian distance of the continuous metric giving the norms is
  bi-Lipschitz equivalent on compact sets to that of a smooth metric, so Layers 8 and 10 may be read
  with it (the Lean statements use it); the metric is registered through `Bundle.RiemannianBundle`
  with `IsContinuousRiemannianBundle`.
- **§8.2** the C¹ topology of the plaques is read in the charts of the Layer 8 introduction.
- **Scope**: HeegaardFloer §1.0a (M.0a) (local invariant manifolds at hyperbolic zeros of vector
  fields, on main) recorded as a neighbouring, different object.
- **Mathlib contract**: `Submodule.orthogonalProjectionOnto`, `Matrix.gram`, `Module.finBasis`,
  `Homeomorph.subtype`, `Set.MapsTo.restrict`, `Metric.infDist` added, as used by the statements.

What the README could not support: nothing was cut. Notions moved down from later roadmaps: none.

## Duplication sweep

By object, against main (content checkout at `985be45`; the citation tool read main at `19ff3de`),
the open roadmap pull requests through `roadmaps grep`/`show`, and the pins.

- Searches (README text, all open heads and main): "hyperbolic set", "Anosov", "SRB",
  "weak specification", "local product structure", "shadowing", "Hadamard–Perron",
  "stable manifold", "Bowen–Margulis", "basic set", "geometric potential", "entropy-expansive",
  "adapted metric", "Axiom A". Hits: ClassicalErgodicTheory (Scope puts uniformly hyperbolic
  dynamics, stable manifolds and SRB measures outside it and names this roadmap's subject as its
  consumer of §§8.4–8.6); GeometricTopology and TaubesGromov (Anosov torus bundles and the cat
  matrix as examples, already listed as consumers); HeegaardFloer M.0a and MorseNovikov (invariant
  manifolds at hyperbolic zeros of vector fields: different object, now recorded in Scope); the
  rest are unrelated uses of "basic set"/"axiom". No second owner of any target here.
- ClassicalErgodicTheory at head `e3c5108` re-read for the contract: Conventions (Bowen balls,
  line 171), §3.4, §5.1, §5.2 (power and inverse rules, `IsTopologicallyMixing`), §5.3
  (`IsExpansive`, finite entropy, toral automorphisms expansive), §5.4, §5.5, §6.1–6.2, §8.1–8.2,
  §8.4 (`HasBowenProperty`, `IsGibbsMeasure` with the same inequality, `HasSpecification`, Bowen's
  theorem), §8.5 (`IsExpansiveFlow`, `HasFlowBowenProperty`, `HasFlowSpecification`, flow
  coboundaries). It does not state weak specification, entropy-expansive maps as a notion, lower
  Gibbs bounds for flows or pressure under time changes. Its §8.5 now also proves uniqueness for
  suspensions over SFTs, including constant roofs, by the symbolic route; this roadmap's §5.3 is the
  abstract criterion under weak specification, a different theorem, and nothing here is re-planned.
- ArithmeticDynamics at head `ae79f44` §2.7 confirmed for small-diameter null-boundary partitions,
  Shannon–McMillan–Breiman, the ergodic decomposition kernel and entropy integration; §2.67 exists.
- Pins: Tau Ceti `TauCeti/Dynamics/Flow/Stable.lean` (`Flow.stableSet`, convergence to a fixed
  point) and `ClosedOrbit.lean` (periods) are not the strong stable sets or hyperbolic sets here.
  No expansivity, specification, pressure, hyperbolic set or shadowing at either pin.
- **Removals**: RiemannianGeometry R1 and R4.4 citations, and the uniqueness/variation/constant-
  curvature part of R2, replaced by the Tau Ceti declarations above. No target of this roadmap was
  deleted.

## Ownership against open work and overlaps

- Ownership was checked through the `roadmaps` tools (open heads, index of 2026-11-15T20:52:29Z
  and 21:27:33Z) and the sibling list. ClassicalErgodicTheory, the supplier of Layers 1–5's imported
  notions, is open pull request by another author adding a new folder (draft), not in
  `merge-order/ORDER.txt`; it is a permitted supplier, and the dependency check does not see that
  edge (question for human reviewers, as in the accepted review). No `Suggested.lean` declaration
  has the fully qualified name of a declaration of a roadmap readable here.
- The overlap lead "GeneralizedCohomology §G4.0b only an open revision defines": checked
  and refuted. Main's `TauCetiRoadmap/GeneralizedCohomology/README.md` line 1082 defines G4.0b inside
  §G4 (the tool looks for a heading). The citation stays on main; no dependency on the open
  revision. No other pull request changes this roadmap; no cited id is dropped.

## Elaboration

`lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean` from the
content checkout: exit 0, **15** warnings `declaration uses 'sorry'` (one per theorem), no other
message. Imports: `import Mathlib` and `import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`
(object file present). No `set_option`, no `lemma`, no sorry'd data.

`#check @name` comparison: one scratch file with all 50 declarations, elaborated once. Findings and
changes: (1) the hyperbolic-set and basic-set definitions had silently dropped `[IsManifold I 1 M]`
and `[FiniteDimensional ℝ E]` and did not require a continuous metric, while README §7.1 defines
them on finite-dimensional smooth boundaryless manifolds for a continuous metric: the five
definitions now carry `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless]
[IsContinuousRiemannianBundle …]` explicitly; (2) the two entropy-positivity theorems carried unused
`[MeasurableSpace M] [BorelSpace M]` and an unused distance hypothesis: moved to their own section;
(3) `HasLowerGibbsProperty` moved out of a section with compactness/nonemptiness variables (they were
already dropped; now the definition sits with the metric notions). All theorems keep their standing
hypotheses (compactness, nonemptiness, Borel, boundaryless, metric instances), as the elaborated
types show. Every Mathlib/Tau Ceti name the README backticks was checked at the pins: a scratch file
`#check`ed the 70 names in modules with object files (no error); the names in Tau Ceti modules
without object files (`MappingTorus`, `Sol/Basic`, `CatMap`, `Sphere`, `LyapunovPerron`, `Jacobi/Model`,
`Geodesic/Compact`) were confirmed in the source at the pin.

## Dependency check

    depcheck: 239 roadmaps, 2247 edges, 0 problem(s)

(The roadmap is already in the merge order, after ArithmeticDynamics.) `roadmaps resolve`: no
cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| `HasWeakSpecification` vs README §2.2 / ClimenhagaThompson2016 lines 1661–1669 | swap of a, b, d(a, b) = 1, δ = 1/2, τ = 1 | segments (a,1),(a,1): start of 2nd at 1 + g₀, need T^{1+g₀}a = a ⇒ g₀ = 1; (a,1),(b,1): g₀ = 0; fixed g ≡ τ fails one of them | matches (weak, not strong); start time ∑_{l<j}(n_l + g_l) = N_{j−1} + τ_{j−1} |
| `HasFlowWeakSpecification` vs lines 295–303 | roof-one suspension of 2-shift | gluing times in [0, τ₀ + 1]; d_t over s ∈ [0, t] closed, sup attained so "< δ" pointwise ⇔ sup < δ | matches |
| §3.1 USC theorem | period-1 orbit; X empty | g¹ = id, all entropies 0, USC trivially; empty: no probabilities, vacuous | pass |
| §5.2 theorem | full 2-shift, φ = 0; one point; disjoint union of two shifts | B_n(x, 1/2) cylinder of 2^{−(n+2)}, ×2^n = 1/4, K = 4; one point: ν(B_n) = 1, exp(nφ − nφ) = 1; union: two ergodic MMEs, weak spec fails (hypothesis excluded) | pass |
| §5.3 theorem | unit-speed orbit of period p; identity flow on 2 points | weak spec τ = p, Bowen K = 2‖F‖∞, lower Gibbs C_ε = (2s_ε/p)e^{−2p max\|F\|}; 2 points: expansive, no weak spec, every measure MME | pass |
| `HasHyperbolicLocalProductStructure` | full 2-shift; irrational rotation | c = 1, ρ = 1/2, δ* = 1/2; rotation: d(Rⁿx, Rⁿy) = d(x, y) ≰ cρⁿd(x, y) for large n | pass / negative control |
| `HasFlowHyperbolicLocalProductStructure`, (F2) with δ₀ | period-1 orbit, δ = 0.6 vs δ ≤ 1/4 | z = g^{0.45}x reached by v = 0.45 and −0.55, both in [−0.6, 0.6]: not unique; δ ≤ 1/4: unique | README made exact (δ₀), Check added |
| §6.8(a) | one point; swap; monotone shift | Dirac / (δ_a+δ_b)/2 unique, `Finite X`; monotone shift (not forward transitive): segment of MMEs, hypothesis excluded | pass |
| §6.8(b) | periodic orbit; roof-one suspension of monotone shift | time measure unique; suspension: two periodic-orbit measures, not forward transitive | pass |
| `IsHyperbolicSet` | diag(2, 1/2) at 0; diag(2, 1); identity, dim ≥ 1 | C = 1, ρ = 1/2: \|Dfⁿ(0,1)\| = 2^{−n}; diag(2,1): no contracted line, E^s = 0 forces E^u = ℝ², but (0,1) not backward contracted; identity: E^s = E^u = 0 ≠ T_xM | pass |
| `flowGenerator`, `IsFlowHyperbolicSet` | rotation flow of ℝ/ℤ; constant field on 𝕋²; suspension of diag(2, 1/2) | generator 1 ≠ 0; constant field: Dg^t = id ⇒ E^s = E^u = 0, T_xM = ℝX impossible (dim 2); suspension κ = log 2 | pass |
| `exists_isHadamardPerronFamily` | linear, μ = 3, λ = 1/2, γ = 0.1, δ = 0.01 | λ' = 0.61, μ' = (3 − 0.011)/1.1 = 2.717 > max(1, 0.61); cone factor 2.989 > 1; δ(1+γ)² = 0.0121 ≤ γ(μ − λ) = 0.25; φ_n = 0; (iii) forces y = 0 since (ν/λ)^L → ∞ | pass |
| same, E^u = 0 | V = E^s, f_n = Id, λ = 1, μ = 2 | λ' = 1 + 11δ > 1 so ν > 1: \|z\| < Cν^{−L}\|z\| fails, (iii) empty; every {p} satisfies (i) | **false without "through 0"**: added φ_n(0) = 0 to the family, README and Check |
| same, uniqueness for E^u ≠ 0 | family W' satisfying (i)–(iii) | points of W_n \ {0} decay like μ'^{−L} < 2ν^{−L}, so lie in W'_n by (iii); continuity at 0 | uniqueness holds; derivative bound not needed for it |
| `IsLocallyMaximal` ⇔ ⋂ fⁿ(U) | three-copy example; Λ = ∅, U = ∅ | {a} with U ∋ a, c: orbit of c leaves U at d, only a stays; ∅: no point has orbit in ∅ | both directions: invariant S ⊆ U ⇒ S ⊆ Λ, and an orbit in U is invariant ⊆ Λ |
| §8.4/§8.5 theorems | cat map, Λ = M; hyperbolic periodic orbit; Λ = ∅ | bracket = intersection of eigen-segments; finite Λ: e below least distance gives y = x = z; empty: (A2), (A3) vacuous | pass |
| `IsBasicSet`/`IsFlowBasicSet`/`IsFlowAttractor` | hyperbolic fixed point; two fixed points; monotone sub-horseshoe; r' = −sin(2πr)/(2π) | {p} basic; two points: fⁿp = p ∉ V, not transitive; monotone: forward transitivity fails; U = {\|r\| < 1/4} gives Λ = {r = 0}, U = {\|r\| < 1/2} gives ⋂ = U ≠ Λ | pass |
| §10.2 theorem | cat map, φ = 0; one-point basic set; φ' = φ + 5 + ψ∘f − ψ | Haar, h = log 2.618 = 0.9624; Dirac; same ES | pass |
| §10.3 theorem | periodic orbit period p, t = p; F' = F + 5 + L_gψ; g(2t) | g^p = id, M(g) = {time measure}, F_p constant on orbit; pressure + 5, same ES; ES of 2F for g(2t) is the time measure | pass |
| §10.4 positivity | periodic orbit; cat suspension; fixed point; cat map | first disjunct; h = 0.9624 > 0; finite; 0.9624 > 0 | pass |
| `isEquilibriumState_toralEndomorphism_zero_iff` | cat; shear (1 1; 0 1); rotation (0 −1; 1 0); d = 0 | eigenvalues 2.618, 0.382; shear eigenvalue 1 and rotation ±i excluded (both have every invariant measure an MME, h = 0); d = 0: charpoly 1, point, Dirac = volume | pass |
| `unstableJacobian`, `geometricPotential` | cat suspension, metric ds² + e^{2as}du² + e^{−2as}dv²; basis 2e_u; E^u = 0 | Gram(Dg^t e_u)/Gram(e_u) = e^{2at}, λ_t = e^{at}, φ^u = −a = −0.9624, P = 0; basis 2e_u: 4e^{2at}/4 same; 0×0 Gram det 1, λ_t = 1, φ^u = 0; no square root: −2a, P = −0.9624 ≠ 0 | pass; Check added |
| `srb_of_isFlowAttractor` | attracting circle r' = −sin(2πr)/(2π); saddle orbit of cat suspension | E^u = 0, φ^u = 0, μ⁺ = Lebesgue on circle, basin {r ≠ 1/2}; saddle: W^s_Λ(ε) of volume 0, not an attractor (hypothesis excluded) | pass |
| `srb_of_isFlowBasicSet_univ` | cat suspension; curvature −1 surface | μ⁺ = product measure, only a.c. invariant measure; Liouville = Bowen–Margulis, h = 1 | pass |
| Conventions: continuous-metric distance | g = (2 + \|sin 2πθ\|)dθ² on ℝ/ℤ | arc length ≤ ρ_g ≤ √3·arc length | bi-Lipschitz, as claimed |
| Supplier names (Tau Ceti Jacobi, sectional curvature; Mathlib additions) | `#check` at the pins | 70 names elaborate; the names in 7 unbuilt module groups confirmed in source | pass |

Generality, both directions: the README and the Lean now agree on every point above; the Lean
manifold theorems carry the README's standing hypotheses (finite-dimensional, smooth, boundaryless,
σ-compact or compact, continuous metric; smooth metric in Layer 11) and the truncated distance
`edist x y = min 1 (riemannianEDist I x y)`. Unused hypotheses (P3, kept): `hinv` beside
`IsFlowAttractor`/`IsFlowBasicSet` (derivable invariance, needed to form `Flow.restrict`), `hmaps`
beside `IsBasicSet`, and the C² joint smoothness beside the C² generator in §11.6 (the README's
"C² flow whose generator is C²").

## Sources

No source fetched; no passage copied. Source issues already in the review register (BowenRuelle1975
proof of Theorem 5.1 radius 3ε; ClimenhagaPesin2016 γ₀ < μ − 1 and the n ≤ 0 indexing) are unchanged;
the Lean statement of §8.1 chooses γ₀ existentially, so it is not affected by the γ₀ gap.

No suspicious instruction was found in any fetched or read text.
