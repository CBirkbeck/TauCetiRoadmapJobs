<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6901834878 -->
Review (claude) of 8cce753

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The module docstring states the Galois-socle theorem without the condition M ∈ ΦNᵖ_n

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean:13–15`: "is `Π(V)* ⊗ JL(M)` when `V ≅ V_{M,ℒ}` for a supercuspidal type `M`, `(St^cont ⊗ δ)* ⊗ δ∘Nrd` for a character `δ` of Steinberg type, and `0` otherwise". Also `Suggested.lean:27` ("the finite sum over types `M`") and `README.md:5` ("the multiplicity of V_(M,ℒ) in H¹_ét is Π(V_(M,ℒ))*⊗JL(M)").

   **Claim.** The multiplicity in `H¹_ét(M^p_{n,C}, L(1))` is `Π(V)* ⊗ JL(M)` for every supercuspidal M, and 0 only outside the two listed families.

   **Witness.** `README.md:848` (§4.14, Checks): "The unramified twist with χ(p) = 1+p of §0.1 gives V ≅ V_(M,ℒ) with M ∉ ΦNᵖ. Its multiplicity on M^p_n is 0". The same holds for M of level above n. The README statement (`README.md:833`) has "M ∈ ΦNᵖ_n"; the docstring does not.

   **Exact repair.**

   - `Suggested.lean:13–15`: write "is `Π(V)* ⊗ JL(M)` when `V ≅ V_{M,ℒ}` for a supercuspidal `M` in `ΦNᵖ_n` (`JL(M)` is trivial on `p` and on the level subgroup `K_D(n)`), `(St^cont ⊗ δ∘det)* ⊗ δ∘Nrd` when `V = δ` is a character with `Sp ⊗ δ` in `ΦNᵖ_n`, and `0` otherwise, in particular `0` when `dim V ≥ 3`."
   - `Suggested.lean:27`: write "is the finite sum over the types `M` in `ΦNᵖ_n` of the completed sums over blocks".
   - `README.md:5`: write "the Galois-socle theorem: for a supercuspidal type M of level at most n on which p acts trivially, the multiplicity of V_(M,ℒ) in H¹_ét(M^p_(n,C), L(1)) is Π(V_(M,ℒ))*⊗JL(M), …" (the rest of the bullet unchanged).

   **Repair tested.** The twist with χ(p) = 1+p has JL(M)(p) = (1+p)² ≠ 1, so M ∉ ΦNᵖ_n and the repaired text gives 0, as `README.md:848` does. A scratch copy of `Suggested.lean` with the two docstring changes elaborates with exit 0 and no output.

2. **F02** (P2) §4.9: the two Hochschild–Serre sequences do not have the same H⁰

   **Location.** `README.md:746`: "the Hochschild–Serre sequences 0 → H¹(p^ℤ, H⁰(M_(n,C))) → H¹(M^p_(n,C)) → H¹(M_(n,C))^(p^ℤ) → 0 for étale and for pro-étale cohomology share their first term, H⁰ being in both cases the locally constant functions on π₀."

   **Claim.** H⁰_ét(M_(n,C), L(1)) and H⁰_proét(M_(n,C), L(1)) are the same space.

   **Witness.** M_(0,C) has one component for each height h ∈ ℤ (`README.md:208`). The function with value p^(−|h|) on height h lies in H⁰_proét = ∏_h L, not in H⁰_ét = L⊗∏_h O_L (the convention of `README.md:752`). Both H¹(p^ℤ, −) vanish.

   **Exact repair.** Replace the text of `README.md:746` from "and the Hochschild–Serre sequences" to "the difference lies in the common first term." by:

   "and for étale and for pro-étale cohomology the Hochschild–Serre sequence is 0 → H¹(p^ℤ, H⁰(M_(n,C))) → H¹(M^p_(n,C)) → H¹(M_(n,C))^(p^ℤ) → 0. Its first term vanishes in both cases. H⁰ is the space of locally constant functions on M_(n,C) for pro-étale cohomology and the subspace of bounded ones for étale cohomology, the rational étale group being L⊗lim_k; the two differ, since π₀(M_(n,C)) is infinite. But p^ℤ acts freely on π₀(M_(n,C)), p translating the height by 2, so the equation f∘p − f = a is solved orbit by orbit by finite sums of values of a, which are bounded when a is (the computation of §0.2, Checks). So H¹(M^p_(n,C)) = H¹(M_(n,C))^(p^ℤ) for both cohomologies. Injectivity on M^p_(n,C) follows from that on M_(n,C), and a G-bounded pro-étale class of M^p_(n,C) is a p^ℤ-invariant G-bounded, hence étale, class of M_(n,C), that is, an étale class of M^p_(n,C)."

   Add to the Checks of §4.9: "On M_(0,C) the function with value p^(−|h|) on the component of height h is locally constant and unbounded: it lies in H⁰_proét(M_(0,C), L) = ∏_h L and not in H⁰_ét(M_(0,C), L) = L⊗∏_h O_L. The two Hochschild–Serre sequences do not have the same H⁰; they share the vanishing of H¹(p^ℤ, H⁰)."

   **Repair tested.** On M_(0,C): f_(h+2) − f_h = a_h with f_0 = f_1 = 0 gives f_h as a finite signed sum of the a_j, so |f_h| ≤ sup|a_j|: the cokernel of T−1 is 0 on ∏_h L and on the bounded functions. A p^ℤ-invariant class that is étale on M_(n,C) is invariant there, the map to pro-étale cohomology being injective and equivariant.

3. **F03** (P3) Four route sentences say that the route follows a source

   **Location.** `README.md:454` "The route follows Colmez: twist the action …"; `README.md:485` "The route for local analyticity follows DLB17 §3.3 (lines 665–749)."; `README.md:503` "The route for (a) follows DLB17 §5.3 (lines 1184–1209):"; `README.md:511` "The route for (b) follows DLB17 §4.2 (lines 916–996):".

   **Claim.** The README never says it follows a source; sources appear as locators.

   **Witness.** The four sentences above. Their content is the roadmap's own (the routes add the p-valuation, the twist removal and the smooth-category reciprocity that the sources lack); only the wording presents them as a source's.

   **Exact repair.** Write, in order: "The route (COLMEZ19POIDS lines 244–260): twist the action …", dropping the later repetition of that locator in the sentence; "The route for local analyticity (DLB17 §3.3, lines 665–749): M^p_n is Stein, …"; "The route for (a) (DLB17 §5.3, lines 1184–1209):"; "The route for (b) (DLB17 §4.2, lines 916–996):".

   **Repair tested.** After the change no line of the README matches "follows DLB17" or "route follows"; the locators are kept.

4. **F04** (P3) A page citation of CDN23 that the manifest says is not made

   **Location.** `README.md:1062`: "(CDN23, Théorème 5.24(i) and its proof, lines 2779–2836, printed pp. 72–74)"; `sources.toml`, CDN23 `version_note`: "page numbers differ and are not cited".

   **Claim.** CDN23 is cited by theorem numbers and lines of the HAL copy only.

   **Witness.** The one page citation of the README is `README.md:1062`. Pages 72–74 are those of the HAL copy (CDN23 lines 2754 and 2829 carry its running heads), not of the published article.

   **Exact repair.** Delete ", printed pp. 72–74" in `README.md:1062`.

   **Repair tested.** A search of the README for "p." or "pp." followed by a number then finds nothing; the manifest note holds.

5. **F05** (P3) §1.1: the line range does not contain Exemple 6.5

   **Location.** `README.md:268`: "(DLB17, Exemple 6.5 and Exemple 6.6 with Définition 6.7, lines 1335–1345)".

   **Claim.** Lines 1335–1345 contain the three items.

   **Witness.** DLB17 line 1288 is the head of Exemple 6.5, and lines 1294–1299 carry the two descriptions of D⁺_dif,n and N⁺_dif,n that §1.1 uses; lines 1335–1345 are Exemple 6.6 and Définition 6.7 only.

   **Exact repair.** Write "(DLB17, Exemple 6.5, lines 1288–1299, and Exemple 6.6 with Définition 6.7, lines 1335–1345)".

   **Repair tested.** DLB17 line 1296 has the Fil⁰ description of D⁺_dif,n and line 1299 has N⁺_dif,n = L_n[[t]]⊗D_dR(V); line 1338 is Définition 6.7.

6. **F06** (P3) Layer 4 *Dependencies* lists a supplier section that no Layer 4 target uses

   **Location.** `README.md:864`: "ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9 and 7.1–7.5".

   **Claim.** The layer's dependency line is the union of its *Needs* lines.

   **Witness.** The *Needs* lines of Layer 4 cite that roadmap at `README.md:612` (§7.5), `:633` (§§0.3, 0.4, 6.2, 6.5, 6.9) and `:754` (§§7.1–7.3). None cites §7.4; it enters through §3.3 (Layer 3), which the line already names.

   **Exact repair.** Write "§§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.3 and 7.5".

   **Repair tested.** A mechanical comparison of each layer's *Dependencies* with the union of its *Needs* lines then shows no difference in any of the eight layers.

Six findings: two P2 and four P3. The seven findings of round 7 are repaired, and the repaired passages hold under the adversarial pass. What remains is small: the module docstring (and the Summary) state the Galois-socle theorem without the condition that the README's own Check shows is needed; one route sentence of §4.9 asserts an equality of H⁰ groups that is false, although the step it supports holds; and four bookkeeping points. None needs replanning.

## Previous findings checked first

| Round 7 finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) route of §6.3 | `README.md:1042–1049`: four steps "(Saturation.) … (Generic absolute irreducibility.) … (Traces.) … (Integral isomorphism.)", then the E-variant "replace A[G_ℚ_p] by E[G_ℚ_p] throughout". | **Repaired.** No sentence of CDN23 lines 2581–2593 is rendered; every step recomputed (table). |
| F02 (P2) bounded-vector injection | `README.md:114`: "Its integral form: passing to G-bounded vectors gives an injection H¹_ét(M_∞, L(1))[M] → X⁺_st(M)⊗̂_L (LL(M)^∧)*"; `:1064`: "The integral form of ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 therefore places H¹_ét[M] inside …". | **Repaired.** The supplier's §7.5 at its head states that injection. |
| F03 (P3) contracts | `README.md:76` (§1.7), `:79` (§§4.1–4.2), `:1123` (Layer 6), `:37` ("§§0.0, 0.2 and 0.3"). | **Repaired**; the same pattern remains once in Layer 4 (R06). |
| F04 (P3) Colmez misprint | `README.md:1273` (E22) and `:1147` "(Remarque 0.11(i), with source correction E22)". | **Repaired.** COLMEZ19POIDS lines 321 and 333 read as E22 says. |
| F05 (P3) first Check of §6.3 | `README.md:1053`: "χ be the unramified character with χ(p) = 1+p … different determinants, since χ(p)² = (1+p)² ≠ 1". | **Repaired.** |
| F06 (P3) symbol Π(V) | `README.md:842`: "the strong dual Π_n(V) of Hom_(W_ℚ_p)(V, H¹_ét(M^p_(n,C), L(1)))". | **Repaired**, with the quotient in place of the subrepresentation (E24). |
| F07 (P3) comparison with Π^univ | `README.md:1002`: "the κ(x)-valued point y … defined by ρ_y = ρ_x⊗ε⁻¹ has fibre Π(ρ_y(ε)) = Π(ρ_x)". | **Repaired.** The base §5.8 at its head gives the fibre Π(ρ_x(ε)) and the central character det(ρ^univ)ε. |

Repaired patterns searched in the rest of the package: a route rendering its source sentence by sentence (none found; R03 is wording only); a supplier cited for other than what its head states (none); dependency lines against *Needs* lines (R06); a silent correction of a source (none: every correction met is in E1–E24).

## Verified sound

### Coverage, principles, shape

All 1283 lines of the README were read, with every *Needs* line. Eight layers named by their mathematics, each with Examples and Dependencies; the Summary says where the base roadmap stops; the base roadmap's own text names this roadmap as the owner of the discharge of its §6.9 hypotheses, so nothing is planned twice. No algorithm, `set_option`, sorry'd data, pull-request number, date, HTML anchor, machine path or LaTeX delimiter in the README, the Lean file or the manifest. Every definition met has its API and at least three Checks. No maintainer notes were given. No suspicious instruction was met in any text read.

### Seeded source sample

No locator is flagged unverified by the author. The five manifest texts were read from the cache; nothing was fetched and the manifest is unchanged.

| Target | Text opened | Checked |
|---|---|---|
| 0.3 | CDN20 lines 809–812, 879–885, 889–914 | M_dR, X⁺_st(M) with φ = p, the kernel defining V_(M,ℒ), weights 0 and 1, D_pst = M[−1]; Remarque 2.6 for F = ℚ_p; Lemme 2.7; Remarque 2.8. |
| 1.6 | DLB17 lines 1550–1569 | the pairing, the trace and the factor p⁻ⁿ; Proposition 7.7(a); 7.7(b) is E4. |
| 1.7 | DLB17 lines 1572–1586, 1593–1618, 2633 | i_(j,n), the shell sum, Proposition 7.9, Théorème 7.11, the unipotent-fixed remark. |
| 3.1 | DLB17 lines 641–664, 665–749, 759–787, 804–807, 943–946, 981, 999–1009, 1063–1074, 1119–1120, 1184–1209, 1864 | Théorème 3.2, Lemme 3.5(a)–(c), Proposition 3.6, Théorèmes 4.1, 5.1, 5.4, 5.5, 5.7, 8.8, footnote 29. |
| 4.5 | CDN20 lines 822–854; CDN23 lines 2411–2416 | the diagram of Proposition 2.4 and its proof; Lemme 5.5 for any group and a Banach space with trivial action. |
| 4.7 | CDN20 lines 917–963 | W′, ℒ⁻¹ = M*_dR/ℒ^⊥, W; Proposition 2.9 proved by citing DLB17; Proposition 2.10. |
| 4.8 | CDN20 lines 1012–1019; CDN23 lines 2378–2380 | bounded sets, the Banach and Fréchet criteria with a bound for each seminorm, G-bounded vectors. |
| 4.9 | CDN20 lines 1020–1030, 2247–2252; CDN23 lines 2420–2422, 2791–2793, footnote 31 (2825) | Proposition 2.12 at full level, Remarque A.2, Proposition 5.6, the vanishing of bounded functions. The route is R02. |
| 4.13 | CDN23 lines 2401–2408, 2465–2500 | Lemme 5.4 (nuclear Fréchet E), Théorème 5.8, Lemme 5.9 with density and the Schneider–Teitelbaum extension. |
| 5.2 | CDN23 lines 2649–2664, 2673–2715 | the factorisation of the reduction, Corollaire 5.17, Proposition 5.19, Remarque 5.20. |
| 5.4 | CDN23 lines 2716–2745 | Proposition 5.21, compactness of P_B, the lifting step, m_(n,B) and its dual. |
| 6.1 | CDN23 lines 2606–2614, footnote 7 (181) | the lattice in the dual, the limit, the two other descriptions, the fibre property. |
| 6.3 | CDN23 lines 2574–2595 | statement; the proof is not followed (E23). |
| 7.1 | DLB17 lines 2718–2720; COLMEZ19POIDS lines 310–321 | the twist by (a−c∂)⁻ᵏ; Colmez's right-action form. |
| 7.3 | TEI90 lines 177–179, 228–259, 298–302; DLB17 lines 2731–2781 | Theorem 5, the curve y^(p+1) = z−z^p, p−1 components, the equation with p, Theorem 8; K; two lines only in the source (E10). |

Further locators opened: DLB17 lines 104–116, 152–159, 189, 232, 410, 434, 447, 1250, 1259, 1288–1299, 1335–1345, 1460, 1473, 1500, 1522–1535, 1661, 1690, 1768, 1828, 1946, 1967, 1980, 2005, 2192, 2432, 2449, 2469, 2486, 2524, 2685, 2711–2716, 2785, 2810, 2819, 2823, 2861, 2876; CDN20 lines 130, 268, 323, 346, 650, 659, 678, 749, 762, 859–878, 1078, 1090, 1108, 1171, 1186, 1761, 1874; CDN23 lines 93, 121–125, 178–184, 2339–2371, 2424–2464, 2536–2557, 2620–2646, 2746–2756, 2779–2851, 2861; COLMEZ19POIDS lines 153, 161, 177–179, 205, 215, 234, 237, 244, 262–265, 328–340. Each carries the theorem the README names, except the range of R05.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.3 V_(M,ℒ) | Dimensions; ℚ_p(1); admissibility | X⁺_st(M) of Dimension (1,2), C⊗(M_dR/ℒ) of (1,0), kernel (0,2); φ on D_cris(ℚ_p(1)) is p⁻¹, shift [1] gives 1; t_N(M[−1]) = 1−2 = −1 = t_H for jumps −1, 0 | holds |
| §1.6 orthogonal | V = L; weights {0,2} | N⁺(V̌) = L_∞[[t]]t⁻¹dt; residue of fg·t⁻¹dt is the constant term, orthogonal tL_∞[[t]]; te pairs to 0 with N⁺(V̌) and te ∉ t²N⁺ | holds |
| §1.7 unipotent-fixed | bx ∈ ℤ_p∖0; bx = p⁻¹; p = 2 | e^(tbx)−1 = tbx·unit gives tφ(x) = 0; then (ζ_p−1)φ(x) = 0; ζ₂−1 = −2 invertible in L | holds |
| §1.4 action (used by §1.7) | g₁g₂; σ_c | ε((a₁b₂+b₁)x)e^(t(a₁b₂+b₁)x)φ(a₁a₂x) on both sides; σ_c(ε(bx)e^(tbx)) = ε(cbx)e^(tcbx) | left action, Γ-equivariant |
| §3.1 Lie action | O; O(k); duals; Ω¹ = O(2)⊗det | a⁺+a⁻ = −k on O(k); on O′: a⁺ = ∂u⁺−1; on (Ω¹)′: a⁺ = ∂u⁺, a⁻ = −∂u⁺, u⁻ = −u⁺∂²−2∂ = −∂²u⁺; g(f dz) = det(g)(a−cz)⁻²(gf)dz | holds (headline) |
| §3.1 Checks | f = (1,−1); u(p⁻¹) | diag(p,1)f = −f; p·u(p⁻¹) = (p 1; 0 p) has elementary divisors 1, p²: distance 2 | holds |
| §3.3 (headline) | A = diag(1,2); A fixing Le₁, Le₂, L(e₁+e₂) | L(e₁+e₂) ↦ L(e₁+2e₂); A = diag(α,β) with α = β | holds |
| §2.3–2.4 (headlines) | k = 1; k = 2, trivial central character | centre of Π(M,−1)⊗det: x⁻²·x² = 1; det Δ_(2,ℒ)(p) = p²·p⁻¹ = p, twist δ_2(p)² = p⁻¹ gives 1 | holds |
| §4.5 | V = L; E with ge₂ = e₂+logχ(g)e₁ | H¹(G_ℚ_p, C) = L·logχ; H⁰(C⊗E) = Le₁; c(g) = ℓe₂+ℓ²e₁/2 satisfies c(gh) = c(g)+gc(h) | holds |
| §4.7 | ℒ ≠ ℒ′; e ↦ ae | W′_ℒ ∩ W′_ℒ′ is the preimage of 0, that is d(O[M]^(G_ℚ_p)); a·a⁻¹ = 1 | holds |
| §4.8 | trivial action; character p^(v(det g)) on L; seminorms i·p_i | orbit a point; \|pⁿx\| unbounded as n → −∞; bounds i depend on i | holds |
| §4.9 | z on Ω; H⁰ on M_(0,C) | u(b)z = z−b unbounded in b; f(h) = p^(−\|h\|) in ∏_h L, not in L⊗∏_h O_L; coker(T−1) = 0 on both | target holds; route is R02 |
| §4.12–4.13 (headlines) | Π = Π_(M,ℒ); the twist χ(p) = 1+p | sequences for ℒ and ℒ′ bound the dimension by 1; kernel X⁺_st(M) ∩ (C⊗ℒ) = V_(M,ℒ), of dimension 2; (1+p)² ≠ 1 gives 0 | holds |
| §4.14 (headline) | dim V = 3; non-split Π₁ ⊂ Π_n(V) ↠ Π₂; twist | constituents of dimension ≤ 2, no embedding of V; only Π₂* embeds in the dual; M ∉ ΦNᵖ gives 0 | README holds; docstring is R01 |
| §5.2 | L = ℚ_p(√p), k = 1; p·X | O_L/p = O_L/ϖ² of length 2; x ∉ pX has px ∈ pX | holds |
| §5.4 | p = 5, n = 0 | g(μ,μ) = (gμ,gμ) in both parities; diag(5,1)(μ,0) = (0,μ) for μ = δ₀−δ_∞ | holds |
| §6.1 | central characters; residual | det(ρ_x)ε against det(ρ_x)ε⁻¹, ratio ε²(1+p) = (1+p)² ≠ 1; ρ_y = ρ_x⊗ε⁻¹ reduces to ρ̄_B⊗ε̄⁻¹ | holds |
| §6.3 | A = L[T], V = W; rank one; DVR, χ(p) = 1+p; p = 2; characteristic p | H = A·id; ratio−1 ∈ ∩𝔪 = 0; determinants differ by 9 at p = 2 and 16 at p = 3; ρ⊗χ₀ ≅ ρ for ρ induced from G_(ℚ_4); a rank-one idempotent has trace 1 on V and 0 on W, so the trace step needs no division | holds |
| §6.4 | ℤ_p/p^k; c-Ind k_L; p = 3 and p ≥ 5 | length k, limit of infinite length; free over k_L[T]; base §5.6(iii): R^ps modulo torsion at p = 3, isomorphism for p ≥ 5 | holds |
| §6.6 (headline) | A = L⟨T⟩ at T = 0 | Ǎ = bounded sequences, T the left shift: Ǎ/TǍ = 0, Ǎ[T] = L·ev₀ | holds |
| §6.2 | p = 7, χ of order 3 | aI₂ on (St^cont⊗η_Gχ_G)*: η(a²)⁻¹ζ₃⁻² = η(a²)⁻¹ζ₃, the scalar of (St^cont⊗η_G)*⊗χ_G⁻¹ | holds |
| §7.1 | g, g′ | (a−cz)a′−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z, the left column of gg′ | holds |
| §7.2 (headline) | k = 1, a = p; Bol | middle term p⁻³p⁴ = p, preimage p⁻¹p² = p; d^(k+1)/dz^(k+1) intertwines weights −k and k+2, at k = 0 it is d/dz | holds |
| §7.3 | p = 2, 3; smoothness | ∏(Y−ζW) over ζ^(p−1) = −1 is Y^(p−1)+W^(p−1); ζ ∈ ℚ_p² since 2(p−1) divides p²−1 for odd p and ζ = −1 at p = 2; ∂/∂z of ζ(z−z^p) is ζ modulo p | holds |
| §7.4 (headline) | trivial representation | H¹_e = 0, H¹_f of dimension 1 | holds |
| §7.5 (headline) | f = (1,−1) over ℚ_p² | primitives (z^j/j!, −z^j/j!), not in O(Ω) | holds |
| §7.6 (headline) | line ℒ | total dimension 2, the F⁰ part a line by §4.12 | holds |
| Contract, CompletedCohomology §6.3 | WD induced from ℚ_p² by θ | θ on units equal to ψ∘N makes the induction reducible; so irreducible WD is not crystabelline, and reducible WD with N = 0 is | "equivalently" holds |
| Sections without rows in round 7 | §0.1: p = 2, 3; §1.1: jumps; §1.2; §4.6: [F:ℚ_p] = 2; §5.5; §5.6 | orders 3 and 8; Σ t⁻ⁱFilⁱ = tN⁺+L_n[[t]]ℒ; (∇−1)(tx) = t²∂x; weights (0,0),(1,1) sum to 2; L/O_L = ϖ(L/O_L); δ_M = δ⁻² | hold |

### Pinned libraries, Lean, headlines

Pins: Mathlib `1b1ccf4b08`, Tau Ceti `2fd255d997`. Opened at the pin: `Bornology.IsVonNBounded` (`Mathlib/Analysis/LocallyConvex/Bounded.lean:61`), `NormedSpace.image_isVonNBounded_iff` (`:495`, namespace at `:454`), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and its image form (`Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, `:679`), `WithSeminorms.banach_steinhaus` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean:164`), `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`), `Module.Basis` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`), `Module.finrank` (`Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`), `BDeRhamPlus` and `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88`).

The "lacks" claims of the README and the docstring hold. The pinned Tau Ceti has `TauCeti.LocallyAnalytic` (`TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45`), the algebraic direct limit of analytic stages of functions on ℤ_p; its header says that no topology is put on it, so it gives neither a distribution algebra nor a locally analytic representation. It also has p-adic measures on ℤ_p (`TauCeti/NumberTheory/Padics/Measure`), not distributions. Neither is a carrier that a headline lacks.

`lake env lean` on the package's `Suggested.lean`, from the content checkout: exit 0, no output. One import, `import Mathlib`. The file declares nothing, so there is no `sorry`, and the one-tactic probe and the `#check @name` comparison have nothing to run on; there is no padding. Headlines of the Summary and Scope against the docstring: §4.14, §§4.12–4.13, §6.6, §3.3, §3.1, §§2.3–2.4, §§7.2–7.3, §7.4, §7.5, §7.6 are each named with the carriers they lack. §4.3 and §6.3 are statable but are auxiliary lemmas, not headlines. The only backticked names of the README are the eleven Mathlib names above and `Suggested.lean`; none is presented as this roadmap's own.

### Suppliers, gaps, merge order

Every cited section was resolved at the supplier's current head (main for SmoothRepresentationsOfLocalGroups, the open head otherwise); each exists with the heading quoted or described: PadicLocalLanglandsForGL2Qp §§0.1, 0.2, 1.1–1.4, 1.6, 1.7, 2.5, 2.7, 3.1, 3.3, 3.5, 3.6, 3.8, 3.11, 4.1, 4.1k, 4.2, 4.2a, 4.9, 4.11, 5.1–5.6, 5.8, 5.12, 6.7, 6.9; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14, 12.19; LocallyAnalyticDistributions §§0.0, 0.2, 0.3; LocallyAnalyticDistributionsPartII §§1.5, 2.2, 2.3; ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5; PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7; PadicHodgeTheory §§3.3, 4.4, 5.1–5.4, 8.1; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73, RD.2.43; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3, R17.3; CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9, 6.3, 6.4; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.3, R18.5.16, R18.5.21; LocalGaloisDeformationRings §3.8; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3.2.

Statements read and compared this round: base §4.2 with its (v) and the supercuspidal comparison input, §4.9 (the compactly supported P-finite space, p ≥ 5), §5.6(iii), §5.8 with its universal family, §5.12, the freeness clause of §2.7; LocallyAnalyticDistributions §0.2 (strict countable inverse limits and cohomology) and §0.3 (strong duality for analytic compact-type spaces); ProetaleCohomology §§7.3 and 7.5; ScholzeFunctor §5.4; CompletedCohomology §§6.3 and 6.4. Each says what the README assumes of it.

The four declared gaps have a named supplier and section, the same slug in `design/plan.json` and in the README, and one precise request each. None is provided at the suppliers' heads: CompletedCohomology §6.4 gives one form, SR.3.2 is over ℂ, PadicHodgeTheory §4.4 has no Banach-coefficient comparison, the base §6.9 has no fixed-radius statement. An acceptance after repair stays conditional on them.

Dependency check, full output: `depcheck: 239 roadmaps, 2258 edges, 0 problem(s)` (exit 0; no UPWARD, CYCLE or `moved:` line).

Overlaps: no other open pull request changes this roadmap, no cited id is dropped by a revision, none is defined only by a revision. Other roadmaps that name this one were read: the base roadmap names it as the owner of the discharge of its §6.9 hypotheses, ProetaleCohomologyOfPAdicCurvesAndTowers names it as a consumer, and TriangulineVarietyAndItsLocalModel records that §1.2 here owns the rank-two nontrianguline connection statements and that it uses none of them. None cites it as a supplier, as `README.md:1246` says. Ownership was checked against main and the open heads with the roadmap tools.

Overlap check: read PadicLocalLanglandsForGL2Qp, ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower; the comparison at trivial central character and its analytic criteria: PadicLocalLanglandsForGL2Qp §6.9; the discharge of its global hypotheses: this roadmap §3.1 (the base says so); the multiplicity diagram and its integral form at infinite level: ProetaleCohomologyOfPAdicCurvesAndTowers §7.5; Hyodo–Kato and de Rham multiplicities: its §7.4; mod p finite length: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; the supercuspidal locally algebraic vectors: CompletedCohomologyAndLocalGlobalCompatibility §6.3; nothing else shared.

### Copyright and arrangement

Passages set beside the source: §0.3 (CDN20 879–913), §1.7 (DLB17 1576–1618), §3.1 local analyticity (DLB17 665–749), §3.1 route (a) (DLB17 1184–1209), §4.5 (CDN20 844–853), §4.7 (CDN20 917–951), §4.13 (CDN23 2484–2500), §4.14 second route (CDN23 2544–2552), §5.2 (CDN23 2675–2715), §5.4 (CDN23 2723–2741), §6.1 (CDN23 2606–2614), §6.3 (CDN23 2581–2593), §6.4 (CDN23 2785–2836), §7.1 (DLB17 2718–2720; COLMEZ19POIDS 310–321), §7.3 (TEI90 228–259; DLB17 2731–2781), and the §4.14 bullet of the docstring (CDN23 2357–2365). No run of shared words (the sources are French, TEI90 apart, where the longest shared run is the equation). Statements and formulas are forced by the mathematics. The route (a) of §3.1 has the two steps of its source in the order the argument forces, with other reasons (finite-dimensional bounded sets of π; the locally constant differentials) and a corrected claim. §6.3 no longer follows its source at all. No table, figure or list is taken over.

DLB17 has the largest share of locators, 89 of 197 outside the corrections and references. Its chapters are 3 covers and bundles, 4 uniformisation and de Rham cohomology, 5 the equivariant map, 6 differential equations, 7 the Kirillov model, 8 Π(π,0), 9 the O(Ω)-module, 10 surjectivity, 11 injectivity, 12 complements. The layers are not that sequence: Layer 1 draws on chapters 6–7 and Layer 2 on 8–9 with COLMEZ19POIDS, in the order their *Needs* lines force (§1.5 needs §§1.3–1.4, §1.7 needs §§1.5–1.6, §§2.1–2.2 need Layer 1); Layer 3 then takes chapters 3, 4, 5 and part of 11; chapters 9–10 belong to the base roadmap; Layers 4–6 rest on CDN20 and CDN23; Layer 7 takes two remarks of chapter 11 and chapter 12 with COLMEZ19POIDS and TEI90, two subsections to one remark and two to one section, so not one to one.

Source independence: 16 passages compared with 5 sources, none shared; largest share DLB17, 89 of 197 locators; contents compared with DLB17: independent.

## Not verifiable

- The four supplier gaps are contracts, not theorems of any text read; their proofs are not certified here.
- Line locators are those of the cached copies (arXiv v2 for DLB17, the authors' copies for CDN20 and COLMEZ19POIDS, the HAL copy for CDN23, Numdam for TEI90); journal pagination was not compared.
- E4 (DLB17 Proposition 7.7(b)) depends on how the source normalises N⁺_dif of the Tate dual in weights {0,k}; the README's own statement, with N⁺_dif = L_∞[[t]]⊗D_dR written out, was recomputed and holds, and only k = 1 is used.
- COLMEZ19POIDS Conjecture 0.10(i) prints a twist by x⁻² where §7.2 has det⁻¹, in a right-action convention; the two were not reconciled from the text. The README's form was checked on central characters (table, §7.2).
- E22 rests on the cached extraction of COLMEZ19POIDS lines 321 and 333; the PDF itself was not viewed.

## Source issues

- **Misprint** in COLMEZ19POIDS at the paragraph before Conjecture 0.10 and Remarque 0.11(i), printed p. 8: the source says the operator from weight −k to weight k+2 is the k-th derivative, acting as u⁺; it should be the (k+1)-st derivative, acting as the (k+1)-st power of u⁺; affects nothing.
- **Gap** in CDN23 at the proof of Lemme 5.12, printed pp. 66–67: the source says irreducibility over the fraction field and equal traces give an isomorphism there; it should first establish absolute irreducibility of the generic fibres; affects the proof.
- **Misprint** in CDN23 at the proof of Théorème 5.10, printed p. 66: the source says the dual of the multiplicity space contains an absolutely irreducible representation; it should take an absolutely irreducible quotient, whose dual embeds; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, printed pp. 63–64: the source says the condition on the p-central quotient is level at most n; it should be level at most n with p acting trivially on the Jacquet–Langlands transfer; affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15, printed p. 68: the source says the dual coefficient module is the dual of itself; it should be the continuous L-dual of the type ring; affects nothing.
- **Misprint** in CDN20 at the proof of Proposition 2.5, printed p. 22: the source says the Hom has dimension 0 or 1 according as the two modules are isomorphic or not; it should be 1 when isomorphic and 0 otherwise; affects nothing.
- **Gap** in CDN20 at Proposition 2.9, printed p. 24: the source says the line property of the Hyodo–Kato identification is the cited theorem of Dospinescu–Le Bras; it should prove that the cited isomorphism is the Hyodo–Kato one, for every central character; affects the proof.
- **Gap** in DLB17 at Remarque 11.13, printed pp. 65–66: the source says agreement for two period lines gives the comparison for every line; it should use three distinct lines or fix the relative scale of the two classes; affects the proof.
- **Error** in DLB17 at the introduction, printed p. 3 (DLB17 lines 114–116): the source says the level-zero space over ℚ_p is two copies of the half-plane; it should say so only after the unramified quadratic base change; affects nothing.
- **Gap** in DLB17 at the proof of Théorème 5.1, printed p. 30 (DLB17 lines 1201–1204): the source says u⁺ kills no element of the ρ-part of the differentials and sets the unramified twist aside; it should use that locally constant differentials have zero ρ-part and remove the twist by a global character; affects the proof.

## For the human reviewers

- **Scope.** The Galois-socle headline (§4.14) rests on gap:three-period-line-globalisation (`README.md:146`). No cited source states three such forms; DLB17 lines 2773–2775 assert a second form only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8cce7531c845e0cf311476e3abbb80b02080d3ab", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~8", "model": "fable", "worker": "chris-x90"} -->
