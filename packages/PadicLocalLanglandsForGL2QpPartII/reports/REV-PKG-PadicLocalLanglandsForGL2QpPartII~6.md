<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6895934137 -->
Review (claude) of dc29b98

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) The coordinate radius algebras are cited where they no longer are

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:100`: "The Banach radius algebras D_r(H,L), their coordinate norms ‖·‖_r, noetherianity and D(H,L) = lim_r D_r(H,L) are taken from PadicLocalLanglandsForGL2Qp §0.1, through the explicit radius-algebras contract of LocallyAnalyticDistributionsPartII's *Exact supplier contracts*." Also lines 37, 481, 522 and 580 ("PadicLocalLanglandsForGL2Qp §0.1 (radius algebras)").

   **Claim.** The base roadmap's §0.1 supplies the radius algebras in ordered coordinates with their norms, through a contract stated by LocallyAnalyticDistributionsPartII.

   **Witness.** LocallyAnalyticDistributionsPartII at its open head, `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:58`: "Nothing else is taken from §0.1 … the description of the Banach stages of D(H, L) in ordered coordinates … is §1.5"; line 217 is `### 1.5 The Banach radius algebras D_r(H, K) in ordered coordinates`. That head has no radius-algebras contract. The base's §0.1 (its README line 220) states only that D(H,L) is Fréchet–Stein with noetherian radius algebras; it has no ordered basis, no ‖·‖_r and no p-valuation.

   **Exact repair.**
   - Line 100, first sentence, becomes: "LocallyAnalyticDistributionsPartII §1.5 supplies, for a compact H with a p-valuation and an ordered basis satisfying Schneider–Teitelbaum's condition (HYP) and for 1/p ≤ r < 1, the coordinate norms ‖·‖_r, the Banach radius algebras D_r(H,L), their identification with the radius algebras of the Fréchet–Stein structure of PadicLocalLanglandsForGL2Qp §0.1, and D(H,L) = lim_r D_r(H,L); noetherianity of the stages is PadicLocalLanglandsForGL2Qp §0.1." Delete the next sentence's clause on coordinate weights, now part of §1.5.
   - Line 37: replace "**PadicLocalLanglandsForGL2Qp** §0.1 supplies the Banach radius algebras of distributions; **LocallyAnalyticDistributionsPartII** §§2.2–2.3 supply" by "**LocallyAnalyticDistributionsPartII** §1.5 supplies the Banach radius algebras of distributions in ordered coordinates, and its §§2.2–2.3 supply".
   - Lines 481, 522, 580: replace "PadicLocalLanglandsForGL2Qp §0.1 (radius algebras)" by "LocallyAnalyticDistributionsPartII §1.5"; in the *Needs* and *Dependencies* lines write "LocallyAnalyticDistributionsPartII §§1.5 and 2.2–2.3".

   **Repair tested.** §1.5 exists at that head with the hypotheses the route of §3.1 uses. For G₁ = 1+pM₂(ℤ_p), p odd, ω=1 on generators gives 1+1 = 2 > p/(p−1). At p = 2, G₂ with ω = v(g−1) has 2+2 = 4 > 2 and G₂² = G₃, so it is saturated; for i ≥ 3 the valuation v(g−1)−i+2 is the one that satisfies (HYP), so the README must say "a p-valuation satisfying (HYP)", not "its p-valuation". LocallyAnalyticDistributionsPartII is earlier in the merge order, so the edge is downward.

2. **F02** (P2) An API bullet of §1.3 is vacuous as written

   **Location.** `README.md:295`: "For v P-finite and N divisible enough, a power of 1−u(p^N) carries v into Π_c^P-fin (DLB17, Remarque 7.5)."

   **Claim.** The source's passage from P-finite vectors to vectors of infinite slope.

   **Witness.** If (u(pⁿ)−1)^k v = 0 and N ≥ n then u(p^N)−1 = (u(pⁿ)−1)·Q, so (1−u(p^N))^k v = 0: the bullet asserts 0 ∈ Π_c^P-fin. DLB17 lines 1500–1519 state it for every u(b), b ∈ ℚ_p, with the exponent k of the definition.

   **Exact repair.** Replace the bullet by: "For v ∈ Π^P-fin with n, k as in the definition and every b ∈ ℚ_p, (1−u(b))^k v lies in Π_c^P-fin: for m ≥ −v_p(b) and N ≥ m+n, (Σ_(i=0)^(p^N−1) u(i))^k diag(p^m,1)(1−u(b))^k v = 0 (DLB17, Remarque 7.5, lines 1500–1519)." Add the Check: "For N ≥ n, (1−u(p^N))^k v = 0, since u(p^N)−1 is a multiple of u(pⁿ)−1; the statement has content for b of small valuation. In a Kirillov model with t = 0 and φ supported on ℤ_p∖{0}, (1−u(p⁻¹))φ = (1−ε(x/p))φ(x) vanishes on pℤ_p and is nonzero on ℤ_p^× when φ is."

   **Repair tested.** With that φ (n = k = 1), b = p⁻¹, m = 1, N = 2: w(x) = (1−ε(x/p))φ(x) is supported on ℤ_p^×; diag(p,1)w is supported on p⁻¹ℤ_p^×, where Σ_(i<p²) ε(iy/p) = p·Σ_(i mod p) ζ_p^(iy) = 0. So the trace kills it, and w ≠ 0.

3. **F03** (P2) The route of §6.4 renders its source clause by clause

   **Location.** `README.md:1052–1056`, the five route bullets, for example "Choose a G-stable O_L-lattice LL(M)⁺ in LL(M) and let Y be its p-adic completion. Then (LL(M)^∧)* = Y^d[1/p] with Y^d = … a compact O_L-module, and compactness of P_B gives …".

   **Claim.** A proof route in the roadmap's own words.

   **Witness.** The five bullets correspond one to one, in order, to CDN23 lines 2791–2797, 2798–2803, 2805–2817, 2818–2824 and 2830–2836; bullets two and four translate the source's sentences with every clause in place. No English words are shared (the source is French); the clause sequence is.

   **Exact repair.** Replace the five bullets by a route organised by what is proved:

   - "Reduction. Bounded vectors in the top row of §4.1, with O[M]^b = 0 (§4.9) and §4.10(b), embed H¹_ét[M] in X⁺_st(M)⊗̂(LL(M)^∧)*, so the statement is about Hom_G(P_B, (LL(M)^∧)*). For the p-adic completion Y of a G-stable lattice LL(M)⁺ this dual is Y^d[1/p], where Y^d = lim_k (Y/p^kY)^∨ is compact; a continuous map out of the compact P_B has bounded image, so the Hom space is (lim_k Hom_G(P_B, (Y/p^kY)^∨))[1/p]."
   - "Block completion. Y_B, the inverse limit of the finite-length quotients of LL(M)⁺ lying in B (base roadmap §5.12), is p-torsion-free and p-adically complete, Y/p^kY maps onto Y_B/p^kY_B, and Y_B is killed by J = Z_B^(δ_M) ∩ I_(B,M), where Z_B^(δ_M) = R_B^(ps,δ_M)/O_L-torsion (this uses p > 2), so that I_(B,M) = J[1/p]."
   - "Stage lemma. For each k the inclusion Hom_G(P_B, (Y_B/p^kY_B)^∨) ⊂ Hom_G(P_B, (Y/p^kY)^∨) is an equality. The criterion: an O_L[G]-module that is finitely generated and is the union of finite-length subrepresentations in B has finite length. The dual of the image of a map has the first property as a quotient of LL(M)⁺/p^k and the second as a submodule of P_B^∨, so it is one of the quotients defining Y_B."
   - "Annihilation. Z_B^(δ_M) is the centre of the block category, so it acts on Hom_G(P_B, (Y_B/p^kY_B)^∨) identically through either argument, and J kills every stage. The limit over k is killed by J and, after inverting p, by I_(B,M). Finite length holds only at a fixed k, so the limit is taken after this step."

   Keep the locator (CDN23, Théorème 5.24(i) and its proof, lines 2779–2836) and the Checks.

   **Repair tested.** The identity of P_B is still excluded (the stage lemma concerns maps into a p^k-torsion target; P_B is not of finite length, base §5.3 Checks); ℤ_p/p^k has length k and its limit infinite length, which the fourth bullet respects.

4. **F04** (P3) Scope lists three of the four supplier gaps

   **Location.** `README.md:39`: "The coefficient form of supercuspidal projectivity, the fixed-radius form of the divisibility step of the base §6.9 and the globalisation of a supercuspidal type by three forms with pairwise distinct period lines are supplier gaps".

   **Claim.** The list of this roadmap's supplier gaps.

   **Witness.** `README.md:135` states a fourth, gap:continuous-galois-tensor-comparison (PadicHodgeTheory §4.4), used in §4.5 (`README.md:670`, `:681`) and present in `design/plan.json`.

   **Exact repair.** Write: "The coefficient form of supercuspidal projectivity, the fixed-radius form of the divisibility step of the base §6.9, the tensor comparison for continuous Galois cohomology of C⊗V^∨ in PadicHodgeTheory §4.4 and the globalisation … are supplier gaps". Tested: four slugs in the plan, four named.

5. **F05** (P3) The manifest's `cited_for` lists do not match the README

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/sources.toml`, the `cited_for` arrays of DLB17, CDN20 and CDN23.

   **Claim.** Each list names the sections that cite the work.

   **Witness.** `README.md:190` (§0.2) cites DLB17 Théorème 1.2; DLB17's list lacks "0.2" and "4.7" (`README.md:703`) and has "4.1" and "4.9", which do not cite it. CDN20's list has "0.1", which does not cite it. `README.md:45–55` (Conventions) cites all three; none lists it.

   **Exact repair.** DLB17: add "Conventions", "0.2", "4.7"; remove "4.1", "4.9". CDN20: add "Conventions", "Layer 4" (`README.md:584`); remove "0.1". CDN23: add "Conventions", "Exact supplier contracts" (`README.md:118`), "Layer 5" (`README.md:864`). Tested by listing, per section, the source ids that occur in it.

Five findings: three P2 and two P3. The four findings of the previous round are repaired, and the new §3.3(iii) with its declared gap holds up under the adversarial pass. The findings below are a supplier citation that the supplier's current head no longer supports, one API bullet that is vacuous as written, one proof route that renders its source clause by clause, and two bookkeeping slips. None requires replanning.

## Previous findings checked first

| Previous finding | Repaired passage | Status |
|---|---|---|
| F01 (P1) three period lines without a supplier | `README.md:143`: "What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:three-period-line-globalisation): … three weight-two forms … pairwise non-isomorphic restrictions to G_ℚ_p"; `README.md:542` (§3.3(iii)); `README.md:556–559`; `design/plan.json` `gaps` has the same slug with supplier and section. | **Repaired.** The supplier's §6.4 at its head (line 2278 of its README) gives one form; the contract asks for exactly the missing input. diag(1,2) fixes Le₁, Le₂ and moves L(e₁+e₂) to L(e₁+2e₂); diag(α,β) fixing L(e₁+e₂) forces α=β. |
| F02 (P2) P-finite model restricted to one family | `README.md:289`: "For an L-linear representation Π of P on an L-vector space, define Π^P-fin …"; `README.md:327`: "Let p be any prime, V an absolutely irreducible two-dimensional continuous L-representation". | **Repaired.** DLB17 line 1472 fixes an arbitrary absolutely irreducible V; Définition 7.4 (line 1473) takes v ∈ Π(V). Brackets and Casimir recomputed below. One API bullet of §1.3 is R02. |
| F03 (P3) Check used a non-stable component | `README.md:946`: "The diagonal integral Steinberg classes (μ, μ) … form a G-stable subgroup, since g(μ, μ) = (gμ, gμ)". | **Repaired.** g=diag(5,1), μ=δ₀−δ_∞: gμ=μ, g(μ,0)=(0,μ), g(μ,μ)=(μ,μ). |
| F04 (P2) finite-length factorisation needs a fixed stage | `README.md:1055`: "Fix k ≥ 1 and a continuous G-map φ: P_B → (Y/p^kY)^∨ …"; `README.md:1056`: "Pass to the inverse limit over k and only then invert p". | **Repaired** mathematically (CDN23 lines 2798–2836 support each step). The wording of the repaired route is R03. |

Patterns searched in the rest of the package: a supplier cited for more than it states (found once more: R01); component stability in level-zero Checks (§§3.1, 5.1, 5.4, 6.6: consistent); limit-before-finiteness steps (§§5.3, 5.4: each targets a compact piece or a fixed torsion stage).

## Verified sound

### Coverage, principles, shape

All 1268 lines of the README were read this round, with every *Needs* line. Eight layers named by their mathematics, each with Examples and Dependencies; the introduction says where the base stops; nothing of the base, of the tower geometry or of the type rings is planned again. No algorithm, `set_option`, sorry'd data, pull-request number, date, HTML anchor, machine path or LaTeX delimiter in README, Lean file or manifest. p > 2 (Layer 5) and p > 3 (§§6.5–6.6) are hypotheses of the stated theorems (CDN23 lines 93, 2786 and footnote 32), not route shortcuts; §1.5 and §4.11 are stated at every prime. The README shape was compared with `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `Completed/LocalGaloisGroups/README.md`. No suspicious instruction was met in any text read.

### Seeded source sample

No locator is flagged unverified by the author. All five manifest texts were read from the cache; no fetch was needed and the manifest was not changed.

| Target | Text opened | Checked |
|---|---|---|
| 0.1 | CDN23 lines 2339–2349 (§5, p. 61); DLB17 lines 104–106, 114–116 | ΦN, ΦNᵖ, level ≤ n; Gal(Σ_n/Σ₀) = O_D^×/(1+pⁿO_D), so DLB level r is ϖ_D-level 2r. |
| 1.2 | DLB17 Lemme 6.3 (line 1250), Proposition 6.4 (line 1259), p. 31 | absolutely irreducible, dimension 2, nontrianguline; de Rham added for ∂; (∇−h)(t^h x) = t^(h+1)∂x. |
| 1.3 | DLB17 Définition 7.4 (lines 1473–1499), Remarque 7.5 (1500–1519), pp. 36–37 | both conditions as stated; Remarque 7.5 is for every u(b): R02. |
| 1.4 | DLB17 lines 1522–1534, p. 37 | support compact in ℚ_p, LP_c vanishing near 0, action ε(bx)e^(tbx)φ(ax); local nilpotence of t is the README's own (needed) hypothesis. |
| 2.2 | DLB17 Proposition 9.6 (1946), Théorème 9.7 (1967), Lemme 9.8 (1980), pp. 46–48 | formulas agree; line 1998 gives a one-sided inverse only (E7). |
| 3.3 | DLB17 Remarque 1.3 (159), Théorème 1.4 (232), 2711–2716, Remarque 11.13 (2731–2781); CDN20 343–354, 917–919, 952–954, Prop. 5.2 (1761), Prop. 5.7 (1874); CDN23 Lemme 5.5 (2411–2416) | every new locator of §3.3(iii) supports the sentence it is attached to; DLB17 line 2773 claims a second form only. |
| 4.6 | CDN20 Proposition 2.5, Remarque 2.6, Lemme 2.7 (lines 859–913), pp. 22–23 | (i), (ii), the F = ℚ_p uniqueness, Σκ = [F:ℚ_p]; lines 875–876 print the dimensions in reverse (E14). |
| 4.7 | CDN20 §2.1.5 (917–951), Propositions 2.9 (952), 2.10 (962), pp. 23–24 | W′, ℒ⁻¹ = M*_dR/ℒ^⊥, W; Proposition 2.9 is proved there by citing DLB17 Théorème 1.4. |
| 4.9 | CDN20 Proposition 2.12 (1020), Remarque A.2 (2247); CDN23 Proposition 5.6 (2420), lines 2791–2793 | full level in the sources; the p-central and multiplicity forms are targets here with their own route. |
| 5.2 | CDN23 line 2649, Corollaire 5.17 (2658), Proposition 5.19 (2673), Remarque 5.20 (2691–2715), pp. 69–70 | saturation, smoothness mod p^k, O_L[G′]-finite length, induced topology. |
| 5.4 | CDN23 Proposition 5.21 and proof (2716–2741), lines 2742–2745, pp. 70–71 | statement, the lifting step, m_(n,B)/p^k. |
| 5.6 | CDN23 Remarque 5.23 (2762–2776), p. 72 | finite type sum, level independence by restriction–corestriction after inverting p, inverse central characters. |
| 6.5 | CDN23 Théorème 5.24(ii) (2779–2782), proof (2837–2851), footnote 32 (2861–2868) | statement; local freeness is asserted without proof (E17); p = 2, 3 excluded in the footnote. |
| 6.6 | CDN23 Théorème 0.1 (121), footnote 6 (178), line 93, Théorème 5.15 (2620–2624) | statement, completion, p > 3; line 2624 defines the dual by itself (E11). |
| 7.3 | TEI90 Theorem 5 (177), Corollary 6 (232), lines 251–259, Theorem 8 (298), pp. 73–77; DLB17 2733–2737 | equation over the unramified ring, p−1 components, the curve y^(p+1) = z−z^p, K = ℚ_p²((−p)^(1/(p²−1))). |

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.1 levels | p = 2, 3; χ(p) = 1+p | orders p²−1 = 3, 8; Ǧ/K_D(0) = ℤ, mod p^ℤ: ℤ/2; (1+p)² = 1 iff p(p+2) = 0, so ≠ 1 | holds |
| §1.2 | rank-one trivial; weights {0,1}, h = 1 | ∇1 = 0; (∇−1)(tx) = t∇x = t²∂x | holds |
| §1.3 against base §4.9 | S_n = Σ_(i<pⁿ)u(i) | (u(1)−1)S_n = u(pⁿ)−1, so S_n^k w = 0 gives (u(pⁿ)−1)^k w = 0: the base's two conditions imply the third here | consistent |
| §1.3 API bullet | any v, N ≥ n | (1−u(p^N))^k v = 0 | R02 |
| §1.4 action | g₁g₂ = (a₁a₂, b₁+a₁b₂); c ∈ ℤ_p^× | g₁(g₂φ)(x) = ε((b₁+a₁b₂)x)e^(t(b₁+a₁b₂)x)φ(a₁a₂x); σ_c(ε(bx)e^(tbx)) = ε(cbx)e^(tcbx) | left action, Γ-equivariant |
| §1.5 Lie action | general a, b; (0,1); (1,2); X²−c | [a⁺,u⁺] = t; [a⁻,u⁺] = −t; [u⁺,u⁻] = (∇+1−a)(∇+1−b)−(∇−a)(∇−b) = 2∇+1−k = a⁺−a⁻; Casimir = (k²−4ab−1)/2; values 0, 0, (4c−1)/2; a⁺+a⁻ = k−1 | holds |
| §1.5 operator order | t∂² against ∂²t | t∂² = ∇t⁻¹∇ = t⁻¹(∇−1)∇; ∂²t = t∂²+2∂, which differs by 2∂ | README order right |
| §1.7 unipotent-fixed | bx ∈ ℤ_p; bx = p⁻¹; p = 2 | e^(tbx)−1 = tbx·unit, so tφ(x) = 0; ζ_p−1 a unit (−2 at p = 2), so φ(x) = 0 | holds |
| §2.2 | functions on Ω; w; u(b); aI₂ | g′(g⁻¹z) = (a−cz)²/det g; g∂g⁻¹ = (dz−b)/(a−cz); w: ∂⁻¹ and −∂²u⁺f = z²f′; scalar: 1 | holds |
| §2.4 | k = 1, 2; trivial central character | ω = x⁻¹; Π(M,−1)⊗det has x⁻²·x² = 1; det Δ_(2,ℒ)(p) = p, twist δ₂(p)² = p⁻¹ gives 1; Casimir 0 at k = 1, −1/2 at k = 0 | holds |
| §3.1 Lie formulas | O(k), Ω¹ = O(2)⊗det, duals | a⁺ = u⁺∂+1−k, u⁻ = −∂²u⁺+k∂; on Ω¹′: a⁺ = ∂u⁺, a⁻ = −∂u⁺, u⁻ = −u⁺∂²−2∂ = −∂²u⁺; on O′: a⁺ = ∂u⁺−1 | holds |
| §3.3(ii) uniqueness | A = diag(1,2) | L(e₁+e₂) ↦ L(e₁+2e₂) | line condition needed |
| §3.3(iii) three lines | A fixing Le₁, Le₂, L(e₁+e₂) | A = diag(α,β), then α = β; lines over a finite extension L′ still force a scalar | holds |
| §3.3(iii) injectivity of Φ_i | kernel X^⊥ ≠ 0 | X∩π = 0, X+π dense, strictness gives Π^an = π⊕X; both summands inject into the Banach Π, so both completions are nonzero and Π would be reducible | holds (base §3.11(iii) read) |
| §3.3(iii) weights | supplier convention | Hilbert §R18.3.29 prints ρ_f with {0,1−k} and det ρ_f = ε_pψ; under χ ↦ +1 that is {0,1}; Fil⁰D_dR(ρ_π) has dimension 2, Fil⁰D_dR(ρ_f) dimension 1 | consistent |
| §3.3(iii) residual pigeonhole | fixed k_L | finitely many extensions of degree ≤ \|GL₂(k_L)\|, ℙ¹(L) infinite | residual variation insufficient |
| §4.6 | F = ℚ_p; [F:ℚ_p] = 2 | κ₁+κ₂ = 1 forces {0,1}; (0,0),(1,1) sums to 2 | holds |
| §4.7 | generator e ↦ ae | dual generator a⁻¹e*, product 1; without (iii) the preimage is that of Aℒ | holds with §3.3(iii) |
| §4.9 | z on level zero; constants | u(b)z = z−b unbounded; constants have zero supercuspidal multiplicity (dim JL(M) ≥ 2, Nrd) | holds |
| §§4.12–4.14 (headlines) | d = dim JL(M) | dimensions d, 2d; dimension-3 V gives 0; twist χ(p) = 1+p gives 0 on M^p_n | holds |
| §5.2 | e(L/ℚ_p) = 2 | O_L/p has length 2, k_L length 1 | holds |
| §5.4 Check | p = 5, g = diag(5,1) | g(μ,0) = (0,μ); g(μ,μ) = (μ,μ) | holds |
| §5.6 | M = Sp⊗δ | central character of JL(M) is δ(a²); δ_M = δ⁻², matching (St^cont⊗δ_G)* | holds |
| §6.4 | identity of P_B; ℤ_p/p^k | infinite length; length k, limit infinite | fixed-k step right; wording R03 |
| §§6.5–6.6 (headline) | A = L⟨T⟩, T = 0 | dual = bounded sequences, T = left shift, surjective, kernel L·ev₀: fibre 0, torsion L | holds |
| §7.1 cocycle | g, g′ | a′(a−cz)−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z | holds |
| §7.2 | k = 1, a = p | middle scalar p⁻³p⁴ = p; preimage p⁻¹p² = p; four copies of π′ would give 1 | holds |
| §7.3 | p = 2, 3 | y = ϖ_Ky′: y′^(p²−1)+(z−z^p)^(p−1) = ∏_(ζ^(p−1)=−1)(y′^(p+1)−ζ(z−z^p)); ζ^(2(p−1)) = 1 and 2(p−1) divides p²−1; 1 and 2 factors | holds |
| §7.4 | trivial representation | H¹_e = 0 (D_dR/Fil⁰ = 0), H¹_f of dimension 1 | holds |

### Pinned libraries, Lean, headlines

Pins: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`. Opened: `Bornology.IsVonNBounded` (`Mathlib/Analysis/LocallyConvex/Bounded.lean:61`), `NormedSpace.image_isVonNBounded_iff` (`:495`, inside `namespace NormedSpace` opened at `:454`), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and the image form (`Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, `:679`), `WithSeminorms.banach_steinhaus` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean:164`), `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`), `Module.Basis` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`), `Module.finrank` (`Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`), `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`). Tau Ceti, searched by object: "Kirillov" is the coadjoint form of `TauCeti/Algebra/Lie/Coadjoint.lean`; `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` is an algebraic direct limit of analytic function stages on ℤ_p with no topology and no dual. Neither is a carrier of a headline; the docstring's "lacks" claims hold.

`lake env lean` on the package's `Suggested.lean`, from the content checkout: exit 0, no output. One import, `import Mathlib`. The file declares nothing, so there is no `sorry`, the one-tactic probe and the `#check @name` comparison have nothing to run on, and there is no padding. Headlines (README summary and scope) against the module docstring: §4.14, §§4.12–4.13, §6.6, §3.3, §3.1, §§2.3–2.4, §§7.2–7.3, §7.4, §7.5, §7.6: each is named with the carriers it lacks, and each does lack them at the pins. §4.3 and §6.3 are statable linear algebra but are auxiliary, not headlines. No backticked name of the roadmap's own occurs in the README.

### Suppliers and merge order

Every cited section was located at the supplier's current head with the roadmap tools: PadicLocalLanglandsForGL2Qp (§§0.1, 0.2, 1.1–1.7, 2.5, 2.7, 3.1–3.8, 3.11, 4.1k, 4.2, 4.2a, 4.9, 4.11, 5.1–5.6, 5.8, 5.12, 6.7, 6.9), EndoscopicTransferAndUnitaryTraceComparison (§§12.4, 12.5, 12.7, 12.14, 12.19), ProetaleCohomologyOfPAdicCurvesAndTowers (§§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.5), ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4, LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5, LocallyAnalyticDistributions §§0.0–0.3, LocallyAnalyticDistributionsPartII §§2.2–2.3 (and §1.5: R01), PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7, PadicHodgeTheory §§3.3, 4.4, 5.1–5.4, 8.1, PadicDifferentialEquationsAndRigidCohomology §§RD.1.73, RD.2.43 (its application step is DLB17 Proposition 6.4), GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3, R17.3, CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9, 6.4, HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.3, R18.5.16, R18.5.21, LocalGaloisDeformationRings §3.8, SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3.2. Statements read in full and compared: base §§3.8, 3.11, 4.9, 5.3, 5.12, 6.9; completed cohomology §§4.9, 6.4; Hilbert §§R18.3.29, R18.4.24a, R18.5.21; Proetale §§7.1–7.5; Scholze §5.4; RD.2.43. GL2AutomorphicRepresentationsAndTransfer R17.3.12 also globalises one form only, so the three-form gap is not already provided.

The four declared gaps have a named supplier and section, the same slug in `design/plan.json` and in the README, and a single precise request each; none asks for what a supplier already states. An acceptance after repair stays conditional on them.

Dependency check, full output: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)` (exit 0; no UPWARD, CYCLE or `moved:` line).

Overlaps: no other open pull request changes this roadmap, no cited id is dropped by a revision, no id is defined only by a revision. ProetaleCohomologyOfPAdicCurvesAndTowers assigns "the Breuil–Strauch comparison, the Galois socle, factorisation" to the base §6.9 and this Part II (its README, scope list), and the base §6.9 states no Hyodo–Kato agreement, so §3.3(iii) is owned here. That roadmap's scope sentence identifying the de Rham part of its §7.4 with the base §6.9(iii) presupposes the agreement that §3.3(iii) proves; it is a statement of that roadmap, not of this package.

Overlap check: read PadicLocalLanglandsForGL2Qp, ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower; the comparison at trivial central character: PadicLocalLanglandsForGL2Qp §6.9; Hyodo–Kato and de Rham multiplicities at infinite level: ProetaleCohomologyOfPAdicCurvesAndTowers §7.4; mod p finite length: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; coordinate radius algebras: LocallyAnalyticDistributionsPartII §1.5 (R01); nothing else shared.

### Copyright and arrangement

Passages compared beside the source: §1.2 (DLB17 1253–1256), §1.3 (1473–1499), §1.4 (1522–1534), §3.1(a) (1184–1209), §3.3(iii) and §7.3 (2731–2781), §4.7 (CDN20 917–951), §4.9 (CDN23 2791–2793), §5.2 (CDN23 2691–2715), §5.4 (2723–2741), §6.4 (2791–2836), the §6.6 docstring bullet (CDN23 121–125). Definitions and formulas are forced by the mathematics; §3.1(a), §5.2 and §5.4 are reorganised and carry the roadmap's own steps; §6.4 is R03. Nothing is taken over as a table, figure or list.

DLB17 has the largest share of locators (about 96 of 207). Its chapters are 3 covers and bundles, 4 uniformisation and de Rham cohomology, 5 the equivariant map, 6 differential equations, 7 Kirillov model, 8 Π(π,0), 9 the O(Ω)-module, 10 surjectivity, 11 injectivity, 12 complements. The layers are not that sequence: Layer 1 draws on chapters 6–7 and Layer 2 on 8–9, in the order their *Needs* lines force (§§2.1–2.2 need §§1.1, 1.2, 1.5–1.7); Layer 3 then takes chapters 3, 4, 5 and part of 11; chapters 9–10 belong to the base roadmap; Layers 4–6 rest on CDN20 and CDN23; Layer 7 mixes chapter 12 with COLMEZ19POIDS and TEI90.

Source independence: 11 passages compared with 3 sources, one rendered clause by clause (R03); largest share DLB17, about 96 of 207 locators; contents compared with DLB17: independent.

## Not verifiable

- The four supplier gaps are contracts, not theorems of any text read; their proofs are not certified here.
- Page numbers are those of the cached versions (arXiv v2 for DLB17, the authors' copies for CDN20 and COLMEZ19POIDS, the HAL copy for CDN23); they were not compared with the journal pagination.
- COLMEZ19POIDS locators of §§2.3–2.4 were not among the sampled targets and were not reopened this round; the earlier round records them with line numbers.

## Source issues

- **Gap** in DLB17 at Remarque 11.13, printed p. 66: the source says agreement of two period lines determines the comparison for every line; it should use three distinct marked lines or fix the relative scale of the two extension classes; affects the proof.
- **Gap** in DLB17 at the proof of Théorème 9.7, printed p. 48: the source says the displayed product identity makes a−c∂ invertible; it should also give the other-sided inverse, from the same identity for the inverse matrix; affects the proof.
- **Error** in DLB17 at the introduction, printed p. 3 (DLB17 lines 114–116): the source says the level-zero space over ℚ_p is two copies of the half-plane; it should say so only after the unramified quadratic base change; affects nothing.
- **Misprint** in CDN20 at the proof of Proposition 2.5, printed p. 22: the source says the Hom has dimension 0 or 1 according as the modules are isomorphic or not; it should be 1 or 0 in that order; affects nothing.
- **Gap** in CDN20 at Proposition 0.9 and Proposition 2.9, printed pp. 9 and 24: the source says the line property of the Hyodo–Kato identification follows from the cited theorem at every level; it should prove that the cited isomorphism is the Hyodo–Kato one; affects the proof.
- **Misprint** in CDN23 at Théorème 5.15, printed p. 68: the source says the dual coefficient module is the dual of itself; it should be the continuous L-dual of the type ring; affects nothing.

## For the human reviewers

- **Scope.** The Galois-socle headline (§4.14) now rests on gap:three-period-line-globalisation (`README.md:143`). No cited source states three such forms; DLB17 lines 2773–2775 assert a second form only, and the repair report says no published proof is known.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dc29b98830a72f53bdf68d0f15f0688dd8ce55c0", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~6", "model": "fable", "worker": "chris-x30"} -->
