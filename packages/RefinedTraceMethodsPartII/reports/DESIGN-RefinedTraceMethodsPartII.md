# DESIGN-RefinedTraceMethodsPartII: design report

Deliverables: `packages/RefinedTraceMethodsPartII/design/README.md` (nine layers, 41 targets), `packages/RefinedTraceMethodsPartII/design/plan.json` (same plan as data, two gaps), `packages/RefinedTraceMethodsPartII/sources.toml` (15 sources, `sources check`: 0 problems). Parent: RefinedTraceMethods. Baseline pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## What the design covers

| Final target (target.md) | Where | Status |
| --- | --- | --- |
| 1. NS calculus for pointed-monoid algebras: splitting, rational version, cell computation, Tate comparison, Frobenius on cells | §§2.1–2.4, 3.1–3.6 | Planned. The cell computation is done over every perfectoid ring, not only perfect 𝔽_p-algebras, because target 5 needs it there (riggenbach-double Corollary 5.8, Lemma 5.13). The Tate comparison is corrected (see "Source defects"). |
| Cell decompositions for axes and cusp cyclic bar constructions | §§2.5–2.6 | Planned. The cusp mixed complex is hn-cusp Theorem 1, a restatement of the uncertified bach-hypersurfaces and larsen-mixed. |
| 2. Axes in the plane (Theorems A and B) | §§5.1–5.2 | Planned. Theorem A is stated in its p-typical form, which is the same group. Big de Rham–Witt complexes have no owner and are not needed. |
| 3. Axes in affine d-space, char p and char 0 | §§5.3–5.4 | Planned. The p = 2 odd-degree formula is corrected (see below). |
| 4. Planar cusps | §§6.1–6.2 | Planned. The birelative statement holds for every perfect 𝔽_p-algebra without gaps. The relative statement uses SchemeKTheoryOperations §5.2 for regular noetherian (for example perfect-field) k, and gap `perfect-homotopy-invariance` otherwise. The big-Witt form uses gap `bigwitt-ptypical-decomposition`. |
| 4, "optional consequence" (rational cusps) | none | Left out. It needs the cyclic homology of cusp algebras over ℚ-algebras, which no source in the manifest proves and no supplier provides. Recorded as motivation for a later Part. |
| 5. Truncated polynomials over perfectoid rings | §§7.1–7.2 | Planned. KTheoryFiniteLocalFields §5.17 (perfect fields) is a Check. The F-smooth extension (riggenbach-trunc Theorem 1.2) is left to a later Part: it needs Nygaard-dimension theory and the ideal sheaves I_r over F-smooth rings, beyond any supplier. |
| 6. Finite chain rings (a)–(d) | §§9.1–9.6 | Planned, with the relative and filtered prismatic package in Layer 8. |

Indexing arithmetic (cusp counts, Sylvester's count, cyclic words, the axes and cusp index functions, chain-ring exponents) is Layer 1. Its definitions are statable on Mathlib's `ℕ`, `Finset`, `Nat.divisors` and `ArithmeticFunction.moebius`. These are the natural carriers for the eventual `Suggested.lean`: cusp counting function, truncation set, Sylvester's count, the cyclic-word formula, the even-vanishing threshold. The K-theoretic headlines need THH/TC/K carriers that are absent at the pins, exactly as in the base roadmap.

## Notions moved down from later roadmaps

None. No notion is taken from a roadmap later than RefinedTraceMethods. GeneralAlgebraicKTheoryPartII (later) appears only as a consumer and in the scope paragraph that names it as owner of purity.

## Ownership decisions

- **Relative and filtered prismatic cohomology over δ-rings (Layer 8).** `roadmaps grep` over main and all 367 open heads found no owner. The patterns were δ-pair, relative to a δ-ring, filtered prismatic, crystalline degeneration and Antieau–Krause–Nikolaus. Neither did grep over the board packages (only this package's target.md matched). PrismaticCohomology Part II–IV were read section by section: Part IV is logarithmic, and none of the parts treats δ-pairs or filtered rings. This roadmap is the owner, and it plans the package only as far as Layer 9 uses it.
- **Staircase lemma, circle-orbit identity, suspension invariance, Tate comparison for finite C_p-complexes (Layer 3).** They are specific to trace calculations, and none of RefinedTraceMethods' sections states them (§§2.3, 2.4, 2.10, 4.19 were read). The circle-orbit identity is stated for the circle and its finite subgroups only, the generality all uses need. The compact-Lie version of hn-cusp Proposition 3 would need parametrized Atiyah duality for compact Lie groups, which belongs to an equivariant-homotopy roadmap.
- **Restriction to the coprime part (§1.2).** A small big-Witt lemma used only for the cusp and truncated-polynomial quotients. QWittVectors §§1.1–1.5 do not state it. It is planned here at the generality of several moduli n_i.
- **Pointed-monoid algebra.** Mathlib has `MonoidAlgebra` but no contracted algebra of a monoid with zero. It is defined here as a quotient. No roadmap defines it: grep for pointed monoid algebra and contracted algebra found only KTheoryFiniteLocalFields §5.16, which uses the classical genuine model without an algebraic definition.
- **Ownership against open PRs** was checked with `roadmaps grep` (index of 2026-10-26T02:55:30Z, refreshed 03:27:45Z), which covers every open roadmap PR head. The board packages were checked by grep over `packages/*/design/README.md` and `packages/*/target.md`.

## Proposed Part IIs and later Parts

- **QWittVectors, Part II**: the p-typical product decomposition of `W_S(R)` over ℤ_(p)-algebras, with V, F compatibilities (gap `bigwitt-ptypical-decomposition`).
- **SchemeKTheoryOperations, Part II**: cdh descent for K-theory of perfect schemes and `K ≃ KH` for smooth algebras over perfect 𝔽_p-algebras (amm-perfectoid Proposition 5.1 and Theorem 4.4), giving gap `perfect-homotopy-invariance`.
- **RefinedTraceMethods, Part III** (motivation, not planned): the F-smooth truncated-polynomial theorem (riggenbach-trunc Theorem 1.2). Also cusps over perfectoid bases and their formal analogues (riggenbach-cusp Theorems 1.1–1.5), Hesselholt's long exact sequence for cusps over regular 𝔽_p-algebras (hesselholt-cusp-polytopes Theorem A, now unconditional by Angeltveit), and the rational cusp calculation.

## Gaps

| Slug | Supplier, section | What is missing | Needed by |
| --- | --- | --- | --- |
| `bigwitt-ptypical-decomposition` | QWittVectors §1.5 | `W_S(R) ≅ ∏_{d∈S∩J_p} W_{s_S(d)}(R)` for ℤ_(p)-algebras, compatible with restriction, V, F | 6.2, 7.2 (passage from p-typical answers to big-Witt statements) |
| `perfect-homotopy-invariance` | SchemeKTheoryOperations §5.2 | `IK(A) ≃ IK(A[T])` for perfect 𝔽_p-algebras A | 4.4, 6.2 (relative vs birelative K for cusps over non-noetherian perfect bases) |

The target.md route for target 2 cited "GeneralAlgebraicKTheory §§9.16, 10.5, 10.13" for NK = 0 on regular rings. Those sections give the Fundamental Theorem with Nil terms and negative K of regular rings, not the vanishing of NK. The vanishing is SchemeKTheoryOperations §5.2, which is now cited.

## Source defects found and how the design handles them

1. **speirs-axes Theorem 1, p = 2, odd degrees** (line 64; §5.1, lines 1096–1116). As printed, `K_{2r+1}(A_d,I_d) = ∏_{m′ odd} ∏_{s′|m′} ∏_{0≤v≤t_ev} k^{cyc_d(s′)}`.
   - Read literally, at d = 3 and r = 0 it gives a nonzero K_1 from every odd m′ ≥ 3, an infinite product. Milnor's Mayer–Vietoris sequence for the Milnor square `A_d → B_d`, `k → k^d` gives `K_1(A_d) = k^×`, so `K_1(A_d,I_d) = 0`.
   - Recomputing from the paper's own inputs gives one copy of `k^{cyc_d(s′)}` for each odd m′ ≤ 2r + 1. The inputs are Proposition 28 (all groups k in odd degrees; the v = 0 homotopy fixed points are k exactly in odd degrees ≥ m′) and Corollary 17 (Frobenius iso in degrees ≥ length). The recomputation uses the staircase lemma with s = t_od(2,r,m′).
   - Cross-checks: K_3(A_3,I_3) = k² for p = 2, 3, 5, and K_5(A_3,I_3) = k^8 for p = 2 and p = 3. The published AGT version could not be read (paywalled), so it is unknown whether the journal version corrects this. The README states the recomputed count with its derivation.
2. **speirs-axes Lemma 15** (line 506) asserts that `T^{tC_p} ⊗ (Σ^∞X)^{tC_p} → (T ⊗ Σ^∞X)^{tC_p}` is an equivalence for bounded-below T and finite X. For T = 𝕊 and X = S⁰ the source has `π_0 = ℤ_p ⊗ ℤ_p`, so it is only a p-adic equivalence. The proof's step `T^{tC_p} ⊗ 𝕊^∧_p ≃ T^{tC_p}` needs p-completion. §3.1 states the p-adic form, and uses the fixed-point form of hn-cusp Lemma 2 (an honest equivalence for every T) where an equivalence is needed.
3. **speirs-axes Proposition 26(2)** uses "2r ≥ m" for the odd-degree homotopy fixed points, while the class z of degree m and the definition of t_od require "2r + 1 ≥ m". The design uses t_od as defined (line 964).
4. **akn-delta Proposition 8.6** (line 1770, v2) as printed computes `𝔽_p(i)` as the fibre of a map between quotients by N^{≥j} under (p−1)j ≥ i. For the absolute package of 𝔽_2, i = 1, j = 1 this gives `𝔽_2[−1]`, while `ℤ_2(1)(𝔽_2) = 0`. The preceding Lemma 8.5 (line 1759) proves the needed equivalence for (p−1)j > pi, with target quotient N^{≥j−i}. §8.2 states that form; with j = 3 it gives 0.
5. **akn24 cites akn-delta v1 numbering.** The v2 numbers were derived by reading the v2 text: Theorem 1.1 → 1.2, Corollary 1.2 → 1.3, Corollary 10.32 → 10.34, Proposition 10.41 → 10.43, Proposition 10.44/Corollary 10.45 → Proposition 10.46/Corollary 10.47. The README uses v2 numbers throughout and records the correspondence in Layer 8's introduction.
6. **target.md's chain-ring finiteness.** It cited Kuku. The design instead derives finiteness from the computed groups (§9.2) and the prime-to-p comparison by Gabber rigidity plus Goodwillie (§9.1). This avoids an unowned homological-stability input.

## Adversarial pass

Each row gives the statement, the instances tried, the values computed on each side, the result, and any change made.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 ℓ, S(a,b,r) divisor-closed | (2,3,0), (2,3,1), (2,5,0) | S(2,3,0) = {1,2,3,4,6}; S(2,3,1) = {1..10,12}; divisors of 12 and 10 lie in S | holds | none |
| 1.1 #S = ½(a+1)(b+1) − 1 + rab | (2,3,0), (2,3,1), (2,5,0) | 5 = 5; 11 = 11; 8 = 8 | holds | none |
| 1.1 Sylvester #T = ½(2r+1)(a−1)(b−1) | (2,3,0..2), (2,5,0) | T = {1}, {1,5,7}, {1,5,7,11,13}, {1,3}: 1, 3, 5, 2 = formula | holds | none |
| 1.1 degenerate: strict "<" | (2,3,0) | S empty vs Sylvester 1 | fails | added as negative Check |
| 1.2 ker(R^S_T) = ΣV_{n_i} | S = {1,2}, n = 2, 𝔽_2; n = 1; S = {1..4}, n = 2 over ℤ | ℤ/4/{0,2} = 𝔽_2 = W_{1}; both zero; V_2τ(1) ↦ 0 | holds | Checks |
| 1.3 h = s_T(m′) | (2,3,0,2), (2,3,1,2), (2,3,0,5) | h: (1,0,0) vs s_T: (1,0,0); totals 3 and 3; 1 and 1 | holds | statement added |
| 1.3 Σ s_S(d) = #S | S = {1..4}, p = 2 | 3 + 1 = 4 | holds | none |
| 1.4 A_d(m) and cyc_d | d = 2, 3, m ≤ 6 | A_3 = 6, 6, 18, 66; cyc_3(2..6) = 3, 2, 3, 6, 9 (table line 1282) | holds | none |
| 1.4 t_od vs t_ev | (2,1,3), (2,2,3), (3,1,1) | (1,0), (1,1), (2,·) | differ only at p^{t−1}m′ = 2r+1 | statement added |
| 1.5 Σε = i(n−1) | (i,n) = (2,2), (3,3), (i,1) | 2 = 2; 6 = 6; 0 = 0 | holds | none |
| 1.5 threshold B | ℤ/4; e = 3, n = 3, p = 2 | 12; 4 vs weaker bound 4 at j = 1 | holds | none |
| 2.1 k(Π) | Π_0, Π_e, Π_d, cusp | rank e vs e+1 unquotiented | holds | non-example Check |
| 2.2 B^cy weights | Π_0; Π_1, m = 1; Π_2, m = 2 | S⁰; (T/C_1)_+; cofibre of (T/C_1)_+ → (T/C_2)_+ ≠ pt | holds | none |
| 2.3 splitting | Π_0; k = 𝔽_p, Π_2, weight 1 | identity; π_n has dimension 1 for n ≥ 0 (first draft said 2) | holds | Check value corrected |
| 2.3 generality | E₁-ring k, not only discrete rings | the proof (symmetric monoidality, base §2.8) works for E₁ k | wider than sources, supported | stated for E₁-rings |
| 2.4 linear splitting | ℚ[t] weight m; 𝔽_2 words with s odd, i even | H = ℚ in degrees 0, 1, Connes m; 𝔽_2 in degrees m−1, m; zero over ℚ | holds | none |
| 2.5 cell types | d = 2 (vs hesselholt-axes Proposition 1.2); x_1x_2x_3; x_1x_1 | Σ^{−1}S^{λ_i}∧(T/C_i)_+; S^{λ_1}∧T_+; contractible | holds | none |
| 2.6 cusp mixed complex | (2,3), m = 1, 6 | ℤ⊗T_+; square with degrees 3,2,2,3: complex ℤ → ℤ² → ℤ exact, so contractible | holds | none |
| 3.1 Tate comparison | Z = C_p+, S⁰; T = 𝕊, Z = S⁰ for the lax map | 0 = 0; id; ℤ_p⊗ℤ_p ≠ ℤ_p | lax map fails integrally | restated p-adically; negative Check |
| 3.2 circle orbits | m = 1, X = Hℤ; m = p | π_1 = ℤ; Tate ℤ/p in odd degrees | holds | none |
| 3.3 suspension invariance | E = Hℤ; E = 𝕊 | BhAut(Hℤ) = B{±1}, null on BT; for 𝕊 the Thom spectrum has a nontrivial η on bottom cells | holds for even E only | non-example Check |
| 3.4 coefficient tower | R = 𝔽_p, n = 0, 1, 2 | π_0 = 𝔽_p, ℤ/p²; transfer ×p; n = 0 gives R[u] | holds | none |
| 3.5 staircase | s = 0, 2; all maps zero | kernel 0, W_2(k); infinite product | holds under its hypotheses | first-draft non-example replaced by the zero-map instance (the draft instance satisfied the hypotheses) |
| 3.6 cell Frobenius bound | B = S^{λ_1}∧T_+ | π_1 source 0, target π_{−2}THH^{tC_p} ≠ 0; iso from π_3 | holds | none |
| Layer 3 example: positive weights of k[t] | weight 1, degree 1 | kernel lim_R W_{v+1}(k) = W(k) ≠ 0 | staircase hypotheses fail; TC(k[t],(t)) ≠ 0 while K_1 = 0 | example rewritten as a non-example |
| 4.1 birelative | identity, product square, axes | 0, 0, K_2 = k | holds | none |
| 4.2 birelative trace | 𝔽_p axes q = 2; rational axes; Z → Z/p | 𝔽_p = 𝔽_p; HC_1 = k; not a Milnor square | holds | first-draft Check (square-zero square, not Milnor) removed |
| 4.3 conductor squares | (2,3); ℤ axes | conductor t²k[t]; A/c = k, B/c = k[t]/t² (first draft said k ⊕ kt²) | holds | Check value corrected |
| 4.4 relative = birelative | k = 𝔽_p[ε]; perfect field; K_0 | NK_1 ∋ 1+εt ≠ 0; regular; K_0(A_d) = ℤ | hypothesis necessary | none |
| 5.1 Theorem B | q ≤ 1, q = 2, λ = 0 | 0; k; nonzero in degree 0 vs K_0 = 0 | holds | first draft said q ≤ 0; changed to q ≤ 1 |
| 5.2 Theorem A | q = 1..4, k = 𝔽_2, 𝔽_3 | 0, k, Ω¹, Ω² ⊕ (k² or W_2(k)); K_4(𝔽_2) = ℤ/4; K_6(𝔽_3) = ℤ/9 ⊕ 𝔽_3, exponent 9 | holds | Layer 5 example corrected (first draft listed 𝔽_3³) |
| 5.2 KTFL §5.17 formula compatibility | λ = λ_{p^{r−1}d} | ℓ_s = p^{r−1−s}d, so the summand is W_{s(m,d)} | holds | none |
| 5.3 Speirs p odd | d = 2 vs 5.2; d = 3, q = 2, 3, 5 | collapses; k³, k², k^8 | holds | none |
| 5.3 Speirs p = 2 odd, printed | d = 3, q = 1, 5 | nonzero K_1 (should be 0); infinite product | fails | replaced by recomputed count; negative Check |
| 5.3 recomputed | d = 3, q = 3, 5 at p = 2 vs p = 3, 5 | k² = k²; k^8 = k^8 | consistent | statement adopted |
| 5.4 char 0 | d = 2; q = 2; ℚ(t), q = 3 | Ω^{q−2m}; k^{d(d−1)/2}; Ω¹ ≠ 0 | holds | none |
| 5.4 char 0 vs char p | d = 2, q = 4; d = 3, q = 5 | k vs k²; k^6 vs k^8 | differ, as expected (also in Hesselholt line 107) | none |
| 6.1 cusp TC | (2,3,0) p = 2; (2,3,1) over 𝔽_3 and 𝔽_5 | k; 𝔽_3³; ℤ/25 ⊕ 𝔽_5, length 3 | holds | none |
| 6.2 cusp K | (2,3) r = 0 (Pic); (2,5,0) over 𝔽_3 | k = (k[t]/t²)^×/k^× (first draft wrote a quotient of units that is trivial); ℤ/9, cyclic | holds | Check corrected |
| 6.2 generality | perfect 𝔽_p-algebra, not field | needs NK(k) = 0: gap | holds with gap | gap recorded |
| 7.1 TC^- decomposition | e = 1; 𝔽_p, e = 2; e = p, k = 1 | 0; π_1 = 𝔽_p; cofibre π_0 = ℤ/p | holds | statement rewritten precisely |
| 7.2 Riggenbach | e = 1; 𝔽_2 e = 2 r = 1; 𝔽_3 e = 2 r = 2; O_C | 0; ℤ/2; ℤ/9 (= W_4/V_2W_2 by direct count); O_C | holds | none |
| 7.2 vs akn24 table (𝔽_2[z]/z³) | r = 1, 2, 3 | ℤ/4; ℤ/8 ⊕ ℤ/2; ℤ/16 ⊕ ℤ/2 ⊕ ℤ/2 = table 2-parts | holds | added as Layer 9 example |
| 8.1 δ-pairs | BK pair; (𝔽_p, 𝔽_p); (ℤ_p, ℚ_p) | L = (E)/(E²)[1]; δ(0) = 1 − p^{p−1} = 1 contradiction; derived completion 0 | holds | first-draft qrsp claim about ℤ/p^n removed (not verifiable) |
| 8.2 syntomic functor | ℤ_p(0)(ℤ_p); ℤ_2(1)(𝔽_2) | ℤ_p ⊕ ℤ_p[−1] (= H_ét); 0 | holds | finite-stage formula repaired (defect 4) |
| 8.3 δ-conjugate filtration | A = R = ℤ_p; BK prism; ℤ_p → W(𝔽_q) | gr_0 = ℤ_p ⊕ ℤ_p[−1]; W(k)⟦z⟧; equal | holds | statement put on Hodge–Tate cohomology, not on Δ |
| 8.4 relative syntomic | ℤ/4 weight 1; i = −1; O_K/A^0 weight p−1 | ℤ/2; 0; f d^{p−1} − φ(f) | holds | none |
| 8.5 filtered δ-rings | trivial filtration; z-adic; δ(z) = 1 | weight 0 only; (W(k)[z], k[z]); 1 ∉ F^p | holds (Def. 10.3 checked: δ(F^m) ⊆ F^{pm}) | none |
| 8.6 degeneration | ℤ/4 vs 𝔽_2[z]/z² | same gr; K_3 ℤ/8 vs 𝔽_2² (by 7.2) | holds | none |
| 8.6 completeness | ℤ_p[z] z-adic; O_K/ϖ^n | H¹ differs from the completion's; a complete filtered regular quotient | hypothesis needed | first-draft Check on Theorem 2.20(2) removed (k is not smooth over W(k)) |
| 9.1 reductions | n = 1; ℤ/4 K_1; degree −1 | Quillen; ℤ/2; TC_{−1} = ℤ_p vs K_{−1} = 0 | holds for r ≥ 0 | none |
| 9.2 bounded syntomic | n = 1, i = 1; ℤ/4, i = 1; table | empty window; H¹ = ℤ/2, H² = 0; prime-to-2 parts ℤ/3, ℤ/7 | holds | none |
| 9.3 Angeltveit | ℤ/4 i = 2; ℤ/8 i = 2, 3; 𝔽_2[z]/z³ i = 3 | 8/2 = 4; 32/2 = 16, 128/2 = 64; 64/1 = 64 | holds | none |
| 9.4 free model ranks | n = 1; ℤ/4, i = 1 | rank 0; ℤ_2 → ℤ_2² → ℤ_2, cohomology order 2 = 2^{1·1}·|H²| | consistent | none |
| 9.5 even vanishing | ℤ/4 (B = 12); n ≤ e; weaker bound | K_2 only nonzero even group, |K_5| = 56 = 7·8; covers i ≥ 2 as e → ∞; weaker bound p²/(p−1) ≥ 4 never covers i = 2 | holds | none |
| 9.6 v₁ nilpotence | n = 1; ℤ/4; e = 2, n = 3 | degree 1; [2]_2 = 3; only ≤ p+1 | holds | none |
| Convention: Witt sign γ_1(a) = 1 + at | ℤ, N = 2 | (2,−1) ↦ 1 + 2t + 3t² | pinned | none |
| Convention: Tate grading | Hℤ, C_p | π_{2r} = ℤ/p | pinned | none |
| Convention: circle norm shift | m = 1 | π_1 = ℤ | pinned | none |
| Convention: syntomic degree | ℤ/4, i = 1 | H¹ = ℤ/2 | pinned | first draft's "T_pG_m[−1]" wording made precise |
| Context: perfect vs regular hypotheses | 4.4, 6.2 | the perfect-field case needs no gap; general perfect needs one | scoped | gap |
| Duplication by object | THH of monoid rings (base §2.10, KTFL §5.16); NK (SKO §5.2); TR (KTFL §5.17) | imported, not re-planned | no duplication | GAKT citation for NK replaced by SKO §5.2 |

## Sources

All texts the design relies on were read from the service cache. Three new sources were fetched, all open-repository and certified:

- `amm-perfectoid` (arXiv:2203.06472v1): Proposition 5.1, the content of gap `perfect-homotopy-invariance`.
- `riggenbach-double` (arXiv:2007.01227v2): Proposition 4.2, Corollaries 4.4 and 5.8, Proposition 5.7, Lemma 5.13, the inputs of §§3.3–3.4.
- `riggenbach-cusp` (arXiv:2203.17136v1): §2, line 152, the context for homotopy invariance in the cusp calculation, and the later-Part motivation.

Sources that could not be read: bach-hypersurfaces and larsen-mixed are settled as uncertified and cited by locator through hn-cusp Theorem 1. The published AGT version of speirs-axes was not read; the arXiv v2 numbering is used and the p = 2 formula is recomputed as described. No `needs-references.toml` was written: every text a target needs was read.

## Dependency check

```text
$ tauceti-roadmap --conf <conf> gate --candidate packages/RefinedTraceMethodsPartII/design/README.md --only RefinedTraceMethodsPartII --order merge-order/ORDER.txt
candidate: RefinedTraceMethodsPartII is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Every pinned declaration cited in the supplier contracts was read at the pin: `MonoidWithZero`, `MonoidAlgebra`, `WittVector`, `TruncatedWittVector`, `WittVector.verschiebung`, `WittVector.frobenius`, `WittVector.teichmuller`, `Nat.divisors`, `ArithmeticFunction.moebius`, `ArithmeticFunction.moebius_mul_coe_zeta`, `TauCeti.NodeAlgebra` with `coord`, `coord_zero_mul_coord_one`, `lift`.

## Untrusted text

Nothing read in the target, the roadmaps, the board files or the fetched papers contained instructions addressed to this job.
