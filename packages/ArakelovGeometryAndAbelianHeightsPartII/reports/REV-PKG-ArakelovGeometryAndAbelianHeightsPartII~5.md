<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1056#issuecomment-6403001764 -->
Review (claude) of 789d041

Verdict: accepted
Conditional on the announced gaps: `singular-pluripotential-products`, `curve-moduli-noether-positivity`

1. **F01** (P3) Curvature measure at a non-normalised archimedean point is used but not defined

   **Location.** §10.3, line 1441: "for |·| = |·|_∞^b (0 < b ≤ 1) φ(C) is b times this sum, by §7.6(4)"; line 1443 (route to (4)): "c₁(O(Δ)_a)², a measure on (C×C)^an, is unchanged along the homeomorphism of §7.6(1)"; §7.6 route, line 1145: "they keep the curvature and the zero-mean condition".

   **Claim.** φ(C) = −∫ g_{Δ,a} c₁(O(Δ)_a)² is evaluated over an archimedean field (K, |·|_∞^b) with b < 1, and the Chern measure there is taken to be the one at the usual absolute value.

   **Witness.** §0.1 (line 138) defines c₁(L̄) = (1/πi)∂∂̄ log‖s‖ + δ_div(s) for the usual absolute value only, and §2.6 (line 513) defines measures only on the fibre X_v^an over a place v. No sentence defines the measure at a point |·|_∞^t with t < 1. Read literally with the §0.1 formula on the b-th-power metric, the measure is b·c₁ (the Green function is b times the old one, line 1143), so c₁(O(Δ)_a)² would be b² times the old measure and φ would scale by b³, contradicting line 1441 (factor b) and the Check at line 1462 (a = 1/2 halves φ). The three statements are consistent only under the convention that the measure is transported unchanged along the homeomorphism of §7.6(1).

   **Repair.** Add to §7.6(1) (or to §2.6) one sentence: at a point |·|_∞^t of the archimedean ray (0 < t ≤ 1) the curvature measure of a metrized line bundle is the transport of its measure at the usual absolute value along the homeomorphism of §7.6(1), equivalently (1/(tπi))∂∂̄ log‖s‖_t + δ_div(s); its mass is deg L for every t. Then §10.3(2)'s factor b, §10.3(4)'s "c₁(O(Δ)_a)² unchanged", and §7.6(4)'s "keep the curvature" follow from g ↦ t·g alone. Tested on the instance that exposed it: Fubini–Study O(1) on ℙ¹ at |·|_∞^{1/2} has Green function half the usual one; the literal §0.1 current has mass 1/2 ≠ deg = 1, the transported measure has mass 1; and the §10.3 Check (a = 1/2 at a real place) gives φ/2 with the transported measure and φ/8 with the literal current.

2. **F02** (P3) §6.4(1) is stated for big polarizations although its route needs only the nef height machine

   **Location.** §6.4, line 1005: "Let k₀ be finitely generated over ℚ with a big polarization B (the Hᵢ are nef and big). (1) For an abelian scheme 𝒜 → S … |ĥ^B(P) − h^B(P)| ≤ c·max{1, h^B_S̄(π(P))}"; route, line 1007: "Apply the Moriwaki height machine and the duplication estimate exactly as in the imported HeightsRationalPointsAndObstructions Layer 0 proofs."

   **Claim.** The Silverman–Tate comparison (1) requires the polarization to be big.

   **Witness.** The route uses only additivity, functoriality and boundedness below off the stable base locus. In the sources these hold for every polarization with nef Hᵢ: moriwaki-2000 lines 648–653 (Proposition 3.3.7(2)–(3), no bigness), bigness entering only at Northcott, lines 654–657; gao-habegger-2019 lines 2556–2563 (Proposition A.1(1)–(3), general polarization), bigness used only at lines 2564–2567 (Northcott) and 2649–2652 (to make base heights unbounded for the specialization limit). wazir-2006 lines 90–91 call the height "arithmetic" only for big polarizations, which is a naming convention, not a hypothesis of the comparison argument. The statement is therefore narrowed below what the sources prove.

   **Repair.** State (1) for every polarization B = (B; H̄₁, …, H̄_d; τ) with nef H̄ᵢ, and keep "big" where Northcott or an unbounded base height is used: the torsion criterion of §6.3 and the specialization limit (2) of §6.4. Add the zero polarization over ℚ(t) (H̄ = O with the trivial metric, §6.1 Check, line 964) as the control: every height is 0, so (1) holds with both sides 0, while (2) is vacuous there because h^B_S is bounded, which is why (2) keeps bigness. Consumer note: the board's HeightsRationalPointsAndObstructionsPartII design names a gap `moriwaki-silverman-tate-nef` asking for exactly this extension of §6.4(1) from big to arbitrary Moriwaki polarizations; this brief does not carry that intake note, so it is recorded here as a consumer note, and the repair above satisfies it without a new target.

Two findings, both P3, no P1 or P2. The round-4 finding is repaired at the current head, and the repaired pattern (an archimedean absolute value raised to a power that is no longer an absolute value) occurs nowhere else in the package. Acceptance is conditional on the two declared supplier gaps `singular-pluripotential-products` (ComplexComparisonPartII §C5.4) and `curve-moduli-noether-positivity` (StableReductionPartII §§MC.4–MC.6).

All package locations below are in `packages/ArakelovGeometryAndAbelianHeightsPartII/README.md` unless another file is named. Source passages are cited as `<source id> line N`; none is reproduced.

## Verified sound

### Round-4 finding checked at the current head

| Round-4 finding | Repaired passage (current head) | Status |
| --- | --- | --- |
| F01 (P2) unrestricted rescaling |·| ↦ |·|^a at archimedean places | §7.6, line 1143: archimedean K is ℝ or ℂ with |·| = |·|_∞^b, 0 < b ≤ 1; (1) allows every a > 0 nonarchimedean and exactly ab ≤ 1 archimedean; (2) restricted to nonarchimedean K; (4) gives the b-th powers of the Arakelov metrics. Checks at lines 1150–1154: ℚ₂ with a = 2; real usual norm with a = 2 rejected by 4 > 2; a = 1/2 accepted by √2 ≤ 2; b = 1/2, a = 2 accepted; trivial valuation; no valuation ring at a real place. | Repaired |
| F01, same pattern in §2.4 | Line 486: archimedean points |σ(·)|_∞^t with 0 < t ≤ 1 (yuan-zhang-2025 line 2434); Check at line 494 with t = 1/2, t = 2, 2-adic s = 2. | Repaired |
| F01, §7.4 Check | Line 1120: labelled nonarchimedean, |ϖ| = e⁻¹, a = 2, Green value 1 → 2. | Repaired |
| F01, §10.3 scaling API | Line 1441 clause (4), API line 1452, Check line 1462 (unit loop a = 2 gives 1/6; real place a = 1/2 halves φ; a = 2 rejected). | Repaired; R01 asks for the measure convention it relies on |
| F01, §10.6 | Line 1504: φ at the field's own absolute value, t times at exp(−t·ord_v) and at |σ(·)|_∞^t, 0 < t ≤ 1; Check line 1519. | Repaired |
| F01, §10.14 | Line 1657: a_i = 1/log(1/|t_i|) used only for |t_i| ≤ e⁻¹, so 0 < a_i ≤ 1; Check line 1662. | Repaired |
| F01, §11.3 route | Line 1707: both Green functions scale by t at |·|_∞^t; §2.3 added to *Needs*. | Repaired |
| F01, §13.8 API | Line 1974: value at the normalised archimedean point, multiplied by t on the ray. | Repaired |

The repaired pattern was searched through every occurrence of "rescal", "power", "|·|^", "exponent" and "ray" in the package. The remaining occurrences are constant rescalings of a metric (§§2.7, 10.11, 13.x), the nonarchimedean ramification renormalisation (Conventions, §§7.5, 10.3), and §2.1's archimedean ray already restricted to 0 < t ≤ 1. No further instance of an inadmissible exponent exists.

The reason yuan-zhang-2025 line 2434 supports the repair: the archimedean part of (Spec ℤ)^an is exactly {|·|_∞^t : 0 < t ≤ 1}, and lines 2437–2439 identify the fibre of U^an over |·|_∞^t with U(ℂ)/Gal(ℂ/ℝ) for every such t, which is the homeomorphism §7.6(1) uses.

### Principles

No route-specific shortcut, no re-planned roadmap (the parent ArakelovGeometryAndAbelianHeights, HeightsRationalPointsAndObstructions and ArithmeticDynamics are consumed by section and the scope paragraph says where each stops), no copied passage (every locator is a theorem, page and line pointer), no computational algorithm, no `set_option`, no sorry'd data. The dependency check is clean (below). The two declared gaps are precise and minimal (§C5.4 is consumed for the smooth current calculus and the gap asks only for the singular Bedford–Taylor extension; §§MC.4–MC.6 asks for moduli, compactification, Noether isomorphisms and Hodge positivity, none of which Mathlib, Tau Ceti or an earlier roadmap provides), and they are declared with the same slugs in `design/plan.json` and in the README (lines 99 and 117–119).

### Seeded source verification

Pages are printed pages of the versions in `sources.toml`. Every sampled target was read at its locator; hypotheses were compared, not only theorem numbers.

| Target | Locator read | Result |
| --- | --- | --- |
| 1.9 Domination by nef effective model divisors | yuan-zhang-2025 Lemma 5.1.7(1), p. 138, lines 5315–5326 and proof 5330–5340; yuan-2026 Remark 4.4, p. 67, lines 2262–2273 | Statement matches: for every adelic divisor D on flat essentially quasi-projective integral X there is a model adelic divisor D′ induced by an effective nef arithmetic divisor on a projective model with −D′ ≤ D ≤ D′. Remark 4.4 uses the same domination (its internal citation number is a source misprint, below). Checks on Spec ℤ: D = ([2],0) ≤ ([2],c) with D′ − D = (0,c), D′ + D = (2[2],c), deg D′ = log 2 + c ≥ 0; (0,−1) ≤ (0,1) and (0,1/2) fails. |
| 2.5 Effectivity is detected by Green functions | yuan-zhang-2025 Lemma 5.1.2, p. 134, lines 5121–5127; yuan-2026 proof of Lemma 3.5, p. 47, lines 1601–1606 | Matches, including the normality hypothesis for the total-Green-function criterion and the density reduction. Check: O(c) on Spec ℤ has Green value tc at |·|_∞^t, 0 at finite rays; c = −1, 0, 1 give false, true, true. |
| 3.3 Composition and projection formulas | yuan-zhang-2025 Lemma 4.6.1, pp. 128–129, lines 4909–4933 | Hypotheses (π and π∘ψ flat, S normal; ψ flat and Y normal for (1)) match; the source's "surjective" equals the package's "dominant" for a projective ψ onto integral Y; d = 0 for non-dominant ψ matches lines 4927–4928; the r = 0 case with the function-field degree (source (4)) is the package's Check. Values: iterated norms of degrees 2 and 3 give O(6); fibre degree 3 against π^*O(2) gives O(6). |
| 4.2 Adelic volume and bigness | yuan-zhang-2025 Theorem 5.2.1, p. 141, lines 5439–5456 | Existence of the limit with d the absolute dimension of a quasi-projective model, and equality with the limit of model volumes, match. Check: vol^(Spec ℤ, O(c)) = lim log(2⌊e^{mc}⌋+1)/m = max(c, 0). |
| 4.6 Heights of algebraic points | yuan-2026 §4.1.2, pp. 63–64, lines 2154–2170; yuan-zhang-2025 §5.3.1, pp. 152–153, lines 5945–5959 and §5.3.5, p. 157, lines 6126–6144 | Normalisation by [K(x):ℚ] (k = ℤ) and [K(x):K] (k a field), the vector-valued height ⟨L̄|_x̃⟩/deg(x̃), and the Moriwaki condition (nef, H̄^d = 0, geometric (d−1)-power positive, restriction to F/ℚ or to F/K with K of transcendence degree one, automatic for d = 1) match the source word for word in content. Values: [1:2] over ℚ gives log 2, over a quadratic field 2 log 2 relative and log 2 absolute; [1:t] over k(t) gives 1 and 2 after t = u². |
| 5.4 Adelic Hodge bundle | yuan-zhang-2025 Theorem 5.5.1, pp. 175–176, lines 7012–7035; yuan-2026 Lemma 3.4, pp. 43–44, lines 1445–1466 | Adelic extension of (ω(S), ‖·‖_Fal) with h = h_Fal for s ∈ S(ℚ̄), the Faltings norm (i^{g²}/2^g)∫α∧ᾱ and the determinant L² norm (i/2)∫β∧β̄ identified through the curve–Jacobian isomorphism, all match. Values: g = 1 Deligne shift (log π)/2, g = 2 shift log π. |
| 7.3 Canonical admissible measure | yuan-2026 Proposition A.2, pp. 108–109, lines 3662–3683; §A.3 hypotheses, lines 3617–3640 | Unique probability measure with "admissible iff integrable and c₁ = deg·μ_a", defined from i_α^*θ_α, vanishing of c₁ for algebraically trivial admissible M, Calabi uniqueness. Values: unit banana r_e = 1/2, density (1/2)/(1+1/2) = 1/3 per edge, mass 3·(1/3) = 1 (recomputed numerically); good reduction δ_ζ. |
| 8.2 Admissible extensions | yuan-2026 Definition 2.5 and Proposition 2.6, pp. 30–32, lines 1031–1060 | Existence for W = X, X×_S X or an abelian scheme; uniqueness up to ker(P̂ic(S/k)_int → Pic(S)); the torsion-cokernel route through i_α^* matches lines 1053–1060. Check: on Spec ℚ, O(1) and O(2) twists differ by O(1). |
| 10.7 Triple self-pairing of the difference map | yuan-2026 Theorem 3.6 and proof, pp. 51–52, lines 1734–1789; de-jong-2018 Theorem 8.1, p. 28, lines 1299–1315 | Identity (12g−4)P − 8O(Φ_S), the five auxiliary pairings including B(D,D,wᵢ) = −P and B(D,D,D) = P − O(Φ_S), match. Values: 8 − 24 + 24 + 12(g−1) = 12g − 4; g = 2 gives 20, g = 3 gives 32. |
| 11.4 Bigness of the admissible canonical bundle | yuan-2026 Theorem 1.3, pp. 11–12, lines 382–391; Theorems 3.1–3.2 and proof, p. 40, lines 1320–1346 | Hypotheses (S flat quasi-projective normal integral, smooth relative curve of genus g > 1, maximal variation = generically finite moduli map) match; the dimension-zero convention (line 1333) is the package's deg_k[S] > 0; a = 4g(g−1)(2g−2) matches line 1345. Values: g = 2, S = Spec 𝔽₄/𝔽₂: a = 16, P⁰ = 2, term 32, deg_k ω = 32/8 = 4 = 2·2. |
| 12.2 Relative powers | yuan-2026 proof of Theorem 4.1, pp. 60–63, lines 2053–2060 and 2122–2143 | b_m = a^{m−d}M^d (line 2060) and the vanishing claim "N(r) ≠ 0 only for a permutation of (e+1, e, …, e), then a^{m−1}M" (lines 2126–2128, 2142–2143) match (1) and (2). Values: Spec 𝔽₄/𝔽₂, ℙ¹, O(2): selected degrees 4 and 8 for m = 1, 2; e = 1, m = 2: (2,1),(1,2) give aM, (3,0),(0,3) give 0. |
| 12.3 Potential-bigness criterion | yuan-2026 Theorem 4.1, pp. 60–63, lines 2044–2052 and 2114–2128 | Equivalence (1)⇔(2)⇔(3) under nef L̄ with positive fibre degree matches; the package's m ≥ max{1, dim S} refines the source's m ≥ dim S by excluding m = 0 when dim S = 0, which the definition requires. Values: Spec 𝔽₄/𝔽₂, e = 1, a = 2: full top degrees 4 and 16 at m = 1, 2, selected term 8 with binomial 2. |
| 12.6 Restriction across characteristics | yuan-2026 Theorem 4.10 explanation, p. 82, lines 2745–2780 | The two compositions through P̂ic(S_{𝔽p}/𝔽p) or P̂ic(S_ℚ/ℚ), then P̂ic(S_k/k), then y′^*, with degrees over k, match; the package's restriction to integral test schemes closes a source gap (below). Values: O(1) on ℙ¹_ℤ restricts to degree 1 at p = 2, 3; O(c) to shift 0; ℤ[x]/(x²−2) at 2 gives 𝔽₂[x]/(x²), non-integral. |
| 13.7 Positive comparison height | yuan-2026 §4.4.1, p. 78, lines 2641–2653; gaudron-remond-2014 Definition 2.1 and normalisation, pp. 6–7, lines 305–322, Corollaire 8.4, p. 37, lines 2177–2178 | h_M̄ = 2ĥ + h_Fal + c matches line 2642; Gaudron–Rémond's h(A) ≥ −(g/2)log(2π) in the (2π)^{−g} normalisation and h_F = h − (g/2)log π (line 322) give h_Fal ≥ −(g/2)log(2π²) in the Faltings normalisation the package fixes; c = (g/2)log(2π²) + 1 gives h_Fal + c ≥ 1 and ≥ h_Fal. Values: g = 1: (log π)/2 ≈ 0.5724, −(1/2)log(2π²) ≈ −1.4913, −(1/2)log(2π) ≈ −0.9190, min h_Fal ≈ −0.749 − 0.572 ≈ −1.321 lies between them. The source's printed constant is an error (below); the package already uses the corrected one. |
| 13.10 Uniform comparison | yuan-2026 Theorem 1.4, pp. 14–15, lines 477–494; Theorem 4.11, p. 85, lines 2871–2880; Theorem 4.14, p. 92, lines 3096–3110 | Quantifiers (∀ g > 1 ∃ c₃, c₄ > 0 ∀ K ∀ C, non-isotrivial in the function-field case), the normalisation [·] = ω²/[K:ℚ] for number fields and degrees over k for function fields, the function-field constants 4^{−4g²}/12 and 12, and the number-field lower bound max{h/12 + c₅, ((g−1)/(2g+1))c₀} all match. Values: H = max(1, 24|c₅|), c₃ = min(1/24, c′/H); on h ≤ H, [ω²] ≥ c′ ≥ c₃ max(h,1); on h ≥ H, h/12 + c₅ ≥ h/24 ≥ c₃ h. |

The author flagged no locator as unverified. `sources.toml` was not changed; no source was fetched; `needs-references.toml` was not written.

### Computed adversarial evidence

W is the admissible canonical self-intersection, P = π_*⟨w,w⟩, D = Ō(Δ)_a, h the stable Faltings height in the (i^{g²}/2^g) normalisation. Rows cover the repaired passages, the sampled targets, the headline theorems and the targets the findings touch.

| Statement | Instances tried and values on each side | Result / change |
| --- | --- | --- |
| §7.6(1) nonarchimedean | ℚ₂, a = 2: |2| 1/2 → 1/4; max(|x|,|y|)² preserved; Green 1 → 2, norm e⁻¹ → e⁻²; a = 1 fixes both | Holds; none |
| §7.6(1) archimedean, negative | ℝ usual (b = 1), a = 2: |1+1|² = 4 > 2 = |1|²+|1|²; a = 1.01: 2^{1.01} ≈ 2.014 > 2 | Excluded by ab ≤ 1, bound sharp; none |
| §7.6(1) archimedean, positive | b = 1, a = 1/2: √2 ≤ 2, Green 1 → 1/2; b = 1/2, a = 2: ab = 1, |2| = √2 → 2, Arakelov^{1/2} → Arakelov | Holds, no narrowing; none |
| §7.6(1) trivial valuation | ℙ¹ over trivially valued k, O(1), point with |t| = e: ‖x₀‖ = e⁻¹; at |t| = e² it is e⁻² = (e⁻¹)²; unit generator 1 → 1 | Holds along the homeomorphism; none |
| §7.6(1) homeomorphism source | yuan-zhang-2025 lines 2434–2439: ray (0,1], fibre over v_∞^t is U(ℂ)/Gal(ℂ/ℝ) for every t | Supported; none |
| §7.6(2) | ℝ usual: 1, 1 in the unit ball, 1+1 = 2 outside | No valuation ring; restricted to nonarchimedean, as stated |
| §7.6(4) and R01 | b = 1/2: Green function g → g/2; literal §0.1 current mass → 1/2·deg; transported measure mass deg; (a)–(d) of §7.4 are homogeneous in the metric power | Consistent only with the transported measure: R01 |
| §2.4 | Spec ℤ: t = 1/2 gives √2 ≤ 2; t = 2 gives 4 > 2 (not a point); 2-adic s = 2 gives |2| = 1/4; trivially valued k has no archimedean point since |n| ≤ 1 for all n | Range (0,1] exact; none |
| §2.5 | O(c) on Spec ℤ, c = −1, 0, 1: Green values −t, 0, t on the ray, 0 at finite rays | Effective iff c ≥ 0; none |
| §1.9 | Spec ℤ: D = ([2],0), D′ = ([2],c), c ≥ 0: D′−D = (0,c) ≥ 0, D′+D = (2[2],c) ≥ 0, deg D′ = log 2 + c; (0,c) fails (−[2],c); (0,−1) ≤ (0,1), (0,1/2) fails | Holds; none |
| §3.3 | norms of degrees 2 then 3 on O(1): O(3) then O(6) = composite degree 6; ⟨L, π^*O(2)⟩ with fibre degree 3 = O(6); r = 0, ψ non-dominant: d = 0 | Holds; none |
| §4.2 | Spec ℤ: vol^(O(c)) = max(c,0) from log(2⌊e^{mc}⌋+1)/m; Spec 𝔽₂, Spec 𝔽₄ over 𝔽₂: volumes 1, 2 for every L (0! = m⁰ = 1) | Holds; none |
| §4.6 | [1:2]: log 2 over ℚ, 2 log 2 relative and log 2 absolute over a quadratic field; k(t): [1:t] height 1, over k(u), t = u², height 2; Spec 𝔽₄/𝔽₂: vector height 0 versus empty degree 2 | Holds; none |
| §5.4 | g = 1: π⁻¹ squared-norm ratio shifts degree by (log π)/2; g = 2 by log π; [K:ℚ] = 2, stable height h: raw degree 2h, absolute h | Holds; none |
| §6.4(1) and R02 | zero polarization over ℚ(t) (H̄ = O, trivial metric): every h^B = 0 and ĥ^B = 0, so (1) holds with both sides 0 and no bigness is used; (2) has h^B_S bounded, so the limit is vacuous | (1) holds for nef B, (2) needs big B: R02 |
| §6.3 | order-2 torsion: [2ⁿ]P = 0 for n ≥ 1, limit 0; height-a point: 0, a, 4a at [0],[1],[2]; quadratic k₀: relative 2a, absolute a | Holds; none |
| §7.3 | unit banana: r_e = 1/2, μ_a density 1/3 per edge, mass 1 (recomputed); good reduction δ_ζ; genus-two vertex: μ_a = δ_v, c₁(ω) = 2δ_v | Holds; none |
| §7.4 | g = 2: curvature mass 2, Green mean 0, residue norm 1; constant diagonal shift c changes the mean to c; g = 1: (b) reads c₁(ω) = 0 and (d) alone fixes the constant | Holds; none |
| §8.2 | Spec ℚ: twists O(1), O(2) of the same L differ by O(1); fibrewise ratio e^{−c} | Holds; none |
| §9.1–9.3 | d = 2g−2: d² + 2d = 4g(g−1), d²(d²+4d−4g+4) = 16g(g−1)³; g = 2: coefficients 8, 32; −1/8 + 32/256 = 0; g = 3: 24, 384; −1/24 + 384/9216 = 0; g = 1 denominators vanish, excluded | Holds; none |
| §10.1–10.2 | g = 2 unit loop: (δ, ε, φ, τ) = (1, 1/6, 1/12, 1/12); δ + ε − 2φ = 1 = (3/2)δ − 6τ; φ = 1/12 ≥ 1/39; K₄ unit edges (g = 3): r_e = 1, μ density 1/6, ε = 11/6, τ = 5/16, φ = 17/48, φ/δ = 17/288 (all recomputed numerically) | Holds; none |
| §10.3(4) | unit loop g = 2, a = 2: φ 1/12 → 1/6 (equals the ramified renormalisation value); real place a = 1/2: φ → φ/2 > 0; a = 2 rejected (4 > 2); measure mass of c₁(D)² = 2 − 2g = −2 before and after | Holds under the transported measure: R01 |
| §10.6 | unit loop: g_Φ = 1/12 at t = 1, 1/6 at t = 2; archimedean |·|_∞^{1/2}: half the usual φ; good reduction 0; integrand lives on the square (c₁(D)² is top degree there) | Holds; none |
| §10.7 | 8 − 24 + 24 + 12(g−1) = 12g − 4; g = 2: 20; g = 3: 32; Φ coefficient −8; adjunction gives −P not +P | Holds; none |
| §10.9 | g = 2: (2g−1)(3g−1) = 15, 1 + 19.5·15 = 293.5 ≤ 300, Hodge coefficient 12/300 = 1/25 | Holds; none |
| §10.14 | |t_i| = e⁻ⁿ, n = 1, 2, 10: a_i = 1, 1/2, 1/10 ≤ 1, |t_i|^{a_i} = e⁻¹; |t_i| = e^{−1/2} would need a = 2 > 1, excluded; limiting divisorial ε = 1/6 versus archimedean 0 | Holds; none |
| §11.1 | a = 1/156: 1/39 − 2a = 1/78 > 0; along |t| = e⁻ⁿ the lower Green term grows like n/78 | Holds; none |
| §11.2 | Spec 𝔽₂, Spec 𝔽₄ over 𝔽₂: P⁰ = vol = 1, 2 > 0; maximal-variation curve base with λ = 1, g = 2: deg P ≥ 1/25 | Holds; none |
| §11.3 | (12g−4)P − 8Φ nef gives P = (2/(3g−1))Φ + nef since 8/(12g−4) = 2/(3g−1); Φ_S − c₀ has Green value t(φ − c₀) ≥ 0 at |·|_∞^t and φ ≥ 0 at finite points; g = 2, [K:ℚ] = 2, d = 1: raw bound 4c₀/5, normalised 2c₀/5 | Holds; none |
| §11.4 | g = 2, S = Spec 𝔽₄/𝔽₂: a = 16, P⁰ = 2, positive term 32, deg_k ω = 4 = (2g−2)[F:k] | Holds; none |
| §12.2–12.3 | Spec 𝔽₄/𝔽₂, ℙ¹, O(2), e = 1: selected degrees 4, 8; full top degrees 4, 16 (binomial 2 at m = 2); e = 0: m^d L^d; m = 0 excluded | Holds; none |
| §12.4 | m = 1, three points: |Σ| ≤ 3; m = 2, Z = Σ², codimension 2, degree 9, bound √9 = 3; empty Σ has size 0 | Holds; none |
| §12.6 | ℙ¹_ℤ: O(1) at p = 2, 3 has degree 1; O(c) shift 0; ℤ[x]/(x²−2) at 2: 𝔽₂[x]/(x²) non-integral, test scheme Spec 𝔽₂ | Holds; none |
| §13.3 | g = 2, h = 1/10, δ = 1, ε = 1/6: W_model = 1/5, W_a = 1/30 = (2/5)·(1/12) | Holds; none |
| §13.4–13.5 | A(4) = 1 + 46·3 = 139; g = 2 hyperelliptic coefficient 1 + 42.5·2.5 = 107.25; g ≥ 5 bound 109.625; limit 47; 12/139 > 1/12 | Holds; none |
| §13.7 | (log π)/2 ≈ 0.5724; −(1/2)log(2π²) ≈ −1.4913; −(1/2)log(2π) ≈ −0.9190; min h_Fal ≈ −1.321 between them; h + c ≥ 1 with c = (g/2)log(2π²) + 1 | Holds; source constant corrected (Source issues) |
| §13.8 | K₄: (483/17)(17/48) − 6 − 11/6 = 107/48; D̃ − Δ = −181/48 < 0; D̃ − c(3)Δ = 15/8 > 0 with c(3) = 17/288; c = 1/25 gives 3/(2c) + 3 = 40.5 | Holds; none |
| §13.9 | number-field coefficient A(g) + (2g+1)/(g−1) ≤ 139 + 3 = 142 at g = 4 and ≤ 96.9 + 3.5 at g = 3, all < 144; g = 2: 1 + 43.5·2.5 = 109.75 < 144; 2g log(2π⁴) + 4g log(2π) = 6g log(2π²) ≈ 17.90 at g = 1 | Holds; none |
| §13.10 | H = max(1, 24|c₅|), c₃ = min(1/24, c′/H): h ≤ H gives [ω²] ≥ c′ ≥ c₃ max(h,1); h ≥ H gives h/12 + c₅ ≥ h/24 ≥ c₃h; upper bound 12h + 6g log(2π²) ≤ c₄ max(h,1) using h ≥ −(g/2)log(2π²); function fields c₃ = 4^{−4g²}/12 | Holds; none |

### Pinned library declarations opened

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (from `lake-manifest.json`).

| Declaration | File and line at the pin | What it supplies and what it does not |
| --- | --- | --- |
| `NumberField.prod_abs_eq_one` | `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98` | Product formula with the explicit `x ≠ 0` hypothesis and infinite-place multiplicities `w.mult`; no adelic bundles. |
| `Projectivization.logHeight` | `Mathlib/NumberTheory/Height/Projectivization.lean:51` | Relative logarithmic height on projective space over `K`; no absolute normalisation. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112` | Full subcategory of `SheafOfModules` on the invertibility predicate; morphisms are module maps; no metric. |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Structure over `Spec K` with `toOver` and geometric integrality; no canonical metric. |
| `InvertibleSheaf.eulerDegree`, `LineBundleClass.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:70` and `:126` | Difference of truncated Euler characteristics through `eulerCharBelow … 2`; junk values without curve hypotheses, as the README says. |
| `InvertibleSheaf.eulerDegree_canonicalBundle` | `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:168` | Canonical degree `2g − 2` under `IsProper` and the section's standing hypotheses. |

Object greps of the pinned Tau Ceti for "Faltings", "Arakelov", "Berkovich", "Deligne pairing", "adelic", "Moriwaki", "metrized graph", "canonical height" hit only the elliptic canonical-height files, the adelic/idelic topology files of number fields and restricted products; Mathlib has none of "Berkovich", "Arakelov", "Faltings", "Moriwaki", "DelignePairing", "admissible metric". None of these supplies a carrier for a headline, so nothing is statable at the pins and nothing is duplicated.

### Ownership and duplication

The board package index was read first (19 packages; none concerns heights, adelic bundles or curve metrics). The roadmaps service was used to grep the README and `Suggested.lean` of every open roadmap pull request at its head (367 pull requests, index of 2026-10-25) and every roadmap on main, by object: "potentially big", "Moriwaki height/polarization" and "Deligne pairing" match nowhere; "admissible adelic/metric/canonical" matches only the cited suppliers GrossZagierAndArithmeticHeights §§2.4–2.13 (archimedean) and TropicalAndBerkovichArithmetic §6.6 (graphs); "Gross–Schoen" matches only MotivesAndAlgebraicCycles' reference list; "uniform Bogomolov" matches only reference lists; "Faltings height" on main appears only in EllipticCurves' deferral paragraph (lines 1388–1390), which hands the height to an Arakelov roadmap; "adelic line bundle" matches only ArithmeticDynamics §§4.3a, 4.4, 4.11 (the cited global-field slice, compared in §4.9 here), JacobianChallengePartII's consumer notes and HeightsRationalPointsAndObstructions' reference list. This roadmap is therefore the owner of the arbitrary-base adelic completion, the relative Deligne pairing, the curve admissible metrics at nonarchimedean places and their family extensions, Zhang's graph invariants and the ε/φ/Noether divisors, Moriwaki heights, potential bigness and the Faltings-height comparison. `Suggested.lean` declares no names, so no fully qualified name can collide.

### Cross-roadmap citations resolved this round

Every supplier was opened at the head the roadmaps service serves (ArakelovGeometryAndAbelianHeights #1000, HeightsRationalPointsAndObstructions #1017, ArithmeticDynamics #1335, ComplexComparisonPartII #848, TropicalAndBerkovichArithmetic #1494, GrossZagierAndArithmeticHeights #1487, JacobianChallengePartII #1225, NeronModelsAndSemistableAbelianVarieties #852, MotivesAndAlgebraicCycles #1313) or on main (SchemeAndStackFoundations). Lines are in `TauCetiRoadmap/<Name>/README.md` at that head.

| Supplier | Cited sections, resolved | Content check |
| --- | --- | --- |
| ArakelovGeometryAndAbelianHeights | 1.1 (156), 1.2 (191), 1.3 (228), 1.7 (334), 1.8 (378), 1.9 (415), 1.10 (442), 1.12 (522), 1.13 (558), 1.14 (585), 1.15 (617), 2.1 (684), 2.7 (840), 2.8 (858), 3.4 (1027), 5.0b (1360), 5.3 (1446), 5.4 (1470), 5.9 (1623), 6.5 (1737) | §2.7 states h_Del = h_Fal + (g/2)log π; §6.5 states Bost's bound in both normalisations, −(g/2)log(2π) Deligne and −(g/2)log(2π²) Faltings, exactly as §13.7 consumes it. |
| HeightsRationalPointsAndObstructions | 0.11 (234), 0.16 (295), 0.18 (316), 0.19 (328), 0.20 (340), 0.26 (408), 0.27 (416), 0.28 (437), 0.29 (445), 5.17a (2706), 5.17b (2737), 5.17d (2777), 5.17e (2798), 5.17f (2814) | §0.11 is the relative height h_K with the Check h_K/[K:ℚ] absolute, as §4.6 states. |
| ArithmeticDynamics | 4.1a (5879), 4.3 (5897), 4.3a (5913), 4.4 (5927), 4.40 (6750) | §4.3a is the global-field quasi-projective completion with boundary topology, intersections and normalised heights, the object §4.9 compares with. |
| SchemeAndStackFoundations (main) | 0.1 (487), 0.3 (551), 0.20 (1302), 0.21 (1394), 3.5 (4876), 4.11 (5528), 4.12 (5613), 5.1 (6567), 5.2 (6653), 5.3 (6701), 5.5 (6768), 5.6 (6921), 5.12 (7336) | Norms of invertible sheaves, degrees, Chern classes, Bézout as cited. |
| ComplexComparisonPartII | C5.4 (3019) | Current calculus and cycle integration on smooth manifolds; the singular extension is the declared gap. |
| TropicalAndBerkovichArithmetic | 0.1 (190), 0.12 (397), 0.15 (456), 0.22 (639), 0.23 (674), 2.7 (1171), 2.13 (1266), 3.1 (1470), 3.3 (1523), 6.1 (2050), 6.2 (2095), 6.3 (2121), 6.4 (2146), 6.6 (2205), 6.7 (2240), 6.8 (2280) | §6.6 states μ_a = (1/g)(Σ g(v)δ_v + Σ ds/(ℓ_e + r_e)) with r_e the deleted-edge resistance, the formula §7.3 imports. |
| GrossZagierAndArithmeticHeights | 2.2 (714), 2.3 (741), 2.4 (766), 2.8 (846), 2.10 (905), 2.12 (957), 2.13 (971) | §2.4: c₁ = deg(L)μ_Ar with ‖1‖ = exp(−g); §2.8: mean-zero symmetric Arakelov Green function; both in the unsquared convention of the Conventions. |
| JacobianChallengePartII | 1.2 (212), 1.3 (233), 1.4 (258), 2.2 (315), 2.4 (344), 2.5 (356), 2.6 (368), 2.7 (407), 3.1 (431), 3.3 (473), 3.4 (494), 3.5 (524), 3.7 (548), 3.11 (598), 3.13 (614), 4.5 (708), 4.7 (738), 4.9 (770), 5.1 (800), 5.2 (810), 6.3 (1035) | §3.3: Θ = Δ_J^*(P^∨) with zero rigidification; §6.3: det π_*ω ≅ det e^*Ω¹ for stable families. |
| NeronModelsAndSemistableAbelianVarieties | 3.3 (1356), 3.9 (1619), 3.10 (1645), 3.11 (1689), 3.12 (1717) | Identity-component base change and semistability, as §13.1 consumes. |
| MotivesAndAlgebraicCycles | 2.2 (353), 2.3 (370) | Weil cohomology and homological triviality. |
| StableReductionPartII | §§MC.4–MC.6: not on main, not in an open pull request | The declared gap `curve-moduli-noether-positivity`; the resolver's lead is this contract, not drift. |

### Supplier order and dependency check

The required check, run from the content checkout with the package README, the roadmap name, the board merge order and `--movable`, exited 0 with exactly:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. In the merge order ArakelovGeometryAndAbelianHeightsPartII stands immediately after ArithmeticDynamics, its last supplier. Every `*Needs:*` line (91 targets) was read against the supplier contracts; each cites only earlier roadmaps, pinned declarations, the two declared gaps, or an earlier target of this package. The only citations of later material are to the consumer HeightsRationalPointsAndObstructionsPartII in `## Downstream consumers`, which is not a `*Needs:*` edge.

### Shape, headlines and the Lean acceptance test

The README has the prescribed shape: scope and ownership, conventions, exact supplier contracts per supplier, how to read the build, fourteen layers (0–13) each ending with `### Examples` and `### Dependencies`, downstream consumers, worked examples, references. Each of the 44 definition blocks lists an API and at least three Checks; every theorem has hypotheses in the sentence and a locator at the claim; no LaTeX delimiters, process words, pull-request numbers or `lemma` occur. The README's generality equals the Lean's trivially, since the Lean file states nothing.

Headline theorems of the README: §§11.2–11.4 (nefness and bigness of ω_a and of ⟨ω_a, ω_a⟩ under maximal variation), §12.3 (potential-bigness criterion), §12.5 (theta applications), §13.10 (uniform comparison of [ω_a²] with max{h_Fal, 1}); the deep intermediate families (metrized Deligne pairing, arbitrary-base adelic completion and full faithfulness, adelic Hilbert–Samuel and Siu, invariant extensions, adelic Hodge bundle, Moriwaki height machine, canonical admissible metrics and family extensions, theta identities, graph bounds and global divisors, uniform φ positivity, Gross–Schoen height, Zhang's correction and the two-sided comparisons). Each is named in the module docstring of `Suggested.lean` (lines 9–62) with the missing carrier. None is statable at the pins: the object grep above finds no Berkovich space, adelic bundle, Deligne pairing, metrized graph, Faltings height or abelian-variety canonical height beyond the elliptic one, and §12.4's scheme-theoretic mixed degree of a closed subset of a curve power is absent too. No stand-in, free predicate or scalar restatement is present.

`Suggested.lean` has the single line `import Mathlib`, the module docstring "<title>: target signatures" saying that README.md is the roadmap, the namespace `TauCetiRoadmap.ArakelovGeometryAndAbelianHeightsPartII`, and no declarations. `lake env lean` on the package file, run from the content checkout, exited 0 with no output (no warning, no `sorry`). No `TauCeti.*` import, so no module build was needed. The `#check @name` audit and the one-tactic padding probe each have zero cases, and no dummy declaration exists; nothing is padding.

## Not verifiable

- `moret-bailly-1989`, Théorème 2.5, pp. 491–498: settled uncertified; the Noether constant was checked through yuan-2026 lines 2992–3001 as in round 4; no request made.
- `faltings-1984`, Theorem 6 and pp. 401–402: settled uncertified; the δ normalisation was checked through wilms-2017 and the package's Wilms characterisation; no request made.
- StableReductionPartII §§MC.4–MC.6 and HeightsRationalPointsAndObstructionsPartII exist neither on main nor at an open head; the former is the declared gap contract, the latter a consumer. Their eventual text cannot be reviewed here.
- The brief names the open pull requests it allows as suppliers without checkout paths; ownership against them was checked through the roadmaps service's grep over all open heads, not by opening their files directly.

## Source issues

- **Error** in yuan-2026 at §4.4.1, printed p. 78 (line 2645): the source says Bost's bound is h_Fal ≥ −g log √(2π) for the Faltings height normalised by (i^{g²}/2^g)∫α∧ᾱ as in Lemma 3.4; it should be −(g/2) log(2π²), since −(g/2)log(2π) is the bound in the (2π)^{−g} normalisation and the two differ by (g/2) log π (the g = 1 minimum ≈ −1.321 violates the printed bound); affects the proof (the constant c; the roadmap's §13.7 uses the corrected constant).
- **Misprint** in yuan-2026 at Remark 4.4, printed p. 67 (line 2265): the source says the nef domination comes from Yuan–Zhang Lemma 5.1.6; it should be Lemma 5.1.7(1) of arXiv v9, where 5.1.6 is a remark; affects nothing.
- **Gap** in yuan-2026 at the explanation of Theorem 4.10, printed p. 82 (lines 2767–2779): the source says the restriction passes through the adelic Picard group of the whole characteristic-p fibre S_{𝔽p}; it should be stated on an integral locally closed test scheme of that fibre, since adelic Picard groups are defined for flat quasi-projective integral schemes and the fibre may be reducible or nonreduced; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "789d041", "job": "REV-PKG-ArakelovGeometryAndAbelianHeightsPartII~5", "model": "fable", "worker": "fable-rev142"} -->
