<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6903500121 -->
Review (claude) of 3c7436f

Verdict: needs_changes

1. **F01** (P2) a declared gap asks for what the pinned Tau Ceti already gives

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md` line 131: "What
   TangentialBordism must provide (gap:sphere-bundle-embedding): … a C^n map from a C^n manifold into
   the total space whose values lie in the sphere bundle is C^n as a map into the sphere bundle."
   Also §9.3 (lines 796, 810), Layer 9 Dependencies (line 818), Scope (line 13),
   `Suggested.lean` lines 32–34, and the `gaps` entry of `design/plan.json`.

   **Claim.** The corestriction is missing at the pins and must come from TangentialBordism §2.3.

   **Witness.** Tau Ceti at the pin, `TauCeti/Geometry/Manifold/SmoothEmbedding/Extension.lean` line
   64, `Manifold.IsImmersionAt.exists_contMDiffOn_retraction`: an embedding of a boundaryless source
   has a local C^n retraction `r` with `r (f y) = y`. `TauCeti/Geometry/Manifold/Boundary/SmoothMap.lean`
   lines 28–49 derives exactly this corestriction for boundaries from it.

   The sphere bundle's model is `𝓘(ℝ, Fin k → ℝ)` (`Sphere.lean` line 143), which is boundaryless, and
   `TauCeti.isSmoothEmbedding_coe_sphereBundle` (line 181) supplies the embedding. So for a C^n map
   `F` into the total space with values in the sphere bundle, the corestriction equals `r ∘ F` on the
   open set `F⁻¹(V)`, and is C^n there. This is a step of §9.3, not a contract with another roadmap.

   **Repair.**

   1. `README.md`, "From Tau Ceti": add the bullet "`Manifold.IsImmersionAt.exists_contMDiffOn_retraction`
      (`TauCeti/Geometry/Manifold/SmoothEmbedding/Extension.lean`): a topological embedding of a
      boundaryless manifold that is a C^n immersion at x has a C^n map r on an open neighbourhood V
      of its value at x with r(f y) = y whenever f y ∈ V; used by §9.3."
   2. §9.3: replace "is smooth into SM by the corestriction theorem requested from TangentialBordism
      (gap:sphere-bundle-embedding)" by "is smooth into SM: the inclusion is a smooth embedding of a
      boundaryless manifold, so near each point of SM it has a smooth local retraction r
      (`Manifold.IsImmersionAt.exists_contMDiffOn_retraction`), and the corestricted flow is locally
      r composed with the flow into TM".
   3. Delete the subsection "From TauCetiRoadmap.TangentialBordism — §2.3 (B1.5)" (lines 127–131),
      the clause "the comparison of sphere-bundle carriers with the literal subsets of the total
      space (TangentialBordism §2.3)" in Scope, "TangentialBordism §2.3 and gap:sphere-bundle-embedding"
      in §9.3's `*Needs:*` (add the new Tau Ceti name there), and "TangentialBordism §2.3" in Layer 9's
      Dependencies. §9.3 uses Tau Ceti's carrier, which is the literal subset, so nothing else of
      TangentialBordism is consumed.
   4. `Suggested.lean` lines 32–34: replace the parenthesis by "(Tau Ceti has the geodesic flow on the
      tangent bundle and the sphere bundle as an embedded manifold; the restricted flow as a `Flow ℝ`
      is a construction of README §9.3, and the connection map it requests from RiemannianGeometry is
      missing)".
   5. Remove the `sphere-bundle-embedding` entry from the `gaps` list of `design/plan.json`, so that
      the intake does not announce it to TangentialBordism.

2. **F02** (P2) §8.4: local maximality for f^k needs an invariant set

   **Location.** `README.md` §8.4, line 675: "If Λ is locally maximal for f, it is locally maximal
   for f⁻¹ with the same U, and for f^k, k ≥ 1, with the isolating neighbourhood
   U ∩ f(U) ∩ ⋯ ∩ f^(k−1)(U)".

   **Claim.** The bullet holds for every set Λ, as the definition (line 670, "Call a set Λ locally
   maximal for a homeomorphism f") and `IsLocallyMaximal` now allow.

   **Witness.** f = −Id on ℝ², Λ = {(1, 0)}, U the open ball of radius 1/2 about (1, 0), k = 2. No
   orbit {y, −y} lies in U, so Λ is locally maximal for f. But f² = Id fixes every point, so no open
   set isolates Λ for f², and U ∩ f(U) = ∅.

   Before the last repair the definition was for hyperbolic sets, which satisfy f(Λ) = Λ, and the
   bullet was true. The f⁻¹ clause needs no invariance. §8.5's time-t bullet already says "for an
   invariant Λ".

   **Repair.** Replace the first half of the bullet by: "If Λ is locally maximal for f, it is
   locally maximal for f⁻¹ with the same U; if moreover f(Λ) = Λ, it is locally maximal for f^k,
   k ≥ 1, with the isolating neighbourhood U ∩ f(U) ∩ ⋯ ∩ f^(k−1)(U), which contains Λ by
   invariance;". Add the Check: "Invariance is needed for iterates: for f = −Id on ℝ², Λ = {(1, 0)}
   and U the open ball of radius 1/2 about (1, 0), no orbit {y, −y} lies in U, so Λ is locally
   maximal for f; but f² is the identity, every point is a whole f²-orbit, and no open set
   containing (1, 0) isolates Λ for f²."

   Tested: with f(Λ) = Λ, Λ = f^j(Λ) ⊆ f^j(U) for 0 ≤ j < k; and f^(kn) x ∈ f^j(U) for all n and j
   gives f^(kn−j) x ∈ U at every integer time, so x ∈ Λ. The witness fails the new hypothesis.

3. **F03** (P2) §8.5: "a nonempty Λ is not a hyperbolic set of g^t" lacks its hypothesis

   **Location.** `README.md` §8.5, line 703: "For an invariant Λ and t > 0, … A nonempty Λ is not a
   hyperbolic set of the diffeomorphism g^t, since Dg^(nt) X(x) = X(g^(nt) x) stays bounded above and
   below".

   **Claim.** No nonempty invariant, locally maximal Λ is hyperbolic for a time-t map.

   **Witness.** The flow of the linear field (x, −y) on ℝ² (§7.2, third Check), Λ = {0}: invariant,
   locally maximal with U a ball, and g^t = diag(e^t, e^(−t)) has {0} as a hyperbolic set by §7.1's
   first Check. The argument needs X ≠ 0 on Λ.

   The bullet is stated for an invariant set of a continuous flow; the sentence needs Λ to be a
   hyperbolic set of a C¹ flow, where the generator is bounded above and below (§7.2).

   **Repair.** Replace the sentence by: "A nonempty hyperbolic set Λ of a C¹ flow g (§7.2) is not a
   hyperbolic set of the diffeomorphism g^t, since Dg^(nt) X(x) = X(g^(nt) x) stays bounded above and
   below for n ∈ ℤ (§7.2) while a hyperbolic splitting sends every nonzero vector either to 0 or to
   infinity in forward time; so the theorem of §8.4 does not apply to g^t. The hypothesis is needed:
   for the linear field (x, −y) of §7.2's third Check, {0} is invariant and locally maximal, and it
   is a hyperbolic set of g^t = diag(e^t, e^(−t))."

   Tested on the witness: {0} is not a hyperbolic set of the flow (the generator vanishes there), so
   the repaired sentence does not speak of it.

Three findings, all P2. One declared supplier gap asks another roadmap for a statement that two
pinned Tau Ceti declarations already give in a few lines. Two API sentences that the last repair
round widened from hyperbolic sets to arbitrary sets are false without a hypothesis they dropped.
Nothing else was found: the three earlier findings are repaired, every sampled locator matches its
text, the file elaborates with `sorry` as the only warning, and no theorem is padding.

## Previous findings (round 1), checked one by one

- **F01 (section variable nobody uses) — repaired.** `Suggested.lean` line 628 now reads
  `{M : Type*} [TopologicalSpace M] [ChartedSpace H M]`; the three definitions of the section
  elaborate with the same types as before.
- **F02 (`IsFlowLocallyMaximal` without an API) — repaired, with two new defects (R02, R03).**
  `README.md` §8.5 now opens "Call a set Λ locally maximal for a flow g (`IsFlowLocallyMaximal`)
  when there is an open U ⊇ Λ, an isolating neighbourhood, …", followed by three API bullets and
  three Checks. The Checks are correct (rows below). The same repair reworded §8.4's definition
  "for any set", which made one bullet there false (R02), and added one sentence to §8.5 that
  lacks its hypothesis (R03).
- **F03 (an API bullet of Layer 9 used Layer 10) — repaired.** §9.1 now reads "Haar measure is
  invariant, ergodic and a measure of maximal entropy (ClassicalErgodicTheory §§1.4, 6.4, 8.1)."
  `sources.toml` no longer lists "9.1" for BowenPeriodicPoints1971, and §9.1 no longer cites it.
  No other API bullet rests on a later layer.

Maintainer notes: none were left.

## Adversarial table

Values computed in this review. "L" is `Suggested.lean`, "R" is `README.md`. Rows of the round-1
table that carry computed values (§§2.1, 2.2, 5.1–5.3, 6.1, 6.3–6.6, 6.8, 7.1, 7.3, 7.6, 8.1, 8.2,
8.4–8.5 theorems, 9.2, 10.1–10.4, 11.1, 11.3–11.6) were relied on where the text is unchanged; the
sections that table did not cover are reviewed here.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §8.4 API, f^k clause (R line 675) | f = −Id on ℝ², Λ = {(1,0)}, k = 2; three-copy Check | f-orbits {y, −y} never inside the ball, so Λ locally maximal; f² = Id, U ∩ f(U) = ∅. Three-copy: U ∩ f(U) = ball(a) ∩ f(ball(a)), excludes c | false without f(Λ) = Λ | R02 |
| §8.5 API (3), last sentence (R line 703) | linear field (x, −y), Λ = {0}; cat suspension | g^t = diag(e^t, e^(−t)), {0} hyperbolic for g^t; in the suspension \|Dg^n ∂_s\| = \|∂_s\| for all n | false without "hyperbolic set of the flow" | R03 |
| §8.5 API (1), (2), (3) first part | S invariant in U; a = 1/2; t = 1, time −2.5 | orbit of x is invariant; g(t/2) has the same orbits; −2.5 = (−3)·1 + 0.5, so g^(−2.5)x = g^(0.5)(g^(−3)x) ∈ U | hold | none |
| §8.5 Check 1 (γ₀ in the cat suspension) | lifts ỹₙ | ‖A‖ = 2.618; 2.618/4 + 1/4 = 0.9045 < 1, so Aỹₙ = ỹₙ₊₁; bounded two-sided orbit of A is 0 | holds | none |
| §8.5 Check 2 (period-2 point) | c = (4/5, 3/5) | Ac = (11/5, 7/5) ≡ (1/5, 2/5); A(1/5, 2/5) = (4/5, 3/5); distances to 0: √5/5 = 0.447 > 0.25; [1/2, c] ∈ g^(1/2)(B), disjoint from B | holds | none |
| §8.5 Check 3 (suspension of {p} ∪ O) | tube lemma over [0, 1] | open set ⊇ [0,1] × K contains [0,1] × V; whole f-orbit of q in V, q ∉ K | holds | none |
| gap:sphere-bundle-embedding | pinned retraction lemma; boundary analogue | model `𝓘(ℝ, Fin k → ℝ)` boundaryless; r ∘ F = corestriction on F⁻¹(V) since r(f y) = y | provided at the pin | R01 |
| gap:connection-map-jacobi-derivative | search of both pins | "connectionMap", "Sasaki" occur only under `Riemannian/SL2Tilde/`; RiemannianGeometry R2 has Jacobi fields, no connection map | precise and minimal | none |
| §1.1 balls and Γ_ε (sampled neighbour) | doubling map; shift point y with its 1 at −1 | half-widths 1/8 (n = 1), 1/16 (n = 2); d(T^k 0, T^k y) = 2^(−k−1), d(T⁻¹0, T⁻¹y) = 1; wrong translate tests times n…3n | holds | none |
| §1.2 entropy-expansive (sampled) | identity of [0,1]; two-shift at ε = 1/4; compactified shifts | Φ_ε interval, entropy 0; closeness on coordinates −1…n gives 2^(n+2) cover elements, rate log 2; pieces of entropy m log 2 inside every Φ_ε(∞) | holds; hypothesis needed | none |
| §1.3 expansive flows (sampled) | periodic orbit; irrational linear flow; identity flow of a finite set | y = g^u x with \|u\| = d(x,y)/speed; transverse segment in Γ_ε; δ below least distance forces y = x | holds | none |
| §2.2 weak specification (sampled); L173 | start time of segment j; rotation | L: Σ_(l<j)(n_l + g_l) = source's N_(j−1) + τ_(j−1); rotation: errors do not accumulate, each segment matched within δ | equal; Check holds | none |
| §3.1 usc of entropy; L192 | period-1 orbit; roof-1 suspension, trivial partition | g¹ = Id, entropy 0; product measure log 2 against rate 0 of {X} | holds; diameter hypothesis needed | none |
| §4.1 rescaling (sampled) | F = c, a = 2; period-1 orbit, t = 1 | P_(g_2)(2c) = 2h + 2c against P_(g_2)(c) = 2h + c; point masses are equilibrium states of F_1 for g¹ = Id but not in M(g) | holds; equivalence only on M(g) | none |
| §5.1 lower Gibbs (sampled); L155 | t ≤ T₀; t = 0 | loss factor e^(T₀(∣P∣ + max∣φ∣)) ≤ stated e^(2T₀(…)); t = 0 reads ν(B(x,ε)) ≥ K⁻¹ | holds | none |
| §5.2, §5.3 headlines; L209, L221 | swap of two points; one-point flow; two fixed points | swap: ν = (1/2, 1/2), ν(B_n) = 1/2, exponent bounded by ∣φ(a) − φ(b)∣/2; point: 1·e⁰; two fixed points: no gluing, every measure maximal | hold | none |
| §6.1 axioms (sampled); L242 | identity of the circle; two-shift | (A3) would need d ≤ cλⁿd for all n; shift c = 1, λ = 1/2 | definition excludes isometries | none |
| §6.8 headlines (sampled); L284, L300 | monotone shift; swap | n + 1 words of length n, entropy 0, M(T) a segment, all free energies 0; (Tⁿx)₀ ≥ x₀ blocks forward transitivity; swap finite, left disjunct | hold; forward time needed and in L286, L302 | none |
| §7.2, §7.4, §7.5, §7.7 | constant field on 𝕋²; diag(2,1/2) ⊔ (1/3)Id; f² | Dg^t = Id forces E^s = E^u = 0, dim 1 ≠ 2; union constants C = 1, λ = max(1/2, 1/3); rate 1/4 | hold | none |
| §8.1 headline; L404, clause (iii) | cone-complement step; z = 0 | ∣Δy′∣ ≤ (λ + δ(1 + γ⁻¹))∣Δy∣ when ∣Δx∣ < γ⁻¹∣Δy∣; ∣z − q₀∣ ≤ λ′^L(Cν^(−L)∣z∣ + μ′^(−L)∣q₀∣) → 0; z = 0 excluded by strict bound at L = 0 and lies on the graph | holds | none |
| §8.2 plaques (sampled) | B = (1/2 1; 0 1/2), v ∝ (1, √7 − 2) | ∣v∣² = 1 + 0.4170 = 1.4170; Bv = (1.1458, 0.3229), ∣Bv∣² = 1.4170 | Check holds | none |
| §8.3 charts | flow θ′ = 1, u′ = u, v′ = −v + u²; time change with drop e^(−3a) | particular solution u₀²e^(2t)/3; φ_x maps {b = 0} to {v = u²/3}; e^(3a) = 17.94 > e^a | Checks hold | none |
| §8.6 nontriviality (sampled) | sink in ℝ²; flow on a circle; proof of (a) | sink not on a compact manifold; circle: E^s = E^u = 0, dim 1; m plaques of diameter ≤ 2C′λ′^(pk)r₀ cover K = f^(pk)(K), so ∣K∣ ≤ m | holds | none |
| §9.1 toral automorphisms; L615 | cat matrix; n = 0; (0 −1; 1 0) | eigenvector (1, (√5 − 1)/2), log 2.618 = 0.9624; empty matrix det 1, no roots, point mass = volume; A⁴ = I | hold | none |
| §10.1 (sampled); L495–L520 | monotone-shift subset of a horseshoe; θ′ = 1, r′ = −sin(2πr)/(2π) | orbit avoiding N never reads 1, 0, so it is nondecreasing; U = {∣r∣ < 1/2} has intersection U, U = {∣r∣ < 1/4} gives {r = 0} | definitions and Checks agree | none |
| §10.3 headline (sampled); L555 | periodic orbit; F′ = F + 5 + L_gψ; t-clause | exponent ∫₀^r F − rP ∈ [−2p max∣F∣, 2p max∣F∣]; pressure +5; L568–570 quantifies over flow-invariant ν′ as §4.1 requires | holds | none |
| §10.4; L589, L599 | circle as a basic set; no `hd` in scope | single periodic orbit, left disjunct; entropy on compact Λ depends on the topology only, so the missing `hd` is harmless | hold | none |
| §11.1 (sampled); L633–L648 | rescaled metric u(s) = 0.1 sin(2πs); ∣sin∣ factor | φ′ = −a − 0.2π cos(2πs) = φ − L_gψ with ψ = u; one-sided derivatives a ± 2π | sign and regularity pinned | none |
| §11.2 Grassmann lift | q = 1, dim M = 3 | 3 + 1·2 = 5 = 3 (stable) + 1 (unstable) + 1 (flow); fibre rates 2a and a | holds | none |
| §11.3 distortion (sampled) | b = 0.1 | limit (1 + 0.01)^(−1/2) = 0.99504 < e^(−0.001) = 0.99900 | η depends on θ, as stated | none |
| §11.4 volume lemmas (sampled) | T = 0; cat suspension | ε-ball volume bounded above and below; box ε·ε·εe^(−aT) times e^(aT) = ε³ | holds | none |
| §11.6 headlines (sampled); L666, L684 | covering radius; circle flow as Anosov | d_k(y, x) ≤ ε + 2ε; z = (0,0), x = (2ε,0), y = (0,ε): √5 ε = 2.236ε > 2ε; circle: φ^u = 0, μ⁺ = time measure = normalised volume | hold; 3ε needed, as stated | none |

## Verified sound

- **Principles.** No route-specific shortcut (Layers 5 and 6 are stated for every compact metric
  system with the abstract hypotheses), no re-planned roadmap, no algorithm, no sorry'd data, no
  `set_option`, no `lemma`, no `#eval`. No process residue in `README.md`, `Suggested.lean` or
  `sources.toml` (searched for pull-request numbers, round labels, hand-off words, machine paths,
  LaTeX delimiters, HTML anchors).
- **Dependency check** (output): `depcheck: 237 roadmaps, 2245 edges, 0 problem(s)`. No UPWARD,
  CYCLE or `moved:` line. The merge order places this roadmap directly after ArithmeticDynamics.
  ClassicalErgodicTheory is an open pull request that adds a new roadmap folder and is not yet in
  the merge order; the check accepts it.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 15 warnings, all `declaration uses sorry`
  (lines 192, 209, 221, 284, 300, 404, 462, 473, 537, 555, 589, 599, 615, 666, 684), no error.
  Imports: `import Mathlib` and `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`, used
  for `TauCeti.riemannianVolume`.
- **Sources: all fifteen sampled targets, every locator found at its lines** (30 passages in 6
  texts). §1.2: BowenEntropyExpansive1972 lines 55–56, 188, 192–193. §1.3: ClimenhagaThompson2016
  lines 355–375, 380–381, 513–530; BowenEntropyExpansive1972 lines 117–133. §2.2:
  ClimenhagaThompson2016 lines 1661–1669, 295–303, 448–463. §4.1: BowenRuelle1975 lines 190–199,
  409–413. §5.1: BowenRuelle1975 lines 272–277; ClimenhagaThompson2016 lines 1251–1253. §6.1:
  BowenPeriodicPoints1971 lines 66–83. §6.8: BowenPeriodicPoints1971 lines 421–426, 749–750. §8.2:
  ClimenhagaPesin2016 lines 1822–1840, 1853–1855. §10.1: BowenRuelle1975 lines 25–34, 94–95,
  381–383, 402–406, 441. §10.3: BowenRuelle1975 lines 213–222, 272–277; TsujiiZhang2023 lines
  106–109, 485–495. §11.1: BowenRuelle1975 lines 346–363. §11.3: BowenRuelle1975 lines 643–652,
  681–701, 702–715, 718–738. §11.4: BowenRuelle1975 lines 364–375, 740–745. §11.6: BowenRuelle1975
  lines 421–472. §8.6 states its own proof, which was checked step by step; its one outside
  locator is uncertified (below). The author flagged no locator as unverified. `sources.toml`
  records all 18 cited works, and each entry's `cited_for` agrees with the sections that cite it.
- **Suppliers resolved at their heads now.** ClassicalErgodicTheory at its open head: the
  Conventions paragraph "Separated sets and Bowen balls" (line 171), §§0.3, 1.4, 3.4, 5.1–5.5,
  6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4 (line 2206; `IsGibbsMeasure` line 2220) and 8.5 (line 2297)
  exist and say what is cited. The eleven of its definitions that `Suggested.lean` restates have
  the same bodies in its Lean file (lines 60, 554–578, 612, 720, 739, 782, 795, 810; its
  `flowInvariantProbabilities` is stated for any time monoid and is used here at ℝ),
  `IsGibbsMeasure` follows its README (line 2220), and the four entropy definitions agree with
  its lines 405–421. Its paragraph "Outside this roadmap" excludes uniformly hyperbolic dynamics
  and its consumers section names this subject (line 2437).
  GeometryOfNumbersAndQuadraticArithmetic §4.2 (paragraph at line 1361).
  ProbabilisticAndMetricNumberTheory §4.1 on main (`birkhoff_pointwise` line 4650,
  `birkhoff_pointwise_ergodic` line 4692). ArithmeticDynamics §2.7 at its open head (lines 2549,
  2609–2626, 2633–2643) and §§2.67, 2.90, 2.92. GeometricCurrents G6 on main (line 668; the
  Grassmann bundle and its compactness, lines 670–681). GeneralizedCohomology G4.0b on main (line
  1082; real graph-chart upgrades of dimension r(N − r), lines 1149–1151). RiemannianGeometry §2.1
  (`exists_jacobi_initial_data`, line 1509) and R4.1 (`rauch_norm_ge_of_sectional_le`, line 2277).
  OperatorAlgebraDynamics D9 and HeegaardFloer §1.0a (M.0a, line 230) exist as cited.
- **Overlap facts.** No other pull request changes this roadmap, no cited id is dropped, and the
  package drops no id. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision"
  is refuted: main's README has the item G4.0b at line 1082 and its ownership sentence at line 1149.
- **Pinned names.** All 223 backticked spans of the README were resolved mechanically: every
  Mathlib and Tau Ceti name is declared at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the
  revisions of `lake-manifest.json`), every file path the contracts name exists, and the only
  names found in neither library nor `Suggested.lean` are the nine the text attributes to
  ClassicalErgodicTheory, ProbabilisticAndMetricNumberTheory and RiemannianGeometry. All 50 names
  declared in `Suggested.lean` appear in the README.
- **Duplication by object.** Neither pin declares hyperbolic sets, Anosov systems, local
  maximality, weak specification, pressure, equilibrium states or measure entropy. A search of all
  open heads and main for hyperbolic sets, Anosov flows, weak specification, Hadamard–Perron, SRB
  and Bowen–Margulis measures and local product structure finds only ClassicalErgodicTheory's
  out-of-scope and consumer sentences.
- **Headline theorems.** From the Summary: Bowen's criterion for homeomorphisms and flows (L209,
  L221); upper semicontinuity of entropy for expansive flows (L192); the abstract uniqueness
  theorems (L284, L300); the Hadamard–Perron theorem (L404); local product structure of locally
  maximal hyperbolic sets (L462, L473); Bowen's theorem (L537); the Bowen–Ruelle theorem with
  constants, flow coboundaries, time-t maps and rescaling (L555); positive entropy and the
  Bowen–Margulis and Bowen measures, with Haar measure for toral automorphisms (L589, L599, L615);
  the SRB theorem and its transitive Anosov case (L666, L684). The module docstring names the two
  not stated (local stable and unstable manifolds; the geodesic flow) with what each lacks; R01
  corrects the wording of the second.
- **Padding.** One-tactic probe on all 15 theorems on a scratch copy (`rfl`, `infer_instance`,
  `trivial`, `simp`, `simp_all` after `intros`, `constructor` then `simp`, `aesop`): all 15 fail.
  None restates a definition, mirrors a Check or treats a boundary case.
- **Signatures.** The elaborated types of the 50 declarations were compared with the README
  statements. Eight definitions drop a section instance their body does not use (`MeasurableSpace`
  on `iteratedPartitionLabel` and on the metric and pressure notions, `UniformSpace` on `pressureNetSum`, `FiniteDimensional` on
  `hadamardPerronGraph` and `flowUnstableSubspace`); the ninth lead
  of the worker's list is a parsing artefact of the module docstring. Nothing changed.
- **Shape.** Eleven layers, each ending with `### Examples` and `### Dependencies`; every
  definition has an API list and at least three Checks; every `*Needs:*` line is itemised. No
  layer is named after a source's chapter, and the order is forced: Layer 5 needs 1–4, Layer 6
  needs 5, Layer 8 needs 6 and 7, Layers 10–11 need 8.
- Remark needing no change: `hinv` in L465 and L477 and `hmaps` in L539 follow from the
  hyperbolic-set hypothesis; they are the terms the restricted map is built from.

Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, RiemannianGeometry (MathematicalBilliards, Surfaces, ManifoldOptimization, LorentzianGeometry and SmoothBundlesConnections searched by object, no hit); pressure, equilibrium states, Gibbs measures, the Bowen property, expansive flows and specification with periodic shadowing: ClassicalErgodicTheory; Bowen's criterion under weak specification: this roadmap; toral endomorphisms with their entropy and Haar measure: ClassicalErgodicTheory, with the Anosov structure and uniqueness here; measure entropy: GeometryOfNumbersAndQuadraticArithmetic; Shannon–McMillan–Breiman and ergodic decomposition: ArithmeticDynamics; Jacobi fields and Rauch comparison: RiemannianGeometry; nothing else shared.

Source independence: 30 passages compared with 6 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, ClimenhagaPesin2016, TsujiiZhang2023), none shared beyond formulas and definitions of a dozen words that the mathematics forces (axioms (A2)–(A3), the weak-specification formula, clauses (i)–(iii) of the Hadamard–Perron theorem); largest share BowenRuelle1975, 48 of 156 locators; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent, the route avoids that paper's symbolic dynamics, and Layer 11 interleaves its Section 4 with its Appendix in the order §11.4 needing §§11.2–11.3 and §§11.5–11.6 needing §11.4 force. KatokHasselblatt1995, FH2019 and Bowen1975 could not be read.

## Not verifiable

- KatokHasselblatt1995 (17 locators), FH2019 (10), Bowen1975 (4), Walters1982, BowenWalters1972,
  Newhouse1989 and HirschPalisPughShub1970 are recorded as uncertified: their texts are not
  readable legally here, so their locators were not checked and the README's wording was not
  compared with them. "FH2019, Part II" and "KatokHasselblatt1995, Chapter 17" are coarse and
  cannot be sharpened without the texts. This covers the outside locator of the sampled §8.6 and
  the KatokHasselblatt1995 locator of the sampled §8.2.
- §6.6's abstract claims (a flow with (F2)–(F3) is Bowen–Walters expansive, has closing and weak
  specification) are this roadmap's own abstraction; no readable source states them at this
  generality. No counterexample was found (periodic orbit, roof-one suspension, a cylinder of
  parallel circles, which fails (F2)); the expansivity proof was not written out in full.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at §2.5, the sentence after (2.12), printed page 8: the source writes the two-sided set as an intersection of flow images of Bowen balls of order 2t centred at x; it should be centred at the point f_(−t)x; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps for nonpositive indices only yet indexes the family of graphs by all integers, and clause (iii) uses inverses not assumed to exist; it should index consistently and use backward sequences; affects a stated result.
- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source covers the deviating points by balls of radius 2ε about the chosen centres; it should be radius 3ε, by the triangle inequality through two intermediate points; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3c7436ffed53a88fb7d8c72433b122eb305200c3", "job": "REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~2", "model": "fable", "worker": "chris-x80"} -->
