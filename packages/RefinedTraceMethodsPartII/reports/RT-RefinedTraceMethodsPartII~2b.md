<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6899811491 -->
Red team round 2 pass b (claude) of 371b193

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.1 uses the genuine pointed-monoid equivalence without naming its owner

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:521–523`: "The route goes through the F-equivalence … of genuine T-spectra (hesselholt-axes Proposition 1.2, line 131; §2.5 here for its Borel form)" with "*Needs:* §§2.3, 2.5, 4.1; RefinedTraceMethods §§2.13, 2.16; KTheoryFiniteLocalFields §§4.0, 4.4."

   **Claim.** The listed inputs give the F-equivalence of genuine T-spectra from which `TR^r_{q−λ}` is read off.

   **Witness.** §§2.3 and 2.5 give the splitting in Borel T-spectra only (line 295: "agrees on underlying T-spectra"). The genuine equivalence `T(A) ∧ N^cy(Π) → T(A[Π])` is KTheoryFiniteLocalFields §5.16, which is absent from this line and from the Layer 5 Dependencies (line 598).

   **Repair.** In §5.1 replace the *Needs* line by:

   > *Needs:* §§2.3, 2.5, 4.1; RefinedTraceMethods §§2.13, 2.16 (genuine TC and the restriction pullback); KTheoryFiniteLocalFields §§4.0, 4.4 and §5.16 (the pointed-monoid equivalence in genuine cyclotomic spectra, which gives the F-equivalence its genuine form).

   In the Layer 5 Dependencies replace "KTheoryFiniteLocalFields §§4.0, 4.4, 5.1, 5.17" by "KTheoryFiniteLocalFields §§4.0, 4.4, 5.1, 5.16, 5.17". Tested: §5.16 at the supplier's head states the equivalence for every pointed monoid, so it covers Π_2 of §2.1.

2. **F02** (P3) §5.4 uses the rationality of birelative K-groups with no owner

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:582`: "gives `K_q(A_d,B_d,I_d) ≃ HC_{q−1}(A_d,B_d,I_d)`, which is rational because the birelative K-groups are ℚ-vector spaces."

   **Claim.** RefinedTraceMethods §4.18 gives the identification without tensoring with ℚ.

   **Witness.** RefinedTraceMethods §4.18 (the target on truncating invariants) states the comparison only "in K⊗ℚ"; no section in the *Needs* line (§§1.4, 1.9, 4.17–4.18) states that the birelative K-groups of ℚ-algebras are ℚ-vector spaces. speirs-axes line 1232 takes it from Cortiñas.

   **Repair.** Replace the clause by:

   > gives `K_q(A_d,B_d,I_d) ⊗ ℚ ≃ HC_{q−1}(A_d,B_d,I_d)`. The birelative K-groups are already ℚ-vector spaces: excision for `K^inv` (RefinedTraceMethods §4.18) gives `K(A_d,B_d,I_d) ≃ TC(A_d,B_d,I_d)`, and for a ℚ-algebra A every `THH(A)^{tC_p}` vanishes (RefinedTraceMethods §2.3), so `TC(A) ≃ THH(A)^{hT}` by the fibre sequence of RefinedTraceMethods §2.9, on which every integer acts invertibly.

   Add "RefinedTraceMethods §§2.3, 2.9" to the *Needs* line of §5.4 and to the Layer 5 Dependencies. Tested on k = ℚ, d = 2: `K_2(A_2,B_2,I_2) = ℚ = HC_1`, a ℚ-vector space, and `HC_2 = 0`.

Two P3 findings (S01, S02), both incomplete `*Needs:*` lines with the missing owner named. All nine round-1 findings are repaired at this head and no repair introduced an error.

## Round-1 findings at this head

| Id | Status | Repaired passage (`packages/RefinedTraceMethodsPartII/README.md`) and witness |
| --- | --- | --- |
| 1a/F01 = 1b/F01 (P1) | repaired | Line 454: "The convergence hypothesis of §2.3 therefore fails … Reading the sum as a product gives a wrong answer … In fact `TC_1(k[t],(t)) = 0`." Recomputed: `H^{−1}(ℤ_p(0)) = 0`; `(k^×)^∧_p = 0`; `ℤ_p(i)(k[t]) = 0` for i ≥ 2. Line 456 (degree −1): `[t] ↦ t ∉ {f^p − f}` since `deg(f^p − f) ∈ {0} ∪ pℕ`; `K_{−1}(k[t],(t)) = 0`. Line 429 adds the connectivity condition to §3.5. |
| 1a/F02 (P2) | repaired | Line 680: "A δ-pair (A′, R) is pre-prismatic if the kernel of A′ → R contains an invertible ideal I …" and "(A′, R) pre-prismatic as exhibited by an ideal I ⊆ A′". Agrees with akn-delta lines 307 and 1844–1848. Check at line 694 recomputed: `δ(p^m u) = p^{m−1}u − p^{mp−1}u^p ∈ pℤ_p` for m ≥ 2. |
| 1a/F03 (P3) | repaired | Line 29: "This roadmap does not state `L_{T(1)}K(ℤ/p^n) = 0`. Its §9.6 is the nilpotence of v₁ on the motivic associated graded … only". Agrees with akn24 lines 2356–2361. |
| 1a/F04 (P3) | repaired | Line 801: "F-weights are written j′, as in §1.5"; lines 823–824, 838 use `gr^{j′}_F`, `{j′,n}`, `ε(i,j′)`; line 852 uses `N^{≥i′}`. No remaining clash with `j = ⌈n/e⌉`. |
| 1a/F05 (P3) | repaired | Line 833: "The upper end of the window is sharp … The lower end may be taken to be 0 or 1, since `gr^0_Fℤ_p(i)(R) ≃ 0`". Agrees with akn24 lines 391 and 398. |
| 1a/F06 (P3) | repaired | Line 70: "no big Witt vectors, cyclic bar constructions, THH, TC, higher or relative algebraic K-groups, cyclic homology, mixed complexes or syntomic complexes … Tau Ceti has Grothendieck groups … and the Hochschild and cyclic cohomology of cochains". Same wording in `Suggested.lean` lines 17–21. |
| 1b/F02 (P3) | repaired | Line 509: "It says nothing about the kernel of that map, since the sequence has no K_2 term on the left … The vanishing of `K_1(A_d,I_d)` is a theorem". Recomputed q = 1 in §§5.2–5.4: every term has `cyc_d(1) = 0`, `W_0 = 0` or a negative form degree. |
| 1b/F03 (P3) | repaired | Line 168: "the largest integer that is not a nonnegative combination of a and b is `ab − a − b`, Mathlib's `frobeniusNumber_pair`". Pin: `Mathlib/NumberTheory/FrobeniusNumber.lean:59`. (2,3): 1; (2,5): 3. |

New errors introduced by the repairs: none found. The new supplier citations (RefinedTraceMethods §§2.13, 2.16; PrismaticCohomologyPartIII §§6.16, 6.24; SchemeKTheoryOperations §5.2) resolve at their heads with the statements used.

## The adversarial pass

`Suggested.lean` has no `variable` or `include` block; every binder is in the signature. The elaborated types of the worker's signature file were compared with the README statements: no binder lost, nothing changed. No Lean was run in this pass.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `cuspCount` (Lean 47; §1.1) | (2,3,m), m = 1…19, 23; (2,5,m), m ≤ 14 | ℓ(2,3,·) = 0,0,0,0,1,0,1,1,1,1,2,1,2,2,2,2,3,2,3; ℓ(2,3,23) = 4; ℓ(2,5,7) = 1, ℓ(2,5,10) = 0. Bound `i, j ≤ m` holds for a, b ≥ 1 | agrees with README | none |
| `cuspTruncationSet`, `cuspCoprimeSet` (Lean 52, 56) | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | S = {1,2,3,4,6}; {1..10,12}; T = {1}; {1,5,7}; {1,5,7,11,13}; S(2,5,0) = {1,2,3,4,5,6,8,10}, T = {1,3} | agrees; `ℓ < r` variant gives ∅ at r = 0 | none |
| `ncard_cuspTruncationSet` (Lean 62) | (2,3,0), (2,3,1), (2,5,0) | 2·5+2 = 12 = 3·4; 2·11+2 = 24 = 12+12; 2·8+2 = 18 = 3·6 | true | none |
| `ncard_cuspCoprimeSet` (Lean 70) | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | 2 = 1·1·2; 6 = 3·1·2; 10 = 5·1·2; 4 = 1·1·4. Inclusion–exclusion (2,3,0): 5 − 3 − 2 + 1 = 1. Natural subtraction harmless for a, b ≥ 2 | true | none |
| `card_noCyclicRepetition` (Lean 78) | d = 0, 1, 2, 3; m = 1, 2, 3, 4, 6 | d = 0: 0 = (−1)^m − (−1)^m; d = 1: 0 = 0; m = 1: 0 = (d−1) − (d−1); m = 2: d(d−1); d = 3: 6, 6, 18, 66. m = 0 would give 1 ≠ d | true; `1 ≤ m` needed | none |
| §1.1 ℓ(m+ab) = ℓ(m)+1; divisor monotonicity; `#(S/a)` | (2,3): m = 1, 5, 6; S/2, S/3, S/6 at r = 0 | 0→1, 1→2, 0→1; {1,2,3}, {1,2}, {1}: 3 = b, 2 = a, 1 | true | none |
| §1.1 conductor | (2,3), (2,5), (3,4) | Frobenius numbers 1, 3, 5; (a−1)(b−1) = 2, 4, 6 | true | none |
| §1.2 kernel of restriction | S = {1,2}, n = 2, 𝔽_2; n = 1; S = {1..4}, n = 2, ℤ | ℤ/4 / {0,2} = 𝔽_2; T = ∅, 0 = 0; T = {1,3}, `V_2τ(1) = (0,1,0,0) ↦ 0`; `W_{{1,3}}(𝔽_2)` has 4 elements | true | none |
| §1.3 `s_S`, h = `s_T` | (2,3,0,2), (2,3,0,5), (2,3,1,5), (3,2,1,3); S = {1..4}, p = 2 | h(m′=1) = min(3,1) = 1; 1; h(1) = 2, h(7) = 1; h(1) = h(5) = h(7) = 1; 3 + 1 = 4 | h = `s_T` in all three cases | none |
| §1.4 cyc, c, t_ev, t_od | d = 2, 3; s ≤ 9; (2,1,3) | cyc_3 = 0,3,2,3,6,9 (s = 1..6), cyc_3(9) = 56; cyc_2(2) = 1, cyc_2(4) = 0; c_1 = 1/0; c_2(2) = 3, c_2(3) = 2; t_od = 1, t_ev = 0 | true | none |
| §1.5 B, ε | ℤ/4; 𝔽_2[z]/z³ (e = 3); ℤ_2[√2]/(√2)³; n = 1 | B = 12; B = 4; j = 2, exponent 4; Σε = (in−1) − (i−1) = i(n−1), 0 at n = 1 | agrees with akn24 lines 157, 2075, 451 | none |
| Pinned witnesses (Conventions) | Witt sign; V_1; Tate; circle cell; ℤ/4 | ghosts (2,2) ⇒ (2,−1); `(1−2t)^{−1}(1+t²)^{−1} = 1+2t+3t²`; ℤ/2; π_1 = ℤ; `(ℤ/4)^× = ℤ/2` | true | none |
| §2.1 `k(Π)` | Π_0, Π_e (e = 1, 2), M_+, trivial monoid | ranks 1; e versus e+1; `k[M]`; 0. `[0]` central idempotent ⇒ `k × k(Π)` | true | none |
| §2.2–2.3 splitting, convergence | Π_0; ⟨t⟩_+; Π_2 weights 1, 2, 2j+1; k = ℚ[β^{±1}] | S⁰; `(T/C_m)_+`; `(T/C_1)_+`, cofibre of `(T/C_1)_+ → (T/C_2)_+`, `S^{λ_j} ∧ (T/C_m)_+`; `⊕_jℚ → ∏_jℚ` not onto | true; bound on THH(k) needed | none |
| §2.4 rational splitting | ℚ[t], weight m | HH: ℚ in degrees 0, 1; B = m; HC: ℚ in degree 0 only | true | none |
| §2.5 cell types and homology | d = 2, `(x_1x_2)^i`; x_1x_2x_3; x_1x_1x_2; x_1x_1; s odd, i even | `Σ^{−1}S^{λ_i} ∧ (T/C_i)_+`; degrees 2, 3; contractible; `(T/C_2)_+` not contractible; cone of degree 2 map: R/2 in degree m−1, R[2] in degree m | agrees with speirs-axes lines 360–366, 456–464 | none |
| §2.6 cusp mixed complex | (2,3): m = 1, 5, 6 | `ℤ ⊗ T_+`; `ℤ ⊗ (T/C_5)_+[2]` (HH_1 map (3,2) onto ℤ, kernel rank 1); m = 6: ℤ/3 →(×2) ℤ/3 iso, total cofibre 0 | true | none |
| §3.1 fixed-point map | `C_{p+}`; S⁰; `S⁰ ∨ EC_{p+}` | 0 = 0; identity; `ℤ/p → ℤ/p ⊕ ℤ/p` | true; finiteness needed | none |
| §3.2 circle-orbit identity | X = Hℤ; m = 1, p | π_1 = ℤ, Tate 0; ℤ/p in odd degrees; orbits `X_{hC_m}` | true | none |
| §3.3 suspension invariance | E = Hℤ; E = 𝕊 | `B{±1}`, maps from BT null; orbits `Σ^∞CP^∞` versus `Σ²Σ^∞_+CP^∞`, cells 2 and 4 attached by η versus split | true; evenness needed | none |
| §3.4 coefficient tower | R = 𝔽_p; n = 0, 1, 2 | π_0 hC: `A/(d·d̃_n)` = 𝔽_p, ℤ/p², ℤ/p³; π_{−2}: `A/d̃_n` = 0, ℤ/p, ℤ/p²; Tate π_0: ℤ/p, ℤ/p²; φ: `A/(d d̃_n) → A/d̃_{n+1}` iso; can iso only for j < 0 | true | none |
| §3.5 staircase lemma | s = 0; s = 1; s = 2 (Witt); all maps 0 | kernel A_0; A_0; A_1 = W_2(k); kernel `∏ℤ/p` | true as stated, both directions of the recursion checked | none |
| §3.6 cells and Frobenius | λ = 0, m = 1; λ = C(1), m = p; `B = S^{λ_1} ∧ T_+`; `B′ = S⁰ ∨ ET_+` | shift 1; shift 3; fibre of φ ⊗ B in degrees ≤ N − 3, π_1: 0 → π_{−2} ≠ 0; `𝔽_p → 𝔽_p²` | true (iso from N − 1 on; stated from N) | none |
| Layer 3 Examples | k = 𝔽_p, 𝔽̄_p | product reading: `lim W_{v+1}(k) = W(k)`; true value 0; degree −1: K gives 0, TC gives `[t] ≠ 0` | true | none |
| §4.1 birelative terms | f = id; A = B × C; ℤ → ℤ/p | 0; 0; K(ℤ, pℤ) | true | none |
| §4.2 squares | (2,3); d = 2 over ℤ | c = t²k[t], A/c = k, B/c = k[t]/t²; I_2 ≅ xℤ[x] × yℤ[y] | true | none |
| §4.3 relative versus birelative | k = 𝔽_p[ε]/ε²; k a field | `K(k[x],(x))` is a retract of `K(A_2,I_2)` and is nonzero; `K_0(A_d) = ℤ` | true | none |
| §5.1 Theorem B form | q ≤ 1; q = 2 | 0 since `dim λ^{C_{p^{r−1}}} = d ≥ 1`; `TR^1_{2−λ_1} = k`; stable range `q < 2p^{r−1}d` | agrees with hesselholt-axes lines 70–85 | S01 |
| §5.2 Theorem A form | 𝔽_3, q = 1…6; 𝔽_2, q = 4 | 0, 𝔽_3, 0, 𝔽_3², 0, ℤ/9 ⊕ 𝔽_3; ℤ/4; index t = s(m,d) from `ℓ_s = p^{r−1−s}d` | true | none |
| §5.3 axes, char p | d = 2 (p odd, p = 2); d = 3: q = 2, 3, 5; p = 2, 3, 5 | reduces to §5.2; k³; k² for all three primes; k^8 for p = 2 and 3. p = 2 odd family: A_0 = k iff 2r+1 ≥ m′, A_v = B_v = k for v ≥ 1, staircase with s = t_od gives one copy iff m′ ≤ 2r+1 | README formula true; printed formula false | none |
| §5.4 axes, char 0 | d = 2, k = ℚ, q = 1, 2, 4; d = 3, q = 2, 3; ℚ(t), q = 3 | HC_1 birelative = ℚ, HC_2 = 0; K_4 = ℚ; k³; k²; `Ω¹ ≠ 0` | agrees with speirs-axes lines 1163–1190, 1228–1230 | S02 |
| §6.1–6.2 cusps | (2,3,0) p = 2; (2,3,1) p = 5, 3; (2,5,0) p = 3; 𝔽_3 × 𝔽_3; (2,3,2) p = 2, 5 | k; ℤ/25 ⊕ 𝔽_5; 𝔽_3³; ℤ/9; length 4; 𝔽_2^5; ℤ/25 ⊕ 𝔽_5³ | true; lengths 1, 3, 3, 2, 5 match Sylvester over fields | none |
| §7.1–7.2 truncated polynomials | e = 1; (𝔽_2, 2, 1); (𝔽_3, 2, 2); (𝔽_p, p, 1); O_C; 𝔽_2[z]/z³, r = 1, 2, 3 | 0; ℤ/2; ℤ/9; 𝔽_p^{p−1}; O_C; ℤ/4, ℤ/8 ⊕ ℤ/2, ℤ/16 ⊕ ℤ/2² (akn24 lines 145–149) | true | none |
| §8.1 δ-pairs | 𝔽_p; (ℤ_p, 𝔽_p); (ℤ_p, ℤ/p²); (ℤ_p, ℚ_p); ℤ_p ⊕ ⊕ℤ/p^n; ℤ_p{y}, y ↦ p | δ(p) = 1 − p^{p−1}; qrsp; not pre-prismatic; not p-complete; unbounded; base change has z_n of order p^n | true | none |
| §8.2 packages and finite stage | 𝔽_p weight 0; 𝔽_2, i = 1, j = 1, 3; BK pair p = 2, j = 2, 3; c = 2·id | ℤ_p ⊕ ℤ_p[−1]; 0, and j = 1 gives 𝔽_2 ⊕ 𝔽_2[−1]; direct: H⁰ = k, H¹ = k² (image: b₀ = b₁, b₂ = 0); j = 3 same, j = 2 gives 0, k; `fib(−id) = 0` | true; strict bound (p−1)j > pi needed | none |
| §8.3–8.4 | A = R = ℤ_p, i = 0; BK prism; ℤ_p⟦x⟧ → ℤ_p; ℤ/4, i = 1 | `fib(0) = ℤ_p ⊕ ℤ_p[−1]`; `W(k)⟦z⟧`; `Tor_1 = ℤ_p`; H¹ = ℤ/2 | true | none |
| §8.5–8.6 | filtered BK prism; ℤ_p⟨z⟩; ℤ/4 versus 𝔽_2[z]/z² | `gr^u = W(k)·z^u`; 1 + z not a unit, 1 + pz is; ℤ/8 versus 𝔽_2² | true | none |
| §9.1–9.3 | 𝔽_q; ℤ/4; ℤ/8; 𝔽_2[z]/z³ | fibre of K → TC is `Σ^{−2}Hℤ_p`; 2/1, 8/2 = 4; 32/2 = 16, 128/2 = 64; 64/1 = 64. `gr^{j′}Δ̂ = W/{j′,n}`: `d(z^r(z^n)^{[q]}) = j′·z^{r−1}(z^n)^{[q]}dz`, n when r = 0 | true | none |
| §9.4 bases | p = 2, n = 3, s = 0: [2,2], [3,3] with i = 1; relation u = 0 | z_0²; f_0 (w = 0); `x^p = (−p + d^pλ_0)δ(x) + δ(r)/δ(d)` from `δ(dx) = d^pδ(x) + x^pδ(d) + pδ(d)δ(x)`; one monomial per weight, rank in − 1 | true | none |
| §9.5–9.6 | ℤ/4; n ≤ e; n = 1; e = 2, n = 3 | exponents 6 and 3; pn; B = 12; [1]_p = 1; bound p + 1 only | agrees with akn24 lines 2132–2135, 2322, 2331 | none |

Self-consistency: every Check was evaluated against the theorems of its own section and against the other Checks on the same object (the four tables of values above); no contradiction.

## Dependency check

```text
depcheck: 246 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. StableHomotopyKTheoryPartII §2.7 and GeneralAlgebraicKTheoryPartII §5.5 ("The chromatic purity theorem") are later in the merge order and are named only as owners of what the scope excludes; both sections exist at their heads.

**Declared gaps.** `gap:bigwitt-ptypical-decomposition` (QWittVectors §1.5) and `gap:perfect-homotopy-invariance` (SchemeKTheoryOperations §5.2) carry the same slugs in `design/plan.json` and under `## Exact supplier contracts`. Neither asks for what exists: QWittVectors §1.5 covers only `Div(p^a)`, a search of all open roadmaps and main for a p-typical decomposition of `W_S` finds none, and SchemeKTheoryOperations §5.2 proves `NK_n = 0` for regular noetherian schemes only. Not raised.

**Ownership against open work.** Searched by object in the 477 open heads and main: δ-pairs and prismatic cohomology relative to δ-rings or of filtered rings, finite chain rings and Angeltveit's quotient, pointed-monoid algebras and their cyclic bar constructions, cusp counting and cyclic words. The only neighbour is KTheoryFiniteLocalFields §5.16 (genuine pointed-monoid THH), which the README cites as supplier. No `Suggested.lean` name of this roadmap occurs in another roadmap.

## Verified sound

- Declarations read: 6 of 6 (3 definitions, 3 theorems), with the module docstring; elaborated signatures compared with §§1.1 and 1.4.
- README targets read: all 40 numbered sections of Layers 1–9, the Conventions, the supplier contracts and every Examples and Dependencies block (934 lines).
- Locators verified against the cached texts: 165 (akn24 42, akn-delta 41, speirs-axes 26, hn-cusp 18, hesselholt-axes 13, hesselholt-cusp-polytopes 8, riggenbach-trunc 7, riggenbach-double 4, speirs-trunc 3, sulyma-slopes 1, amm-perfectoid 1, riggenbach-cusp 1).
- Checks tested by computation: 140 of 140 bullets under **Checks** read; values recomputed for those in the table above (all of Layers 1, 5, 6, 7, 9 and the numerical ones of Layers 2, 3, 4, 8).
- Sibling citations checked at their heads or on main: 98 section ids in 14 supplier roadmaps (RefinedTraceMethods 17, KTheoryFiniteLocalFields 14, QWittVectors 6, PrismaticCohomology 12, PrismaticCohomologyPartII 18, PrismaticCohomologyPartIII 7, StableHomotopyKTheory 7, DerivedDeRhamCohomology 6, EnhancedDerivedSheaves 3, AInfCohomology 2, GeneralAlgebraicKTheory 2, CrystallineCohomology 2, SchemeKTheoryOperations 1, BordismFormalGroups 1), all present; PrismaticCohomology §§0.56, 0.75, 0.76, 1.3, 1.4 and PrismaticCohomologyPartII §§4.4–4.8 are inline ids under the headings 0.55, 0.74, 1.2 and 4.3. Statements read, not only headings, for RefinedTraceMethods §§2.13, 4.17, 4.18, KTheoryFiniteLocalFields §§5.16, 5.17, QWittVectors §§1.1, 1.3, 1.4, 1.4a, 1.5, AInfCohomology §AI.7.2 and SchemeKTheoryOperations §5.2.
- Pinned declarations: `frobeniusNumber_pair`, `TauCeti.NodeAlgebra` with `coord`, `coord_zero_mul_coord_one`, `lift`, `TauCeti.Perfectoid.IsIntegralPerfectoid`; Mathlib has no count of proper colourings of a cycle and no contracted monoid algebra, so no target is already proved at the pins.
- Headline theorems: Hesselholt's Theorem A (§5.2), Speirs' formulas (§§5.3–5.4), Hesselholt–Nikolaus (§6.2), Riggenbach (§7.2), the Antieau–Krause–Nikolaus theorems (§§9.2, 9.3, 9.5, 9.6), with Layer 8. None is statable at the pins and each is named in the module docstring with what it lacks. The staircase lemma (§3.5) is statable but is a statement about arbitrary abelian groups, so it is rightly absent. No declaration is padding: none follows from one library lemma, restates a definition or computes a value.
- Policy: the pull request changes only `packages/RefinedTraceMethodsPartII/`; no pull-request numbers or process narrative in the README or docstrings; `theorem` only; single `import Mathlib`; no `set_option`, `#eval` or sorry'd data; every definition has at least three Checks.

## Not verifiable

- `bach-hypersurfaces` and `larsen-mixed` are settled as uncertified; the mixed-complex input of §2.6 was checked only through hn-cusp Theorem 1 (line 131) and by the weights m = 1, 5, 6 above.
- akn24 Propositions 3.33, 4.24, Lemmas 4.6–4.15, 4.43, Corollary 4.44, Theorem 5.12 and Lemmas 5.15–5.16 (§§9.4–9.5): locators exist, the statements were not recomputed.
- Elaboration was not rerun; the comparison uses the worker's elaborated signatures of this head.
- `lurie-ha` Corollaries 3.2.2.5 and 3.2.3.2 and `bouis-motivic` §§2–3 were not opened.

Source independence: 16 passages compared with 7 sources, none shared beyond formulas and statements of about a dozen words (the definitions of §8.1 and the eight properties of §8.3 keep the hypotheses and numbering of akn-delta Definitions 2.2, 9.2 and Theorem 1.2, in the roadmap's words and with changed hypotheses); largest share akn24 and akn-delta, 47 each of 201 locators; contents compared with akn24 and akn-delta: independent (Layer 9 draws on akn24 §§2–6 with §§2.3, 3 and 4 merged into §9.4; Layer 8 takes akn-delta §§2, 8, 3–6, 7, 10 in that order).

## Source issues

- **Error** in speirs-axes at Theorems 1 and 2, p = 2, odd degree, printed pages 1 and 4 (lines 64, 191, 1114–1116): the source says the product over each odd m′ has one factor for every v from 0 to t_ev; it should be one copy of `k^{cyc_d(s′)}` for each odd m′ ≤ 2r+1 and none otherwise; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed page 13 (line 506): the source says the lax map of Tate constructions is an equivalence for every bounded-below T; it should be an equivalence after p-completion of the source (T = 𝕊, X = S⁰ fails rationally); affects nothing.
- **Error** in akn-delta at Proposition 8.6, printed page 43 (line 1770): the source says the finite-stage formula holds when (p−1)j ≥ i; it should require (p−1)j > pi as in Lemma 8.5 (𝔽_2, i = j = 1 fails); affects a stated result.
- **Misprint** in akn24 at footnote 1, printed page 4, and Remark 5.3, printed page 46 (lines 189, 2077): the source says ⌈n/e⌉ is the exponent of the additive group; it should be p^{⌈n/e⌉}; affects nothing.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7 and its proof, printed page 8 (lines 395–399): the source says the quotient has finite length ½(2r+1)(a−1)(b−1) over W(k) for every commutative ring k; it should assume k a field; affects a stated result.
- **Error** in hn-cusp at the introduction, printed page 1 (lines 36–37): the source says the group has that finite length for the perfect 𝔽_p-algebra of Theorem A; it should say for a perfect field (𝔽_p × 𝔽_p doubles it); affects nothing.

## For the human reviewers

- **Licence.** `akn-delta` is cited at arXiv:2310.12770v2 dated 7 May 2026 and `bouis-motivic` at arXiv:2608.05220v1; both are unpublished preprints (`packages/RefinedTraceMethodsPartII/README.md:920`, `:931`).
- **Scope.** Layers 8 and 9 rest on two preprints of the same three authors (`akn24`, `akn-delta`), 94 of 201 locators; no refereed version is recorded in `sources.toml`.
- **Not tested.** `bach-hypersurfaces` and `larsen-mixed` (uncertified, paywalled) carry the mixed-complex input of §2.6; wording and content were compared only through hn-cusp.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "371b193f5629b7d599c2b7a29ee57abab0c8f960", "job": "RT-RefinedTraceMethodsPartII~2b", "model": "fable", "worker": "chris-x90"} -->
