<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14748#issuecomment-6895324633 -->
Review (claude) of 0e86190

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.2 cites a line that does not contain the statement

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:450`: "its complement being a locally finite union of proper sub-balls (WitteMorris2015 line 2726; FuchsianOrbifolds Layer 0 for n = 1)". The same locator is in `design/plan.json`, target 5.2 (`"where": "line 2726"`).

   **Claim.** The cited line supports proper discontinuity on B, the precisely invariant neighbourhoods and the description of the free locus.

   **Witness.** WitteMorris2015 line 2726 is a clause inside the proof of Corollary 4.7.5 (printed p. 64) that uses proper discontinuity of Γ acting on G itself. It says nothing about a symmetric space, stabilisers or a free locus.

   **Repair.** Replace the parenthesis by: "(WitteMorris2015 line 18558 to line 18561, printed p. 448, for the definitions of a properly discontinuous action and of a stabiliser; the precisely invariant neighbourhoods and the description of the free locus are proved here from §3.4; FuchsianOrbifolds Layer 0 for n = 1)". Give plan target 5.2 the same locator. Tested: lines 18558–18561 carry exactly those two definitions.

2. **F02** (P3) §10.5 has no locator for its uniqueness statement

   **Location.** `design/README.md:772`: "the extension is algebraic (MilneSVI line 1690 to line 1694; BaldiUllmo2023 line 513 to line 516)"; `design/plan.json`, target 10.5, locator.

   **Claim.** The two passages state the uniqueness of the compact Hausdorff normal finite-point compactification.

   **Witness.** MilneSVI line 1690 to line 1694 sketches the embedding of Γ\ℍ* by modular forms for n = 1. BaldiUllmo2023 line 513 to line 516 says the minimal compactification is recovered by blowing down the toroidal boundary. Neither states a uniqueness theorem.

   **Repair.** Write: "This theorem is proved here from §§9.4–9.5. Mok2012 line 14 to line 16 states the minimality property of the Satake–Baily–Borel compactification among normal compactifications in the arithmetic case; MilneSVI line 1690 to line 1694 and BaldiUllmo2023 line 511 to line 516 describe the finite-point compactification, not its uniqueness." Make the plan locator of 10.5 say the same and add "10.5" to Mok2012's `cited_for` in `sources.toml`. Tested: Mok2012 lines 14–16 state that the identity extends from any normal compactification to the minimal one.

3. **F03** (P3) "neat" names a weaker condition than AdelicAlgebraicGroups §4.3's on main

   **Location.** `design/README.md:33` (Conventions, "Neat"), `:519` (§6.4) and `:841` (§11.3: "neat when K_f is neat"); plan targets 6.4 and 11.3.

   **Claim.** One word "neat" serves both for this roadmap's lattices and for the levels K_f of ShimuraVarieties.

   **Witness.** `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4618–4622` (main, §4.3, `Neat.IsNeatAut`) requires the eigenvalues to generate a torsion-free subgroup of ℂ^×. For n = 2, γ = m·a₂ with m: u ↦ iu has lift eigenvalues 2, i, 1/2, so Ad(γ) has eigenvalues ±2i, 4, their inverses and 1. None is a nontrivial root of unity, yet (2i)/(−2i) = −1.

   **Repair.** Keep the definition (Layers 6–10 use only the eigenvalue condition) and state the relation:

   - Conventions: add "AdelicAlgebraicGroups §4.3's neatness of Ad(γ) (`Neat.IsNeatAut`) implies neatness here and is strictly stronger; this roadmap uses only the condition above."
   - §6.4 Checks: add the element γ above, neat here and not neat in the sense of §4.3.
   - §11.3: write "neat in the sense of the Conventions when K_f is neat in the sense of AdelicAlgebraicGroups §4.3".
   - Add AdelicAlgebraicGroups §4.3 to the supplier contract and to the *Needs:* line of §11.3; mirror the changes in plan targets 6.4 and 11.3.

   Tested on γ: the two conditions separate, and the implication used in §11.3 runs in the direction that holds.

4. **F04** (P3) §§7.3, 7.4 and 9.6 carry no source locator in the README

   **Location.** `design/README.md:562` (§7.3), `:572` (§7.4), `:712` (§9.6).

   **Claim.** Every theorem of the README has a locator, and README, plan and manifest agree.

   **Witness.** `design/plan.json` gives 7.3 the locator Cartan1957 pp. 90–102, 7.4 the locator Mok2012 line 19 to line 26 and 9.6 the locator MilneSVI line 1690 to line 1694. `sources.toml` lists 7.3, 7.4 and 9.6 in the three `cited_for` lists. The README cites none of the three keys in those sections.

   **Repair.** Add at the claims: §7.3 "(Cartan1957 pp. 90–102, uncertified; ShimuraVarieties §P.6, …)"; §7.4 "(Mok2012 line 21 to line 23, where the case n = 1 is recalled as classical)"; §9.6 "(MilneSVI line 1690 to line 1694, the embedding of the compactified quotient by modular forms, for arithmetic Γ)". Tested: Milne lines 1690–1694 and Mok lines 21–23 contain those statements.

5. **F05** (P3) §8.5 reuses the symbol ν of §8.4 for a different object

   **Location.** `design/README.md:639`: "write the Poincaré bound as ω_E′ + ν with ω_E′ Euclidean in w′ and ν = i dwₙ∧dw̄ₙ/(|wₙ|² log²|wₙ|); since ν∧ν = 0".

   **Claim.** The notation of Layer 8 is consistent.

   **Witness.** `design/README.md:628` (§8.4) fixes ν = dw₁∧…∧dw_{n−1}∧dq/q, the frame of E, and §9.2 (line 671) uses χν^ℓ in that sense. In §8.5 the same letter is a (1,1)-form.

   **Repair.** In §8.5 rename the form to β: "ω_E′ + β with … β = i dwₙ∧dw̄ₙ/(|wₙ|² log²|wₙ|); since β∧β = 0, ω^k|_Y is bounded by ω_E′^k + k ω_E′^{k−1}∧β". The computation is unchanged: β∧β = 0 because β is a multiple of dwₙ∧dw̄ₙ.

Five findings, all P3, each with a repair to apply: three locator defects, one convention clash with a roadmap on main, one notation clash. No P1 or P2 finding. The two declared supplier gaps (`gap:normality-analytification`, `gap:normal-riemann-extension`, supplier ComplexComparisonPartII) are precise, minimal and declared in both places; they are not findings. The five findings of round 5 are repaired. No file of the design and no manifest entry was changed by this review.

Elaboration: not available (this lane does not elaborate). The package has no `Suggested.lean` at the design stage, so no Lean command was run and no build is claimed.

## Verified sound

### Round 5 findings, one by one

| Round 5 finding | Repaired passage | Status |
|---|---|---|
| F01 (P1), curvature of K_B | §2.3: "iΘ(K_B) = i∂∂̄ log det(h) = −Ric(ω) = (n + 1)ω and iΘ(K_B^m) = m(n + 1)ω"; Conventions and plan 2.3 agree; new Check "Canonical against anticanonical". Recomputed for n = 1: ‖dw‖² = (1−\|w\|²)², iΘ = −i∂∂̄ log(1−\|w\|²)² = +2ω. | Repaired |
| F02 (P1), doubled cusps | §10.5: "every compact Hausdorff normal complex analytic space Y"; Conventions: "the Hausdorff condition is part of the definition"; Checks "Doubled cusps" and "Γ cocompact"; plan 10.5 hypotheses agree. | Repaired |
| F03 (P3), cyclic parabolic Check | §5.1: "its part with ε < y < 1 has ω-area (ε⁻¹ − 1)/2 → ∞, while its horoball part y > Y has finite area 1/(2Y)". Recomputed with ω = dx∧dy/(2y²). | Repaired |
| F04 (P3), direction of conjugation | §11.1: "ρ′(g) = A⁻¹gA, A = diag(2, 1) … meet in Γ⁰(2)". Recomputed: A⁻¹gA = [[a, b/2],[2c, d]]. | Repaired |
| F05 (P3), Deng's Theorem A | §10.3: "Deng2020 Theorem A, line 87 to line 90, is a different criterion, with different hypotheses". Deng2020 lines 87–90 read: a C-PVHS with zero-dimensional period fibres is assumed. | Repaired |

No finding of the repair report was marked "not actionable in this package". No maintainer notes were supplied.

Patterns looked for in the rest of the design:

- Curvature sign of K: §§7.2, 8.4, 9.1, 9.2 agree with iΘ(K) = (n+1)ω.
- Missing Hausdorff hypothesis: §§9.4, 9.5, 10.6, 11.4 apply §10.5 only to projective varieties. ShimuraVarieties §P.6 assumes a Hausdorff space, and §§7.1 and 9.5 apply it to open subsets of B and to (S*_{Γ′})^an.
- Direction of conjugation: §1.5 a_s n_{(a,t)} a_s⁻¹ = n_{(sa, s²t)}, recomputed.
- Locators with dropped hypotheses: §§10.1, 10.2, 10.4 are labelled "arithmetic case". R01, R02 and R04 are what this search found.

### Coverage and shape

Read the 963-line README in full, all 57 plan targets (42 theorems, 10 definitions, 5 constructions) and the 17 manifest entries.

- Every plan target has at least three tests; every definition and construction has an API; every `target:` prerequisite precedes its consumer.
- The README has twelve layers, each ending with Examples and Dependencies.
- The layer order is the roadmap's own and forced by its *Needs:* lines: §8.1 needs §6.4, §9.2 needs §§8.2–8.4, §10.1 needs §§9.4–9.5.
- No LaTeX delimiters, machine paths, pull-request numbers, `lemma`, `set_option`, algorithms or sorry'd data. The README attributes no backticked Lean name to this roadmap.
- Both gaps have the same slug in `plan.json` and under "What ComplexComparisonPartII must provide". They are minimal: ComplexComparisonPartII (its head, discussion after `analyticSubsetComplementConnected`) says it avoids "the normality of the analytification of a normal scheme and the extension theorem on normal analytic spaces", so neither is supplied today. The `needs` sentence of the second gap names the classical theorem; the README contract and the plan `detail` carry its hypotheses (continuous, holomorphic off a nowhere-dense analytic subset).

### Adversarial table (computed values)

Curvature −2 normalisation throughout; ⟨a,u⟩ = Σ conj(aⱼ)uⱼ.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, Heisenberg law | a = 1, a′ = i (n = 2) | Composition of n_{(a,t)}n_{(a′,t′)} gives vertical part t + t′ − 2 Im⟨a,a′⟩; (1,0)(i,0) = (1+i, −2), (i,0)(1,0) = (1+i, +2); commutator T₋₄ | Pass |
| §1.2 conjugation representation (sample) | n = 1, h_t; scalar i·1; n = 2, diag(1, e^{iθ}, 1) | Ad eigenvalues e^{2t}, 1, 1, e^{−2t}; i·1 ↦ identity; ratios 1 (×5), e^{±iθ} (×2 each): 9 = (n+1)². Closed image: limit of λ_k g_k has hᴴJh = cJ, c = lim \|λ_k\|² > 0 | Pass |
| §1.3 Cayley transform (sample) | w = (0, 1/2), (0, 2); general w; inverse | C = (0, 3i), ρ = 3 = (3/4)/(1/4); C(0,2) = (0, −3i), ρ = −3; ρ∘C = (1−\|w\|²)/\|1−wₙ\|²; C⁻¹: 1−wₙ = 2i/(v+i), w′ = 2iu/(v+i); Im v ≥ 0 keeps v + i ≠ 0; \|u\|² ≤ \|v\| gives w′ → 0 at ∞ | Pass |
| §1.5 Heisenberg comparison | (p+iq, t) ↦ (p, q, −t/4 + pq/2) | Image of the product has z + z′ + pq′, the law of `TauCeti.HeisenbergGroup` (Heisenberg.lean:95: `a.z + b.z + a.x * b.y`) | Pass |
| §2.3 curvature (repaired) | n = 1, 2; ℓ = 1, 2 | iΘ(K_B) = +2ω, +3ω; iΘ(K^{ℓ−1}) = 0 at ℓ = 1 and 2ω at ℓ = 2, n = 1; Killing curvatures −1/3, −1/12 times 6 = −2, −1/2 | Pass |
| §2.1 Aut(B) = G (headline) | w ↦ w/2; z + z² on ℂ; Möbius with tanh t = −1/2 | Df(0) = 1/2 ≠ 1; unbounded domain; (w + tanh t)/(1 + w tanh t) sends 0 to −1/2, h_t sends 0 to i/2 | Pass |
| §3.3 classification (headline) | two axes in B²; n = 1 | reducible union excluded by irreducibility; only B itself for n = 1 | Pass |
| §3.4 fixed sets (sample) | diag(1, e^{iθ}, 1); diag(1, ζ, ζ); diag(1, 1, −1) | eigenspaces ⟨e₀, e₂⟩ of signature (1,1) and ⟨e₁⟩ negative: fixed set {w₁ = 0}; ⟨e₀⟩ of signature (1,0): fixed set {0}; {w₂ = 0}. Exactly one eigenspace is non-negative-definite in each | Pass |
| §4.4 Margulis lemma | coset count; S₃ ⊂ U(2) | Left cosets gΛ₀: F·C_j ⊂ C_{j+1}, so C_j = C_{j+1} makes C_j stable under Λ, hence all of Λ/Λ₀; at most m cosets; S₃ gives index 2 | Pass |
| §5.1 lattices (sample, repaired Check) | {1}; Γ(2)/{±1}; ⟨T₁⟩, ε = 1/10, Y = 1; n = 2 | Haar(G) = ∞; index 6, covolume 6·π/6 = π; (ε⁻¹−1)/2 = 4.5, 1/(2Y) = 1/2; ∫ρ⁻³ over u ∈ ℂ diverges | Pass |
| §5.2 proper discontinuity (sample) | irrational rotation; {1, w ↦ −w}; ⟨T₁⟩ | infinite stabiliser of 0, not discrete; stabiliser of order 2 with free locus B ∖ {0} for n = 1; free | Mathematics passes; locator R01 |
| §6.1 cusp theorem (sample, headline) | PSL(2,ℤ); H = [[0,0,−i],[0,−2,0],[i,0,0]], R̃, T̃ | zᴴHz = 2(Im v − \|u\|²) on (1,u,v); eigenvalues of H: 1, −1, −2; R̃ᴴHR̃ = H; T̃ᴴHT̃ = H + (−i + i)E₀₀ = H; d(x, Tx) = √2·arcsinh(1/2000) = 0.00070711 | Pass |
| §6.3 Selberg, eigenvalue form (sample, headline) | Γ(3), Γ(2) ⊂ SL₂(ℤ); {±1}; finite Λ | root-of-unity eigenvalue ⇒ trace ∈ {−2,−1,0,1}; mod 3 these are 1, 2, 0, 1 against 2: only −1 survives, and it has order 3; Γ(2) ∋ −1; Λ′ = {1}. Route: two maximal ideals of distinct residue characteristics handle orders p^k | Pass |
| §6.4 neat | Γ(3) image; m·T_t with m of order 4; m·a₂ | Ad eigenvalues λ², 1, 1, λ⁻² with λ = 1 only; eigenvalue i; ±2i, 4 and inverses, with −1 in the generated group | Pass; R03 |
| §7.1 analytic quotient (sample, headline) | w ↦ −w for n = 1, 2; reflection diag(1,1,−1) | coordinate w²; invariants x², xy, y² with (xy)² = x²y², singular; coordinates (w₁, w₂²), smooth | Pass |
| §7.3 finite quotients (sample) | Γ′ = Γ; Γ(2)/{±1} ◁ PSL(2,ℤ) | F trivial; F ≅ S₃ of order 6, quotient the j-line | Pass; locator R04 |
| §8.1 cusp charts (sample) | general a, a′; λ, iλ (n = 2) | \|q\|² < e^{−4π\|u\|²/τ}; exponents of e_a(u+a′)e_{a′}(u) and e_{a+a′}(u) differ by −(4π/τ)i·Im⟨a,a′⟩, equal to χ(a+a′)/(χ(a)χ(a′)); n_λ n_{iλ} = n_{((1+i)λ, −2λ²)}, τ = 4λ², χ((1+i)λ) = e^{−πi} = −1; iΘ(μ) = −(4π/τ)i∂∂̄\|u\|² | Pass |
| §8.4 log canonical frame | translation by a ∈ Λ_b; f = q^k, ℓ = 0, 1 | dq/q ↦ dq/q − (4π/τ)⟨a,du⟩, killed by du₁∧…∧du_{n−1}; radial exponent (ℓ−1)(n+1) ≥ −1 iff ℓ ≥ 1; k = 0 diverges, k = 1 converges at ℓ = 1 | Pass |
| §8.5 finite volume (sample) | n = 1; flat cylinder | (ω_E′ + β)^k = ω_E′^k + kω_E′^{k−1}∧β; ∫₀^δ dr/(r log² r) = 1/\|log δ\|; ∫ dr/r = ∞. Finite projections onto (w_I′, wₙ) exist because Y ∩ D has dimension k − 1 | Pass; notation R05 |
| §9.3 Mok's embedding (sample, headline) | Γ(2)/{±1}; cocompact Γ | E = O(1) on ℙ¹; h⁰(E^ℓ) = ℓ + 1; K = O(−2) has 0 sections; E^ℓ trivial on T_b so sections are constant there; D = ∅ gives a pluricanonical embedding | Pass |
| §9.4 minimal compactification (sample, headline) | Γ(2)/{±1}; cocompact | 3 cusp classes, 3 boundary points; 0 boundary points; cusp points infinite, ∂ finite | Pass |
| §9.6 n = 1 (sample) | PSL(2,ℤ); Γ(3); Γ₀(11) | genus 0 with 1 cusp; index 12, 4 cusps, genus 0; (−1/11) = (−3/11) = −1, index 12, 2 cusps, genus 1 + 12/12 − 2/2 = 1 | Pass; locator R04 |
| §10.2 extension (headline) | exp(1/z) into the j-line; r = 0 | essential singularity, no extension to ℙ¹; nothing to extend | Pass |
| §10.3 Borel algebraicity (headline, repaired) | exp: ℂ → ℂ; finite cover | not algebraic, torsion present; algebraic | Pass |
| §10.5 uniqueness (headline, repaired) | doubled ℙ¹; ℂ*; nodal cubic; cocompact | 6 against 3 boundary points, not Hausdorff; 2 ends, 2 points; punctured neighbourhood with 2 components; Y = X_Γ. Injectivity: f closed, f⁻¹(V) ⊂ U ∪ U′, both parts of V ∖ {p} nonempty by density | Pass; locator R02 |
| §11.1 arithmetic lattices (sample, repaired) | SL₂ → PGL₂; ρ′(g) = A⁻¹gA; {1} | index 2 by determinant sign; [[1,1],[0,1]] ↦ [[1,1/2],[0,1]], [[1,0],[1,1]] ↦ [[1,0],[2,1]]; [SL₂(ℤ) : Γ⁰(2)] = 3; {1} not commensurable with an infinite group. (b): commuting connected normal images in a centreless simple G, exactly one equal to G | Pass |
| §11.3 Shimura datum (headline) | n = 1, 2; z = i | 2 components for n = 1; \|det g\|² = det(−J)/det J = −1 impossible for n = 2; h₀(i) = [diag(1, −1, …, −1)], w ↦ −w; tangent action z/z̄, type (−1,1). Compact adjoint factors have connected real points, so C⁺ = C | Pass |
| §12.4 intersection setting (headline) | Q = B × {s}, B × S_Γ, {x₀} × S_Γ | (dim Q, dim U) = (n, 0), (2n, n), (n, 0), each equal to dim Q − n | Pass |

Sections outside the table were recomputed while reading and found correct. Among them:

- §1.4: section g_w, the bracket [Y_u, Y_v], and tanh\|t\| = \|g·0\|.
- §2.2: h(u,u) = 16/9 at w = (1/2, 0); volume density 2ⁿ(1−\|w\|²)^{−(n+1)}.
- §2.5: derivative norms 1, 1/√2.
- §4.1: the Jordan-block identity λ̄⟨v,v⟩ = 0.
- §4.2: cosh²(d/√2) ≥ (1 + \|u−u′\|²/(2ρ))² on a horosphere.
- §4.5: the isotropic-subspace bound n − 1 < 2n − 2 for n ≥ 2.
- §9.1: genus 2 with ℓ = 2 gives degree 4 < 5.
- §9.2: dimension ℓ − 2 of sections of O(ℓ − 3) on ℙ¹.
- §10.1: circle length √2π/\|log r\|.
- §10.6: degrees 6 and 12.

### Seeded source sample

| Target | Locators read and result |
|---|---|
| 1.2 | BaldiUllmo2023 line 492 to line 496: the matrix quotient. The README says its three statements on Ad are deduced here. Supported. |
| 1.3 | BaldiUllmo2023 line 559 to line 565 and Mok2012 line 131 to line 137: the Siegel presentation with b at infinity. Supported; the formulas are the roadmap's. |
| 3.4 | Goldman1999 Ch. 3 only, settled uncertified: not read. The eigenspace argument in the README is self-contained and was checked. |
| 5.1 | WitteMorris2015 line 1893 (Definition 4.1.9), line 1940 (Definition 4.1.16), line 2000 to line 2001 (Exercise 4.1#10); BaldiUllmo2023 line 355 to line 357. Supported. |
| 5.2 | WitteMorris2015 line 2726: does not contain the statement (R01). |
| 6.1 | BaldiUllmo2023 Theorem 3.4.3, line 649 to line 661, with its proof at line 656 to line 658 quoting the two Garland–Raghunathan theorems; Mok2012 line 309 to line 349 (torsion-free only, as the README says). Supported. |
| 6.3 | WitteMorris2015 line 2972 (Theorem 4.8.4), line 2974 to line 2988 (proof for SL(ℓ,ℤ) only, as the README says), line 2910, line 3008, line 3002, line 3445. Supported. |
| 7.1 | BaldiUllmo2023 line 431 to line 434 (Definition 3.1.8 and closed sub-quotients); Cartan1957 uncertified, not read. Supported for the notation; the construction is through ShimuraVarieties §P.6. |
| 7.3 | No locator in the README (R04); ShimuraVarieties §P.6 read at its head. |
| 8.1 | Mok2012 line 152 to line 178 and equations (5)–(6) at line 173 to line 175; BaldiUllmo2023 line 559 to line 571. Supported; the README corrects the missing factor χ(a). |
| 8.5 | BaldiUllmo2023 line 586 to line 601 (Definition 3.3.4, Theorem 3.3.5); Mok2012 Proposition 1, line 295. Supported as inputs. |
| 9.3 | Mok2012 Main Theorem, line 546 to line 562; MilneSVI line 1734. Supported. |
| 9.4 | Mok2012 line 559 to line 562 and Theorem 1, line 476 to line 484. Supported for torsion-free Γ; the README assumes neat. |
| 9.6 | No locator in the README (R04). |
| 11.1 | WitteMorris2015 Definition 5.1.19, line 3732 to line 3739; Proposition 9.4.5, line 8668 to line 8669; BaldiUllmo2023 line 333 to line 339; Mostow1980 line 3089; DeligneMostow1986 line 151 to line 152. Supported. |

Also read, for the repaired passages: Deng2020 line 61 to line 63, line 87 to line 90, line 136; MilneSVI line 1682 to line 1694, 1722 to 1736, 1742 to 1748, 1764 to 1780; Mostow1980 line 85, line 95, line 3862 (the non-arithmetic lattices there are cocompact, as the Layer 5 Examples say).

### Pinned declarations opened

Every file-and-line citation of the supplier contract was opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d) and holds the named declaration at the cited line.

- Mathlib: `Algebra/Lie/Classical.lean:175`, `LinearAlgebra/UnitaryGroup.lean:105`, `Logic/Equiv/Fin/Basic.lean:224`, `LinearAlgebra/Projectivization/Basic.lean:48`, `Topology/Algebra/Projectivization.lean:44`, `Analysis/Complex/UnitDisc/Basic.lean:30`, `Analysis/Complex/Schwarz.lean:189`, `Topology/Algebra/ConstMulAction.lean:534, :566, :601`, `Topology/Algebra/Group/DiscontinuousSubgroup.lean:28`, `Topology/Algebra/Group/Subgroup.lean:155`, `Topology/Algebra/ProperAction/CompactlyGenerated.lean:95`, `MeasureTheory/Group/FundamentalDomain.lean:69, :679, :695`, `GroupTheory/Commensurable.lean:58, :141`, `AlgebraicGeometry/Normalization.lean:122`, `RingTheory/Jacobson/Ring.lean:60, :681, :691`, `RingTheory/Ideal/KrullsHeightTheorem.lean:282`, `GroupTheory/GroupAction/Defs.lean:349`, `Analysis/InnerProductSpace/PiL2.lean:296`.
- Tau Ceti: `Topology/Algebra/UnitaryGroup.lean:104, :110`, `Topology/Algebra/Projectivization.lean:188, :215, :311`, `Geometry/Manifold/Instances/Projectivization.lean:54, :82, :96`, `Analysis/Complex/CauchyIntegralPolydisc.lean:351`, `Geometry/Manifold/Instances/Quotient.lean:253`, `MeasureTheory/Group/ProperlyDiscontinuous.lean:100`, `Topology/Algebra/GroupAction/FreeLocus.lean:36`, `GroupTheory/SpecificGroups/Heisenberg.lean:58`, `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; the directories `Analysis/Complex/Fuchsian/` and `Analysis/Complex/Conformal/SchwarzPick/` exist.

Duplication by object at the pins: Tau Ceti has `Subgroup.conj_eq_or_conj_eq_inv_of_dist_le` (`TauCeti/Analysis/Complex/Fuchsian/Margulis.lean:91`), a pairwise Margulis lemma for Fuchsian groups with a fixed-point-free hypothesis. It is not the virtually nilpotent statement of §4.4 and is not restated here. The pins have no indefinite unitary group, no Zassenhaus neighbourhood and no Selberg lemma.

### Supplier and ownership audit

Resolved at main or at the open heads, each citation found where cited:

- RealSemisimpleLieGroups (open, new roadmap): §3.1, §5.2, §5.3, §5.4, §5.6, §5.7. The §5.7 form is linear in the first slot, g_𝔹 and Killing = 2(n+1)·g_𝔹 are as the contract says, and the supplier's scope leaves Selberg's lemma, finite generation, non-arithmetic ball quotients and the full biholomorphism group outside itself.
- RepresentationTheory/LieGroups (main): `kakDecomposition` (README:1362), `iwasawaDecomposition`, `IwasawaData`.
- ComplexComparisonPartII (open): §§C-1.1, C-1.2, C0.6, C1.4, C1.6, C1.9, C4.1, C4.2, C4.4 with the named declarations; "No Hausdorff axiom is imposed globally" and "Separated X has Hausdorff X^an" are in §C-1.1.
- ShimuraVarieties (open): §§P.1, P.2, P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.5–2.7, 3.1–3.3, 3.4a, 3.5 and all thirteen `TauCeti.Shimura.*` names.
- AdelicAlgebraicGroups (main): §1.1, §3.4 with `Reduction.IsSArithmetic`, `Reduction.arithmetic_finite_volume_iff`, `Reduction.levelArithmetic` and "Arithmetic lattices in a real Lie group" (README:3384), whose predicate is the one §11.1 reads.
- PELModuli §M5.5 (three names), ShimuraData §3.8, AlgebraicModuliForArithmeticGeometry §§5.4, 9.5 (open heads).
- On main: ComplexKahlerGeometry K1–K4, K6.0 (Chern connection A = h⁻¹∂h at README:172), ComplexManifolds Milestones 4–7, RiemannianGeometry R4.7 and R5a, VonNeumannAlgebras Layer 9 (README:2861), SchemeAndStackFoundations §1.17 `finiteGroupQuotient_projective` (README:3450), FuchsianOrbifolds Layers 0–4 and L2.1, Completed/ConformalMapping Layer 2.

The resolver's sixteen "Lean names found nowhere" are the supplier roadmaps' own names; each occurs in its roadmap as listed above. `scratch/overlaps.md` reports no competing pull request, no dropped id, no revision-only id and no second copy; main has no folder of this name.

Searched by object with `roadmaps grep` (main and open heads): PU(1,n), complex hyperbolic, Selberg's lemma, Margulis lemma, Zassenhaus, toroidal compactification, Heisenberg group, Schwarz–Pick, neat subgroup, hyperbolically embedded, Cartan's uniqueness, minimal compactification, Siegel domain, Riemann extension. Results:

- PU(1,n) and complex hyperbolic space occur only in RealSemisimpleLieGroups, which is cited.
- GeometricTopology §7.3 (main) proves a Margulis lemma for real hyperbolic ℍⁿ, a different space.
- "neat" is owned by AdelicAlgebraicGroups §4.3 (R03).
- No other roadmap states the cusp theorem, Selberg's lemma for linear groups, the ball's biholomorphism group, Mok's theorem or the extension theorem for non-arithmetic quotients. This roadmap owns them.

Overlap check: read RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, ComplexComparisonPartII, FuchsianOrbifolds, ConformalMappingPartII, AdelicAlgebraicGroups; form, groups, ball, metric and local classification → RealSemisimpleLieGroups §5.7; MAN → RealSemisimpleLieGroups §3.1; KAK → LieGroups Layer 9; arithmetic-lattice predicate and neat elements → AdelicAlgebraicGroups §§3.4, 4.3; arithmetic quotients and Baily–Borel → ShimuraVarieties; n = 1 quotient and cusps → FuchsianOrbifolds; disc Schwarz–Pick → Completed/ConformalMapping; nothing else shared.

Dependency check, run on the unchanged design:

```text
candidate: BallQuotientsAndComplexHyperbolicLattices is not in the merge order yet; checked as if placed after ShimuraData (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Headline theorems

From the Summary: Aut(B) = PU(1,n) (§2.1); classification of totally geodesic subvarieties (§3.3); the cusp structure theorem (§6.1); finite generation and Selberg's lemma (§§6.2–6.3); the normal analytic quotient (§7.1); the toroidal compactification (§8.2); L² jets and projectivity of S*_Γ (§§9.1–9.5); the extension theorem and Borel algebraicity (§§10.2–10.3); uniqueness of the model and of the finite-point compactification (§§10.4–10.5); the Shimura datum and the Baily–Borel comparison (§§11.3–11.4); Γ-special equals totally geodesic (§§12.2–12.3); the intersection setting (§12.4). Each is a named target with hypotheses. The headline, padding and binder checks on `Suggested.lean` do not apply at the design stage.

### Copyright, wording, arrangement, reuse

- **Wording.** Each locator passage read above was set beside the README text, and five further passages: §6.2 against WitteMorris2015 line 2699 to line 2701; §8.1 against Mok2012 line 155 to line 164; §9.1 against Mok2012 line 495 to line 514; §10.1 against Kiernan1972 line 68 to line 75; §12.1 against BaldiUllmo2023 line 49 to line 50 and line 468 to line 473. The longest shared run is about eleven words, the statement that no eigenvalue of any element is a nontrivial root of unity (WitteMorris2015 line 2972 to line 2973), which the mathematics forces. Notation (Φ_ℓ, Ĝ, Ξ, Σ) is shared with Mok2012 and BaldiUllmo2023; no sentence, list or proof plan is.
- **Arrangement.** BaldiUllmo2023 has the largest share. Its contents (line 15 to line 23: introduction, notation, real Shimura data, ℤ-Hodge theory, comparison, finiteness, special points) do not map onto the twelve layers; its §3 is spread over Layers 1, 3, 6, 8, 10, 11, 12 and its §§4–7 are outside the scope. Mok2012 (§1 toroidal compactifications, §2 projective algebraicity) is nearest to Layers 8–9, but its §1.3 is in Layers 4–6, §8.4 comes from its §2.2, §8.5 and §§9.5–9.6 are not in it, and the order of Layers 8 and 9 is forced by §9.2's *Needs:* line.
- **Reuse.** No table, figure, exercise list or data set is taken over.

Source independence: 36 passages compared with 8 sources (BaldiUllmo2023, Mok2012, WitteMorris2015, MilneSVI, Kiernan1972, Deng2020, DeligneMostow1986, Mostow1980), none shared beyond forced statements; largest share BaldiUllmo2023, 38 of 124 locators; contents compared with BaldiUllmo2023 and Mok2012: independent. Goldman1999 and the other settled unread works could not be compared.

## Not verifiable

- Goldman1999 Ch. 3 (the only locator of sampled §3.4, and of §§2.1, 3.2): settled uncertified, text not read.
- Raghunathan1972, Borel1969, Alperin1987, Borel1972, BailyBorel1966, SiuYau1982, Cartan1957: settled uncertified, not read. GarlandRaghunathan1970: waived, not read; §6.1 (2) rests on BaldiUllmo2023's quotation of it.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists at this stage.
- Ownership against open pull requests was checked through the tools' index of open heads; the brief's list of 239 names does not include RealSemisimpleLieGroups, whose head the tools did provide.

## Source issues

- **Error** in Mok2012 at §1.1, equations (5)–(6), printed p. 5: the source says elements of Γ ∩ W_b have vertical part in τℤ; it should allow a coset t_a + τℤ and the resulting unitary multiplier; affects a stated result.
- **Misprint** in Mok2012 at §2.2, printed p. 14 (line 604): the source says E is K twisted by the inverse of [D]; it should be K ⊗ [D], as in its Main Theorem; affects nothing.
- **Misprint** in Mok2012 at §2.2, printed p. 15 (line 642): the source says its Theorem 1 gives the L² solution; it should refer to Theorem 2; affects nothing.
- **Error** in BaldiUllmo2023 at §3.2, printed p. 12 (line 500 to line 502): the source says the stabiliser of a subspace is a product of PU(1,m) and a compact group; it should be an extension of PU(1,m) by a compact kernel; affects a stated result.
- **Misprint** in BaldiUllmo2023 at §3.2, printed p. 12 (line 501): the source says m is the rank of the subspace; it should be its dimension minus one; affects nothing.
- **Misprint** in MilneSVI at Remark 3.13, printed p. 39: the source labels two consecutive items (c); the second should be (d); affects nothing.

## For the human reviewers

- **Ordering.** RealSemisimpleLieGroups, supplier of §§3.1 and 5.2–5.7, is an open new-roadmap pull request by another author and is absent from `merge-order/ORDER.txt`; the gate placed this roadmap after ShimuraData without testing that edge.
- **Licence.** Mok2012 was read as the HKU IMR preprint IMR2009-4 (`sources.toml`, licence class author-page), not as the published chapter; its numbering was not compared with the printed volume.
- **Not tested.** Goldman1999 and eight other uncertified or waived works were not compared for wording; BaldiUllmo2023, the largest-share source, was read and compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0e86190f0fce540ee35f18f56b146c646f4a9288", "job": "REV-DESIGN-BallQuotientsAndComplexHyperbolicLattices~6", "model": "fable", "worker": "chris-x79"} -->
