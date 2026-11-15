<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13845#issuecomment-6896718718 -->
Review (claude) of c7cb18a

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 6.3's mass lower bound does not say that the ball must lie in U

   **Location:** `packages/Varifolds/design/README.md:1165–1167`: "and ‖δV‖ ≤ Λ‖V‖ on U, then … ‖V‖(B̄_ρ(x)) ≥ e^{−(Λ + k√κ)ρ} ω_k ρ^k for the ρ admitted in 6.2".

   **Claim:** the bound holds for every ρ < ρ_0, with ρ_0 as in 6.2 (a normal ball contained in W).

   **Witness:** W = ℝ², V = v([−a, a] × {0}, 1), U = B_a(0), Λ = 0, κ = 0, x = 0: ‖δV‖ = δ_{(−a,0)} + δ_{(a,0)}
   vanishes on U, Θ = 1 a.e.; for ρ = 2a, ‖V‖(B̄_ρ(0)) = 2a < 4a = ω_1 ρ.

   **Exact repair:** replace "for the ρ admitted in 6.2" by "for 0 < ρ < ρ_0, where ρ_0 is as in 6.2
   and moreover B_{ρ_0}(x) ⊆ U (so that 6.2's ratio bound holds on (0, ρ_0))". Tested on the witness:
   B_{ρ_0}(0) ⊆ B_a(0) forces ρ < a, and then ‖V‖(B̄_ρ(0)) = 2ρ = ω_1 ρ, equality. `plan.json` 6.3
   states only the density bound and needs no change.

2. **F02** (P3) 7.5 and 7.6 use W for a varifold while W is the standing open set

   **Location:** `packages/Varifolds/design/README.md:1464` ("and W an integral varifold on B_3(0) for h")
   and `:1519` ("integral varifolds W_i for metrics h_i → g_x").

   **Claim:** W is free to name a varifold in Layer 7.

   **Witness:** Conventions, line 100: "W ⊆ M is open"; Layer 7's standing setting (line 1310) and 7.4
   (line 1425–1426, "compact closure in W"), which 7.6 continues, use W for that open set. Same
   pattern as the repaired F03 (one letter, two objects).

   **Exact repair:** in 7.5 (statement, route and Checks) write V for the varifold: ‖V‖(B_3(0)) ≤ Λ,
   ‖δ_h V‖(B_3(0)) < ε², dV(y, S), Θ^k(‖V‖, y), ‖V‖(B_2(x)); in 7.6's route write Ṽ_i for W_i (they
   are 4.5's rescaled varifolds); the same in `plan.json` 7.5 and 7.6. Tested: 7.5 mentions no other
   V, and 7.6's limit "Ṽ_i → θ(x) v(T_x, 1)" then reads with V the limit of 7.4, as intended.

Two findings, both P3, each with an exact repair for a fix round to apply; no P1, no P2. All three findings
of REV-DESIGN-Varifolds~6 are repaired. No gap is declared and none is needed. No maintainer notes
were supplied. No file of the design and no manifest entry was edited; no source was fetched (all
eight cited works are recorded in `packages/Varifolds/sources.toml`). There is no `Suggested.lean`
at the design stage; elaboration: not available (this lane does not elaborate).

## Verified sound

### Previous review (REV-DESIGN-Varifolds~6), finding by finding

| Prior finding | Repaired passage (quoted) | Status and my test |
|---|---|---|
| F01 (1.1 did not cite the pinned Grassmannian) | "Then V ↦ e⁻¹ P_V e is a homeomorphism of `TauCeti.finiteGrassmannian ℝ k N` onto G(E, k), whose inverse sends P to the subspace e(range P) read in coordinates; replacing e by O ∘ e … precomposes it with V ↦ O⁻¹(V)" (line 351–354), with the contract entry (197–206), the scope clauses (27–30, 61–63) and *Needs:* (391–395) | **Repaired.** Opened at the Tau Ceti pin `2fd255d9`: `finiteGrassmannian` (`TauCeti/Topology/Grassmannian/Basic.lean:52`), quotient topology (`:240`), `CompactSpace` for `RCLike` (`Orthonormal.lean:225`), `T2Space` (`Plucker.lean:89`), `toEuclidean` (`Tautological.lean:73`), `toEuclidean_injective` (`:80`), `continuous_starProjection_toEuclidean` (`:110`); Mathlib `Continuous.homeoOfEquivCompactToT2` (`Mathlib/Topology/Homeomorph/Lemmas.lean:479`). Computed: (Oe)⁻¹P_V(Oe) = e⁻¹P_{O⁻¹V}e; e = id, V = span(cos θ, sin θ) gives [[cos²θ, cosθ sinθ], [cosθ sinθ, sin²θ]]; e = R_φ gives R_{−φ}P_{ℓ_θ}R_φ = P_{ℓ_{θ−φ}}; frame (1, 1): ½[[1,1],[1,1]]² = itself, [[1,1],[1,1]]² = 2[[1,1],[1,1]]; k = 0 and k = N one point on each side (`Basic.lean:185`, `:198`); k > N empty on both sides (`Basic.lean:181`). The fix's correction of the suggested wording is right: the pin does have the projection map (`Tautological.lean:110`), so "no metric" only. |
| F02 (7.4 named tangents as co-normals) | "at a peak the outward unit co-normals of the two segments are (1, 1)/√2 and (−1, 1)/√2, with sum (0, √2); at a trough they are (1, −1)/√2 and (−1, −1)/√2, with sum (0, −√2)" (line 1446–1448) | **Repaired.** For a segment a → b with unit tangent τ, δ(X) = ⟨X(b), τ⟩ − ⟨X(a), τ⟩. Peak (1/2, 1/2): (1,1)/√2 − (1,−1)/√2 = (0, √2). Trough (2/3, 0), i = 3: (1,−1)/√2 − (1,1)/√2 = (0, −√2). Totals: i = 2 gives √2 + 2; i = 3 gives 2√2 + 2 = √2(i − 1) + 2. |
| F03 (3.1 used F for a set and a map) | "the integrand (x, S) ↦ J_S f(x) φ(f(x), df_x(S)) is continuous where J_S f(x) ≠ 0 and extends continuously by 0 to {J = 0}; on G_k(F) it vanishes outside the compact set G_k(f⁻¹(π(spt φ)) ∩ F), so its product with χ ∘ π …" (line 652–656) | **Repaired.** On G_k(F): x ∈ f⁻¹(π spt φ) ∩ F ⇒ χ = 1; otherwise φ(f(x), ·) = 0; so the product equals the integrand on G_k(F), which carries every V_j and V (1.3). Fold f(t) = t², V = v([−1, 1], 1): integrand \|2t\|φ(t²) → 0 at t = 0, ∫ = 2∫_0^1 φ. Non-proper control V_j = v({j} × [0,1], 1), f = (0, y_2): f_#V_j constant, V_j → 0, so properness on F is needed and present. |

Same-pattern search on the rest of the text. (i) Library carriers not cited: grep of both pins for
"varifold" finds nothing; `IsStarProjection` does not occur under `TauCeti/Topology/Grassmannian/`,
so the projection presentation is not at the pin. (ii) Co-normal directions: half hyperplane
(δ[Σ](X) = −∫X¹, η = −e_1), step multiplicity (δV(X) = X¹(0) − 2X¹(0) = −X¹(0), η = −e_1), half-line
(σ = δ_0): all outward. (iii) One letter for two objects: R02. No finding of the repair report was
marked not actionable.

### Principles, shape, plan

Read all 1754 lines of the README and `plan.json` (9 layers, 34 targets, 34 distinct ids, no
prerequisite on a later target, no `gap:` prerequisite, `gaps` empty, every target with at least 3
tests; baseline Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the commits of the two pinned checkouts).
Checks per target in the README: 1.1: 7, 1.2: 3, 1.3: 3, 1.4: 4, 2.1–2.3: 4 each, 3.1: 4, 3.2: 3,
3.3: 4, 4.1: 4, 4.2–4.4: 3 each, 4.5: 4, 5.1: 6, 5.2: 3, 6.1: 3, 6.2: 3, 6.3: 6, 6.4: 7, 6.5: 3,
7.1: 3, 7.2: 5, 7.3: 3, 7.4: 4, 7.5: 4, 7.6: 3, 8.1: 3, 8.2: 3, 9.1: 4, 9.2–9.4: 3 each. No
route-specific narrowing (arbitrary Radon measures on the Grassmann bundle of a Riemannian manifold;
varying metrics in Layer 7); no re-planned roadmap; no algorithm; no Lean file, hence no sorry'd
data and no `set_option`. Shape: Summary, Scope and ownership, Conventions, Exact supplier
contracts, How to read the build, nine layers each ending in Examples and Dependencies, Downstream
consumers, References. Grep for LaTeX delimiters, pull-request numbers, machine paths, HTML anchors,
round labels, "optional", "deferred", "so far", "removed": none; "lemma" occurs only in "Gauss
lemma" and "multiplicity lemma". No backticked name is presented as this roadmap's own: all 65
distinct backticked identifiers are library names.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 comparison (changed) | see F01 row | P_{ℓ_{θ−φ}} against P_{ℓ_{θ+φ}} for the wrong direction; idempotent ½[[1,1],[1,1]] against non-idempotent [[1,1],[1,1]] | sound |
| 1.1 image-plane projection | L = diag(1, 0), P = P_{ℓ_0}; P = P_{ℓ_{π/2}} | A = 1, Q A⁻¹Q* = diag(1, 0); Q = 0, A = diag(1, 0) singular | sound |
| 1.1 compactness, complement | N = 0; k = 0; P ↦ 1 − P on ℓ_0 | G = {0}; norm 0; diag(0, 1) = P_{ℓ_{π/2}}, tr = 1 | sound |
| 1.2 metric dependence | h = diag(1, 4), u = (1, 1) | h(e_1, u)/h(u, u) = 1/5 against 1/2 | sound |
| 1.3 weight does not determine V | χ·tr(P diag(1, 0)) on two lifts; unit disc | ∫χ dH¹ against 0; mass 2 | sound |
| 1.4 semicontinuity, compactness | δ_{(je_1,P)}; j·δ_{(0,P)}; alternating lifts | masses 1, limit 0; mass j on a compact set; integrals alternate ∫χ, 0 | sound |
| 2.1 chart law | φ = 2·id, μ = H¹⌞L | φ_*μ(A) = H¹(L ∩ A/2) = ½H¹(L ∩ A); 1/J = 1/2 | sound |
| 2.3 weight identity | graph of \|t\|^{3/2} | (16/27)((13/4)^{3/2} − 1) = (26√13 − 16)/27 = 2.879 > 2√2 | sound |
| 3.1 continuity (changed) | see F03 row | \|2t\|φ(t²), 2∫_0^1 φ | sound |
| 3.3 doubling on D | \|y_1\|H¹⌞L + \|y\|⁻¹dy | ‖V‖(B_r) = r² + 2πr, Θ(0) = π; ratio on D: 9r²/r² = 9 ≠ 3; ‖V‖(B_r ∖ D) = 2πr not o(r² + 2πr), so 0 ∉ D' | sound |
| 4.1 first variation | circle, X = ψy; vertical lift, X = ψy_2e_2 | div_T X = 1, δ = 2π = d/dt 2πe^t; div_S X = ψ on the axis although X = 0 there | sound |
| 4.2 Riesz for fields | ⟨X(0), 2e_1⟩; ∫(X¹ + X²) | 2δ_0, η = e_1; √2·vol against 2·vol for the sup norm | sound |
| 4.3 | X_n = n⁻¹ψ sin(ny_2)e_2 on the vertical lift | sup ≤ 1/n, δV(X_n) = ∫ψ(t, 0)dt for all n | sound |
| 4.4 decomposition (headline) | H = −fη; half hyperplane; θ = 1 + y_1²; dilation | ‖δV‖ = f‖V‖ + σ with \|H\| = f; η = −e_1; δV(X) = −∫X¹θ' ⇒ H = (θ'/θ)e_1; (div Y)∘η = λ div(Y∘η) ⇒ λ^{1−k}, \|H\| = λ/R | sound |
| 4.4 bounded-H criterion | both directions | ‖δV‖(U) ≤ Λ‖V‖(U) on open U ⇒ σ = 0 and density ≤ Λ; converse by the formula | sound |
| 4.5 two metrics | h = c²g; g = e^{4t}dt², h = 4g, X = (1 − t²)²; scaling | V^h = c^kV, left side \|c^k − 1\|\|δ_gV(X)\|; Γ = 2, δ_gV(X) = 2, δ_hV^h(X) = 4, left side 2 > sup\|X'\| = 8/(3√3) = 1.54; ‖h − g‖_{C⁰} = 3e⁴; m*(λ⁻²g̃) = g̃_λ for m(z) = λz, ‖δ‖ scales by c^{k−1} = λ^{1−k} | sound |
| 5.1 C² submanifold | S^k, X = ψx; graph of \|t\|^{5/2} | kHᵏ(S^k) both sides; ∫φ'u'(1 + u'²)^{−1/2} = −∫φu''(1 + u'²)^{−3/2} = −∫⟨tr B, X⟩dH¹ | sound |
| 5.2 intrinsic against ambient (headline) | great S^k ⊂ S^N; sign | tr B = −kx, H_{ι_#V} = H_V + tr_S B = −kx (5.1's value); \|tr_S B\| ≤ k\|B\| | sound |
| 6.1 identity (headline), weighted form | line y_2 = a; circle; general h | 2T/ρ with T = √(ρ² − a²) on both sides; 2π − 2π(1 − 1/ρ) = 2π/ρ; δV(X_ρ) = kI − ρI' + ρJ' + ∫φ(y − x)·P_S∇h ⇒ minus sign on δV(X_ρ) | sound |
| 6.1 exponential form | f' ≥ J' − Λf, Λ ≥ 0 | (e^{Λρ}f)' ≥ e^{Λρ}J' ≥ J' | sound |
| 6.2 Riemannian form (headline) | κ = 0; x = π/2; Grönwall; great circle on S² | 6.1 with t‖δV‖(B_t); (1 − x cot x)/x = 2/π; F' ≥ −CF ⇒ e^{Cσ}f(σ) ≤ e^{Cρ}f(ρ); ratio 2 constant | sound |
| 6.3 a.e. existence route | S = sup_{[σ,ρ]} f, S' = sup_{[ρ,c²ρ]} f, Cρ ≤ ½ | S ≤ f(ρ) + ½max(S, S') ⇒ S ≤ 2f(ρ) + S' | sound |
| 6.3 Checks | three half-lines; step multiplicity; θ = e^{−1/\|t\|} | 3ρ/2ρ = 3/2; (ρ + 2ρ)/2ρ = 3/2 < 2; ‖δV‖(B_ρ) = 2e^{−1/ρ}, ‖V‖(B_ρ) ≤ 2ρ²e^{−1/ρ}, doubling ≥ re^{−2/(3r)}/(2r²e^{−1/r}) = (2r)⁻¹e^{1/(3r)} | sound |
| 6.3 usc under convergence | open O ⊂⊂ U, compact K | ‖δV‖(O) ≤ Λ lim sup ‖V_j‖(Ō) ≤ Λ‖V‖(Ō), then O ↓ K | sound |
| 6.3 lower bound | segment [−a, a], U = B_a(0), ρ = 2a | 2a against 4a | R01 |
| 6.4 constancy (headline) | H¹⌞L + δ_0; g = e^{2t}dt² | ratio 2r/(2r + 1) → 0 on an atom, δV'(X) = 1; (e^tX)' integrates to 0 with θ̃ = 1 | sound |
| 6.5 convex hull | X = ψγ(r)(y − ξ); K = ∅; k = 0 | div_S X = kγ + γ'\|P_S(y − ξ)\|²/r ≥ kγ; two disjoint balls; excluded by k ≥ 1 | sound |
| 7.1 Checks | i segments of length 1/(2i) | weight → ½H¹, ‖δV_i‖ = 2i → ∞ | sound |
| 7.2 varifold tangents (headline) | μ = (1 + ½ sin log r cos ϑ)dr dϑ; Lebesgue lift | μ(B_ρ) = 2πρ; λ⁻¹∫_{B_λ}cos ϑ dμ = (π/4)(sin log λ − cos log λ): −π/4 at 1, π/4 at e^π; ‖V_{x,λ}‖(B_1) = πλ → 0 | sound |
| 7.3 rectifiability (headline) | rescaled varifolds; plane step | ‖δṼ_λ‖(B_R) = λ^{1−k}‖δV‖(B_{λR}) ≤ Λλ·λ^{−k}‖V‖(B_{λR}) → 0; 6.4 with ‖C‖(B_ρ) = Θω_kρ^k gives θ_0 = Θ | sound |
| 7.4 compactness (headline, changed Check) | see F02 row; circles 1/i | √2(i − 1) + 2; ‖δV_i‖ = i·2π/i = 2π, mass 2π/i → 0 | sound |
| 7.5 multiplicity lemma | m planes; tilted plane counted only where \|x_1 tan α\| < ε; ε = 1/10 | m ≤ (1 + δ)m + δ; distance d < ε, mass ratio (1 − d²/4)^{k/2} ≥ 1 − kε²/8, bound holds for small ε; cε⁻¹·2ε² = c/5 against cε⁻¹·2ε = 2c | sound for h = e; R02 (notation) |
| 7.6 integral compactness (headline) | v(L, 1) + v(L_i, 1); ½v(L, 1); min against max | limit v(L, 2); non-integral in, non-integral out; max(ψ_i, N) ≥ N > θ cannot tend to θ | sound; R02 (notation) |
| 8.1, 8.2 tangent cones (headline) | integral stationary V; x ∉ spt‖V‖; C_{p,q} | {Θ < 1} is ‖V‖-null and ρ^{1−k}·0 = 0, so 7.2 and 8.1 apply everywhere; VarTan = {0}; \|x\|²/\|y\|² = p/q, cone dimension p + q + 1 = n | sound |
| 9.1 regular set | \|t\|^{3/2} graph; ½v(L, 1); x ∈ reg² of stationary V | 0 ∈ reg¹ ∖ reg²; reg = L; 6.4 on U with x ∈ spt gives θ_0 > 0 | sound |
| 9.3 comparison (headline) | [[P]] − [[P]]; multiplicity 2, both orientations | 0 against v(P, 2); v(P, 2) twice | sound |
| 9.4 statements | n ≥ 8; K = ∅ with Σ = (ℝ⁸ × {0}) ∖ {0} | p + q = n − 1 ≥ 7 so every C_{p,q} is minimizing (EdelenSpolaor2023 line 120); reg^∞[Σ] = ℝ⁸ × {0} ≠ Σ violates the convention | sound |

### Sources: the seeded sample, read at the locators

No locator was flagged unverified by the author.

| Target | Text opened | Outcome |
|---|---|---|
| 1.1 | Simon1983 line 7295–7305 | n-dimensional subspaces with a metric given by the projections; compactness of G_n(K). Match; the operator norm is the README's stated choice. |
| 1.3 | Simon1983 line 7308–7317; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 157–160 | Varifold as a Radon measure, weight through π, mass, restriction to G_n(A); Definitions 2.1–2.2. Match. |
| 1.4 | Simon1983 line 7336–7338, 7738–7740, 1038–1045 | Convergence as Radon measures; Theorem 4.4 with bounds on open sets of compact closure. Match. |
| 4.4 | Simon1983 line 7486–7509; Agnoletto et al. line 269–303 | 39.3–39.4 with the names of H, Z, σ and the co-normal; Proposition 2.10 with the sign of the README. Match; Simon's co-normal carries the opposite sign, and the README pins its own by the half-hyperplane witness. |
| 4.5 | Agnoletto et al. line 1788–1810; Simon1983 line 7336–7338 | The chart transport is asserted in one sentence (line 1802–1803), as the README says; the estimate is the README's own. |
| 5.1 | Simon1983 line 1950–1973, 2979–2988 | 9.3, 9.5(2) (closure condition on Ū ∩ M), 16.6(1). Match. |
| 6.2 | Scharrer2022 line 823–854, 1120–1127, 1184–1203; Agnoletto et al. line 542 | Lemma 2.7 (K ≤ b, b > 0), Lemma 3.3 with closed balls, Remark 3.4 with c(π/2) = 2/π for t < π/(2√b); Lemma 2.22 is at line 542. Match. |
| 6.3 | Simon1983 line 7550–7565, 3119–3152; Agnoletto et al. line 1448, 1546, 1680 | 40.5 with measurability; 17.8, 17.9(1) in the rectifiable setting, as labelled; Corollary 2.27, Remark 2.28, Theorem 2.30. Match. |
| 6.5 | Simon1983 line 3371–3392 | 19.1 for rectifiable V with the test field ψγ(r)(x − ξ), as the README says. |
| 7.2 | Simon1983 line 7733–7774, 3414–3430, 3461–3481 | 42.1–42.3 (stationary limit, 42.2 for the weight only, as the README states); 19.3; homogeneous degree-zero weights. Match. |
| 7.5 | Simon1983 line 7986–8048 | ε ∈ (0, δ²), ε = ε(δ, Λ, n), integer multiplicity on B_3(0), the slab {\|q\| < ε}, (1 + δ) and + δ, B_2(x), Lⁿ(A) < δ, step (6) "≤ cε by the hypotheses". Match where legible; see Not verifiable. |
| 7.6 | Simon1983 line 7899–7985 | 42.8 and its proof (Besicovitch step, blow-up, fibre multiplicities ψ_i, the lemma). Match; the source's "max" is a misprint (Source issues). |
| 8.2 | Simon1983 line 7793–7805, 7899–7912; EdelenSpolaor2023 line 109–112 | 42.6 with the hypothesis on {Θ < 1}; 42.8; tangent cone "up to rotation … with multiplicity one". Match. |
| 9.1 | Agnoletto et al. line 89–92; Simon2023 line 73–83 | Definition 1.2 (C¹); reg and sing for smooth hypersurfaces with the convention reg M = M. Match. |
| 9.4 | Simon2023 line 84–96, 432–441; EdelenSpolaor2023 line 104–135 | Theorem 1.1 (n ≥ 3, m ≥ 2, n + m ≥ 8, ℓ ≥ 1, the metric, sing M = {0} × {0} × K) and 3.7; Definition 1.1.1, Remark 1.2, Theorem 1.4. Match; strict stability is named as not restated. |

Also read: Simon1983 line 7513–7547 (40.1–40.4), 7566–7584 (40.6, 40.7), 7882–7898 (42.7),
7253–7262.

### Duplication audit, pins, suppliers, direction

- Pins. All 65 backticked identifiers resolved at the pins. Opened this round, beyond the F01 row:
  `Besicovitch.ae_tendsto_rnDeriv` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1077`),
  `Besicovitch.ae_tendsto_measure_inter_div_of_measurableSet` (`:1088`), `Besicovitch.vitaliFamily`
  (`:1020`), `HasBesicovitchCovering` (`:155`), `Vitali.vitaliFamily`
  (`Mathlib/MeasureTheory/Covering/Vitali.lean:460`), `VitaliFamily.ae_tendsto_average`
  (`…/Covering/Differentiation.lean:856`), `MeasureTheory.Measure.setLIntegral_rnDeriv_le`
  (`…/Decomposition/RadonNikodym.lean:319`), `Measure.rnDeriv`, `Measure.singularPart`
  (`…/Decomposition/Lebesgue.lean:80, 73`), `MeasureTheory.Measure.condKernel`
  (`Mathlib/Probability/Kernel/Disintegration/StandardBorel.lean:361`),
  `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`
  (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean:408`),
  `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (`Mathlib/MeasureTheory/Measure/Regular.lean:1183`),
  `LinearMap.normDet`, `normDet_comp`, `euclideanHausdorffMeasure_image_eq_normDet_mul_volume`
  (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:69, 324, 433`),
  `MeasureTheory.Measure.euclideanHausdorffMeasure` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean:68`),
  `CovariantDerivative.leviCivitaConnection`
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`),
  `IsStarProjection` (`Mathlib/Algebra/Star/StarProjection.lean:29`),
  `isStarProjection_iff_eq_starProjection_range` (`Mathlib/Analysis/InnerProductSpace/Adjoint.lean:513`);
  Tau Ceti `Distribution.HasLocallyFiniteMass` (`TauCeti/Analysis/Distribution/Mass/Basic.lean:353`),
  `Distribution.massMeasure`, `massMeasure_preimage_coe`, `enorm_apply_le_lintegral_massMeasure`
  (`…/Mass/Measure.lean:191, 213, 306`), `TauCeti.RealRMK.posPart`, `negPart` and the difference
  formula (`…/RieszMarkovKakutani/Signed.lean:160, 205, 262`), `TauCeti.globalFlow`,
  `contMDiff_globalFlow_uncurry`, `globalFlowDiffeomorph`
  (`TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean:60, 147, 190`),
  `TauCeti.isCompleteVectorField_of_isCompact_of_eq_zero_off` (`…/Flow/Complete.lean:144`),
  `TauCeti.riemannianVolume`, `eq_riemannianVolume_iff` (`…/VolumeDensity/Volume.lean:82, 93`),
  `TauCeti.Manifold.divergence` (`…/Riemannian/Laplacian.lean:55`),
  `TauCeti.Manifold.integral_divergence_eq_zero` (`…/Riemannian/DivergenceTheorem.lean:225`),
  `MeasureTheory.integral_divergence_eq_zero` (`TauCeti/MeasureTheory/Integral/DivergenceTheorem/CompactSupport.lean:30`),
  `TauCeti.CountablyRectifiable` (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44`, `iUnion` at `:122`),
  `TauCeti.isCompact_closure_of_isTightMeasureSet_of_mass_le` (`TauCeti/MeasureTheory/Measure/Prokhorov.lean:52`).
- Suppliers resolved on main (`1a19c9f`, the head the previous round resolved line by line):
  GeometricCurrents G1 (constancy criterion, line 229–238), G2 (240–249), G5 (583), G6 (668–690);
  GeometricMeasureTheory G2 (148); RiemannianGeometry R4 (2269), R5a, R5a.2, R5b; HopfRinow under
  `Completed/`. None of these roadmaps is in the list of open pull requests, so no revision moves
  a cited section.
- Ownership against open work: `roadmaps grep -i varifold` over main and the open heads finds only
  GeometricCurrents, GeometricMeasureTheory and RiemannianGeometry/MinimalSurfaces, all on main.
  CalibratedGeometry 1.4 (main) owns the oriented Grassmannian of a general E and its comparison
  with `TauCeti.finiteGrassmannian` along an isometry ι (line 532–556); its base-change law
  (composition with ι′ι⁻¹) is the inverse of 1.1's (precomposition with O⁻¹), so the two agree.
  ManifoldOptimization (open) uses GeneralizedCohomology G4.0b's smooth structure on the same pinned
  carrier and builds no second one. The board package index (AnalyticNumberTheory,
  LawrenceVenkateshMethod) was read: no package on this subject. Overlap report: no pull request
  changes this roadmap, no dropped id, no revision-only id, no second copy.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

Overlap check: read GeometricCurrents, GeometricMeasureTheory, MinimalSurfaces (main), ManifoldOptimization, LorentzianGeometry, PointProcesses, QuasiregularMaps, BanachSpaceTheory (open, by vocabulary; the third list is empty); the unoriented Grassmann bundle by orientation quotient, its Radon compactness and the auxiliary varifold of an integral current with its first variation, monotonicity and tangent cones: owner GeometricCurrents G6 (cited, compared in 1.2 and 9.3); approximate tangent planes and the area formula: owner GeometricMeasureTheory G2 (cited); monotonicity for smooth proper minimal immersions: owner MinimalSurfaces 3.1 (not restated); the coordinate Grassmannian: Tau Ceti at the pin (cited, compared in 1.1); the general varifold carrier and its theory: this roadmap; the open five share nothing.

Dependency check:

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2233 edges, 0 problem(s)

No UPWARD or CYCLE line. No supplier is on the never-cite list.

### Headlines and Lean form

Headline theorems (Summary): the Riesz decomposition (4.4); monotonicity, Euclidean and Riemannian
(6.1–6.2); existence and semicontinuity of densities (6.3); Allard's rectifiability theorem (7.3);
compactness of rectifiable and of integral varifolds (7.4, 7.6); varifold tangents and cones (7.2,
8.1–8.2); constancy (6.4); intrinsic against ambient (5.2); comparison with GeometricCurrents G6
(9.3). There is no `Suggested.lean` at this stage, so the padding probe, the `#check` comparison
and the import header do not apply. For the package: 4.4, 6.1–6.3, 7.2 and the measure part of 7.4
are statable on native carriers with a few real definitions; those needing weighted approximate
tangent planes, submanifold predicates or the supplier's currents (7.3's conclusion, 7.6, 8.x, 6.4,
5.2, 9.3) are to be named in the module docstring with the missing carrier unless stated without
stand-ins.

### Copyright, arrangement, reuse

Wording: the README was set beside the source at each locator of the table above and at Simon1983
line 7513–7547 (6.1), 7566–7579 (7.1), 7882–7898 (7.4). No run of shared words beyond standard names
(generalised mean curvature, generalised boundary measure) and forced formulas; the statements are
reorganised (projection form in 1.1, closed balls and a curvature term in 6.2, varying metrics in
7.4–7.6, the README's own sign for the co-normal). Arrangement: Simon1983's Chapter 8 runs §38
basics and first rectifiability, §39 first variation, §40 monotonicity, §41 constancy, §42 tangents,
rectifiability, compactness. The README splits §38 over 1.1–1.3 and 3.3, takes Layer 2 from §11 and
§15, puts §39's opening in Layer 3, merges §40–§41 with §17–§19 in Layer 6 and moves 40.6 to 7.1,
splits §42 over Layers 7 and 8, and adds Layers 5 and 9, 4.5 and 6.2 from other sources: no
one-to-one run. The order first variation → monotonicity → tangents → rectifiability is forced by
the *Needs:* lines (6.1 needs 4.1–4.4; 7.2 needs 6.1, 6.3; 7.3 needs 7.1–7.2, 6.4). Reuse: no table,
figure or exercise list taken over.

Source independence: 18 passages compared with 5 sources (Simon1983, Simon2023, EdelenSpolaor2023, Scharrer2022, AgnolettoCorreaHoyosDaSilvaNardulli2025), none shared; largest share Simon1983, 82 of 132 source references; contents compared with Simon1983 (Chapters 4 and 8): independent. Federer1969, Allard1972 and Maggi2012 could not be read (settled as uncertified).

## Not verifiable

- Federer1969 2.5, 2.8, 3.2; Allard1972 Sections 3–6, 8; Maggi2012 Part II: settled as uncertified,
  cited by locator only; not requested.
- Simon1983 42.9 (line 7991–8000) and 42.1, 42.4 (line 7736, 7777): the displayed hypotheses are lost
  in the extracted text; the legible parts and step (6) of the proof of 42.9 (line 8044–8046) agree
  with the README's reading.
- 7.5 for h ≠ e: no source states it; the README marks it as its own with a route. I checked the
  error accounting of the route, not a full proof.
- GeometricCurrents G2 states its manifold/chart comparison in one clause (main, line 244–245);
  that it carries the Jacobian form used in 2.3's route is a contract with the supplier.
- Lean elaboration, one-tactic probes, `#check` comparison: no Lean file at the design stage.

## Source issues

- **Misprint** in Simon1983 at 40.4, printed page 236: the source says the weighted radial identity carries the first variation with a plus sign; it should be a minus sign, as the divergence of the weighted radial field gives; affects a stated result.
- **Misprint** in Simon1983 at proof of 42.8, printed page 250: the source says the maximum of the fibre multiplicity and N converges to the limit multiplicity; it should be the minimum, since a maximum with N above the limit cannot converge to it; affects the proof.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at proof of Theorem 2.32, arXiv v3 page 17: the source says locally bounded first variation is preserved by a bi-Lipschitz chart push-forward, without argument; it should be supplying a metric comparison, since the change of metric adds a term in the derivative of the test field; affects the proof.

## For the human reviewers

- **Licence.** `Simon1983` is recorded with `licence_class = "institutional"` in `packages/Varifolds/sources.toml` (line 69); I did not re-fetch it and did not verify the host's terms.
- **Licence.** `AgnolettoCorreaHoyosDaSilvaNardulli2025` is an arXiv preprint (v3) with no published version recorded; it is cited for Riemannian definitions and for Theorems 2.30 and 2.32, each beside a Simon1983 locator.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c7cb18a61385e44c9011a8927213f39710bd4cf4", "job": "REV-DESIGN-Varifolds~7", "model": "fable", "worker": "chris-x29"} -->
