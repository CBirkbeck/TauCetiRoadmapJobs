# Review of HyperbolicDynamicsAndThermodynamicFormalism (pull request #2441 at 3d9508c)

**Verdict:** needs changes

## R01 (P2) — Declared gap `sphere-bundle-embedding` still asks for what the pins provide

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `gaps`, slug `sphere-bundle-embedding` (supplier TangentialBordism §2.3 (B1.5)): "a C^n map … into the total space with values in the sphere bundle is C^n into the sphere bundle".

**Claim** Not repaired: the plan is unchanged and still declares the gap. The pins prove the statement, and the README (README.md:55, README.md:819) uses that route and declares no gap.

**Witness** Mathlib `ContMDiff.iff_comp_isImmersion` (Geometry/Manifold/Immersion.lean:995): `IsImmersion J J' n φ → (ContMDiff I J n f ↔ Continuous f ∧ ContMDiff I J' n (φ ∘ f))`; field `IsSmoothEmbedding.isImmersion` (SmoothEmbedding.lean:71); Tau Ceti `isSmoothEmbedding_coe_sphereBundle` (Riemannian/Sphere.lean:181).

**Repair** Delete the `sphere-bundle-embedding` entry from the plan's `gaps` and withdraw its announcement on TangentialBordism's job. The roadmap folder needs no change.

Re-raised: R01 of PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~1. No repair report giving a reason was found on the board, and the plan still lists the slug.

## R02 (P2) — Declared gap `connection-map-jacobi-derivative` still asks RiemannianGeometry for what §9.3 owns

**Location** `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `gaps`, slug `connection-map-jacobi-derivative` (supplier RiemannianGeometry, proposed Part II), against README.md:13: "the connection map of TM with the Jacobi-field form of the derivative of the geodesic flow, which no roadmap plans, is §9.3's".

**Claim** Not repaired: the plan is unchanged. It asks RiemannianGeometry for the connection map K, the isomorphism (Dπ, K) and Dφ^t ξ = (J(t), D_tJ(t)). README §9.3 states and proves all three, so a supplier acting on the announcement gives them two owners.

**Witness** README.md:800: K is a smooth bundle map and ξ ↦ (Dπ_v ξ, K_v ξ) an isomorphism onto π*(TM ⊕ TM). README.md:801: Dπ(Dφ^t_v ξ) = J(t), K(Dφ^t_v ξ) = D_tJ(t). README.md:7 lists both as owned (Layer 9).

**Repair** Delete the `connection-map-jacobi-derivative` entry from the plan's `gaps` and withdraw its announcement on RiemannianGeometry's job. §9.3 stays the owner; the roadmap folder needs no change.

Re-raised: R02 of PRREVIEW-HyperbolicDynamicsAndThermodynamicFormalism~1. No repair report giving a reason was found on the board, and the plan still lists the slug.

## R03 (P3) — A Check of §5.2 is false for full shifts of different sizes

**Location** `TauCetiRoadmap/HyperbolicDynamicsAndThermodynamicFormalism/README.md:336`: "The disjoint union of two full shifts is expansive and every locally constant potential has the Bowen property, but weak specification fails and ES(0) is a segment".

**Claim** ES(0) is a segment only when the two shifts have the same entropy. As worded the Check covers unions for which the equilibrium state is unique, which show nothing about the specification hypothesis.

**Witness** Full 2-shift ⊔ full 3-shift: h_top = max(log 2, log 3) = log 3; an invariant μ = tμ₂ + (1 − t)μ₃ has entropy at most t log 2 + (1 − t) log 3, equal to log 3 only at t = 0. ES(0) is one point.

**Repair** Replace the opening by "The disjoint union of two copies of the full two-shift is expansive …". On that instance both Bernoulli(1/2, 1/2) measures have entropy log 2 = h_top, and ES(0) is the segment between them.

## Verified sound

| Target | Instances tried | Statement side | Computed on the instance | Result |
|---|---|---|---|---|
| Previous R03 (summary block) | head signatures of §§8.4–10.4, §11 | "on σ-compact manifolds (compact for Anosov systems and SRB measures)"; "a smooth one in the SRB theory" | `[SigmaCompactSpace M]` in §§8.4–10.4, `[CompactSpace M]` and `IsContMDiffRiemannianBundle I ∞` in §11.6 | repaired |
| Previous R04 (dependency list) | README supplier headings | description now names 3 open and 4 main suppliers with sections | README.md:85–126 has the same seven suppliers and sections | repaired |
| §1.2 entropy-expansive (BowenEntropyExpansive1972 lines 35–37, 55–56, 188, 192–193) | full 2-shift, entourage {d ≤ 1/4}; shifts on 2^m symbols glued at ∞ | h = entropy at {d ≤ ε}, finite | agreement on coordinates −1…n gives 2^(n+2) covers, rate log 2; Φ_ε(∞) has entropy ≥ m log 2 for all large m | holds; source spans with d ≤ δ |
| §4.1 time-t maps and rescaling (BowenRuelle1975 lines 190–199, 409–413) | F = c; roof-1 suspension, F = 1; period-1 orbit, t = 1 | P_(g_a)(aF) = aP_g(F) | P_(g₂)(2c) = 2h + 2c against P_(g₂)(c) = 2h + c; 2 log 2 + 2 against 2 log 2 + 1; F_1 constant, so every point mass maximises | holds |
| §5.1 lower Gibbs (BowenRuelle1975 lines 272–277; ClimenhagaThompson2016 lines 1251–1253) | roof-1 suspension, φ = 0; t ≤ T₀; t = 0 | product ≥ K⁻¹ for all t ≥ 0 | measure ≈ ε·2^(−t−2m), times 2^t bounded below; ratio of exponents ≥ e^(−T₀(\|P\| + max\|φ\|)), so the stated constant suffices; t = 0 gives μ(ε-ball) ≥ K⁻¹ | holds |
| §5.2 `existsUnique_isEquilibriumState_of_hasWeakSpecification` (ClimenhagaThompson2016 lines 1661–1669, 1717–1724, 1880–1887, 1908–1910, 1955, 1963–1965) | full 2-shift, φ = 0; swap of two points; one point; 2-shift ⊔ 3-shift | unique, ergodic, Gibbs for n ≥ 1 | 2^(−(n+2))·2^n = 1/4; swap: product 1/2 (n even), 1/2·e^(P − φ(a)) (n odd); point: 1; ES(0) one point (R03) | theorem holds; Check R03 |
| §5.3 `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` (ClimenhagaThompson2016 lines 140–147, 295–303, 1489) | one-point flow; two-point identity flow | unique, lower Gibbs at every ε | point: `IsExpansiveFlow` holds trivially, product exp(tF − tF) = 1; two points: (a, 0), (b, 0) need g^τ y near b, never | holds |
| §6.3 spectral decomposition and specification (BowenPeriodicPoints1971 lines 71–72, 105–106, 155–168, 421–426) | σ × rotation of ℤ/2 (m = 2); r_j = n_j = 0 | gluing time in [mM, mM + 2m − 1] | mL_j − r_j − n_j ≤ m − 1, or m when r_j = n_j = 0 (L_j = 1); plus r_(j+1) ≤ m − 1; m(M + 2) = 2k + 6 ≥ 2k | holds; "n-delayed" is a_(i+1) − b_i > M |
| §6.1 bracket equivariance | p' = f[x, z], q = [fx, fz] | f[x, z] = [fx, fz] | forward: both within δ of fx-orbit for n ≥ 0; backward: within δ of fz-orbit for n ≥ 1 and n ≥ 0; 2δ ≤ δ* forces p' = q | holds |
| §6.8(a), (b) abstract uniqueness | monotone shift; period-1 orbit with δ = 0.6 | forward transitivity; (F2) uniqueness for δ ≤ δ₀ | U = {x₀ = 1}, V = {x₀ = 0}: Tⁿ(U) ⊆ U, `htrans` fails; v = 0.45 and −0.55 both in [−0.6, 0.6] | holds |
| §7.1 `IsHyperbolicSet` (Smale1967 lines 381–475) | Λ = ∅; dim M = 0; diag(2, 1) | compact, f(Λ) = Λ, complementary subspaces | ∅ and a point (E^s = E^u = ⊥) qualify, `IsBasicSet` adds nonemptiness; eigenvalue 1 in neither subspace; `#synth Norm (TangentSpace I x)` is the Riemannian instance | holds |
| §7.2 `IsFlowHyperbolicSet` (BowenRuelle1975 lines 10–18) | linear field (x, −y) at 0; suspension of diag(2, 1/2) | X ≠ 0, E^s ⊕ ℝX ⊕ E^u | `flowGenerator` = 0 at the origin, excluded; κ = log 2 | holds |
| §7.6 adapted metrics | Jordan block (1/2 1; 0 1/2), D = diag(1/8, 1) | rate λ' = 3/4 attainable | 2ⁿ\|Jⁿ(0, 1)\| = (4n² + 1)^(1/2); conjugated norm (√(65/64) + 1/8)/2 = 0.566 ≤ 0.75 | holds |
| §7.7 inverses, iterates, reversal | cat matrix; f² for diag(2, 1/2); time-1 map of a suspension | E^s, E^u exchanged; rate λ^k | A⁻¹ = (1 −1; −1 2), same eigenlines; rate 1/4; \|Dg¹X\| = \|X\|, not Anosov | holds |
| §8.1 `exists_isHadamardPerronFamily` (ClimenhagaPesin2016 lines 1822–1855) | K = ⊥; K = ⊤; uniqueness | (i)–(iv), unique through 0 | K = ⊥: \|z\| ≤ (ρ + δ)^L·Cν^(−L)\|z\| → 0 as ν > ρ'; K = ⊤: graph = box, expansion ≥ μ − δ > μ'; a second family lies on the first by (i), (ii) with y' = 0, then (iii) | holds |
| §8.2 local stable manifolds (ClimenhagaPesin2016 Theorem 11.1; KatokHasselblatt1995 §6.4 unread) | B = (1/2 1; 0 1/2), v ∝ (1, √7 − 2) | metric cutoff has a corner, plaque smooth | \|v\|² = \|Bv\|² = 1.417 (unnormalised), \|B²v\|/\|v\| = 0.7647 | holds |
| §8.4 `hasHyperbolicLocalProductStructure_of_isLocallyMaximal` (BowenPeriodicPoints1971 lines 73–80) | f = −Id, Λ = {(1, 0)}; f^k isolating set | `hinv` needed; U' = ∩_(j<k) f^j(U) | U ∩ f(U) = ∅ for −Id; f^(kn)x ∈ f^j(U) gives f^(kn−j)x ∈ U at every integer time | holds |
| §8.5 `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` | cat suspension, W of flat radius 1/4; c = (4/5, 3/5) | γ₀ isolated; U_t needed | \|Aỹ − ỹ'\| < (2.618 + 1)/4 = 0.905 < 1; Ac ≡ (1/5, 2/5), A²c ≡ c, distance √5/5 = 0.447 | holds |
| §6.5 Check (Fibonacci) | k = 6, n = (13, 8) | n·e_v = −φ^(−k)/√(1 + φ²), \|y\| = φ^(1−k)/√(1 + φ²) | −0.0557/1.902 = −0.0293; 0.0902/1.902 = 0.0474; A^(k/2)y = (0.7236, 0.4472); min max(2h, 0.526e^(−ah)) = 0.428 at h = 0.214 | holds |
| §9.1 toral automorphisms (Smale1967 lines 381–475; BowenGroupEndomorphisms1971 lines 313–316, 332–336) | cat matrix; shear; n = 0, 1 | Anosov; h_top = Σ log\|λ\| over \|λ\| > 1 | log 2.618 = 0.9624; shear: eigenvalue 1, sum 0; n = 0: empty sum; n = 1: ±1 has modulus 1 | holds |
| §9.2(c) roofs | R ≡ 1, c = 1/2; R(x₀) = 1, c = 2 | return time ∫₀¹ ds/h = R | ∫(c + (R − c)ρ) = c + R − c = R; 2 − ρ(s) vanishes since a bump of integral 1 on width 1/2 exceeds 2 | holds |
| §9.3 connection map and geodesic flow (KatokHasselblatt1995 Ch. 17 unread) | flat ℝⁿ; curvature −4 with a = 1; step (i) | Dφ^t ξ = (J, D_tJ); \|J_T(t)\| ≤ e^(−at)\|w\| | (a + tb, b); sinh 1/sinh 2 = 0.324 ≤ sinh ½/sinh 1 = 0.443, ≥ 2 sinh ½/sinh 2 = 0.287; ff″ ≥ \|D_tJ\|² + a²f² − f′² ≥ a²f² | holds |
| §10.2 `existsUnique_isEquilibriumState_of_isBasicSet` | {0} for diag(2, 1/2) on ℝ²; cat map, φ = −0.9624 | unique, Gibbs, coboundary invariance, M not compact | Gibbs product 1 with P = φ(0); P = 0.9624 − 0.9624 = 0, Haar | holds |
| §10.3 `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` (BowenRuelle1975 lines 213–222, 272–277; TsujiiZhang2023 lines 106–109, 485–495) | periodic orbit of period p; F' = F + 5 + L_gψ | lower Gibbs at every ε; time-t and rescaling clauses | −TP + ∫₀ᵀF = ∫₀^r F − rP ∈ [−2p max\|F\|, 2p max\|F\|]; pressure +5, same ν; free energy for (g^t, F_t) is t times that for (g, F) | holds |
| §10.4 `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet`, `isEquilibriumState_toralEndomorphism_zero_iff` (BowenRuelle1975 lines 77–78, 324–325; BowenPeriodicPoints1971 lines 421–426, 667, 749–750) | periodic orbit; finite Λ; d = 0, 1; cat | h > 0 unless orbit / finite; MME ⇔ volume | first disjuncts hold; d = 0: det 1, no roots, ν = Dirac = volume; d = 1: root ±1, hypothesis fails; cat: Haar | holds; no distance hypothesis needed (entropy is topological) |
| §3.1 `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` (ClimenhagaThompson2016 lines 504–535) | period-1 orbit; trivial partition on the roof-1 suspension | USC on M(g¹) | g¹ = id, all entropies 0; rate 0 ≠ log 2, so the diameter bound is needed | holds |
| §11.1 `unstableJacobian`, `geometricPotential` (BowenRuelle1975 lines 346–363) | cat suspension, Sol-type metric; conformal factor e^(2u(s)); E^u = 0 | ∫₀ᵀφ^u = −log λ_T | λ_t = e^(at), φ^u = −0.9624, P = 0; φ'^u = −a − 0.2π cos 2πs; without √: −1.925, P = −a; empty basis: Gram ratio 1, φ^u = 0 | holds |
| §11.3 distortion | E* = span(e_u + 0.1e_v) | ratio in [e^(−θ), e^θ] iff b² ≤ e^(2θ) − 1 | (1 + b²e^(−4aT))^(1/2)/(1 + b²)^(1/2) → 1.01^(−1/2) = 0.99504 < e^(−0.001) | holds |
| §11.4 volume lemmas (BowenRuelle1975 lines 364–375, 629, 740–808) | cat suspension; T = 0 | m(B_x(ε, T))λ_T(x) ∈ [c⁻¹, c] | ε·ε·εe^(−aT)·e^(aT) = ε³; T = 0: volume of ε-balls bounded on compact M | holds |
| §11.5, §11.6 `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` (BowenRuelle1975 lines 377–407, 421–472) | attracting circle: δ = 1/(3.9m), ε = 1.01δ; z = (0, 0), x = (2ε, 0), y = (0, ε); ν ≪ m | radii 2δ + ε and 3ε; a.c. invariant ν equals μ⁺ | (1.95² + 1.01²)^(1/2)δ = 2.196δ > 2.01δ; √5ε = 2.236ε > 2ε; ν-a.e. point is μ⁺-generic, so ∫u dν = ∫u dμ⁺ | holds |
| R01, R02 gaps | `plan.json` `gaps`; README §9.3 | two slugs declared | both still listed; pins and README.md:800–801 supply their `needs` | not repaired |

- Source locators checked against the text: 58 line ranges in 8 sources (BowenRuelle1975 20, ClimenhagaThompson2016 12, BowenPeriodicPoints1971 11, BowenEntropyExpansive1972 6, ClimenhagaPesin2016 3, TsujiiZhang2023 3, BowenGroupEndomorphisms1971 2, Smale1967 1). The 13 sampled targets that cite a readable source have the theorem, lines, hypotheses and statement as cited; §§7.7 and 9.3 are under Not verifiable.
- Library declarations located at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 65 (23 Mathlib, 42 Tau Ceti), for example `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` CoverEntropy.lean:418, `Flow.restrictNonneg` Flow.lean:241, `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` HausdorffDimension.lean:600, `Flow.minimalPeriod_pos_iff` ClosedOrbit.lean:200, `alongCurve_curveVelocity_comm` AlongCurve/Surface.lean:167. No pinned declaration states a hyperbolic set, a specification property, pressure or measure entropy.
- Cross-roadmap citations resolved: ClassicalErgodicTheory at its open head (Conventions line 171, §§5.3, 5.5, 6.4, 8.2 item 6, 8.4, 8.5; its 15 Lean definitions restated here agree with this file's, `flowInvariantProbabilities` specialised to ℝ, and `IsGibbsMeasure` matches its §8.4 prose); GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §§2.7, 2.67, 2.92; ProbabilisticAndMetricNumberTheory §4.1; GeometricCurrents G6; GeneralizedCohomology G4.0b (on main, README line 1082, with the real graph-chart clause at lines 1149–1153, so the "only an open revision defines" lead is void); RiemannianGeometry R2, R4.1; OperatorAlgebraDynamics D9; HeegaardFloer §1.0a.
- Gate: every check 0, OK. Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on the file gives 15 `sorry` warnings and nothing else. `#check @name` for all 50 declarations (15 theorems, 35 definitions): every definition carries its binders explicitly; nothing a README statement needs is dropped.
- One-tactic probe (`first | rfl | infer_instance | simp | simp_all | trivial`) fails on all 15 theorems: no padding. The two not-statable headlines of the module docstring (§§8.2–8.3, §9.3) lack the carriers it names; the other headlines are stated.
- Overlap check: read ClassicalErgodicTheory, Varifolds, ArithmeticDynamics, LorentzianGeometry, ManifoldOptimization, MathematicalBilliards, RiemannianGeometry (no roadmap named Surfaces is on main); pressure, equilibrium states, Gibbs, expansive and specification notions: ClassicalErgodicTheory (cited, and its scope excludes hyperbolic dynamics); measure entropy: GeometryOfNumbersAndQuadraticArithmetic (cited); Jacobi fields and Rauch comparison: RiemannianGeometry (cited); topological Grassmann bundle: GeometricCurrents G6 (cited); nothing else shared.
- Source independence: 20 passages compared with 8 sources, none shared beyond formulas the mathematics forces (the axioms at BowenPeriodicPoints1971 lines 75–80, the gluing inequality at ClimenhagaThompson2016 line 1665); largest share BowenRuelle1975, 48 of 151 locators; contents compared with BowenRuelle1975 (§§1–5, Appendix): independent, its §2 has no counterpart and Layer 11 interleaves its §4 with the Appendix along the *Needs:* chain 11.2 → 11.3 → 11.4 → 11.5 → 11.6.

## Not verifiable

- KatokHasselblatt1995 (§§6.2, 6.4, 18.1, 18.4, 19.1, Chapter 17), Bowen1975 (Chapters 1, 3, 4), FH2019, Walters1982, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified, their locators were not read. §§7.7 and 9.3 of the sample cite KatokHasselblatt1995 only.
- TsujiiZhang2023, ClimenhagaPesin2016, ClimenhagaThompson2016, BCS2022: the arXiv versions were read; their numbering was not compared with the journal versions the References name.

## Source issues

- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, p. 40: the source says the graphs are indexed by all integers while the maps are given for nonpositive indices only; it should use one index set for both; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), p. 40: the source applies inverses of maps assumed only C¹ on the box; it should quantify over backward sequences in the box; affects a stated result.

## For the human reviewers

- R01 and R02 concern the board's `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, which this pull request does not carry; inside the roadmap folder the only finding is R03 (P3).
