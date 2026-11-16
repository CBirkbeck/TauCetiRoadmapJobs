<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6908040205 -->
Red team round 2 pass a (claude) of dd92fd4

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §9.3 step (v) uses continuity in v that the gap contract does not state

   **Location.** `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md:798`: "L(v) = −Q_v⁻¹P_v for the blocks P_v, Q_v of D(g^1)_v … (gap:connection-map-jacobi-derivative), continuous in v … so ‖U(v)‖ ≤ B on the compact SM".

   **Claim.** The declared gap supplies the continuity of v ↦ (P_v, Q_v), from which the bound B follows by compactness.

   **Witness.** README:126 (and the plan's `needs`) asks for "the connection map K : T(TM) → TM", the splitting and the formula D(g^t)_v ξ = (J(t), D_tJ(t)), with no regularity of K. The blocks are read through K at v and at g^1 v; with K only a fibrewise map they need not vary continuously, and no other input of §9.3 bounds |D_tJ_1(0)| (the pinned convexity statements and R4.1 bound values, not this derivative).

   **Repair.** In README:126 replace "the connection map K : T(TM) → TM, the resulting splitting" by "the connection map K : T(TM) → TM, a smooth vector-bundle map over the projection TM → M, the resulting splitting". Tested on the instance: with K smooth and (t, v) ↦ g^t v smooth (pinned), v ↦ (P_v, Q_v) is continuous, Q_v is invertible, so v ↦ −Q_v⁻¹P_v is continuous and bounded on the compact SM; in curvature −1, L(v) = −coth(1)·Id, constant. The slug and the supplier do not change.

2. **F02** (P3) §6.3: "M(ε)-delayed specification" and the global unstable set are used undefined, and the fifth Check's M is off by one against the route

   **Location.** README:409–410: "C-dense (unstable sets of periodic points dense)" and "every M(ε)-delayed specification is ε-shadowed by a periodic point"; README:421: "by at least k + 2 steps of σ², so M = k + 2".

   **Claim.** The item is a stated target, and the Check computes its constant.

   **Witness.** "Delayed", "specification" (as a noun for a list of orbit pieces on time intervals) and the global set W^u(p) are terms of BowenPeriodicPoints1971 lines 105–106 and 155–163 that the README never defines (it defines only the local sets W^u_δ). The route (README:413) glues "so that the first time of each exceeds the last time of the previous one by M + 1 steps"; with that convention the minimal excess k + 2 computed in the Check is M = k + 1, not k + 2.

   **Repair.** README:409: replace "(unstable sets of periodic points dense)" by "(for every periodic point p the set W^u(p) = {y : d(f⁻ⁿy, f⁻ⁿp) → 0 as n → ∞} is dense)". README:410: replace the item by "for C-dense f and every ε > 0 there is M(ε) ∈ ℕ such that for all points x_1, …, x_k and integer intervals [a_1, b_1], …, [a_k, b_k] with a_(i+1) − b_i > M(ε) there is a periodic point y with d(f^n y, f^n x_i) < ε for n ∈ [a_i, b_i] and all i (strong specification with periodic shadowing points)". README:421: replace "so M = k + 2: the bound m(M + 2) = 2k + 8 covers 2k, while M + m = k + 4 is below 2k once k ≥ 5" by "so M = k + 1: the bound m(M + 2) = 2k + 6 covers 2k, while M + m = k + 3 is below 2k once k ≥ 4". Tested: at scale 2^(−k−1) the first σ²-segment fixes coordinates up to 2(L − 1) + k + 1 and the second from 2t₀ − k − 1, disjoint iff t₀ − (L − 1) ≥ k + 2, that is a_2 − b_1 > k + 1; k = 4: 2k = 8 ≤ 14, and k + 3 = 7 < 8.

Two P3 findings (S01, S02). No false statement, no unowned supplier, no upward dependency was found. Every round-1 finding is repaired at this head; one repair (1a/F01) extended the use of the declared gap beyond what its contract sentence states, which is S01.

## Round-1 findings at this head

| Finding | State | Witness at dd92fd4 |
|---|---|---|
| 1a/F01 (P1), §9.3 decay credited to R4.1 | repaired | `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md:798`: "The decay of stable fields is part of this target, by the following steps. (i) Convexity … (ii) Upper bound … (iii) Convergence … (iv) Uniqueness … (v) Derivative bound". R4.1 is now used only as a lower bound (steps iii, iv). Recomputed: K = −4, a = 1, T = 1, t = 1/2: 0.3240 ≤ 0.4434 ≤ 0.6065; R4.1 lower bound 2 sinh(1/2)/sinh 2 = 0.2873 (Check at :809 agrees). New issue: S01. |
| 1a/F02 (P3) and 1b/F01 (P2), Layer 9 in the module docstring | repaired (classification made explicit; §9.2(a) not stated) | `Suggested.lean:39–45`: "The other Anosov statements of README Layer 9 … are examples that check the definitions of README Layer 7 on explicit systems, not headline theorems, and are not stated". The README Summary (line 3) calls the three systems "the examples"; the docstring and the README now agree. Not re-raised. |
| 1a/F03 (P3), "f-invariant subset" | repaired | README:675: "iff every subset S ⊆ U with f(S) = S is contained in Λ … Forward invariance f(S) ⊆ S does not suffice (first Check)"; :671 "for Λ with f(Λ) = Λ"; :703 "g^t(S) ⊆ S for every real t (Mathlib's `IsInvariant`, which forces g^t(S) = S …)"; `Suggested.lean:448–450`. Sink: S = U has f(S) ⊆ S, S ⊄ {p}; only ∅, {p} have f(S) = S. |
| 1b/F02 (P3), Lemma 2.10 | repaired | README:232: "a segment (x, t) with t < T₀ is the initial part of (x, T₀) … with τ + T₀ in place of τ"; Lemma 2.10 cited only as "a different one". Recomputed: T₀ = 1, τ = 3, segments (x₁, 0.2), (x₂, 5): gap 0.8 + g ≤ 4. ClimenhagaThompson2016 line 448 is the tail-specification statement. |
| 1b/F03 (P3), compactness of M in Layer 10 | repaired | `Suggested.lean:540, 594`: `[SigmaCompactSpace M]`; README:852, :864: "a manifold M of the Conventions (Hausdorff and σ-compact, not necessarily compact; Λ is compact by definition)". The elaborated types in the job's signature listing carry `[SigmaCompactSpace M]` on all four theorems. diag(2, 1/2) on ℝ², Λ = {0}: Gibbs product 1, `Λ.Finite`. |
| 1b/F04 (P3), FH2019 "Part II" | repaired | one occurrence left, README:537: "FH2019, Chapter 5, for hyperbolic sets of flows, and Chapter 8, for Anosov flows"; `sources.toml` locator "Chapter 5 (Hyperbolicity), Chapter 8 (Anosov flows)". |
| 1b/F05 (P3), φ(ε) | repaired | README:390: "there are η > 0 and R ∈ ℕ such that every y with d(f^m y, y) < η for some m ≥ R has a point z"; :463 the same with R > 0. No φ(ε) remains. |

## The adversarial pass: computed values

"L" is a `Suggested.lean` declaration with its section context; "R" a README target.

| Statement | Context | Instances tried | Values computed | Result |
|---|---|---|---|---|
| L `countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate`, `measureEntropy` | `[MeasurableSpace X]` | fair-coin label; n = 0 | H = log 2; n = 0 excluded by `0 < n` (junk division by 0 not reached) | as supplier §4.2 (GeometryOfNumbersAndQuadraticArithmetic README line 1363) |
| L `invariantProbabilities`, `flowInvariantProbabilities`, `pressureNetSum`, `topologicalPressure`, `flowTopologicalPressure`, `IsEquilibriumState`, `IsFlowEquilibriumState` | uniform space | one point; empty space; full k-shift, φ = c | P = φ(pt); ⊥; log k + c | as ClassicalErgodicTheory §§5.1, 5.4, 5.5, 8.1 at its head |
| L `IsGibbsMeasure`, `HasBowenProperty`, `IsExpansiveFlow`, `HasFlowBowenProperty` | pseudometric | 2-shift φ = 0, ε = 1/2; ε above diameter; identity flow on 2 points | 2^(−(n+2))·2^n = 1/4; 2^n (excluded by ε ≤ ε₀); expansive with δ ≤ d(a, b) | supplier's quotient form equals the product form |
| L `HasLowerGibbsProperty` | pseudometric | t = 0; periodic orbit; wrong sign | ν(B_0) ≥ K⁻¹; arc 2s_ε/p; 4^(−t) → 0 | agrees with §5.1 |
| L `HasWeakSpecification`, `HasFlowWeakSpecification` | pseudometric | k = 0; empty X; swap; τ < 0 (flow) | start time Σ_(l<j)(n_l + g_l) = N_(j−1) + τ_(j−1); empty X has no y; (a,1),(a,1) needs 1 + g even, (a,1),(b,1) odd; `Icc 0 τ` empty forces k = 0 | agrees with §2.2 |
| R §2.2 comparison with `HasSpecification` | supplier §8.4 read at its head | s_j = Σn + (j−1)M | a_(j+1) − b_j = M exactly; closeness at n ∈ [s_j, s_j + n_j] gives i ≤ n_j | holds |
| L `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` | compact metric, Borel | empty X; period-1 orbit; roof-1 suspension | vacuous; all entropies 0; log 2 against rate 0 of the trivial partition | true as typed |
| R §3.1 route | — | Γ for (g¹, d_1) | {d_1(g^k x, g^k y) ≤ ε ∀ k ∈ ℤ} = flow Γ_ε(x) since [k, k+1] cover ℝ | holds |
| R §4.1 | — | F = c; g(2t); period-1 orbit, t = 1 | 2h + c vs 2h + 2c; F_1 constant so every measure is an equilibrium state of (g¹, F_1) | holds |
| L `existsUnique_isEquilibriumState_of_hasWeakSpecification` | nonempty compact metric, Borel | one point; swap; two shifts | product 1; ergodic not mixing; hypothesis fails | true as typed; scales (5δ, ε/8], (4δ, ε/4] at ClimenhagaThompson2016 lines 1886, 1963 |
| L `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` | same | one fixed point; periodic orbit; isolated fixed point plus more points | exp(0) = 1; arc measure; transitivity forces X = point | true as typed |
| L `HasHyperbolicLocalProductStructure` | pseudometric | 2-shift; finite set; rotation; monotone shift | d(Tⁿx, Tⁿy) = 2^(−N−n), c = 1, ρ = 1/2; singletons; (A3) fails; bracket nondecreasing since z₋₁ ≤ z₀ = x₀ ≤ x₁ | agrees with §6.1 |
| L `HasFlowHyperbolicLocalProductStructure` | pseudometric | period-1 orbit δ = 0.6; fixed point; empty | v = 0.45 and −0.55; excluded by first clause; vacuous | agrees with §6.5 |
| R §6.3 gluing | — | r_j + n_j = 0; general | mL_j − r_j − n_j = m, total ≤ mM + 2m − 1; else ≤ mM + 2m − 2 | range holds; Check constant: S02 |
| R §6.4, §6.7 | — | sum of two geometric series; 2-shift x ↦ x₀; φ = 1/m potential | 2C(cδ)^θ/(1 − λ^θ); K = 0; Σ_(j=m+1)^(n+m) 1/j unbounded | holds |
| L `existsUnique_isEquilibriumState_of_hasHyperbolicLocalProductStructure`, flow version | nonempty compact metric | one point; swap; monotone shift; one point (flow) | `Finite X`; h = 0; excluded by `∃ n : ℕ`; hypothesis fails | true as typed |
| L `IsHyperbolicSet`, `flowGenerator`, `IsFlowHyperbolicSet` | manifold, continuous metric | diag(2, 1/2); identity; circle flow; Λ = ∅ | C = 1, ρ = 1/2; forces E = 0; E^s = E^u = ⊥; vacuous | agrees with §§7.1–7.2 |
| R §7.3, §7.6 Checks | — | Gram (2 1; 1 1); Jordan block | K₁K₂ = √(λ_max/λ_min) = 2.618; ((65/64)^(1/2) + 1/8)/2 = 0.5664; series norm gives |Df v|′ ≤ λ′|v|′ | holds |
| L `hadamardPerronBox`, `hadamardPerronGraph`, `IsHadamardPerronFamily`, `exists_isHadamardPerronFamily` | finite-dim. inner product space | K = ⊥; K = ⊤; z = 0; cone step; image covers the ball | graph {0}; graph = box; ‖z‖ < C·0 false; needs δ(1+γ)² ≤ γ(μ−ρ); image ∩ ball closed in ball since ‖h(x)‖ ≥ c‖x‖, c > 1; uniqueness from (i), (ii) of φ′ and (iii) of φ with C = 2 | true as typed |
| L `IsLocallyMaximal`, `IsFlowLocallyMaximal` | topological | sink; −Id | S = U forward invariant only; vacuous | agrees with §§8.4–8.5 |
| L `hasHyperbolicLocalProductStructure_of_isLocallyMaximal`, flow version | σ-compact M, `hd` | Λ = ∅; periodic orbit; uniqueness of v | vacuous; singletons; y′ ∈ W^u(y) ∩ W^cs(y) = {y}, then no small period | true as typed |
| L `IsBasicSet`, `IsFlowBasicSet`, `IsFlowAttractor` | manifold | ∅; two fixed points; attracting circle | excluded; not transitive; U = {\|r\| < 1/4} works, {\|r\| < 1/2} does not | agrees with §10.1 |
| L `existsUnique_isEquilibriumState_of_isBasicSet`, `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` | σ-compact M, Borel | fixed point of diag(2, 1/2) on ℝ²; periodic orbit; coboundary clause | point mass, product 1; P = (1/p)∫F; derivative at t = 0 for every x gives it at every t | true as typed |
| L `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet` | σ-compact M, no `hd` | periodic orbit; fixed point | first disjunct; `Λ.Finite` | true as typed |
| L `toralEndomorphism`, `isEquilibriumState_toralEndomorphism_zero_iff` | none | d = 0; d = 1; cat matrix | point, ν = volume; excluded by ‖z‖ ≠ 1; 2.618, 0.382, h = 0.9624 | true as typed |
| L `flowUnstableSubspace`, `unstableJacobian`, `geometricPotential` | manifold, metric | E^u = 0; Sol-type metric | 0 × 0 determinants 1/1, φ^u = 0; λ_t = e^(at), φ^u = −a | agrees with §11.1 |
| R §11.3, §11.5, §11.6 Checks | — | b = 0.1; m ≥ 2, δ = 1/(3.9m); √5 ε | (1.01)^(−1/2) = 0.99504 < 0.99900; (1.95² + 1.01²)^(1/2) = 2.196 > 2.01; 2.236ε > 2ε | hold |
| R §11.6 route | — | ergodicity used | integer-time averages of u_1 under g¹ converge to a flow-invariant limit, constant by flow ergodicity (g¹ need not be ergodic) | holds |
| L `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` | compact M, smooth metric | attracting circle; cat suspension | basin {r ≠ 1/2}, time measure; μ⁺ = volume, density e^(3u(s)) after conformal change | true as typed |
| R §9.3 steps (i)–(v) | — | K = −1; K = −4, a = 1 | ff″ ≥ a²f²; 0.3240 ≤ 0.4434; a e^(−a)/sinh a = 0.3130 = coth 1 − 1; C = (1 + B²)^(1/2) | holds; S01 for the continuity input |

## Verified sound

- **Declarations read:** 50 of 50 (35 `def`, 15 `theorem`), every line of `Suggested.lean`. No Lean was run (read-only pass). The elaborated types of the job's signature listing were compared with the README statements: the nine flagged binders are `[MeasurableSpace X]` (seven definitions), `[FiniteDimensional ℝ V]` on `hadamardPerronGraph` and `[FiniteDimensional ℝ E]` on `flowUnstableSubspace`, none used by the definition; every theorem keeps `CompactSpace`, `Nonempty`, `BorelSpace`, `SigmaCompactSpace`, `IsManifold I ∞ M`, `I.Boundaryless`, `IsContMDiffRiemannianBundle` where the README asks for them. Nothing changed, so no new `#check` run.
- **Targets read:** all 45 numbered sections, every line of the README.
- **Headlines:** Bowen's criterion (2), upper semicontinuity, §6.8 (2), Hadamard–Perron, local product structure (2), Bowen, Bowen–Ruelle, positive entropy (2), Haar measure for toral automorphisms, SRB (2) are stated; the stable manifold theorems and the Anosov property of geodesic flows are named in the docstring with the missing carrier. No padding: no declaration follows by one tactic or one library lemma.
- **Locators verified this round:** 58 against the cached texts, including those round 1 left unread: ClimenhagaThompson2016 lines 170–175, 945, 448, 1880–1887, 1963; BowenRuelle1975 lines 60–61, 77–78, 93, 95, 119–133, 164, 402–406, 441, 643–652, 681–683, 702–715, 729–738; BowenPeriodicPoints1971 lines 105–168; BowenEntropyExpansive1972 lines 55–56, 117–135, 188, 192–193; ClimenhagaPesin2016 lines 281–283, 1822–1855. All point at the cited statement.
- **Checks tested:** about 60 recomputed (values above); none false or vacuous except the constant of S02; every definition has at least three.
- **Sibling citations resolved this round (15):** ClassicalErgodicTheory at its open head (Conventions line 171; §§0.3, 1.4, 3.4, 5.1, 5.3, 5.5, 6.1, 6.2, 6.4, 8.1, 8.2 with item 6, 8.4, 8.5 read; `HasSpecification`, `HasFlowSpecification`, `IsGibbsMeasure`, `IsExpansive`, `toralEndomorphism` with the stated hypotheses); GeometryOfNumbersAndQuadraticArithmetic §4.2 (four names, line 1363); ArithmeticDynamics §2.7 (null-boundary partitions, Shannon–McMillan–Breiman, the kernel with g_P(x) = hμ_x(T, P) and entropy integration) and §§2.67–2.92; ProbabilisticAndMetricNumberTheory §4.1 (2 names); GeometricCurrents G6; GeneralizedCohomology G4.0b; RiemannianGeometry R2 (§2.1), R4.1 (2 names); HeegaardFloer §1.0a (M.0a); OperatorAlgebraDynamics D9.
- **GeneralizedCohomology G4.0b:** the overlap listing says only an open revision defines it. It is on main (`TauCetiRoadmap/GeneralizedCohomology/README.md:1082`, "G4.0b: construct smooth real manifold structures on the same finite …"); the citation needs no dependency.
- **Pinned declarations:** the eight Tau Ceti names added by the round-1 repair are at the files the README names (`Jacobi/Convexity.lean:63, 154, 205`, `Jacobi/Space.lean:49, 112, 146`, `Curvature/Sectional.lean:148`, `Jacobi/Tangential.lean`); 20 further Mathlib and Tau Ceti names were re-checked, among them `Submodule.orthogonalProjectionOnto : E →L[𝕜] K` (`Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:120`), `Flow.restrictNonneg`, `AddAction.IsTopologicallyTransitive`, `TauCeti.riemannianVolume`.
- **Ownership by object:** `roadmaps grep` for hyperbolic sets, Anosov, Hadamard–Perron, local product structure, entropy-expansive, weak specification, SRB, Bowen–Margulis, connection map, and seven of this file's names finds no second owner on main or at the open heads. ClassicalErgodicTheory places uniformly hyperbolic dynamics outside its scope and uses entropy-expansiveness only inside a route (§5.3); MathematicalBilliards (main) owns measure-theoretic weak mixing of flows, not topological mixing. The pins have no hyperbolic set, topological pressure, expansivity or topological mixing; the pinned unstable manifolds are those of Morse critical points and of a hyperbolic equilibrium (README line 81 says so).
- **Policy:** the pull request changes only the package folder (11 files); no process words, pull-request numbers, `lemma`, `set_option`, `#eval`, `#check`, `True` placeholder or machine path in the README or the Lean file; imports are `Mathlib` and one Tau Ceti module.
- **Gaps:** `gap:connection-map-jacobi-derivative` has one supplier and the same slug in `design/plan.json` and README:126 (precision: S01). `sphere-bundle-embedding` is in the plan only; settled in earlier rounds, not raised.
- **Dependency check:**

      depcheck: 250 roadmaps, 2366 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.

Source independence: 14 passages compared with 5 sources (ClimenhagaThompson2016 lines 140–147, 295–303, 1661–1669, 1717–1724; BowenRuelle1975 lines 10–34, 96–108, 272–277, 364–375, 377–392, 681–683; BowenPeriodicPoints1971 lines 66–83, 101–110, 153–168; ClimenhagaPesin2016 lines 1822–1840; BowenEntropyExpansive1972 lines 117–121), none shared beyond formulas and hypothesis lists; largest share BowenRuelle1975, 46 of 129 source mentions; contents compared with BowenRuelle1975 (1 Introduction, 2 Symbolic dynamics, 3 Equilibrium states, 4 Attractors, 5 Main results, Appendix): independent. Layers 1–9 have no counterpart, its Section 2 is not used, its Section 3 is reached by another route, and §§11.1, 11.4–11.6 keep the order of its Sections 4–5 because the *Needs:* lines force it (11.4 needs 11.1 and 11.3; 11.5 needs 11.4; 11.6 needs 11.5), with the Appendix material placed before as §§11.2–11.3. The seven uncertified texts were not compared.

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: uncertified, cited by locator only (25 mentions, 16 of them KatokHasselblatt1995); not read.
- §§6.5–6.7: (F2), (F3) and the theorems derived from them are stated in no source that could be opened at this generality. Expansivity and uniqueness of the time shift were re-derived here (values in the table); closing and weak specification rest on the bracket iteration, not carried out in full.
- No Lean was elaborated in this pass.
- ClassicalErgodicTheory was read at the head of its open pull request (a draft); it may change before it merges.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at Section 2.5, the sentence after (2.12), printed page 8: the source says the two-sided set is the intersection over real t of the time-t image of the closed Bowen ball of order 2t about x; it should be centred at the time −t image of x, with t ≥ 0; affects nothing.
- **Misprint** in ClimenhagaPesin2016 at Section 11.1 and Theorem 11.1, printed page 40: the source says the maps are given for n ≤ 0 while the family and clause (i) run over all integers; it should give the maps for every integer n; affects a stated result.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source says the family of graphs is unique without asking that they pass through the origin; it should require the graph maps to vanish at 0, since for k = 0 constant families qualify; affects a stated result.

## For the human reviewers

- **Scope.** The flow axioms (F2), (F3) of README §6.5 and the theorems of §§6.6–6.8(b) are in no cited refereed source in this abstract form (README:439 says so); they are proved here from BowenRuelle1975's setting.
- **Scope.** ClassicalErgodicTheory, supplier of Layers 1–6 and 10, is another author's open draft pull request and is not in `merge-order/ORDER.txt`; the dependency check reports 0 problems.
- **Not tested.** Seven uncertified texts carry 25 of 129 source mentions (KatokHasselblatt1995 16); wording and locators were not compared with them (`packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml`).
- **Declared gap.** `design/plan.json` still lists `sphere-bundle-embedding` (supplier TangentialBordism §2.3), which README §9.3 no longer uses; the plan and the README differ on what the intake announces.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dd92fd45bd1a319b5d501ba6f698fb5cc34b6084", "job": "RT-HyperbolicDynamicsAndThermodynamicFormalism~2a", "model": "fable", "worker": "chris-x52"} -->
