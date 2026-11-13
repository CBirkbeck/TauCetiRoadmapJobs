<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6849220584 -->
Review (claude) of 7f0e40d

Verdict: needs_changes

1. **F01** (P2) Layers 1–5 plan again what the open roadmap ClassicalErgodicTheory owns

   **Location:** D:7, Scope. Quote: "No roadmap on main, at the open roadmap heads or on the board defines any of these objects".

   **Claim:** this roadmap is the only owner of pressure, the variational principles, equilibrium states and Bowen's uniqueness criterion.

   **Witness:** pull request #2231, ClassicalErgodicTheory (new roadmap, head e3c5108), `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:1729–1730 defines `topologicalPressure` on Mathlib's nets; :1969–1976 the variational principle; :2073–2076 `IsEquilibriumState`; :2223–2225 Bowen's theorem; `Suggested.lean`:577.

   Object by object (their section against D's):

   | Object | ClassicalErgodicTheory at #2231 | D |
   |---|---|---|
   | Invariant probabilities: nonempty, compact, convex, extreme = ergodic; flow version | §5.1, §3.4 | §3.1 |
   | Open-cover entropy = `coverEntropy`; power rule; inverse | §5.2 items 2–3 | §§1.2–1.3 |
   | Expansive homeomorphisms, finite entropy at a scale below the constant | §5.3 | §1.5 |
   | Pressure of a map, net and cover forms, monotone, Lipschitz, coboundary | §5.4 | §§2.1–2.3 |
   | Entropy and pressure of a flow, `h(g^t) = |t| h(g^1)` | §5.5 | §§1.4, 2.4 |
   | Fine partitions, generators of expansive maps, upper semicontinuity | §§6.1–6.2 | §§3.3–3.4 |
   | Abramov's formula | §6.4 (measurable flows on standard Borel spaces) | §3.6 (continuous flows) |
   | Variational principles, maps and flows, ergodic suprema | §§7.1–7.3 | §§4.1–4.3, 4.7 |
   | Equilibrium states: definition, face structure, existence under upper semicontinuity | §§8.1–8.2 | §§4.4–4.6 |
   | Bowen property, Gibbs measures, Bowen–Walters expansive flows, uniqueness for maps and flows | §§8.4–8.5 | §§1.6, 1.9, 5.1–5.3 |
   | Entropy of toral automorphisms | §5.2 item 5, §6.4 | §9.1 |

   Its "Downstream consumers" (:2436–2439) names a roadmap on uniformly hyperbolic dynamics as the consumer of its §§8.4–8.6, and its scope leaves Anosov systems, stable manifolds and SRB measures outside. Layers 6–11 of D have no second owner (searched: Anosov, Hadamard–Perron, SRB, local product structure, Sasaki: no other match on main or at the open heads).

   **Exact repair:** give each object one owner. ClassicalErgodicTheory is a filed roadmap with a `Suggested.lean`, is an admissible supplier (another author's open pull request adding a new folder), and consumes nothing from this design, so the direction that needs no cycle is: add `### From TauCetiRoadmap.ClassicalErgodicTheory` with the sections above, delete the duplicated targets of Layers 1–5 and list them under Scope as imported, and correct D:7. Keep here only what differs, each with its one-clause difference: pressure and the variational principle on compact Hausdorff uniform spaces (theirs are compact metric); entropy-expansive maps (§1.5, third bullet); topological mixing (§1.7); weak specification with bounded gluing times and the uniqueness theorems under it (§§1.8, 5.2, 5.3: their `HasSpecification` and `HasFlowSpecification` fix the gaps and ask for periodic shadowing, which D:773's roof-one suspension fails, so their §8.5 does not give the transitive non-mixing case); the lower Gibbs bound for flows; §4.8. Should the maintainers prefer this roadmap as owner, that is their decision and needs a matching change in #2231; the design cannot keep both.

   **Tested on the witness:** with `topologicalPressure` imported, D:302's one-point value φ(pt) and D:304's `log k + c` are the values their definition gives (same nets, same `expGrowthSup`); the roof-one two-shift suspension still needs D's weak-specification theorem.

2. **F02** (P1) §11.2(b) runs through a Grassmann-bundle flow that nothing owns

   **Location:** D:1197. Quote: "apply (a)'s argument to the induced flow on q-planes … the planes {E^u_z : z ∈ Λ} form a hyperbolic set of the induced flow (BowenRuelle1975, Lemma A.3, lines 702–715)".

   **Claim:** the distortion bound (b), on which §11.3, §11.4 and the SRB theorem rest, follows from targets of this roadmap.

   **Witness:** a hyperbolic set (§7.2) needs a manifold and a C¹ flow. The pins have only algebraic Grassmannians (`Mathlib/RingTheory/Grassmannian.lean`, `TauCeti/AlgebraicGeometry/Grassmannian/`); D's Needs (D:1205) and P's prerequisites for 11.2 list neither. BowenRuelle1975 line 681 states A.2 for r = 1; D's (a) stands under Layer 11's C² hypothesis.

   **Exact repair:** make the inputs targets of §11.2, each with its Needs: (i) for a C² manifold M and 0 ≤ q ≤ dim M, the bundle G_q(TM) of q-planes as a C¹ manifold (graph coordinates over the charts of M), compact when M is; (ii) for a flow with C² generator, E ↦ Dg^t E is a C¹ flow on it with C¹ generator; (iii) Lemma A.3 as a statement: {E^u_x : x ∈ Λ} is a hyperbolic set of that flow. State (a) for hyperbolic sets of C¹ flows on compact manifolds, as the source does, so that (b) cites (a) for the induced flow. If (i)–(ii) are to come from a supplier, declare a gap with a named supplier instead (GeometricCurrents G6 on main builds the Grassmann bundle only as a topological quotient).

   **Tested:** roof-one cat suspension, metric of D:1183, q = 1. The fibre of G_1 is ℝP², with slopes b (towards e_v) and c (towards ∂_s) evolving as b·e^{−2aT} and c·e^{−aT}. So the lifted set has stable dimension 1 + 2 = 3, unstable dimension 1 and flow dimension 1, total 5 = dim G_1(TM), the count of BowenRuelle1975 lines 713–714; D:1201's ratio (1 + b²e^{−4aT})^{1/2}/(1 + b²)^{1/2} is the orbit integral of (a) along that stable fibre.

3. **F03** (P1) The stable-set neighbourhood of an attractor is used in §11.4(b) and §11.5 and owned nowhere

   **Location:** D:1221. Quote: "if the local stable set W^s_Λ(ε) has positive volume, in particular if Λ is an attractor … B_Λ(ε, T) contains the set of points whose forward orbits stay ε-close to Λ"; and D:1234.

   **Claim:** for an attractor, points near Λ lie in B_x(ε, T) for some x ∈ Λ and every T.

   **Witness:** BowenRuelle1975 lines 402–406 and 441–450 take this from Hirsch–Palis–Pugh–Shub (their reference 13, line 828): a neighbourhood V of Λ with every forward-V orbit in ∪_{z∈Λ} W^s_z(ε). D has no such target; §10.1's API (D:1107–1110) gives only "the basin of an attractor is open". W^s_Λ(ε) is never defined (D:1103 uses W^s_Λ for the basin).

   **Exact repair:** add to §10.1's API (Needs: §§6.6, 8.1, 8.3, 8.5): "Define W^s_Λ(ε) as the union over x ∈ Λ of the ambient local strong stable sets {y ∈ M : d(g^t y, g^t x) ≤ ε for t ≥ 0, → 0}. For a locally maximal hyperbolic set Λ of a C¹ flow and small ε there is a neighbourhood V of Λ such that every y with g^t y ∈ V for all t ≥ 0 lies in W^s_Λ(ε); for an attractor W^s_Λ(ε) contains a neighbourhood of Λ, and the basin is the union of the g^{−t} of it." Give its route (shadow the forward orbit by a point of Λ, then §8.1's characterisation of points staying in the boxes), cite the source and record it in the manifest. In §11.4(b) replace the quoted sentence by "B_Λ(ε, T) ⊇ W^s_Λ(ε)", and cite the new item in §11.5.

   **Tested:** D:1228's flow θ' = 1, r' = −sin(2πr)/(2π), Λ = {r = 0}, V = {|r| < ε}: for y = (θ, r), |r(t)| decreases to 0, so y ∈ W^s_ε((θ, 0)); W^s_Λ(ε) = V has volume 2ε > 0 and lies in B_Λ(ε, T) for every T.

4. **F04** (P2) §9.2(c) is about a suspension that has no carrier

   **Location:** D:1062. Quote: "(c) consequently the suspension of φ under any positive C^r roof function is Anosov, since it is C^r conjugate to the flow of h∂_t on the mapping torus".

   **Claim:** a theorem about the roof-r suspension flow.

   **Witness:** `TauCeti/Geometry/Manifold/Instances/MappingTorus.lean` has the roof-one mapping torus only (no occurrence of "roof"); no layer of D defines a roof-r suspension manifold or its flow, and P's 9.2 statement repeats the claim. "Up to a cohomologous roof" leaves the object undetermined.

   **Exact repair:** state (c) on the existing carrier: "for a positive C^r function r on N, fix 0 < c < min r and a smooth ρ ≥ 0 supported in (0, 1) with integral 1, and put h([s, x]) = 1/(c + (r(x) − c)ρ(s)), a positive C^r function on the mapping torus. Define the suspension of φ with roof r as the flow of h∂_t (DifferentialGeometry Layer 3.3); it is Anosov by (b), and its first return time to the fibre over 0 from [0, x] is r(x)." Drop the conjugacy clause, or state the conjugacy as a separate target with both carriers named.

   **Tested:** ∫₀¹ (c + (r − c)ρ) ds = c + (r − c) = r; for r ≡ 1, c = 1/2 the return time is 1; for r(p) = 1, r(q) = √2 at two fixed points the periods are 1 and √2, the instance of D:1069.

5. **F05** (P2) Adapted metrics assume compact M; their consumers and Checks do not

   **Location:** D:893. Quote: "for a hyperbolic set Λ of a C¹ diffeomorphism f of a compact manifold"; against D:942 "for a hyperbolic set Λ of a C^r diffeomorphism f of M" and D:925 "by compactness the choice changes constants only".

   **Claim:** §§8.2–8.5 hold for the manifolds they are stated and checked on.

   **Witness:** §8.2 needs §7.6 (D:951) and a smooth metric on M. D:897 and D:899 check §7.6 on ℝ² and ℝ³; D:947, D:977, D:978 check §§8.2, 8.4 on ℝ². `TauCeti.nonempty_contMDiffRiemannianMetric` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean`:69) needs `T2Space` and `SigmaCompactSpace`.

   **Exact repair:** in §7.6 replace "of a compact manifold" by "of a σ-compact Hausdorff manifold M" (Λ is compact by definition; the partition of unity and the positivity neighbourhood use nothing more), and change P's hypothesis "M compact". In the Layer 8 header, say that M is σ-compact Hausdorff with a fixed smooth Riemannian metric, and that two such distances are bi-Lipschitz on a compact neighbourhood of Λ. Name the charts of §8.2 once (the text says exponential charts, the Needs line `extChartAt`).

   **Tested:** Λ = {0} for diag(2, 1/2) on ℝ²: excluded by "compact manifold", admitted by the repaired hypothesis, and the Euclidean metric is adapted with rate 1/2 ≤ 3/4.

6. **F06** (P3) §9.1's Needs line omits what its API uses

   **Location:** D:1048–1049, D:1058. Quote: "*Needs:* Tau Ceti `AddCircle.instIsManifold`, `TauCeti.catMap`; Mathlib `Diffeomorph`; Layers 1.3, 1.7, 7.1."

   **Witness:** the API uses "the plaques of §8.2", the bracket of §6.1, and "Haar measure is invariant, ergodic and of maximal entropy" (measure entropy, §4.4; the Gibbs route of §5.1). Layer 9's Dependencies (D:1097) say "Layers 1, 7".

   **Repair:** add to the Needs line Layers 4.4, 5.1, 6.1, 8.2 and GeometryOfNumbersAndQuadraticArithmetic §4.2 (`measureEntropy`), split by API bullet, and correct the Dependencies line and P's prerequisites (after R01, with the imported sections in place of 4.4 and 5.1).

7. **F07** (P3) Locator slip in §5.2

   **Location:** D:638. Quote: "the lower Gibbs bound of its Lemma 6.13, line 1944".

   **Witness:** ClimenhagaThompson2016 lines 1908–1910 state Lemma 6.13; line 1944 is its use inside the proof that equilibrium states are absolutely continuous.

   **Repair:** "Lemma 6.13, lines 1908–1910". The lemma holds for n ≥ N(M); say that the bound for 1 ≤ n < N(M) follows from B_n ⊇ B_{N(M)} with a smaller constant.

8. **F08** (P3) §3.2's integral inequality is narrower than its use in §4.7

   **Location:** D:399. Quote: "for a measurable family x ↦ μ_x of measures in M(T) with integral μ … hμ(T, ξ) ≥ ∫ hμ_x(T, ξ) dμ(x)"; used at D:570 as "≥ ∫₀¹ h_{(g^s)_*μ'}(g^1, ξ_k) ds by §3.2's concavity".

   **Witness:** in §4.7 the index space is [0, 1] with Lebesgue measure, not X with μ; the statement as written covers §3.5's ergodic decomposition only.

   **Repair:** state it for a probability space (S, σ) and a measurable family s ↦ μ_s in M(T) with μ = ∫ μ_s dσ(s): hμ(T, ξ) ≥ ∫ hμ_s(T, ξ) dσ(s). (ClassicalErgodicTheory §6.2 states this form for mixtures; under R01 cite it.) Tested: S = [0, 1], μ_s = (g^s)_*μ', μ = ∫₀¹ μ_s ds is §4.7's case; S = X, σ = μ is §3.5's.

Eight findings: two P1, three P2, three P3; five blocking. All five round-3 findings are repaired. The new blocking findings are of two kinds. First, the open roadmap ClassicalErgodicTheory (pull request #2231, a new roadmap by another author, not in the closest-roadmap lists of the earlier rounds) owns most of Layers 1–5 of this design. Second, three proof routes in Layers 9 and 11 use objects or theorems that no layer, supplier or pin provides, and one hypothesis (compact M) is stated in §7.6 but dropped by its consumers.

**D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written. No design file or manifest entry was changed, and no source was fetched.

## Previous findings, checked individually

| Round 3 finding | Repaired passage (quoted) and recomputation | Status |
|---|---|---|
| R01 (P1), signed-time transitivity | D:25 "Transitivity is taken in forward time: … there is n ≥ 0 with T^n(U) ∩ V nonempty"; D:698, D:766–767, D:795, D:1103 carry it. Monotone shift, U = {x_0 = 1}, V = {x_0 = 0}: (T^n x)_0 = x_n ≥ x_0 = 1 for n ≥ 0, so T^n(U) ∩ V = ∅; for n = −1, (T^{−1}x)_0 = x_{−1} can be 0. P has 11 occurrences of "forward". | Repaired |
| R02 (P2), compactness of M(T) | D:379 "For a continuous T of a compact metric space … the image of M(T) … is compact"; D:378 "continuous T of a nonempty compact Hausdorff space". T(0) = 1, T(1/n) = 1/n: T_*δ_{1/n} = δ_{1/n} → δ_0, T_*δ_0 = δ_1 ≠ δ_0. | Repaired |
| R03 (P2), SRB headline | D:3 "Lebesgue-almost every point of the attractor's basin being generic for it; for a transitive Anosov flow … the basin is the whole manifold". Two cat suspensions: basins of volume 1/2 and 1/2, each now covered by its own statement. | Repaired |
| R04 (P2), covering radius | D:1221 "E is 2δ-spanning … B_Λ(ε, T) ⊆ ∪_{x∈E} B_x(2δ + ε, T)"; closed balls of radius δ/3. Attracting circle: (1.95² + 1.01²)^{1/2}δ = 2.196δ, above 2.01δ and below 3.01δ; d_T ≥ δ > 2δ/3 gives disjointness. | Repaired |
| R05 (P3), k = 0 Check | D:161 "On a nonempty totally bounded uniform space … the identity has entropy 0"; discrete ℤ: coverMincard = ⊤, entropy ∞ against 0 · h = 0; ∅: ⊥ against 0. | Repaired |

No finding was marked "not actionable in this package"; nothing is re-raised. No maintainer notes were supplied.

The repaired pattern (forward against signed transitivity) was searched in the rest of D: §6.3 (D:716–718), §9.1–§9.2 and the downstream list use "transitive" under the Conventions' forward meaning; no signed use remains. The repaired covering pattern recurs only at D:1234, where the doubled radius is stated.

## Verified sound

**Coverage.** Read D in full (1277 lines, 11 layers, 64 targets with their APIs, Checks and Needs lines), P's target entries for the findings, both gap entries and the manifest. Organisation: layers are named by their mathematics and ordered by dependency (topological and measure-theoretic layers, the abstract product structure, the smooth theory, examples, the summit); D does not say it follows a source. No copied passage, algorithm, process residue, `set_option` or forbidden supplier was found.

**Adversarial table** (sampled targets, headlines, targets touched by findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, forward transitivity | monotone shift; swap | T^n(U) ⊆ U for n ≥ 0, so ∅ against V; swap: n ∈ {0, 1} | Pass |
| §1.7 mixing | T^k ⇒ T; flow from time-t map | n = kq + j: T^n U ∩ V = T^{kq}(T^j U) ∩ V, k open sets, N = max N_j; offsets r_i with g^{r'}U ⊇ W' for |r'| < δ | Pass; BowenRuelle1975 line 165 and BCS2022 line 44 agree |
| §1.8 weak specification | irrational rotation | isometry: d_n = d; y = x_1, each gluing time chosen with R^{τ}(·) within δ, τ ≤ τ(δ) by minimality | Pass |
| §1.9 Bowen property | coboundary; 1/m potential | |ψ(T^n x) − ψ(x) − ψ(T^n y) + ψ(y)| ≤ 4 sup|ψ|; harmonic sum 1/2 + … + 1/n unbounded | Pass; CT lines 333–339, 1680–1682 |
| §3.1 | swap; discontinuous T; ∅ | (δ_a + δ_b)/2 only; T_*δ_0 = δ_1; no probability on ∅ | Pass; BowenRuelle1975 lines 157–159 |
| §3.2 affinity | Bernoulli (1/2,1/2), (1/3,2/3) | mixture 0.3466 + 0.3183 = 0.6648; H(5/12) = 0.3648 + 0.3144 = 0.6792 | Pass; index-space note R08 |
| §3.3 | coordinates in [−k, k] | agreement on |i| ≤ k gives diameter 2^{−k−1}; rate log 2 | Pass |
| §3.4 | x_{−1}, x_0, x_1 partition; Fix(T^n) | diameter 2^{−2} = 1/4 < 1/2; cylinder mass 2^{n−m}/2^n = 2^{−m} | Pass; CT Theorem 3.2 (ergodic μ), Bowen 1972 Theorem 3.5 (finite-dimensional X) as D says |
| §3.5 | route | Γ_ε(x; g^1, d_1) = Γ_ε(x) ⊆ g^{[−s,s]}x, entropy 0; hμ = ∫hμ_x = ∫hμ_x(ξ) ≤ hμ(ξ) ≤ hμ | Pass; CT lines 504–535 |
| §4.2 | two points, φ = (1, 0) | free energies 1, 0, midpoint 1/2; P = 1 | Pass; Misiurewicz1976 lines 119–121 |
| §4.7 extreme points when P = ∞ | μ = pμ₁ + (1 − p)μ₂, hμ₁ = ∞ | (p ± ε) mixtures both have entropy ∞ and average to μ, so μ is not extreme | Pass without a finiteness hypothesis |
| §5.1 Gibbs Checks | twenty-point measure, ε = 1/10; transfer with N = 3 | ball masses 1/20 … 4/20, Lebesgue 1/10 … 1/5; d(T^{−3}y, 0) = 1/8, at time 3 distance 1 | Pass |
| §5.2, §5.3 | CT Theorem 5.5, Theorem A | expansive: NE(ε) = ∅, P^⊥_exp = −∞; P = S = X × {0} has no segments of length ≥ 1, pressure −∞ | Pass; locator R07 |
| §6.1, §6.2 | two-shift; isolated point | c = 1, λ = 1/2; f^{−1}p isolated and in the forward orbit, so f^{n+1}p = p | Pass; Bowen 1971 lines 66–83, 96–104 |
| §6.4 | bound | Σ_k C(cδ)^θ(λ^{kθ} + λ^{(n−1−k)θ}) ≤ 2C(cδ)^θ/(1 − λ^θ) | Pass; CT lines 341–342 |
| §6.6 expansivity from (F2), (F3) | derivation | t + v_t − s(t) locally constant, so |s(t) − t| ≤ 2δ; d(w, g^v x) ≤ ce^{−κT}δ → 0, likewise w = y | Pass |
| §7.3 | Gram (2 1; 1 1) | K₁K₂ = (λ_max/λ_min)^{1/2} = (3 + √5)/2 | Pass |
| §7.6 | series | |Df v|'² = λ'² Σ_{n≥1} λ'^{−2n}|Df^n v|² ≤ λ'²|v|'² | Pass; hypothesis R05 |
| §8.3 | BowenRuelle1975 lines 96–108, 643–652 | strong sets with convergence; charts straightening W^{cs}, W^{cu} | Pass |
| §8.4 | three-copy example | U ∩ f(U) meets copy 1 only; ∩ f^{kn+j}(U) = Λ | Pass |
| §8.7 | BowenRuelle1975 line 362 | cites reference 19 (Pugh, line 838) | Pass |
| §9.2 | roof realisation | c + (r − c)·1 = r | R04 |
| §9.3 | K ≤ −a², −b² ≤ K | Sasaki norm of a stable field ≤ (1 + b²)^{1/2} e^{−at}: rate a with a constant | Pass, conditional on the two gaps |
| §10.2–§10.4 headlines | cat map | h = log((3 + √5)/2) = 0.9624; φ = −0.9624 gives P = 0 | Pass given Layers 5–8 |
| §11.1 | Sol metric | deck map (s − 1, e^a u, e^{−a}v): e^{2a(s−1)}e^{2a} = e^{2as}; λ_t = e^{at}; φ^u = −a | Pass |
| §11.2 | b = 0.1 | (1.01)^{−1/2} = 0.99504 < e^{−0.001} | Statement passes; route R02 |
| §11.3 | BowenRuelle1975 lines 364–375, 740–808 | closed balls, x ∈ Λ, y ∈ M, constants independent of T | Pass |
| §11.4, §11.5 | attracting circle | volume of V = 2ε | Statement passes; input R03 |

**Seeded source sample.** D and P flag no locator as unverified. Opened this round, at the cached texts: BowenRuelle1975 lines 10–34, 90–108, 155–201, 208–228, 268–280, 340–475, 628–740; ClimenhagaThompson2016 lines 136–150, 170–180, 290–305, 328–383, 444–464, 498–540, 584–590, 1246–1256, 1486–1491, 1655–1726, 1906–1968; BowenPeriodicPoints1971 lines 60–112, 164–172, 385–393, 419–427, 612–619; Misiurewicz1976 lines 84–124; BowenEntropyExpansive1972 lines 50–58, 114–136, 186–194, 294–300; BCS2022 lines 40–57. Sampled targets 1.7, 1.9, 3.1, 3.4, 3.5, 4.2, 6.1, 6.2, 6.4, 8.3, 8.7, 11.2, 11.3: every cited locator supports the statement as written, except the line number of R07 and the hypothesis level noted in R02. Targets 3.2 and 3.3 cite Walters1982 only (see Not verifiable); their statements were recomputed in the table.

**Pins.** `lake-manifest.json` pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as D says. Opened this round: `Mathlib/Dynamics/Flow.lean`:143 (`fromIter`), :154 (`Homeomorph.flow`), :196 (`toAddAction`), :241 (`restrictNonneg`), :301, :335; `Mathlib/Dynamics/Transitive.lean`:31–35 (the acting monoid is a parameter, so ℕ and the nonnegative reals give forward time); `Mathlib/Algebra/Order/Monoid/Submonoid.lean`:65; `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`:681; `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean`:69; `TauCeti/Geometry/Manifold/Instances/MappingTorus.lean` (no roof function). The other pinned names were opened with file and line in round 3 and their passages are unchanged.

**Duplication audit and suppliers.** Supplier citations resolved at the current heads: ArithmeticDynamics §§2.6, 2.7 (#1335); GeometryOfNumbersAndQuadraticArithmetic §4.2 with `measureEntropy` and `entropy_inverse`; ProbabilisticAndMetricNumberTheory §§4.1, 5.1a with `birkhoff_pointwise_ergodic` (#1421); DifferentialGeometry Layers 3 and 12, RiemannianGeometry R1, R2, R4 (R4.1, R4.4) and TangentialBordism §2.3 (B1.5) on main. The citation resolver reports no unresolved citation and no unknown Lean name. The overlap file lists no conflicting head and no dropped or revision-only id. The board index (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) holds no owner of these objects.

Overlap check: read ClassicalErgodicTheory (#2231), ArithmeticDynamics (#1335), ProbabilisticAndMetricNumberTheory (#1421), ProbabilisticAndMetricNumberTheoryPartII (#1838), RiemannianGeometry, OptimalTransport, RicciFlow; shared: the objects of R01's table, owner to be ClassicalErgodicTheory with this roadmap citing it; ProbabilisticAndMetricNumberTheoryPartII's pressure is the leading eigenvalue of its transfer operators, a different object; nothing shared with the others beyond the cited supplier sections.

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 206 roadmaps, 1900 edges, 0 problem(s)

No UPWARD or CYCLE line. ClassicalErgodicTheory is not in the merge order; it cites nothing of this design, so citing it creates no cycle.

**Declared gaps.** `gap:sphere-bundle-embedding` (TangentialBordism §2.3) and `gap:connection-map-jacobi-derivative` (RiemannianGeometry, Part II) have the same slugs in P and at D:101–102, each with one precise `needs` sentence, used only by §9.3; no roadmap or pin provides either (searched "connection map", "Sasaki", sphere-bundle corestriction). They are contracts, not findings. The inputs of R02 and R03 are not declared gaps and have no supplier.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each ending in Examples and Dependencies, consumers and references are present; every definition has an API and at least three Checks. There is no `Suggested.lean` at the design stage: elaboration is not available (this lane does not elaborate), and no one-tactic probe or binder comparison applies. Headlines from the Summary: variational principles, Abramov's formula, existence and structure of equilibrium states, Bowen's criterion, the linear theory, Hadamard–Perron and local manifolds, local product structure, Bowen's theorem, the Bowen–Ruelle theorem, the Bowen–Margulis measure, the SRB theorem. At the package stage the first four are stated only if R01 leaves them here.

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972: settled as uncertified in the manifest; cited by locator, not read, not requested again. This covers the only locators of the sampled targets 3.2 and 3.3.
- Hirsch–Palis–Pugh–Shub, *Neighborhoods of hyperbolic sets* (BowenRuelle1975, reference 13): not in the manifest and not read; R03 rests on BowenRuelle1975's own lines.
- Displayed formulas of BowenRuelle1975 Theorem 3.3 and Theorem 5.1 are garbled in the extraction; the prose hypotheses and conclusions were read.
- Lean elaboration: not available in this lane; there is no Lean file.
- Ownership was checked against main, the board index and the open heads the roadmap service serves; ClassicalErgodicTheory is absent from the worker's list of 201 open pull requests and was read through the service at head e3c5108.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7f0e40d5e153b757e501fb3fbef21a496f1f35c1", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~4", "model": "fable", "worker": "chris-x12"} -->
