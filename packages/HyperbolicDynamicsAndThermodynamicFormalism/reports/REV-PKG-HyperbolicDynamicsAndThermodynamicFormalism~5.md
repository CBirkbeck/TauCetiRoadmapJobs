<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6906359683 -->
Review (claude) of ff09c75

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.5 route assumes a compact manifold

   **Location.** `README.md` line 713 (§8.5): "let L ≥ 1 bound the Lipschitz constants of the maps g^s
   with |s| ≤ r₀ (g is C¹ and M compact)".

   **Claim.** M is compact in §8.5.

   **Witness.** Line 624: "M is Hausdorff and σ-compact, compact only where stated"; §8.5 does not
   state it, and `Suggested.lean` line 475 sits in a section with `[SigmaCompactSpace M]` and no
   `CompactSpace M`. Example: a hyperbolic periodic orbit of a flow on ℝ/ℤ × ℝ² (§8.3, fifth Check).

   **Repair.** Replace "(g is C¹ and M compact)" by "on a compact neighbourhood N of Λ containing the
   plaques of radius r₀ (g is C¹, so (s, x) ↦ Dg^s_x is bounded on [−r₀, r₀] × N; at truncated
   distances above a fixed ρ₀ > 0 the constant 1/ρ₀ serves)". Tested: for d(a, b) < ρ₀ the derivative
   bound L₀ gives d(g^s a, g^s b) ≤ L₀ d(a, b); for d(a, b) ≥ ρ₀, d(g^s a, g^s b) ≤ 1 ≤ d(a, b)/ρ₀; so
   L = max(L₀, 1/ρ₀) works with N compact and M not.

2. **F02** (P3) §10.1 route: contraction does not cover the backward times

   **Location.** `README.md` line 835 (§10.1, last API item): "Then y = g^v y' with |v| ≤ r and y' in
   the strong stable plaque of z, so y ∈ W^s_(g^v z)(ε) for r small by §8.3's contraction".

   **Claim.** §8.3's contraction on the plaque gives d(g^t y, g^t g^v z) ≤ ε for all t ≥ 0.

   **Witness.** For v < 0 and 0 ≤ t < −v, d(g^t y, g^t g^v z) = d(g^(t+v) y', g^(t+v) z) with
   t + v < 0: a backward time for y', where the plaque contraction says nothing. This is the gap
   repaired in §8.5 (line 713) and §6.5 (line 445).

   **Repair.** Replace "for r small by §8.3's contraction" by "for r small: for t + v ≥ 0 by §8.3's
   contraction, d(g^(t+v) y', g^(t+v) z) ≤ C'Kr, and for the backward times t + v ∈ [v, 0) by the
   Lipschitz bound L of §8.5 for the maps g^s, |s| ≤ r₀, d(g^(t+v) y', g^(t+v) z) ≤ LKr; take
   r ≤ ε/(K max(C', L))". Tested on the Sol suspension of the cat map: at v = −r the stable
   half-width of y' at height s is seen at height s − r multiplied by e^(ar) ≤ L = e^(ar₀), inside ε.

3. **F03** (P3) §7.6 route leaves the flow direction without a norm

   **Location.** `README.md` line 592 (§7.6): "define the new norm on E^s by the series … (for flows,
   the integral …), similarly on E^u backward, with E^s and E^u declared orthogonal".

   **Claim.** This defines an inner product on T_xM for x ∈ Λ, to be extended to M.

   **Witness.** For a flow, T_xM = E^s_x ⊕ ℝX(x) ⊕ E^u_x (§7.2). On the periodic orbit of the
   constant-roof suspension of diag(2, 1/2) (§7.2, second Check) the recipe gives no value to |∂_t|, so
   there is no inner product to extend.

   **Repair.** After "declared orthogonal" add: "; for a flow, ℝX(x) is declared orthogonal to both
   and keeps the original norm, which is continuous on Λ because X is". Tested on the witness: the
   norm is the Euclidean one on the two axes and |∂_t| = 1; the statement constrains E^s and E^u only,
   so the bounds e^(−κ't) are unchanged (∫ shifted by t gives the factor e^(−2κ't), computed in the
   table).

4. **F04** (P3) §8.6(a): the diameter bound omits K

   **Location.** `README.md` line 727 (§8.6): "the images of the plaques, whose diameters are at most
   2C'λ'^(pk)r₀ → 0".

   **Claim.** diam f^(pk)(𝒲^s_r₀(y)) ≤ 2C'λ'^(pk) r₀.

   **Witness.** §8.2 (line 642) gives 𝒲^s_r₀(y) ⊆ W^s_(Kr₀)(y), so the plaque has diameter at most
   2Kr₀, and d(f^n a, f^n b) ≤ C'λ'^n d(a, b) gives 2C'Kλ'^(pk) r₀. Part (b), line 729, keeps the
   factor: "L·C'e^(−κ't)·Kr₀".

   **Repair.** Replace "2C'λ'^(pk)r₀" by "2C'Kλ'^(pk)r₀ (the plaque lies in W^s_(Kr₀)(y), §8.2)".
   Tested: the bound still tends to 0, so K has at most m points as before.

Four findings, all P3 and all in proof routes of `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`;
none blocks, and no statement, Check or declaration of `Suggested.lean` is affected. The three
findings of round 4 are repaired. R01 is in a passage the last repair added; R02 is the pattern of
the round-4 finding F02 found again in §10.1; R03 and R04 are in the sampled targets §7.6 and §8.6.

## Round 4 findings, checked

- **F01 (§6.5, bracket equivariance) — repaired.** Line 443 now reads "g^t[x, z] = [g^t x, g^t z]
  and v(g^t x, g^t z) = v(x, z) whenever d(g^s x, g^s z) < e(δ) for every s between 0 and t", under
  4δ ≤ δ*, 2δ ≤ δ₀, e(δ) ≤ e(2δ). Proof recomputed (table). The new Check (line 453) recomputed.
- **F02 (§6.5, bracket in W^cs) — repaired.** Line 445 now reads "there is e'(δ) ∈ (0, e(δ)] such
  that w ∈ W^cs_δ(x) whenever d(x, z) < e'(δ)". The new Check (line 454) recomputed. The same repair
  was carried to §8.5's route, which is where R01 arises; the pattern remains in §10.1 (R02).
- **F03 (§1.1 locator) — repaired.** Line 146 cites "ClimenhagaThompson2016, lines 1687–1688, for
  the definition on a compact metric space" and "lines 355–358, where compactness is noted".
  ClimenhagaThompson2016 line 1688 is (5.7), line 1595 the compact setting, line 358 the remark.

Maintainer notes: none were left.

## Adversarial table

"R" is `README.md`, "L" is `Suggested.lean`. Values computed in this review.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §6.5 API 1, single point (R443, repaired) | two points w, w′ of the intersection | d(g^t w, g^t w′) ≤ 2δ ≤ δ* for all real t, → 0 both ways; (F3) at g^T w: d(w, w′) ≤ ce^(−κT)·2δ → 0 | holds | none |
| §6.5 API 1, equivariance (repaired) | step τ > 0, τ < 0; cat suspension k = 6 | forward part free for τ ≥ 0, backward part ≤ 2δ for small \|τ\|; both shifts in [−2δ, 2δ], unique since d < e(δ) ≤ e(2δ) and 2δ ≤ δ₀; points equal since 4δ ≤ δ*; witness excluded at time 3 | holds | none |
| §6.5 Check, Fibonacci family (R453, new) | k = 6, n = (13, 8) | √(1+φ²) = 1.9021; n·e_v = −φ⁻⁶/1.9021 = −0.0293; \|y\| = φ⁻⁵/1.9021 = 0.0474; A³y = (0.7236, 0.4472), nearest lattice point (1, 0) at 0.5257; 2h = 0.5257e^(−0.9624h) at h = 0.214, value 0.428; other heights cost ≥ 1 | correct | none |
| §6.5 Check, two stable sets (R454, new) | δ = 0.1, v = 0.1 | (2/a) sinh(aδ/2) = 2.0781 · 0.048139 = 0.10004; ratio e^(0.09624) = 1.101; d = (2/a) asinh(aℓ_h/2) is the horocycle chord of curvature −a² | correct | none |
| §6.5 API 3 (R445, repaired) | v ≤ 0; v > 0 | v ≤ 0: t − v ≥ 0, defining bound; v > 0: times u = v − t ∈ (0, δ], small by continuity of bracket and v | holds | none |
| §8.5 route (R713, repaired; sampled) | v < 0, y ∈ 𝒲^s_r(x) | Kr ≤ δ/L; t + v ≥ 0: ≤ δ/L; t + v < 0: ≤ L·δ/L = δ; \|v\| ≤ r ≤ δ; L needs compactness of a neighbourhood, not of M | holds; parenthesis wrong | R01 |
| §8.5 Checks (sampled), L475 | cat suspension; c = (4/5, 3/5) | (2.618 + 1)/4 = 0.9045 < 1; Ac = (2.2, 1.4) ≡ (0.2, 0.4), A(0.2, 0.4) = (0.8, 0.6); both √0.2 = 0.447 > 1/4 from ℤ² | correct | none |
| §10.1 API 6 route (sampled) | v ≥ 0; v < 0 | v ≥ 0: C'Kr; v < 0, t < −v: time t + v < 0, not covered by contraction | route incomplete | R02 |
| §10.1 Checks (sampled), L517 | r′ = −sin(2πr)/(2π); U = {\|r\| < 1/2} | linearisation −r at 0, +x at 1/2; g^t(U) = U so ∩ = U ≠ Λ; U = {\|r\| < 1/4} gives Λ | correct | none |
| §10.1 API 2 (sampled) | n < 0, period q | p ∈ f^(kq+n)(U) ∩ V, kq + n ≥ 0 for k ≥ −n/q | holds | none |
| §7.6 (sampled) | series; integral; Jordan block; flow direction | \|Dfv\|′² = λ′² Σ_(n≥1) λ′^(−2n)\|Df^n v\|² ≤ λ′²\|v\|′²; \|Dg^t v\|′² = e^(−2κ′t) ∫_t^∞ ≤ e^(−2κ′t)\|v\|′²; 2a² + b² = 0.515625, σ² = 0.320799, σ = 0.5664 = ((65/64)^(1/2) + 1/8)/2; ℝX has no norm | statement holds; route gap | R03 |
| §7.3 (sampled) | metric ×4; Gram (2 1; 1 1) | K₁ = 2, K₂ = 1/2; eigenvalues (3 ± √5)/2 with product 1, K₁K₂ = 2.618; new\|Df^n v\| ≤ K₁Cλ^n old\|v\| ≤ K₁K₂Cλ^n new\|v\| | holds | none |
| §8.6 (sampled) | (a) m plaques; (b) chain | plaque diameter ≤ 2Kr₀ by §8.2, image ≤ 2C′Kλ′^(pk)r₀; (b): d(g^v g^t z, g^v g^t y_i) ≤ L·C′e^(−κ′t)·Kr₀ | holds; constant in (a) | R04 |
| §8.7 (sampled) | cat map, α = 1 | L = λ⁻¹: θ = log λ⁻¹/(2 log λ⁻¹) = 1/2; balance L^(nα)d^α = λ^n gives the exponent; θ < α since L > 1 | holds | none |
| §8.3 (sampled) | neutral block; c ∉ ℤ | \|Dg^t X\| = \|X\| = 1 gives λ = 1 < μ = e^κ′; e^(3a) = 17.9 > e^a = 2.618; g^c fixes no point, so v = 0 forced for r₀ < τ_Λ = 1 | holds | none |
| §1.1 (sampled) | doubling map; two-shift; ℚ | half-widths 1/8, 1/16; d(T^k0, T^ky) = 2^(−k−1), d(T⁻¹0, T⁻¹y) = 1; [−1, 1] ∩ ℚ not compact | holds | none |
| §4.1 (sampled) | F = c, a = 2; t^(1/3) | (aF)₁ along g_a = ∫₀^a F = F_a; 2h + c against 2h + 2c; free energy t·(h + ∫F); quotient t^(−2/3) | holds | none |
| §5.1 (sampled), L157 | t ≤ T₀; scale 2 on the two-shift; suspension | exponent change −(T₀ − t)P + ∫_t^(T₀)φ ≥ −T₀(\|P\| + max\|φ\|), stated constant e^(2T₀(…)) weaker; μ(B_n(x, 1)) = 2⁻ⁿ, product 1; at ε = 2 product 2ⁿ; cylinder 2^(−(t+2m+1)) · 2^t constant, opposite sign 4^(−t) | holds | none |
| §6.4 (sampled) | geometric sums; φ = 1/m | Σ_k C(cλ^kδ)^θ ≤ C(cδ)^θ/(1 − λ^θ), twice; T^k y has its 1 at n + m − k ≥ m + 1, distance < 2^(−m); sum 1/(m+1) + ⋯ + 1/(n+m) unbounded | holds | none |
| §6.7 (sampled) | y ∈ B_t(x, ε), z = [x, y] | 2\|v\| max\|φ\| ≤ 2δ max\|φ\|; d(g^s z, g^s y) ≤ δ + ω(δ) + ε ≤ δ* on [0, t], so (F3) applies backward from time t | holds | none |
| §10.3 (sampled), L557 | periodic orbit; coboundary; rescaling | T = kp + r: exponent in [−2p max\|F\|, 2p max\|F\|]; pressure shifts by c = 5; `ψ t x = ϕ (a t) x` with `a • F` is §4.1's g_a | holds | none |
| §11.3 (sampled) | b = 0.1 | (1 + b²e^(−4aT))^(1/2)/(1 + b²)^(1/2) → 0.99504 < e^(−0.001) | Check correct | none |
| §11.5 (sampled) | δ = 1/(3.9m), ε = 1.01δ | spacing 3.9δ ≥ 2δ; gaps 1.95δ < 2δ; (3.8025 + 1.0201)^(1/2) = 2.196 > 2.01 | Check correct | none |
| §11.6, L668, L686 | circle flow (E^u = 0); z, x, y | empty basis: Gram determinants 1, λ_t = 1, φ^u = 0, μ⁺ the time measure, every point generic; √5 ε = 2.236ε ≤ 3ε | holds | none |
| §8.1 headline, L406 | K = ⊥; K = ⊤ | K = ⊥: graph {0}, (ii) empty, (iii) hypothesis fails at L = 0 for z = 0 and for large L otherwise since ν > ρ′; K = ⊤: box = ball, graph = ball | holds | none |
| §5.2, §5.3 headlines, L211, L223 | swap of two points; one point; τ < 0 | ν(B_n) = 1/2, nP − S_nφ bounded; one point: product 1; negative τ gives empty `Icc 0 τ`, no witness for k ≥ 1 | holds | none |
| §10.4 toral headline, L617 | d = 0; d = 1 | empty matrix: det 1, no roots, Dirac = volume; ±1 has modulus 1, excluded | holds | none |
| gap:connection-map-jacobi-derivative | pins; RiemannianGeometry on main | R2 has `exists_jacobi_initial_data` (line 1509), no connection map or derivative of the geodesic flow | precise, minimal | none |

## Verified sound

- **Principles.** No route-specific shortcut, no re-planned roadmap, no algorithm, no sorry'd data,
  no `set_option`, no `lemma`, `#eval`, `#print` or `#check`. No process word, pull-request number,
  LaTeX delimiter, HTML anchor or machine path in the four files (searched).
- **Dependency check** (output): `depcheck: 242 roadmaps, 2264 edges, 0 problem(s)`; no UPWARD,
  CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0, 15
  warnings, all `declaration uses sorry` (lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557,
  591, 601, 617, 668, 686). Imports: `import Mathlib` and
  `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`, used for `TauCeti.riemannianVolume`.
- **Padding.** One-tactic probe on all 15 theorems on a scratch copy (`rfl`, `trivial`,
  `infer_instance`, `simp`, `simp_all` after `intros`, `assumption`, `constructor` then `simp_all`,
  anonymous constructor with `rfl`, `aesop`): 15 errors, none closes.
- **Headline theorems.** Stated: upper semicontinuity of entropy for expansive flows (L194); Bowen's
  criterion under weak specification for maps and flows (L211, L223); the abstract uniqueness
  theorems (L286, L302); Hadamard–Perron (L406); local product structure (L464, L475); Bowen's
  theorem (L539); Bowen–Ruelle with constants, coboundaries, time-t maps and rescaling (L557);
  positive entropy and Haar measure as Bowen's measure (L591, L601, L617); the SRB theorem and its
  Anosov case (L668, L686). The docstring names the two not stated (local manifolds, geodesic flow)
  with the missing carrier.
- **Signatures.** The elaborated types of the 50 declarations were compared with the README. The
  nine "dropped binder" leads are instances a definition's body does not use (`MeasurableSpace` on
  seven supplied notions, `FiniteDimensional` on `hadamardPerronGraph` and `flowUnstableSubspace`);
  every theorem keeps `CompactSpace`, `Nonempty`, `BorelSpace`, `SigmaCompactSpace`,
  `IsContMDiffRiemannianBundle` where the README has them. The entry `of` is a docstring artefact.
- **Names.** All 50 Lean names occur in the README, and every backticked name of this roadmap's own
  is declared. 97 library names resolved at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), each
  in the file the README gives, for instance `Dynamics.IsDynNetIn` (`NetEntropy.lean` line 69),
  `Flow.restrict` (`Flow.lean` line 178), `Flow.reverse` (line 335), `Flow.restrictNonneg` (line
  241), `Continuous.inner_bundle` (`Topology/VectorBundle/Riemannian.lean` line 128),
  `ContMDiff.iff_comp_isImmersion` (`Immersion.lean` line 995), `AddCircle.instIsManifold`
  (`Instances/AddCircle.lean` line 258), `TauCeti.isSmoothEmbedding_coe_sphereBundle`
  (`Sphere.lean` line 181), `TauCeti.finiteGrassmannian.graphChart` (`Graph.lean` line 240),
  `SmoothPartitionOfUnity.exists_isSubordinate` (`Geometry/Manifold/PartitionOfUnity.lean` line
  366, hypotheses `T2Space`, `SigmaCompactSpace`). All 65 cited paths exist.
- **Suppliers resolved now.** ClassicalErgodicTheory at its open head `e3c5108` (a pull request
  adding the folder): Conventions "Separated sets and Bowen balls" (line 171), §§0.3, 1.4, 3.4,
  5.1–5.5, 6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4–8.5 under those numbers; `IsExpansive` (line 1706),
  `IsTopologicallyMixing` (1675), `IsGibbsMeasure` (2220), `HasSpecification` (2210),
  `HasFlowSpecification` (2304), `IsMeasureOfMaximalEntropy` (2076), `toralEndomorphism` (434). Of
  the 16 restated definitions, 14 are identical to its Lean file, `flowInvariantProbabilities` is
  its ℝ-case and `IsGibbsMeasure` matches its README; the namespaces differ, so no fully qualified
  name is shared. GeometryOfNumbersAndQuadraticArithmetic §4.2 (open head, line 1361).
  ArithmeticDynamics §2.7 (open head, line 2549), §§2.67–2.92 (2.90 and 2.92 are the
  maximal-entropy targets). On main (`51d880d`): ProbabilisticAndMetricNumberTheory §4.1 (lines
  4650, 4692); GeometricCurrents G6 (lines 668–681); GeneralizedCohomology G4.0b (line 1082, real
  carriers at lines 1149–1151); RiemannianGeometry R2 (line 1509), R4.1 (line 2277);
  OperatorAlgebraDynamics D9; HeegaardFloer §1.0a.
- **Overlap facts.** No other pull request changes this roadmap, no cited id is dropped, the
  package drops none. The lead "GeneralizedCohomology §G4.0b only in an open revision" is refuted:
  main defines it at line 1082 of its README.
- **Duplication by object.** ClassicalErgodicTheory's scope (lines 69–74) excludes uniformly
  hyperbolic dynamics, stable manifolds and SRB measures and names them for a consumer; its only
  touch is Bowen's entropy-expansive theorem as a route (line 1713). No other open head or roadmap
  on main states hyperbolic sets, weak specification, Hadamard–Perron or the SRB theorem (searched
  with the roadmap search tools at the 454 heads).
- **Sources: fifteen sampled targets.** BowenRuelle1975 lines 10–34, 92–108, 163–165, 190–201,
  213–222, 272–277, 346–413, 421–472, 643–676, 681–738 (§§1.1, 4.1, 5.1, 6.7, 7.3, 7.6, 8.3, 8.5,
  8.7, 10.1, 10.3, 11.3, 11.5): every locator at its lines, including "t ≥ t₀" at line 19, r = 1
  in Lemma A.2, the radii δ/2 and δ + ε at lines 386–390. ClimenhagaThompson2016 lines 170–177,
  341–342, 355–362, 945, 1251–1253, 1595, 1687–1690 (§§1.1, 5.1, 6.4, 6.7). TsujiiZhang2023 lines
  106–109, 485–495 (§10.3). Smale1967 line 381. ClimenhagaPesin2016 lines 1822–1855 (headline
  §8.1). The author flagged no locator as unverified. `sources.toml` records all 18 cited works and
  no local path.
- **Shape.** Eleven layers, each with `### Examples` and `### Dependencies`; every definition has
  its API and at least three Checks; no layer is named after a source's chapter.
- **Declared gap.** `gap:connection-map-jacobi-derivative` is stated under RiemannianGeometry with
  the plan's slug; precise and minimal.

Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, RiemannianGeometry (MathematicalBilliards, ManifoldOptimization, LorentzianGeometry and DimerModelsAndLozengeTilings searched by object; Surfaces is not a folder on main); pressure, equilibrium states, Gibbs measures, the Bowen property, expansive homeomorphisms and flows, specification with periodic shadowing, toral endomorphisms: ClassicalErgodicTheory; weak specification, entropy-expansive maps, hyperbolic sets and everything built on them: this roadmap; measure entropy: GeometryOfNumbersAndQuadraticArithmetic; Shannon–McMillan–Breiman and ergodic decomposition: ArithmeticDynamics; Jacobi fields and Rauch comparison: RiemannianGeometry; nothing else shared.

Source independence: 31 passages compared with 5 sources (BowenRuelle1975, ClimenhagaThompson2016, TsujiiZhang2023, Smale1967, ClimenhagaPesin2016), none shared beyond formulas and axioms that can be written in one way; largest share BowenRuelle1975, 46 of 137 locators; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent, the roadmap has no layer for its symbolic dynamics and spreads its Sections 3–5 and Appendix over Layers 4, 5, 10 and 11, in an order the `*Needs:*` lines of §§11.2–11.6 force. KatokHasselblatt1995, FH2019 and Bowen1975 could not be read.

## Not verifiable

- KatokHasselblatt1995 (16 locators), FH2019 (9), Bowen1975 (3), BowenWalters1972 (2), Walters1982,
  Newhouse1989 and HirschPalisPughShub1970 are recorded as uncertified and cannot be read legally
  here. This covers the KatokHasselblatt1995 locators of the sampled §§7.3, 7.6, 8.7 and the
  FH2019 locators of §§8.3, 8.5.
- §6.6's closing lemma and weak specification for flows with (F2)–(F3) are this roadmap's
  abstraction of the smooth case; no readable source states them at this generality. They were
  checked on the examples of the Checks only.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at §2.5, the sentence after (2.12), printed page 8: the source writes the two-sided set as an intersection of flow images of closed Bowen balls of order 2t centred at x; it should be centred at the point f_(−t)x; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps for nonpositive indices only yet indexes the family of graphs by all integers, and clause (iii) uses inverses not assumed to exist; it should index consistently and use backward sequences; affects a stated result.

## For the human reviewers

- **Plan gap no longer used.** `design/plan.json` lists the gap `sphere-bundle-embedding` (supplier TangentialBordism §2.3); `README.md` neither declares nor uses it: §9.3 cites `ContMDiff.iff_comp_isImmersion` and `TauCeti.isSmoothEmbedding_coe_sphereBundle`, both at the pins.
- **Not tested.** KatokHasselblatt1995, FH2019 and Bowen1975 (28 of 137 locators together) could not be read; wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ff09c75f67aa01a2d7c59dbb24ad3db20d6e949c", "job": "REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~5", "model": "fable", "worker": "chris-x79"} -->
