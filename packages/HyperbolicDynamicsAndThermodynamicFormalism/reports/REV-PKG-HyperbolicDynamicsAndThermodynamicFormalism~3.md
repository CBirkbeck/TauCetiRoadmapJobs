<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6904583929 -->
Review (claude) of 1c5249a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §2.2: "specification implies weak specification" fails on the empty space

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md` line 229 (§2.2,
   first API bullet): "ClassicalErgodicTheory's specification with periodic shadowing
   (`HasSpecification`, §8.4; `HasFlowSpecification`, §8.5) implies weak specification". The definition
   is at line 225 and in `Suggested.lean` lines 175–178 and 182–185.

   **Claim.** For every homeomorphism (flow) of a compact metric space, ClassicalErgodicTheory's
   specification implies `HasWeakSpecification` (`HasFlowWeakSpecification`).

   **Witness.** X = ∅. `HasWeakSpecification` quantifies over `k : ℕ`, and at k = 0 it asks for a point
   `y : X`: false on ∅. ClassicalErgodicTheory's `HasSpecification` (its `Suggested.lean` line 773)
   only produces a point after `i₀ : Fin k` and `x : Fin k → X`: true on ∅, vacuously. A scratch file
   with both definitions copied proves `HasSpecification (Homeomorph.refl Empty)` and
   `¬ HasWeakSpecification (Homeomorph.refl Empty)` at the pins, with no error. The flow definitions
   behave the same way.

   No theorem is affected: §§5.2, 5.3, 6.8, 10.2 and 10.3 assume a nonempty space. The second bullet
   of §2.2 already says "of a nonempty system".

   **Repair.**

   1. `README.md` line 225, after "Strong specification asks that all gluing times equal τ.", add:
      "The list may be empty (k = 0), and then the definition asks only for a point y; so the empty
      space has no weak specification, and a nonempty space satisfies the case k = 0 trivially."
   2. `README.md` line 229, replace the sentence that begins "ClassicalErgodicTheory's specification
      with periodic shadowing" by: "On a nonempty space, ClassicalErgodicTheory's specification with
      periodic shadowing (`HasSpecification`, §8.4; `HasFlowSpecification`, §8.5) implies weak
      specification: given orbit segments, move their starting points by inverse iterates so that
      consecutive segments are separated by the constant M of that property at a scale below δ, a
      segment of length 0 being shadowed as one of length 1; the shadowing point then glues them with
      gluing times at most max(M, 1), and its periodicity is not used."
   3. Add to the Checks of §2.2: "Nonemptiness is needed for the comparison: on the empty space
      ClassicalErgodicTheory's specification holds vacuously, there being no point and no segment,
      while weak specification fails, the empty list of segments having no shadowing point."

   Tested on the witness: with X nonempty, k = 0 is met by any point. For k ≥ 1 take the intervals
   `[a_j, b_j]` with `b_j = a_j + max(n_j, 1) − 1` and `a_(j+1) = b_j + max(M, 1)`. The gap condition
   `b_j + M ≤ a_(j+1)` holds, and the gluing time `a_(j+1) − a_j − n_j` is `max(M, 1) − 1` for
   `n_j ≥ 1` and `max(M, 1)` for `n_j = 0`. The empty space fails the new hypothesis. No change to
   `Suggested.lean` is needed: its definitions are the README's, and no theorem there states the
   implication.

One finding (P2). The three findings of round 2 are repaired, the file elaborates with `sorry` as
the only warning, every sampled locator matches its text, no theorem is padding, and the dependency
check is clean. The remaining defect is a degenerate case: one API bullet of §2.2 is false on the
empty space for the definition that `Suggested.lean` declares.

## Round 2 findings, checked one by one

- **F01 (a declared gap asked for what the pins give) — repaired in the README; a plan entry
  remains.** "From Mathlib" now has "`ContMDiff.iff_comp_isImmersion`
  (`Mathlib/Geometry/Manifold/Immersion.lean`): for a C^n immersion φ : N → N', a map f : M → N is
  C^n iff it is continuous and φ ∘ f is C^n." §9.3 reads "is smooth into SM, because the inclusion
  of SM is a smooth immersion and a continuous map into SM is smooth as soon as its composite with
  that immersion is". The TangentialBordism subsection, its gap line and every other mention are
  gone from `README.md` and `Suggested.lean`. The declaration is at the pin (line 995 of that
  file), `Manifold.IsSmoothEmbedding` at `SmoothEmbedding.lean` line 70, and
  `TauCeti.isSmoothEmbedding_coe_sphereBundle` at `Sphere.lean` line 181. `design/plan.json` still
  lists the gap `sphere-bundle-embedding`; the repair report explains that the gate refuses its
  removal while plan target 9.3 names it. That reason holds (the package may only add gaps), so
  this is settled here and passed to the human reviewers below.
- **F02 (§8.4, iterates need an invariant set) — repaired.** "if moreover f(Λ) = Λ, it is locally
  maximal for f^k, k ≥ 1, with the isolating neighbourhood U ∩ f(U) ∩ ⋯ ∩ f^(k−1)(U), which
  contains Λ = f^j(Λ) ⊆ f^j(U) for 0 ≤ j < k". The Check with f = −Id was added.
- **F03 (§8.5, missing hypothesis) — repaired.** "A nonempty hyperbolic set Λ of a C¹ flow g (§7.2)
  is not a hyperbolic set of the diffeomorphism g^t", followed by the counterexample of the linear
  field (x, −y).

Patterns searched in the rest of the package. Gaps or supplier requests that the pins already
meet: none (the one remaining gap is checked below). Statements about arbitrary sets that need
invariance: §8.4's first bullet, §8.5's first two bullets and the f⁻¹ and conjugation clauses hold
for every set; §8.5's time-t bullet says "for an invariant Λ". "Not hyperbolic" sentences: §7.7
assumes an Anosov flow on a nonempty compact manifold, where the generator has no zero.

Maintainer notes: none were left.

## Adversarial table

Values computed in this review. "L" is `Suggested.lean`, "R" is `README.md`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.2 API 1, specification ⇒ weak specification (R229; L175, L182) | X = ∅; X nonempty with k = 0; n_j = 0; M = 0 | ∅: supplier's property true (no `i₀ : Fin 0`, no `x : Fin k → ∅`), weak specification false (k = 0 needs y); scratch Lean file proves both. Nonempty: gluing time max(M,1) − 1 or max(M,1) | false on ∅ | R01 |
| §2.2 definition against the source (sampled); L175 | start of segment j | L: Σ_(l<j)(n_l + g_l); source: N_(j−1) + τ_(j−1) with N_j = Σ_(i≤j) n_i + Σ_(i<j) τ_i | equal | none |
| §2.2 API 4, long segments suffice | segment of length t < T₀ | extend to length T₀; the extra T₀ − t joins the gluing time, bound τ + T₀, same δ | holds | none |
| §8.4 iterate clause, as repaired (R670) | k = 2, times 3 and −3; f = −Id | 3 = 2·2 − 1, −3 = 2·(−1) − 1; −Id: f(Λ) = {(−1,0)} ≠ Λ, U ∩ f(U) = ∅ (centres 2 apart, radii sum 1) | holds with f(Λ) = Λ | none |
| §8.5 repaired sentence and its counterexample (R699) | field (x, −y) at {0}; cat suspension orbit | orbits (xe^t, ye^(−t)) bounded for all t only at 0; g^1 = diag(2.718, 0.368); in the suspension ‖Dg^n ∂_s‖ = 1 for all n | holds | none |
| §9.3 corestriction, as repaired (R792) | F = flow ∘ (id × inclusion) into TM | pinned statement: `CMDiff n f ↔ Continuous f ∧ CMDiff n (φ ∘ f)`; the inclusion is an embedding, so the corestriction is continuous | holds | none |
| §1.3 (sampled) | reversed flow; rescaling a; identity flow of a finite set; circle of fixed points | s'(t) = −s(−t), y = g^u x = g'^(−u) x; u/a < η for η' = aη; ε below least distance forces y = x; d(x, y) constant < ε with y ≠ x | holds | none |
| §1.3 item 3 | two-sided set for (g^t, d_t) | d_t(g^(nt)x, g^(nt)y) ≤ ε for all n ∈ ℤ iff d(g^s x, g^s y) ≤ ε for all s | sets equal | none |
| §4.1 (sampled) | F = c, a = 2; period-1 orbit; conjugacy s ↦ s^(1/3) | time-one average of aF along g_a is ∫₀^a F = F_a; 2h + 2c against 2h + c; point masses in ES for g¹ = Id, not in M(g); difference quotient t^(−2/3) | holds | none |
| §5.1 (sampled); L157 | t ≤ T₀; t = 0; two-shift at ε = 1 and ε = 2 | loss e^(T₀(∣P∣ + max∣φ∣)) ≤ stated e^(2T₀(…)); t = 0 gives ν(B(x, ε)) ≥ K⁻¹; 2⁻ⁿ·2ⁿ = 1 and 1·2ⁿ | holds | none |
| §6.2 (sampled) | isolated point p; two-shift at β = 1 and 1/4; monotone shift | f^n p = f⁻¹p gives f^(n+1)p = p; δ* = 1/2 (δ = 1 makes W^s everything), 2β = 1/2; bracket of nondecreasing sequences is nondecreasing since z₋₁ ≤ z₀ = x₀ | holds; forward time needed | none |
| §6.8 (sampled); L286, L302 | swap; monotone shift | finite X, left disjunct; n + 1 words, entropy 0, two point masses both maximal | holds; `htrans` is forward | none |
| §7.1 (sampled); L329 | diag(2, 1/2); diag(2, 1); identity; dimension 0 | C = 1, λ = 1/2; eigenvalue 1 fixes a vector; ‖Dfⁿv‖ = ‖v‖ forces T_xM = 0; a point is hyperbolic | definition discriminates | none |
| §7.3 Check 2 (neighbour of 7.1) | Gram (2 1; 1 1) | eigenvalues 2.618 and 0.382, product 1; K₁K₂ = (2.618/0.382)^(1/2) = 2.618 | Check correct | none |
| §7.5 (sampled) | limit of v_k ∈ E^s; diag(1 + t, 1/(1 + t)) | ‖Dfⁿv‖ ≤ Cλⁿ‖v‖ passes to the limit; both dimensions upper semicontinuous with constant sum; rate 1/(1 + t) → 1 | holds; uniform constants needed | none |
| §7.6 Check 3 | J = (1/2 1; 0 1/2), D = diag(1/8, 1) | 2ⁿ‖Jⁿ(0,1)‖ = (4n² + 1)^(1/2); norm of (1/2 1/8; 0 1/2) = (1.00778 + 0.125)/2 = 0.566 ≤ 0.75 | Check correct | none |
| §8.1 headline; L406 | cone step; K = ⊥; K = ⊤; z = 0 in (iii) | δ(1 + γ)² ≤ γ(μ − λ) follows from the source's choice of δ₀ since λ ≥ 0; K = ⊥: graph {0}, (i) reads f_n(0) = 0; K = ⊤: box is the r₀-ball; z = 0 fails the strict bound at L = 0 and is on the graph | holds | none |
| §8.4 theorem (sampled); L464 | Λ = ∅; large δ | (A2), (A3) vacuous on ∅; W^s_δ' ⊆ W^s_δ for δ' ≤ δ, so small scales suffice | holds | none |
| §8.5 Check 2 | c = (4/5, 3/5) | Ac ≡ (1/5, 2/5), A(1/5, 2/5) = (4/5, 3/5); both at distance 0.447 > 0.25 from 0 | Check correct | none |
| §9.1 (sampled); L617 | cat matrix; d = 0 | eigenvector slope λ − 2 = 0.618; log 2.618 = 0.9624; d = 0: det 1, no roots, pressure 0, the one probability is volume | holds | none |
| §9.2 (sampled) | roof integral; c = 2 > R = 1; identification at s = 0, 1 | ∫₀¹ (c + (R − c)ρ) ds = R; 2 − ρ(s) vanishes where ρ = 2; h = 1/c near both ends, so h is well defined | holds; c < min R needed | none |
| §10.3 (sampled); L557 | periodic orbit, T = kp + r | −TP + ∫₀ᵀF = ∫₀^r F − rP ∈ [−2p max∣F∣, 2p max∣F∣]; t-clause quantifies over flow-invariant ν′ as §4.1 requires | holds | none |
| §10.4 (sampled); L591, L601 | periodic orbit; hyperbolic fixed point | left disjuncts hold with entropy 0 | exceptions needed and stated | none |
| §11.2 (sampled) | q = 1, dim M = 3; chart change (A B; C D) | image of graph L is graph (C + DL)(A + BL)⁻¹; e_u + b e_v + c e_s ↦ e_u + be^(−2aT) e_v + ce^(−aT) e_s; 3 + 1 + 1 = 5 = 3 + 1·2 | holds | none |
| §11.5 (sampled) | δ = 1/(3.9m), ε = 1.01δ | disjoint closed balls of radius δ/3 inside B_Λ(ε, T) for δ ≤ 3ε; (1.95² + 1.01²)^(1/2) = 2.196 > 2.01; cover radius 2δ + ε = 3.01δ | holds; radius 2δ + ε needed | none |
| §2.1 API 3 (flow mixing iff a time-t map is) | offsets r ∈ [0, t] | W_i ⊆ g^r(U) for r in a short interval J_i; finitely many J_i cover [0, t]; n ≥ max N_i | holds | none |
| §3.1 headline; L194 | X = ∅; g¹-ergodic μ not flow invariant | no probability on ∅; two-sided sets lie in orbit segments for every x, so the source's theorem applies to every g¹-ergodic μ | holds | none |
| §§5.2–5.3 headlines; L211, L223 | cyclic permutation of k points | ν(B_n) = 1/k, S_nφ − nP bounded by periodicity | holds | none |
| §11.6 headlines; L668, L686 | absolutely continuous invariant ν | ν-almost every point is generic for μ⁺, so ∫u dν = ∫u dμ⁺ | holds | none |
| gap:connection-map-jacobi-derivative | both pins; RiemannianGeometry on main | "connection map", "Sasaki" occur only under `Riemannian/SL2Tilde/` (one further hit reads "Galois-connection maps"); R2 has Jacobi fields, no connection map | precise and minimal | none |

## Verified sound

- **Principles.** No route-specific shortcut, no re-planned roadmap, no algorithm, no sorry'd data,
  no `set_option`, no `lemma`, no `#eval`. No process residue, machine path, LaTeX delimiter or HTML
  anchor in `README.md`, `Suggested.lean`, `sources.toml` or `metadata.toml`.
- **Dependency check** (output): `depcheck: 235 roadmaps, 2231 edges, 0 problem(s)`. No UPWARD,
  CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: 15 warnings, all `declaration uses sorry`
  (lines 194, 211, 223, 286, 302, 406, 464, 475, 539, 557, 591, 601, 617, 668, 686), no error.
  Imports: `import Mathlib` and `TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume`, used
  for `TauCeti.riemannianVolume`.
- **Sources: all fifteen sampled targets, every readable locator found at its lines** (38 passages
  in 8 texts). §1.3: ClimenhagaThompson2016 lines 355–375, 380–381, 513–530;
  BowenEntropyExpansive1972 lines 117–135. §2.2: ClimenhagaThompson2016 lines 295–303, 448–463,
  1661–1669. §4.1: BowenRuelle1975 lines 190–199, 409–413. §5.1: BowenRuelle1975 lines 272–277;
  ClimenhagaThompson2016 lines 1251–1253. §6.2: BowenPeriodicPoints1971 lines 96–97, 101–104,
  171–200. §6.8: BowenPeriodicPoints1971 lines 421–426, 749–750. §7.1 and §9.1: Smale1967 lines
  381–473 (toral diffeomorphisms 387–417, Anosov diffeomorphisms 450–462);
  BowenGroupEndomorphisms1971 lines 313–316, 332–336. §7.5: BowenRuelle1975 line 13. §8.4:
  BowenPeriodicPoints1971 lines 73–80. §9.2: BowenRuelle1975 lines 60–61, 119–133. §10.3:
  BowenRuelle1975 lines 213–222, 272–277; TsujiiZhang2023 lines 106–109, 485–495. §10.4:
  BowenRuelle1975 lines 77–78, 324–325; BowenPeriodicPoints1971 line 667. §11.2: BowenRuelle1975
  lines 702–715. §11.5: BowenRuelle1975 lines 377–407. Also read: ClimenhagaThompson2016 lines
  140–147, 1717–1724, 1880–1887, 1908–1910, 1955, 1963–1965 (§§5.2–5.3) and ClimenhagaPesin2016
  lines 1822–1855 (§8.1). The author flagged no locator as unverified. `sources.toml` records all
  18 cited works, with no local path.
- **Suppliers resolved now.** ClassicalErgodicTheory at its open head (a pull request that adds the
  folder): Conventions "Separated sets and Bowen balls" (line 171), §§0.3, 1.4, 3.4, 5.1–5.5,
  6.1–6.2, 6.4, 7.1–7.3, 8.1–8.2, 8.4 (line 2206; `IsGibbsMeasure` line 2220) and 8.5 (line 2297).
  The definitions that `Suggested.lean` restates have the same bodies in its Lean file (lines 60,
  405–421, 554–578, 612, 720, 739, 782, 795, 810). GeometryOfNumbersAndQuadraticArithmetic §4.2
  (paragraph at line 1360 of its open head). ArithmeticDynamics §2.7 (line 2549; lines 2608, 2625).
  On main: ProbabilisticAndMetricNumberTheory §4.1 (lines 4650, 4692); GeometricCurrents G6 (line
  668); GeneralizedCohomology G4.0b (line 1082); RiemannianGeometry `exists_jacobi_initial_data`
  (line 1509) and `rauch_norm_ge_of_sectional_le` (line 2277). `roadmaps resolve`: no citation and
  no Lean name found nowhere.
- **Overlap facts.** No other pull request changes this roadmap, no cited id is dropped, the
  package drops no id. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision"
  is refuted: main's README defines G4.0b at line 1082.
- **Pinned names.** Mathlib `1b1ccf4`, Tau Ceti `2fd255d` (the revisions of `lake-manifest.json`).
  Every backticked name of the README resolves to a declaration at the pins or in
  `Suggested.lean`, except the nine the text attributes to ClassicalErgodicTheory,
  ProbabilisticAndMetricNumberTheory and RiemannianGeometry. The names added by the last repair
  were opened: `ContMDiff.iff_comp_isImmersion` (`Immersion.lean` line 995),
  `Manifold.IsSmoothEmbedding` (`SmoothEmbedding.lean` line 70), `ContMDiffMap.weakWhitneyTopology`
  (`ContMDiffMap/WeakWhitney/Basic.lean` line 108). All 51 names declared in `Suggested.lean`
  appear in the README.
- **Duplication by object.** Searched all open heads and main for hyperbolic sets, Anosov systems,
  weak specification, Hadamard–Perron, local product structure, SRB and Bowen–Margulis measures,
  entropy-expansive maps, stable manifold theorems and the Lean names: only ClassicalErgodicTheory's
  out-of-scope and consumer sentences (lines 69–74, 2437–2440) and its use of Bowen's
  entropy-expansive theorem inside §5.3. No `Suggested.lean` name here has the fully qualified name
  of a declaration elsewhere (the namespaces differ).
- **Headline theorems.** Bowen's criterion for homeomorphisms and flows (L211, L223); upper
  semicontinuity of entropy for expansive flows (L194); the abstract uniqueness theorems (L286,
  L302); the Hadamard–Perron theorem (L406); local product structure (L464, L475); Bowen's theorem
  (L539); the Bowen–Ruelle theorem with constants, flow coboundaries, time-t maps and rescaling
  (L557); positive entropy with the Bowen–Margulis and Bowen measures and Haar measure (L591, L601,
  L617); the SRB theorem and its Anosov case (L668, L686). The module docstring names the two not
  stated (local stable and unstable manifolds; the geodesic flow) with what each lacks.
- **Padding.** One-tactic probe on all 15 theorems on a scratch copy (`rfl`, `infer_instance`,
  `trivial`, `simp`, `simp_all` after `intros`, `constructor` then `simp`, `exact?`): none closes.
- **Signatures.** The elaborated types were compared with the README statements. The leads are
  section instances that a definition's body does not use (`MeasurableSpace`, `UniformSpace`,
  `FiniteDimensional`); the ninth is a parsing artefact of the module docstring. Nothing changed
  since round 2 except the docstring.
- **Shape.** Eleven layers, each ending with `### Examples` and `### Dependencies`; every
  definition has an API list and at least three Checks; `*Needs:*` lines are itemised. No layer is
  named after a source's chapter.

Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, RiemannianGeometry (MathematicalBilliards, Surfaces, ManifoldOptimization, LorentzianGeometry and SmoothBundlesConnections searched by object, no hit); pressure, equilibrium states, Gibbs measures, the Bowen property, expansive flows, specification with periodic shadowing and toral endomorphisms with their entropy: ClassicalErgodicTheory; Bowen's criterion under weak specification, entropy-expansive maps and the Anosov structure of toral automorphisms: this roadmap; measure entropy: GeometryOfNumbersAndQuadraticArithmetic; Shannon–McMillan–Breiman and ergodic decomposition: ArithmeticDynamics; Jacobi fields and Rauch comparison: RiemannianGeometry; nothing else shared.

Source independence: 38 passages compared with 8 sources (BowenRuelle1975, ClimenhagaThompson2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, BowenGroupEndomorphisms1971, Smale1967, TsujiiZhang2023, ClimenhagaPesin2016), none shared beyond formulas and statements of a dozen words that the mathematics forces; largest share BowenRuelle1975, 48 of 156 locators; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent, the roadmap has no layer for that paper's symbolic dynamics and spreads its Sections 3–5 and Appendix over Layers 4, 5, 10 and 11. KatokHasselblatt1995, FH2019 and Bowen1975 could not be read.

## Not verifiable

- KatokHasselblatt1995 (17 locators), FH2019 (10), Bowen1975 (4), Walters1982, BowenWalters1972,
  Newhouse1989 and HirschPalisPughShub1970 are recorded as uncertified: their texts are not
  readable legally here, so their locators and wording were not checked. This covers the
  KatokHasselblatt1995 locators of the sampled §§6.2, 7.1, 7.5, 8.4 and 9.2, the FH2019 locator of
  §9.2 and the Bowen1975 locator of §6.2.
- §6.6's abstract claim that a flow with (F2)–(F3) is Bowen–Walters expansive is this roadmap's own
  abstraction; no readable source states it at this generality. One candidate counterexample was
  tested (a suspension with wandering intervals: (F3) applied forward and then backward gives
  ∣I∣ ≤ c²e^(−2κn)∣I∣, so it fails (F3)); the proof was not written out in full.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at §2.5, the sentence after (2.12), printed page 8: the source writes the two-sided set as an intersection of flow images of closed Bowen balls of order 2t centred at x; it should be centred at the point f_(−t)x; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source gives the maps for nonpositive indices only yet indexes the family of graphs by all integers, and clause (iii) uses inverses not assumed to exist; it should index consistently and use backward sequences; affects a stated result.

## For the human reviewers

- **Plan gap no longer used.** `design/plan.json` still lists the gap `sphere-bundle-embedding` (supplier TangentialBordism §2.3); `README.md` no longer declares or uses it (§9.3 cites Mathlib's `ContMDiff.iff_comp_isImmersion`). Whether to withdraw its announcement is yours.
- **Not tested.** KatokHasselblatt1995, FH2019 and Bowen1975 (31 of 156 locators together) could not be read; wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1c5249a0c2b61c8be073e36a69f16b8c4d0c86cd", "job": "REV-PKG-HyperbolicDynamicsAndThermodynamicFormalism~3", "model": "fable", "worker": "chris-x30"} -->
