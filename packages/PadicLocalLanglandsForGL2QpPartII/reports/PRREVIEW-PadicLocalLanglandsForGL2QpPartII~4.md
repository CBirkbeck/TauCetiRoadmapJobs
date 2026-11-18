# Review of PadicLocalLanglandsForGL2QpPartII (pull request #2455 at 3222060)

**Verdict:** accepted

**Summary.** Accepted: no finding. The previous finding on §1.3 is repaired, and the new single route to the vanishing in dimension at least three (§4.14 through the occurrence theorem §4.11) is sound and no longer needs the mod p finiteness input. There is one small correction (a source-correction entry that still points at an argument §4.14 no longer makes) and no format note; neither blocks. The acceptance is conditional on the four declared supplier gaps, and one question of scope is left for the human reviewers.

## C01 — Source correction E24 still points at §4.14, which no longer uses the corrected step

A reader who follows E24 to §4.14 looks for the passage from an absolutely irreducible quotient of the Banach representation to an embedding of its dual, and does not find it. At this head §4.14 (line 731) obtains the vanishing in dimension at least three from §4.11 for the supercuspidal sectors and from the character action of §4.2 for the special ones; the transpose argument of CDN23 Théorème 5.10 is gone. E24 (line 1176) still ends with the pointer "§4.14.", as the corrections whose step the roadmap uses do.

The correction itself is true (CDN23 lines 2549–2551 take a subrepresentation where a quotient is needed). The smallest change is to end E24 as E6 ends: "This roadmap does not use this step; §4.14 obtains the vanishing from §4.11."

## Previous findings

- R01 — repaired. §1.3 (line 165) now proves "Infinite slope already forces the condition on u(pⁿ)−1" through `u(pⁿ)−1 = (u(1)−1)·S_n` and concludes that on the base §4.9's objects the space "is therefore that section's compactly supported P-finite space"; the scope bullet (line 1200) and the base contract (line 1242) say the same. Recomputed: `diag(p^m,1)⁻¹u(pⁿ)diag(p^m,1) = u(p^(n−m))`, so `(u(p^N)−1)^k v = 0` for N = max(1, n−m).
- R01 of the review before it — not repaired: deferred (D01)

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

| Target | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| §1.1 sandwich (sample) | weights {0,1}; {0,k}, k ≥ 2 | D⁺ = tN⁺ + L_n[[t]]ℒ; tN ⊂ D ⊂ N only at weights {0,1} | Σt⁻ⁱFilⁱ: jumps −1,0 give tM+ℒ; jumps −k,0 give t^kM+ℒ, not ⊇ tM (DLB17 lines 1296–1299) | holds |
| §1.3 (previous R01) | any P-representation; b = p⁻¹, m = 1, N = 2 | infinite slope forces (u(p^N)−1)^k v = 0; third API bullet | conjugation gives u(p^(n−m)); S_N(1−u(c)) = (u(p^N)−1)·Q; Σ_(i<p²) ζ_p^(iu) = 0 for u ≢ 0 | holds |
| §1.5 (sample) | (a,b) = (0,1); (1,2); ±√c | u⁻ = −t∂²; Casimir 0; a⁻ = 2−∇; Casimir (4c−1)/2 | ∇(∇−1) = t(∂t∂−∂) = t²∂²; ((1−2)²−1)/2 = 0; (a−b)² = 4c; DLB17 lines 1460–1465 | holds |
| §1.7 fixed vectors and converse | Ad(u(−x)); bx = p⁻¹ | a⁺u(x) = u(x)(a⁺+xu⁺); a⁺u⁻v = −u⁻v; φ(x) = 0 | u(−x)E₁₁u(x) = E₁₁+xE₁₂; [E₁₁,E₂₁] = −E₂₁; ζ_p−1 invertible on an L_∞-module | holds |
| §1.7 density at every prime | V non-trianguline | Π_c^P-fin dense in Π^an; ∩(u⁺)^j of the dual is 0 | DOSPINESCU12THESE lines 3378–3385, 3409–3410: no hypothesis on p; COLMEZ14LA line 2032 gives Δ⊠{0} = 0 | holds |
| §2.1 common dual (sample) | diag(p,1)-fixed z | Res_ℤ_p lands in the ψ = 1 part; equality inside tN_rig⊠ℙ¹ | Res_ℤ_p∘diag(p⁻¹,1) = ψ∘Res_ℤ_p (DLB17 line 1682); Théorème 8.6 at line 1828 is an equality of subspaces | holds |
| §2.2 covariance | g = w; O(Ω) | w∂w = ∂⁻¹; gu⁺g⁻¹ = det⁻¹(a−c∂)²u⁺ | (0·∂−1)(0−∂)⁻¹ = ∂⁻¹; Ad(g)E₁₂ on O(Ω): −a²f′+2aczf′−c²z²f′ = −(a−cz)²f′ | holds |
| §2.3 irreducibility | k = 1 | quotient is Π(M°,−1)⊗det, irreducible | COLMEZ19POIDS line 180 (k ≥ 1), line 234 carries ⊗x^k; centre x⁻¹ω·x² = xω | holds |
| §2.4 weight change | k = 1, 2; trivial ζ | Δ_(2,ℒ) not étale; δ_2(p)² = p⁻¹ | det Δ = \|x\|, value p⁻¹; p²·p⁻¹ = p; rank two without rank-one sub is pure of slope v_p(det)/2 | holds |
| §3.1 Lie action | O(k); Ω¹ = O(2)⊗det; duals | a⁺ = u⁺∂+1−k; u⁻ = −∂²u⁺+k∂; dual: ∂u⁺, −∂u⁺, −∂²u⁺ | d/ds of e^(−ks)f(e^(−s)z) = −zf′−kf; (1−sz)^(−k)f(z/(1−sz)) gives z²f′+kzf; UD² − 2D = D²U with UD−DU = 1 | holds |
| §3.3 uniqueness and (iii) | A = diag(1,2); three lines | unique up to L^× only with the line condition | A fixes Le₁, Le₂, sends e₁+e₂ to e₁+2e₂; fixing a third line forces α = β | holds |
| §4.3 partial operator | d = 2, S = Le₁, Ae₁ = e₂ | Be₂ = −λ₁λ₂e₁+(λ₁+λ₂)e₂ | trace λ₁+λ₂, determinant 0·(λ₁+λ₂)+λ₁λ₂; all-positive column gives −λ₁λ₂ (CDN20 line 1186) | holds |
| §4.5 Galois multiplicities (sample) | V = L; V = E^∨, logχ extension | top row right-exact; H⁰, H¹ of C⊗E one-dimensional | δ(1) = [logχ] ≠ 0 and H²(C) = 0 give H¹ ≅ L; c = ℓe₂+ℓ²e₁/2 is a cocycle; CDN20 lines 822–853 | holds |
| §4.10 bounded duals (sample) | Π = St^cont, ℓ(f) = f′(0) | ℓ ∈ (Π^an)′ not G-bounded; (c) needs a central character | u⁺g⁻¹ = pᵐg⁻¹u⁺ gives gℓ = pᵐℓ; ‖F_m‖ ≤ p⁻ᵐ, \|ℓ(F_m)\| = pᵐ; CDN23 lines 2381–2386 | holds |
| §4.11 occurrence | V absolutely irreducible, dim ≥ 3 | Hom(V, H¹_ét[M]) = 0 for supercuspidal M | no two-dimensional quotient after any finite extension; CDN20 lines 1090–1095 state (i)–(ii) for every V | holds |
| §4.13 Banach multiplicities (sample) | Π = Π_(M,ℒ); twist χ(p) = 1+p | V_(M,ℒ)⊗JL(M); 0 off ΦNᵖ_n | kernel X⁺_st(M) ∩ (C⊗ℒ) = V_(M,ℒ), dimension 2·dim JL(M); p acts on JL(M) by (1+p)² ≠ 1; CDN23 lines 2465–2474 | holds |
| §4.14 Galois socle (sample, headline, C01) | dim ≥ 3; V = δ; n = 0 | 0; (St^cont⊗δ_G)*⊗δ_Ǧ; only special types at n = 0 | supercuspidal sectors by §4.11; special sector has Galois acting by a character, image of irreducible V of dim ≥ 2 is 0; centre δ⁻² against δ² | holds |
| §5.3 block multiplicities (sample) | m = O_L | m̌ compact torsion-free, not the Pontryagin dual | Hom(O_L, O_L) = O_L; Hom^cont(O_L, L/O_L) = L/O_L, not finitely generated; CDN23 lines 2743–2745 | holds |
| §5.4 evaluation | modulo p^k | lifting through one finite-K′ stage | finite length puts X_(j,K) in f(X_(j+1,K′)); projectivity lifts (CDN23 lines 2731–2741) | holds |
| §6.1 interpolated dual (sample) | fibre at x; ρ_x against ρ_x(ε) | fibre Π(ρ_x)*; residual twist by ε̄⁻¹ needed | central characters det ρ_x·ε⁻¹ and det ρ_x·ε, ratio ε² of infinite order; CDN23 lines 2606–2614 | holds |
| §6.3 rigidity (sample) | DVR with χ(p) = 1+p; A = L[T] | fails with one closed point; holds with infinitely many | (1+p)² ≠ 1 separates determinants; nonzero a ∈ A lies in finitely many 𝔪; non-isomorphic absolutely irreducibles have distinct traces in every characteristic | holds |
| §6.5 typed multiplicity (sample) | R_(B,M) = L | m_(B,M) ≅ m_B(Π(ρ_x)*)⊗ρ_x | Ř = L; CDN23 lines 2839–2845 give m(Π_x*)⊗ρ_x on the type locus, 0 off it | holds |
| §6.6 factorisation (sample, headline) | A = L⟨T⟩, x: T = 0 | 𝔪_x-torsion, not the fibre | Ǎ = bounded sequences, T = left shift, surjective, kernel L·ev₀; Ǎ/TǍ = 0; (P⊗Ǎ)[T] = P/TP for flat P | holds |
| §7.1 automorphy twist | g, g′ general | cocycle for (a−c∂)⁻ᵏ | a′(a−c∂)−c′(d∂−b) = (aa′+bc′)−(ca′+dc′)∂, the left column of gg′ | holds |
| §7.2 BGG row (sample, headline) | k = 0, 1; a = p | middle and preimage scalar a^k; twist det⁻¹ | a⁻ᵏ⁻²a²ᵏ⁺² = a^k; a⁻ᵏa²ᵏ = a^k; at k = 1: p⁻³p⁴ = p = p⁻¹p²; COLMEZ19POIDS line 321 prints k derivatives | holds |
| §7.3 Teitelbaum model | p = 2, 3 | genus p(p−1)/2; p−1 factors over ℚ_p² | 2g−2 = −2(p+1)+p(p+1): g = 1, 3; ζᵖ⁻¹ = −1 has order dividing 2(p−1), which divides p²−1 for p odd | holds |
| §7.5 primitivable functions | g = (α β; 0 δ); f = (1,−1) | Borel-stable; in H⁰_dR·O(Ω), not in O(Ω) | (d/dz)(f∘g⁻¹) = (δ/α)f′∘g⁻¹; primitives (z^j/j!, −z^j/j!); DLB17 line 447 prints O(Ω) | holds |
| §7.6 derived realisation (sample, headline) | r large | Hom of dimension 2 | complex ≃ H¹_dR^ρ[−1]; M*_dR⊗Hom_G((Π^an)′, π′) = L²; DLB17 lines 2815–2822 | holds |
| §7.7 boundary sheaf (sample) | U = ℙ¹(ℚ_p) | global sections strictly larger than O(Σ_r)^ρ | cokernel (Ω¹(Σ_r)^ρ)′ ≠ 0 by Serre duality; DLB17 lines 2861–2880, Conjecture 12.4 not asserted | holds |
| Declared gaps | four slugs | precise, minimal, in README and plan | three have the plan's sentence in the README; CompletedCohomologyAndLocalGlobalCompatibility §6.4 gives one form, base §4.9 and §6.9 do not give the fixed-radius step; the fourth is D01 | holds |

- Source locators checked against the cached texts this round: 44 (DLB17 14, CDN20 6, CDN23 16, COLMEZ19POIDS 5, DOSPINESCU12THESE 2, COLMEZ14LA 1), covering all 15 sampled targets; each has the stated number, hypotheses and statement. The README flags no locator as unverified.
- Library declarations opened at the pin: `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean:61), `NormedSpace.image_isVonNBounded_iff` (:495), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659, 679), `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean:164), `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87), `BDeRhamPlus`, `BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, 88), `Module.Basis` (Mathlib/LinearAlgebra/Basis/Defs.lean:89).
- Cross-roadmap citations: every cited section heading of the 16 suppliers resolves (11 roadmaps on main, 5 at their open heads). Contracts read against the supplier text this round: base §4.9 (its space is defined by the two conditions of §1.3, for p ≥ 5), base Scope (assigns §§3.1 and 3.3 here); ProetaleCohomologyOfPAdicCurvesAndTowers §§7.3–7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4 (p > 2); CompletedCohomologyAndLocalGlobalCompatibility §6.4; LocallyAnalyticDistributions §0.3.
- Automatic checks at this head: all passed. Dependency check, run here: `depcheck: 199 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line. The merge order places this roadmap directly after ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, its last supplier. Diff outside the folder: empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits with no messages. The file declares nothing, so the `#check @name` comparison and the one-tactic probe are empty. No headline is statable at the pins; the docstring names each (§§2.3–2.4, 3.1, 3.3, 4.12–4.14, 6.6, 7.2–7.6) with its missing carriers. §§4.3 and 6.3 are statable but are steps, not headlines.
- Pull-request text against the head: the title, summary block and prose agree with the head (a new roadmap, 25 corrections E1–E25, an empty `Suggested.lean`, vanishing in dimension at least three through the occurrence theorem at every prime).
- Ownership against open pull requests, searched by object across all open heads and main (P-finite vectors, Breuil–Strauch, primitivable functions, G-bounded vectors, weight change, Teitelbaum model, Galois socle): no second owner.

Overlap check: read ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicHodgeParametersInLocallyAnalyticRepresentations, PadicLocalLanglandsForGL2Qp, PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology. Shared objects and owners: multiplicity diagram and bounded vectors (ProetaleCohomologyOfPAdicCurvesAndTowers §§7.3–7.5), mod p finite length (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4), local Breuil–Strauch core and the compactly supported P-finite space for p ≥ 5 (base §§6.9 and 4.9). All are cited; nothing has two owners.

Source independence: 17 passages compared with 6 sources, none shares a run of words (the sources are in French; the two-sentence construction of §6.1 has the steps of CDN23 lines 2609–2611, which the formula forces); largest share DLB17, 122 of 266 source-id mentions; contents compared with DLB17 §§3–12: independent (Layer 1 draws on §§6–7, Layer 2 on §§8–9 with COLMEZ19POIDS, Layer 3 on §§3–5 and 11, Layer 7 on §12; the order of Layers 1–3 is forced by §2.1 *Needs* §1.7 and §3.1 *Needs* §§2.1, 2.3).

Research link: §§3.1–3.3 and 7.2–7.7 are the Breuil–Strauch comparison and its consequences of Dospinescu–Le Bras (2017); §4.14 and §6.6 are the main theorems of Colmez–Dospinescu–Nizioł (2020, 2023); §2.4 is Colmez's weight change (2019). Rests on the README's References and the cached texts DLB17, CDN20, CDN23, COLMEZ19POIDS.

## Not verifiable

- none

## Source issues

- **Error** in DLB17 at Proposition 7.7(b) (arXiv p. 38, line 1569): the source says the orthogonal of N⁺_dif,n(V̌) is t^k N⁺_dif,n(V) for weights 0 and k; it should be tN⁺_dif,n(V) for every k ≥ 1; affects a stated result.
- **Error** in DLB17 at Théorème 1.10 (arXiv p. 11, line 447): the source says infinitely primitivable functions on Σ_n lie in O(Ω); it should be H⁰_dR(Σ_n)·O(Ω), since component-wise constants are primitivable; affects a stated result.
- **Gap** in DLB17 at the proof of Théorème 1.10 (arXiv p. 66, lines 2797–2799): the source applies its Théorème 1.2 to every nontrivial type of D^×; it should treat one-dimensional types and nontrivial central characters separately; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9 (arXiv p. 11, lines 431–443): the source uses n for both the cover level and the cyclotomic level, and integrates over 1+p⁰ℤ_p at n = 0; it should use separate indices and integrate over Γ at level zero; affects nothing.
- **Error** in DLB17 at §1.1 (arXiv p. 3, lines 114–116): the source says Σ₀, defined over ℚ_p, is two copies of Ω; it should say it is connected over ℚ_p and splits only over ℚ_(p²); affects nothing.
- **Misprint** in CDN20 at the proof of Lemme 2.18 (p. 30, line 1186): the source completes the companion matrix with the symmetric functions all taken with positive sign; it should use the alternating signs of the coefficients of ∏(X−λ_i); affects the proof.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8 (HAL printed pp. 63–64, lines 2430 and 2471): the source states the condition as M of level ≤ n; on the p-central quotient it should be M ∈ ΦNᵖ_n, as its proof uses (line 2434); affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15 (HAL printed p. 68, line 2624): the source defines Ř_(B,M) as Hom(Ř_(B,M), L); it should be the continuous L-dual of R_(B,M), as Théorème 5.24 says; affects nothing.
- **Misprint** in CDN23 at the proof of Théorème 5.10 (HAL printed p. 66, lines 2549–2551): the source takes Π to be contained in Π(V); it should be a quotient, so that Π* embeds into the Hom; affects nothing.
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii) (p. 4, lines 161–166): the source prints the quotient of Π(Δ) as Π(M,−k); it should be Π(M,−k)⊗x^k, as its Théorème 0.6(iii) and the central characters show; affects nothing.
- **Misprint** in COLMEZ19POIDS in the paragraph before Conjecture 0.10 (p. 8, line 321): the source prints the operator O_n(−k)⊗x^(−1−k) → O_n(k+2) as the k-th derivative; it should be the (k+1)-st derivative; affects nothing.

## For the human reviewers

- Scope: §1.7's every-prime density and vanishing (README line 247) rest on DOSPINESCU12THESE, Théorème 8.4.3 and Remarque 8.4.4, a doctoral thesis read from the author's page; DLB17 (line 2800) cites the same theorem. No refereed statement was located.
