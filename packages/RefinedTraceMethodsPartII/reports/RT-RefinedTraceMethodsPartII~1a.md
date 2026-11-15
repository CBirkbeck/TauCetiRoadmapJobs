<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6897746840 -->
Red team round 1 pass a (claude) of b83e78b

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) The Layer 3 worked example on `k[t]` is false: `TC_1(k[t],(t)) = 0`

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:453` (Layer 3, Examples): "the kernel of φ − can is `lim_R W_{v+1}(k) = W(k) ≠ 0`. So the relative TC of the non-henselian pair `(k[t],(t))` is nonzero in degree 1".

   **Claim.** For a perfect field k, the weight-p^v summands of `THH(k[t])` give a nonzero class group `W(k)` in `TC_1(k[t],(t))`.

   **Witness.** The value is computed on the product `∏_v X_v^{hT}`, but `X_v = THH(k) ⊗ (T/C_{p^v})_+` has connectivity 0 for every v, so §2.3 (README line 295) does not apply and `(⊕_v X_v)^{hT} ≠ ∏_v X_v^{hT}`. Computed values:

   - On the sum, `π_1` of `(⊕_v X_v)^{hT}` is the set of families `(x_v) ∈ ∏_v W_{v+1}(k)` that tend to 0 p-adically (the homotopy-fixed-point tower is a limit of finite stages, each of which commutes with sums, and stage n sees `W_{min(n,v+1)}(k)`). A compatible family is the image of one `x ∈ W(k)`; it tends to 0 only if x = 0. Kernel 0, not W(k).
   - Independent check: k[t] is smooth of dimension 1 over a perfect field, so `TC_1(k[t];ℤ_p)` is filtered by `H^{2i−1}(ℤ_p(i)(k[t]))`. For i = 1 this is the derived p-completion of `k[t]^× = k^×`, which is uniquely p-divisible, so 0. For i = 0 the degree is −1, and for i ≥ 2 the complex vanishes on a curve. Hence `TC_1(k[t];ℤ_p) = 0`, and `TC_2(k[t]) → TC_2(k)` is split surjective, so `TC_1(k[t],(t)) = 0`.

   The example also contradicts the roadmap's own negative control at README line 304 (sum versus product without growing connectivity).

   **Repair.** Replace the paragraph by:

   > For a perfect field k and the weight-p^v summands `X_v = THH(k) ⊗ (T/C_{p^v})_+` of `THH(k[t])`, in degree 1: `A_v = π_0THH(k)^{hC_{p^v}} = W_{v+1}(k)` and `B_v = W_v(k)`. Here φ is an isomorphism for every v and c is the restriction R, so no finite s exists and the staircase lemma does not apply. The product decomposition does not apply either: the connectivity of `(T/C_{p^v})_+` does not grow with v, so `(⊕_v X_v)^{hT}` is not `∏_v X_v^{hT}` (§2.3). On the product the kernel of φ − can would be `lim_R W_{v+1}(k) = W(k)`. On the sum, the degree-1 group consists of the families in `∏_v W_{v+1}(k)` that tend to 0 p-adically, and a compatible family does so only if it is 0; indeed `TC_1(k[t],(t)) = 0`. A calculation that used the product for `k[t]` would therefore produce a spurious `W(k)` in degree 1, where `K_1(k[t],(t)) = 0`. The polynomial ring is outside the range of the Layer 3 calculus, and Layer 4 is what reduces the axes and cusps to pieces whose connectivity grows.

   Tested on the refuting instance: the new text gives 0 in degree 1, the computed value. If the repair worker wants to keep a witness that relative TC and relative K differ for `(k[t],(t))`, the true one is in degree −1: `H¹_ét(Spec k[t]; ℤ/p) = k[t]/(F − 1)k[t]` contains the class of t, which is not of the form `f^p − f + c` (the degree of `f^p − f` is 0 or divisible by p), while `K_{−1}(k[t],(t)) = 0`. It needs a supplier section that identifies `TC_{−1}` with `H¹_ét(−;ℤ_p)`; cite it or leave the witness out.

2. **F02** (P2) §8.1 drops the pre-prismatic condition from "relatively quasiregular semiperfectoid", and never defines "pre-prismatic"

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:677`: "it admits a pre-prismatic factorization `A → A′ → R` with A → A′ p-completely relatively perfect, `A′ → R` surjective and `L_{R/A′}` of p-complete Tor-amplitude in [1,1]".

   **Claim.** These three conditions define a relatively qrsp δ-pair, which then has "a chosen prism `(A′, I)`" (README line 725).

   **Witness.** akn-delta Definition 9.2 (line 1844) also requires `(A′,R)` to be pre-prismatic (Definition 2.2, line 307), and both Definitions 9.1 and 9.2 start from a bounded δ-pair. Counterexample to the README's list: `(ℤ_p, ℤ/p²)` with `A′ = ℤ_p`. The identity is relatively perfect, `ℤ_p → ℤ/p²` is surjective and `L = (p²)/(p⁴)[1]` has Tor-amplitude in [1,1]. But every invertible ideal in the kernel is `(p^m)` with m ≥ 2, and `δ(p^m u)` lies in `pℤ_p`, so it is not a unit in ℤ/p²: no prism `(A′, I)` exists, and the agreement property of §8.3 has nothing to agree with. (ℤ/p² is not qrsp for any A′: a perfectoid ring has an element π with `π^p = p·unit`, and its image x in ℤ/p² would be nilpotent, so `x ∈ (p)` and `x^p = 0 ≠ p·unit`.) The word "pre-prismatic" is used three times and defined nowhere in the README.

   **Repair.** In §8.1 replace the two sentences by:

   > A bounded δ-pair is relatively quasisyntomic if R is derived p-complete and `L_{R/A}` has p-complete Tor-amplitude in [0,1]. A δ-pair `(A′, R)` is pre-prismatic if the kernel of `A′ → R` contains an invertible ideal I such that, Zariski locally on Spec A′, a generator d of I has δ(d) mapping to a unit of the p-completion of R (akn-delta Definition 2.2, line 307). A bounded δ-pair (A, R) is relatively quasiregular semiperfectoid if R is p-complete and there is a factorization `A → A′ → R`, called a pre-prismatic factorization, with A → A′ a p-completely relatively perfect map of δ-rings, `(A′, R)` pre-prismatic, `A′ → R` surjective and `L_{R/A′}` of p-complete Tor-amplitude in [1,1]; after localizing and completing, `(A′, I)` is a prism (akn-delta Definitions 9.1–9.2, lines 1838–1852).

   Add the Check: "`(ℤ_p, 𝔽_p)` is relatively qrsp with A′ = ℤ_p and I = (p), since `δ(p) = 1 − p^{p−1}` is a unit of 𝔽_p. `(ℤ_p, ℤ/p²)` with A′ = ℤ_p meets the other three conditions but is not pre-prismatic: `δ(p²) = p − p^{2p−1}` is not a unit of ℤ/p²." Tested: the repaired definition excludes `(ℤ_p, ℤ/p²)` and keeps `(ℤ_p, 𝔽_p)`.

3. **F03** (P3) The scope paragraph promises `L_{T(1)}K(ℤ/p^n) = 0` as a consequence of §9.6, and no target states it

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:29`: "Here `L_{T(1)}K(ℤ/p^n) = 0` appears only as a consequence of the v₁-nilpotence theorem (§9.6), by a route independent of purity."

   **Claim.** The roadmap derives the T(1)-vanishing in §9.6.

   **Witness.** `T(1)` occurs in the README only at line 29. §9.6 (lines 884–894) proves nilpotence of v₁ on the motivic associated graded `⊕_i 𝔽_p(i)(R)`. Passing to the spectrum `K(ℤ/p^n;𝔽_p)` needs a ring structure and the filtration bound of akn24 Corollary 6.5 and Remark 1.9 (lines 202–205), which no layer states.

   **Repair.** Either cut the sentence to "This roadmap does not state `L_{T(1)}K(ℤ/p^n) = 0`; §9.6 proves only the nilpotence of v₁ on the motivic associated graded.", or add to §9.6 the target "for every n ≥ 1, v₁ acts nilpotently on `K_*(ℤ/p^n;𝔽_p)`, hence `L_{T(1)}K(ℤ/p^n) = 0`" with its locator (akn24 Corollary 6.5 and the paragraph at lines 184–196) and its *Needs:* (completeness and finiteness of the motivic filtration from §9.2).

4. **F04** (P3) Layer 9 fixes `j = ⌈n/e⌉` "throughout" and then uses j for the F-weight

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:797` ("Throughout, … `j = ⌈n/e⌉`") against lines 819–820 and 834: "For j ≥ 1, `gr^j_FΔ̂_{R_0} ≅ W(𝔽_q)/{j,n}[−1]`", "vanishes for j = 0 and for j ≥ in", "`Σ_j ε(i,j) = i(n−1)`".

   **Claim.** One letter, two meanings in the same layer.

   **Witness.** For ℤ/4 the standing value is j = 2, while §9.2 at i = 1 needs the weights j = 1 (nonzero) and j ≥ 2 (zero); read with the standing j, "vanishes for j ≥ in" says `gr^2_F` vanishes because 2 ≥ 2, which is a statement about one weight only. §1.5 already writes the weight as j′ (`ε(i,j′)`).

   **Repair.** In §9.2 and §9.3 write the F-weight as j′ everywhere: "`gr^{j′}_FΔ̂_{R_0} ≅ W(𝔽_q)/{j′,n}[−1]`", "`gr^{j′}_FN^{≥i}Δ̂_{R_0} ≅ W(𝔽_q)/p^{ε(i,j′)}{j′,n}[−1]`", "{j′,n} is n if n | j′ and j′ otherwise", "`gr^{j′}_Fℤ_p(i)(R)` … vanishes for j′ = 0 and for j′ ≥ in", "`Σ_{j′} ε(i,j′) = i(n−1)`".

5. **F05** (P3) A §9.2 Check whose negative control does not discriminate

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:829`: "A window [0, in − 1] would include `gr^0`, which is ℤ_2(1)(𝔽_2) = 0 here but nonzero in weight 0."

   **Claim.** The window `[1, in−1]` is told apart from `[0, in−1]`.

   **Witness.** akn24 Corollary 2.13(iii) and Corollary 2.14 (lines 391 and 398): `gr^0_Fℤ_p(i)(R) ≃ 0` for every i ≥ 1, and `F^{[0,in−1]}` and `F^{[1,in−1]}` are equivalent. The two windows give the same answer for every i in the statement; "weight 0" (i = 0) is outside it.

   **Repair.** Replace the last sentence by: "The upper end is sharp: for ℤ/4 and i = 1 the window is [1,1], and the smaller window [1, in − 2] = [1,0] is empty and would give 0 instead of H¹ = ℤ/2. The lower end may be taken to be 0 or 1, since `gr^0_Fℤ_p(i)(R) ≃ 0` for i ≥ 1 (akn24 Corollary 2.13(iii), line 391)." Tested: 0 ≠ ℤ/2.

6. **F06** (P3) "Tau Ceti has no algebraic K-theory … no cyclic homology" is not what the pin shows

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:69` ("Mathlib and Tau Ceti have no big Witt vectors, cyclic bar constructions, THH, TC, algebraic K-theory, cyclic homology or syntomic complexes at the pins") and `packages/RefinedTraceMethodsPartII/Suggested.lean:17–19`.

   **Claim.** Neither library has anything of K-theory or cyclic theory.

   **Witness.** Pinned Tau Ceti: `TauCeti/CategoryTheory/GrothendieckGroup/IsoClassModel.lean:199` (`def K0`), `TauCeti/RingTheory/HochschildCohomology/Complex.lean:166` (`hochschildCohomology`), and the folder `TauCeti/RingTheory/CyclicCohomology/` (Hochschild coboundary, Connes operator, cyclic and periodic cohomology of cochains). No higher K-groups, no relative K-groups of a ring and ideal, no cyclic homology `HC_q` or mixed complexes were found (grep for `K₁`, `Hochschild homology`, `cyclicHomology`, `BigWitt`, `deRhamWitt`, `Prism`, δ-rings: no declaration).

   **Repair.** README line 69: "Mathlib and Tau Ceti have no big Witt vectors, cyclic bar constructions, THH, TC, higher or relative algebraic K-groups, cyclic homology, mixed complexes or syntomic complexes at the pins. Tau Ceti has a Grothendieck group (`TauCeti/CategoryTheory/GrothendieckGroup`) and Hochschild and cyclic cohomology of cochains (`TauCeti/RingTheory/HochschildCohomology`, `TauCeti/RingTheory/CyclicCohomology`); the theorems here need the relative groups `K_q(A,I)` for all q and the homology theories `HH`, `HC` with their circle action, which those do not give." `Suggested.lean` lines 17–20: "…because Mathlib and Tau Ceti have no higher or relative algebraic K-groups (Tau Ceti has only a Grothendieck group), no topological Hochschild homology or topological cyclic homology, no cyclic homology (Tau Ceti has cyclic cohomology of cochains only), no big Witt vectors, no de Rham–Witt complex and no syntomic complexes". No statement changes: no headline becomes statable (the r = 0 case of §6.2 through a Grothendieck group would be a stand-in for one degree of the theorem).

Six findings: one P1, one P2, four P3. Both declared supplier gaps are precise, minimal and declared with the same slug in `design/plan.json` and in the README; they are not raised. The whole README (930 lines) and the whole `Suggested.lean` (83 lines) were read.

## The adversarial pass: Suggested.lean declarations

No `variable` or `include` block; no instance arguments; every binder is in the signature. The elaborated types in the job's signature listing were compared with the README statements: all six agree, no binder lost. I did not run Lean.

| Declaration | Context | Instances tried | Values on each side | Result |
| --- | --- | --- | --- | --- |
| `cuspCount a b m` | `a b m : ℕ` | (2,3,m) for m = 1..18; m = 0 | ℓ = 0 on {1,2,3,4,6}; ℓ(5) = ℓ(7) = ℓ(8) = ℓ(9) = ℓ(10) = ℓ(12) = 1; ℓ(11) = 2 [(4,1),(1,3)]; ℓ(17) = 3; m = 0 gives the empty box, 0 | Matches README §1.1 for positive a, b; the box `Icc 1 m` loses no pair when a, b ≥ 1 |
| `cuspTruncationSet a b r` | — | (2,3,0), (2,3,1), (2,5,0) | {1,2,3,4,6}; {1,…,10,12}; {1,2,3,4,5,6,8,10} | Matches |
| `cuspCoprimeSet a b r` | — | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | {1}; {1,5,7}; {1,5,7,11,13}; {1,3} | Matches |
| `ncard_cuspTruncationSet` | `2 ≤ a`, `2 ≤ b`, coprime, r | (2,3,0), (2,3,1), (2,5,0) | 2·5+2 = 12 = 3·4; 2·11+2 = 24 = 12+12; 2·8+2 = 18 = 3·6 | True on instances; coprimality needed (for (2,2) the set is infinite, ncard 0, 2 ≠ 9) |
| `ncard_cuspCoprimeSet` | same | (2,3,0), (2,3,1), (2,3,2), (2,5,0); general inclusion–exclusion | 2·1 = 1·1·2; 2·3 = 3·1·2; 2·5 = 5·1·2; 2·2 = 1·1·4; `#S − (r+1)b − (r+1)a + (r+1) = (r+½)(a−1)(b−1)` | True; natural subtraction harmless since a, b ≥ 2 |
| `card_noCyclicRepetition` | `d : ℕ`, `1 ≤ m` | (d,m) = (0,1), (1,3), (2,1), (2,2), (3,2), (3,3), (3,4), (3,6); m = 0 excluded | 0 = (−1)+1; 0 = 0; 0 = 1−1; 2 = 1+1; 6 = 4+2; 6 = 8−2; 18 = 16+2; 66 = 64+2; at m = 0 the left side would be 1, the right d | True; the hypothesis m ≥ 1 is needed and present |

Padding probe: none of the three theorems follows from one tactic or one library lemma (no chromatic polynomial of a cycle and no Sylvester count at the pins; the job's library-match list has no same-statement hit). Headlines: the K-theoretic end theorems (§§5.2–5.4, 6.2, 7.2, 9.2–9.6, Layer 8) are not statable at the pins and are named in the module docstring with what each lacks; nothing is stated in their place.

## The adversarial pass: README targets

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, Witt sign | `τ(1)+τ(1)` in `W_{{1,2}}(ℤ)` | ghost (2,2) gives (2,−1); `(1−2t)^{−1}(1+t²)^{−1} = 1+2t+3t²` mod t³ | Pass | None |
| Conventions, Verschiebung | 𝔽_2, e = 2, r = 1 | `W_2(𝔽_2)/V_2W_1 = ℤ/2`, order of `1 + x𝔽_2[x]/x²` is 2 | Pass | None |
| §1.1 `ℓ(m+ab) = ℓ(m)+1`, divisor monotonicity, the four cardinalities | (2,3): m = 1, 6; (2,3,0) | ℓ(7) = 1, ℓ(12) = 1; #S/a = 3 = b, #S/b = 2 = a, #S/ab = 1; 5−3−2+1 = 1 | Pass | None |
| §1.2 kernel of restriction | S = {1,2}, n = 2, 𝔽_2; n = 1; S = {1..4}, n = 2 | 4/2 = 2 = #𝔽_2; both 0; `W_{{1,3}}(𝔽_2)` has 4 elements, `W_{{1,2,3}}(𝔽_2)` 8 | Pass | None |
| §1.3 `h = s_T(m′)` | (2,3,0,2), (2,3,0,5), S = {1..4}, p = 2 | h(1) = min(3,1) = 1, others 0; h(1) = 1; s(1) = 3, s(3) = 1, sum 4 | Pass | None |
| §1.4 cyc and c | d = 3: s = 2..6; d = 2; c_1, c_2(2), c_2(3), c_2(4) | 3, 2, 3, 6, 9; cyc_2(2) = 1, cyc_2(4) = 0; 1/0, 3, 2, 6 | Pass | None |
| §1.5 B and ε | ℤ/4; 𝔽_2[z]/z³ with e = 3; i = n = 2; n = 1 | B = 12; B = 4; count 2; count 0; `B = p·(exponent (a) of §9.5)/((p−1)e)` | Pass | None |
| §2.1–2.2 | Π_0, Π_e, Π_2 weights 1 and 2, ⟨t⟩_+ | ranks 1 and e; `(T/C_1)_+`; cofibre of `(T/C_1)_+ → (T/C_2)_+` with d = ⌊1/2⌋ = 0 | Pass | None |
| §2.3 splitting and convergence | Π_0; 𝔽_p, Π_2 weight 1; `ℚ[β^{±1}]` | identity; dimension 1 in each degree ≥ 0; `⊕ℚ → ∏ℚ` not onto | Pass | None |
| §2.4 | ℚ[t] weight m; s odd, i even over 𝔽_2 and ℚ | HC = ℚ in degree 0; 𝔽_2 in degrees m−1, m; 0 | Pass | None |
| §2.5 cell types | d = 2, s = 2; x_1x_2x_3; birelative count | degrees m−1, m in all three cases; degrees 2, 3; total fibre leaves exactly the words of period ≥ 2 | Pass | None |
| §2.6 cusp mixed complex | (2,3): m = 1, m = 6 | `ℤ ⊗ T_+`; H_0 complex `ℤ → ℤ² → ℤ` exact, H_1 complex `(2,3)` then `(3,−2)` exact, so contractible | Pass | None |
| §3.1 | `Z = C_{p+}`, S⁰, `S⁰ ∨ EC_{p+}` | 0 = 0; identity; `ℤ/p → ℤ/p ⊕ ℤ/p` | Pass | None |
| §3.2 | m = 1, m = p, X = Hℤ | `ΣHℤ`; ℤ/p in odd degrees; dualizing shift `S^{−1}` consistent with `ΣX_{hT} → X^{hT}` | Pass | None |
| §3.3 | E = Hℤ, E = 𝕊 | `BGL_1(Hℤ) = K(ℤ/2,1)`; `Σ^∞CP^∞` has η on the bottom cells, `Σ²Σ^∞_+CP^∞` does not | Pass | None |
| §3.4 | n = 0, 1, 2 over 𝔽_p | `R[u]`; `π_0` of fixed points `ℤ/p^{n+1}`, of Tate `ℤ/p^n`; relation `d·d̃_n` in degrees ≥ 0, `d̃_n` below | Pass | None |
| §3.5 staircase | general s; s = 0; s = 2; all maps 0 | free parameter x_s, and `x_{s−1} = φ^{−1}c_s x_s` with c_s invertible, so kernel ≅ A_{s−1}; 0; W_2(k); infinite | Pass | None |
| §3.6 | N = 3, `S^{λ_1} ∧ T_+` | fibre of φ_p in degrees ≤ −3, so isomorphism for j ≥ N − 1; π_1 source 0, target `π_{−2}` ≠ 0 | Pass | None |
| Layer 3 Examples | perfect field k, `k[t]` | README: W(k) in degree 1; computed: 0 | **Fail** | R01 |
| §4.1–4.3 | product square; ℤ → ℤ/p; `𝔽_p[ε]/ε²`; K_0 and K_1 of A_d by Mayer–Vietoris | 0; not Milnor; `NK_1 ≠ 0`; `K_0(A_d) = ℤ`, `K_1(A_d) = k^×` | Pass | None |
| §4.2 cusp conductor | (2,3) | `c = t²k[t]`, A/c = k, B/c = k[t]/t² | Pass | None |
| §5.1 | q ≤ 1; q = 2; stabilization against the §5.17 formula | 0; k; R an isomorphism exactly when q < 2p^{r−1}d | Pass | None |
| §5.2 | q = 2, 4 (p odd, p = 2); 𝔽_3, q ≤ 6 | k; `Ω² ⊕ k ⊕ k`, `Ω² ⊕ W_2(k)`; 0, 𝔽_3, 0, 𝔽_3², 0, ℤ/9 ⊕ 𝔽_3 | Pass | None |
| §5.3 | d = 2 against §5.2; d = 3: q = 1, 2, 3, 4, 5 for p = 2, 3, 5 | agree; q = 1: 0; q = 2: k³; q = 3: k² for all three primes; q = 4: length 9 for p = 2 (`W_2³ ⊕ W_1³`), 3 and 5; q = 5: k^8 | Pass; the corrected p = 2 odd formula is confirmed by the staircase with s = t_od | None |
| §5.4 | d = 2; q = 2; ℚ(t), q = 3 | `⊕Ω^{q−2m}`; `k^{d(d−1)/2}`; `Ω¹` | Pass | None |
| §6.1–6.2 | (2,3,0) p = 2; (2,3,1) p = 5, 3; (2,5,0) p = 3; (2,3,2) p = 2, 5 | 𝔽_2; ℤ/25 ⊕ 𝔽_5, 𝔽_3³; ℤ/9; 𝔽_2^5, ℤ/25 ⊕ 𝔽_5³ | Pass | None |
| §7.1–7.2 | e = 1; (𝔽_2, 2, 1); (𝔽_3, 2, 2); O_C; (𝔽_p, p, 1); `s_T(u)` against the case formula | 0; ℤ/2; ℤ/9; O_C; `𝔽_p^{p−1}` of exponent p; equal in both cases | Pass | None |
| §8.1 definitions | (ℤ_p, ℤ/p²) with A′ = ℤ_p | meets the listed conditions, no prism | **Fail** | R02 |
| §8.1 boundedness | `ℤ_p ⊕ ⊕ℤ/p^n`; `ℤ_p{y}[z_n]/(y^n z_n)` along y ↦ p | unbounded; p-torsion free before, `z_n` of order p^n after | Pass | None |
| §8.2 finite-stage formula | 𝔽_2, i = 1, j = 1, 3; `(ℤ_2⟦z⟧, ℤ_2)`, i = 1, j = 2, 3 | 0 at j = 3, `𝔽_2 ⊕ 𝔽_2[−1]` at j = 1; direct H⁰ = k, H¹ = k² (image: b_0 = b_1, b_2 = 0); j = 3 gives the same, j = 2 gives 0 and k | Pass; the strict bound is right and the printed one fails | None |
| §8.2 syntomic complex | 𝔽_p weight 0; c = 2·id | `ℤ_p ⊕ ℤ_p[−1]`; 0 | Pass | None |
| §8.3–8.4 | A = R = ℤ_p, i = 0; ℤ/4, i = 1; `ℤ_p⟦x⟧ → ℤ_p` | `ℤ_p ⊕ ℤ_p[−1]`; ℤ/2 in H¹; `Tor_1 = ℤ_p` | Pass | None |
| §8.5–8.6 | filtered Breuil–Kisin pair; ℤ/4 against `𝔽_2[z]/z²`; `ℤ_p⟨z⟩` | `W(k)·z^u` on both sides; K_3: ℤ/8 against 𝔽_2²; 1 + z not a unit | Pass | None |
| §9.1–9.3 | n = 1; ℤ/4; ℤ/8, i = 2, 3; `𝔽_2[z]/z³`, i = 2, 3 | 0; ℤ/2; 32/2 = 2⁴, 128/2 = 2⁶; 16/1 = 2⁴, 64/1 = 2⁶ | Pass (notation: R04; Check: R05) | R04, R05 |
| §9.4 | p = 2, n = 3, s = 0: intervals [2,2], [3,3]; u = 0 relation | z_0²; f_0; `x^p = R_0 + (−p + d^pλ_0)δ(x)` from `δ(dx) = δ(r)` | Pass | None |
| §9.5 | ℤ/4; n ≤ e; `𝔽_2[z]/z³` | exponents 6 and 3, B = 12; B = p²n/((p−1)e), tends to 0; 4 | Pass | None |
| §9.6 | n = 1; ℤ/4; e = 2, n = 3 | degree 1 (v₁ maps to `𝔽_p(p−1)(𝔽_q) = 0`); 3; bound p + 1 only | Pass | None |
| Scope, line 29 | — | no target states the T(1)-vanishing | **Fail** | R03 |

## Dependency check

```text
depcheck: 245 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every named supplier is on main (StableHomotopyKTheory, EnhancedDerivedSheaves, BordismFormalGroups) or earlier in the merge order. GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII are named only as owners of what is left out, not as suppliers.

## Copyright, licences and scope

- **Wording.** 16 passages compared with 9 sources: the definitions of ℓ, S and h (hn-cusp lines 20–57), Lemma 1.4 and Corollaries 1.6–1.7 (hesselholt-cusp-polytopes), the word definitions and Lemma 33 with its proof (speirs-axes lines 17–26, 1250–1263), the proof of Theorem 30 against the §5.4 route, Theorem B and the stabilization remark (hesselholt-axes lines 70–85), Theorems 1.4 and 1.8 and the proof of Proposition 2.18 against §9.3 (akn24), Theorem 1.2, Lemma 8.5 with its proof and Definitions 9.1–9.2, 10.2–10.6 (akn-delta), Theorem 1.1 (riggenbach-trunc, sulyma-slopes), Proposition 5.1 (amm-perfectoid), and the three docstrings of `Suggested.lean`. Apart from formulas and standard names, no run of more than about eight consecutive words is shared.
- **Arrangement.** akn24 and akn-delta have the largest shares, about 44 locators each of about 189. Against akn24's contents: §9.1 ↔ 2.1, §§9.2–9.3 ↔ 2.2, §9.4 ↔ 2.3 with 3 and 4, §9.5 ↔ 5, §9.6 ↔ 6. This is not one to one, it covers one layer of nine, and the order is forced by the *Needs:* lines (§9.2 needs §9.1; §9.3 needs §9.2; §9.4 needs §9.2; §9.5 needs §§9.3–9.4; §9.6 needs §§9.4–9.5). Against akn-delta: §8.1 draws on its §§2 and 9, §8.2 on §8, §8.3 on §§1–6 and 9, §8.4 on §§7–8, §8.5 on §10; not in the source's order. No finding.
- **Reuse.** The README reproduces no table or figure. The K-group values taken from akn24's table (line 144) are six groups used as Checks, stated in the roadmap's own sentences with the locator.

Source independence: 16 passages compared with 9 sources, none shared; largest share akn24 and akn-delta, about 44 each of about 189 locators; contents compared with akn24 and akn-delta: independent.

## Verified sound

- **Declarations read:** 6 of 6 (3 definitions, 3 theorems) and the module docstring. Single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only, namespace and docstring form as required. Every Lean name occurs in the README and every backticked name of the roadmap's own is declared.
- **Targets read:** all nine layers, 40 numbered sections, with their Checks and Examples. Check bullets read: 139; every one with a computable value was recomputed (the values are in the two tables above), 1 fails to discriminate (R05), and 1 worked example outside the Checks is false (R01). Every definition has at least three Checks.
- **Locators verified against the cached texts:** 47, in 9 sources. speirs-axes lines 17–26, 27–64, 153–191, 360–366, 426–435, 456–459, 506–509, 603–606, 709–711, 976–982, 1093–1116, 1163–1190, 1228–1230, 1250–1251, 1264–1305; hn-cusp lines 20–30, 36–37, 43–57, 89–104, 131–142, 162–168, 179–184; hesselholt-cusp-polytopes lines 329–336, 373–382, 384–390, 395–401; akn24 lines 108–112, 144–153, 156–158, 162–164, 172–183, 197–210, 388–399, 408–411, 419–452; akn-delta lines 121–154, 163–170, 200–213, 296–310, 1599–1608, 1753–1787, 1838–1852, 1986–2011, 2105–2135, 2381–2391; riggenbach-trunc lines 67–79, 99; hesselholt-axes lines 36–41, 70–85; sulyma-slopes lines 43–48; amm-perfectoid lines 558–559.
- **Source corrections the README makes, each confirmed:** the p = 2 odd-degree index of speirs-axes Theorems 1–2 (printed `0 ≤ v ≤ t_ev`, which gives a nonzero K_1 for d = 3); the missing p-completion in speirs-axes Lemma 15; the bound of akn-delta Proposition 8.6 (printed `(p−1)j ≥ i`, refuted at p = 2, i = 1, j = 1 and j = 2); the additive exponent `p^j` against akn24 footnote 1; the restriction of the length formula to perfect fields.
- **Sibling citations checked at their current heads (through `roadmaps show`):** every section and layer id the README cites, in 14 roadmaps, all present as a heading or a numbered bold item: RefinedTraceMethods §§1.2–1.4, 1.9, 2.1, 2.3–2.6, 2.8–2.10, 2.13, 2.16, 4.12, 4.17, 4.18; KTheoryFiniteLocalFields Conventions, §§1.1–1.6, 2.1, 4.0, 4.4, 5.1, 5.16, 5.17, Layer 6; QWittVectors §§1.1–1.5, 1.4a; CrystallineCohomology CR.2, CR.4; DerivedDeRhamCohomology §§1.14–1.17, Layers 2 and 5; GeneralAlgebraicKTheory §§8.1, 10.5; SchemeKTheoryOperations §5.2; AInfCohomology AI.0, §AI.7.2; PrismaticCohomology §§0.55–0.56, 0.73–0.76, 0.93, 1.2–1.4, 2.1–2.13; PrismaticCohomologyPartII §§3.6, 3.9, 3.10, 3.19, 3.20, 3.24, 4.4–4.10, 4.17–4.19, 4.22, 4.23, 4.25, 4.29, 4.31; PrismaticCohomologyPartIII §§6.8, 6.9, 6.28, 6.31, 7.0; StableHomotopyKTheory §§7.9–7.10, 7.14–7.18; EnhancedDerivedSheaves §§E5:abstract.1–2, E5:presentability.2; BordismFormalGroups §F6.5. Content compared with the README's use for: RefinedTraceMethods §2.3 (three Tate statements), §2.4 (`D_{BT} = Σ𝕊`, `D_{BC_m} = 𝕊`), §2.10 (unpointed E₁-monoids and ψ_p), §4.17 Checks (ℤ → ℤ/p); KTheoryFiniteLocalFields Conventions (`𝕎_N`, `(1 − at)^{−1}`), §5.16 (cofibre sequence with d = ⌊(s−1)/e⌋), §5.17 (the TR formula with ℓ_s); QWittVectors §1.4 (the expansion `x = Σ V_dτ(x_d)`), §1.4a (γ_N), §1.5 (`Div(p^a)`); SchemeKTheoryOperations §5.2 (`NK_n = 0`); AInfCohomology §AI.7.2 (Bökstedt periodicity, trace coefficients, `(X^{tT})^∧_p ≃ (X^{tC_p})^{h(T/C_p)}`); PrismaticCohomologyPartII §4.31 Checks (cofibre of φ on `Δ_{ℤ_p}`).
- **Pinned declarations checked:** `ArithmeticFunction.moebius_mul_coe_zeta` (Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:177), `finRotate` (Mathlib/Logic/Equiv/Fin/Rotate.lean:27), the Witt-vector files and `verschiebung`, `frobenius`, `teichmuller`, Mathlib/RingTheory/Perfectoid (FontaineTheta, Untilt), `TauCeti.NodeAlgebra` with `coord`, `coord_zero_mul_coord_one`, `lift` (TauCeti/RingTheory/Node/Basic.lean:37, 65, 75, 97; the quotient is by `X 0 * X 1 - C a`), `TauCeti.Perfectoid.IsIntegralPerfectoid` (TauCeti/RingTheory/Perfectoid/Integral.lean).
- **Ownership:** `roadmaps grep` for the coordinate axes, planar cusps, finite chain rings and Angeltveit's quotient, δ-pairs and prismatic cohomology relative to δ-rings, pointed-monoid algebras, the three Lean names and the chromatic polynomial of a cycle found no other owner on main or at the 476 open heads. KTheoryFiniteLocalFields §5.16 owns the classical genuine pointed-monoid equivalence and the README imports it. No fully qualified name of `Suggested.lean` is declared in a readable roadmap. The citation lead `BigWitt.TruncationSet` is a false positive: QWittVectors §1.1 defines it (its README line 141).
- **Policy:** the pull request changes only `packages/RefinedTraceMethodsPartII/`. No pull-request number, process word or `lemma` in the README or the docstrings. Every target has a locator.
- **Gaps:** `bigwitt-ptypical-decomposition` and `perfect-homotopy-invariance` each have one supplier and section, one precise `needs` sentence with its hypotheses, and the same slug in `design/plan.json` and under `## Exact supplier contracts`. Neither asks for something QWittVectors §1.5 (only `Div(p^a)`) or SchemeKTheoryOperations §5.2 (only regular noetherian) already gives.

## Not verifiable

- larsen-mixed and bach-hypersurfaces are settled as uncertified; the mixed complex of `ℤ[x,y]/(y^a − x^b)` behind §2.6 was checked only through hn-cusp Theorem 1 (lines 131–142).
- The interior of akn24 §§3–5 (Lemma 3.6, Propositions 3.33–3.34, Lemmas 5.7–5.9, Theorem 5.12, Lemma 5.16) and of akn-delta §10 (Propositions 10.43, 10.46, Corollary 10.47) was not opened line by line; the README's statements from them were checked only for internal consistency (the u = 0 relation, the two basis counts and the exponents for ℤ/4 were recomputed).
- riggenbach-double, riggenbach-cusp, speirs-trunc, lurie-ha and bouis-motivic locators were not opened.
- The content of BordismFormalGroups §F6.5 was read only as far as its lane on the Borel Tate product and the "universal exact lax-monoidal approximation"; that it states the universal property in exactly the form §3.1 uses was not confirmed sentence by sentence.
- No Lean was run in this pass; the elaborated signatures were taken from the job's listing.

## Source issues

- **Error** in speirs-axes at Theorem 1 and Theorem 2, printed pp. 1 and 4 (also the last display of §5.1, p. 28): the source says the p = 2 odd-degree group is a product over all odd m′ and all indices from 0 to t_ev of copies of k; it should be one copy of `k^{cyc_d(s′)}` for each odd m′ ≤ 2r + 1 and each s′ dividing m′; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed p. 13: the source says the lax structure map of the Tate construction is an equivalence for bounded-below T and finite X; it should require p-completing the source (it fails for T = 𝕊, X = S⁰); affects the proof.
- **Error** in akn-delta at Proposition 8.6, printed p. 43: the source says the finite-stage formula holds when (p−1)j ≥ i; it should be the bound (p−1)j > pi of Lemma 8.5 (p = 2, i = 1, j = 1 or 2 give wrong groups); affects a stated result.
- **Misprint** in akn24 at footnote 1 to Theorem 1.4, printed p. 4: the source says ⌈n/e⌉ is the exponent of the additive group of the quotient ring; it should be p to that power; affects nothing.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed p. 8: the source says the quotient Witt module has the stated finite length for every commutative ring k; it should assume k a field (over ℤ, or over a product of two fields, the length differs); affects a stated result.
- **Error** in hn-cusp at the paragraph after Theorem A, printed p. 1: the source says the K-group has the stated finite length for the perfect 𝔽_p-algebras of the theorem; it should say for perfect fields; affects nothing.

## For the human reviewers

- **Scope.** The main sources of Layers 8 and 9, akn24 (arXiv:2405.04329v1) and akn-delta (arXiv:2310.12770v2), are cited in `README.md` lines 915–916 as arXiv preprints with no journal reference; the same holds for hn-cusp, speirs-trunc, riggenbach-trunc and riggenbach-cusp.
- **Scope.** bouis-motivic (arXiv:2608.05220v1, 2026) is cited only for an unnamed downstream roadmap (`README.md` line 908).
- **Licence.** lurie-ha is cited from the author-page version of 18 September 2017 (`README.md` line 929), not from a published edition.
- **Not tested.** larsen-mixed and bach-hypersurfaces (uncertified, paywalled) were not read; §2.6's mixed-complex input rests on hn-cusp's restatement.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b83e78b97709c5eafec3751710a105ca5339f01e", "job": "RT-RefinedTraceMethodsPartII~1a", "model": "fable", "worker": "chris-x79"} -->
