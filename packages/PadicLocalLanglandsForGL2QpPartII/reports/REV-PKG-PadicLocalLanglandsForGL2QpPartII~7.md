<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6900395249 -->
Review (claude) of 3f4a35d

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The route of §6.3 renders its source sentence by sentence and skips generic absolute irreducibility

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1038`: "Traces agree modulo every maximal ideal, hence agree … Irreducibility at the generic point holds, as otherwise almost all specialisations would be reducible. So V and W are isomorphic over the fraction field. Write the intertwiner in Smith normal form …".

   **Claim.** A proof route in the roadmap's own words, valid for every principal ideal domain A with infinitely many primes, and for the E-equivariant variant.

   **Witness.** CDN23 lines 2581–2593: the five sentences of the route correspond one to one, in order, to the source's (no English words shared, the source is French; the clause sequence is). The step "irreducible over F, hence isomorphic" needs absolute irreducibility, which the route asserts only later, "as in the main case", where it was not shown.

   **Exact repair.** Replace the text from "Prove this as follows." to "… by the density theorem." by:

   "Prove this as follows; it is enough to treat a principal ideal domain A, with fraction field F. Put H = Hom_(A[G_ℚ_p])(V, W) inside the finite free A-module Hom_A(V, W). If aφ is equivariant for some a ≠ 0, so is φ; hence H is saturated, a direct summand, and for every maximal ideal 𝔪_x the fibre H/𝔪_xH injects into Hom_(κ(x)[G_ℚ_p])(V_x, W_x). That space is a line, by Schur's lemma for the isomorphic absolutely irreducible fibres, so H has rank at most one; the same argument with W = V gives End_(F[G_ℚ_p])(V_F) = F. A stable subspace U of V_F has the saturated stable lattice U ∩ V, whose image in a fibre is stable of dimension dim U; so V_F is irreducible, and with End = F it is absolutely irreducible, and likewise W_F. The traces of V and W agree modulo every maximal ideal, hence agree, since a nonzero element of A lies in only finitely many of the infinitely many maximal ideals. Absolutely irreducible representations with the same trace are isomorphic, so H = Aφ with φ ≠ 0. As H is a direct summand, φ is nonzero in every fibre, hence an isomorphism there by Schur's lemma; so det φ lies in no maximal ideal and φ is an isomorphism. The same statement and proof hold for an A-algebra E that is finite as an A-module, acting A-linearly on V and W and commuting with G_ℚ_p, when the specialisations are isomorphic and absolutely irreducible as modules over (κ(x)⊗_A E)[G_ℚ_p]: replace A[G_ℚ_p] by E[G_ℚ_p] throughout and compare the traces of the elements e·g."

   Keep the locator (CDN23, Lemme 5.12, line 2574) and the Checks.

   **Repair tested.** A = L[T], V = W: H = A·id. Rank one: two A^×-valued characters congruent modulo every 𝔪 have ratio − 1 in ∩𝔪 = 0. A discrete valuation ring: the trace step fails (a nonzero element may lie in the only maximal ideal), as the first Check requires. E = A: the variant reduces to the main case.

2. **F02** (P2) The bounded-vector injection of §6.4 is stated by ProetaleCohomologyOfPAdicCurvesAndTowers §7.5

   **Location.** `README.md:1053`: "By §4.9, O[M]^b = 0, so the G-bounded vectors of the top row of §4.1, with §4.10(b) …, place H¹_ét[M] inside X⁺_st(M)⊗̂(LL(M)^∧)*"; `README.md:35`: "§4.9 adds to that roadmap's §7.3 the vanishing of bounded functions in a supercuspidal sector"; `README.md:112` (the §7.5 contract).

   **Claim.** The injection into `X⁺_st(M)⊗̂(LL(M)^∧)*` and the vanishing behind it are this roadmap's additions to the supplier.

   **Witness.** ProetaleCohomologyOfPAdicCurvesAndTowers at its open head, `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:950` (§7.5): "Prove its integral form: passing to `G`-bounded vectors gives an injection `H¹_ét(M_∞, L(1))[M] → X^+_st(M) ⊗̂_L L̂L(M)^*`", its route using "the vanishing in `[M]` … of the bounded functions".

   **Exact repair.**

   - `README.md:112`: append to the §7.5 bullet: "Its integral form: passing to G-bounded vectors gives an injection H¹_ét(M_∞, L(1))[M] → X⁺_st(M)⊗̂_L (LL(M)^∧)*, with LL(M)^∧ the universal unitary completion of LL(M)."
   - `README.md:35`: replace the clause after the semicolon by "§4.9 reads the bounded-vector statements of that roadmap's §§7.3 and 7.5 on the p-central quotient at a fixed level and on each M-multiplicity."
   - `README.md:741` (§4.9): after "… lines 2791–2793 and footnote 31)" add "This is the fixed-level form of the vanishing that ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 uses for its integral form, which is stated there at infinite level only." In its *Needs* write "ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1–7.3 and 7.5".
   - `README.md:1053` (§6.4): replace the first sentence by "By the integral form of ProetaleCohomologyOfPAdicCurvesAndTowers §7.5, read on M^p_(n,C) through the level reading of §0.2 and H¹_ét[M] = (H¹_proét[M])^b of §4.9, H¹_ét[M] lies inside X⁺_st(M)⊗̂(LL(M)^∧)*, and it suffices that I_(B,M) kills Hom_G(P_B, (LL(M)^∧)*)." In its *Needs* (`README.md:1066`) write "§§0.2, 4.9, 5.5 and 5.6; ProetaleCohomologyOfPAdicCurvesAndTowers §7.5; …", and add that citation to the Layer 6 *Dependencies*.

   **Repair tested.** §0.2 identifies H¹_proét(M^p_(n,C))[M] with H¹_proét(M_∞)[M] as G-spaces, so their G-bounded vectors agree; by §4.9 the first is H¹_ét[M], which therefore maps into H¹_ét(M_∞)[M] injectively and lands in the supplier's target. The supplier is earlier in the merge order; no new roadmap edge.

3. **F03** (P3) Supplier bookkeeping: three base sections missing from the contracts, two listed that no target uses

   **Location.** `README.md:71–86` (contracts of the base roadmap); `README.md:1112` (Layer 6 *Dependencies*); `README.md:37` ("**LocallyAnalyticDistributions** §§0.0–0.3").

   **Claim.** The contracts name every section consumed, and the dependency lines name only those.

   **Witness.** `README.md:237` and `:249` cite the base §1.7; `README.md:448`, `:806` cite §4.2; `README.md:1144` cites §§4.1–4.2. None is in the contract list. No target of Layer 6 cites the base §3.7 or §5.7 (its *Needs* lines: 1015, 1034, 1066, 1086, 1104). No target cites LocallyAnalyticDistributions §0.1.

   **Exact repair.**

   - Add to the base contracts: "§1.7: Colmez's classical correspondence M ↦ LL(M) in the geometric normalisation, with its rule for twists by characters; §0.4(a) uses it to compare M(π) with the module M = D_pst(V)[1]." and "§§4.1–4.2: the smooth factor LL(D_pst(V)) and the algebraic factor Sym^(b−a−1)⊗det^a of a de Rham V of weights a < b, and Colmez's theorem that Π(V)^alg is their tensor product, independently of the filtration."
   - `README.md:1112`: write "§§3.3, 3.5, 3.6, 3.8, 5.1–5.6, 5.8 and 5.12".
   - `README.md:37`: write "§§0.0, 0.2 and 0.3".

   **Repair tested.** The base head has `### 1.7 Colmez's classical correspondence LL(M) against SR.5.2`, `### 4.1 The algebraic and smooth factors LL(V) and Alg(V) of a de Rham V` and `### 4.2 Locally algebraic vectors of Π(V): Colmez's theorem`, with these statements.

4. **F04** (P3) A misprint of COLMEZ19POIDS is corrected silently

   **Location.** `README.md:1136`: "The first map of the row is (u⁺)ᵏ⁺¹ (Remarque 0.11(i))."

   **Claim.** The cited remark gives the map as (u⁺)^(k+1).

   **Witness.** COLMEZ19POIDS line 321 and line 333, as the cached text prints them: the operator O_n(−k) → O_n(k+2) is the k-th derivative, compared with u⁺. At k = 0 that is the identity from weight 0 to weight 2; DLB17 line 2722 has (u⁺)^(k+1).

   **Exact repair.** Add to *Source corrections*: "**E22** (misprint, COLMEZ19POIDS, the paragraph before Conjecture 0.10 and Remarque 0.11(i), lines 321 and 333; affects nothing). The operator from O_n(−k) to O_n(k+2) is printed as the k-th derivative and compared with u⁺. It is the (k+1)-st derivative, acting as (u⁺)^(k+1), as in DLB17 Remarque 11.12 (line 2722); at k = 0 it is d/dz, with cokernel the de Rham cohomology. §7.2." Append "(source correction E22)" to the sentence at `README.md:1136`.

   **Repair tested.** k = 0: (u⁺)¹ = −d/dz from O to O(2)⊗det = Ω¹, the de Rham row of §3.3; the printed twist by x^(−1−k) matches k+1 derivatives.

5. **F05** (P3) The first Check of §6.3 fails at p = 2

   **Location.** `README.md:1042`: "V = ρ and W = ρ⊗χ, with χ a nontrivial unramified character congruent to 1, have isomorphic absolutely irreducible reductions but are not isomorphic."

   **Claim.** Every such χ gives non-isomorphic V and W.

   **Witness.** p = 2, χ the unramified quadratic character (χ(2) = −1 ≡ 1 mod 2), ρ induced from G_(ℚ_4) by a character with reduction of order 3: χ is trivial on G_(ℚ_4), so ρ⊗χ ≅ ρ, and ρ̄ is absolutely irreducible.

   **Exact repair.** Write: "V = ρ and W = ρ⊗χ, with χ the unramified character with χ(p) = 1+p, have isomorphic absolutely irreducible reductions but different determinants, since χ(p)² = (1+p)² ≠ 1, so they are not isomorphic. Nontriviality and congruence to 1 alone do not suffice: at p = 2 the unramified quadratic character fixes every ρ induced from G_(ℚ_4)."

   **Repair tested.** p = 2: (1+2)² = 9 ≠ 1 and 3 ≡ 1 mod 2. p = 3: 16 ≠ 1 and 4 ≡ 1 mod 3.

6. **F06** (P3) §4.14 reuses the symbol Π(V) for a second object

   **Location.** `README.md:839`: "It makes Π(V) := Hom(V, H¹_ét)′ an admissible unitary Banach representation of finite length."

   **Claim.** Π(V) is the base roadmap's correspondence (Summary, §0.3, and `README.md:830` in the same subsection).

   **Witness.** `README.md:830`: "Π(V)*⊗JL(M) if V ≅ V_(M,ℒ)" uses the correspondence; nine lines later the same symbol is defined as a dual of a Hom space, for V of dimension at least three, where the correspondence is not defined.

   **Exact repair.** Write: "It makes the strong dual Π_n(V) of Hom_(W_ℚ_p)(V, H¹_ét(M^p_(n,C), L(1))) an admissible unitary Banach representation of finite length." The next sentence is unchanged.

   **Repair tested.** §4.11 already writes Π_M(V) for the M-part; Π_n(V) collides with neither.

7. **F07** (P3) §6.1 promises a comparison with the universal family without stating it

   **Location.** `README.md:999`: "compare with the universal family Π^univ of the base §5.8. Its fibre at x is Π(ρ_x(ε)), whose Banach dual relates to Π(ρ_x)* by the cyclotomic twist ε and the duality of §0.2."

   **Claim.** A comparison between Π*(ρ_(B,M)) and Π^univ.

   **Witness.** No statement follows: "relates to" names no map, source or target, and §0.2 (`README.md:186`) is the type decomposition, not a duality of Banach representations.

   **Exact repair.** Replace the two sentences by: "For absolutely irreducible ρ̄_B, prove the comparison with the universal family of the base §5.8, applied to the residual representation ρ̄_B⊗ε̄⁻¹: its fibre at the closed point y with ρ_y = ρ_x⊗ε⁻¹ is Π(ρ_y(ε)) = Π(ρ_x), and κ(x)⊗Π*(ρ_(B,M)) is the Banach dual, in the sense of Conventions, of that fibre."

   **Repair tested.** Base §5.8 at its head: the fibre at a closed point y is Π(ρ_y(ε)); with ρ_y = ρ_x⊗ε⁻¹ this is Π(ρ_x), and ρ̄_y = ρ̄_B⊗ε̄⁻¹ is absolutely irreducible when ρ̄_B is.

Seven findings: two P2 and five P3. The five findings of the previous round are repaired. The mathematics of every statement recomputed this round holds. What remains is one proof route that renders its source sentence by sentence (and skips a step at the stated generality), one supplier statement that the supplier's current head now makes and this README still derives itself, and five bookkeeping points. None requires replanning.

## Previous findings checked first

| Previous finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) coordinate radius algebras cited at the base §0.1 | `README.md:100`: "§1.5 supplies, for a compact locally ℚ_p-analytic group H with a p-valuation ω and an ordered basis … satisfying its condition (HYP) … the coordinate norms ‖·‖_r, the Banach radius algebras D_r(H,L)"; lines 37, 482, 523, 581 now cite "LocallyAnalyticDistributionsPartII §§1.5 and 2.2–2.3". | **Repaired.** The supplier's §1.5 (its README line 217) has (HYP), 1/p ≤ r < 1 and the identification for r ∈ p^ℚ ∩ (1/p,1), as quoted. (HYP) for G_i recomputed below. |
| F02 (P2) vacuous API bullet of §1.3 | `README.md:295`: "For every b ∈ ℚ_p, (1−u(b))^k v lies in Π_c^P-fin: for every m ≥ −v_p(b) and N ≥ max(1, m+n) …". | **Repaired.** DLB17 lines 1500–1519 state it for every u; the route was recomputed (below). |
| F03 (P2) §6.4 route rendered clause by clause | `README.md:1053–1056`: four steps, a finite-length criterion stated and proved on its own, "J kills Y_B" derived from the centre map. | **Repaired.** The steps are regrouped by what they prove and carry the roadmap's own criterion and Checks; CDN23 lines 2785–2836 support each. Its first step is R02. |
| F04 (P3) scope listed three of four gaps | `README.md:39`: "Four inputs are supplier gaps … the tensor comparison for continuous Galois cohomology of C⊗V^∨ with Banach coefficients (PadicHodgeTheory §4.4) …". | **Repaired.** Four slugs in `design/plan.json`, four named, four "What … must provide" lines. |
| F05 (P3) `cited_for` lists | `sources.toml`, the five `cited_for` arrays. | **Repaired.** A per-section listing of the source ids in the README agrees with every array (References apart). |

Patterns searched in the rest of the package: a route following its source sentence by sentence (found once: R01; §§5.4, 5.5, 6.5 name inputs and are not renderings); a supplier cited for other than what its head states (R02, R03); vacuous API bullets (§§1.3, 1.4, 4.8, 5.3 evaluated: none); lists of gaps (the *Dependencies* of Layers 3, 4 and 7 name the gaps their targets use).

## Verified sound

### Coverage, principles, shape

All 1269 lines of the README were read, with every *Needs* line. Eight layers named by their mathematics, each with Examples and Dependencies; the Summary says where the base roadmap stops; nothing of the base, the tower geometry or the type rings is planned again. No algorithm, `set_option`, sorry'd data, pull-request number, date, HTML anchor, machine path or LaTeX delimiter in the README, the Lean file or the manifest. p > 2 (Layer 5, §6.4) and p > 3 (§§6.5–6.6) are hypotheses of the cited theorems (CDN23 lines 93, 1776, 1795, 2786, footnote 32 at 2861). No maintainer notes were given. No suspicious instruction was met in any text read.

### Seeded source sample

No locator is flagged unverified by the author. The five manifest texts were read from the cache; nothing was fetched and the manifest is unchanged.

| Target | Text opened | Checked |
|---|---|---|
| 0.2 | CDN23 lines 2343–2349; DLB17 lines 152–158; CDN20 lines 100–109 | decomposition for p acting trivially; σ^ρ; M_∞ as the uncompleted system; Ǧ on π₀ through Nrd. |
| 0.4 | DLB17 line 189, Théorème 1.4 (232–237); CDN20 240–249, 917–933; CDN23 footnote 30 (2447) | M_dR(π), ℒ^⊥ in M*_dR, D_pst(V)[1], ℒ⁻¹ = M*_dR/ℒ^⊥, the implicit self-duality. |
| 1.3 | DLB17 Définition 7.4 (1473–1499), Remarque 7.5 (1500–1519) | both conditions; every u(x); the source's N ≥ m+n, sharpened here to N ≥ max(1, m+n). |
| 2.4 | COLMEZ19POIDS 153–166, Théorème 0.3 (177–180), 205–211, Théorème 0.6 (215–236), Remarque 0.7 (237–251), Théorème 0.8 (262–271) | ω, centre x^kω, Casimir (k²−1)/2, the four exact sequences, the three identities for ∂, the action ·_k. |
| 4.1 | CDN20 Théorème 0.8 (323–332), Corollaire 2.1 (762), Remarque 2.3 (817–821); CDN23 2501–2514 | the diagram; slope 1/2 and rank 2; injectivity and closed image of the vertical maps. |
| 4.2 | CDN20 633–644, Proposition 1.5 (650), 1.6 (659–672), Théorème 1.7 (678–681); CDN23 Théorème 5.1 (2357–2365), Remarque 5.2 | mass-zero duals, the kernel dz/(z−x), symbols, the mod p^k comparison, the character branch. |
| 4.7 | CDN20 917–951, Proposition 2.9 (952–954), 2.10 (962) | W′, ℒ⁻¹, W; 2.9 is proved by citing DLB17 Théorème 1.4 (E16, E21). |
| 4.10 | CDN23 Lemme 5.3 (2381–2384); CDN20 Corollaire 2.13 (1078–1085) | (a), (b); the consequence and its proof through 2.9, 2.10, 2.12. |
| 4.11 | CDN20 Théorème 2.15 (1090–1095), footnote 15 | "after a finite extension of L"; admissible, finite length, constituents Π(V_(M,ℒ)). |
| 5.3 | CDN23 2716–2745, 2757–2769 | m_B, m_(n,B), m̌_(n,B), m_(B,M), rationalisation by compactness of P_B. |
| 5.6 | CDN23 Remarque 5.23 (2762–2776) | finite sum, level independence by restriction–corestriction, inverse centres. |
| 6.1 | CDN23 Définition 5.14 (2606–2614), footnote 7 (181) | the lattice in the dual, the limit, the two other descriptions, the fibre property. |
| 6.3 | CDN23 Lemme 5.12 (2574–2595) | statement; the proof is R01. |
| 7.3 | TEI90 Theorem 5 (177), Corollary 6 (232–250), 251–259, Theorem 8 (298); DLB17 2731–2781 | p−1 components, the curve y^(p+1) = z−z^p, the equation with p, K; two lines only in the source (E10). |
| 7.6 | DLB17 2810–2822, Remarque 12.3(a) (2823), Théorème 10.1 (2192–2196) | the complex, F⁰, the filtered isomorphism for n large; coadmissibility from the ρ-sector (E8). |

Further locators opened: CDN20 Théorème 0.2 (130), Proposition 2.4 proof (844–853), Corollaire 2.16 (1108); CDN23 line 93, Théorème 0.1 (121), footnotes 6 and 8 (178, 182), Lemmes 5.4, 5.5, 5.9 (2401, 2411, 2481), Proposition 5.7 (2424–2448), Théorèmes 5.8, 5.10, 5.15 (2465, 2541, 2620), Proposition 5.16 (2635), Théorème 5.22 (2746), Théorème 5.24 (2779–2836), footnote 32 (2861); DLB17 Remarque 11.12 (2718–2725); COLMEZ19POIDS 310–340.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Contract, (HYP) for G_i | p = 3, i = 1; p = 2, i = 2; unshifted v at p = 3, i = 2 | ω = 1: 1+1 = 2 > 3/2, ω > 3/2 forces ω ≥ 2, G_(i+1) = G_i³; ω = 2: 2+2 = 4 > 2, ω ≥ 3 is G_(i+1) = G_i²; 1+9E₁₂ has value 2 > 3/2 and is not a cube in G₂ | holds |
| §0.2 decomposition | p = 2, n = 1: Ǧ/(p^ℤK_D(1)) = 𝔽_4^×⋊ℤ/2 = S₃; Z = W⊗JL(M), dim JL = 2 | irreducibles of dimension 1, 1, 2 and 1+1+4 = 6; Z[M] = W, isotypic part of dimension 2·dim W | holds |
| §0.2 level reading | full level zero, T = shift by 2 on ∏_ℤ L | f_(h+2) − f_h = a_h solvable in each parity: coker(T−1) = 0 | holds |
| §0.4(c) | ℒ = Le₁ | v ↦ (w ↦ v∧w): e₁ ↦ kills e₁, sends e₂ to e₁∧e₂, so ℒ ↦ Le₂*⊗∧² = ℒ^⊥⊗∧²; Fil¹ = 0 | holds |
| §1.3 new bullet | c = c₀+p^N c₁; b = p⁻¹, n = k = 1, m = 1, N = 2 | S_N(1−u(1)) = 1−u(p^N); S_N(1−u(c)) is a multiple of u(p^N)−1 on the span; Σ_(i<p²)ζ_p^(iu) = 0; (n,k,m) ⇒ (n+1,k,m+1) since Σ_(i<p^(n+1))u(i/p) = Σ_(r<p)u(r/p)·S_n | holds |
| §1.5 Lie action | general a, b | [a⁺,u⁺] = t; [u⁺,u⁻] = 2∇+1−k = a⁺−a⁻; Casimir (k²−1−4ab)/2 = ((a−b)²−1)/2 | holds |
| §1.6 | V = L; weights {0,2} | residue of fg·t⁻¹dt is the constant term: orthogonal tL_∞[[t]]; te pairs to 0 and te ∉ t²N⁺ | holds |
| §1.7 unipotent-fixed | bx ∈ ℤ_p; bx = p⁻¹; p = 2 | tφ(x) = 0, then (ζ_p−1)φ(x) = 0; ζ₂−1 = −2 invertible | holds |
| §2.2 | w; u(b); on O(Ω) | w∂w = (−1)(−∂)⁻¹ = ∂⁻¹; wu⁺w f = z²f′ = −∂²u⁺f; u(b)∂u(b)⁻¹ = ∂−b | holds |
| §2.3 (headline) | k = 1 in Théorème 0.6(iii) | Π(V)^an/π ≅ Π(M,−1)⊗det; central character x⁻²·x² = 1 | holds |
| §2.4 | trivial central character; k = 1, 2; dual of Π(M,0) | ω = x⁻¹; centre of Π(M,k) is a^kω(a); Π(M,−k)⊗x^k has x⁻ᵏω·x²ᵏ; det Δ_(2,ℒ)(p) = p, twist gives 1; on the dual a⁺ = ∂u⁺, and Π(M,0)′⊗det⁻¹ has a⁺ = u⁺∂, u⁻ = −∂u⁺∂ = −∂²u⁺+∂, the formulas of O(1) in §3.1 | holds |
| §3.1 (headline) | f = (1,−1) at level zero; δ_x | diag(p,1)f = −f; derivative of δ_x along u⁺ is f ↦ f′(x), 1 on z | holds |
| §3.3 (headline) | A = diag(1,2); A fixing three lines | L(e₁+e₂) ↦ L(e₁+2e₂); A = diag(α,β) with α = β | holds |
| §4.1 | slope 1/2 | Dimensions (1,2) for X⁺_st(M) and (2,0) for C⊗M_dR; kernel onto C⊗(M_dR/ℒ) has (1,2)−(1,0) = (0,2): V_(M,ℒ) of dimension 2 | holds |
| §4.2 | kernel under g; μ = δ₀−δ_∞, g_n = u(pⁿ) | d(gz)/(gz−gx) = dz/(z−x) − c·dz/(cz+d), second term killed by mass zero; g_nμ−μ = δ_(pⁿ)−δ₀ of norm 1, pointwise → 0 | holds |
| §4.3 | d = 2; d = 3 with Ae₁ = e₃, Ae₂ = e₁+e₃ | trace λ₁+λ₂, determinant λ₁λ₂; characteristic polynomial X³−zX²−(x+y)X−y with x, y, z free | holds |
| §4.5 Check | E with ge₂ = e₂+logχ(g)e₁ | invariants Le₁; c(g) = ℓe₂+ℓ²e₁/2 satisfies c(gh) = c(g)+gc(h), nonzero in H¹(Ce₂) | holds |
| §4.7 | ℒ ≠ ℒ′; e ↦ ae | W′_ℒ ∩ W′_ℒ′ = preimage of 0 = d(O[M]^(G_ℚ_p)); a·a⁻¹ = 1 | holds |
| §4.10 | Π unitary; St^sm | ‖gℓ‖ = ‖ℓ‖; δ_(pⁿ)−δ₀ vanishes on each smooth f for n large, norm 1 | holds |
| §4.11 | V_ℒ⊕V_ℒ′; a character | Π_ℒ⊕Π_ℒ′, length 2; 0 since M[−1]* is irreducible of rank 2 | holds |
| §§4.12–4.14 (headlines) | Π = Π_(M,ℒ); d = dim JL(M); dim V = 3; χ(p) = 1+p | sequences for ℒ and ℒ′ give dimension ≤ 2 then ≤ 1; dimensions d and 2d; 0; (1+p)² ≠ 1 gives 0 on M^p_n | holds; notation R06 |
| §5.3 | m = O_L | m̌ = O_L, Pontryagin dual L/O_L, not finitely generated | holds |
| §5.6 | M = Sp⊗δ; n = 0, n′ = 1 | δ_M = δ⁻²; order p²−1 = 3, 8 | holds |
| §6.1 | R_(B,M) = 0; fibre of Π^univ | 0; at ρ_y = ρ_x⊗ε⁻¹ the fibre is Π(ρ_x) | holds; R07 |
| §6.3 | L[T], V = W; rank one; DVR with χ(p) = 1+p; p = 2 quadratic χ | H = A·id; ratio−1 ∈ ∩𝔪 = 0; determinants differ by 9 at p = 2; ρ⊗χ ≅ ρ | statement holds; R01, R05 |
| §6.4 | ℤ_p/p^k; ⊕_ℕσ; c-Ind k_L; Z_B at p = 3, p ≥ 5 | length k, limit infinite; not finitely generated; free over k_L[T]; base §5.6(iii): torsion-free quotient, isomorphism | holds; R02 |
| §6.6 (headline) | A = L⟨T⟩, T = 0 | Ǎ = bounded sequences, T the left shift: Ǎ/TǍ = 0, Ǎ[T] = L·ev₀ | holds |
| §7.1 | g, g′ | (a−cz)a′−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z | holds |
| §7.2 (headline) | s ∈ ℤ; k = 1, a = p | O(s) and Π(M,s−1)′⊗det⁻¹ both have centre a⁻ˢ and a⁺ = u⁺∂+1−s; row scalars a^k, a^k, a^k; dualised sequences of §2.4(ii) give kernel O(−k) and preimage of ℒ^⊥; p⁻³p⁴ = p | holds; R04 |
| §7.3 | p = 2, 3 | y′³+(z−z²): 1 factor; ζ² = −1 in ℚ_9: 2 factors; ∏(Y−ζW) = Y^(p−1)+W^(p−1) | holds |
| §7.4 (headline) | trivial representation | H¹_e = 0, H¹_f of dimension 1 | holds |
| §7.5 (headline) | f = (1,−1) over ℚ_p² | primitives (z^j/j!, −z^j/j!), not in O(Ω) | holds |
| §7.6 (headline) | line ℒ | total dimension 2, F⁰ part = maps into Ω¹, a line by §4.12 | holds |

### Pinned libraries, Lean, headlines

Pins: Mathlib `1b1ccf4b08`, Tau Ceti `2fd255d997`. Opened: `Bornology.IsVonNBounded` (`Mathlib/Analysis/LocallyConvex/Bounded.lean:61`), `NormedSpace.image_isVonNBounded_iff` (`:495`, namespace opened at `:454`), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and the image form (`Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, `:679`), `WithSeminorms.banach_steinhaus` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean:164`), `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`), `Module.Basis` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`), `Module.finrank` (`Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`), `BDeRhamPlus` and `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88`). A search of the pinned Tau Ceti for Drinfeld, Robba, Kirillov and locally analytic carriers finds only the coadjoint Kirillov form of `TauCeti/Algebra/Lie/Coadjoint.lean`; the docstring's "lacks" claims hold.

`lake env lean` on the package's `Suggested.lean`, from the content checkout: exit 0, no output. One import, `import Mathlib`. The file declares nothing: there is no `sorry`, the one-tactic probe and the `#check @name` comparison have nothing to run on, and there is no padding. Headlines of the Summary and Scope against the module docstring: §4.14, §§4.12–4.13, §6.6, §3.3, §3.1, §§2.3–2.4, §§7.2–7.3, §7.4, §7.5, §7.6 are each named with the carriers they lack, and each lacks them at the pins. §4.3 and §6.3 are statable linear algebra but auxiliary. The only backticked names in the README are the eleven Mathlib names above and `Suggested.lean`; none is presented as this roadmap's own.

### Suppliers and merge order

Every cited section heading was resolved at the supplier's current head (main for SmoothRepresentationsOfLocalGroups, the open head otherwise): PadicLocalLanglandsForGL2Qp §§0.1, 0.2, 1.1–1.7, 2.5, 2.7, 3.1–3.8, 3.11, 4.1, 4.1k, 4.2, 4.2a, 4.9, 4.11, 5.1–5.8, 5.12, 6.7, 6.9; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14, 12.19; LocallyAnalyticDistributions §§0.0, 0.2, 0.3; LocallyAnalyticDistributionsPartII §§1.5, 2.2, 2.3; ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5; PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7; PadicHodgeTheory §§3.3, 4.4, 5.1–5.4, 8.1; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73, RD.2.43; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3, R17.3; CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9, 6.4; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.3, R18.5.16, R18.5.21; LocalGaloisDeformationRings §3.8; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3.2. Statements read and compared this round: base §§0.1, 1.7, 4.1, 4.2, 4.9, 5.6, 5.8, 5.12 and the freeness clause of §2.7; LocallyAnalyticDistributionsPartII §§1.5, 2.2, 2.3 and its §0.1 contract; Proetale §§0.4, 7.1–7.5; Scholze §5.4 with its geometric corollary; CompletedCohomology §6.4.

The four declared gaps have a named supplier and section, the same slug in `design/plan.json` and in the README, and one precise request each. None is provided at the suppliers' heads: CompletedCohomology §6.4 gives one form, SR.3.2 is over ℂ, PadicHodgeTheory §4.4 has no Banach-coefficient comparison, and the base §6.9 has no fixed-radius statement. An acceptance after repair stays conditional on them.

Dependency check, full output: `depcheck: 246 roadmaps, 2256 edges, 0 problem(s)` (exit 0; no UPWARD, CYCLE or `moved:` line).

Overlaps: no other open pull request changes this roadmap, no cited id is dropped by a revision, none is defined only by a revision. Ownership was checked against the roadmaps on main and the open heads with the roadmap tools; the one shared statement found is R02.

Overlap check: read PadicLocalLanglandsForGL2Qp, ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower; the comparison at trivial central character: PadicLocalLanglandsForGL2Qp §6.9; the multiplicity diagram and its integral form at infinite level: ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 (R02); Hyodo–Kato and de Rham multiplicities: its §7.4; mod p finite length: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; coordinate radius algebras: LocallyAnalyticDistributionsPartII §1.5; nothing else shared.

### Copyright and arrangement

Passages set beside the source: §1.3 (DLB17 1473–1519), §2.4 (COLMEZ19POIDS 215–271), §4.2 (CDN20 633–681), §4.7 (CDN20 917–951), §4.11 (CDN20 1090–1095), §§5.3 and 5.5 (CDN23 2743–2756), §5.6 (2762–2776), §6.1 (2606–2614), §6.3 (2581–2593), §6.4 (2785–2836), §7.2 (DLB17 2718–2725; COLMEZ19POIDS 310–340), §7.3 (DLB17 2731–2781; TEI90 232–259), §7.6 (DLB17 2810–2822), and the §4.14 bullet of the Lean docstring (CDN20 130–134). Statements and formulas are forced by the mathematics; §2.4 regroups the source's items; §§6.4 and 7.3 carry the roadmap's own steps; §6.3 is R01. No table, figure or list is taken over.

DLB17 has the largest share of locators, 89 of 197 outside the corrections and references. Its chapters are 3 covers and bundles, 4 uniformisation and de Rham cohomology, 5 the equivariant map, 6 differential equations, 7 Kirillov model, 8 Π(π,0), 9 the O(Ω)-module, 10 surjectivity, 11 injectivity, 12 complements. The layers are not that sequence: Layer 1 draws on chapters 6–7 and Layer 2 on 8–9 with COLMEZ19POIDS, in the order their *Needs* lines force (§§2.1–2.2 need §§1.1, 1.2, 1.5–1.7); Layer 3 then takes chapters 3, 4, 5 and part of 11; chapters 9–10 belong to the base roadmap; Layers 4–6 rest on CDN20 and CDN23; Layer 7 mixes chapter 12 with COLMEZ19POIDS and TEI90.

Source independence: 14 passages compared with 5 sources, one rendered sentence by sentence (R01); largest share DLB17, 89 of 197 locators; contents compared with DLB17: independent.

## Not verifiable

- The four supplier gaps are contracts, not theorems of any text read; their proofs are not certified here.
- Page numbers are those of the cached versions (arXiv v2 for DLB17, the authors' copies for CDN20 and COLMEZ19POIDS, the HAL copy for CDN23); they were not compared with the journal pagination.
- COLMEZ19POIDS Conjecture 0.10(i) prints a twist by x⁻² where §7.2 has det⁻¹, in a right-action convention with JL(M)*. The two could not be reconciled from the cached text; the README's form was checked on central characters and on a⁺ (table, §7.2).
- R04 rests on the cached extraction of COLMEZ19POIDS lines 321 and 333; the PDF itself was not viewed.

## Source issues

- **Misprint** in COLMEZ19POIDS at the paragraph before Conjecture 0.10 and Remarque 0.11(i), printed p. 8: the source says the operator from weight −k to weight k+2 is the k-th derivative, acting as u⁺; it should be the (k+1)-st derivative, acting as the (k+1)-st power of u⁺; affects nothing.
- **Gap** in CDN23 at the proof of Lemme 5.12, printed pp. 66–67: the source says irreducibility over the fraction field and equal traces give an isomorphism there; it should first establish absolute irreducibility (or use characteristic zero); affects the proof.
- **Gap** in DLB17 at Remarque 11.13, printed p. 66: the source says agreement of two period lines determines the comparison for every line; it should use three distinct marked lines or fix the relative scale of the two extension classes; affects the proof.
- **Gap** in DLB17 at Remarque 7.5, printed p. 37: the source says any N ≥ m+n works; it should also require N ≥ 1, since m+n can be nonpositive when the translation parameter has positive valuation; affects nothing.
- **Error** in DLB17 at the introduction, printed p. 3 (DLB17 lines 114–116): the source says the level-zero space over ℚ_p is two copies of the half-plane; it should say so only after the unramified quadratic base change; affects nothing.
- **Gap** in CDN20 at Proposition 0.9 and Proposition 2.9, printed pp. 9 and 24: the source says the line property of the Hyodo–Kato identification follows from the cited theorem at every level; it should prove that the cited isomorphism is the Hyodo–Kato one; affects the proof.
- **Misprint** in CDN23 at Théorème 5.15, printed p. 68: the source says the dual coefficient module is the dual of itself; it should be the continuous L-dual of the type ring; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, printed pp. 63–64: the source says the condition on the p-central quotient is level at most n; it should be membership in the types on which p acts trivially, of level at most n; affects a stated result.

## For the human reviewers

- **Scope.** The Galois-socle headline (§4.14) rests on gap:three-period-line-globalisation (`README.md:143`). No cited source states three such forms; DLB17 lines 2773–2775 assert a second form only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3f4a35d847fd3e7d8879b9881097bf04157b949e", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~7", "model": "fable", "worker": "chris-x91"} -->
