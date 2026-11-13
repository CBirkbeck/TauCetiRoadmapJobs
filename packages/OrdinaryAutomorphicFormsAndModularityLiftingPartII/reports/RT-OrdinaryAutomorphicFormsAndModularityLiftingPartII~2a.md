<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13074#issuecomment-6849593444 -->
Red team round 2 pass a (claude) of 13242d4

Verdict: needs_changes

1. **F01** (P2) 3.2(b): the torsion of the rank-one relation kernel is determined; the README says it is not

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:346`: "This permits K_tors = 0 or nonzero cyclic torsion; it does not decide which occurs. Determining K_tors … is part of this target"; `:352` (third Check): "Neither case is inferred from global roots of unity."; `:353` (fourth Check): "reciprocity gives x − x = 0, consistent with both x = 0 and a nonzero element of order 2."

   **Claim.** Whether the kernel K of `G_loc × ℤ₂^{h¹} ↠ Γ × ℤ₂^{2#T−1}` has torsion, and whether the diagonal tuple of −1 lies in M_χ, is open and is not decided by global roots of unity.

   **Witness.** Let ζ ∈ µ_{2^∞}(F). Since ζζ^c = 1, Hilbert 90 gives y ∈ F^× with y/y^c = ζ. At a split v the components of y at (ṽ, ṽ^c) are (y_ṽ, ζ⁻¹y_ṽ) = (ζ⁻¹y_ṽ)·(ζ, 1), so the idele a_ζ with ζ at every ṽ (v ∈ T) and 1 elsewhere is y·z·u with z ∈ 𝔸_{F⁺}^× and u a unit outside T (at split v ∉ T, u = (1, ζ); at inert v, F_v/F⁺_v is unramified, so y ∈ F⁺_v^×·O_{F_v}^×; the archimedean components are free). Choosing the signs of z at the real places so that δ_{F/F⁺}(z) = 1, z ∈ F⁺^×·N(𝔸_F^×), and norms die in Γ. Hence Art(a_ζ) = 1 in Γ and (ζ)_{v∈T} ∈ K: K_tors ⊇ µ_{2^∞}(F) ∋ −1 ≠ 0. With the README's own bound d(K) ≤ h² this gives K_tors cyclic and d(K) = h². Instance refuting the fourth Check: T = {v} (one dyadic place): a = a_{−1}, so x = 0 is forced; "a nonzero element of order 2" is impossible. The principal idele to divide by is y (for ζ = −1, y = √−a with F = F⁺(√−a)), not −1.

   In rank n the same computation applied to η = det ρ^univ/det ρ_π (ηη^c = 1 and η(c²) = 1 because det ρ(c²) = (−χ(c))^n is fixed by the multiplier) gives `∏_{v∈T} η_ṽ(Art ζ) = 1`, that is `s_ζ = c_ζ := ∏_{v∈T} det ρ_{π,ṽ}(Art_{F_ṽ} ζ)` in `R^T_{S_χ}` for every diagonal ζ ∈ µ_{2^∞}(F). This is the Galois-side form of the fifth Check of 2.2 ([−1_n] acts by ε₀).

   **Repair.** In 3.2(b) replace "Membership in M_χ must be established using global reciprocity with both places ṽ and ṽᶜ above every v ∈ T; the tuple at the chosen places alone is not a principal idele." by: "For a diagonal tuple ζ ∈ µ_{2^∞}(F) membership is a computation: choose y ∈ F^× with y/y^c = ζ (Hilbert 90); the idele with ζ at every ṽ, v ∈ T, and 1 elsewhere is y times an idele of F⁺ times a unit outside T, and an idele of F⁺ with δ_{F/F⁺} = 1 is a norm times an element of F⁺^×; so for η = det ρ^univ/det ρ_π, `∏_{v∈T} η_ṽ(Art ζ) = 1` and `s_ζ = c_ζ := ∏_{v∈T} det ρ_{π,ṽ}(Art ζ)` in `R^T_{S_χ}`. Define M_χ with these constants (s_ζ − c_ζ ∈ J)." Replace "This permits K_tors = 0 or nonzero cyclic torsion; it does not decide which occurs. Determining K_tors, the map of relation spaces and the pairing …" by: "The diagonal tuples (ζ)_{v∈T}, ζ ∈ µ_{2^∞}(F), lie in K, so K_tors ≠ 0, it is cyclic and d(K) = h²: in rank one a torsion relation is a minimal generator. What remains of (★) is the rank-n statement that the image of such a relation is nonzero in J/m_P J (the map of relation spaces and its pairing with the class of 1.4); that, and not K_tors, is part of this target." In the third Check replace "Neither case is inferred from global roots of unity." by "The second case always occurs: −1 = y/y^c with y = √−a for F = F⁺(√−a) puts the diagonal tuple (−1)_{v∈T} in K." Replace the fourth Check by: "For T = {v}, the idele −1 at ṽ and 1 elsewhere equals √−a·z·u with z ∈ 𝔸_{F⁺}^× of δ = 1 and u a unit outside T (at v the components of √−a are (s, −s) and (−1, 1) = (s, −s)·(−1/s)), so its image in Γ is 0. For #T ≥ 2 the tuple with −1 at one ṽ only differs from this by −1 at the other places of T, which are not units outside T; only the diagonal tuple is forced to 0." Tested on T = {v}: the repaired Check returns x = 0, the value forced above.

2. **F02** (P2) the headline 4.8 is stated unconditionally but rests on inputs the README says no source proves

   **Location.** `README.md:5` (Summary, item 1: "for sufficiently deep tame level its reduced quotient is the localized universal ordinary Hecke algebra"); `:537` (4.8, "prove that … has nilpotent kernel"); `:346` ("(★) is the step the sources do not supply"; "(C) … at v ∈ T ∖ (R ∪ S_2) it is part of this target … Sho18 Theorem 4.6 proves that identity for l > 2 only"); `:544`; `Suggested.lean:17–22`.

   **Claim.** 4.8 and 3.2(b) are theorems the finished roadmap proves.

   **Witness.** I confirmed the source gap: Tho17 line 433 gives h³ = h⁰(ad r̄(1)), CHT08 line 1415 ff. has the term − dim H⁰(G_{F⁺,S}, ad r̄(1)), BCGP25 lines 5568–5569 assert h^i = 0 for i ≠ 1, 2 and line 6051 the bound on s that needs it. So 3.2(a) gives nd only, and 4.8's density step (README l. 539) needs 3.2(b). The route to (b) has two inputs with no proof in any cited source and no route here: (★), and (C) at the places of T ∖ S_2 for l = 2 at the unprepared field, the field at which 4.8 applies it (R = ∅). A component of dimension nd contained in V(ϖ), finite over Λ, carries no ℘_λ.

   **Repair.** Either supply routes for (★) and (C), or state the dependence where the headline is stated. Exact text for the second: Summary item 1, after "Λ": "and, assuming the dimension bound 3.2(b) (BCGP25 Lemma 5.7.7, whose printed proof gives only dim Λ − 1), for sufficiently deep tame level …". 4.8: "If U_v is sufficiently deep (3.5) for every v ∈ T ∖ S_2 and every irreducible component of Spec `R^{T,ord}` has dimension at least dim Λ (3.2(b)), prove that …". `Suggested.lean`, second and third bullets: "(README 4.8 …): assuming the dimension bound of 3.2(b), for sufficiently deep tame level …" and "**The dyadic dimension bound** (README 3.2(b)); its inputs (★) and (C) are not proved in the sources." 4.7 and Layers 5–6 do not use 3.2 and are unaffected (4.5 reads its dimension bound off the patched module: C_X ∩ V(a_∞), Krull, dim S_∞ − (q + (n²+1)#T − 1) = dim Λ; recomputed). A lead, not verified to the end: under H¹(ρ̄(G_F), k) = 0 the exact sequence 0 → k → ad → ad/k → 0 gives (ad r̄/k)^{G_F} = 0, so the complex with trace-zero coefficients, whose Tate dual is (ad/k)(1), has h³ = 0; with S01 this localises the lost relation in the determinant direction and suggests stating (b) under hypothesis (4) of Theorem 5.7.14, the only setting in which it is consumed.

3. **F03** (P3) 3.2(b) does not say which hypotheses its statement carries

   **Location.** `README.md:338–342`: "In the setting of 3.1 … (b) … Every irreducible component of Spec `R_{S_χ}` has dimension at least dim Λ = 1 + nd."

   **Claim.** (b) holds for every datum of 3.1 (ρ̄ only absolutely irreducible, any R).

   **Witness.** The only route offered pairs the relation with "the class of 1.4" (l. 346), which 1.4 itself shows is zero for ρ̄ induced from `G_{F·L⁺}` (l. 219); (C) is argued only "after the preparation of 4.1"; the only consumer is 4.8 with R = ∅ and hypotheses (1)–(6). GSp4NonregularModularityLifting cites "§§3.1–3.2 … the ordinary global problem with its dimension bound" under the six hypotheses.

   **Repair.** State (b) as: "(b) Assume moreover R = ∅ and H¹(ρ̄(G_F), k) = 0 (in particular hypotheses (1)–(6) of Layer 4). Then every irreducible component of Spec `R^{T,ord}` has dimension at least dim Λ = 1 + nd." and keep "the general case of 3.1 is not claimed" as a Check with the dihedral datum of 1.4 as the instance where the route gives nothing.

4. **F04** (P3) "the same request" as PotentialAutomorphyInfrastructurePartII is not the same sentence

   **Location.** `README.md:20` ("the same request PotentialAutomorphyInfrastructurePartII makes") and `:99` ("PotentialAutomorphyInfrastructurePartII records the same request").

   **Witness.** PotentialAutomorphyInfrastructurePartII, contract on GlobalGaloisDeformations, at its head: "(gap:two-adic-polarized-presentation): Tangent, obstruction and presentation formulas … at `p = 2`, with strongly residually odd complex conjugations and `F/F⁺` unramified at every finite place (Tho17, §§2.1–2.15)". The sentence here adds representability, the framed torsor and h³, and drops "strongly residually odd"; 1.2(1) and 1.2(5) use the complex when r̄(c_v) is conjugate to (Ψ_n, 1)j.

   **Repair.** Replace both phrases by "PotentialAutomorphyInfrastructurePartII declares the same slug for strongly residually odd complex conjugations; the sentence here is the fuller one (no oddness hypothesis, with representability, the framed torsor and h³) and is the one GlobalGaloisDeformations should answer."

Round 2. Part 1 verifies the fourteen round-1 findings at this head; Part 2 is the new pass (findings S01–S04). Files read in full: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` (796 lines) and `Suggested.lean` (42 lines).

## Part 1 — round-1 findings at this head

| Id | Status | Witness at this head (README line, quoted) |
|---|---|---|
| 1a/F01 (P1) base change and reasonableness | repaired | 5.2, l. 591: "if moreover ζ_p ∈ LF′ only when ζ_p ∈ L, then `ρ̄|G_{F′}` is GSp₄-reasonable whenever ρ̄ is"; negative control l. 595. Recomputed: h = (diag(2,3),1)σ has h² = (g,g), characteristic polynomial (X²−2)(X²−3), order 8; 𝔷_h ∩ A is the line {(X,X) : X ∈ Cartan}; F′ ∩ E(ζ_{p^∞}) = F gives both conditions. 5.4 l. 625 carries the same hypothesis. |
| 1a/F02 (P3) degree-three example | repaired | 4.3 l. 473: "With two dyadic places of degree 4 (d = 8 …) and q = 7 … 37 … g = 7 + 3 − 1 − 8 = 1 and both patched dimensions are 38 = 17 + 7 + 14". Recomputed 1 + 12 + 24 = 37, 37 + 1 = 38, 17 + 7 + 14 = 38; l. 551 agrees. |
| 1a/F03, 1b/F01 (P1/P2) ψ can vanish | repaired | 1.4 l. 211: "Prove moreover that if `ρ̄|G_{F·L⁺}` is absolutely irreducible, then ψ ≠ 0"; dihedral Check l. 219; Corrections l. 764. Recomputed: ∂X = ψ with X fixed by G_{F·L⁺} forces X scalar, ∂(scalar) = 0. |
| 1a/F04 (P2) weights | repaired | l. 115 and 5.4 l. 619: "either regular algebraic … 0 ≥ k_v ≥ l_v and k_v + l_v even … or of weight 2 in the sense of BCGP25 Definition 1.8.16"; plan gap has the same sentence. BCGP25 lines 458, 467, 636–638 agree. |
| 1a/F05 (P2) reducedness of `T_{S_{1,π}}` | repaired | 6.3 l. 713: "so `(R_{S_{1,π}})_red ≅ (T_{S_{1,π}})_red`"; model l. 722 (recomputed: xy ↦ z²(z−u) = 0, T/(z²) = Λ[z]/(z², uz)); Summary item 2 and Corrections l. 778. |
| 1a/F06 (P1) non-distinguished dimension | repaired | 6.2 l. 698: "Nothing is claimed about the dimension of R^·_∞ itself"; l. 700 argues depth = dim S_∞ through S_∞, Ass and End_{S_∞}; count 14d + 10(#S − d) + g = 11#S + t − 1 recomputed; WHI22 line 3315 gives g = t − 4[F:ℚ] + #S − 1. |
| 1a/F07 (P3) balanced patching prime | repaired | l. 106: "allows every prime p, including 2, and either coefficient characteristic"; DeformationAndDerivedPatchingAlgebra §5.5 at its head says "for any prime `p` and in either characteristic". |
| 1a/F08 (P3) 5.5 Checks | repaired | l. 648–652, three tests on B = O⟦x,y⟧/(xy); recomputed (the k[ε]-point x ↦ ε does not kill x). |
| 1a/F09 (P3) odd-prime Check | repaired | 1.2 l. 191: "vanishes when `Hom_{G_F}(ρ̄, ρ̄ ⊗ ε̄) = 0`"; recomputed RAR⁻¹ = SAS⁻¹ = −A, −23 ≡ −47 ≡ 1 mod 8 and mod 3, 23·47 = 1081. |
| 1b/F02 (P1) Taylor–Wiles level structures at l = 2 | repaired | new target 3.6 (l. 406–423) with (1)–(3), route and four Checks; 4.3 route and *Needs* cite it. No new error found in 3.6 (table in Part 2). |
| 1b/F03 (P2) two owners of the O-coefficient dyadic theory | repaired, one residue | Scope l. 12, 20 and contract l. 99 declare gap:two-adic-polarized-presentation; plan `gaps` has the slug. Residue: S04 below. |
| 1b/F04 (P2) compound gap | repaired | l. 92–93, two gaps; plan `gaps` has both; 3.2(a) cites the first, 3.2(b) the second. |
| 1b/F05 (P3) §2.24 → §2.13 | repaired | l. 87, 344, 469; LocalGaloisDeformationRings §2.13 at its head: "`R□` is reduced, flat and a local complete intersection of pure relative dimension `d²`". |

No repair introduced an error that I could find, except that the rewritten 3.2(b) text and Checks (rounds before the red team) contain the statement refuted in S01.

## Part 2 — new findings

## Running table — Suggested.lean

| Declaration | Section, variables, instances | Result |
|---|---|---|
| (none) | module docstring and an empty `namespace TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII` | 0 declarations; single `import Mathlib`; no `set_option`, `lemma`, `#eval`, sorry'd data. The `#check @name` audit has nothing to elaborate; nothing changed. |

Headlines listed from the README: 4.7, 4.8, 3.2(b), 6.3, 6.4, 5.3, 1.2(4). Each is named in the docstring with the carrier it lacks (deformation rings of 𝒢_n- and GSp₄-valued representations with local conditions, RACSDC and GSp₄ automorphic representations, algebraic modular forms on a definite unitary group, `G_{F,S}` with decomposition groups, dual Selmer groups): none exists at the pins (grep of the pinned Mathlib and Tau Ceti for `DeformationRing`, `Hida`, `Adequate`, `AutomorphicRepresentation`, `TaylorWiles`: no file). No statable headline is absent; no padding. The docstring's wording of 4.8 and 3.2(b) is covered by S02.

## Running table — README targets, values computed

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, Frobenius | p = 7, q_v = 2 | 2⁻¹ ≡ 4 mod 7 ≠ 2 | pinned |
| Conventions, characters at ℚ₃ | O = ℤ₂ | ℚ₃^×(2) = C₂ × ℤ₂; ℤ₂[C₂] = ℤ₂[u]/(u² + 2u); H² = H⁰(k(1)) = k | not smooth, as stated |
| Conventions, dim Λ | n = 2, d = 2 split | T(l) = (1 + 2ℤ₂)⁴, rank 4, dim 5 | = 1 + nd |
| 1.1 framing | n = 4, #T = 3 | 17·3 − 1 = 50; centralizer {(µ, µ²)} of rank 1 | consistent |
| 1.1 conjugation by (1, a) | γ = (B, b)j | (1,a)γ(1,a)⁻¹ = (a⁻¹B, b)j; (µ,1)γ(µ,1)⁻¹ = (µ²B, b)j | µ² = a⁻¹; a = 1 + ε not a square |
| 1.2(2)–(4) Euler count | n = d = 2, #T = 3, q = 5 | χ = 1 − 3 − 5 + 2 = −5; h¹ = 0 + 1 − 1 + 5 = 5 = g | agrees with Tho17 line 614 |
| 1.2(5) | B = 1₂; B = Ψ₂ | 1 ∈ {Y + BᵗYB⁻¹} iff B alternating: no; yes | as stated; last term H²(ad r̄) by the five-term sequence |
| 1.3 (1)⇔(3)⇔(U) | H = {1}; GL₂(𝔽₂) | U = ad⁰ (dim 3); span{1, A, A²} of dim 2, U of dim 2 with no invariant line (tr A = 1) | U simple; equivalence consistent |
| 1.3 near = relaxed adequacy | k ⊇ eigenvalues | e_{g,α} ∈ k[g]; U = U_k ⊗ k̄ | agrees with PotentialAutomorphyInfrastructurePartII §5.4 |
| 1.4 choice of m | F⁺ = ℚ(√2), ℚ(√5) | m = 4, L⁺ = ℚ(ζ₁₆)⁺; m = 3, L⁺ = F⁺(√2) | least-m choice works |
| 1.4 membership | n even; n odd | pairing = n·(Hilbert symbol) = 0; symbol of two classes unramified at v ∤ 2, F split at v | 2 | ψ_v ∈ µ_v^⊥ |
| 2.1 first Check | K, I ⊂ GL₂(ℤ₂), a = diag(2,1) | indices 3 and 2; disc ℚ(√−7,√−15) = 105², −7 ≡ −15 ≡ 1 mod 8 | as stated |
| 2.1 second Check | X² − X + 2 | 27² − 27 + 2 = 704 = 22·32; 36 − 6 + 2 = 32; 27 + 6 ≡ 1, 27·6 ≡ 2 mod 32 | roots as stated |
| 2.1 sixth Check | n = 2, λ = (1,0) | (w₀λ)(α¹) = ϖ^{λ₂} = 1; (w₀λ)(α²) = ϖ¹ | as stated |
| 2.2(1) against fifth Check | b₀ = 1 with all U_v ∋ −1 | −1 ∈ G(F⁺) ∩ tUt⁻¹, so the level is not sufficiently small and (1) does not apply; with torsion-free U_{v₁} the Check's hypothesis fails | no contradiction; sign (−1)^{dn(n−1)/2} = 1 for nd ≡ 0 mod 4 |
| 3.1 multiplier | n = 3, 4 at c_v | (−1)^{1−n}(−1)^n = −1 | as 1.1 requires |
| 3.2(a) | n = d = 2, #T = 3 | 19 + (−1) = 18; 18 − 14 = 4 = dim Λ − 1 | matches CHT08 Corollary 2.3.5 with h⁰(ad r̄(1)) = 1 |
| 3.2 rank one | n = 1 | (1 + #T + d) + (#T − 2) − (2#T − 1) = d; dim O⟦Γ⟧ = 1 + d | K_tors: S01 |
| 3.2 det multiplier | x = (g, a)j | ν(det x) = −aⁿ = (−1)^{n+1}ν(x)ⁿ | as stated |
| 3.4, 3.5 Checks | n = 1, q ≡ 1 mod 4 | order-4 characters of k^× are ≡ 1 mod ϖ, conductor 1 | O^× not deep, 1 + ϖO deep |
| 3.6 Checks | Q = ∅; n = 2, d_ṽ = 1; q_ṽ = 17, 3 | identity; projection of rank 1 on a 2-dimensional space; ℤ/16, ℤ/2 | consistent with (1)–(3) |
| 4.1 | F′ = F(√a), F = F⁺(√−a) | F′ = F′⁺(√−1); at v | 2, √−1 ∈ F′⁺_v since −a and a are squares there | hypothesis (2) survives |
| 4.2 | q = j = 0; dim R_∞ = dim S_∞ + 1 | H free over Λ; depth ≤ dim S_∞ < dim R_∞ | as stated; S⁰_∞ regular, §5.5 first part applies |
| 4.3 dimensions | (n,d,#T,q) = (2,2,3,5), (2,8,3,7), (2,8,3,8) | 24 = 24; 38 = 38; 39 = 39; q = 5 at d = 8 gives g = −1 | formula consistent |
| 4.5 Krull step | C_X ∩ V(a_∞) | Spec R_{S_1} ∩ C_X ⊂ V(a_∞) ∩ C_X = Supp H_1 ∩ C_X ⊂ Spec R_{S_1} ∩ C_X | equality holds; dim ≥ dim Λ without 3.2 |
| 4.8 density | Z a component, finite over Λ/Q | closure of the points over the ℘_λ maps onto Spec Λ/Q, so has dim Z | needs dim Z = dim Λ: S02 |
| 5.1 | #T = 1, 3 | 10, 32 variables; conjugacy via B¹(𝔤𝔰𝔭₄) ∩ Z¹(𝔰𝔭₄) for every p | as stated |
| 5.2 first Check | p = 5 | det diag(2,3) = 1; H¹(H, A) = H¹(SL₂(𝔽₅), 𝔰𝔩₂) = 𝔽₅ | as stated |
| 5.2 third Check | H_n ∩ Sp₄(𝔽₃) | normal of 3-power index in a perfect group | H_n ⊇ Sp₄(𝔽₃) |
| 5.4 third Check | 𝔽₃, U = [[1,1],[0,1]] | hJᵗh = J; [h, X] = 2E₁₂ + E₄₃; Z = h − h⁻¹ = 2E₁₂ + E₄₃ ∈ 𝔰𝔭₄ | as stated |
| 5.4 w₀ | ν(h) = q^{±1} | ratios closed under inversion | (6) follows from tidiness |
| 6.1 | Λ_{GSp₄,v} = O⟦x,y⟧ | finite torsion-free over a domain: lying over | hypothesis of Lemma 6.2.6 (BCGP25 lines 6698–6712) |
| 6.2 | F⁺ = ℚ, #S = 3, t = 7 | g = 5; 5 + 30 + 4 = 39 = 7 + 33 − 1 | as stated |
| 6.3 steps (i)–(v) | component W of Supp of dim S_∞ through a point on one component D of dim S_∞ | W ⊂ D and equal dimensions give W = D | route sound given the gaps |

## Dependency check

`tauceti-roadmap … gate --depcheck packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md --name OrdinaryAutomorphicFormsAndModularityLiftingPartII --order merge-order/ORDER.txt --movable --content … --pr 13074` printed `depcheck: 206 roadmaps, 1908 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.

## Ownership and overlap

- `scratch/overlaps.md`: no open pull request changes this roadmap, no dropped id, no second copy (checked: the folder is not on main).
- GSp4NonregularModularityLifting (later in the order) cites §§1.3, 2.1–2.2, 3.1–3.2, 4.7–4.8, 5.2, 5.4–5.6, 6.3–6.4 of this roadmap; all exist with those contents. Its contract asks for 3.2 "with its dimension bound" under the six hypotheses (S03).
- For the maintainer, outside this package: AbelianSurfacesModularity (later in the order) asks ArithmeticGaloisRepresentations §7.9 for Whitmore's reasonableness (gap:near-adequacy-reasonableness) although 5.2 here owns it; the README's sentence "defined nowhere else" is still true (`roadmaps grep -i reasonable`: no other definition), and the duplication is to be settled in AbelianSurfacesModularity.
- "near adequacy": no other roadmap states it (`roadmaps grep`). 3.6 against PotentialAutomorphyInfrastructurePartII §4.2: that section "Keep Layer 3", l odd; 3.6 imports its definitions by name and states the l = 2 ordinary case only.

## Verified sound

- Declarations read: 0 (the file has none); module docstring read in full.
- Targets read: 30 (1.1–1.4, 2.1–2.3, 3.1–3.6, 4.1–4.8, 5.1–5.6, 6.1–6.4), with the Conventions, the contracts and the 23 Corrections.
- Round-1 findings re-verified: 14 of 14 repaired (table above).
- Locators verified against the cached texts (56: 45 read at the passage, 11 located by statement and page only): BCGP25 §5.4 (lines 5500–5571), (5.4.1)–(5.4.3), Remark 5.4.4 and (5.4.5) (5572–5605), Definition 5.5.2, Lemma 5.5.3 and proof (5640–5687), Proposition 5.5.6 and proof (5694–5760), Definition 5.3.3 (5426–5430), Lemma 5.7.7 (6044–6059), Proposition 5.7.9 (6060–6075), Lemma 5.7.12, Definition 5.7.13, Theorem 5.7.14 and its whole proof (6088–6302), (5.7.4), (5.7.16)–(5.7.17), §1.8.7–1.8.8 (455–470), Theorem 1.8.13 weights (604–616), Definition 1.8.16 (636–638), Lemma 6.2.6, Hypothesis 6.3.1, Remarks 6.3.2–6.3.3, Theorem 6.3.4 and proof (6596–6746), Remark 8.2.3; Tho17 Lemmas 2.12, 2.13, 2.15–2.17, Corollary 2.14, Lemma 2.19, Definition 2.20, Proposition 2.21 and proof (lines 300–644); WHI22 (3.5), Lemma 3.14, Definition 3.15, Lemma 3.16, Proposition 3.18 and proof, Definition 3.19, Lemma 3.20 (936–1077), Lemma 7.10 and g (3299–3320); Ger19 Lemma 2.3.3, Lemma 2.4.4, Corollary 2.5.4, Proposition 2.7.2 (statement), Lemma 3.2.3 (existence and page); CHT08 Corollary 2.3.5 (1415–1432); existence of Tho12 Propositions 5.9, 5.12, Lemmas 5.10–5.11 (pp. 24–30), KT17 Proposition 3.1, Tay08 Lemma 2.3, BLGGT14 Lemma 1.2.3, BLGHT11 Lemma 3.3, Sho18 Theorems 2.5 and 4.6 (l > 2), KW09 Lemma 9.4.
- Checks: all 116 Check bullets read against the statements of their sections; those with computable content were recomputed, with the values in the table above (35 rows).
- Definitions with at least three discriminating Checks: 1.1 (4), 1.3 (3), 2.1 (6), 3.1 (3), 3.5 (3), 5.1 (3), 5.2 (4), 5.4 (5), 5.5 (3).
- Sibling citations checked at the cited heads (84 section and target ids, by heading; the ones marked read were read in full): PotentialAutomorphyInfrastructurePartII §§0.2, 0.9, 1.3, 3.1, 3.2, 3.5, 3.6, 3.9, 3.11, 4.1, 4.2, 4.4, 4.6, 5.2, 5.4 (titles as quoted in the README; §4.4 states h³ = 1; §5.4 relaxed adequacy as quoted); LocalGaloisDeformationRings §§1.3, 1.4, 1.9, 1.17, 2.13, 2.17, 2.22, 2.23, 2.24, 2.29, 6.24, 6.27, 6.29, 6.35, F.2.6 (§§2.13, 2.22, 2.29, 6.24, 6.35 read in full: they state what the contract says); GlobalGaloisDeformations §§3.3, 4.2, 4.8–4.11, 8.1–8.4 (§8.1 "take `p` odd"); DeformationAndDerivedPatchingAlgebra §§1.12, 4.1, 4.2, 4.6, 5.2–5.5, 6.1, 6.3, 6.5, 6.7, Layer 8 §§8.2–8.5, 9.6 (§5.5 read: first part as quoted); AutomorphicGaloisRepresentationsPartII AG2.2, AG2.3, AG2.5 and the four named targets, and *GSp₄ construction and normalization*; AutomorphicBundles Layer 12, §§12.11–12.13 (its own table gives B5.n = 12.(n+1), so "formerly B5.10–B5.12" is right); SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.2, SR.3.4; AutomorphicFormsOnReductiveGroups §§7.4, 7.5; ArithmeticGaloisRepresentations §§7.4, 7.5, 7.9, 7.11; PotentialAutomorphyInfrastructure §§2.5, 3.44, 3.47; PotentialModularityAndCompatibleSystems §2.16; ModularityAndLanglandsExtensions §3.9; EndoscopicTransferAndUnitaryTraceComparison §13.2. Every supplier named is earlier in the merge order; the two later roadmaps are named as consumers only.
- Declared gaps: the nine slugs of the README are the nine of `design/plan.json`, each with a supplier and a section that exists at the supplier's head; none has supplier `none`. Not raised, as the brief directs.
- Pinned declarations of the contracts, at the pins: `Matrix.trace` and `Matrix.trace_one` (`Mathlib/LinearAlgebra/Matrix/Trace.lean`), `Module.End.IsSemisimple` (`Mathlib/LinearAlgebra/Semisimple.lean`), `Matrix.symplecticGroup` (a `Submonoid`, `Mathlib/LinearAlgebra/SymplecticGroup.lean`), `LieAlgebra.Symplectic.sp` (`Mathlib/Algebra/Lie/Classical.lean`), `groupCohomology` (file present), `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`): all present as described.
- Policy: the pull request changes only the package folder (README, plan gaps, reports); no pull-request number or process narrative in the README or docstring; no `lemma` declaration; every target has a locator; no algorithm.

## Not verifiable

- (★) of 3.2(b) in rank n and (C) at the places of T ∖ S_2 for l = 2: neither proved nor refuted (S01 settles only the rank-one torsion and the membership of the diagonal tuples). The lead in S02 (trace-zero complex with h³ = 0 under H¹(ρ̄(G_F), k) = 0) was not carried through the 𝒢_n-formalism with the classes µ_v.
- The interior of Ger19 §§2.2–2.6 at l = 2 ("no step uses the parity of l") and of Tho12 §5 at residue characteristic 2: statements and pages located, proofs not reread line by line.
- The 4.7 factorisation `R′_{L/F,T′} → R^{T,ord}` through the union of the C′_Y: I checked it on underlying sets (which is all finiteness and 4.8 use: R^□ away from 2 is reduced and O-flat by §2.13, and V(Q, ϖ) = V(ϖ) in Spec R^△_v); the scheme-theoretic statement for a possibly non-reduced `R^{T,ord}` is not justified in BCGP25 or here, and is not needed.
- Corrections to BCGP25 (5.7.3), the tensor product defining M_λ and §5.6.1 (pp. 129–131): not opened in this pass.
- The gaps on AutomorphicBundles and AutomorphicGaloisRepresentationsPartII (BCGP21 §§7.8–7.9 over a general totally real field): declared contracts; the mathematics behind them was not checked.
- Lean elaboration was not run (no command is given in the brief for this pass; the file has no declarations).

## Source issues

- **Error** in BCGP25 at §5.4, printed p. 123 (line 5569): the source says the cohomology of Thorne's complex vanishes outside degrees 1 and 2 when T is nonempty; it should be h³ = h⁰(F(S)/F⁺, ad r̄(1)) = 1 at p = 2 (Tho17 Lemma 2.15); affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed pp. 133–134: the source says the relation count is at most n²#T + [F⁺:ℚ]n(n−1)/2 by the argument of CHT08 Corollary 2.2.12; it should be one more, since h⁰(ad r̄(1)) = 1, giving only dim Λ − 1; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, statement, printed p. 133: the source says dim Λ = 1 + [F:ℚ]n; it should be 1 + [F⁺:ℚ]n, as (5.7.17) uses; affects nothing.
- **Gap** in BCGP25 at Lemma 5.5.3, printed p. 125: the source says the scalar class gives a dual Selmer class for every global problem and proves only membership; it should assume ρ̄ absolutely irreducible over F·L⁺ for nonvanishing; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.5.3, proof, printed p. 125 (line 5645): the source says one may assume F⁺ lies between two consecutive real cyclotomic 2-power fields; it should take the least m with K⁺_m not inside F⁺; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.5.3, proof, printed p. 126 (lines 5680–5682): the source says the class comes from L/L⁺ and that L⁺/L is unramified outside 2; it should be L⁺/F⁺ in both places; affects nothing.
- **Misprint** in BCGP25 at Remark 5.4.4, display (5.4.5), printed p. 124: the source says the last term is H² of F(S)/F⁺ with coefficients k; it should have coefficients ad r̄; affects nothing.
- **Gap** in BCGP25 at Remark 5.4.4, printed p. 124: the source says surjectivity follows from injectivity into H² of a real place with trivial coefficients; it should use coefficients ad r̄, where injectivity needs r̄(c_v) of non-alternating type; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6 (i), printed p. 126, and in Tho17 at Proposition 2.21 (i), printed p. 14: the source says µ(c_v) = −1; it should be χ(c_v) = −1, χ the multiplier of the problem; affects nothing.
- **Gap** in BCGP25 at Proposition 5.7.9, printed p. 134: the source says a maximal ideal with residual representation ρ̄ exists for every level hyperspecial off T; it should assume fixed vectors of π at the places of T outside R and above 2; affects a stated result.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 137 (line 6229): the source says Spec R_X lies in the support of the primed patched module; it should be the unprimed module H over F; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 138 (line 6261): the source says T is replaced by R′ and the new auxiliary place; it should also contain the places above 2; affects nothing.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, printed pp. 135 and 139: the source says the map from the ring over L exists by the choice of L; it should first arrange that lifts at T outside 2 become unipotently ramified (Lemma 5.6.2); affects the proof.
- **Gap** in BCGP25 at Theorem 6.3.4, printed p. 148 (line 6696): the source says nilpotent kernel means the reduced deformation ring is the selected Hecke quotient; it should be the reduced quotient of that Hecke ring, a tensor product not known to be reduced; affects a stated result.
- **Misprint** in BCGP25 at §6.3, printed p. 147: the source says the unramified characters take the values α_p and β_p at Frobenius; it should be α_v and β_v; affects nothing.
- **Gap** in WHI22 at Proposition 3.18, printed p. 22 (arXiv v3, lines 1013–1016 against 1001): the source says the trace condition and the conditional H¹ vanishing suffice; it should also assume the H⁰ vanishing that Lemma 3.16, used in the proof, requires; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "13242d494db4a8d31330fe687585b1a3d0706219", "job": "RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2a", "model": "fable", "worker": "chris-x8"} -->
