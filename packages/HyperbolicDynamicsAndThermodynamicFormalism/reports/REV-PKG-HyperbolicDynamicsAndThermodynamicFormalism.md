<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6902319926 -->
Review (claude) of 8d3a18d

Verdict: needs_changes

1. **F01** (P3) a section variable that no declaration of its section uses

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`, line 628
   (section `GeometricPotential`): `{M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]`.

   **Claim.** The section declares `[IsManifold I 1 M]`, so its three definitions read as made on a
   C¹ manifold.

   **Witness.** The elaborated types of `flowUnstableSubspace`, `unstableJacobian` and
   `geometricPotential` contain no `IsManifold` binder (the worker's elaborated signatures; the three
   are the only declarations of the section). `README.md` §11.1 says the formulas "define functions on
   all of M".

   **Repair.** Delete ` [IsManifold I 1 M]` from line 628. Tested on a scratch copy: the file
   elaborates with the same 15 `sorry` warnings and nothing else.

2. **F02** (P3) local maximality for flows is defined without an API

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`, §8.5, line 697:
   "a locally maximal hyperbolic set Λ (`IsFlowLocallyMaximal`: an open U ⊇ Λ such that every point
   whose whole orbit lies in U lies in Λ …)".

   **Claim.** `IsFlowLocallyMaximal` is a definition of this roadmap, declared in `Suggested.lean`
   (line 445).

   **Witness.** §8.4 gives the map notion an `Its API:` list of three bullets and four Checks; §8.5
   has no `Its API:` list, and its three Checks concern the theorem. The shape rule asks for an API for
   every definition.

   **Repair.** In §8.5, before the `**Checks.**`, add:

       Its API:

       - Λ is locally maximal for g with isolating neighbourhood U iff every g-invariant subset of U
         lies in Λ, the orbit of a point being invariant.
       - It is then locally maximal, with the same U, for the reversed flow and for every rescaled
         flow g(at), a > 0, whose orbits are the same sets; a C¹ conjugacy h carries it to the
         locally maximal set h(Λ) with isolating neighbourhood h(U).
       - For t > 0 the set U_t of points x with g^s x ∈ U for every s ∈ [0, t] is open (compactness
         of [0, t]) and contains Λ, and every point whose g^t-orbit lies in U_t lies in Λ: Λ is
         isolated for the time-t map by U_t.

   and add the Check: "The constant-roof suspension of the set {p} ∪ O of §8.4's fourth Check, for a
   C^∞ diffeomorphism with such a horseshoe, is a hyperbolic set of the suspension flow that is not
   locally maximal: every neighbourhood of it contains whole orbits over horseshoe points outside
   {p} ∪ O." Each bullet was checked: a point of U_t-orbit has g^(nt+s)x ∈ U for all n ∈ ℤ and
   s ∈ [0, t], which is its whole orbit.

3. **F03** (P3) an API bullet of Layer 9 uses Layer 10

   **Location.** `README.md`, §9.1, line 754: "Haar measure is invariant, ergodic and a measure of
   maximal entropy (ClassicalErgodicTheory §§1.4, 6.4, 8.1); by §10.2 it is the only one."

   **Claim.** The uniqueness is stated as an API fact of §9.1.

   **Witness.** §9.1's `*Needs:*` (line 763) and Layer 9's Dependencies (line 804: "Layers 2, 6, 7, 8")
   do not list Layer 10, while §10.4's `*Needs:*` (line 868) lists Layer 9.1: the two layers use each
   other. §10.4 already owns the statement (`isEquilibriumState_toralEndomorphism_zero_iff`).

   **Repair.** Delete "; by §10.2 it is the only one" from the bullet (the sentence then ends at the
   citation). §10.4 keeps the theorem with its own `*Needs:*`.

Three findings, all P3, none blocking: one dead section variable in `Suggested.lean`, one
definition without an API list, one forward dependency in an API bullet. No mathematical defect was
found: every sampled locator matches its text, every computed instance agrees with the statements,
the file elaborates with `sorry` as the only warning, and no theorem is padding.

No previous review of the package exists, and no maintainer notes were left.

## Adversarial table

Values computed in this review. "L" is `Suggested.lean`, "R" is `README.md`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1 mixing of flows; "flow mixing iff one time-t map mixing" | periodic orbit of period p; roof-1 suspension; converse proof | arc U: g^t(U) ∩ U = ∅ near p/2 + pℤ; time-p map = identity; converse: g^r(U) ⊇ g^(r_i)(U″) for r near r_i, finitely many r_i cover [0, t] | holds | none |
| §2.2 `HasWeakSpecification` (L173) against ClimenhagaThompson2016 line 1665 | start time of segment j | L: Σ_(l<j)(n_l + g_l); source: N_(j−1) + τ_(j−1) = Σ_(i≤j−1)(n_i + τ_i) | equal | none |
| same, degenerate | empty X with k = 0; one point; swap of two points; irrational rotation | empty X: no y exists, false (theorems assume `Nonempty`); swap: τ = 1 works, segments (a,1),(a,1) need 1 + τ even and (a,1),(b,1) odd, so no strong specification; rotation: y = x_1, gluing time with {gα : g ≤ τ} δ-dense | consistent with R Checks | none |
| §5.1 `HasLowerGibbsProperty` (L155) | t = 0; scale above the diameter; small-time constant | t = 0: ν(B(x, ε)) ≥ K⁻¹; large ε: bound reads ∫₀ᵗφ − tP ≤ log K, true since one point is a separated set; t ≤ T₀: loss factor e^(T₀(∣P∣ + max∣φ∣)) ≤ R's e^(2T₀(…)) | holds | none |
| §5.2 theorem (L209) | one point; swap; full two-shift φ = 0, ε = 1/2 | point: ν(B_n) = 1, exp(nP − S_nφ) = 1; swap: ν = (1/2, 1/2), P = (φ(a) + φ(b))/2, product in [e^(−∣φ(a) − φ(b)∣/2)/2, e^(…)/2]; shift: B_n fixes x₋₁..x_n, measure 2^(−(n+2)), times 2^n = 1/4 | holds; Gibbs two-sided at small ε only, as defined | none |
| §5.2 scales against ClimenhagaThompson2016 lines 1880–1887, 1963 | ρ ∈ (5δ, ε/8], γ ∈ (4δ, ε/4], ε > 40δ | for r ≤ ε/8 choose δ < r/5: r ∈ (5δ, ε/8] and r ∈ (4δ, ε/4] | both bounds at every r ≤ ε/8 | none |
| §5.3 theorem (L221) | one-point flow; periodic orbit; two fixed points | point: expansive (y = ϕ 0 x), ν(B_t) = 1, exp(tc − tc) = 1; periodic orbit: unique invariant measure; two fixed points: expansive, no weak specification, every measure maximal | hypotheses needed, statement holds | none |
| §6.1 `HasHyperbolicLocalProductStructure` (L242); wrong models | identity of [0, 1]; identity of a finite set; full shift | identity of [0,1]: (A2) holds with e ≤ δ, (A3) needs d(x,y) ≤ cρⁿd(x,y) for all n, false for x ≠ y; finite set: both local sets singletons; shift: c = 1, ρ = 1/2 | definition excludes the isometric model | none |
| §6.3 gluing-time bound | r_j + n_j = 0; Check with m = 2 | term mL_j − r_j − n_j ∈ [0, m] (m when r_j + n_j = 0), total ≤ mM + m + (m − 1) = mM + 2m − 1; Check: m(M + 2) = 2k + 8 ≥ 2k, M + m = k + 4 < 2k iff k ≥ 5 | holds | none |
| §6.4 Bowen constant | through z = [x, y] | Σ_k C(cδλ^k)^θ ≤ C(cδ)^θ/(1 − λ^θ) on each side, total 2C(cδ)^θ/(1 − λ^θ) | equals R's bound | none |
| §6.5 `HasFlowHyperbolicLocalProductStructure` (L256) | periodic orbit of period 1, δ = 0.6 and δ₀ = 1/4; irrational linear flow | δ = 0.6: v = 0.45 and v = −0.55 both in [−0.6, 0.6]; δ ≤ 1/4: two times differ by < 1; linear flow: strong sets are {x}, (F3) reads 0 ≤ 0, (F2) fails off the orbit | δ₀ needed and present in L | none |
| §6.5 uniqueness of the bracket point | two points y₁, y₂ of the intersection | d(y₁,y₂) ≤ c²e^(−2κt)d(y₁,y₂) for all t ≥ 0, so y₁ = y₂ when 2δ ≤ δ* | API claim holds | none |
| §6.6 forward transitivity gives dense periodic orbits; §6.2 analogue | isolated point p; monotone shift | p isolated: f⁻¹p isolated, so fⁿp = f⁻¹p for some n ≥ 0 and p is periodic; monotone shift: (Tⁿx)₀ = x_n ≥ x₀ = 1 on U, so Tⁿ(U) ∩ V = ∅ for n ≥ 0 | forward notion needed and used in L286, L302 | none |
| §6.8 theorems (L284, L300) | swap; periodic orbit | swap: finite X, entropy 0, left disjunct; orbit: ν(B_t(x, ε)) ≥ 2s_ε/p, exponent in [−2p max∣F∣, 2p max∣F∣] | holds | none |
| §7.1 `IsHyperbolicSet` (L327) | empty Λ; diag(2, 1/2) at 0; identity in positive dimension | ∅ satisfies it (basic sets add `Λ.Nonempty`); C = 1, ρ = 1/2; identity forces E^s = E^u = 0, impossible when T_xM ≠ 0 | definition determines its object | none |
| §7.3 metric independence | metric × 4; Gram (2 1; 1 1) | K₁ = 2, K₂ = 1/2, K₁K₂ = 1; eigenvalues (3 ± √5)/2, K₁K₂ = ((3+√5)/2 ÷ (3−√5)/2)^(1/2) = (3 + √5)/2 ≈ 2.618 | matches R | none |
| §7.6 adapted metric | series shift; Jordan block Check | ∣Df v∣′² = λ′² Σ_(n≥1) λ′^(−2n)∣Dfⁿv∣² ≤ λ′²∣v∣′²; 2ⁿ∣Jⁿ(0,1)∣ = (4n² + 1)^(1/2); norm of (1/2 1/8; 0 1/2) = ((65/64)^(1/2) + 1/8)/2 ≈ 0.566 | matches R | none |
| §8.1 `exists_isHadamardPerronFamily` (L404) | K = ⊥; K = ⊤; uniqueness; clause (iv) | K = ⊥: graph {0}, (iii) empty because ∣z_L∣ ≥ ρ′^(−L)∣z∣ beats Cν^(−L)∣z∣; K = ⊤: graph = box, image covers the box since μ − δ > 1; uniqueness: a point of a second family has backward points with ∣q_L∣ ≤ μ′^(−L)∣q∣, so (iii) puts it on the first; (iv): ∣Δy′∣ ≤ (ργ + (1+γ)δ)∣Δx∣ ≤ γ(μ − (1+γ)δ)∣Δx∣ iff δ(1+γ)² ≤ γ(μ − ρ) | holds; L equals R (λ′, μ′ as ClimenhagaPesin2016 lines 1854–1855) | none |
| §8.2 corner Check | B = (1/2 1; 0 1/2), v ∝ (1, √7 − 2) | ∣v∣² = ∣Bv∣² = 1.4170 (unnormalised), ∣B²v∣/∣v∣ = 0.7646, det of the two normals = 0.6614 = √7/4 | matches R | none |
| §8.4–8.5 theorems (L462, L473) | Λ = ∅; hyperbolic periodic orbit; hypothesis `hd` | ∅: structure on the empty type holds; orbit: local sets singletons; `hd` satisfiable (circle with d = min(1, arc length)) and redundant `hinv` follows from f(Λ) = Λ | holds, not vacuous | none |
| §9.2 roof formula | return time; R ≡ 1, c = 1/2; c = 2 | ∫₀¹(c + (R − c)ρ) ds = R; h = 2/(1 + ρ), return time 1; denominator 2 − ρ(s) vanishes where ρ = 2 | matches R | none |
| §10.1 attractor (L515) against BowenRuelle1975 lines 25–34 | θ′ = 1, r′ = −sin(2πr)/(2π) | U = {∣r∣ < 1/4}: intersection {r = 0}; U = {∣r∣ < 1/2}: g^t(U) = U; W^s_Λ(ε) = {∣r∣ ≤ ε}, volume 2ε | definition and Check agree | none |
| §10.2–10.3 theorems (L537, L555) | one-point basic set; periodic orbit; F′ = F + 5 + L_gψ | point mass, entropy 0; time measure, P = orbit average; pressure +5, same state | holds; L clauses equal R's five conclusions | none |
| §10.4 (L589, L599, L615) | n = 0 torus; cat matrix; shear | n = 0: det = 1, no roots, point mass = `volume`, entropy 0 + 0 = pressure 0; cat: eigenvalues (3 ± √5)/2, entropy 0.9624; shear excluded by the modulus-1 hypothesis | holds | none |
| §11.1 `unstableJacobian`, `geometricPotential` (L639, L647) | E^u = 0; metric ds² + e^(2as)du² + e^(−2as)dv²; rescaling by e^(2u(s)) | E^u = 0: both determinants 1, λ_t = 1, φ^u = 0; λ_t = e^(at), φ^u = −a, P = a − a = 0; without the square root −2a ≈ −1.925; rescaled: φ′^u = −a − 0.2π cos(2πs) | sign and square root pinned | none |
| §11.3 distortion Check | b = 0.1 | ratio → (1 + b²)^(−1/2) = 0.99504 < e^(−0.001) = 0.99900 | η depends on θ, as stated | none |
| §11.4 volume lemmas (stated for hyperbolic sets; BowenRuelle1975 lines 364–375 state them for basic sets) | saddle periodic orbit; T = 0 | box volume ≈ ε³e^(−aT), times e^(aT) ≈ ε³; T = 0: ε-ball volume bounded above and below | the wider statement holds on the instance; the source's proof (lines 740–745) uses only the charts at points of Λ | none |
| §11.5 covering radius | δ = 1/(3.9m), ε = 1.01δ | distance (1.95² + 1.01²)^(1/2)δ = 2.196δ > 2.01δ = δ + ε | 2δ + ε needed, as stated | none |
| §11.6 theorems (L666, L684) | attracting periodic orbit; covering radius | E^u = 0, φ^u = 0, μ⁺ = time measure, basin {r ≠ 1/2}; d(y, x) = √5 ε > 2ε for z = (0,0), x = (2ε,0), y = (0,ε) | holds; 3ε needed, as stated | none |

## Verified sound

- **Principles.** No route-specific shortcut (Layer 5 and Layer 6 are stated for every compact
  metric system with the abstract hypotheses), no re-planned roadmap, no upward or cyclic supply,
  no algorithm, no sorry'd data, no `set_option`. No process residue in `README.md` or
  `Suggested.lean` (searched for pull-request numbers, dates, hand-off words, paths, LaTeX
  delimiters, HTML anchors).
- **Dependency check** (output): `depcheck: 239 roadmaps, 2257 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 15 warnings, all `declaration uses sorry`,
  no error. Imports: `import Mathlib` and `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`
  (present at the pin, used for `TauCeti.riemannianVolume`).
- **Sources: sampled locators, all found at the stated lines** (71 passages in 11 texts).
  BowenRuelle1975: lines 10–18, 19–24, 25–34, 60–61, 77–78, 92–95, 96–108, 119–133, 165, 190–199,
  213–222, 272–277, 324–325, 346–358, 360–363, 364–375, 377–407, 409–413, 421–425, 441, 470–472,
  643–652, 681–701, 702–715, 718–733, 740–745. ClimenhagaThompson2016: 140–147, 170–175, 295–303,
  341–342, 355–375, 380–381, 504–509, 1243–1244, 1251–1253, 1489, 1661–1669, 1687–1690, 1717–1724,
  1880–1887, 1908–1910, 1955, 1963–1965. BowenPeriodicPoints1971: 66–83, 96–97, 101–104, 105–168,
  387–392, 421–426, 667, 749–750. BowenEntropyExpansive1972: 55–56, 117–133, 134–135, 188, 192–193.
  Smale1967: 381–473. ClimenhagaPesin2016: 281–283, 1822–1840, 1841–1843, 1852–1855. BCS2022: 43–44,
  61–64. TsujiiZhang2023: 106–109, 123–127, 156, 485–495. BowenGroupEndomorphisms1971: 313–316,
  332–336. Buzzi2014: 114–116. Misiurewicz1976: 119–121. This covers all fifteen sampled targets
  (2.1, 5.2, 5.3, 6.3, 6.5, 6.6, 6.8, 7.1, 7.3, 8.2, 9.2, 10.1, 10.2, 11.1, 11.4). The author flagged
  no locator as unverified. The manifest records all 18 cited works.
- **Suppliers resolved now.** ClassicalErgodicTheory at its open head: every cited section exists
  (Conventions "Separated sets and Bowen balls", §§0.3, 1.4, 3.4, 5.1–5.6, 6.1–6.2, 6.4, 7.1–7.4,
  8.1–8.5), `IsGibbsMeasure`, `IsExpansive`, `IsTopologicallyMixing` are in its README (lines 2220,
  1706, 1675), and the sixteen definitions restated in `Suggested.lean` have the bodies of its file
  (lines 60, 405–419, 554–577, 612, 720, 739, 782, 795, 810). Its scope lists uniformly hyperbolic
  dynamics as outside it (line 69) and names this subject as a consumer (line 2437).
  GeometryOfNumbersAndQuadraticArithmetic §4.2 at its open head (the "Entropy and Haar measure on
  leaves" paragraph, line 1361). ProbabilisticAndMetricNumberTheory §4.1 on main (`birkhoff_pointwise`
  line 4650, `birkhoff_pointwise_ergodic` line 4692). ArithmeticDynamics §2.7 at its open head (lines
  2549, 2609–2626) and §§2.67, 2.90, 2.92. GeometricCurrents G6 on main (line 668, Grassmann bundle
  and its compactness at 670–681). GeneralizedCohomology G4.0b on main (line 1082; real Grassmannian
  graph-chart upgrades of dimension r(N − r) at 1149–1151). RiemannianGeometry R2 §2.1
  (`exists_jacobi_initial_data`, line 1509) and R4.1 (`rauch_norm_ge_of_sectional_le`, line 2277).
  TangentialBordism §2.3 (B1.5) on main (line 944). OperatorAlgebraDynamics D9 and HeegaardFloer
  §1.0a (M.0a, line 230) exist as cited.
- **Overlap facts.** No other pull request changes this roadmap; no cited id is dropped; the package
  drops no id. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is
  refuted: main's README defines G4.0b at line 1082, so no dependency on that revision arises.
- **Pinned declarations opened** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), all present where cited:
  `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (CoverEntropy.lean:418, hypotheses
  compact, `MapsTo T F F`, `U ∈ 𝓤 X`), `AddAction.IsTopologicallyTransitive` (Transitive.lean:31,
  one element of the monoid moves U to meet V), `Flow.restrictNonneg` (Flow.lean:241),
  `AddSubmonoid.nonneg` (Submonoid.lean:65–66, additive form of `oneLE`), `Homeomorph.subtype`
  (Lemmas.lean:160), `ModelWithCorners.pi` (IsManifold/Basic.lean:521), `Continuous.inner_bundle`
  (Riemannian.lean:128), `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank`
  (HausdorffDimension.lean:600), `SmoothPartitionOfUnity.exists_isSubordinate`
  (PartitionOfUnity.lean:366, `T2Space`, `SigmaCompactSpace`), `Manifold.riemannianEDist`
  (PathELength.lean:208), `TauCeti.globalFlow` (GlobalFlow.lean:60), `TauCeti.SmoothMappingTorus.flow`
  (MappingTorus.lean:395), `TauCeti.brouwerFixedPoint_closedBall` (BrouwerFixedPoint.lean:149),
  `TauCeti.isSmoothEmbedding_coe_sphereBundle` (Sphere.lean:181), `TauCeti.catMap` (CatMap.lean:43),
  `AddCircle.instIsManifold` (AddCircle.lean:258), `TauCeti.instIsManifoldPi` (Pi.lean:109),
  `CovariantDerivative.sectionalCurvature` (Sectional.lean:77), and the other library names the README cites (95 distinct in all), each
  found in the file the README names.
- **Duplication by object.** The pins contain no hyperbolic sets, Anosov systems, pressure, measure
  entropy, equilibrium states or specification (searched both libraries by object). Tau Ceti's stable
  manifolds are those of hyperbolic equilibria (Lyapunov–Perron, Morse), which the README names and
  does not consume. No roadmap on main or open plans hyperbolic sets, weak specification, the
  Hadamard–Perron theorem for sequences, SRB or Bowen–Margulis measures (searched the open heads and
  main); GeometricTopology and TaubesGromov only use Anosov torus bundles as examples.
- **Declared gaps.** Both slugs are in `design/plan.json` and under the suppliers' subsections of
  `## Exact supplier contracts`. `gap:sphere-bundle-embedding`: the pin has no corestriction
  theorem for the regular-level atlas (searched `Geometry/Manifold/RegularValue/`,
  `Geometry/Manifold/SmoothEmbedding/` and `VectorBundle/Riemannian/Sphere.lean`;
  `Manifold.IsSmoothEmbedding.codRestrict` is for open subsets only), so it asks for nothing
  provided. `gap:connection-map-jacobi-derivative`: the pin and RiemannianGeometry have no connection
  map of the Levi-Civita connection (the horizontal lifts at the pin belong to the model geometry of
  the universal cover of SL₂ only). Both are precise, with their hypotheses.
- **Headline theorems.** The Summary's end theorems and where they are stated: Bowen's criterion
  for homeomorphisms and flows (L209, L221); upper semicontinuity of entropy for expansive flows
  (L192); local product structure of locally maximal hyperbolic sets (L462, L473); the
  Hadamard–Perron theorem (L404); Bowen's theorem (L537); the Bowen–Ruelle theorem with constants,
  flow coboundaries, time-t maps and rescaling (L555); the Bowen–Margulis and Bowen measures with
  positive entropy and Haar measure for toral automorphisms (L589, L599, L615); the SRB theorem and
  its transitive Anosov case (L666, L684); unique equilibrium states under hyperbolic local product
  structure (L284, L300). The module docstring names the two not stated (local stable and unstable
  manifolds; the Anosov property of geodesic flows) with the missing carriers. The Anosov property of
  toral automorphisms and of suspensions are the README's examples, not end theorems; the toral
  example's ergodic content is stated.
- **Padding.** One-tactic probe on all 15 theorems (`rfl`, `infer_instance`, `simp`, `trivial`,
  `simp_all` after `intros`) on a scratch copy: all 15 fail. No theorem restates a definition,
  mirrors a Check or treats a boundary case.
- **Signatures.** The 51 elaborated types were compared with the README statements. Eleven
  declarations drop a section instance: eight drop one their body does not need (`MeasurableSpace`
  for the metric notions and pressure, `FiniteDimensional` for `hadamardPerronGraph` and
  `flowUnstableSubspace`), in agreement with ClassicalErgodicTheory's file; the three of R01 drop
  one that nothing uses.
- **Names.** Every backticked name the README attributes to this roadmap is declared in
  `Suggested.lean` (34 names), and every Lean name appears in the README.
- **Shape.** Eleven layers, each ending with `### Examples` and `### Dependencies`; every section
  has at least three Checks (three to seven); every theorem has a locator; `*Needs:*` on every
  target. The layer order is forced by the dependency lines (Layer 5 needs 1–4, Layer 6 needs 5,
  Layer 8 needs 6 and 7, Layers 10–11 need 8), and no layer is named after a source's chapter.
- Remark needing no change: `hinv` in L465 and L477 and `hmaps` in L539 follow from the hyperbolic-set
  hypothesis; they are terms the restricted map is built from, not extra hypotheses.

Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, MathematicalBilliards, RiemannianGeometry (ManifoldOptimization, LorentzianGeometry and ProbabilisticAndMetricNumberTheoryPartII searched by object, no hit); pressure, equilibrium states, Gibbs measures, the Bowen property, expansive flows and specification with periodic shadowing: ClassicalErgodicTheory; Bowen's criterion under weak specification: this roadmap (the difference is stated in Scope); toral endomorphisms, their entropy and Haar measure as a maximal measure: ClassicalErgodicTheory, with the smooth Anosov structure and uniqueness here; measure entropy: GeometryOfNumbersAndQuadraticArithmetic; Shannon–McMillan–Breiman and ergodic decomposition: ArithmeticDynamics; nothing else shared.

Source independence: 22 passages compared with 7 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, Smale1967, ClimenhagaPesin2016, BCS2022), none shared beyond definitions of a dozen words that the mathematics forces (axioms (A2)–(A3), the weak specification formula); largest share BowenRuelle1975, 45 of 137 locators; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent, the roadmap's route avoids that paper's symbolic dynamics (its Sections 2–3), and Layer 11's order is forced by §11.4 needing §§11.2–11.3 and §§11.5–11.6 needing §11.4. KatokHasselblatt1995, FH2019 and Bowen1975 could not be read (below).

## Not verifiable

- KatokHasselblatt1995 (16 locators), FH2019 (9), Bowen1975 (3), Walters1982, BowenWalters1972,
  Newhouse1989, HirschPalisPughShub1970: recorded as uncertified, texts not readable legally here.
  Their locators (sections and chapters) were not checked against the texts, and the README's
  wording was not compared with them. The locators "FH2019, Part II" and "KatokHasselblatt1995,
  Chapter 17" are coarse and cannot be sharpened without the texts; each target citing them also has
  a route stated in the README.
- The abstract claims of §6.6 (a flow with axioms (F2)–(F3) is Bowen–Walters expansive, has the
  closing property and weak specification) are this roadmap's own abstraction of the smooth
  arguments; no source states them at this generality. I checked the uniqueness and continuity of the
  bracket from the axioms and found no counterexample (periodic orbit, suspension, irrational linear
  flow), but did not write out the expansivity proof in full.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at §2.5, the sentence after (2.12), printed page 8: the source writes the two-sided set as an intersection of flow images of Bowen balls of order 2t centred at x; it should be centred at the point f_(−t)x; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives maps only for nonpositive indices yet indexes the family by all integers, and clause (iii) uses inverse maps not assumed to exist; it should index consistently and use backward sequences; affects a stated result.
- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source covers the deviating points by balls of radius 2ε about the chosen centres; it should be radius 3ε, by the triangle inequality through two intermediate points; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8d3a18d39d511ead5152c76036865aee5ff9aeae", "job": "REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism", "model": "fable", "worker": "chris-x91"} -->
