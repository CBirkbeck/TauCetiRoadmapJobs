# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at bfbca4f)

**Verdict:** needs changes

## R01 (P2) — Declared gap `sphere-bundle-embedding` is still in the board's plan and asks for what the pins provide

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, line 2442, `gaps`, slug `sphere-bundle-embedding` (supplier TangentialBordism §2.3 (B1.5)): "a C^n map … into the total space with values in the sphere bundle is C^n into the sphere bundle".

**Claim** Not repaired. Three replies on the pull request report the entry removed; the board's file still lists it and was last changed in `62e124d`. The pins prove the statement, and README.md:55 and README.md:819 use that route.

**Witness** Mathlib `ContMDiff.iff_comp_isImmersion` (Geometry/Manifold/Immersion.lean:995): `IsImmersion J J' n φ → (CMDiff n f ↔ Continuous f ∧ CMDiff n (φ ∘ f))`; Tau Ceti `isSmoothEmbedding_coe_sphereBundle` (Riemannian/Sphere.lean:181), whose field `isEmbedding` gives the continuity.

**Repair** Delete the `sphere-bundle-embedding` entry from `gaps` in the board's plan and withdraw its announcement on TangentialBordism's job. This is a change to the board, not to the pull request's branch; the roadmap folder needs no change.

Re-raised: H01 of the replies to PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~1, ~2 and ~3 (each marked "applied"). No reason was given for leaving it; the stated repair is not in the board's file.

## R02 (P2) — Declared gap `connection-map-jacobi-derivative` is still in the board's plan and asks RiemannianGeometry for what §9.3 owns

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, line 2453, `gaps`, slug `connection-map-jacobi-derivative` (supplier RiemannianGeometry, proposed Part II), against README.md:13: "the connection map of TM with the Jacobi-field form of the derivative of the geodesic flow, which no roadmap plans, is §9.3's".

**Claim** Not repaired. The board's file still lists the entry. It asks RiemannianGeometry for K, the isomorphism (Dπ, K) and Dφ^t ξ = (J(t), D_tJ(t)), which README §9.3 states and owns: two owners if the supplier acts on the announcement.

**Witness** README.md:800: K is a smooth bundle map and ξ ↦ (Dπ_v ξ, K_v ξ) an isomorphism onto the pull-back of TM ⊕ TM. README.md:801: Dπ(Dφ^t_v ξ) = J(t), K(Dφ^t_v ξ) = D_tJ(t). No other roadmap, on main or open, states them.

**Repair** Delete the `connection-map-jacobi-derivative` entry from `gaps` in the board's plan and withdraw its announcement on RiemannianGeometry's job. §9.3 stays the owner; the roadmap folder needs no change.

Re-raised: H02 of the replies to PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~1, ~2 and ~3 (each marked "applied"). No reason was given for leaving it; the stated repair is not in the board's file.

## R03 (P3) — The §6.5 Check on the bound δ ≤ δ₀ uses an instance where (F2) holds

**Location** `TauCetiRoadmap/HyperbolicDynamicsAndThermodynamicFormalism/README.md:451`: "for the unit-speed flow on a periodic orbit of period 1 and δ = 0.6, the point z = g^(0.45)x is g^v x for v = 0.45 and for v = −0.55 … so the time shift is not unique however small e(δ) is taken".

**Claim** (F2) tests only pairs with d(x, z) < e(δ). The pair of the Check is 0.45 apart, so any e(0.6) ≤ 0.4 excludes it, and at δ = 0.6 the time shift is unique. The instance does not show that δ₀ is needed.

**Witness** Arc-length metric, e = 0.4: d(x, z) < 0.4 gives z = g^v x with |v| < 0.4, and |v ± 1| > 0.6. Uniqueness first fails at δ = 1: z = x has v = −1, 0, 1 in [−1, 1], with d(x, z) = 0.

**Repair** Replace the sentence by: "The bound δ ≤ δ₀ in (F2) is needed: for the unit-speed flow on a periodic orbit of period 1 and δ = 1, the point z = x is g^v x for v = 0 and for v = ±1, all in [−1, 1], and d(x, z) = 0 < e(δ) for every e(δ) > 0, so the time shift is not unique; at δ = 0.6 it is still unique once e(δ) ≤ 0.4, and δ₀ = 1/4 works, since two times in [−1/4, 1/4] differ by less than the period."

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| Previous R01, R02 (board plan) | board `plan.json`; pins; README §9.3 | replies: `"gaps": []` | slugs at lines 2442 and 2453; `ContMDiff.iff_comp_isImmersion` at Immersion.lean:995; README.md:800–801 | not repaired (R01, R02) |
| §1.2 entropy-expansive maps (BowenEntropyExpansive1972 lines 55–56, 188, 192–193) | full 2-shift, entourage {d ≤ 1/4}; shifts on 2^m symbols glued at ∞ | h_top equals the entropy at {d ≤ ε}, finite | agreement on coordinates −1…n: 2^(n+2) cover elements, rate log 2; Φ_ε(∞) has entropy ≥ m log 2 | holds; source spans with d ≤ δ |
| §2.2 `HasWeakSpecification`, `HasFlowWeakSpecification` (ClimenhagaThompson2016 lines 295–303, 1661–1669) | swap; irrational rotation; full shift at 2^(−m); k = 0 | gluing times ≤ τ, start Σ_(l<j)(n_l + g_l) | (a,1),(a,1) needs 1+τ even, (a,1),(b,1) odd; rotation: each g_j lands near x_(j+1) − x_1, no accumulated error; τ ≥ 2m | holds; start time equals N_(j−1) + τ_(j−1) |
| §4.1 time-t maps and rescaling (BowenRuelle1975 lines 190–199, 409–413) | F = c; period-1 orbit, t = 1 | P_(g_a)(aF) = aP_g(F) | P_(g₂)(2c) = 2h + 2c against 2P_g(c/2) = 2h + c; F_1 constant, every point mass maximises | holds |
| §5.1 `HasLowerGibbsProperty` (BowenRuelle1975 lines 272–277; ClimenhagaThompson2016 lines 1251–1253) | t < T₀; full 2-shift at ε = 1 and ε = 2 | product ≥ K⁻¹ for all t ≥ 0 | exponent ratio ≥ e^(−T₀(\|P\| + max\|φ\|)), so the stated factor suffices; 2^(−n)·2^n = 1; whole space: 2^n | holds |
| §6.3 spectral decomposition and specification (BowenPeriodicPoints1971 lines 105–106, 155–168, 421–426) | σ × rotation of ℤ/2, δ = 2^(−k); r_j = n_j = 0 | gluing time in [mM, mM + 2m − 1] | mL_j − r_j − n_j ≤ m, r_(j+1) ≤ m − 1; need τ ≥ 2k; route: M = k + 1, bound 2k + 6 | holds |
| §6.4 Hölder gives Bowen (ClimenhagaThompson2016 lines 341–342) | φ(x) = 1/m on the 2-shift | \|S_nφ(x) − S_nφ(y)\| ≤ 2C(cδ)^θ/(1 − λ^θ) | Σ_k C(cδλ^k)^θ + C(cδλ^(n−1−k))^θ; counterexample sum 1/(m+1) + … + 1/(n+m) unbounded | holds |
| §6.5 `HasFlowHyperbolicLocalProductStructure` (BowenRuelle1975 lines 96–103) | period-1 orbit at δ = 0.6 and δ = 1; Fibonacci k = 6 | unique v ∈ [−δ, δ] for δ ≤ δ₀ | δ = 0.6, e ≤ 0.4: unique; δ = 1: v ∈ {−1, 0, 1}; n·e_v = −0.0293, \|y\| = 0.0474 | definition holds; Check R03 |
| §6.6 expansivity, closing, weak specification (BowenEntropyExpansive1972 lines 134–135) | roof-1 suspension; reparametrised drift η | Bowen–Walters expansive from (F2), (F3) | τ within 1/4 of ℤ and of 1/2 + ℤ: distances sum to 1/2; drift η forces v = −η against v → 0 | holds |
| §7.3 metric independence (BowenRuelle1975 lines 412–413) | Gram (2 1; 1 1); factor 4 | constants (CK₁K₂, λ) | K₁ = K₂ = 1.618, K₁K₂ = 2.618; 2·(1/2) = 1 | holds |
| §8.2 local stable manifolds (ClimenhagaPesin2016 lines 1822–1840) | B = (1/2 1; 0 1/2), v ∝ (1, 0.6458) | metric cutoff has a corner, plaque smooth | \|Bv\| = \|v\|, \|B²v\|/\|v\| = 0.7646, \|B³v\|/\|v\| = 0.516; det of normals 0.661 | holds |
| §9.1 toral automorphisms (Smale1967 lines 381–475; BowenGroupEndomorphisms1971 lines 313–316, 332–336) | cat matrix; n = 0, 1 | Anosov; h = Σ log\|λ\| over \|λ\| > 1 | eigenvalues 2.618, 0.382, E^u ∋ (1, 0.618), h = 0.9624; n = 1: ±1; n = 0: empty sum | holds |
| §9.2 suspensions and time changes (BowenRuelle1975 lines 60–61, 119–133) | roof R, 0 < c < min R; R = 1, c = 2 | return time R | ∫₀¹ (c + (R − c)ρ) ds = R; 2 − ρ vanishes since max ρ > 2 on width 1/2 | holds |
| §9.3 connection map, Anosov geodesic flow | flat ℝⁿ; S²; curvature −4 with a = 1 | Dφ^t ξ = (J, D_tJ); \|J_T(t)\| ≤ e^(−at)\|w\| | (a + tb, b); J = sin t e₃; ff″ ≥ a²f²; 0.287 ≤ 0.324 ≤ 0.443 | holds; source unread |
| §11.2 Grassmann lift (BowenRuelle1975 lines 702–715) | q = 1, dim M = 3; stable lift | stable dim E^s + q(dim M − q), unstable q | graph (C + DL)(A + BL)⁻¹; fibre rates 2a, a; 3 + 1 + 1 = 5; stable lift expands at 2a, a | holds |
| §11.6 `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` (BowenRuelle1975 lines 421–472) | attracting circle: z = (0,0), x = (2ε,0), y = (0,ε); circle flow | covering radius 3ε; μ⁺ unique, a.e. point generic | d(y, x) = 2.236ε > 2ε; E^u = ⊥: Gram ratio 1, φ^u = 0, μ⁺ = Lebesgue | holds; source's 2ε is wrong |
| `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` (ClimenhagaThompson2016 lines 504–535) | period-1 orbit; trivial partition on the suspension | USC on M(g¹) | Γ_ε(x; g¹, d₁) is the flow's Γ_ε(x); entropies 0; rate 0 ≠ log 2 | holds; Theorem 3.2 is ergodic-only, README decomposes |
| `existsUnique_isEquilibriumState_of_hasWeakSpecification` (ClimenhagaThompson2016 lines 1717–1724, 1880–1887, 1908–1910, 1963–1965) | one point; swap; 2-shift; two 2-shifts | unique, ergodic, Gibbs for n ≥ 1 | products 1; 1/2 with bounded S_nφ − nP; 2^(−(n+2))·2^n = 1/4; `hspec` fails at δ = 1/2 | holds |
| `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` (ClimenhagaThompson2016 lines 140–147, 1489) | isolated fixed point; two-point identity flow; τ < 0 | unique, lower Gibbs at every ε | fixed point plus forward transitivity gives X = {p}; no g^τ y near b; `Icc 0 τ` empty | holds |
| §6.8 `…_of_hasHyperbolicLocalProductStructure`, `…_of_hasFlowHyperbolicLocalProductStructure` | finite cycle; monotone shift; one-point flow | unique state; Finite X ∨ h > 0 | uniform measure, Finite X; Tⁿ(U) ⊆ U so `htrans` fails; fixed point excluded | holds |
| `exists_isHadamardPerronFamily` (ClimenhagaPesin2016 lines 1822–1855) | K = ⊥; K = ⊤; ρ ≥ 1 | (i)–(iv), unique family through 0 | ‖z‖ ≤ ((ρ+δ)/ν)^L C‖z‖ → 0; f(box) ⊇ box as μ − δ > 1; sup\|φ − φ'\|/\|x\| contracts by about ρ/μ | holds |
| `hasHyperbolicLocalProductStructure_of_isLocallyMaximal`, `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` | Λ = ∅; f = −Id; cat suspension | restricted system has the axioms | vacuous; U ∩ f(U) = ∅, so `hinv` is needed; (5 + √5)/8 = 0.905 < 1 | holds |
| `existsUnique_isEquilibriumState_of_isBasicSet`, `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` | {0} for diag(2, 1/2) on ℝ²; period-p orbit, t = p | Gibbs; time-t and rescaling clauses | product 1; g^p = id, F_p constant, one flow-invariant measure; −TP + ∫₀ᵀF ∈ [−2p max\|F\|, 2p max\|F\|] | holds |
| `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet`, `isEquilibriumState_toralEndomorphism_zero_iff` | periodic orbit; d = 0, 1; cat | h > 0 unless orbit or finite; MME ⇔ volume | first disjunct; d = 0: 0 + 0 = 0, Dirac = volume; d = 1: root ±1, `hhyp` fails; 0.9624 | holds |
| Restated supplier definitions | 16 definitions against ClassicalErgodicTheory's Lean at its open head | identical statements | 14 identical bodies; `flowInvariantProbabilities` specialised to ℝ; `IsGibbsMeasure` matches its §8.4 prose | agree |
| Headlines named as not statable | §9.3; §§8.2–8.3 | no `Flow ℝ` on the sphere bundle; no topology on maps with varying source | Tau Ceti's cosphere Reeb flow (Cogeodesic.lean:201) is a partial `flowOf`; `weakWhitneyTopology` (Diffeomorphism/Topology.lean:85) has a fixed source | claims hold |
| Pull request text | summary block and dependency sentence against README.md:85–126 | 3 open and 4 main suppliers, with sections | same seven suppliers and sections in the README headings; generality as in the Lean binders | agrees |

- Source locators checked against the text: 51 line ranges in 11 sources (ClimenhagaThompson2016 16, BowenRuelle1975 11, BowenPeriodicPoints1971 8, BowenEntropyExpansive1972 5, ClimenhagaPesin2016 2, BowenGroupEndomorphisms1971 2, TsujiiZhang2023 2, BCS2022 2, Smale1967 1, Buzzi2014 1, Misiurewicz1976 1). The 13 sampled targets that cite a readable source have the theorem, lines, hypotheses and statement as cited.
- Library declarations at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): all 113 names of the supplier contracts located; opened, among others, `ContMDiff.iff_comp_isImmersion` Immersion.lean:995, `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` CoverEntropy.lean:418, `Flow.restrict` Flow.lean:178, `Homeomorph.subtype` Homeomorph/Lemmas.lean:160, `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` HausdorffDimension.lean:600, `SmoothBumpCovering.exists_isSubordinate` PartitionOfUnity.lean:366, `AddCircle.instIsManifold` Instances/AddCircle.lean:258. No pinned file states a hyperbolic set, a specification property, pressure or measure entropy.
- Cross-roadmap citations resolved: ClassicalErgodicTheory at its open head (§§5.3, 8.4, 8.5 read in full; its scope excludes hyperbolic dynamics); GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §§2.7, 2.67, 2.92; ProbabilisticAndMetricNumberTheory §4.1; GeometricCurrents G6; GeneralizedCohomology G4.0b (on main at `ef3d21f`, README line 1082, so the "only an open revision defines" lead is void); RiemannianGeometry R2, R4.1; OperatorAlgebraDynamics D9; HeegaardFloer §1.0a.
- Gate at `bfbca4f`: every check 0, OK. Dependency check: `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and nothing else. `#check @name` for all 50 declarations: the binders dropped are unused instance classes on nine definitions; nothing a README statement needs is lost. One-tactic probe (`first | rfl | infer_instance | simp | trivial`) closes none of the 15 theorems.
- Overlap check: read ClassicalErgodicTheory, ArithmeticDynamics, Varifolds, MathematicalBilliards, RiemannianGeometry (ManifoldOptimization and LorentzianGeometry have no checkout in this job and were not read; no roadmap named Surfaces is on main); pressure, equilibrium states, Gibbs, expansive and specification notions: ClassicalErgodicTheory (cited); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields and Rauch comparison: RiemannianGeometry (cited); topological Grassmann bundle: GeometricCurrents G6 (cited; Varifolds owns no smooth structure on it); nothing else shared.
- Source independence: 15 passages compared with 7 sources, none shared beyond formulas the mathematics forces (the axioms at BowenPeriodicPoints1971 lines 75–80, the gluing inequality at ClimenhagaThompson2016 line 1665); largest share BowenRuelle1975, 46 of 132 source citations; contents compared with BowenRuelle1975 (§§1–5, Appendix): independent, its §2 has no counterpart and Layer 11 interleaves its §4 with the Appendix along the *Needs:* chain 11.2 → 11.3 → 11.4 → 11.5 → 11.6.

## Not verifiable

- KatokHasselblatt1995 (Sections 6.2, 6.4, 18.1, 18.4, 19.1, Chapter 17), Bowen1975, FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; their locators were not read. §9.3 cites KatokHasselblatt1995 only.
- TsujiiZhang2023, ClimenhagaPesin2016, ClimenhagaThompson2016, BCS2022: the arXiv versions were read; their numbering was not compared with the journal versions the References name.
- Ownership against the open ManifoldOptimization and LorentzianGeometry roadmaps: their files were not among this job's checkouts.

## Source issues

- **Error** in BowenRuelle1975 at Theorem 5.1 (proof), p. 192: the source says a ball of radius 2ε about x contains the ε-ball about z once the two ε-balls meet; it should be radius 3ε, by the triangle inequality through a common point; affects the proof.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, p. 40: the source says the graphs are indexed by all integers while the maps are given for nonpositive indices only; it should use one index set for both; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), p. 40: the source applies inverses of maps assumed only C¹ on the box; it should quantify over backward sequences in the box; affects a stated result.

## For the human reviewers

- R01 and R02 concern the board's `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, which this pull request does not carry. Three replies report the entries removed; the board's file is unchanged since `62e124d`. Inside the roadmap folder the only finding is R03 (P3).
