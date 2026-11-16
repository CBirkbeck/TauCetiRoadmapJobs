# Review of PadicLocalLanglandsForGL2QpPartII (pull request #2455 at 449123d)

**Verdict:** needs changes

## R01 (P3) — §1.3's stated difference from the base's compactly supported P-finite space is vacuous

**Location** `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/README.md` line 319 (§1.3), and the same clause at line 30: "Π_c^P-fin consists of the vectors of that section's compactly supported P-finite space, … that are killed by a power of some u(pⁿ)−1."

**Claim** The extra condition cuts nothing out. In every representation of P, finiteness under diag(ℤ_p^×,1) and the infinite-slope condition already imply P-finiteness. On the base §4.9's domain the two spaces are equal, so the clause names a difference that does not exist.

**Witness** With S_n = Σ_(i<pⁿ) u(i): u(pⁿ)−1 = (u(1)−1)·S_n. So S_n^k·diag(p^m,1)v = 0 gives (u(pⁿ)−1)^k·diag(p^m,1)v = 0, that is (u(pⁿ⁻ᵐ)−1)^k v = 0, hence (u(p^N)−1)^k v = 0 for N = max(1, n−m).

**Repair** At line 319 replace the sentence beginning "On the Banach objects with supersingular constituents" with: "On the Banach objects with supersingular constituents of the base roadmap §4.9, where p ≥ 5, Π_c^P-fin is that section's compactly supported P-finite space. Indeed, with S_n = Σ_(i<pⁿ) u(i), the infinite-slope condition S_n^k·diag(p^m,1)v = 0 gives (u(pⁿ)−1)^k·diag(p^m,1)v = 0, because u(pⁿ)−1 = (u(1)−1)·S_n; conjugating by diag(p^m,1) gives (u(pⁿ⁻ᵐ)−1)^k v = 0, hence (u(p^N)−1)^k v = 0 for N = max(1, n−m). So a vector of infinite slope with finite diag(ℤ_p^×,1)-orbit is P-finite." At line 30 replace "they are the vectors of that section's compactly supported P-finite space killed by a power of some u(pⁿ)−1" with "they are that section's compactly supported P-finite space (§1.3)". Tested on the trivial representation (S_n^k v = pⁿᵏv ≠ 0, both spaces 0) and on a one-shell Kirillov function (in both spaces).

## Previous findings

- R01 — not repaired: deferred (D01)

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| §1.1 sandwich | weights {0,1}; ℒ ≠ ℒ′ | D⁺ = tN⁺ + L_n[[t]]ℒ | Σt⁻ⁱFilⁱ with Fil⁻¹ = M_dR, Fil⁰ = ℒ gives it (DLB17 line 1605); N⁺/D⁺ = L_n⊗M_dR/ℒ, rank 1 | holds |
| §1.3 third API bullet | b = p⁻¹, m = 1, N = 2 | (Σ_(i<p^N)u(i))^k·diag(p^m,1)(1−u(b))^k v = 0 | S_N(1−u(1)) = 1−u(p^N); Σ_(i<p²) ζ_p^(iu) = p·0 = 0 for u ≢ 0 | holds |
| §1.3 against base §4.9 (R01) | any representation of P | subspace cut out by "(u(pⁿ)−1)^k v = 0" | u(pⁿ)−1 = (u(1)−1)S_n makes the condition automatic; spaces equal | finding R01 |
| §1.6 residue pairing | V = L; weights {0,2} | (N⁺(V̌))^⊥ = tN⁺(V) | res(fg·t⁻¹dt) = (fg)(0), orthogonal tL_∞[[t]]; te pairs to 0 and te ∉ t²N⁺ (DLB17 line 1569 prints t^k) | holds |
| §1.7 duality and converse | Ad(u(−x)) on gl₂; shell vector t⁻²e | u⁻u(x) = u(x)(u⁻−xh−x²u⁺); a⁺u(x) = u(x)(a⁺+xu⁺) | (1−xE₁₂)E₂₁(1+xE₁₂) = E₂₁−x(E₁₁−E₂₂)−x²E₁₂; (e^(tp^N)−1)t⁻²e ≡ p^N t⁻¹e ≠ 0 | holds |
| §1.7 density route | U = p⁻ⁿℤ_p | i_(0,n)(ℓ) = 0 means ℓ vanishes on p⁻ⁿℤ_p | Res_ℤ_p(diag(pⁿ,1)z) = 0 is restriction of z to p⁻ⁿℤ_p; these exhaust compact opens of ℚ_p | holds |
| §2.1 common dual | section supported on pℤ_p | Res_ℤ_p = 0 alone does not kill a section | Weyl transform supported on w(pℤ_p) = ℙ¹∖ℤ_p; DLB17 lines 1661–1663, 1690–1705, 1828–1831 | holds |
| §2.2 covariance | g = w; g = u(b); O(Ω) | w∂w = ∂⁻¹, wu⁺w = −∂²u⁺; u(b)∂u(b)⁻¹ = ∂−b | (0·∂−1)(0−∂)⁻¹ = ∂⁻¹; f ↦ z²f′ on both sides; Ad(g)E₁₂ = det⁻¹(−ac·h+a²E₁₂−c²E₂₁) = det⁻¹(a−c∂)²u⁺ | holds |
| §1.5 / §2.2 Casimir | (a,b) general; a⁺ = ∂u⁺ | ((a−b)²−1)/2; 0 on E_π | −2ab+k−1+(k−1)²/2 = (k²−4ab−1)/2; with A = u⁺∂: −A(A+1)−(A+1)²−(A+1)+2(A+1)² = 0 | holds |
| §2.3 irreducibility | k = 1 | Π(V)^an/π ≅ Π(M°,−1)⊗det | centre x⁻ᵏω·x²ᵏ = x^kω (COLMEZ19POIDS line 234 against line 163) | holds |
| §2.4 weight change | k = 0, 1, 2; ζ = 1 | Casimir (k²−1)/2; Δ_(2,ℒ) not étale | a⁺ = u⁺∂, u⁻ = −∂u⁺∂ give −A²−(A+1)²+(2A+1)²/2 = −1/2; det Δ_(2,ℒ)(p) = p²·p⁻¹ = p | holds |
| §3.1 Lie action on duals | Ω¹ = O(2)⊗det | a⁺ = ∂u⁺, a⁻ = −∂u⁺, u⁻ = −∂²u⁺ | on functions a⁺ = u⁺∂, a⁻ = −u⁺∂, u⁻ = −∂²u⁺+2∂; transposes with DU−UD = 1 give DU, −DU, −UD²−2D = −D²U | holds |
| §3.1(b) | H¹_dR(Σ_r)^ρ ≅ M*_dR⊗π′ | dimension 2 | M*_dR⊗End_G(π′) = L² | holds |
| §3.3 realisation | centre; A = diag(1,2) | (O[M])′_b ≅ Π^an/π; three lines needed | aI₂ acts on O[M] by ζ(a)⁻¹, on the dual by ζ(a); A fixes Le₁, Le₂, moves L(e₁+e₂) | holds |
| §4.2 Steinberg | μ = δ₀−δ_∞, u(pⁿ) | (St^cont)* not norm-continuous | δ_(pⁿ)−δ₀ pairs to 1 with the indicator of pⁿℤ_p^×, norm 1; tends to 0 on compacts | holds |
| §4.3 partial operator | d = 3, S = ⟨e₁,e₂⟩, Ae₁ = e₃, Ae₂ = e₁+e₃ | every monic cubic is reached | Be₃ = (x,y,z): characteristic polynomial X³−zX²−(x+y)X−y, three free coefficients | holds |
| §4.4 period multiplicities | V = L, L(1) | H_C sees the weight | H_C(L) = L⊗F; H_C(L(1)) = C(−1)^(G_F) = 0 | holds |
| §4.5 Galois multiplicities | V = E^∨, logχ extension | H⁰ and H¹ of C⊗E one-dimensional | long exact sequence: δ(1) = [logχ] ≠ 0, so H⁰ = Le₁, H¹ ≅ L; c = ℓe₂+ℓ²e₁/2 satisfies c(gh) = c(g)+g·c(h) | holds |
| §4.7 line extension | e ↦ ae | normalised quotient unchanged | dual generator a⁻¹e*; ℒ⁻¹⊗ℒ = L (CDN20 lines 929–933) | holds |
| §4.10(c) | Π = St^cont, ℓ(f) = f′(0) | ℓ not G-bounded | diag(pᵐ,1)ℓ = pᵐℓ; ‖F_m‖ ≤ p⁻ᵐ and \|ℓ(F_m)\| = pᵐ | holds |
| §§4.12–4.13 Banach multiplicities | Π = Π_(M,ℒ) | ℒ⊗JL(M); V_(M,ℒ)⊗JL(M) | dimensions dim JL(M) and 2·dim JL(M); kernel X⁺_st(M) ∩ (C⊗ℒ) = V_(M,ℒ) | holds |
| §4.14 Galois socle | n = 0; special M; dim V ≥ 3 | (St^cont⊗δ_G)*⊗δ_Ǧ; Π(V)*⊗JL(M); 0 | Ǧ/p^ℤO_D^× = ℤ/2 gives Sp, Sp⊗δ₋; centre on (St^cont⊗δ_G)* is δ⁻² = δ_M of §5.6; CDN23 lines 2357–2365, 2541–2543 | holds |
| §5.6 central character | M = Sp⊗δ; n = 0, n′ = 1 | δ_M = δ⁻²; averaging order p²−1 | centre of δ∘Nrd is δ²; 3 at p = 2, 8 at p = 3 | holds |
| §6.3 rigidity | DVR, ρ against ρ⊗χ, χ(p) = 1+p | infinitely many maximal ideals needed | same reduction; determinant ratio (1+p)² ≠ 1; saturation gives rank H ≤ 1 | holds |
| §6.5 typed multiplicity | R_(B,M) = L | m_(B,M) ≅ m_B(Π(ρ_x)*)⊗ρ_x | Ř = L; CDN23 line 2782 gives Ř as the L-dual of R | holds |
| §6.6 factorisation | A = L⟨T⟩, x: T = 0 | torsion, not fibre | Ǎ = bounded sequences, T the left shift: surjective, kernel L·ev₀; Ǎ/TǍ = 0 | holds |
| §7.1 automorphy twist | g, g′ general | cocycle for (a−c∂)⁻ᵏ | a′(a−cz)−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z; dual of the k-twist: d+c(d∂−b)(a−c∂)⁻¹ = det g·(a−c∂)⁻¹ | holds |
| §7.2 BGG row | k = 1, a = p; general s | middle and preimage scalar p | p⁻³p⁴ = p; p⁻¹p² = p; O(s)[M]: a⁻ˢζ⁻¹ = (aˢ⁻²ζ)⁻¹a⁻² | holds |
| §7.3 Teitelbaum model | p = 2, 3 | genus p(p−1)/2 | 2g−2 = −2(p+1)+p(p+1): g = 1, 3; ζᵖ⁻¹ = −1 lies in ℚ_p² since 2(p−1) divides p²−1 for p odd | holds |
| §7.4 Iwasawa invariants | p = 2, m = 1; m = 0 | Γ₁ = Γ; level zero is Γ | 1+2ℤ₂ = ℤ₂^×; 1+p⁰ℤ_p = ℤ_p ⊄ Γ (DLB17 lines 431–443 print n ≥ 0) | holds |
| §7.5 primitivable functions | g = (α β; 0 δ); f = (1,−1) over ℚ_p² | Borel-stable; f ∈ H⁰_dR·O(Ω) ∖ O(Ω) | (d/dz)∘g = (δ/α)·g∘(d/dz); primitives (z^j/j!, −z^j/j!); 1/z has residue 1 on \|p\| < \|z\| < 1 | holds |
| §7.6 derived realisation | r large | Hom of dimension 2 | complex ≃ H¹_dR^ρ[−1]; M*_dR⊗Hom((Π^an)′, π′) = L² | holds |
| Declared gaps | four slugs | precise, minimal, in README and plan | three have the plan's sentence in the README; base §6.9, R16.2.10 (complex only), §6.4 (one form) do not provide them; the fourth is D01 | holds |

- Source locators checked against the cached texts this round: 42 (DLB17 17, CDN20 9, CDN23 8, COLMEZ19POIDS 4, DOSPINESCU12THESE 3, COLMEZ14LA 1), covering all 15 seeded targets; each has the stated number, hypotheses and statement. The README flags no locator as unverified.
- Library declarations opened at the pin: `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean:61), `NormedSpace.image_isVonNBounded_iff` (:495), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659, 679), `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean:164), `HasDerivedCategory` and `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74, 87), `BDeRhamPlus`, `BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, 88). No Robba ring, Drinfeld half-plane, Banach or locally analytic representation, Iwasawa cohomology or Bloch–Kato exponential exists in either pinned library; Tau Ceti's `TauCeti.LocallyAnalytic` is functions on ℤ_p only.
- Cross-roadmap citations: all 94 cited sections of the 16 suppliers resolve (4 roadmaps on main, 12 at their open heads). Contracts read against the supplier text: base §§2.5, 4.9, 5.8, 6.9 scope line; ProetaleCohomologyOfPAdicCurvesAndTowers §§7.2–7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; LocallyAnalyticRepresentationsOfLocalGroups §0.8; LocallyAnalyticDistributions §0.3; CompletedCohomologyAndLocalGlobalCompatibility §6.4; GL2AutomorphicRepresentationsAndTransfer R16.2.10; HilbertModularVarietiesAndShimuraCurves R18.3.29(c), R18.4.25, R18.5.21; TropicalAndBerkovichArithmetic §2.17; PadicHodgeTheory §4.4.
- Gate at 449123d, run here: every check 0, OK. Dependency check: `depcheck: 261 roadmaps, 2526 edges, 0 problem(s)`; no UPWARD or CYCLE line. Diff outside the folder: empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file declares nothing, so the `#check @name` comparison and the one-tactic probe are empty. No headline is statable at the pins, and the docstring names each one (§§2.3–2.4, 3.1, 3.3, 4.12–4.14, 6.6, 7.2–7.6) with its missing carriers; §§4.3 and 6.3 are statable but are steps, not headlines.
- Pull-request text against the head: title, summary block and prose agree with the head (a new roadmap, 25 corrections E1–E25, an empty `Suggested.lean`, density only for non-trianguline V).
- Overlap check: read ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicHodgeParametersInLocallyAnalyticRepresentations, PadicLocalLanglandsForGL2Qp, PhiGammaModulesAndIwasawaCohomology, LocallyAnalyticDistributions. Shared objects and owners: multiplicity diagram and bounded vectors (ProetaleCohomologyOfPAdicCurvesAndTowers §§7.3–7.5), mod p finite length (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4), local Breuil–Strauch core (base §6.9), compactly supported P-finite space on supersingular objects for p ≥ 5 (base §4.9; R01). All are cited; nothing has two owners. Ownership against the open pull requests was searched by object (P-finite vectors, Kirillov model, weight change, Teitelbaum model, primitivable functions, G-bounded vectors, homographic covariance, CDN23 factorisation): no second owner.
- Source independence: 19 passages compared with 6 sources, none shares a run of words (§1.7's converse route has the six steps of DLB17 lines 1619–1642 in the order the argument forces, with four justifications the source omits); largest share DLB17, 122 of 266 source-id mentions; contents compared with DLB17 §§3–12: independent (Layer 1 draws on §§6–7, Layer 2 on §§8–9 with COLMEZ19POIDS, Layer 3 on §§3–5 and 11, Layer 7 on §12; the order of Layers 1–3 is forced by §2.1 *Needs* §1.7 and §3.1 *Needs* §§2.1, 2.3).

## Not verifiable

- none

## Source issues

- **Error** in DLB17 at Théorème 1.10 (arXiv p. 11, line 447): the source says infinitely primitivable functions on Σ_n lie in O(Ω); it should be H⁰_dR(Σ_n)·O(Ω), since component-wise constants are primitivable; affects a stated result.
- **Gap** in DLB17 at the proof of Théorème 1.10 (arXiv p. 66, lines 2797–2799): the source applies its Théorème 1.2 to every nontrivial type of D^×; it should treat one-dimensional types and nontrivial central characters separately; affects the proof.
- **Error** in DLB17 at Proposition 7.7(b) (arXiv p. 38, line 1569): the source says the orthogonal of N⁺_dif,n(V̌) is t^k N⁺_dif,n(V) for weights 0 and k; it should be tN⁺_dif,n(V) for every k ≥ 1; affects a stated result.
- **Gap** in DLB17 at Proposition 11.10 (arXiv p. 64, lines 2704–2705): the source says infinite t-divisibility in the Robba module forces z₁ = 0; it should prove this inside one lattice of fixed radius on both charts; affects the proof.
- **Gap** in DLB17 at Remarque 11.13 (arXiv p. 66, lines 2773–2781): the source says two lines and linearity in Ext¹ give BS(ℒ) = Π^an_ℒ; two lines fix the comparison only up to a diagonal matrix, so three lines are needed; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9 (arXiv p. 11, lines 431–443): the source uses n for both the cover level and the cyclotomic level, and integrates over 1+p⁰ℤ_p at n = 0; it should use separate indices and integrate over Γ at level zero; affects nothing.
- **Error** in DLB17 at §1.1 (arXiv p. 3, lines 114–116): the source says Σ₀, defined over ℚ_p, is two copies of Ω; it should say it is connected over ℚ_p and splits only over ℚ_(p²); affects nothing.
- **Misprint** in CDN20 at the proof of Proposition 2.5(ii) (p. 22, lines 874–876): the source says the Hom has dimension 0 or 1 according as D_pst(V*) is or is not isomorphic to M[−1]*; it should be the reverse; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8 (HAL pp. 63–64, lines 2430 and 2471): the source states the condition as M of level ≤ n; on the p-central quotient it should be M ∈ ΦNᵖ_n, as its proof uses (line 2434); affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15 (HAL p. 68, line 2624): the source defines Ř_(B,M) as Hom(Ř_(B,M), L); it should be the continuous L-dual of R_(B,M), as Théorème 5.24 says; affects nothing.
- **Misprint** in CDN23 at the proof of Théorème 5.10 (HAL p. 66, lines 2549–2551): the source takes Π to be contained in Π(V); it should be a quotient, so that Π* embeds into the Hom; affects nothing.
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii) (p. 4, lines 161–166): the source prints the quotient of Π(Δ) as Π(M,−k); it should be Π(M,−k)⊗x^k, as its Théorème 0.6(iii) and the central characters show; affects nothing.
- **Misprint** in COLMEZ19POIDS in the paragraph before Conjecture 0.10 (p. 8, line 321): the source prints the operator O_n(−k)⊗x^(−1−k) → O_n(k+2) as the k-th derivative; it should be the (k+1)-st derivative; affects nothing.

## For the human reviewers

- §1.7's every-prime density and vanishing (README line 401) rest on DOSPINESCU12THESE, Théorème 8.4.3 and Remarque 8.4.4, a doctoral thesis read from the author's page; DLB17 (line 2800) cites the same thesis theorem. No refereed statement was located.
