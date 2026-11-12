# Repair of HyperbolicDynamicsAndThermodynamicFormalism (design, round 3)

Findings settled: the 27 findings R01–R27 of `packages/HyperbolicDynamicsAndThermodynamicFormalism/reports/REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~2.md`. Files edited: `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`, `packages/HyperbolicDynamicsAndThermodynamicFormalism/sources.toml`. Every finding was checked against the cached sources, the pins and the supplier heads before it was applied.

## R01 (P1) — applied

The witness is right: X = {p} ⊔ two-shift, φ(p) = 2, coarse cover rate 2 + log 2 ≈ 2.693 > P = 2. §2.2(b) old "supremum over finite open covers" → limit as covers become V-small, with the bounds growth Z(φ, W) ≤ p(T, φ, 𝒰) ≤ P + osc_V(φ) (proof via `lebesgue_number_lemma`). Checks added and recomputed: the witness, the cover by points, and inf/sup at coarse versus fine covers. Pattern: §1.2's "Lebesgue entourages shrink" → covers whose members become V-small.

## R02 (P1) — applied

§1.1 old "∩ T^{−n}B_{2n+1}(T^n x, ε)" (window [n, 3n]) → "∩ T^n(B̄_{2n+1}(T^{−n}x, ε))" (window [−n, n]). §5.1 old "T^{−N}B_{n+2N}(T^{−N}x, ε)" → "T^N(B_{n+2N}(T^{−N}x, ε)) ⊆ B_n(x, ε')", which tests the times −N…n+N−1. Shift-window Checks added in both sections. The two-sided balls later in §5.1 already had the right sign.

## R03 (P2) — applied

Conventions and Layer 11: old "continuous Riemannian metric" for the geometric potential → a smooth metric (BowenRuelle1975 line 92). Continuous metrics are kept for Layers 7–10. The metric change now has ψ = log of the E^u volume ratio and φ' = φ − L_gψ. The |sin 2πs| cusp is a Check. The same regularity issue led to one more change: Layer 11 now assumes a C² generator (BowenRuelle1975 line 93), which Lemma 4.1 needs for Hölder φ^u.

## R04 (P2) — applied

Verified: for the sink (1/2 1; 0 1/2), the normal determinant is √7/4 ≈ 0.6614 at εv, so the cutoff has a corner. §8.2 old "W^s_ε(x) is an embedded C^r disc" → C^r plaques 𝒲^s_r(x) with W^s_{r/K} ⊆ plaque ⊆ W^s_{Kr}, invariance, contraction and continuity. §8.3: strong plaques, plus weak plaques as embedded products (corners stated). Same repair in §§8.4, 8.5, 8.6, 9.1 and 11.3. Sink-corner Check added.

## R05 (P2) — applied

§11.2 old "a plane E* … tangent to a disc close to the unstable disc" → three parts. (a) Lemma A.2 for y ∈ M. (b) A cone tolerance η(θ) along the orbit, with T ≥ 0 and dim E* = dim E^u_x. (c) The chart-slice planes of A.4 satisfy (b). Witness Check: the ratio tends to (1 + b²)^{−1/2}, which is 0.99504 < e^{−0.001} at b = 0.1. The route no longer goes through §6.7, which only covers y ∈ Λ.

## R06 (P1) — applied

Confirmed at the heads: GeometryOfNumbersAndQuadraticArithmetic §4.2 has no `finitePartitionEntropy`, and the finite-label entropies are ProbabilisticAndMetricNumberTheory §5.1a (labelEntropy, condLabelEntropy). Changes: supplier contracts rewritten, a §5.1a contract added, §§3.2, 3.3 and 4.1 Needs corrected, plan suppliers updated. ArithmeticDynamics' inequality is recorded as truncation-only. A fair-bit Check was added.

## R07 (P2) — applied

Confirmed: ArithmeticDynamics §2.7 has "Enlarging ℰ decreases Hμ(P|ℰ)", and Mathlib `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` is at `CoverEntropy.lean`:418. §3.2 old "(Jensen's inequality …, proved here)" → imported from ArithmeticDynamics §2.7. §1.5 old itinerary finiteness argument → the Mathlib theorem. Both are added to the contracts, Needs and plan prerequisites.

## R08 (P1) — applied differently

The finding is right that §4.7 stated a theorem without proof or owner. Owning Yomdin's theory would add a large new subject outside this roadmap's targets, and no roadmap on main or at the open heads owns it. §4.7 is therefore removed. Newhouse's theorem and Yomdin theory are listed under "Not part of this roadmap" as feeding §4.6's hypothesis. Old §§4.8, 4.9 → §§4.7, 4.8, with every reference renumbered.

## R09 (P2) — applied

Nonemptiness added to:
- the existence clause of flow equilibrium states (new §4.7);
- §7.7 ("on a nonempty compact manifold no time-t map is Anosov");
- §9.2(a) (nonempty N);
- the suspension Check in §1.7;
- §10.4 and §11.4(b) (Anosov case).

Empty-space Checks added. The definitions stay general.

## R10 (P2) — applied

§1.1 and Conventions now require:
- ε > 0 throughout;
- L > 0 for the Lipschitz transport;
- n ≥ 1 in the flow/time-map comparison;
- t ≥ 0 for d_t.

The flow d_0 = d is distinguished from the map d_0 = 0. Checks added: the constant map with L = 0 versus L′ = 1, and the rotation flow at n = 0.

## R11 (P2) — applied

§8.1 old "applying this to the inverse sequence gives the stable family" → a separate stable statement. It needs λ < 1 and each f_n to be a restriction of a C¹ diffeomorphism whose inverse has linear parts B_n⁻¹, A_n⁻¹ and small nonlinear parts (ClimenhagaPesin2016 Remark 11.2, lines 1841–1843). The (2x, 0) non-example is now a Check. §8.2 notes that f is a diffeomorphism.

## R12 (P2) — applied

Flow §4.8 (formerly §4.9) old "on a manifold every C¹ function ψ qualifies" → "when g is a C¹ flow on a manifold". The rotation and cube-root-conjugated Checks are added. Pattern: the §6.7 Check is qualified by a C¹ flow. §10.3 already assumed a C¹ flow.

## R13 (P2) — applied

§4.3 old "some ergodic component has free energy at least that of μ" → for every real a below the free energy, a positive-measure set of components exceeds a. No attainment is claimed. The compactified-shifts Check is added: component entropies are 2^n log 2 and the mixture entropy is ∞.

## R14 (P3) — applied

The §1.1 Check old "identity of ℝ: closed ε-ball, not compact" → identity of ℚ, where Γ_1(0) = [−1, 1] ∩ ℚ is closed and not compact. It also notes that [−1, 1] ⊂ ℝ is compact. A plan test was added.

## R15 (P3) — applied

The §5.1 Check old ε = 1 → ε = 2, where every open ball is [0, 1] and K = 1. It also notes that B_n(0, 1) = [0, 1) has δ₁-mass 0. The twenty-point Check is recomputed: ball masses lie in [1/20, 4/20], and Lebesgue masses in [1/10, 1/5].

## R16 (P3) — applied

§4.6 old "2^k equally spaced values … converging to a point mass" → the values j/2^{2k}, 0 ≤ j < 2^k. These have entropy k log 2, maximum below 2^{−k}, and limit δ_{0^ℤ}. The Check notes that the equally spaced values converge to the Lebesgue product instead.

## R17 (P3) — applied

The §3.4 Check old "normalised orbit measures of the periodic points of period n" → uniform probabilities on Fix(T^n). Cylinders of length m get mass 2^{−m} once n ≥ m. The (10^{n−1})^ℤ orbit is noted as converging to δ_{0^ℤ}.

## R18 (P3) — applied

The §6.5 Check old "fails (F3)" → "satisfies (F3) vacuously but fails (F2)", because both strong sets are {x}. The Layer 6 Examples are corrected the same way.

## R19 (P3) — applied

The suspension Checks now name the metric ds² + e^{2as}du² + e^{−2as}dv². It is invariant under the lattice and under (s, w) ↦ (s − 1, Aw), it is not flat, and its volume is ds du dv. Checks in §§11.1, 11.3, 11.4, 11.5 and the Layer 11 Examples were updated. Arbitrary smooth metrics keep the coboundary relation and the measure class; the e^{3u(s)} density example shows the volume can be non-invariant. §10.2 now says "flat metric of 𝕋²".

## R20 (P3) — applied

The §9.1 Check old "hyperbolic toral automorphisms need n ≥ 2" → "positive-dimensional … need n ≥ 2". A point-torus Check is added (n = 0, determinant 1, entropy 0 as the empty sum). The theorem keeps n = 0.

## R21 (P2) — applied

§6.1 now proves directly from (A3) that orbits staying δ*-close coincide: d(y, y′) ≤ cλ^nδ*. Bracket uniqueness uses this, and §6.2's expansivity cites it. The finite-union API moved from §7.1 to §7.4, after uniqueness, with a Check. The plan graph has no forward or dangling target edges (checked by script). The §11.2 plan prerequisites now match the README.

## R22 (P3) — applied

§8.4 now gives local maximality an API: the isolating-neighbourhood criterion, f⁻¹, f^k (with the shrunk neighbourhood), and conjugacy. Its Checks are the sink, the f² neighbourhood example and the homoclinic non-example. §8.6 has no exact legal locator, so it gets a step-by-step derivation from §§7.5, 7.7, 8.2 and 8.3. Route (b) replaces the unowned tube-volume estimate by Mathlib `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank`.

## R23 (P2) — applied

Plan target 11.5 old "the only absolutely continuous invariant probability" → every g-invariant probability absolutely continuous with respect to m equals μ⁺. No absolute continuity of μ⁺ is asserted, and such a probability need not exist. This now agrees with README §11.5 and BowenRuelle1975 Remark 5.2.

## R24 (P3) — applied

The §7.6 Check old "The rate itself cannot be kept" → spectral radius versus admissible rate. For J, 2^n|J^n(0, 1)| = (4n² + 1)^{1/2} is unbounded, so λ = 1/2 is not admissible. At λ′ = 3/4, D = diag(1/8, 1) gives |J|′ = ((65/64)^{1/2} + 1/8)/2 ≈ 0.566.

## R25 (P2) — applied

§6.7 old "|v| ≤ Cε" → for ε ≤ e(δ), |v| ≤ δ by (F2). The shift error is 2δ max|φ|, and the legs are the geometric integrals ∫₀^∞ C(cδ)^θ e^{−κθs} ds. A Check with the cubic-conjugated circle flow is added: d(0, g^v 0) = |v|³.

## R26 (P2) — applied

Confirmed at the Tau Ceti pin: `TauCeti.sphereBundleChartedSpace`, `TauCeti.isManifold_sphereBundle` and `TauCeti.isSmoothEmbedding_coe_sphereBundle` are in `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean`, with their hypotheses quoted in the contract. No corestriction theorem was found in `RegularValue/` or `SmoothEmbedding/`. Changes:
- the gap `sphere-bundle-embedding` is narrowed to the corestriction theorem for that atlas (supplier TangentialBordism §2.3);
- §9.3, the contracts and the plan are updated.

## R27 (P3) — applied

§1.1 now cites BowenRuelle1975 lines 163–164 for map separation and lines 99–101 for closed flow balls. §6.5 old "lines 96–108 and 303–307" → lines 96–108 for the stable and unstable sets. (F2) and (F3) are identified as this roadmap's analogue of BowenPeriodicPoints1971 (A2)–(A3), lines 74–80, and verified in §8.5. FH2019 stays uncertified.

## Checks run

Dependency check (the command of the brief, unmodified):

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 236 roadmaps, 2136 edges, 0 problem(s)

There is no UPWARD and no CYCLE line.

`roadmaps resolve` on the README found no cross-roadmap citations and no Lean names that resolve nowhere. That tool does not check names outside TauCetiRoadmap, so every new library name was checked by hand at the pins:
- Mathlib `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (`CoverEntropy.lean`:418), `Dynamics.netMaxcard` (`NetEntropy.lean`:103), `lebesgue_number_lemma` (`Topology/UniformSpace/Compact.lean`:36), `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` (`Topology/MetricSpace/HausdorffDimension.lean`) and `Bundle.ContMDiffRiemannianMetric` (`Geometry/Manifold/VectorBundle/Riemannian.lean`:245);
- the three Tau Ceti sphere-bundle names (`Sphere.lean`:143, 161, 181).

Suggested.lean: this is the design stage and the package has no `Suggested.lean`. No Lean was elaborated, so the `#check` binder comparison does not apply. No backticked name of this roadmap's own was added to the README.

Gate failures listed in the brief: none.

## Adversarial mathematics pass (statements added or changed)

Notation: a = log((3 + √5)/2) ≈ 0.962424; T is the left shift; d = 2^{−N}.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.1 Γ formula | two-shift, y with its only 1 at −1, ε = 1/2 | d(T^k 0, T^k y) = 2^{−k−1} for k ≥ 0; d(T^{−1}0, T^{−1}y) = 1; T(B̄_3(0, 1/2)) tests −1, 0, 1 | corrected set excludes y; other translate contains y |
| §1.1 compactness | id on ℚ, ε = 1; id on ℝ | [−1, 1] ∩ ℚ not compact; [−1, 1] compact | Check replaced |
| §1.1 Lipschitz transport | constant map, L = 0 versus 1, n = 1, ε = 1 | {pt} ⊄ ∅ = B_1(pt, 0); {pt} ⊆ B_1(pt, 1) | L > 0 required |
| §1.1 flow/time-t | rotation flow, t = 1, ε = 1/4, n = 0 and n = 1 | B^{g¹}_0 = circle, flow B_0 = arc of half-width 1/4; for n = 1, δ-arc ⊆ 1/4-arc iff δ ≤ 1/4 | n ≥ 1 required |
| §1.2 fine covers | V-small cover, V ⊆ W, two net points in one member | (T^k x, T^k y) ∈ V ⊆ W for all k < n, so the W-balls meet | N(𝒰^n) ≥ netMaxcard |
| §2.2(b) | {p} ⊔ shift, φ = (2, 0); coarse and fine covers | p_n = 2^n e^{2n}, rate 2.693147; e^{2n} + 2^n, rate 2; P = 2 | limit along fine covers |
| §2.2 bounds | p_{n+m} ≤ p_n p_m; p_n ≥ e^{n min φ}; m-point identity | Fekete limit is real; cover by points gives Σ e^{nφ(x)}, rate max φ | holds |
| §2.2 inf/sup | two points, cover {X} | sup gives max φ, inf gives min φ; on V-small members they differ by ≤ n·osc_V | Check recomputed |
| §3.2 middle step | H(Pⁿ\|Qⁿ) = Σ_i H(T^{−i}P \| Qⁿ ∨ P^i) ≤ Σ H(T^{−i}P \| T^{−i}Q) | fair bit: H(X\|trivial) = log 2 ≥ H(X\|X) = 0 | supplier monotonicity |
| §3.4 periodic Check | Fix(T^n), word of length m ≤ n; orbit of (10^{n−1})^ℤ | 2^{n−m}/2^n = 2^{−m}; mass{x₀ = 1} = 1/n → 0 | Check replaced |
| §4.3 ergodic supremum | compactified shifts on 2^{2^n} symbols, weights 2^{−n} | components 2^n log 2 < ∞; Σ 2^{−n}·2^n log 2 = ∞ | threshold form |
| §4.6 Check | values j/2^{2k}, 0 ≤ j < 2^k | max (2^k − 1)/4^k < 2^{−k}; entropy k log 2 → ∞; limit entropy 0 | USC fails, as claimed |
| §4.7 flow existence | X = ∅ | M(g) = ES = ∅, USC vacuous | nonempty added |
| §4.8 C¹ clause | rotation with sin(2πs); flow conjugated by s^{1/3} | L_gψ = 2π cos 2πs; difference quotient t^{−2/3} → ∞ | C¹ flow required |
| §5.1 small scales | x = 0^ℤ, N = 3, ε = 1/2, ε′ = 1/8, n = 1, y with 1 at 0 | d(T^{−3}y, 0) = 1/8; at time 3 the distance is 1; the other translate contains y | corrected translate |
| §5.1 bound | exp(−(n + 2N)P) S_{n+2N}φ(T^{−N}x) | ≥ e^{−2N(\|P\| + sup\|φ\|)} e^{−nP + S_nφ(x)} | holds |
| §5.1 Check | id[0, 1], ε = 2 and 1; twenty points, ε = 1/10 | ball [0, 1], K = 1; δ₁([0, 1)) = 0; point masses 1/20 to 4/20; Lebesgue 1/10 to 1/5 | K = 20 holds |
| §6.1 coincidence | d(f^n y, f^n y′) ≤ δ* for all n | f^n y′ ∈ W^u_{δ*}(f^n y); d(y, y′) ≤ cλ^nδ* → 0 | direct, no §6.2 |
| §6.5 Check | irrational torus flow | W^s = W^u = {x}; (F3) reads 0 ≤ 0; transverse z has empty intersection | F2 fails |
| §6.7 shift | s³-conjugated rotation, x = 0 | d(0, g^v 0) = \|v\|³, ratio \|v\|/d = v^{−2} → ∞; \|v\| ≤ δ holds | linear modulus removed |
| §7.4 union | diag(2, 1/2) ⊔ (1/3)Id | (C, λ) = (1, 1/2) and (1, 1/3) → (1, 1/2); dim E^s = 1, 2 | holds |
| §7.6 Check | J = (1/2 1; 0 1/2) | 2^n\|J^n(0, 1)\| = 1, 2.236, 4.123, 6.083; \|DJD⁻¹\| = 0.566391 | Check rewritten |
| §7.7 time-t | t = 0 and t ≠ 0, nonempty M; empty M | X ∈ E^s ∩ E^u = 0 contradiction; empty M is vacuously Anosov | nonempty added |
| §8.1 stable | f_n = (2x, 0); inverse rates | B = 0 has no inverse; with λ < 1: 1/λ > max(1, 1/μ) | hypotheses added |
| §8.2 cutoffs | sink B, v ∝ (1, √7 − 2) | \|B^k v\| = 1, 1, 0.764618, 0.516338; normal determinant 0.661438 = √7/4 | plaques used |
| §8.2 cat | symmetric A, flat metric | \|A^k v\|² = a_u²μ^{2k} + a_s²μ^{−2k}; set = ε-segment of E^s | Check kept |
| §8.4 f^k | three copies, Λ = {0₁}, c = 0₂ | f-orbit of c leaves U at d; f² fixes c ∈ U; U ∩ f(U) ∌ c | shrink needed |
| §8.6(a) | power f^p with diam ≤ 2C′λ′^{pk}r₀ → 0 | m sets ⇒ ≤ m points ⇒ a point | derivation |
| §8.6(b) | shift chain \|w_i\| ≤ 2mr₀; arc \|s\| ≤ 3mr₀; circle flow | dimH(subset of ℝ) ≤ 1 < 2; the circle is the exception | derivation |
| §9.1 n = 0 | 0 × 0 matrix | det = 1, no eigenvalues, point torus, entropy 0 = empty sum | Check added |
| §9.2 empty | N = ∅ | empty mapping torus is mixing vacuously | nonempty added |
| §11.1 metric | Sol metric under σ(s, w) = (s − 1, Aw) | e^{2a(s−1)}e^{2a} = e^{2as}; volume e^{as}e^{−as} = 1; λ_t = e^{at}; φ^u = −a | Check rewritten |
| §11.1 change | u = 0.1 sin 2πs and u = \|sin 2πs\| | φ′ = −a − 0.2π cos 2πs; one-sided derivatives a ± 2π | smooth metric required |
| §11.2(b) | E* = span(e_u + b e_v), b = 0.1 | ratio → (1.01)^{−1/2} = 0.995037 < e^{−0.001} = 0.999000 | η(θ) added; need b² ≤ e^{2θ} − 1 |
| §11.5 volume | e^{2u(s)}-rescaled Sol metric | density e^{3u(s)}, not flow-invariant; same measure class as μ⁺ | Check rewritten |

## Ownership, renumbering and consequences

- **Newhouse and Yomdin (R08).** I searched main and the open heads for "Newhouse", "Yomdin" and "volume growth" (`roadmaps grep`). No owner was found. The theorem is now out of scope here, and nothing in this roadmap consumed it.
- **Sphere-bundle corestriction (R26).** I searched the pins and the roadmaps for a corestriction or `codRestrict` into regular-level or embedded submanifolds and found none. The narrowed gap stays with TangentialBordism §2.3, whose B1.5 compares sphere-bundle carriers with the literal total-space subsets.
- **No notion moved down.** No new supplier was added except ProbabilisticAndMetricNumberTheory §5.1a. That roadmap was already a supplier (§4.1), and it is earlier in the merge order.
- **Renumbering.** Old §4.7 (Newhouse) is deleted; old §§4.8 and 4.9 are now §§4.7 and 4.8. `roadmaps grep 'HyperbolicDynamicsAndThermodynamicFormalism'` finds no roadmap on main or at any open head citing this one, so no other roadmap's citation breaks.
- **Plan names.** `Dynamics.newhouse_upperSemicontinuous` is removed from the plan. The gap slugs are unchanged; the title of `sphere-bundle-embedding` changed.
- **Ownership against open pull requests** was checked through the `roadmaps` tools (main plus the 438 indexed heads). The overlap file lists no conflicting head and no dropped id.
- **Sources.** No new source was fetched, and no text is missing, so no `needs-references.toml` was written. `sources.toml` `cited_for` lists now match the README sections exactly (renumbered; Newhouse1989 cited under Scope and ownership).
- **Untrusted text.** None of the text read during this job contained an instruction.
