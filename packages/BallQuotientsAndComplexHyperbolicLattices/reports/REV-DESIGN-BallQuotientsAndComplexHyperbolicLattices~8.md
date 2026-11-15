<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14748#issuecomment-6897939154 -->
Review (claude) of 1f21515

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) three locators point at passages that do not contain the statement

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:233` (§1.6): "(Mok2012 line 19 to line 26 for the classical case)"; `:263` (§2.2): "(Mok2012 line 249 to line 254, the Siegel form; BaldiUllmo2023 line 586 to line 597)"; `:280` (§2.3): "Mok2012 line 515 to line 516 for complete Kähler–Einstein metrics of negative curvature". Same locators in `design/plan.json`, targets 1.6, 2.2, 2.3.

   **Claim.** Each cited passage supports the statement it is attached to.

   **Witness.** Mok2012 line 19 to line 26 concerns compactifying finite-volume Riemann surfaces, not PU(1,1) ≅ PSL(2,ℝ). BaldiUllmo2023 line 586 to line 597 is Definition 3.3.4 (Poincaré growth at the toroidal boundary), §8.3's input. Mok2012 line 515 to line 516 recalls Siu–Yau's quasi-projectivity theorem; no Ricci form or curvature value.

   **Repair.** The pattern is the one round 6 repaired in §§7.3, 7.4, 9.6; apply the same wording here.

   - §1.6: replace the parenthesis by "(this identification is proved here from §§1.2–1.4 and FuchsianOrbifolds Layer 0; Mok2012 line 21 to line 23 recalls only that the case n = 1 is classical)".
   - §2.2: replace "; BaldiUllmo2023 line 586 to line 597" by "; BaldiUllmo2023 line 582 to line 583 names ω as the form of the natural Hermitian metric, its Poincaré growth being §8.3's".
   - §2.3: replace the Mok clause by "Mok2012 line 247 to line 254 and line 383 to line 389 call the metric of ω the canonical Kähler–Einstein metric, without stating the Einstein constant; the three statements are proved here".
   - Give plan targets 1.6, 2.2, 2.3 the same locators.

   Tested on the witness: Mok2012 line 21 to line 23 does say the case n = 1 is classical; BaldiUllmo2023 line 582 to line 583 does introduce ω as the form of the natural metric; Mok2012 line 249 to line 254 and line 384 to line 389 do give ω = i∂∂̄(−log(Im zₙ − ‖z′‖²)) under that name. No statement changes.

2. **F02** (P3) the plan lists four consumers, the README five

   **Location.** `design/README.md:950`: "**Roadmaps on rank-one locally symmetric spaces, hyperbolicity of moduli and Margulis's commensurability criterion** (BaldiUllmo2023 Theorem 2.4.3, line 361)"; `design/plan.json`, `consumers`.

   **Claim.** The plan and the README name the same consumers.

   **Witness.** `plan.json` `consumers` has four entries (special subvarieties and Ax–Schanuel; a later part of ShimuraCompactifications; a ComplexKahlerGeometry Part II; ShimuraVarietiesPartII). The README's fifth bullet has no counterpart.

   **Repair.** Add to `consumers`: `{"roadmap": "Roadmaps on rank-one locally symmetric spaces, hyperbolicity of moduli and Margulis's commensurability criterion", "what": "Lattices, cusps and neat subgroups (Layers 5–6) and the arithmetic bridge (Layer 11); BaldiUllmo2023 Theorem 2.4.3, line 361."}`. Tested: BaldiUllmo2023 line 361 to line 362 is Theorem 2.4.3 (arithmetic iff infinite index in the commensurator), so the bullet's locator holds and the two lists then have five entries each.

3. **F03** (P3) the Scope does not say how §4.4 differs from the Margulis lemma on main

   **Location.** `design/README.md:9` (Scope): "Zassenhaus neighbourhoods and the Margulis lemma for discrete subgroups of PU(1,n)"; `:408` (§4.4).

   **Claim.** The Scope names every roadmap that states a variant of an object this roadmap states, with the difference in one clause.

   **Witness.** `TauCetiRoadmap/GeometricTopology/README.md:6910` (main, §7.3): "Prove the Margulis lemma for `ℍⁿ` and the thick–thin decomposition". "GeometricTopology" does not occur in this README.

   **Repair.** Add to the Scope's "Not in scope, and the consumers' work" bullet: "The Margulis lemma for real hyperbolic space ℍⁿ and the thick–thin decomposition of hyperbolic 3-manifolds are GeometricTopology §7.3; §4.4 differs in treating discrete subgroups of PU(1,n) acting on 𝔹ⁿ, from a Zassenhaus neighbourhood of SU(1,n), and consumes nothing from it." Tested: for n = 1 the two spaces coincide (𝔹¹ is ℍ² up to the factor 1/2 of §2.2) and the statements agree there; for n ≥ 2 the groups PU(1,n) and the isometry group of ℍ^{2n} differ (dimension n² + 2n against n(2n + 1): 8 against 10 for n = 2), so neither statement contains the other. GeometricTopology is on main, so the clause creates no upward edge.

Three findings, all P3, each with a repair to apply; no P1 or P2. The two declared supplier gaps `gap:normality-analytification` and `gap:normal-riemann-extension` (supplier ComplexComparisonPartII) are precise, minimal and declared in both files, and are not findings. The five findings of round 7 are repaired. No file of the design and no manifest entry was changed by this review.

Elaboration: not available (this lane does not elaborate). The package has no `Suggested.lean` at the design stage, so no Lean command was run and no build is claimed.

## Verified sound

### Round 7 findings, one by one

| Round 7 finding | Repaired passage | Status |
|---|---|---|
| F01 (P3), §11.2 Godement locator | §11.2: "the Godement criterion, Proposition 5.3.1, line 3909 to line 3911, in its unipotent form … Theorem 2.2.4, line 1217, with Definition 9.1.4, line 8344 to line 8347, for the form with the ℚ-rank". Read: WitteMorris2015 line 3909 to line 3911 (unipotent form), line 1217 (ℚ-rank 0 iff compact), line 8344 to line 8347 (ℚ-rank as dimension of a maximal ℚ-split torus). Plan 11.2 and the manifest locator agree. | Repaired |
| F02 (P3), ShimuraCompactifications | Scope: "Pink's toroidal compactification … is ShimuraCompactifications Layer 2; the toroidal compactification of Layer 8 differs in being built from the cusp charts of §8.1 for every neat lattice … states no comparison of the two"; Downstream: "A later part of ShimuraCompactifications … itself does not consume this roadmap". Its head has "## Layer 2: toroidal gluing in characteristic zero" and "### 2.8 The map to the minimal compactification"; no "ball" or "PU(". | Repaired |
| F03 (P3), abelian varieties | §8.2: "each T_b is the analytification of an abelian variety on which the conormal bundle L_b⁻¹ is ample", with the Appell–Humbert derivation and two new Checks. Recomputed below. | Repaired |
| F04 (P3), §9.5 Check | "singular at the image of every point x with Γ_x ≠ 1 acting freely on a punctured neighbourhood of x … for Γ_x generated by the complex reflections … the quotient near 0 has coordinates (w₁², w₂²) and is smooth". | Repaired |
| F05 (P3), §10.5 Check | "Γ the image of Γ₀(2) in PSL(2,ℤ) (index 3, cusp classes ∞ and 0 of widths 1 and 2, one elliptic point (1 + i)/2 of order 2, none of order 3, genus … 0): X_Γ ≅ ℂ*"; the nodal-cubic Check now uses the same Γ. Applied with a different instance from the one proposed; the instance is inside the hypothesis (recomputed below). | Repaired |

No finding of the repair report was marked "not actionable in this package". No maintainer notes were supplied.

Repaired patterns searched in the rest of the design: every source locator of the fifteen sampled sections and every WitteMorris2015, Mok2012, BaldiUllmo2023 and MilneSVI line locator elsewhere was opened (R01 is what this found: three more locators of the kind round 6 repaired); "abelian variet", "isolated" and "ℂ*" each occur only where the repairs put them; plan targets 8.2, 9.5, 10.5, 11.2 mirror the README.

### Coverage and shape

Read the 970-line README in full, the 57 plan targets in 12 layers, the 17 supplier rows, 2 gaps and the 17 manifest entries.

- Every plan target has at least three tests (script over all 57); every definition and construction has an API; the four targets with `gap:` prerequisites (9.4, 9.5, 10.4, 10.5) match the gaps' `neededBy`.
- Twelve layers, each ending with Examples and Dependencies. The order is forced by the dependency lines: §6.1 needs §§4.1–4.5 and 5.2–5.3; §8.1 needs §6.4; §9.2 needs §§8.2–8.4; §10.1 needs §§9.4–9.5; §11.4 needs §10.5; §12.3 needs §8.5.
- Style scan of the README: no LaTeX delimiter, machine path, pull-request number, round label, `set_option`, "optional", "deferred", "for later", "removed" or "current"; the 15 hits for "lemma" are the Margulis, Selberg and Schwarz lemmas as mathematics. No algorithm. The README attributes no backticked Lean name to this roadmap.
- Gaps: same slugs in `plan.json` and under "What ComplexComparisonPartII must provide"; supplier named; ComplexComparisonPartII at its head defines `analyticSetGeometry` and finite analytic normalization in §C0.6 (README:1473–1479) and `completedAnalyticStalkComparison` in §C-1.2, and states neither gap. Precise, minimal, declared: no finding.
- All 17 cited works are in the manifest, one key each; 8 certified, 8 uncertified, 1 waived.

### Adversarial table (computed values)

Conventions: ⟨a,u⟩ = Σ conj(aⱼ)uⱼ; curvature −2 normalisation.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, law of N | general a, a′; a = 1, a′ = i | Vertical part of the composite: 2i⟨a,a′⟩ − 2i Re⟨a,a′⟩ = −2 Im⟨a,a′⟩. (1,0)(i,0) = (1+i, −2); commutator T_{−4}. ρ: both Im v and \|u\|² gain 2Re⟨a,u⟩ + \|a\|² | Pass |
| §1.3 Cayley transform | (0, 1/2); (0, 2); inverse | C(0,1/2) = (0, 3i), ρ = 3 = (3/4)/(1/4); (0,2) ↦ (0, −3i), ρ = −3; 1 − wₙ = 2i/(v+i) gives w′ = 2iu/(v+i) | Pass |
| §1.5 boundary, MAN (sample) | τY_{eₙ}; a_s n a_s⁻¹; n = 2 map to `TauCeti.HeisenbergGroup` | C(tanh τ·eₙ) = (0, i e^{2τ}), so s = e^τ; n_{(sa, s²t)}, weights 1 and 2; image z″ = −t″/4 + (p+p′)(q+q′)/2 = z + z′ + pq′, the law at Heisenberg.lean:95; dims 1 + 1 + 3 = 5 = 8 − 4 + 1 | Pass |
| §1.6 n = 1 | [diag(1,−1)] | C(−w) = i(1−w)/(1+w) = −1/C(w); order 4 in SL₂(ℝ), 2 in PSL₂(ℝ) | Statement passes; locator R01 |
| §2.1 Aut(B) (headline) | tanh t = −1/2; w/2; z + z² | (w − 1/2)/(1 − w/2); h_t sends 0 to −i·(−1/2) = i/2; Df(0) = 1/2; unbounded domain | Pass |
| §2.2 Kähler form (sample) | w = (1/2, 0), u = e₁; n = 1; volume | h(u,u) = 4/3 + 4/9 = 16/9, g = 32/9 both sides; ω^n/n! = det(h)·2^n dV = 2^n(1−\|w\|²)^{−(n+1)}; modular surface π/6; Killing 4·π/6 = 2π/3; volume ratio (2(n+1))^n | Statement passes; locator R01 |
| §2.3 Ricci and curvature | n = 1; n = 2 | iΘ(K_B) = −i∂∂̄ log(1−\|w\|²)² = +2ω; Killing curvatures −1/3, −1/12 times 6 = −2, −1/2 | Statement passes; locator R01 |
| §2.4 distance | 0, tanh t·e₁; Killing | cosh² t on the right, d = √2\|t\|; Killing 2√(n+1)\|t\|, ratio √(2(n+1)) | Pass |
| §3.3 classification (headline) | two axes of B²; n = 1; geodesic segment | reducible; only B; real dimension 1 | Pass |
| §4.1 classification (sample) | a_s; T_t; Jordan block; discrete elliptic | √2\|log s\| (vertical metric dy²/(2y²)); √2 arcsinh(\|t\|/(2ρ)) > 0 with infimum 0; λ̄⟨v,v⟩ = 0; a finite stabiliser (§5.2) gives finite order | Pass |
| §4.2 displacement (sample) | T_t at ρ = \|t\|/2; n_{(a,0)} at (0,iy) and at u = s·ia; horospheres | √2 arcsinh(1); ≈ √2\|a\|/√y → 0; real shift −2s\|a\|², unbounded; ∫dy/(√2 y) = (1/√2)\|log(N₂/N₁)\|, consistent with ℓ(a_s) = (1/√2) log s² | Pass |
| §4.4 Margulis lemma | coset count; S₃ ⊂ U(2); C_m | F·C_j ⊂ C_{j+1}; C_j = C_{j+1} gives Λ/Λ₀; \|C_m\| ≤ m forbids a strict chain of length m + 1; A₃ of index 2; C_m abelian | Statement passes; scope clause R03 |
| §4.5 parabolic groups | ⟨n_{(1,0)}, n_{(i,0)}⟩; {n_{(a,0)}, a ∈ ℤ} | T_{−4} in the group, Λ = ℤ[i] of rank 2; isotropic real subspaces have dimension ≤ n − 1 < 2n − 2 for n ≥ 2 | Pass |
| §5.2 proper discontinuity (sample) | converse; w ↦ −w; irrational rotation | γ ∈ Γ ∩ U gives γ·0 ∈ γ(U·0) ∩ U·0; stabiliser of order 2; infinite stabiliser. `finite_stabilizer'` (ConstMulAction.lean:566) has no separation hypothesis | Pass |
| §6.1 cusp theorem (headline) | PSL(2,ℤ); cocompact; y = 1000 | one cusp class, {Im z > 1}; inf attained contradicts §4.1; √2·arcsinh(0.0005) = 0.000707106752 | Pass |
| §6.3 Selberg (headline) | Γ(3), Γ(2) | traces −2, −1, 0, 1 are 1, 2, 0, 1 mod 3 against 2; −1 excluded by torsion-freeness; Γ(2) ∋ −1 | Pass |
| §6.4 neat | γ = m·η; γ = m·a₂ | m^k = 1 from the projection M·N → M; lift diag(1/2, i, 2) preserves Im(ȳ₀y₂) − \|y₁\|²; ratios ±2i, ±i/2, 4, 1/4; 2i·(i/2) = −1 | Pass |
| §8.1 cusp charts (headline) | general a, a′; λ, iλ | q ↦ q·e^{2πi(2i⟨a,u⟩ + i\|a\|² + t)/τ} = χ(a)e^{−(4π/τ)⟨a,u⟩ − (2π/τ)\|a\|²}q; χ(a+a′)/(χ(a)χ(a′)) = e^{−4πi Im⟨a,a′⟩/τ}; τ = 4λ², χ((1+i)λ) = e^{−πi} = −1 | Pass |
| §8.2 toroidal compactification (sample, repaired) | exponent match; E_b; v ≠ 0; (λ, iλ); n = 1; wrong sign | πH_b(u,a) = −(4π/τ)⟨a,u⟩, πH_b(a,a)/2 = −(2π/τ)\|a\|²: the §8.1 multiplier. E_b(a,a′) = (4/τ) Im⟨a,a′⟩ ∈ ℤ since 4 Im⟨a,a′⟩ ∈ τℤ; (−1)^{E_b} = e^{−4πi Im⟨a,a′⟩/τ}. E′(iv,v) = (4/τ)\|v\|² > 0. E′(iλ,λ) = 1, E′(λ,iλ) = −1; c₁(L_b⁻¹)[λ,iλ] = −E′(λ,iλ) = 1 in the supplier's convention c₁(L(H,α))([λ,μ]) = −E(λ,μ) (AbelianSchemesAndArithmeticModuli §A5.3); deg L_b = −1. Im H_b(iλ,λ) = −1 < 0. n = 1: ℂ⁰/0 a point | Pass |
| §8.3 asymptotics | n = 1 | dv = (τ/2πi)dq/q, Im v = −(τ/2π)log\|q\|: ω = i dq∧dq̄/(4\|q\|² log²\|q\|); metric \|dq\|²/(2\|q\|² log²\|q\|), circle length √2π/\|log r\| | Pass |
| §8.4 log canonical bundle (sample) | f = q^k; ℓ = 0, 1; adjunction | ‖ν^ℓ‖² ≍ ρ^{ℓ(n+1)}; integrand \|f\|²\|q\|^{−2}(−log\|q\|)^{(ℓ−1)(n+1)}; radial dr/r·(−log r)^e diverges iff e ≥ −1, i.e. ℓ ≥ 1; ℓ = 0, n = 1: ∫₀^δ dr/(r log² r) = 1/\|log δ\|; K_{X^M}\|_{T_b} = K_{T_b} ⊗ L_b⁻¹ = L_b⁻¹ | Pass |
| §8.5 finite volume (sample) | k = 2; n = 1; flat cylinder | (ω_E′ + β)² = ω_E′² + 2ω_E′∧β as β∧β = 0; ∫₀^δ dr/(r log² r) < ∞; ∫dr/r = ∞ | Pass |
| §§9.1–9.3 Mok's theorem (headline) | genus 2, 3; Γ(2)/{±1}; weights | 6g − 6 ≥ 2g + 1 for g ≥ 2; 4g − 4 ≥ 2g + 1 iff g ≥ 3; E = O(−2 + 3) = O(1); h⁰(O(ℓ − 3)) = ℓ − 2 = −(2ℓ − 1) + 3(ℓ − 1); \|u\|²\|z\|^{−2n−2} integrable forces u(x) = 0 and du(x) = 0 | Pass |
| §9.4 minimal compactification (sample) | n = 1; cocompact; cusp points against classes | smooth projective curve; ∂ = ∅; infinitely many cusp points, finitely many classes; Z ∖ {ζ_b} = Φ_ℓ(X) smooth and Φ_ℓ\|X an injective immersion, so S_Γ^an ≅ X | Pass |
| §9.5 arbitrary lattice (repaired Check) | {1, −1}; ⟨r₁, r₂⟩, n = 2; n = 1 | π₁((U ∖ {x})/Γ_x) = Γ_x ≠ 1 for n ≥ 2: singular (cone (xy)² = x²·y²); invariants w₁², w₂², r₁ fixes {w₁ = 0}, so not free off 0: smooth; n = 1 not claimed | Pass |
| §10.1 hyperbolic embedding (sample) | circle \|q\| = r; Γ(3); PSL(2,ℤ) | 2πr/(√2 r\|log r\|) = √2π/\|log r\| → 0; distinct cusps: distance → ∞ by the horosphere distance of §4.2; j-line ℂ has zero Kobayashi pseudo-distance. Disc metric of curvature −2 and g_𝔹 are both twice Euclidean at 0, so §2.5 applies | Pass |
| §10.2–10.3 extension, Borel (sample, headline) | exp(1/z); exp; r = 0; V = S_{Γ′} | essential singularity into the torsion j-line; not algebraic; nothing to extend; covering algebraic | Pass |
| §10.4 uniqueness (sample) | t ↦ (t², t³); PSL(2,ℤ) | bijective, not an isomorphism: (a) needs S smooth, which the first gap gives from X_Γ a manifold; automorphisms of ℂ affine | Pass |
| §10.5 finite-point uniqueness (headline, repaired Checks) | image of Γ₀(2); doubled ℙ¹; nodal cubic | index 3; widths 1 + 2 = 3; fixed point of [[1,−1],[2,−1]]: 2z² − 2z + 1 = 0, z = (1+i)/2; no order 3 (a + d = ±1 with c even forces a, d odd); g = 1 + 1/4 − 1/4 − 1 = 0, so X_Γ = ℙ¹ minus two points; 6 against 3 boundary points; two branches at the node | Pass |
| §10.6 functoriality (sample) | Γ(2), Γ(3) in PSL(2,ℤ); Γ′ = Γ | degrees 6 and 12 (24 in SL(2,ℤ)); identity of degree 1; a parabolic of Γ has a power in Γ′ with the same fixed point | Pass |
| §11.1 arithmetic lattices | A⁻¹gA, A = diag(2,1); SL₂ → PGL₂ | [[a, b/2],[2c, d]]; integral group A·SL₂(ℤ)·A⁻¹ meets SL₂(ℤ) in Γ⁰(2), index 3; PSL₂(ℤ) of index 2 in PGL₂(ℤ) | Pass |
| §11.2 cocompactness (repaired locator) | SL₂ | unipotent [[1,1],[0,1]], ℚ-rank 1, noncompact: both cited forms agree | Pass |
| §11.3 Shimura datum (headline) | z = i; n = 1, 2 | h₀(i) = [diag(1, −1, …, −1)]; tangent action z/z̄, type (−1,1); \|det g\|² = (−1)³ = −1 impossible for n = 2; S realises c < 0 for n = 1; stabiliser of h₀ is K | Pass |
| §11.5 Borel embedding (sample) | n = 1; Siegel form | disc in the Riemann sphere, ℍ⁻ onto {⟨z,z⟩ < 0}; Im(ȳ₀y₂) − \|y₁\|² = \|z₀\|² − \|z₁\|² − \|z₂\|² under y = (z₀ − z₂, z₁, i(z₀ + z₂)), signature (1,n) | Pass |
| §12.2 Γ-special ⇒ algebraic (sample) | m = n; trivial stabiliser; parabolic of r_W(Γ_H) | j the identity; not a lattice; an eigenvector v = v_W + v_⊥ with ⟨v,v⟩ > 0 has ⟨v_W,v_W⟩ > 0, so a lift fixing no point of X_H fixes none of B: cusps go to cusps. γX_H = X_H iff γ ∈ Γ_H, so generic injectivity. r_W injective on torsion-free Γ_H | Pass |
| §12.3–12.4 (headline) | Q = B × {s}, B × S_Γ, {x₀} × S_Γ | (dim Q, dim U) = (n, 0), (2n, n), (n, 0), each with dim U = dim Q − n | Pass |

### Seeded source sample

| Target | Locators read and result |
|---|---|
| 1.5 | BaldiUllmo2023 line 517 to line 519 (unipotent radical and its centre), line 559 to line 571 (Siegel domain, D(N), Γ_b); Mok2012 line 138 to line 154 (the group W_b, its commutator group, S(N)). Supported; the conjugate in ⟨a,u⟩ and the law of N are the roadmap's (see Source issues). |
| 2.2 | Mok2012 line 249 to line 254: the Siegel form of ω. Supported. BaldiUllmo2023 line 586 to line 597: not about §2.2 (R01). |
| 4.1 | Mok2012 line 325 to line 335: the trichotomy by fixed points for pinched Hadamard manifolds. Supported for the three types; translation lengths and the eigenvector argument are the roadmap's. |
| 4.2 | Mok2012 line 383 to line 403: restriction of ω to vertical half-planes and small displacement of the vertical translation in S(N). BaldiUllmo2023 line 566 to line 581: D(N), A_b, E. Supported as inputs. |
| 5.2 | WitteMorris2015 line 18549 to line 18561: free action, properly discontinuous action, stabiliser. Supported as cited. |
| 8.2 | Mok2012 Theorem 1, line 476 to line 484; Main Theorem, line 548 to line 550 (components biholomorphic to abelian varieties); BaldiUllmo2023 line 510 to line 557. Supported. |
| 8.4 | Mok2012 line 568 to line 626: triviality of K ⊗ [D] near D, the frame with a simple pole at line 607, the non-integrability computation for every positive power. Supported. |
| 8.5 | BaldiUllmo2023 line 586 to line 601 (Definition 3.3.4, Theorem 3.3.5); Mok2012 Proposition 1, line 295. Supported as inputs; the theorem is the roadmap's. |
| 9.4 | Mok2012 line 559 to line 562 (normalization of Z, projective); line 479 to line 482 (blowing down to normal isolated singularities). Supported. |
| 10.1 | Kiernan1972 line 57 to line 75: the punctured-disc metric and shrinking circles, distance decrease, the definition of hyperbolic embedding. Deng2020 line 61 to line 63: the arithmetic case. Supported. |
| 10.3 | MilneSVI Theorem 3.14, line 1742 to line 1744; proof, line 1764 to line 1769; minimality, line 1775 to line 1780; Deng2020 Theorem A, line 87 to line 90, with the hypotheses the README states. Supported. |
| 10.4 | MilneSVI Corollary 3.16, line 1770 to line 1774; BaldiUllmo2023 line 455 to line 465, line 102 to line 104, line 431. Supported. |
| 10.6 | BaldiUllmo2023 line 102 to line 104: reduction to a torsion-free subgroup of finite index. Supported as described; the theorem is the roadmap's. |
| 11.5 | BaldiUllmo2023 line 533 to line 540: compact dual and Borel embedding at a boundary component; ShimuraData §3.8 (`compactDualBorelEmbedding`) at its head. Supported. |
| 12.2 | BaldiUllmo2023 Corollary 3.4.6, line 686 to line 702 (algebraicity), line 433 to line 434 (closed analytic), line 474 (totally geodesic). Supported; finiteness, birationality and the extension to S* are the roadmap's. |

Also read: WitteMorris2015 line 1893, 1899, 1940 to 1944, 2000 to 2001, 2700, 2722, 2754, 2809, 2821, 2910, 2972 to 2973, 3002, 3008, 3445, 3676, 3732, 8668 to 8669; BaldiUllmo2023 line 49 to 50, 59, 91 to 95, 135 to 137, 151 to 152, 333 to 339, 355 to 357, 361, 421 to 423, 486 to 506, 649 to 661, 1346 to 1352; Mok2012 line 9 to 27, 121 to 128, 307 to 312, 336 to 349, 373, 495 to 516; MilneSVI line 1680 to 1694, 1722 to 1736; Mostow1980 line 85 to 95, 3089 to 3096 (the non-cocompact ones are arithmetic, so the non-arithmetic ones are cocompact, as Layer 5 Examples says); DeligneMostow1986 line 151 to 152; Deng2020 line 136. Each holds what the README attributes to it, apart from R01.

### Pinned declarations opened

Pins: Mathlib 1b1ccf4, Tau Ceti 2fd255d (the checkouts' heads). All 39 file-and-line citations hold the named declaration at the cited line.

- Mathlib: `Algebra/Lie/Classical.lean:175`, `LinearAlgebra/UnitaryGroup.lean:105`, `Logic/Equiv/Fin/Basic.lean:224`, `LinearAlgebra/Projectivization/Basic.lean:48`, `Topology/Algebra/Projectivization.lean:44`, `Analysis/Complex/UnitDisc/Basic.lean:30`, `Analysis/Complex/Schwarz.lean:189`, `Topology/Algebra/ConstMulAction.lean:534, :566, :601`, `Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`, `Topology/Algebra/Group/Subgroup.lean:155`, `Topology/Algebra/ProperAction/CompactlyGenerated.lean:95`, `MeasureTheory/Group/FundamentalDomain.lean:69, :679, :695`, `GroupTheory/Commensurable.lean:58, :141`, `AlgebraicGeometry/Normalization.lean:122`, `RingTheory/Jacobson/Ring.lean:60, :681, :691`, `RingTheory/Ideal/KrullsHeightTheorem.lean:282`, `Algebra/Module/ZLattice/Basic.lean:434`, `Topology/Order.lean:309`; also `MulAction.orbitRel.Quotient` (`GroupTheory/GroupAction/Defs.lean:349`), `MulAction.stabilizer` (:515), `EuclideanSpace.equiv` (`Analysis/InnerProductSpace/PiL2.lean:296`), `Matrix.ProjectiveSpecialLinearGroup` (`LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`).
- Tau Ceti: `Topology/Algebra/UnitaryGroup.lean:104, :110`, `Topology/Algebra/Projectivization.lean:188, :215, :311`, `Geometry/Manifold/Instances/Projectivization.lean:54, :82, :96`, `Analysis/Complex/CauchyIntegralPolydisc.lean:351`, `Geometry/Manifold/Instances/Quotient.lean:253`, `MeasureTheory/Group/ProperlyDiscontinuous.lean:100`, `Topology/Algebra/GroupAction/FreeLocus.lean:36`, `GroupTheory/SpecificGroups/Heisenberg.lean:58`, `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; both cited directories exist.

Read for what they say: `Complex.dist_le_div_mul_dist_of_mapsTo_ball` takes `DifferentiableOn ℂ f (ball c R₁)` and `MapsTo` into a closed ball, as the contract says; the Heisenberg product is `⟨a.x + b.x, a.y + b.y, a.z + b.z + a.x * b.y⟩` (Heisenberg.lean:95), the law §1.5's map is checked against.

### Supplier and ownership audit

Each citation was resolved now, on main or at the open head:

- RealSemisimpleLieGroups (open, new roadmap): §3.1 (README:805), §5.2 (:1105), §5.3 (:1134), §5.4 (:1169), §5.6 (:1254), §5.7 (:1286: form linear in the first slot, `Y_v ↦ Y_{āAv}`, g_𝔹, Killing = 2(n + 1)·g_𝔹, sub-balls for 1 ≤ m ≤ n, the local converse). Its scope (:141–142) leaves Selberg's lemma, finite generation, non-arithmetic ball quotients and the full biholomorphism group outside itself.
- ComplexComparisonPartII (open, merge order line 40): §§C-1.1 (:1004), C-1.2 (:1104), C0.6 (:1471, where `analyticSetGeometry` and finite analytic normalization are), C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 and the cited names.
- AbelianSchemesAndArithmeticModuli (open, line 42): §A5.3 (:2628), `appellHumbert`, H linear in the first variable, the factor α(λ)exp(πH(z,λ) + πH(λ,λ)/2), third powers embedding, and c₁(L(H,α))([λ,μ]) = −E(λ,μ).
- ShimuraVarieties (open, line 105): §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5, 2.7, 3.1, 3.2, 3.3, 3.4a, 3.5, all present as headings. PELModuli §M5.5 (:3663, the three names); ShimuraData §3.8 (:529); AlgebraicModuliForArithmeticGeometry §§5.4, 9.5; ResolutionOfSingularitiesCharacteristicZero §6.2; ArithmeticLocallySymmetricSpaces §ALS.0.5 (:1366); ShimuraCompactifications Layer 2 (:1142, named in the Scope only, merge order line 163).
- Main: AdelicAlgebraicGroups §§1.1 (:1003), 3.4 (:3112, `Reduction.arithmetic_finite_volume_iff` :3228, `Reduction.levelArithmetic` :3240), 4.3; ComplexTori Milestone 1 (:130, with `DiscreteTopology` and `IsZLattice ℝ L`); FuchsianOrbifolds Layers 0–4 and L2.1 (:407); VonNeumannAlgebras Layer 9 (:2861); ComplexManifolds Milestones 4–7; ComplexKahlerGeometry K1–K4, K6.0; RiemannianGeometry R4.7, R5a (:3205); SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective` :3450); RepresentationTheory/LieGroups Layer 9 (`kakDecomposition` :1362); Completed/ConformalMapping Layer 2 (:531); Completed/HopfRinow.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no revision-only id, no second copy; main has no folder of this name.

Searched by object with `roadmaps grep` (main and open heads): Selberg's lemma, Margulis lemma, Zassenhaus, PU(1,n), Cartan's uniqueness, hyperbolically embedded. PU(1,n) occurs only in RealSemisimpleLieGroups (cited); Selberg's lemma and Cartan's uniqueness theorem only as items it leaves out; the Margulis lemma for real ℍⁿ in GeometricTopology §7.3 on main (R03); "Zassenhaus" elsewhere is the finite-group theorem; "hyperbolically embedded" nowhere.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, ShimuraVarieties, KleinianGroups, ComplexComparisonPartII, FuchsianOrbifolds, ConformalMappingPartII, AdelicAlgebraicGroups, and also ShimuraCompactifications and GeometricTopology; form, groups, ball, metric, sub-balls → RealSemisimpleLieGroups §5.7; MAN → RealSemisimpleLieGroups §3.1; KAK → LieGroups Layer 9; arithmetic-lattice predicate and neat levels → AdelicAlgebraicGroups §§3.4, 4.3; arithmetic quotients and Baily–Borel → ShimuraVarieties; n = 1 quotient and cusps → FuchsianOrbifolds; Pink's toroidal compactification → ShimuraCompactifications Layer 2, X^M for lattices of PU(1,n) → this roadmap; Margulis lemma for ℍⁿ → GeometricTopology §7.3, for 𝔹ⁿ → this roadmap (R03); KleinianGroups and ArithmeticFuchsianGroups have no occurrence of PU(1,n), complex hyperbolic space, neat subgroups or Selberg's lemma; nothing else shared.

Dependency check, run on the unchanged design:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Headline theorems

From the Summary: Aut(B) = PU(1,n) (§2.1); totally geodesic subvarieties are sub-balls (§3.3); the cusp structure theorem (§6.1); finite generation and Selberg's lemma (§§6.2–6.3); the normal analytic quotient (§7.1); the toroidal compactification by abelian varieties (§8.2); L² jets and projectivity of S*_Γ (§§9.1–9.5); the extension theorem and Borel algebraicity (§§10.2–10.3); uniqueness of the model and of the finite-point compactification (§§10.4–10.5); the Shimura datum and the Baily–Borel comparison (§§11.3–11.4); Γ-special equals totally geodesic (§§12.2–12.3); the intersection setting (§12.4). Each is a named target with hypotheses; every Summary clause now has a target. The padding probe, the binder check and the statable-headline check apply to `Suggested.lean`, which does not exist at this stage.

### Copyright, wording, arrangement, reuse

- **Wording.** The passages of the fifteen sampled sections were set beside the sources at their locators, with six more (§8.1 against Mok2012 line 152 to line 180; §9.1 against Mok2012 line 495 to line 514; §6.1 (2) against BaldiUllmo2023 line 649 to line 658; §6.3 against WitteMorris2015 line 2972 to line 2973; §11.1 against WitteMorris2015 line 3732 to line 3734; §12.1 against BaldiUllmo2023 line 421 to line 423). The longest shared run is about eleven words, the eigenvalue property at WitteMorris2015 line 2972 to line 2973, which the statement forces. Notation (Φ_ℓ, Ξ, E = K ⊗ [D]) is shared; no sentence, list or proof plan is.
- **Arrangement.** BaldiUllmo2023 has the largest share. Its sections (introduction, notation, real Shimura data, ℤ-Hodge theory, comparison, finiteness, special points) do not map onto the twelve layers: its §3 is spread over Layers 1, 3, 6, 8, 10, 11 and 12 and its §§4–7 are outside the scope. Mok2012 (§§1.1–1.3, then the proof of the Main Theorem) is nearest to Layers 8–9, but its §1.3 is Layers 4–6, placed before its §§1.1–1.2 because §8.1 needs §6.4, and §§8.5, 9.5, 9.6 are not in it.
- **Reuse.** No table, figure, exercise list or data set is taken over. Mostow's seven parameter values are not reproduced.

Source independence: 21 passages compared with 6 sources (BaldiUllmo2023, Mok2012, WitteMorris2015, MilneSVI, Kiernan1972, Deng2020), none shared beyond forced statements; largest share BaldiUllmo2023, 35 of 120 locators in the layers; contents compared with BaldiUllmo2023 and Mok2012: independent. Goldman1999 and the other settled unread works could not be compared.

## Not verifiable

- Goldman1999 Ch. 3 (a locator of sampled §2.2's neighbours §§2.1, 2.3–2.5, 3.2–3.4): settled uncertified, text not read; the statements it is cited for were recomputed above.
- Cartan1957, Raghunathan1972, Borel1969, Alperin1987, Borel1972, BailyBorel1966, SiuYau1982: settled uncertified, not read. GarlandRaghunathan1970: waived, not read; §6.1 (2) rests on BaldiUllmo2023's quotation of it at line 649 to line 658.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists at this stage.
- Ownership against open pull requests was checked through the tools' index of open heads (476 pull requests); the brief's list of names does not include RealSemisimpleLieGroups, ComplexComparisonPartII or ShimuraCompactifications, whose heads the tools did provide.

## Source issues

- **Misprint** in Mok2012 at §1.1, equation (1), printed p. 4 (line 142 to line 144): the source says the pairing a′·z′ is the sum of aᵢzᵢ; it should be the sum of conj(aᵢ)zᵢ, for the map to preserve the Siegel domain; affects nothing.
- **Gap** in Mok2012 at §1.1, equations (5)–(6), printed p. 5 (line 173 to line 175): the source says every element of Γ ∩ W_b has vertical part an integer multiple of τ, so no unitary factor appears; it should allow a real vertical part t, giving the factor e^{2πit/τ}; affects a stated result.
- **Misprint** in Mok2012 at the proof of the Main Theorem, printed p. 14 (line 604): the source says the bundle trivial near D is the canonical bundle tensored with the inverse of [D]; it should be tensored with [D], as at line 569 and line 589; affects nothing.
- **Misprint** in Mok2012 at §1.3, equation (5), printed p. 9 (line 391 to line 396): the source says the restriction of ω to a vertical half-plane is i dzₙ∧dz̄ₙ over ρ²; it should carry the factor 1/4; affects nothing.
- **Error** in BaldiUllmo2023 at §3.2, printed p. 12 (line 500 to line 502): the source says the stabiliser of a subspace is a product of PU(1,m) and a compact group; it should be an extension of PU(1,m) by a compact kernel; affects a stated result.
- **Misprint** in BaldiUllmo2023 at §3.2, printed p. 12 (line 501): the source says m is the rank of the subspace; it should be its dimension minus one; affects nothing.

## For the human reviewers

- **Ordering.** RealSemisimpleLieGroups, supplier of §§3.1 and 5.2–5.7, is an open new-roadmap pull request and is absent from `merge-order/ORDER.txt`; the gate placed this roadmap after ShimuraData without testing that edge.
- **Licence.** Mok2012 was read as the HKU IMR preprint IMR2009-4 (`sources.toml`, licence class author-page), not as the published chapter; its numbering was not compared with the printed volume.
- **Not tested.** Goldman1999 and eight other uncertified or waived works were not compared for wording; BaldiUllmo2023, the largest-share source, was read and compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1f21515cc32fcaedfabd07bb03d2771552c5f412", "job": "REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~8", "model": "fable", "worker": "chris-x30"} -->
