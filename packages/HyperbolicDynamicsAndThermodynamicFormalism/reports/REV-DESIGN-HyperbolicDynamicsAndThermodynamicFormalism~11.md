<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13791#issuecomment-6899392172 -->
Review (claude) of e9f6124

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) the two locators of §2.1 define mixing of a map, not of a flow

   **Location.** D §2.1: "Define a continuous flow g to be topologically mixing when for all nonempty open U, V there is t₀ with g^t(U) ∩ V nonempty for every t ≥ t₀ (BowenRuelle1975, line 165, footnote 2; BCS2022, lines 43–44)"; P 2.1 `locator`.

   **Claim.** The parenthesis presents the two passages as locators of the flow definition.

   **Witness.** BowenRuelle1975 line 165 defines mixing of a homeomorphism F (U ∩ FⁿV nonempty for large n); BCS2022 lines 43–44 define it for a diffeomorphism. Neither mentions flows. TsujiiZhang2023 lines 125 and 156 use topologically mixing Anosov flows.

   **Exact repair.** In D §2.1 replace the parenthesis by "(the continuous-time form of the notion for homeomorphisms of BowenRuelle1975, line 165, footnote 2, and BCS2022, lines 43–44; it is the hypothesis on Anosov flows in TsujiiZhang2023, Theorem 1.1, line 125, and Theorem 1.2, line 156)". In P 2.1 set `where` to "line 165, footnote 2 (homeomorphisms); BCS2022 lines 43-44 (diffeomorphisms); TsujiiZhang2023 lines 125, 156 (flows)". Tested: the three passages now carry exactly what is attributed to each.

2. **F02** (P3) §4.1 cites lines of Proposition 3.1 that state none of its four items

   **Location.** D §4.1: "(BowenRuelle1975, lines 190–192 for t = 1, lines 213–219 and 409–413; TsujiiZhang2023, lines 106–109)"; P 4.1 `locator`.

   **Claim.** The lines support the statements on time-t maps, rescaling and flow coboundaries.

   **Witness.** BowenRuelle1975 lines 213–219 are Proposition 3.1(a)–(d): uniqueness, ergodicity and the Gibbs bound for special flows over subshifts. TsujiiZhang2023 lines 106–109 only name ν_{g,F}. Lines 190–199 give the time-one case; lines 409–413 the rescaling.

   **Exact repair.** In D §4.1 write "(BowenRuelle1975, lines 190–199, for the time-one map: P(F, φ) = P(f¹, Φ), ∫φ dμ = ∫Φ dμ and the supremum over M(F); Remark 4.5, lines 409–413, for the rescaling of time)". In P 4.1 set `where` to "lines 190-199 (t = 1); Remark 4.5, lines 409-413 (rescaling)". Proposition 3.1 and the TsujiiZhang2023 lines stay where they belong, in §10.3. Tested against the text: lines 190–199 contain items 1–2 at t = 1, lines 409–411 item 3.

Changes are asked for on two locator findings (R01, R02, both P3), each with its exact repair; there is no P1 or P2 finding, and nothing else in the design needs a change. The two declared supplier gaps, `gap:sphere-bundle-embedding` and `gap:connection-map-jacobi-derivative`, were checked as contracts (precise, minimal, declared in both files) and are not findings. **D** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, **P** is `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. Only this report and `design/review.json` were written; no source was fetched and `sources.toml` is unchanged. No maintainer notes were supplied. There is no `Suggested.lean` at the design stage and this lane does not elaborate, so nothing was elaborated; the one-tactic probe and the `#check` comparison do not apply.

## Previous finding, checked

| Round 10 | Repaired passage | Status |
|---|---|---|
| F01 (P3), implicit scale quantifier of the lower Gibbs bound in §10.3 | D §10.3: "for every ε > 0 there is C_ε > 0 with ν_{g,F}(B_T(x, ε)) ≥ C_ε exp(−T P(g\|Λ, F) + ∫₀ᵀ F(g^t x) dt) for all x ∈ Λ and T ≥ 0, B_T(x, ε) the flow Bowen ball of g restricted to Λ"; D §5.1 new API bullet "Larger scales are free: …"; §5.3 "at every scale ε > 0"; §6.8(a), §10.2 "at every sufficiently small scale"; §6.8(b) "at every scale ε > 0 (§5.3)"; P 5.1 `lowerGibbs_mono_scale`, P 10.3 `periodic_orbit_every_scale`. BowenRuelle1975 lines 272–277 read again: every ε > 0, x ∈ Λ, T > 0. | Repaired |

Nothing was marked "not actionable in this package"; nothing is re-raised.

Adversarial pass on the passages the repair changed or added:

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §5.1 "larger scales are free" | ε = ε₀; ε > diam X; one-point X | ε = ε₀: same inequality. ε > diam: μ(B) = 1 and the ε₀-bound with μ(B_t(x, ε₀)) ≤ 1 gives exp(tP − ∫φ) ≥ K⁻¹. One point: P = φ(pt), exponent 0, μ = 1, K = 1 | Pass |
| §5.1 corollary ∫₀ᵗφ − tP ≤ log K | from K⁻¹ ≤ μ(B)·exp(tP − ∫φ) ≤ exp(tP − ∫φ) | take logarithms: ∫φ − tP ≤ log K | Pass |
| §5.1 "large times suffice" (used for T ≥ 0) | t ≤ T₀ | μ(B_t) ≥ μ(B_{T₀}) ≥ K⁻¹exp(−T₀P + ∫₀^{T₀}φ); ratio to exp(−tP + ∫₀ᵗφ) is ≥ exp(−T₀(\|P\| + max\|φ\|)); the stated factor e^{2T₀(…)} is larger, so valid | Pass |
| §5.1 new Check (two-shift) | ε = 1/2, 1, 2 | ε = 1/2: cylinder x_{−1..n}, 2^{−(n+2)}·2ⁿ = 1/4. ε = 1: d < 1 iff zeroth symbols agree, cylinder x_{0..n−1}, 2^{−n}·2ⁿ = 1. ε = 2: ball = X, product 2ⁿ → ∞ | lower bound K = 1; upper bound fails, as the Check says |
| §5.3 / §6.8(b) "every scale" | periodic orbit; two-point identity flow | periodic orbit: C_ε below. Two-point identity flow: no weak specification, a segment of maximal measures (hypothesis needed, statement untouched) | Pass |
| §6.8(a), §10.2 "every sufficiently small scale" | two-shift at ε = 2 | product 2ⁿ unbounded, so "every scale" would be false for the two-sided property; the repaired wording is the true one | Pass |
| §10.3 new Check | period p, T = kp + r, 0 ≤ r < p; ε > diam O; T = 0 | −TP + ∫₀ᵀF = ∫₀^r F − rP, modulus ≤ r max\|F\| + r\|P\| ≤ 2p max\|F\|; arc {g^s x : \|s\| ≤ s_ε} has measure 2s_ε/p (= 1 at s_ε = p/2) and lies in B_T(x, ε) since d(g^t g^s x, g^t x) = d(g^s y, y), y = g^t x; above the diameter C_ε = e^{−2p max\|F\|}; T = 0: exponent 0, ν(ε-ball) ≥ 2s_ε/p | Pass |
| §10.3 "a fortiori for the closed balls of §11.4" | x ∈ Λ | {y ∈ M : d ≤ ε on [0, T]} ⊇ {y ∈ Λ : d < ε on [0, T]}, ν carried by Λ | Pass |
| §11.6, consumer of the bound "at radius ε" | small ε of §§11.4–11.5 | contained in the every-scale statement | Pass |

The repaired pattern (a quantifier left implicit on a scale or a time) was searched in the rest of D: §5.2 ("for ε below an expansivity constant … every scale r ≤ ε/8"), §8.2–8.3 ("0 < r ≤ r₀"), §11.4 ("for small ε", "for small ε, δ", all x ∈ Λ, T > 0, as BowenRuelle1975 lines 364–375), §11.5 ("for small ε") state theirs.

## Verified sound

**Coverage.** D read in full (1007 lines, 11 layers, 45 targets). P parses: 11 layers, 45 targets, every target with at least three tests; gaps list has the two slugs. 18 manifest keys; every key cited in D is in the manifest and in D's References. Style scan of D: 0 LaTeX delimiters, 0 machine paths, 0 pull-request numbers, 0 process words, 0 `set_option`, 0 HTML anchors.

**Adversarial table** (the fifteen sampled targets, the headline theorems; the findings touch only locators).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.1 flow mixing iff time-t map mixing | periodic orbit; one-point space; converse | period p: g^p = id, not mixing, flow not mixing; one point: both mixing; converse: g^{nt+s}(U) ⊇ g^{nt}(W) for s near s₀ with W ⊆ g^s(U), finitely many s₀ cover [0, t] | Pass |
| §2.1 T mixing iff T^k mixing | k ≥ 1, residues j < k | T^{nk+j}(U) ∩ V = T^{nk}(T^jU) ∩ V, k open sets T^jU | Pass |
| §2.1 Check 3 | roof-one suspension, boxes at heights 1/4, 3/4 | meeting times 1/2 + ℤ up to widths; integers excluded; one-point base gives a circle, not mixing | Pass |
| §2.2 definition against ClimenhagaThompson2016 lines 1661–1669, 295–303 | j = 1, 2, 3 | start times 0; n₁ + τ₁; n₁ + n₂ + τ₁ + τ₂ = N_{j−1} + τ_{j−1} | Agree |
| §2.2 weak specification ⟹ forward transitive | maps: (u, 1), (v, 1); flows: (u, 0), (v, 0) | T^{1+τ₁}(B(u, δ)) meets B(v, δ), 1 + τ₁ ≥ 1; flows: d₀ = d, g^{τ₁}y near v, τ₁ ≥ 0 | Pass |
| §2.2 Checks | swap; rotation | parity: 1 + τ even for (a,1),(a,1), odd for (a,1),(b,1); rotation: isometry, each junction aimed within δ by a uniformly bounded time (minimality and compactness) | Pass |
| §3.1 equality hμ(g¹) = hμ(g¹, ξ) | Γ_ε(x; g¹, d₁) | {y : d₁(gⁿx, gⁿy) ≤ ε ∀n ∈ ℤ} = {y : d(g^t x, g^t y) ≤ ε ∀t ∈ ℝ}; inside g^{[−η,η]}x, where a fixed finite set spans for every n: entropy 0 (ClimenhagaThompson2016 lines 516–530) | Pass |
| §3.1 non-ergodic μ and semicontinuity | decomposition; ν with null boundaries | both integrands hμ_x(g¹), hμ_x(g¹, ξ) agree a.e. since each μ_x is g¹-ergodic; one ξ of d₁-diameter < ε serves every ν′, so ν′ ↦ inf_n H_ν′(ξⁿ)/n is an infimum of functions continuous at ν | Pass |
| §3.1 Checks | period-one orbit; trivial partition on the suspension | g¹ = id, entropy 0; rate 0 ≠ log 2 | Pass |
| §4.1 item 1 | time-one average of aF along g_a | ∫₀¹ aF(g^{as}x) ds = ∫₀^a F(g^u x) du = F_a | Pass |
| §4.1 item 2 | μ ∈ M(g); point mass on a period-one orbit | free energy t·hμ(g¹) + t∫F dμ against tP_g(F); point mass: equilibrium for (g¹, F₁) (g¹ = id, F₁ constant on the orbit), not in M(g) | Pass |
| §4.1 Check 1 | F = c; suspension, F = 1 | 2P_g(c) = 2h + 2c against 2P_g(c/2) = 2h + c; 2 log 2 + 2 against 2 log 2 + 1 | Pass |
| §4.1 Check 5 | conjugacy s ↦ s^{1/3} | orbit of 0 is t^{1/3}, quotient t^{−2/3} unbounded | Pass |
| §5.2 headline, Checks | full two-shift, φ = 0, ε = 1/2; n = 1 | 2^{−(n+2)}·2ⁿ = 1/4; μ(B₁) = 1/8 ≥ Q/2 | Pass |
| §5.3 headline | one point; two-point identity flow | unique measure, K = 1; expansive without weak specification, non-unique | Pass |
| §6.3 gluing time | r_j + n_j = 0; general | mL_j + mM + r_{j+1} − r_j − n_j; L_j = 1 gives m + r_{j+1} ≤ 2m − 1, otherwise ≤ 2m − 2: in [mM, mM + 2m − 1] | Pass |
| §6.3 Check 4 | σ × rotation of ℤ/2, δ = 2^{−k} | τ ≥ 2k needed; σ² at 2^{−k−1}: 2a′ − k − 1 > 2(a + L − 1) + k + 1 iff a′ − (a + L − 1) ≥ k + 2; m(M + 2) = 2k + 8 ≥ 2k; k + 4 < 2k iff k ≥ 5 | Pass |
| §6.8(a), (b) | swap; periodic orbit; monotone shift | h = 0 and the unique measure; time measure; n + 1 words of length n, h = 0, M(T) a segment, so forward transitivity is needed | Pass |
| §7.2 definition and API | constant field on 𝕋²; suspension of diag(2, 1/2); empty Λ | Dg^t = Id forces E^s = E^u = 0, dim 1 ≠ 2; κ = log 2; empty set vacuously hyperbolic (excluded later by "nonempty" in §10.1) | Pass |
| §7.4 | diag(2, 1/2); rotation; saddle ⊔ sink | (1,1) unbounded; all bounded, none decays; union with C = 1, λ = max(1/2, 1/3) = 1/2, dim E^s = 1, 2 | Pass |
| §7.5 | diag(1 + t, 1/(1 + t)), t → 0; flow case | rate → 1, limit has E^s = 0; for flows E^s, E^u closed by the decay bounds, dimensions sum to dim M − 1, so E^s ⊕ ℝX is a continuous sum of continuous bundles | Pass |
| §7.6 | series; integral; Jordan block | \|Df v\|′² = λ′²Σ_{n≥1} λ′^{−2n}\|Dfⁿv\|² ≤ λ′²\|v\|′²; \|Dg^t v\|′² = e^{−2κ′t}∫_t^∞ e^{2κ′u}\|Dg^u v\|² du ≤ e^{−2κ′t}\|v\|′²; 2ⁿ\|Jⁿ(0,1)\| = (4n² + 1)^{1/2}, conjugated norm 0.566 ≤ 3/4 | Pass |
| §8.1(iv) | cone \|Δy\| ≤ γ\|Δx\| | \|Δx′\| ≥ (μ − (1 + γ)δ)\|Δx\|; \|Δy′\| ≤ (λγ + (1 + γ)δ)\|Δx\| ≤ γ\|Δx′\| iff δ(1 + γ)² ≤ γ(μ − λ) | Pass |
| §8.1, constants from ClimenhagaPesin2016 line 1852 | δ < δ₀ | 1 < (μ − δ(1 + γ))/(1 + γ) gives μ − (1 + γ)δ > 1 + γ; λ + (1 + γ⁻¹)δ < (μ − δ(1 + γ))/(1 + γ) gives δ(1 + γ)²/γ < μ − (1 + γ)λ − δ(1 + γ) < μ − λ | Pass |
| §8.1(iii) | z ∉ W⁺_n; f_n(x, y) = (2x, 0) | \|z − q₀\| ≤ λ′^L(Cν^{−L}\|z\| + μ′^{−L}\|q₀\|) → 0; \|z_L\| = 2^{−L}\|z\| < 2ν^{−L}\|z\| for ν < 2 | Pass |
| §8.3 Checks 5, 6 | θ′ = 1, u′ = u, v′ = −v + u²; time change | v = u₀²e^{2t}/3 + ce^{−t} solves it (v′ = 2u₀²e^{2t}/3 − ce^{−t}); weak unstable set v = u²/3; e^{3a} = 2.618³ = 17.9 > μ | Pass |
| §8.4 API, f^k | U ∩ f(U) ∩ ⋯ ∩ f^{k−1}(U) | ∩_n f^{kn} of it = ∩_m f^m(U) = Λ | Pass |
| §8.6(a) | E^u = 0 on a component K | K = f^{pk}(K) covered by m sets of diameter ≤ 2C′λ′^{pk}r₀ → 0, so at most m points | Pass |
| §9.2(c) | return time; R ≡ 1, c = 1/2; c = 2 | ∫₀¹ (c + (R − c)ρ) ds = R; 1; 2 − ρ vanishes where ρ = 2, attained by a bump of integral 1 on an interval of length 1/2 | Pass |
| §9.2 Check 4 | R(p) = 1, R(q) = √2 | periods 1 and √2, dense subgroup | Pass |
| §10.1 attracting circle | r′ = −sin(2πr)/(2π) | zeros r = 0 (linearisation −r) and r = 1/2 (linearisation +r); U = {\|r\| < 1/4} isolates; W^s_Λ(ε) = {\|r\| ≤ ε}, area 2ε; basin {r ≠ 1/2} | Pass |
| §10.1 signed transitivity with dense periodic points | n < 0, p of period q in V ∩ fⁿ(U) | p = f^{kq+n}(f^{−n}p) ∈ f^{kq+n}(U) ∩ V, kq + n ≥ 0 for large k | Pass |
| §10.2 Check 2 | cat map, φ = −log((3 + √5)/2) | P = 0.9624 − 0.9624 = 0 | Pass |
| §10.4 | cat map; periodic orbit; one-point basic set | h = 0.9624 > 0; h = 0, the stated exception; finite Λ, h = 0 | Pass |
| §11.1 cat suspension | metric ds² + e^{2as}du² + e^{−2as}dv² | invariant under (s, w) ↦ (s − 1, Aw): e^{2a(s−1)}e^{2a} = e^{2as}; \|∂_u\| = e^{as}, λ_t = e^{at}, φ^u = −a, P = a − a = 0; pull-back of Sol's metric under (au, av, as) is a² times it | Pass |
| §11.1 metric change | e^{2u(s)}, u = 0.1 sin 2πs; u = \|sin 2πs\| | φ′^u = −a − 0.2π cos 2πs = φ^u − L_g u; one-sided derivatives a ± 2π at s = 0 | Pass |
| §11.1 degenerate | E^u = 0 | λ_t = 1 (empty determinant), φ^u = 0, P(φ^u) = P(0) = 0 on an attracting periodic orbit, agreeing with §11.5(b) | Pass |
| §11.2 | dimensions; graph transition; q = 1 | s + q(n − q) + q + 1 = n + q(n − q); (C + DL)(A + BL)⁻¹; (b, c) ↦ (be^{−2aT}, ce^{−aT}), 3 + 1 + 1 = 5 | Pass |
| §11.3 Check 1 | E* spanned by e_u + b e_v, b = 0.1 | ratio (1 + b²e^{−4aT})^{1/2}/(1 + b²)^{1/2} ↓ 1.01^{−1/2} = 0.99504 < e^{−0.001} = 0.99900; in [e^{−θ}, e^θ] for all T iff b² ≤ e^{2θ} − 1 | Pass |
| §11.5(a), §11.6 radii | maximal E; z = (0,0), x = (2ε,0), y = (0,ε) | δ/3-balls disjoint (2δ/3 < δ), cover radius 2δ + ε; √5 ε = 2.236ε ∈ (2ε, 3ε] | Pass |
| §11.6 Check 2 | conformal factor e^{2u(s)} in dimension 3 | density e^{3u(s)}, not flow invariant | Pass |

For the sections outside the sample that neither this table nor the repair touches (§§1.1–1.3, 6.1–6.2, 6.4–6.7, 7.1, 7.3, 7.7, 8.2, 8.5, 8.7, 9.1, 9.3) I recomputed the Checks while reading and found the values of the round-10 table and of the earlier rounds unchanged; those tables carry them.

**Seeded source sample.** D and P flag no locator as unverified. Read this round at the cited lines:

- 2.1: BowenRuelle1975 line 165; BCS2022 lines 43–44 (R01). 2.2: ClimenhagaThompson2016 lines 295–303, 448–463, 1661–1669.
- 3.1: ClimenhagaThompson2016 lines 504–535; BowenEntropyExpansive1972 lines 117–135.
- 4.1: BowenRuelle1975 lines 190–201, 213–222, 409–413; TsujiiZhang2023 lines 106–109 (R02).
- 6.8: BowenPeriodicPoints1971 lines 421–426, 749–750.
- 7.2: BowenRuelle1975 lines 10–18. 7.5: line 13. 7.6: lines 19–24 (estimate for t ≥ t₀, as D says).
- 8.1: ClimenhagaPesin2016 lines 281–283, 1822–1855 (maps for n ≤ 0, clause (iii) with inverses, Remark 11.2: all as D reports).
- 9.2: BowenRuelle1975 lines 119–133, 60–61.
- 10.1: BowenRuelle1975 lines 25–34, 94–95, 381–383, 402–406. 10.3: lines 272–277; TsujiiZhang2023 lines 485–495.
- 10.4: BowenRuelle1975 lines 77–78, 324–325; BowenPeriodicPoints1971 lines 421–426, 667.
- 11.1: BowenRuelle1975 lines 346–363, 409–413. 11.3: lines 643–652, 655–676, 681–701, 702–715, 718–738. Also 11.4–11.5: lines 364–406.
- 7.4 cites only uncertified texts; its statement was recomputed (table).

**Pins opened this round** (file and line; heads `1b1ccf4b…` and `2fd255d9…`, equal to the manifest's). Mathlib: `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank` (`Mathlib/Topology/MetricSpace/HausdorffDimension.lean`:600); `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant` (`Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean`:418); `Flow.fromIter`, `Flow.restrict`, `Flow.toAddAction`, `Flow.restrictNonneg`, `Flow.toHomeomorph`, `Flow.reverse` (`Mathlib/Dynamics/Flow.lean`:143, :178, :196, :241, :301, :335); `AddAction.IsTopologicallyTransitive` (`Mathlib/Dynamics/Transitive.lean`:31); `Continuous.inner_bundle` (`Mathlib/Topology/VectorBundle/Riemannian.lean`:128); `MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` (`Mathlib/MeasureTheory/Measure/Portmanteau.lean`:351); `SmoothPartitionOfUnity.exists_isSubordinate` (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean`:366, `[T2Space M] [SigmaCompactSpace M]`, a closed set); `MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul` (`Mathlib/MeasureTheory/Function/Jacobian.lean`:1184); `piChartedSpace` (`Mathlib/Geometry/Manifold/ChartedSpace.lean`:482); `ModelWithCorners.pi` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean`:521); `Manifold.riemannianEDist` (`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean`:208, valued in ℝ≥0∞); `ErgodicVAdd` (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`:31); `ContractingWith` (`Mathlib/Topology/MetricSpace/Contracting.lean`:42). Tau Ceti: `riemannianVolume`, `riemannianVolume_restrict_source` (`TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`:82, :87); `chartRiemannianVolume`, `chartRiemannianVolume_pos` (`…/VolumeDensity/Measure.lean`:113, :256); `finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean`:52), `graphChart` (`…/Graph.lean`:240); `contMDiffOn_maximalIntegralCurve_geodesicSpray` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Flow.lean`:106); `IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace` (`TauCeti/Geometry/Manifold/Flow/Complete.lean`:61, :154); `brouwerFixedPoint_closedBall` (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:149, `0 ≤ r`); `sphereBundleChartedSpace`, `isManifold_sphereBundle`, `isSmoothEmbedding_coe_sphereBundle` (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean`:143, :161, :181); `catMap`, `det_catMap` (`TauCeti/Dynamics/CatMap.lean`:43, :56); `Sol`, `Sol.riemannianMetric` (`TauCeti/Geometry/Manifold/Riemannian/Sol/Basic.lean`:63, :264); `lyapunovPerronSolution` (`TauCeti/Analysis/ODE/LyapunovPerron/Basic.lean`:529), `lyapunovPerronGraphMap` (`…/Graph.lean`:87), `localStableGraphMap`, `localUnstableGraphMap` (`…/Local.lean`:154, :393). The module docstrings name `instIsManifoldPi`, `extChartAt_pi`, `AddCircle.instIsManifold`, `nonempty_contMDiffRiemannianMetric`, `norm_curveVelocityWithin_eq`, `charpolyRev_catMap` in the files D gives. `roadmaps resolve` lists no name found nowhere.

**Duplication audit.** Searched the open heads and main for "Anosov", "stable manifold", "Sasaki", "geodesic flow", "equilibrium state", "topologically mixing", "hyperbolic set", "Hadamard–Perron", "SRB measure", "Bowen–Margulis", "weak specification". Results: ClassicalErgodicTheory (which puts uniformly hyperbolic smooth dynamics outside its scope and names a roadmap on it as the consumer of its §§8.4–8.6); GeometricTopology and TaubesGromov (Anosov examples only); OperatorAlgebraDynamics and CStarAlgebras (other objects); HeegaardFloer §1.0a on main (stable and unstable manifolds of a hyperbolic zero of a vector field, the object D's hyperbolic sets of flows exclude and D's contract already separates from Tau Ceti's Lyapunov–Perron graphs); no hit for "Sasaki". This roadmap is the owner of what its Scope lists.

Supplier citations resolved this round:

- ClassicalErgodicTheory at its open head: headings §§0.3, 1.4, 3.4, 5.1–5.6, 6.1–6.2, 6.4, 7.1–7.4, 8.1–8.6 exist; names found: `IsExpansive`, `IsExpansiveFlow`, `HasSpecification`, `HasFlowSpecification`, `HasBowenProperty`, `HasFlowBowenProperty`, `IsGibbsMeasure`, `existsUnique_isEquilibriumState`, `existsUnique_isFlowEquilibriumState`, `topologicalPressure`, `flowTopologicalPressure`, `pressureNetSum`, `invariantProbabilities`, `flowInvariantProbabilities`, `IsTopologicallyMixing`, `measureEntropy_flow`, `measureEntropy_toralEndomorphism`, `toralEndomorphism`, `IsEquilibriumState`, `IsFlowEquilibriumState`, `IsMeasureOfMaximalEntropy`, `exists_isEquilibriumState`, `isEquilibriumState_iff_toReal`, `topologicalPressure_eq_iSup`, `coverEntropy_eq_iSup`, `flowTopologicalPressure_eq_iSup`. It consumes ArithmeticDynamics §2.7 for Shannon–McMillan–Breiman and the ergodic decomposition, as D does, so D's citation goes to the owner.
- ArithmeticDynamics §2.7 and GeometryOfNumbersAndQuadraticArithmetic §4.2 ("Entropy and Haar measure on leaves", `countablePartitionEntropy`) at their open heads.
- On main: ProbabilisticAndMetricNumberTheory `birkhoff_pointwise`, `birkhoff_pointwise_ergodic` (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:4650, :4692); GeometricCurrents G6 (`TauCetiRoadmap/GeometricCurrents/README.md`:668–682, the Grassmann bundle, compact over compact base regions); GeneralizedCohomology G4.0b (`TauCetiRoadmap/GeneralizedCohomology/README.md`:1082, graph-chart upgrades at :1148–1150); TangentialBordism §2.3 (B1.5) (`TauCetiRoadmap/TangentialBordism/README.md`:944); RiemannianGeometry has no connection map or Sasaki metric (search of its README), so the second gap asks for nothing provided.

Overlap facts: no other pull request changes this roadmap; no cited id is dropped; this design drops no id. The lead "GeneralizedCohomology §G4.0b is defined only by an open revision" is refuted: main states G4.0b at `TauCetiRoadmap/GeneralizedCohomology/README.md`:1082.

Overlap check: read ClassicalErgodicTheory, MathematicalBilliards, ArithmeticDynamics, OptimalTransport, ProbabilisticAndMetricNumberTheory, RiemannianGeometry; shared: Bowen balls, expansive maps and flows, the Bowen property, Gibbs measures, specification with periodic shadowing, toral endomorphisms, topological mixing of maps, owner ClassicalErgodicTheory, cited by this roadmap; nothing else shared (MathematicalBilliards puts dispersing billiards outside its scope).

**Supplier direction.** The dependency check printed:

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2245 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list. Every `*Needs:*` line was read: each names only targets of earlier sections, pinned declarations, or sections of the suppliers above; §9.3 writes its two missing inputs as the declared gaps, not as supplied.

**Declared gaps.** Same slugs in P's `gaps` and under D's "Required extensions", each with a named supplier (TangentialBordism §2.3 (B1.5); RiemannianGeometry, proposed Part II). Each `needs` is one statement with its hypotheses. Minimal: `Sphere.lean` at the pin has the atlas, the manifold structure and the embedding (:143, :161, :181) and no corestriction theorem; no connection map at the pins or in RiemannianGeometry. Both are used by §9.3 only. Contracts, not findings.

**Shape.** Summary, Scope, Conventions, supplier contracts, build paragraph, eleven layers each ending with Examples and Dependencies, consumers, references. Layers are named by their mathematics; D nowhere says it follows a source. Every definition has its API and at least three Checks; every theorem its hypotheses and a locator. Headlines for the package stage: Bowen's criterion under weak specification for homeomorphisms and flows (§§5.2–5.3); upper semicontinuity of entropy for expansive flows (§3.1); the Hadamard–Perron theorem and local manifolds (§§8.1–8.3); local product structure of locally maximal hyperbolic sets (§§8.4–8.5); Bowen's theorem (§10.2); the Bowen–Ruelle theorem (§10.3); uniqueness of the Bowen–Margulis measure (§10.4); the SRB theorem (§11.6).

**Copyright.** Wording compared at twelve passages: §2.1 with BowenRuelle1975 line 165 and BCS2022 lines 43–44; §2.2 with ClimenhagaThompson2016 lines 295–303 and 1661–1669; §3.1 with lines 504–535 and BowenEntropyExpansive1972 lines 117–133; §4.1 with BowenRuelle1975 lines 190–199; §6.8 with BowenPeriodicPoints1971 lines 749–750; §7.2 with BowenRuelle1975 lines 10–18; §7.6 with lines 19–24; §8.1 with ClimenhagaPesin2016 lines 1822–1843; §10.1 with BowenRuelle1975 lines 25–34; §10.3 with lines 272–277; §11.1 with lines 346–358; §11.3 with lines 681–683 and 718–733. What is shared is formulas, standard names and hypothesis lists; D's definitions differ in form (pointwise subspaces without continuity in §7.2, backward sequences in §8.1(iii), real times in §11.3(a)). No table, figure or list of examples is taken over.

Source independence: 12 passages compared with 6 sources (BowenRuelle1975, ClimenhagaThompson2016, ClimenhagaPesin2016, BowenPeriodicPoints1971, BowenEntropyExpansive1972, BCS2022), none shared beyond formulas, standard names and hypothesis lists; largest share BowenRuelle1975, 42 of 124 locators in the layers; contents compared with BowenRuelle1975 (Introduction, Symbolic Dynamics, Equilibrium States, Attractors, Main Results, Appendix): independent. D has no symbolic-dynamics layer, Layers 1–9 have no counterpart section there, and Layer 11 interleaves that source's Section 4 and Appendix in the order its *Needs* lines force (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5).

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972, HirschPalisPughShub1970: settled as uncertified; cited by locator, not read. The sampled target 7.4, and parts of 7.2, 7.5, 7.6, 8.1, 9.2 and 10.1, cite these.
- The displayed formulas of BowenRuelle1975 Theorem 3.3, Proposition 4.4 and Lemma A.2 are garbled in the extraction; the prose hypotheses and conclusions were read.
- §11.3 Check 3 (ratios unbounded without the C² hypothesis) is asserted without an example in D; I did not construct one.
- Lean elaboration: not available in this lane; there is no Lean file.
- Ownership against the open pull requests was checked through `roadmaps grep` and `roadmaps show` at the index of 2026-11-15T18:22:21Z, not from sibling checkouts.

## Source issues

- **Error** in BowenRuelle1975 at the proof of Theorem 5.1, printed page 192: the source says the ball of radius 2ε about x contains the ε-ball about z once the two ε-balls meet; it should be radius 3ε, by the triangle inequality; affects the proof.
- **Gap** in ClimenhagaPesin2016 at the derivation of Theorem 11.1, page 40 of arXiv v1: the source says γ₀ need only satisfy λ(1 + γ₀) < μ; it should also satisfy γ₀ < μ − 1, without which no δ₀ meets its own condition; affects the proof.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, page 40 of arXiv v1: the source says the maps f_n are given for n ≤ 0 and then indexes the family of graphs by all integers n; it should use one index set; affects nothing.

## For the human reviewers

- ClassicalErgodicTheory, supplier of what Layers 1–5 import, is an open pull request by another author adding a new folder; it is not in `merge-order/ORDER.txt`, so the dependency check does not see that edge.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e9f612490631c49ea3a1b60cb82aec6ba9bfe9d3", "job": "REV-DESIGN-HyperbolicDynamicsAndThermodynamicFormalism~11", "model": "fable", "worker": "chris-x29"} -->
