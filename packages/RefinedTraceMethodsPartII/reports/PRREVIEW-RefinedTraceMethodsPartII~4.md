# Review of RefinedTraceMethodsPartII (pull request #2410 at 004cc58)

**Verdict:** needs changes

The head is the one the previous review read (no change in the folder); that review had no open finding, so there is nothing to re-check for repair. The two findings below come from a word-for-word comparison of the whole README with the cached sources.

## R01 (P2) — §8.6 completeness statement reproduces akn24 Proposition 2.11

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 789: "If F^⋆R is a complete filtered ring that is the filtered quotient of the completion of a finitely generated filtered polynomial ring by a filtered regular sequence, then the F-adic filtration on ℤ_p(i)(R) is complete."

**Claim:** The sentence is the source's statement with its two sentences joined, not the roadmap's own wording.

**Witness:** akn24 lines 357–359 (Proposition 2.11; the same hypothesis again at lines 381–382): 20 consecutive words shared, from "the filtered quotient" to "sequence, then the", then 8 more, "F-adic filtration on ℤ_p(i)(R) is complete".

**Repair:** Replace the sentence by: "Let P be a filtered polynomial ring in finitely many variables, P̂ its completion and f_1, …, f_c a filtered regular sequence in P̂. Give `R = P̂/(f_1, …, f_c)` the quotient filtration and suppose it is complete. Then, for every i, the filtration that F induces on ℤ_p(i)(R) is complete." (Third Check: `P̂ = W(k)⟦z⟧`, `(f_1, f_2) = (E(z), z^n)` still applies; `ℤ_p⟨z⟩` is still excluded, not being complete.)

## R02 (P2) — §8.1 definitions of pre-prismatic and relatively quasiregular semiperfectoid pairs follow akn-delta clause by clause

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 690: "is pre-prismatic if the kernel of A′ → R contains an invertible ideal I such that, Zariski locally on Spec A′, every generator d of I has δ(d) mapping to a unit of the p-completion of R"

**Claim:** This sentence, and the next one (relatively quasiregular semiperfectoid pairs), are the source's sentences with a few words exchanged, in the same clause order.

**Witness:** akn-delta lines 307–309 (Definition 2.2): 18 consecutive words shared, "if the kernel … Zariski locally on Spec A". akn-delta lines 1844–1847 (Definition 9.2): five clauses in the same order, with runs of 7 and 8 words.

**Repair:** Replace the two sentences by: "A δ-pair (A′, R) is pre-prismatic when `ker(A′ → R)` contains an invertible ideal I all of whose local generators d have δ(d) invertible in `R^∧_p`; local means on the members of a Zariski cover of Spec A′ on which I is principal (akn-delta Definition 2.2, line 307). A pre-prismatic factorization of a bounded δ-pair (A, R) consists of a δ-ring A′ and maps `A → A′ → R` such that: A′ is p-completely relatively perfect over A; `A′ → R` is onto; `L_{R/A′}` has p-complete Tor-amplitude in [1,1]; and (A′, R) is pre-prismatic, through an ideal I ⊆ A′. The pair (A, R) is relatively quasiregular semiperfectoid when R is p-complete and such a factorization exists (akn-delta line 121 and Definitions 9.1–9.2, lines 1838–1850)." (Checks unchanged: `(ℤ_p, 𝔽_p)` with I = (p) qualifies, δ(p) ↦ 1; `(ℤ_p, ℤ/p²)` with A′ = ℤ_p does not, δ(p^m u) ∈ pℤ_p for m ≥ 2.)

## Verified sound

| Target | Instances | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| §1.1 `ncard_cuspTruncationSet` (headline) | (2,3,0), (2,3,1), (2,5,0) | S = {1,2,3,4,6}, {1..10,12}, {1,2,3,4,5,6,8,10}: 5, 11, 8 = ½(a+1)(b+1)−1+rab. Lean: 2·5+2 = 12 = 3·4 | holds |
| §1.1 `ncard_cuspCoprimeSet` (headline) | (2,3,r) r = 0,1,2; (2,5,0) | T = {1}, {1,5,7}, {1,5,7,11,13}, {1,3}: 1, 3, 5, 2 = ½(2r+1)(a−1)(b−1). Inclusion–exclusion at (2,3,0): 5−3−2+1 = 1 | holds |
| §1.1 Lemma 1.4 bullets | (2,3), m = 1..18 | ℓ = 0,0,0,0,1,0,1,1,1,1,2,1,2,2,2,2,3,2; ℓ(m+6) = ℓ(m)+1; in [7,12] ℓ ∈ {1,2} and ℓ = 1 on multiples of 2 or 3 | holds |
| §1.1 Lean junk values | a = 0; m = 0; `Set.ncard` | both theorems assume a, b ≥ 2; `a − 1`, `b − 1` not truncated; i, j ≤ m holds for a, b ≥ 1; ncard = 0 on infinite sets is stated | holds |
| §1.2 restriction kernel | S = {1,2}, n = 2, 𝔽₂; n = 1; S = {1..4}, n = 2 | ℤ/4 / {0,2} = 𝔽₂ = `W_{{1}}`; T = ∅ gives 0 = 0; T = {1,3}, `V_2τ(1)` = (0,1,0,0) ↦ 0 | holds |
| §1.3 index h | (2,3,0,2), (2,3,0,5); S = {1..4}, p = 2 | p = 2: s = 3, u = 1, h = 1 at m′ = 1; p = 5: h = 1 at m′ = 1; totals 1 = #T. `s_S(1)` = 3, `s_S(3)` = 1, sum 4 | holds |
| §1.3 `h = s_T(m′)` | general, p ∤ b | b ∣ m′p^j ⇔ b ∣ m′; a ∣ m′p^j ⇔ a′ ∣ m′ and j ≥ u; ℓ monotone along divisors, so the count is s, min{s,u} or 0 | holds |
| §1.4 `card_noCyclicRepetition` (headline) | m = 1; d = 0, 1; (d,m) = (2,2), (3,2..6) | m = 1: 0 = (d−1)−(d−1). d = 0: 0 = (−1)^m−(−1)^m. A_2(2) = 2; A_3 = 6, 6, 18, 30, 66; `decide` gives 18 at (3,4). m = 0 excluded: 1 ≠ d | holds |
| §1.4 cyc and c | d = 3, s ≤ 6; d = 2 | cyc_3 = 0, 3, 2, 3, 6, 9 (Möbius: (66−6−6+0)/6 = 9); cyc_2(4) = 0; c_1 even-only; c_2(2) = 3; (2,1,3): t_od = 1, t_ev = 0 | holds |
| §2.2 unstable Frobenius | Π_0; ⟨t⟩_+; Π_2 | S⁰ with ψ_p = id; weight m ↦ pm; composite of three isomorphisms (speirs-axes lines 245–255) is a homeomorphism onto the fixed points | holds |
| §2.4 linear splitting | ℚ[t], weight m | HH: ℚ in degrees 0, 1; B = m ≠ 0, so HC weight m is ℚ in degree 0 = `ℚ_{hC_m}` | holds |
| §2.6 cusp square | (2,3), m = 6 | H_1 total complex ℤ → ℤ² → ℤ, x ↦ (3x,2x), (y,z) ↦ 2y−3z: exact since gcd(2,3) = 1; H_0 square of identities | holds |
| §3.3 suspension invariance | E = Hℤ; E = 𝕊 | `BhAut(Hℤ)` = K(ℤ/2,1), BT simply connected: null. 𝕊: Thom spectrum of L has η on the bottom cells, Σ²CP^∞_+ splits | holds |
| §3.4 coefficient tower | 𝔽_p, n = 0, 1, 2 | degree 0 of `[u,v]/(uv−d, d̃_n v)` is `A_inf/(d·d̃_n)`: ℤ/p, ℤ/p², ℤ/p³; Tate ℤ/p^n; n = 0 gives R[u] | holds |
| §3.5 staircase lemma | s = 0; s ≥ 1; all maps 0 | solutions parametrized by x_s; `x_{s−1} = φ^{-1}c_s(x_s)` bijective, kernel ≅ A_{s−1}; surjective. Zero maps: kernel ∏ ℤ/p | holds |
| §3.6 Frobenius range | B = S^{λ_1} ∧ T_+, N = 3 | fib φ_p in degrees ≤ −3, tensored ≤ N−3 = 0: isomorphism for j ≥ 2; π_1 source 0, target π_{−2} of Tate ≠ 0 | holds |
| §4.1 birelative terms | f = id; ℤ → ℤ/p; A_2 over a field | total fibre 0; I = pℤ ↦ 0, not Milnor; K_2 = k (hesselholt-axes lines 31, 55–57) | holds |
| §4.2 normalization squares | cusp (2,3); axes d = 2 over ℤ | conductor t²k[t] ((a−1)(b−1) = 2, t ∉ A); A/c = k, B/c = k[t]/t², both nil-extensions of k | holds |
| §4.3 K_0 of axes | field k, d ≥ 2 | Mayer–Vietoris: `(k^×)^{d+1} → (k^×)^d` onto, kernel of `ℤ^{1+d} → ℤ^d` is ℤ: K_0(A_d) = ℤ, relative 0 | holds |
| §5.2 Hesselholt (headline) | q = 2, 4, 6; p = 2, 3, odd | q = 4: p odd k ⊕ k, p = 2 W_2(k) (ℤ/4 for 𝔽₂); 𝔽₃, q = 6: s(3,1) = 2, s(3,2) = 1: ℤ/9 ⊕ 𝔽₃ | holds |
| §5.3 Speirs, p > 0 (headline) | d = 2 all p; d = 3, q = 2, 3, 4, 5, p = 2, 3, 5 | d = 2 reduces to §5.2 (t_ev−1 = s(r,m′) at p = 2). d = 3: k³; k²; length 9 (p = 2: W_2³ ⊕ k³); k^8, for every p | holds |
| §5.3 p = 2 odd-degree correction | d = 3, r = 0, 1 | staircase with s = t_od: one copy iff m′ ≤ 2r+1. Printed index: k² from m′ = 3 and k⁶ from m′ = 5 already at r = 0, product infinite | holds |
| §5.4 Speirs, char 0 (headline) | d = 2, 3; q = 2..5; ℚ, ℚ(t) | c_1 even-only gives ⊕ Ω^{q−2m}; d = 3: c_2 = 3, 2, 6, 6 at q = 2..5; ℚ(t), q = 3: Ω¹ ≠ 0 | holds |
| §6.1 TC of the cusp | (2,3,0), p = 2; (2,3,1), 𝔽₅ and 𝔽₃ | W_1(k); ℤ/25 ⊕ 𝔽₅ (s_T(1) = #{1,5} = 2); 𝔽₃³; lengths 1, 3, 3 = Sylvester | holds |
| §6.2 Hesselholt–Nikolaus (headline) | (2,3), r = 0; (2,5), 𝔽₃; 𝔽₃ × 𝔽₃ | W_{{1}}(k) = k = Pic of the cusp. (2,5): `(1+t𝔽₃[t]/t⁴)/(1+𝔽₃t²)` has order 9 and (1+t)³ = 1+t³ ∉ ⟨1+t²⟩: ℤ/9 = W_2(𝔽₃). Product: length 4 | holds |
| §7.1, §7.2 Riggenbach (headline) | e = 1; 𝔽₂, e = 2, r = 1; 𝔽₃, e = 2, r = 2; 𝔽_p, e = p, r = 1; 𝔽₂, e = 3, r = 1, 2, 3 | 0; ℤ/2; ℤ/9; 𝔽_p^{p−1} = (1+x𝔽_p[x]/x^p)^× (f^p = 0); ℤ/4, ℤ/8 ⊕ ℤ/2, ℤ/16 ⊕ ℤ/2² = akn24 table, line 144 | holds |
| §8.1 δ-pairs (R02) | (ℤ_p,𝔽_p); (ℤ_p,ℤ/p²); 𝔽_p; ℤ_p ⊕ ⊕ℤ/p^n | δ(p) = 1−p^{p−1} ↦ 1; δ(p^m u) = p^{m−1}u − p^{mp−1}u^p ∈ pℤ_p; δ(0) = 0 ≠ 1 = δ(p); elements of order p^n for all n | holds; wording R02 |
| §8.2 finite-stage formula | 𝔽₂, i = 1, j = 1, 3; (ℤ₂⟦z⟧, ℤ₂), j = 2, 3 | ℤ₂(1)(𝔽₂) = 0; j = 1 gives 𝔽₂ ⊕ 𝔽₂[−1]. BK: direct H⁰ = k, H¹ = k² (b_0 = b_1, b_2 = 0); j = 3 same; j = 2 gives 0, k | holds |
| §8.4 relative syntomic complexes | ℤ/4, i = 1; A = ℤ_p⟦x⟧ → ℤ_p | H¹ = (ℤ/4)^× = ℤ/2; Tor_1 = ker(x on ℤ_p) = ℤ_p, so the derived Čech nerve is not discrete | holds |
| §8.6 completeness (R01) | O_K/ϖ^n; ℤ_p⟨z⟩ | W(k)⟦z⟧/(E, z^n) fits the hypothesis; 1+z ∉ ℤ_p⟨z⟩^×, 1+pz ∈: not complete | holds; wording R01 |
| §8.6 degeneration | ℤ/4 versus 𝔽₂[z]/z² | same graded ring; K_3: ℤ/8 versus W_{{1,3}}(𝔽₂) = 𝔽₂² | holds |
| §9.1 reductions | n = 1; ℤ/4; r = −1 | Quillen; K_1 = ℤ/2 2-primary, K_1(𝔽₂) = 0; TC_{−1}(𝔽_q) = ℤ_p ≠ 0 = K_{−1} | holds |
| §9.2, §9.3 Angeltveit (headline) | i(n−1) count; ℤ/4, ℤ/8, 𝔽₂[z]/z³ | in−1−(i−1) = i(n−1). Table: 8/2 = 2²; 32/2 = 2⁴; 128/2 = 2⁶; 64/1 = 2⁶ | holds |
| §9.4 finite model | n = 1; ℤ/4, i = 1; p = 2, n = 3 bases | rank f(in−1) = 0; 1; F^{[2,2]}: z_0² only; F^{[3,3]}N^{≥1}: f_0 only (k < n excludes d_N z_0³) | holds |
| §9.5 even vanishing (headline), §1.5 | ℤ/4; n ≤ e; 𝔽₂[z]/z³ as e = 3; e → ∞ | B = 2(6−0) = 12 = akn24 line 2075; B = p²n/((p−1)e); 4; → 0. Order (2³−1)2³ = 56. Exponents 6 and 3 for ℤ/4 | holds |
| §9.6 v₁-nilpotence (headline) | n = 1; ℤ/4; e = 2, n = 3 | [1]_p = 1; [2]_2 = 3 with e ∣ n; j = 2, bound p+1, inequality only | holds |
| Generality, README against Lean | 3 theorems, 3 definitions | `#check @` on all six: binders (a b ≥ 2, coprime, r; d, 1 ≤ m) equal the README statements; no section variables in the file | holds |

- Source locators checked against the text: 113 in 9 sources (hn-cusp 9, hesselholt-cusp-polytopes 7, hesselholt-axes 11, speirs-axes 23, riggenbach-double 2, riggenbach-trunc 2, akn-delta 23, akn24 35, amm-perfectoid 1), covering all fifteen sampled targets. The README flags no locator as unverified.
- Library declarations opened at the pins: `frobeniusNumber_pair` (Mathlib/NumberTheory/FrobeniusNumber.lean:59), `finRotate` (Mathlib/Logic/Equiv/Fin/Rotate.lean:27), `moebius_mul_coe_zeta` (Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:177), `TauCeti.NodeAlgebra`, `.coord`, `.coord_zero_mul_coord_one`, `.lift` (TauCeti/RingTheory/Node/Basic.lean:37, 65, 75, 97), `IsIntegralPerfectoid` (TauCeti/RingTheory/Perfectoid/Integral.lean). No big Witt vectors, δ-rings, prisms, THH or count of proper colourings of a cycle at either pin.
- Cross-roadmap citations resolved: 92 section ids in 16 roadmaps. On main: BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory, CrystallineCohomology, DerivedDeRhamCohomology. At open heads: RefinedTraceMethods, KTheoryFiniteLocalFields, QWittVectors, SchemeKTheoryOperations, GeneralAlgebraicKTheory, AInfCohomology, PrismaticCohomology (§§0.56, 0.75, 0.76, 1.3, 1.4 are bold items, not headings), PrismaticCohomologyPartII, PrismaticCohomologyPartIII; scope-only mentions GeneralAlgebraicKTheoryPartII §5.5 and StableHomotopyKTheoryPartII §2.7. `BigWitt.TruncationSet` is QWittVectors §1.1's name at its head.
- Declared gaps: both slugs agree between the README and `design/plan.json`. QWittVectors §1.5 has only the `Div(p^a)` comparison and SchemeKTheoryOperations §5.2 only regular noetherian schemes, so neither gap asks for what exists.
- Gate re-run at this head: every check passes. `depcheck: 236 roadmaps, 2232 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 63, 71, 79) and nothing else. One-tactic probe on a scratch copy: `simp`, `rfl`, `simp` with the definitions unfolded, `omega`, `decide`, `aesop`, `infer_instance` close none of the three theorems. No padding.
- Headlines: the three counting theorems are stated; the ten K-theoretic and prismatic headlines are named in the module docstring with the missing carriers. Pull request text: title, summary block and prose agree with the head (a new roadmap, six declarations, no supplier beyond those the README names).
- `Suggested.lean` names: `cuspCount` also occurs in MaassForms' `Suggested.lean` (line 287), in another namespace; no fully qualified name is shared.

Overlap check: read RefinedTraceMethods, PrismaticCohomologyPartII, PrismaticCohomologyPartIII (open) and CrystallineCohomology, DerivedDeRhamCohomology, PerfectoidQuotients (main); the third list is empty. Pointed-monoid THH: the genuine-model equivalence is KTheoryFiniteLocalFields §5.16's, cited; this roadmap owns the Nikolaus–Scholze form and says how it differs. Syntomic complexes over ℤ_p: PrismaticCohomologyPartIII §6.8, cited by §8.4. de Rham–Witt complexes: CrystallineCohomology CR.4, cited. Nothing else shared; no other roadmap plans cusps, coordinate axes, finite chain rings or prismatic cohomology relative to a δ-ring. PrismaticCohomology §0.73 uses "δ-pair" for a pair (A, I); §8.1 defines its own (A, R) at first use.

Source independence: 26 passages compared by reading with 9 sources, and the whole README and `Suggested.lean` scanned mechanically against the 13 readable sources for shared runs of nine words or more; 2 shared (R01, R02). The other runs are titles in the References, formulas, and symbol-heavy hypothesis lists (the §8.5 filtered δ-ring and filtered prism definitions against akn-delta lines 2107 and 2116; Proposition 2.6's Rees-algebra clause, akn24 line 326, 14 words). Largest share akn24, 51 of 234 source-id occurrences (akn-delta 50). Contents compared with akn24 (§§1–7): independent. Only Layer 9 draws on it: 9.1–9.3 split its §§2.1–2.2, 9.4 merges §§2.3, 3 and 4, 9.5 ↔ §5, 9.6 ↔ §6, §7 is left out, and Propositions 2.6, 2.11 and Theorem 2.20 sit in §8.6. The order 9.1 → 9.6 is forced by the *Needs* lines (9.2←9.1, 9.3←9.2, 9.4←9.2, 9.5←9.3–9.4, 9.6←9.4–9.5).

## Not verifiable

- larsen-mixed and bach-hypersurfaces (the mixed complex of the cusp, §2.6): settled as uncertified; the statement was read at hn-cusp Theorem 1 only.

## Source issues

- **Error** in speirs-axes at Theorems 1 and 2, p = 2 and q = 2r + 1, printed page 1 (line 64): the source says the product runs over 0 ≤ v ≤ t_ev with a copy of `k^{cyc_d(s′)}` for each v; it should be one copy for each odd m′ ≤ 2r + 1 and none otherwise; affects a stated result.
- **Error** in akn-delta at Proposition 8.6, printed page 43 (line 1770): the source says the truncated formula holds when (p−1)j ≥ i; it should be (p−1)j > pi, the hypothesis of Lemma 8.5 that its proof uses (𝔽₂, i = j = 1 fails); affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed page 8 (line 395): the source says the quotient has length ½(2r+1)(a−1)(b−1) over W(k) for every commutative ring k; it should be for a field k (k = 𝔽_p × 𝔽_p gives twice that); affects a stated result.
- **Misprint** in akn24 at Remark 5.3, printed page 46 (line 2077): the source says j = ⌈n/e⌉ is the exponent of the additive group of O_K/ϖ^n; it should be p^j, j being the least integer with p^j = 0; affects nothing.

## For the human reviewers

- **Scope.** Layers 8 and 9 rest on two arXiv texts cited in preprint form, akn24 (arXiv:2405.04329v1) and akn-delta (arXiv:2310.12770v2, dated 7 May 2026): 101 of the 234 source-id occurrences in the README. bouis-motivic is arXiv:2608.05220v1 (2026).
