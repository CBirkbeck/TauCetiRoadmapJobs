<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6897013472 -->
Review (claude) of b83e78b

Verdict: accepted
Conditional on the announced gaps: `bigwitt-ptypical-decomposition`, `perfect-homotopy-invariance`

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Both findings of round 5 are repaired, the repaired passages and the rest of the package pass the adversarial pass below, `Suggested.lean` elaborates with `sorry` as its only warning, the dependency check reports no problem, and every supplier citation resolves at the supplier's current head. The acceptance is conditional on the two declared supplier gaps `bigwitt-ptypical-decomposition` (QWittVectors §1.5) and `perfect-homotopy-invariance` (SchemeKTheoryOperations §5.2).

No author file was edited. The sources manifest is unchanged (no source was fetched: all sixteen cited works are already recorded).

## Verified sound

### Previous findings, checked first

| Round-5 finding | Repaired passage (quoted) and my check | Status |
| --- | --- | --- |
| F01 (P3), §1.5 last Check: order quotient divided by `|K_0(𝔽_q)|` at i = 1 | `packages/RefinedTraceMethodsPartII/README.md:237`: "for i ≥ 2, `|K_{2i−1}(𝔽_q)|/|K_{2i−2}(𝔽_q)| = (q^i − 1)/1` is prime to p, and for i = 1 the group `K_1(𝔽_q) = 𝔽_q^×` has order q − 1, prime to p; the order of `K_0(𝔽_q) = ℤ` is never divided by." At q = 2: i = 2 gives 3/1, i = 1 gives order 1; the ε-count for n = 1 is 0 = i·0 for i = 1, 2, 3 (empty sum, {1}, {1,2}, all divisible by 1). | Repaired |
| F02 (P3), §6.2 second Check: `W_{{1}}(k)` used for the cusp (2,5,0) | `README.md:622`: "for k the perfection of `𝔽_3[t]` the same cusp gives `K_0 = W_{{1,3}}(k) = W_2(k)`, of infinite length: restriction maps it W(k)-linearly onto `W_1(k) = k`, whose ideals `(t) ⊋ (t²) ⊋ ⋯` are W(k)-submodules." T(2,5,0) = {1,3} = {1,p} at p = 3, so `W_T = W_2`; t ∉ (t²) in the perfection because t^{−1} ∉ k. | Repaired |

Pattern search in the rest of the package. Order quotients: §9.3 keeps the integral quotient at i ≥ 2 and states the i ≥ 1 form on `H¹`, `H²` only; §9.4's ℤ/4 Check uses `H¹`, `H²`; §9.5 has i ≥ 2. No other quotient divides by an infinite order. Silent change of parameters inside a Check: every Check of §§1.1–1.5, 5.2–5.4, 6.1–6.2, 7.2, 9.2–9.6 names its (a,b,r), (p,e,n), d, q or i where it changes; none found.

### Coverage

Read in full: `README.md` (930 lines, nine layers, 40 numbered subsections), `Suggested.lean`, `metadata.toml` (`topic = "math.KT"`), `sources.toml` (16 entries), `design/plan.json` (the `gaps` list), the round-5 review and the round-6 repair report. The maintainer left no notes for this roadmap. Round 5's adversarial table carries computed values in every row; I relied on it only for rows I did not recompute, and recomputed the sampled targets, the headlines, the two repaired Checks and the rows below.

### Seeded source sample (15 targets, all readable)

| Target | Text opened | Result |
| --- | --- | --- |
| 1.2 | hesselholt-cusp-polytopes lines 395–408 (Corollary 1.7 and proof, pp. 8–9) | Restriction induces the isomorphism from the quotient by the two V-images onto `W_T`; inclusion–exclusion on Corollary 1.6 (line 386). The README's general form with n_1,…,n_k is its own target with a proof route; the locator supports the case used. |
| 1.5 | akn24 lines 2072–2080 (Definition 5.1, Theorem 5.2, Remarks 5.3–5.4, p. 46), 443–452 (p. 10), 2084–2092 | Threshold `i − 1 ≥ (p/(p−1))(p[j]_p − p^j j + p^j n/e)` agrees with B(p,e,n); ε and the count i(n−1) agree; Remark 5.4's weaker bound agrees. |
| 2.6 | riggenbach-trunc line 846 (Theorem 5.1); hesselholt-cusp-polytopes line 792 (Proposition 3.1); hn-cusp lines 131–142 (Theorem 1), 154–160, 162–178 (Lemma 2) | Cofibre sequences, `T_+ ∧_{C_m} X(a,b,m)`, the square with shift 2ℓ(a,b,m) and empty orbits for c ∤ m, connectivity, free-cell cofibre: all as stated. |
| 3.3 | riggenbach-double lines 296–347 (Proposition 4.2, Corollary 4.4); hn-cusp line 115 | Even E∞-ring E, modules in `Fun(BT, Mod_E)`, `E = X^{hT}` in the corollary: as stated. |
| 5.1 | hesselholt-axes lines 70–85 (Theorem B, p. 2), 131 (Proposition 1.2) | 𝔽_p-algebra k, all integers q, product over d prime to p, ℤ/p^v-coefficients for any ring; stabilization for q < dim_ℝ λ = 2p^{r−1}d. |
| 5.3 | speirs-axes lines 17–65 (Theorem 1), 153–191 (Theorem 2), 976–992 (Proposition 28), 1072–1117 (§5.1) | Perfect field, p odd and p = 2 even-degree formulas as stated. The README's corrected p = 2 odd-degree formula is right and the printed one is false (row below; Source issues). |
| 6.2 | hn-cusp lines 20–57 (Theorem A and the p-typical decomposition, pp. 1–2), 89–104 | Perfect 𝔽_p-algebra, coprime a, b ≥ 2, j = 2r ≥ 0, other groups zero; index h in three cases with p ∤ b. |
| 7.1 | riggenbach-trunc lines 889–899 (Lemma 5.2) | Two products, shift `λ_{⌊(n−1)/e⌋} + 1` (written `2⌊(n−1)/e⌋ + 1` through §3.3), cofibres of the Verschiebung for n = ek, same for TP. |
| 8.1 | akn-delta lines 121–125, 296–310 (Definitions 2.1–2.2), 416, 1838–1850 (Definitions 9.1–9.2), 1974; akn24 lines 501–507 | δ-pairs, bounded, finitely presented free, relatively quasisyntomic, relatively qrsp with a pre-prismatic factorization, the Amitsur complex with δ(z_i) = 0: as stated. |
| 8.2 | akn-delta lines 89–100, 1557–1562, 1680–1717, 1723–1734, 1745–1791 | G_A as a pullback, `C_A = CAlg(G_A)`, sh, sc_p, Definition 8.4, Lemma 8.5 with (p−1)j > pi, Proposition 8.6 printed with (p−1)j ≥ i, Corollary 8.7 on G_A. lurie-ha Corollaries 3.2.2.5 and 3.2.3.2 exist (lines 13543, 13801). |
| 8.3 | akn-delta lines 126–152 (Theorem 1.2), 54, 184–203, 211–213, 473–474, 1579–1580, 1991–1993, 2010–2011; akn24 line 498 | The eight properties, the convention that R is an A/I-algebra, the crystal definition, Proposition 1.6, Theorem 1.7(1), the uniqueness statement. |
| 8.4 | akn-delta lines 1599–1608, 165–170, 1812–1814, 1824; akn24 lines 1399–1402, 2336–2339 | Definition 7.8, Remark 7.9, Corollary 7.10 and the flat restriction of lines 169–170, Corollaries 8.9 and 8.10, the oriented fibre formula. |
| 9.1 | akn24 lines 279–298 (Corollaries 2.3, 2.5, Theorem 2.4, pp. 6–7) | Both statements as stated; the README's route for Corollary 2.3 (Gabber rigidity and Goodwillie) differs from the source's and is sound: rationally zero and zero modulo every ℓ ≠ p gives p-primary torsion. |
| 9.2 | akn24 lines 344–350, 388–411, 437–446, table at 144–153 | Lemma 2.8, Corollaries 2.13, 2.14, 2.16, the pieces `W(𝔽_q)/{j,n}[−1]`; every table value the README quotes agrees. |
| 9.3 | akn24 lines 419–452 (Proposition 2.18), 162–164 (Proposition 1.5) | i ≥ 1 on `H¹/H²`, i ≥ 2 on K-groups, `q^{i(n−1)}`. |

No locator was flagged by the author as unverified. Also opened: akn24 lines 108–112 (Theorem 1.1), 156–158 (Theorem 1.4), 197–208, 2321–2331 (Proposition 6.2, Theorem 6.3); amm-perfectoid line 558 (Proposition 5.1); hesselholt-axes lines 21–41 (Theorem A); speirs-axes lines 506–509 (Lemma 15); hesselholt-cusp-polytopes lines 329–336, 370–382.

### Adversarial table (values computed in this round)

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §1.1 `ℓ(a,b,m+ab) = ℓ(a,b,m) + 1`, m ≥ 1 | (2,3): m = 1, 6; m = 0 | ℓ(1) = 0, ℓ(7) = 1; ℓ(6) = 0, ℓ(12) = 1; at m = 0, ℓ(0) = 0 = ℓ(6), so m ≥ 1 is needed and is stated | Pass |
| §1.1 headline `ncard_cuspTruncationSet` | (2,3,0), (2,3,1), (2,5,0) | #S = 5, 11, 8; 2#S + 2 = 12, 24, 18 = 3·4, 3·4 + 12, 3·6 | Pass |
| §1.1 headline `ncard_cuspCoprimeSet` | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | T = {1}, {1,5,7}, {1,5,7,11,13} (ℓ(13) = 2, ℓ(17) = 3), {1,3}; 2#T = 2, 6, 10, 4 = (2r+1)(a−1)(b−1) | Pass |
| §1.1 `#(S/a) = (r+1)b`, conductor | (2,3,0) | S/2 = {1,2,3}, S/3 = {1,2}, S/6 = {1}; conductor 2 = 1·2 (1 is not representable, 2 and 3 are) | Pass |
| §1.1 length remarks | k = 𝔽_p × 𝔽_p; non-noetherian perfect k | length 2#T over `W(k)`; a noetherian perfect ring is a finite product of fields, so otherwise k (a quotient of `W_T(k)`, 1 ∈ T) has infinite length | Pass |
| §1.2 kernel of restriction | S = {1,2}, n = 2, 𝔽_2; S = {1,2,3,4}, n = 2; n = 1 | ℤ/4 modulo {0,2} = 𝔽_2; T = {1,3}, `W_T(𝔽_2)` has 4 elements against 8 for {1,2,3}; T = ∅ gives 0 = 0 | Pass |
| §1.3 `h = s_T(m′)` | (2,3,0), p = 2 and 5; (2,3,1), p = 5 and 3; (2,3,2), p = 5 | h(1) = min{3,1} = 1; h(1) = 1; (2,1) for m′ = 1, 7; (1,1,1); s_T(1) = #{1,5} = 2 with 7, 11, 13 once: sums 1, 1, 3, 3, 5 = #T | Pass |
| §1.3 `Σ s_S(d) = #S` | S = {1,…,4}, p = 2 | 3 + 1 = 4; the convention "p^s d ≤ m" gives 3 | Pass |
| §1.4 headline `card_noCyclicRepetition` | (d,m) = (3,2), (3,3), (3,4), (3,6), (2,odd), (0,m), (1,m), (d,1); m = 0 | 6, 6, 18, 66, 0, 0, 0, 0 on both sides; (3,4) = 18 and (3,1) = 0 also confirmed by `decide` at the pin; at m = 0 the count is 1 and the formula d | Pass, hm needed |
| §1.4 Möbius inversion, c, t_ev, t_od | d = 3, s = 2,…,6; (p,r,m′) = (2,1,3) | cyc_3 = 3, 2, 3, 6, 9 (s = 6: (66 − 6 − 6 + 0)/6); c_2(2) = 3, c_2(3) = 2; t_od = 1, t_ev = 0 | Pass |
| §1.5 threshold B and its special forms | (p,e,n) = (2,1,2), (2,3,3), n ≤ e | B = 2(6 − 0) = 12; 4·3/3 = 4; `p²n/((p−1)e)`; the weaker bound is 4 at p = 2, j = 1 for every e | Pass |
| §1.5 ε-count; repaired Check | (i,n) = (2,2), (i,1) | {1,3}: 2 = 2·1; 0 = i·0; q = 2: 3/1 and order 1 | Pass |
| Conventions, Witt sign | `W_{{1,2}}(ℤ)` | ghosts of τ(1) + τ(1) are (2,2), so coordinates (2,−1); `(1−2t)^{−1}(1+t²)^{−1} = 1 + 2t + 3t²` mod t³ | Pass |
| §2.3 convergence control | k = `ℚ[β^{±1}]`, Π_2, m = 2j+1 | piece `S^{λ_j} ∧ (T/C_m)_+` of connectivity 2j − 1; `π_0X_m ⊇ ℚβ^{−j}` for all j, so sum ≠ product | Pass |
| §2.5 homology of cells | s even; s, i odd; s odd, i even | degrees m − 1, m in each case; in the third, cone of the degree-2 map gives R/2 and R[2] | Pass |
| §2.6 mixed complex | (2,3): m = 1, m = 6 | m = 1: `ℤ ⊗ T_+`; m = 6: on H_1 the complex `ℤ → ℤ² → ℤ`, 1 ↦ (3,2), (x,y) ↦ 2x − 3y is exact, likewise on H_0, so the total cofibre is 0 | Pass |
| §3.1 lax compatibility, finiteness | S⁰, C_{p+}, `S⁰ ∨ EC_{p+}` with T = Hℤ | identity of ℤ/p; 0 → 0; ℤ/p → (ℤ/p)² | Pass |
| §3.3 suspension invariance | E = Hℤ; E = 𝕊 | maps BT → K(ℤ/2,1) are null; for 𝕊 the orbits `Σ^∞CP^∞` have Sq² ≠ 0 on the bottom class, `Σ²Σ^∞_+CP^∞` has Sq² = 0 | Pass |
| §3.4 coefficient tower | R = 𝔽_p, n = 0, 1, 2 | π_0 of fixed points = `ℤ_p/p^{n+1}` (relation `p^n v·u`), π_{−2} = ℤ/p^n, Tate π_0 = ℤ/p^n; n = 0 gives `R[u]` | Pass |
| §3.5 staircase lemma | s = 0; s ≥ 1 general; all maps 0 | s = 0: x_v determined by x_0, δ onto, kernel A_0; s ≥ 1: x determined by x_s both ways and `A_{s−1} ≅ A_s` through `φ_{s−1}`, `c_s`; zero maps give kernel `∏ ℤ/p` | Pass |
| §3.6 Frobenius range | fibre of φ_p; B = `S^{λ_1} ∧ T_+` | fibre in degrees ≤ −3, after ⊗B ≤ N − 3, isomorphism for j ≥ N − 1 ⊇ j ≥ N; π_1: 0 against π_{−2} of Tate ≠ 0 | Pass |
| §4.2–4.3 squares and NK | cusp (2,3); k = 𝔽_p[ε]/ε²; field k | conductor t²k[t], A/c = k, B/c = k[t]/t²; `1 + εt` gives NK_1 ≠ 0; K_0(A_d) = ker(ℤ ⊕ ℤ^d → ℤ^d) = ℤ | Pass |
| §5.1 Theorem B | q ≤ 1; q = 2 | every factor 0 (fixed representation has dimension d ≥ 1); only d = r = 1: `π_0THH(k) = k`, stable since 2 < 2p | Pass |
| §5.2 headline | k = 𝔽_3, q = 4, 6; k = 𝔽_2, q = 4 | 𝔽_3²; ℤ/9 ⊕ 𝔽_3 (s(3,1) = 2, s(3,2) = 1); W_2(𝔽_2) = ℤ/4 | Pass |
| §5.3 headline, d = 2 against §5.2 | p odd; p = 2 | `W_{t_ev}` with t = s(r,d′); `W_{t_ev − 1}` with t_ev − 1 = s(r,m′) | Pass |
| §5.3 headline, d = 3 | q = 2, 3, 4, 5 at p = 2, 3, 5 | q = 2: k³ at p = 2 and p odd; q = 3: k² at p = 2, 3, 5; q = 4: `W_2(k)³ ⊕ k³` (p = 2) and k^9 (p = 3), both of length 9; q = 5: k^8 at p = 2, 3, 5 | Pass |
| §5.3 corrected p = 2 odd formula | staircase on the family m = 2^v m′, s odd; d = 3, r = 0 | A_0 = k iff 2r+1 ≥ m′, A_v = B_v = k for v ≥ 1, s = t_od, kernel one copy of k iff m′ ≤ 2r+1; the printed index gives `k²` from m′ = 3 at r = 0 and an infinite product, against K_1 = 0 | Pass; source error |
| §5.4 headline | d = 2; d = 3, q = 3; k = ℚ(t) | `⊕ Ω^{q−2m}`; j = 0 term `k^{c_2(3)} = k²`; `K_3 = ℚ(t)dt` | Pass |
| §6.1–6.2 headline | (2,3,0), (2,3,1), (2,3,2), (2,5,0) over 𝔽_2, 𝔽_3, 𝔽_5 | 𝔽_2; `ℤ/25 ⊕ 𝔽_5`, `𝔽_3³`; `𝔽_2^5`, `ℤ/25 ⊕ 𝔽_5³`; `W_2(𝔽_3) = ℤ/9`; lengths 1, 3, 5, 2; r = 0, (2,3): Pic = k | Pass |
| §7.1 | e = 1; e = p, k = 1, R = 𝔽_p | empty product and cofib(id) = 0; cofibre of ℤ/p → ℤ/p², ×p, has π_0 = ℤ/p | Pass |
| §7.2 headline | (R,e,r) = (𝔽_2,2,1), (𝔽_3,2,2), (𝔽_2,3,1), (𝔽_2,3,2), (𝔽_2,3,3), (𝔽_p,p,1), (O_C,2,1), e = 1 | ℤ/2; ℤ/9; ℤ/4; ℤ/8 ⊕ ℤ/2; ℤ/16 ⊕ (ℤ/2)²; `𝔽_p^{p−1}` (exponent p since (1+x)^p = 1); O_C; 0. The 𝔽_2[z]/z³ values equal akn24's table | Pass |
| §8.1 boundedness | flat base change; `ℤ_p{y}`, y ↦ p; ∏(ℤ_p, ℤ/p^n) | torsion of a flat extension is the base change of the torsion; `A/y^m` is ℤ_p-free, base change has z_n of order p^n; unbounded | Pass |
| §8.2 definition and finite-stage bound | 𝔽_2, i = 1; bounds | `2a ↦ a` is an isomorphism, fibre 0; (p−1)j > pi ⇔ p(j−i) > j; j = 1 passes the printed bound and fails the strict one | Pass |
| §8.4 | ℤ/4, i = 1; `ℤ_p⟦x⟧ → ℤ_p` | H¹ = ℤ/2; `Tor_1 = ℤ_p` | Pass |
| §8.6 Checks | ℤ/4 against 𝔽_2[z]/z²; `ℤ_p⟨z⟩` | K_3 2-parts ℤ/8 against `W_{{1,3}}(𝔽_2) = 𝔽_2²`; units have nonconstant coefficients in pℤ_p, so 1 + pz but not 1 + z | Pass |
| §9.1 | relative term | rationally 0 and zero mod ℓ ≠ p ⇒ p-primary torsion; `K_{2i−1}(𝔽_q;ℤ_p) = 0` | Pass |
| §9.2–9.3 headlines | ℤ/4 (i = 1, 2), ℤ/8 (i = 1, 2, 3), 𝔽_2[z]/z³ (i = 3) | 2/1 = 2; 8/2 = 4; 4/1 = 4 with `(ℤ/8)^×` of order 4; 32/2 = 16; 128/2 = 64; 64/1 = 64: each `2^{i(n−1)}` | Pass |
| §9.4 bases | p = 2, n = 3, s = 0 | weight 2: z_0² only; weight 3, i = 1: f_0 only (k < n excludes `d_N z_0³`) | Pass |
| §9.5 headline | ℤ/4; n ≤ e; step 1 exponents | i ≥ 13, order (2^i − 1)2^i, 56 at i = 3 from the table; B → 0 as e → ∞ so every i ≥ 2; exponents 6 and 3 for ℤ/4, pn for j = 1; `B·(p−1)e/p` equals exponent (a) | Pass |
| §9.6 headline | ℤ/4; n = 1; e = 2, n = 3 | [2]_2 = 3 with equality (e divides n); v₁ acts by 0; bound p + 1, inequality only | Pass |

Context and generality. The three Lean theorems carry their hypotheses in their own signatures (no `variable` block): `2 ≤ a`, `2 ≤ b`, `Nat.Coprime a b` for the two cusp counts (so `a − 1`, `b − 1` are not junk), `1 ≤ m` for the word count, an identity in ℤ. Each README statement has the generality of its source or more, never less: perfect 𝔽_p-algebras for cusps, regular noetherian 𝔽_p-algebras for planar axes, perfect fields and ind-smooth ℚ-algebras for d-space axes, perfectoid rings for truncated polynomials, every finite chain ring with p = 2 and ramification included.

### Suggested.lean

- Elaboration, run as the brief gives it from the content checkout: exit 0, exactly three warnings, each `declaration uses 'sorry'` (lines 61, 69, 77). One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no `lemma`, no `#eval`, no sorry'd data; three definitions with real bodies, each needed by a stated headline.
- Signatures: a scratch copy with `#check @name` for all six declarations elaborated; the types equal those of the worker's signature list and the README statements. Nothing changed. The list's seventh entry `and` is a docstring artifact, not a declaration.
- One-tactic probe on every sorried theorem (3 of 3): `first | rfl | (simp; done) | infer_instance | decide | omega | simp with the three definitions unfolded | norm_num | exact?` closes none of them (three `exact?` failures, nothing else). None restates a definition, mirrors a Check, computes a small value or is a boundary case. No padding.
- Headlines: the README's end theorems are §5.2, §§5.3–5.4, §6.2, §7.2, §§9.2, 9.3, 9.5, 9.6 and Layer 8, with the counting theorems of §1.1 and §1.4 that fix their sizes. The three counting theorems are stated; each of the others is named in the module docstring with the missing carrier. The pins have no higher algebraic K-theory, THH, TC, cyclic homology, big Witt vectors, de Rham–Witt complex, δ-rings or syntomic complexes (searched by object; the hits are a Grothendieck group of a category at `TauCeti/CategoryTheory/GrothendieckGroup/IsoClassModel.lean:199`, the quotient `A/[A,A]` in `TauCeti/Algebra/Algebra/CyclicQuotient.lean` and Hochschild cochains of A∞-algebras, none of which states a headline). No statable headline is absent and none is forced through a stand-in. The staircase lemma of §3.5 is statable but is algebra on free abelian-group variables, so it is rightly not a headline.
- Backticked names of this roadmap's own in the README: `cuspCount`, `cuspTruncationSet`, `cuspCoprimeSet`, `ncard_cuspTruncationSet`, `ncard_cuspCoprimeSet`, `card_noCyclicRepetition`; all six are declared. `BigWitt.TruncationSet` (README:110, the one citation lead) is QWittVectors' declaration (its README §1.1, lines 141 and 149 of the text at its head), cited as a supplier's: a false lead.

### Library declarations opened at the pins

`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:54` (`ArithmeticFunction.moebius`) and `:177` (`moebius_mul_coe_zeta`, also `#check`ed); `Mathlib/Logic/Equiv/Fin/Rotate.lean:27` (`finRotate`); `Mathlib/RingTheory/WittVector/Defs.lean:52`, `Truncated.lean:62`, `Verschiebung.lean:109`, `Frobenius.lean:218`, `Teichmuller.lean:93`; `Mathlib/RingTheory/Kaehler/Basic.lean:148`; `Mathlib/RingTheory/Perfectoid/` (FontaineTheta, Untilt, BDeRham); `Pi.addCommGroup` (`#check`ed); `TauCeti/RingTheory/Node/Basic.lean:37` (`NodeAlgebra`, the quotient by `X 0 * X 1 − C a`, no nontriviality assumed), `:65` (`coord`), `:75` (`coord_zero_mul_coord_one`), `:97` (`lift`); `TauCeti/RingTheory/Perfectoid/Integral.lean:76` (`IsIntegralPerfectoid`, a `Prop` class). Duplication by object: no count of proper colourings of a cycle for all d and m (`Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean:99`, `:135` give chromatic numbers only), no numerical-semigroup count, no contracted monoid algebra. Nothing at the pins proves a stated theorem.

### Supplier-order audit

Dependency check, command as given, exit 0:

```text
depcheck: 245 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line and every supplier-contract bullet was read, and every cited id resolved at the supplier's current head (`roadmaps show`; main for BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory; the open heads otherwise):

| Supplier | Ids resolved |
| --- | --- |
| RefinedTraceMethods | §§1.2, 1.3, 1.4, 1.9, 2.1, 2.3, 2.4, 2.5, 2.6, 2.8, 2.9, 2.10, 2.13, 2.16, 4.12, 4.17, 4.18: 17 of 17 headings. §2.3 states convergence, Tate vanishing and p-completeness with `X^{tC_p} ≃ (X^∧_p)^{tC_p}`, as the contract says, and no Segal equivalence. §2.4 has `D_{BT} = Σ𝕊`. |
| KTheoryFiniteLocalFields | §§1.1–1.6, 2.1, 4.0, 4.4, 5.1, 5.16, 5.17, Conventions (`𝕎_N(k)`), Layer 6: all present; §5.17 has the TR formula and `𝕎_{mn}(k)/V_n𝕎_m(k)`. |
| QWittVectors | §§1.1, 1.2, 1.3, 1.4, 1.4a, 1.5; §1.5 gives only the `Div(p^a)` comparison, so the declared gap asks for nothing already there. |
| PrismaticCohomology | §§0.55, 0.56, 0.73, 0.74, 0.76, 0.93, 1.2, 1.3, 1.4, 2.1, 2.13 (§§0.56, 0.76, 1.3, 1.4 are run-in ids under the headings 0.55, 0.74, 1.2; §0.75 is inside the cited range). |
| PrismaticCohomologyPartII | §§3.6, 3.9, 3.10, 3.19, 3.20, 3.24, 4.4–4.10, 4.17, 4.18, 4.19, 4.22, 4.23, 4.25, 4.29, 4.31. |
| PrismaticCohomologyPartIII | §§6.8, 6.9, 6.28, 6.31, 7.0. |
| AInfCohomology, CrystallineCohomology, DerivedDeRhamCohomology | AI.0, §AI.7.2; CR.2, CR.4; §§1.14–1.17, Layers 2 and 5. |
| GeneralAlgebraicKTheory, SchemeKTheoryOperations, StableHomotopyKTheory | §§8.1, 10.5; §5.2 (regular noetherian X, `NK_n(X) = 0` in every degree); §§7.9, 7.10, 7.14–7.18. |
| BordismFormalGroups, EnhancedDerivedSheaves | §F6.5 (Borel actions, norm and Tate cofibre, induced-object tensor ideal, lax structure); §§E5:abstract.1, E5:abstract.2, E5:presentability.2. |

Exclusions that name later roadmaps resolve too and are not suppliers: GeneralAlgebraicKTheoryPartII §5.5 "The chromatic purity theorem", StableHomotopyKTheoryPartII §2.7. No forbidden roadmap is cited. No pull-request number appears.

Declared gaps. `gap:bigwitt-ptypical-decomposition` (README:111; `design/plan.json` supplier QWittVectors, §1.5) and `gap:perfect-homotopy-invariance` (README:131; supplier SchemeKTheoryOperations, §5.2): same slugs in both places, one statement each with its hypotheses, neither provided today by the supplier, the pins or this roadmap. amm-perfectoid Proposition 5.1 (line 558) supports the second.

### Duplication audit and overlaps

Searched by object with `roadmaps grep` across main and the open heads, after reading the board's package index: cusp truncation sets, cyclic words without repetition, pointed-monoid algebras and reduced cyclic bar constructions, staircase kernels, δ-pairs and prismatic packages relative to δ-rings, finite chain rings. Owners found: classical pointed-monoid THH and truncated polynomials over regular noetherian and perfect-field coefficients are KTheoryFiniteLocalFields §§5.16–5.17 (cited; the perfect-field case is a Check here); big Witt foundations are QWittVectors (cited); generic trace machinery is RefinedTraceMethods (cited). Nothing this roadmap states as its own target is stated elsewhere, and no `Suggested.lean` declaration shares a fully qualified name with another roadmap's.

`scratch/overlaps.md` facts, each checked: no other open pull request changes this roadmap; no cited id is dropped by an open pull request; no cited id is defined only by an open revision; no second copy on main (the name is absent from the open-pull-request list and from main).

Two near-hits read and set aside. PrismaticCohomology §0.73 and PrismaticCohomologyPartII use "δ-pair" for a δ-ring with an ideal, a different object from the δ-pair (a δ-ring A with an A-algebra R) that §8.1 here defines in its first sentence; no object is shared. RefinedTraceMethods §4.18 has low-degree tests on dual numbers and truncated polynomials, which are tests of its own excision statements, not the theorem of §7.2.

Overlap check: read RefinedTraceMethods, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, EnhancedDerivedSheaves, StableHomotopyKTheory; nothing shared (the trace machinery, prisms and absolute syntomic theory are theirs and imported by section; the singular-ring calculations and the theory relative to δ-rings and of filtered rings are owned here only).

### Shape, style and principles

Headings in the house order (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 1–9, Downstream consumers, References); every layer ends with Examples and Dependencies; every subsection has a `*Needs:*` line, locators at its claims and at least three Checks (minimum 3, at §§2.4, 2.6, 3.2–3.5, 4.2, 4.3, 5.1, 6.1, 6.2, 7.1, 7.2, 9.1–9.3, 9.6). No LaTeX delimiters, target tables, field lists, pull-request numbers, dates of process, hand-off notes, HTML anchors or machine paths. No computational algorithm (akn24 §7 is excluded in Scope). Layers are named by their mathematics and no sentence says the roadmap follows a source.

Remark, no change needed: the Scope excludes the rational cusp calculation because no supplier provides its cyclic-homology input. That is accurate as written (no supplier does). I note for the humans below that §§2.4 and 2.6 of this roadmap would supply that input.

### Copyright, wording and arrangement

Wording: about 30 passages set beside the sources (the windows listed in the sample table and under it), including the two Lean docstrings on `S(a,b,r)` against hn-cusp lines 20–23 and hesselholt-cusp-polytopes line 384, the eight properties of §8.3 against akn-delta lines 132–152, the definition of G_A against lines 1701–1717 and the staircase lemma against speirs-axes lines 1060–1070. The statements are condensed paraphrases with the roadmap's own corrections and routes. The longest shared run is the hypothesis list of a definition (akn-delta line 1838, 14 words: "R is derived p-complete and `L_{R/A}` has p-complete Tor-amplitude in [0,1]"), which the mathematics forces.

Arrangement: 200 source-id locators in the README; akn24 and akn-delta have 47 each. Against akn24's contents (lines 18–52): Layer 9 pairs as §9.1 ↔ 2.1, §§9.2–9.3 ↔ 2.2, §9.4 ↔ 2.3 with 3 and 4, §9.5 ↔ 5, §9.6 ↔ 6, while akn24 §2.2's degeneration and completeness sit in §8.6 and §7 is excluded: not one to one, and the order is forced (§9.2 needs §9.1; §9.3 needs §9.2; §9.4 needs §9.2; §9.5 needs §§9.3–9.4; §9.6 needs §§9.4–9.5). Against akn-delta's contents (lines 28–41): §8.1 ↔ 2 and 9, §8.2 ↔ 8, §8.3 ↔ 3–6 and 9, §8.4 ↔ 7, §8.5 ↔ 10: a different order, forced by §8.3 needing §8.2 and §8.4 needing §8.3. Layers 1–7 draw on ten further sources. Reuse: no table, figure or list is taken over; the few table values of akn24 appear as Checks and are recomputed from §7.2 where possible.

Source independence: 30 passages compared with 8 sources, none shared beyond one forced 14-word hypothesis list; largest share akn24 and akn-delta, 47 of 200 locators each; contents compared with akn24 and akn-delta: independent.

## Not verifiable

- `larsen-mixed` and `bach-hypersurfaces` (the mixed complex of the cusp hypersurface behind §2.6) are settled as uncertified and were not read. The statement was checked in the form of hn-cusp Theorem 1 (lines 131–153) and on the instances m = 1 and m = 6 above.

## Source issues

- **Error** in speirs-axes at Theorems 1 and 2, pp. 1 and 4, and the end of §5.1, p. 28 (lines 59–64, 186–191, 1114–1116): the source says the p = 2 odd-degree group is a product over all odd m′ of t_ev + 1 copies of the multiplicity space; it should be one copy for each odd m′ ≤ 2r + 1; affects a stated result.
- **Error** in speirs-axes at Lemma 15, p. 13 (line 506): the source says the lax Tate structure map is an equivalence for bounded-below T; it should complete the source at p (T = 𝕊 gives `𝕊_p ⊗ 𝕊_p` against `𝕊_p`); affects a stated result.
- **Misprint** in akn24 at Figure 1, p. 4 (line 145): the source says the first K-group of ℤ/8 is cyclic of order 4; it should be the Klein four-group, the units of ℤ/8; affects nothing.
- **Misprint** in akn24 at Remark 5.3, p. 46 (line 2077): the source says j is the exponent of the additive group; it should say p^j is the exponent; affects nothing.
- **Error** in akn-delta at Proposition 8.6 and its proof, pp. 43–44 (lines 1770–1784): the source says (p−1)j ≥ i suffices and draws the top map of its square as an equivalence onto a different object; it should use Lemma 8.5's bound (p−1)j > pi and the automorphism followed by can; affects a stated result.
- **Misprint** in akn-delta at Remark 8.2(iii), p. 43 (line 1740): the source says the categories of E∞-algebras C_A form a stack in stable categories; it should say this of the module categories G_A; affects nothing.
- **Error** in hn-cusp at the remark after Theorem A, p. 1 (lines 36–37): the source says the group has finite length over W(k) for every perfect algebra k; it should restrict the length statement to perfect fields; affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7 and its proof, p. 8 (lines 395–399): the source says the length equals the cardinality for every commutative ring k; it should require k to be a field; affects a stated result.
- **Misprint** in hesselholt-cusp-polytopes at the proof of Lemma 1.4(5), p. 8 (line 371): the source says the multiplied representation is ait + bit; it should be ait + bjt; affects nothing.
- **Misprint** in hn-cusp at the map from ℤ, p. 3 (line 115): the source says the connective cover of TC of an arbitrary perfect k is ℤ_p; it should take the prime field and compose with the map induced by 𝔽_p → k; affects nothing.

## For the human reviewers

- Scope: README Scope leaves out the rational cusp calculation (recalled at hesselholt-cusp-polytopes line 198); §§2.4 and 2.6 of the same README give the cyclic homology it needs. Whether a later Part should carry it is yours to decide.
- Licence: `larsen-mixed` and `bach-hypersurfaces` are cited by locator only (paywalled, uncertified); the statement used is the one hn-cusp Theorem 1 gives.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b83e78b97709c5eafec3751710a105ca5339f01e", "job": "REV-PKG-RefinedTraceMethodsPartII~6", "model": "fable", "worker": "chris-x55"} -->
