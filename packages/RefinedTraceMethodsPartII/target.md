Verdict: part-ii
Name: RefinedTraceMethodsPartII
Base: RefinedTraceMethods
Owner: none

## Scope

**Refined trace methods, Part II: algebraic K-theory of curve singularities, truncated polynomials over perfectoid rings and finite chain rings.** The base roadmap builds the trace machinery in the Nikolaus–Scholze framework and stops short of full calculations. It provides the TC formula (§2.9), THH of spherical monoid rings with the unstable Frobenius (§2.10), the Dundas–Goodwillie–McCarthy theorem and henselian rigidity (§4.17), truncating excision and continuity (§4.18) and the syntomic description of even K-sheaves (§8.7). Its §4.19 says that the full calculation of K_*(k[t]/t^n,(t)) is not one of its targets. Its §4.18 names the truncated polynomial towers only as an input to later calculations. Its Downstream consumers section says that later applications will use the nilpotent and henselian trace theorems, continuity and truncating excision. This Part II starts at that point and goes in the same direction. It develops the general calculus that turns those exports into closed formulas, and applies it to the standard families of singular and finite rings that no roadmap plans.

The roadmap owns:

1. **Pointed-monoid algebras in the Nikolaus–Scholze framework.** For a commutative ring k and a pointed monoid Π, it owns the cyclotomic splitting of THH(k(Π)) as THH(k) tensored with the reduced cyclic bar construction, with the Frobenius factored through the unstable Frobenius. It also owns the corresponding splitting of HH over Q. Over a perfect F_p-algebra k it owns the computation of TC⁻, TP and the Frobenius for THH(k) tensored with the circle cells S^λ ∧ (T/C_m)_+. Finally it owns the circle-equivariant cell decompositions of two cyclic bar constructions: the one for the coordinate-axes monoid (cyclic words without cyclic repetitions) and the relative one for the cusp inclusion ⟨t^a, t^b⟩ ⊂ ⟨t⟩.
2. **Normalization squares of seminormal and cuspidal curves.** It owns the bi-relative K-theory and TC of the squares A → B, A/I → B/I given by the normalization. Through the base's truncating excision these squares reduce K to TC (p-adically) and to cyclic homology (rationally).
3. **Headline calculations.** It owns the coordinate axes in the plane over regular noetherian F_p-algebras, the coordinate axes in affine d-space over perfect fields of every characteristic p > 0 and over ind-smooth Q-algebras, and the planar cuspidal curves y^a = x^b over perfect F_p-algebras. It also owns the truncated polynomial algebras R[x]/x^e over every perfectoid ring R.
4. **Finite chain rings O_K/ϖ^n.** It owns the structure theorem for their p-adic K-groups, Angeltveit's quotient, the even vanishing theorem and v₁-nilpotence. To prove these it owns the supporting relative and filtered prismatic package: prismatic and syntomic cohomology relative to a δ-ring and its filtered variant, crystalline degeneration, Breuil–Kisin orientations and relative-to-absolute descent. That package is included only as far as the finite-chain-ring theorems use it.

**Imported, not re-planned.** Everything listed under Suppliers is imported. In particular this roadmap does not construct a second copy of any of the following:

- THH, TC, the cyclotomic trace, K of stable categories, DGM, henselian rigidity, K^inv, truncating excision, Goodwillie's rational theorem, KABI and continuity (all RefinedTraceMethods);
- the pointed-monoid THH equivalence and Π_e cell decomposition in the classical genuine model (KTheoryFiniteLocalFields §5.16);
- TR^n_{q−λ} of regular noetherian F_p-algebras, and K of truncated polynomial algebras over regular noetherian F_p-algebras and in characteristic zero (KTheoryFiniteLocalFields §5.17);
- big Witt vectors on truncation sets with their F, V and Teichmüller maps (QWittVectors §§1.1–1.5, with the comparison of KTheoryFiniteLocalFields §5.16a);
- de Rham–Witt complexes (CrystallineCohomology);
- syntomic complexes and the motivic filtration on TC (PrismaticCohomologyPartIII §§6.8–6.9, 6.28, 7.0);
- absolute prismatic cohomology, its Nygaard filtration and the Cartier–Witt stack (PrismaticCohomologyPartII Layers 3–4);
- δ-rings, crystalline and Breuil–Kisin prisms and prismatic envelopes (PrismaticCohomology §§0.55, 0.73–0.76, 0.93);
- Bökstedt periodicity for perfectoid rings and relative THH over 𝕊[z] (AInfCohomology §AI.7.2).

**Excluded.**

- **Algorithms.** The algorithmic content of AKN (akn24 Theorem 1.1 as an algorithm, §7 and the tables) is excluded. Low-degree table values may serve only as Checks.
- **Purity.** The height-one purity statement L_{T(1)}K(R) ≃ L_{T(1)}K(R[1/p]) belongs to GeneralAlgebraicKTheoryPartII KII.5. Here it is at most a Check.
- **K of O_K and of local fields.** These belong to KTheoryFiniteLocalFields Layer 6, and this roadmap does not reprove them by the Liu–Wang route.
- **Other excluded work.** Hahn–Levy–Senger's mod (p, v₁) calculation is excluded. So are the non-A¹-invariant motivic refinements (a consumer, see below) and the integral K(ℤ[x]/x^e) beyond what riggenbach-trunc Theorem 1.2 gives.
- **Unowned trace topics left out on purpose.** Real THH and real TC, TC with coefficients (polygonic spectra and Witt vectors with coefficients), logarithmic THH beyond the DVR case of KTheoryFiniteLocalFields §5.9, localizing invariants of inverse limits and continuous K-theory of formal thickenings, and Kaledin's degeneration theorem with the characteristic-p HKR results are all unowned. They belong in separate targets; the report explains why they are not merged here.

## Final targets

1. **Nikolaus–Scholze calculus for pointed-monoid algebras.**
   - **Splitting.** Let k be a commutative ring and Π a pointed monoid with pointed monoid algebra k(Π). There is a natural equivalence of cyclotomic spectra THH(k(Π)) ≃ THH(k) ⊗ Σ^∞B^cy(Π), where B^cy is the reduced cyclic bar construction. Under it the Frobenius is the tensor product of the Frobenius of THH(k) with the unstable Frobenius B^cy(Π) → B^cy(Π)^{hC_p}, followed by the canonical map into the C_p-Tate construction.
   - **Rational version.** HH(k(Π)/k) ≃ HH(k) ⊗ B^cy(Π) as circle-equivariant objects.
   - **Cell computation.** For k a perfect F_p-algebra, a finite-dimensional complex circle representation λ and m ≥ 1, compute π_*TC⁻, π_*TP and the Frobenius on THH(k) ⊗ (S^λ ∧ (T/C_m)_+) in terms of p-typical Witt vectors of k, through the circle Tate spectral sequence. Prove the Tate comparison: for a bounded-below spectrum T with C_p-action and a finite pointed C_p-CW complex X, the lax monoidal map T^{tC_p} ⊗ (Σ^∞X)^{tC_p} → (T ⊗ Σ^∞X)^{tC_p} is an equivalence. The proof uses the Segal comparison of base §2.3 and the vanishing of Tate constructions on induced objects. Prove also its consequence for the Frobenius on the cell pieces (the form used for the cusp in hn-cusp Lemma 2).
   - **Locators.** hn-cusp line 105 (splitting and Frobenius factorization) and Lemma 2 and Proposition 3, pp. 4–5 (hn-cusp line 162, line 179); speirs-trunc Lemmas 7–8 and Corollary 9, pp. 8–10 (speirs-trunc line 304, line 347, line 377), Lemmas 10–11 and Propositions 12–13, pp. 11–14 (speirs-trunc line 408, line 433, line 452, line 534); speirs-axes Lemma 4, p. 6 (speirs-axes line 272), Lemma 15, p. 13 (speirs-axes line 506), Proposition 16, p. 14 (speirs-axes line 532) and the rational Lemma 29, p. 28 (speirs-axes line 1128).
   - **Imports.** Import base §2.10 for unpointed E₁-monoids and KTheoryFiniteLocalFields §5.16 for the classical pointed statement. The design checks which modern clauses are genuinely new.

2. **Coordinate axes in the plane.** Let k be a regular noetherian F_p-algebra, A = k[x,y]/(xy) and I = (x,y). For every integer q there is a canonical isomorphism K_q(A,I) ≅ ⊕_{m≥1} W_mΩ^{q−2m}_k with big de Rham–Witt groups. Equivalently, the q-th group is the direct sum over m ≥ 1 of the products, over 1 ≤ d ≤ m with p ∤ d, of the p-typical groups W_sΩ^{q−2m}_k, where s = s(m,d) is the unique s ≥ 1 with p^{s−1}d ≤ m < p^s d.
   - **General formula.** For every F_p-algebra k, TC_q(A,B,I;p) ≅ ∏_{p∤d} lim_R TR^r_{q−λ_{p^{r−1}d}}(k;p), where B = k[x] × k[y] and λ_j = ℂ(1) ⊕ … ⊕ ℂ(j). The same holds with ℤ/p^v-coefficients for every ring k.
   - **Locators.** hesselholt-axes Theorem A (hesselholt-axes line 21), the p-typical decomposition (hesselholt-axes line 36) and Theorem B (hesselholt-axes line 70).
   - **Route.** Regularity of k identifies K(A,I) with the bi-relative K(A,B,I) (GeneralAlgebraicKTheory §§9.16, 10.5, 10.13). The base's §4.18 identifies bi-relative K with bi-relative TC. KTheoryFiniteLocalFields §5.17 supplies TR^r_{q−λ}(k;p) for regular noetherian k.
   - **Checks.**
     - K_1(A,I) = 0.
     - K_2(A,I) ≅ k, the Dennis–Krusemeyer group.
     - K_3(A,I) ≅ Ω¹_k, which is zero for perfect k.
     - For k = F_2, K_4(A,I) ≅ W_2(F_2) = ℤ/4. For k = F_p with p odd it is F_p ⊕ F_p.

3. **Coordinate axes in affine d-space.** Let d ≥ 2, A_d = k[x_1,…,x_d]/(x_ix_j : i ≠ j) and I_d = (x_1,…,x_d).
   - **Characteristic p.** Let k be a perfect field of characteristic p > 0 (every p, including p = 2). Let J_p be the positive integers prime to p, and let cyc_d(s) be the number of cyclic words of length s and period s in d letters with no cyclic repetitions. Define t_ev(p,r,m′) (respectively t_od(p,r,m′)) as the unique t ≥ 1 with p^{t−1}m′ ≤ 2r < p^t m′ (respectively ≤ 2r+1 <), or 0 if no such t exists. Then K_q(A_d,I_d) is the finite product shown below.
   - **Characteristic 0.** For an ind-smooth ℚ-algebra k, K_q(A_d,I_d) ≅ k^{c_{d−1}(q)} ⊕ (Ω¹_{k/ℚ})^{c_{d−1}(q−1)} ⊕ … ⊕ (Ω^{q−2}_{k/ℚ})^{c_{d−1}(2)}, with the counting function c_{d−1} of speirs-axes §7. The relative cyclic homology formula of speirs-axes Theorem 30 is the intermediate statement.
   - **Locators.** speirs-axes Theorem 1, p. 1 (speirs-axes line 27) and Theorem 2, p. 4 (speirs-axes line 153); index sets as printed, checked against the HTML rendering of arXiv v2 because the text extraction drops the parity subscripts. The cyclic word decomposition is Lemma 11 and Proposition 12, pp. 11–12 (speirs-axes line 426, line 456). Word counts are Lemma 33, p. 30 (speirs-axes line 1250). Characteristic zero is Theorems 30–31, pp. 29–30 (speirs-axes line 1163, line 1228).
   - **Checks.** For d = 2 only cyc_2(2) = 1 is nonzero, and the formula collapses to target 2 over a perfect field: K_{2r} is big W_r(k) and odd groups vanish, for both formulas in p. The paper's p = 2 odd-degree index v is retained as printed and must be checked in the published version, Algebr. Geom. Topol. 21 (2021).

```text
p odd:  K_{2r}   = ∏_{m′∈J_p, m′ even} ∏_{s′|m′, s′ even} ∏_{u ≤ t_ev} W_{t_ev−u}(k)^{⊕cyc_d(p^u s′)}
        K_{2r+1} = ∏_{m′∈J_p, m′ odd}  ∏_{s′|m′}         ∏_{u ≤ t_od} W_{t_od−u}(k)^{⊕cyc_d(p^u s′)}
p = 2:  K_{2r}   = ∏_{m′≥1 odd} ∏_{s′|m′} ∏_{1≤u≤t_ev} W_{t_ev−u}(k)^{⊕cyc_d(2^u s′)}
        K_{2r+1} = ∏_{m′≥1 odd} ∏_{s′|m′} ∏_{0≤v≤t_ev} k^{⊕cyc_d(s′)}
```

4. **Planar cuspidal curves.** Let k be a perfect F_p-algebra and let a, b ≥ 2 be coprime. For m ≥ 1 let ℓ(a,b,m) be the number of pairs (i,j) of positive integers with ai + bj = m. For r ≥ 0 let S(a,b,r) = {m ≥ 1 : ℓ(a,b,m) ≤ r}, a truncation set. Then K_{2r}(k[x,y]/(y^a − x^b),(x,y)) ≅ W_S(k)/(V_a W_{S/a}(k) + V_b W_{S/b}(k)) for S = S(a,b,r), and every odd relative K-group vanishes.
   - **Locators.** hn-cusp Theorem A, p. 1 (hn-cusp line 27), with definitions at hn-cusp line 20 and the p-typical product decomposition at hn-cusp line 43. The mixed-complex input is hn-cusp Theorem 1, p. 4 (hn-cusp line 131). That theorem restates the hypersurface computations of bach-hypersurfaces and larsen-mixed, which are uncertified and cited by locator only. Finiteness of the relevant pointed spaces follows hesselholt-cusp-polytopes §3. The normalization square A = k[t^a, t^b] ⊂ k[t] is cartesian on K → TC by base §4.18 (hn-cusp line 89).
   - **Checks.** For r = 0 the group has length (a−1)(b−1)/2 over W(k) (hn-cusp line 36), the δ-invariant of the cusp. For (a,b) = (2,3) this gives K_0(A,I) ≅ k, the unipotent Picard group of the ordinary cusp. The length formula ½(2r+1)(a−1)(b−1) must hold in every even degree.
   - **Optional consequence.** The rational analogue over ℚ-algebras follows by base §4.17–§4.18 (KABI). The design adds it only if it can cite the cyclic homology input.

5. **Truncated polynomial algebras over perfectoid rings.** For every perfectoid ring R and every e ≥ 1, K_{2r−1}(R[x]/x^e,(x);ℤ_p) ≅ W_{re}(R)/V_e W_r(R) for r ≥ 1, with big Witt vectors on the truncation sets {1,…,n}. The even relative p-adic K-groups vanish.
   - **Locators.** riggenbach-trunc Theorem 1.1, p. 2 (riggenbach-trunc line 67). The syntomic form is sulyma-slopes Theorem 1.1, Corollary 1.2 and Remark 1.3 (sulyma-slopes line 43, line 47, line 52).
   - **Extension.** The F-smooth extension with dim_N ≤ 1 in riggenbach-trunc Theorem 1.2 (riggenbach-trunc line 80) covers complete DVRs with perfect residue field and smooth curves over perfectoid rings. It is an optional extension that the design may include.
   - **Checks.** For R a perfect field this is the Hesselholt–Madsen statement owned by KTheoryFiniteLocalFields §5.17, which must be imported as a test, not reproved. For e = 1 every group vanishes, since V_1 is the identity.

6. **K-theory of finite chain rings.** Let K/ℚ_p be finite, with ring of integers O_K, uniformizer ϖ, ramification index e, residue field F_q (q = p^f), n ≥ 1 and R = O_K/ϖ^n. This covers every quotient of O_K by a nonzero proper ideal, in particular ℤ/p^n.
   - **(a) Structure.**
     - K_r(R) is finitely generated torsion for r ≥ 1.
     - K(R;ℤ[1/p]) ≃ K(F_q;ℤ[1/p]).
     - K_r(R;ℤ_p) ≅ TC_r(R) for r ≥ 0.
     - For i ≥ 1, Z_p(i)(R) is concentrated in cohomological degrees 1 and 2, and it is quasi-isomorphic to a three-term complex of finite free ℤ_p-modules of ranks f(in−1), 2f(in−1), f(in−1).
     - Hence K_{2i−1}(R;ℤ_p) ≅ H¹(Z_p(i)(R)) for i ≥ 1 and K_{2i−2}(R;ℤ_p) ≅ H²(Z_p(i)(R)) for i ≥ 2.
   - **(b) Angeltveit's quotient.** For i ≥ 1, |H¹(Z_p(i)(R))| / |H²(Z_p(i)(R))| = q^{i(n−1)}. Hence for i ≥ 2, |K_{2i−1}(R;ℤ_p)| / |K_{2i−2}(R;ℤ_p)| = q^{i(n−1)}.
   - **(c) Even vanishing.** Put j = ⌈n/e⌉ and [j]_p = 1 + p + … + p^{j−1}. If i ≥ 2 and i − 1 ≥ (p/(p−1))·(p·[j]_p − p^j·(j − n/e)), then K_{2i−2}(R) = 0, and K_{2i−1}(R) has order (q^i − 1)·q^{i(n−1)}.
   - **(d) v₁-nilpotence.** The class v₁ ∈ H⁰(F_p(p−1)(ℤ_p)) acts on ⊕_i F_p(i)(R) with nilpotence degree at most [j]_p, with equality when e | n. For ℤ/p^n the degree is exactly [n]_p.
   - **Locators (akn24).** Proposition 2.1, Corollaries 2.3 and 2.5, pp. 6–7 (akn24 line 274, line 279, line 295); Theorem 1.1, p. 3 (akn24 line 108) and Theorem 2.27, p. 13 (akn24 line 576), structurally only; Corollaries 2.13, 2.14 and 2.16, p. 9 (akn24 line 388, line 397, line 408); Proposition 2.18, p. 9 (akn24 line 419) and Proposition 1.5, p. 4 (akn24 line 162); Theorem 1.4, p. 4 (akn24 line 156), Theorem 5.2, p. 46 (akn24 line 2074) and Corollary 5.6, p. 47 (akn24 line 2091); Theorem 6.3, p. 52 (akn24 line 2330) and Theorem 1.8, p. 5 (akn24 line 197).
   - **Supporting layer.**
     - akn-delta Theorem 1.2 (akn-delta line 126) with its properties (1)–(8), Corollaries 1.3–1.4 (akn-delta line 171, line 177), §7 (relative syntomic cohomology) and §10 (filtered prismatic cohomology).
     - Crystalline degeneration, akn24 Proposition 2.6, p. 7 (akn24 line 325).
     - Relative-to-absolute descent, akn24 Theorem 2.22 and Propositions 2.23–2.24, pp. 11–12 (akn24 line 515, line 532, line 537).
     - Breuil–Kisin orientations, akn24 §4.1. The input to (b) is sulyma-slopes §3 as used at akn24 line 437.
     - akn24 cites the v1 numbering of akn-delta; the manifest records this, and every such locator is re-checked against v2.
   - **Checks.**
     - n = 1 gives Quillen's K(F_q).
     - For n ≤ e, R ≅ F_q[z]/z^n, and (c) holds for all i ≥ 2. This is akn24 Corollary 5.5 (akn24 line 2084), consistent with KTheoryFiniteLocalFields §5.17.
     - K_1(ℤ/4) = (ℤ/4)^× = ℤ/2.
     - In the 2-primary parts of akn24's table (akn24 line 144), K_3(ℤ/4) has order 8 and K_2(ℤ/4) has order 2, ratio 4 = 2^{2·1}. K_3(ℤ/8) has order 32 and K_2(ℤ/8) order 2, ratio 16 = 2^{2·2}. Both agree with (b).
     - The weaker bound i − 1 ≥ p²(p^j − 1)/(p−1)² of akn24 Remark 5.4 does not recover the characteristic-p case. The exact bound must be kept.

This triage writes no Lean. The design's `Suggested.lean` must use one `import Mathlib`, state only headline theorems on carriers that exist, contain no sorry'd data and no `set_option`, and test its own simple definitions with proved examples. Two good candidates for real-bodied definitions are the cusp counting function ℓ(a,b,m) and the truncation set S(a,b,r), the latter tested for divisor-closure. The bound in 6(c) is a third candidate.

## Suppliers

All of these are earlier in `merge-order/ORDER.txt` than this roadmap, which must be placed after RefinedTraceMethods (line 220).

- **RefinedTraceMethods** (open PR, `TauCetiRoadmap/RefinedTraceMethods/README.md`):
  - §2.3 Tate orbit and fixpoint lemmas;
  - §2.6 THH of E₁-rings and free E₁ Bökstedt periodicity;
  - §2.8 symmetric monoidality of THH;
  - §2.9 the Nikolaus–Scholze formula for TC;
  - §2.10 THH and TC of spherical monoid rings with the unstable Frobenius;
  - §4.12 relative K, relative TC and K^inv;
  - §4.17 DGM, henselian rigidity and Goodwillie's rational theorem;
  - §4.18 truncating K^inv, excision with the Land–Tamme ⊙-ring, KABI and continuity;
  - §8.7 syntomic complexes as sheafified even K-groups;
  - §1.4 and §1.9 (cyclic homology, smooth HKR) for the characteristic-zero clauses.
- **KTheoryFiniteLocalFields** (line 79):
  - §§1.1–1.6 normalized K(F_q);
  - §4.0 genuine cyclotomic foundations and representation spheres;
  - §4.4 genuine–modern comparison;
  - §5.1 TC of perfect fields;
  - §5.16 pointed-monoid THH and the Π_e decomposition (classical model);
  - §5.16a big Witt comparison;
  - §5.17 λ-graded TR of regular noetherian F_p-algebras and truncated polynomial K-theory (Checks for targets 5 and 6).
- **QWittVectors** (line 81): §§1.1–1.5 truncation sets, big Witt rings, F, V and Teichmüller maps, and the p-typical comparison.
- **CrystallineCohomology** (line 21): p-typical de Rham–Witt complexes (the CR.4 interface used by the base).
- **GeneralAlgebraicKTheory** (line 5): §§9.16 and 10.5 (Fundamental Theorem, NK = 0 for regular rings), §10.13 (negative K of regular rings), products and relative K.
- **PrismaticCohomology** (line 63): §§0.55–0.56 free δ-rings, §§0.73–0.76 crystalline and Breuil–Kisin prisms, §0.93 envelopes over orientable prisms.
- **PrismaticCohomologyPartII** (line 65): §3.9 Breuil–Kisin twists, Layer 3 Nygaard filtration and completion, Layer 4 absolute prismatic cohomology, WCart and crystals (§§4.4–4.10, 4.18–4.31).
- **PrismaticCohomologyPartIII** (line 67): §§6.8–6.9 syntomic complexes, §6.28 discreteness, §6.31 left Kan extension, §7.0 motivic filtration with gr^i TC ≃ Z_p(i)[2i].
- **AInfCohomology** (line 62): §AI.7.2 Bökstedt periodicity for perfectoid rings and relative THH over 𝕊[z] (target 5).
- StableHomotopyKTheory (line 4) and EnhancedDerivedSheaves (line 17): spectra, completion and Milnor sequences, and stable ∞-categories, as the base already uses them.

Single direction: none of these suppliers uses the curve, perfectoid or finite-chain-ring calculations. The relative-to-δ-ring prismatic package is new here because no prismatic roadmap plans it. If a later prismatic Part claims it before this design is accepted, the design must import it from there instead.

## Consumers

No roadmap on main, in an open pull request or on the board currently cites these calculations. The likely consumers are:

- a future roadmap on non-A¹-invariant motivic cohomology of singular schemes (Elmanto–Morrow, Bouis), whose motivic refinements of exactly these families are bouis-motivic §§2–3;
- arithmetic K-theory of p-adic integers through continuity, where the finite chain ring groups feed lim_n K(O_K/ϖ^n) beside KTheoryFiniteLocalFields Layer 6;
- GeneralAlgebraicKTheoryPartII KII.9 height-one examples, but only as Checks: L_{T(1)}K(ℤ/p^n) = 0 follows from target 6(c), while that roadmap's proof goes through purity.

## Sources

The manifest `packages/RefinedTraceMethodsPartII/sources.toml` records every work cited here. Locators refer to the service's cached extractions and are written as `<source id> line N`. All statements above are paraphrases.

- **akn24**: Antieau–Krause–Nikolaus, *On the K-theory of ℤ/p^n*, arXiv:2405.04329v1 (open repository). Target 6.
- **akn-delta**: Antieau–Krause–Nikolaus, *Prismatic cohomology relative to δ-rings*, arXiv:2310.12770v2 (open repository). Supporting layer of target 6. Its version note records the v1/v2 numbering change.
- **hesselholt-axes**: Hesselholt, *On the K-theory of the coordinate axes in the plane*, arXiv:math/0508251v2; Nagoya Math. J. 185 (2007). Target 2.
- **speirs-axes**: Speirs, *On the K-theory of coordinate axes in affine space*, arXiv:1901.08550v2; Algebr. Geom. Topol. 21 (2021). Targets 1 and 3.
- **speirs-trunc**: Speirs, *On the K-theory of truncated polynomial algebras, revisited*, arXiv:1901.10602v3. Target 1 (method only; its headline result is owned by KTheoryFiniteLocalFields).
- **hn-cusp**: Hesselholt–Nikolaus, *Algebraic K-theory of planar cuspidal curves*, arXiv:1903.08295v2. Targets 1 and 4.
- **hesselholt-cusp-polytopes**: Hesselholt, *On the K-theory of planar cuspical curves and a new family of polytopes*, arXiv:1303.6060v2. Target 4 inputs.
- **riggenbach-trunc**: Riggenbach, *K-theory of truncated polynomials*, arXiv:2211.11110v2. Target 5.
- **sulyma-slopes**: Sulyma, *Floor, ceiling, slopes, and K-theory*, arXiv:2110.04978v2; Ann. K-Theory 8 (2023). Targets 5 and 6.
- **bouis-motivic**: Bouis, *On the motivic cohomology of some singular rings*, arXiv:2608.05220v1. Consumers only.
- **bach-hypersurfaces**: Guccione–Guccione–Redondo–Villamayor, *Hochschild and cyclic homology of hypersurfaces*, Adv. Math. 95 (1992). Recorded `uncertified` (publisher page only).
- **larsen-mixed**: Larsen, *Filtrations, mixed complexes, and cyclic homology in mixed characteristic*, K-Theory 9 (1995). Recorded `uncertified` (paywalled).

For bach-hypersurfaces and larsen-mixed, target 4 relies on the restatement in hn-cusp Theorem 1, which is read; no final target relies on unread contents. No text is outstanding, so `needs-references.toml` is not needed.

## Risks

- **Size of the prismatic support for target 6.** akn-delta is a 110-page foundation, covering relative and filtered prismatic cohomology over δ-rings, prismatization relative to a δ-ring and the comparison theorems. akn24 adds a long envelope and Hopf-algebroid calculation (§§3–4). This part dominates the roadmap. If it proves too large, the design should split it into a prismatic Part (placed before this roadmap) rather than shortcut it, for example by treating only ℤ/p^n.
- **Version drift.** akn-delta v2 (May 2026) renumbers the results that akn24 v1 cites, so locators must be re-derived. akn24 has no published version yet, so its numbering may still change.
- **Unread classical inputs.** The cusp mixed complex goes back to bach-hypersurfaces and larsen-mixed, which are paywalled. The roadmap must rely on hn-cusp Theorem 1's restatement, or find a legal copy, for example in Leip's Copenhagen thesis on Hochschild homology of hypersurfaces as mixed complexes, which this job could not fetch.
- **Generality gaps in the sources.** Target 3 in characteristic p is proved only over perfect fields, while target 2 holds over regular noetherian F_p-algebras. Target 4 is proved only over perfect F_p-algebras. The general statements over regular F_p-algebras are not in the literature found, and the design must not assert them. If it attempts them, through KTheoryFiniteLocalFields §5.17's λ-graded TR, they are new mathematics and must be marked as such.
- **Carriers far above the pinned libraries.** Mathlib and Tau Ceti have p-typical Witt vectors but no big Witt vectors, cyclic bar constructions, THH, TC or syntomic complexes. `Suggested.lean` can therefore state only combinatorial and Witt-level shadows of the headlines, unless the suppliers' carriers land first.
- **Printed index ambiguities.** The p = 2 odd-degree index in speirs-axes Theorem 1 must be checked against the published version before it is transcribed into a target.
