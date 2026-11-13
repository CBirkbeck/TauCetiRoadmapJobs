<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6849440598 -->
Review (claude) of 1bdeb84

Verdict: needs_changes

1. **F01** (P1) `τ_+(M)[1]` is not in the heart; the §3.3 Check refutes the §3.3 statement

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1105, "that the relative objects
   `τ_+(M)[1]` on `X` are holonomic, that is, lie in the heart, in both theories"; and :1120–1121, "it is
   `τ_+(M)[1]`, not `τ_+(M)`, that lies in the heart".

   **Claim:** for quasi-minuscule `W`, the direct image of the normalized coefficient from the smooth part
   `GR_W°°` is concentrated in one holonomic degree.

   **Witness:** the Check at README:1128–1129 gives, for `G = PGL₂`, `H⁰(U_s, M_s)` of dimension `3` and
   `H¹(U_s, M_s)` of dimension `1` at every `s`. These are the fibres of `ℋ⁰` and `ℋ¹` of `τ_+(M)[1]`,
   so `ℋ¹(τ_+(M)[1])` has rank `1`.

   I recomputed it independently. In the triangle of XZ lines 2065–2068, `Kl_W[1] → τ_+(M)[1] → p°_{2,+}C`
   with `C = i^!(j_{!+}M)[2]` on the vertex section `Z ≅ X`. For `PGL₂` the total space is rationally
   smooth of dimension `3` along `Z` and `j_{!+}M = L[2]`, so `i^!(L[2]) = L_Z[−2]` and `C = L_Z`: a
   rank-one smooth object on a curve, which sits in holonomic degree `1`. Hence `ℋ¹(τ_+(M)[1]) ≅ L_Z ≠ 0`.
   In general `i^!` of the fibre `IC` has top degree `d`, so `ℋ^{d−1}(τ_+(M)[1]) ≠ 0` with `d − 1 ≥ 1`.
   The statement is Xu–Zhu Lemma 4.2.6(i) as printed (XZ line 2057); its proof needs `τ` affine (XZ line
   2070), which the README already rejects. The conclusion fails with it.

   **Exact repair:**

   1. README:1104–1106. Replace "and that the relative objects `τ_+(M)[1]` … as for `Kl_W[1]`" by:
      "and that in both theories, with `i : Z → GR_W°` the vertex section (`Z ≅ X`, `p₂° ∘ i = id`):
      (a) `p°_{2,+}(j_{!+}(M))[1] = Kl_W[1]` lies in the heart (§1.6, `p₂°` being affine and clean);
      (b) the cone `C` of `j_{!+}(M)[1] → j_+(M)[1]` is `i_+ i^!(j_{!+}(M))[2]`, supported on `Z` and in
      degrees `≥ 0` (Xu–Zhu Corollary 2.6.2); (c) hence `Kl_W[1] → ℋ⁰(τ_+(M)[1])` is injective with
      cokernel `ℋ⁰(C)`, and `ℋ^i(τ_+(M)[1]) ≅ ℋ^i(C)` for `i ≥ 1`; dually `ℋ⁰(τ_!(M)[1]) → Kl_W[1]` is
      surjective, so `Kl_W[1]` is the image of `ℋ⁰(τ_!(M)[1]) → ℋ⁰(τ_+(M)[1])`. The complex `τ_+(M)[1]`
      is not in the heart."
   2. README:1108–1110. Say that the conclusion of Lemma 4.2.6(i), not only its affineness step, is
      replaced: only the degree-zero map `Kl_W[1] → ℋ⁰(τ_+(M)[1])` is used in §3.4 (XZ (4.2.7.1)).
   3. README:1120–1121. Replace the last sentence of the Check by: "On the curve it is
      `Kl_W[1] = p°_{2,+}(j_{!+}M)[1]` that lies in the heart; `τ_+(M)[1]` does not: for `PGL₂` its `ℋ⁰`
      has rank `3` and its `ℋ¹` rank `1`, the fibre dimensions of the next Check."
   4. README:1051–1054 (§3.1). State that for a non-affine `τ` the `A†`-module map is taken on
      `ℋ⁰` of the two derived direct images.
   5. README:1103. Say which cohomology the "image" is taken in: the image of
      `H^*_c(U_s, M_s) → H^*(U_s, M_s)`, equal to `H^*(Y_s, j_{!+}(M_s))`.

   Tested on the refuting instance: for `PGL₂`, (a) gives rank `3` in degree `0`; (b) gives `C = L_Z` in
   degree `1`; (c) gives `ℋ⁰` of rank `3 + 0` and `ℋ¹` of rank `1`. These are the Check's `h⁰ = 3`, `h¹ = 1`.

2. **F02** (P3) Braden's map is stated in the reverse direction

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:607–608, "the canonical map
   from the attracting `!`-restriction to the repelling `+`-restriction is an isomorphism".

   **Claim:** hyperbolic localization has a canonical map from the attracting side to the repelling side.

   **Witness:** XZ line 1174 defines `F^{!+} = f^!(g^+F)` (attracting) and `F^{+!} = f′^+(g′^!F)`
   (repelling); XZ line 1177 gives `ι_F : F^{+!} → F^{!+}`, from repelling to attracting. No canonical map
   exists the other way for a general object.

   **Exact repair:** replace the clause by "the canonical map `f′^+ g′^! F → f^! g^+ F`, from the repelling
   side (`!`-restriction to the repelling locus, then `+`-restriction to the fixed locus) to the attracting
   side (`+`-restriction to the attracting locus, then `!`-restriction to the fixed locus), is an
   isomorphism". Tested on the Check's instance, `K` on `𝔸²` with weights `(1, −1)`: the repelling side is
   `K[−2](−1)` on the `y`-axis restricted to the origin, the attracting side is `f^!` of `K` on the
   `x`-axis, again `K[−2](−1)`. The Check's values are unchanged.

3. **F03** (P3) five cited former labels have no row in the former-numbering table

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:411–423, the table headed
   "Former numbering".

   **Claim:** the table lets citing roadmaps follow the former target labels.

   **Witness:** GlobalShtukasAndFunctionFieldLanglandsPartII, at the head of its open pull request,
   `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`:95, cites "§KB.2
   (*invariant-parameter*, *oper-slice*, *quantized-hitchin*, *zhu-identification*) and §KB.3
   (*tensor-comparison*)". None of the five has a row.

   **Exact repair:** add five rows: `KB.2 invariant-parameter → §2.2`; `KB.2 oper-slice → §2.3`;
   `KB.2 quantized-hitchin → §2.5`; `KB.2 zhu-identification → §2.7`; `KB.3 tensor-comparison → §3.5`.
   The mapping is that of the plan's ids `KB.2/…` and `KB.3/tensor-comparison`. With these rows every
   label that roadmap cites (15 in all) resolves.

4. **F04** (P3) unused `[DecidableEq F]` in the convolution headline

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`:157, "`[DecidableEq F]
   {K : Type*} [Field K] (ψ : AddChar F K)`" in `orthogonalSum_sub_card_eq_convolution`.

   **Claim:** the statement needs decidable equality on `F`.

   **Witness:** a scratch copy with the binder deleted elaborates (exit 0, the same five `sorry`
   warnings), and `#check` prints the same conclusion. The definitions use `classical` internally.
   README:2155–2156 says "No enumeration is part of the datum", and the other three finite-field
   headlines carry no such binder.

   **Exact repair:** delete `[DecidableEq F]` from line 157. Tested as described.

5. **F05** (P3) two page locators

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:2243, "Xu–Zhu Theorem
   1.2.4(ii) and Theorem 5.4.2(ii), p. 62"; and :1225–1226, "§2.9.3, pp. 23–24".

   **Claim:** both theorems are on p. 62; §2.9.3 starts on p. 23.

   **Witness:** Theorem 1.2.4 is at XZ line 245, on printed p. 5 (page marker at line 222). §2.9.3 is at
   XZ line 1128 and Proposition 2.9.4 at line 1139, both on p. 24 (page marker at line 1105).

   **Exact repair:** write "Xu–Zhu Theorem 1.2.4(ii), p. 5, and Theorem 5.4.2(ii), p. 62" and "§2.9.3 and
   Proposition 2.9.4, p. 24".

Five findings: one P1 and four P3. The three findings of the previous review are repaired, but the
repair of its F01 restated Xu–Zhu Lemma 4.2.6(i) as a target, and that statement is refuted by the
Check the same repair added (R01). The other four are small: a reversed map (R02), five labels missing
from the former-numbering table that an open roadmap cites (R03), an unused instance binder in one
Lean headline (R04) and two page locators (R05). `Suggested.lean` elaborates with `sorry` as its only
warning; the dependency check is clean.

## Verified sound

### Previous findings

The previous review had three findings; the repair report marks none "not actionable".

| Previous finding | Status | Repaired passage |
| --- | --- | --- |
| F01 (P2) Satake normalization in §§3.1–3.3 | Repaired as asked; the repair introduced R01 | README:1042 "`M = p₁^+ E_{−π}[d]` in the de Rham theory and `M = p₁^+ A_ψ[d]` in the arithmetic theory, with the half twist `(d/2)`". Matches XZ lines 2009 and 2052. Needs lines gained §1.3 (README:1058) and §§1.3, 1.5 (README:1110). |
| F02 (P3) reversed vertex-stalk Check | Repaired | README:1122 "Extension by zero has no vertex stalk: for `i` the vertex of `Y_s`, `i^+ j_!(M_s) = 0`". The new numbers are right (table below); they are what refutes R01's sentence. |
| F03 (P2) reverse supply claim | Repaired | The bullet is gone from `## Downstream consumers` (README:2314–2319). The only named consumer is GlobalShtukasAndFunctionFieldLanglandsPartII, order 367 against 366. |

Pattern search for the repaired patterns. Shifts and hearts: §1.4 (README:663–665), §1.6, §9.4 and the
`j_{!+}` statements of §§6.6 and 11.5 were recomputed and are consistent; R01 is the only failure.
Reverse supply: no other sentence names an earlier roadmap as a consumer.

### Principles, shape and policy

- 65 numbered targets, 65 `*Needs:*` lines, 70 `**Checks.**` blocks, 12 layers each ending with
  `### Examples` and `### Dependencies`.
- No LaTeX delimiters, pull-request numbers, URLs, machine paths, HTML anchors, `lemma`, `set_option`
  or sorry'd data (grep over both files; the only "Lemma" hits are source theorem names).
- The layer order is forced by the dependency lines (eigenobjects, oper comparison, relative
  comparison, Frobenius, monodromy, realizations, ordinarity). No layer is named after a source chapter.
- No good-primes shortcut: `p ∤ |W_H|` is attached only to the Gross–Reeder break statement, and the
  `p = 2` branch is treated in full.
- `sources.toml` has 24 entries and the reference list 24 works; each cited work has one key.
- The numbering jumps from §7.1 to §7.3; README:409 says where former §7.2 went.

### Seeded source sample

All 15 sampled targets were opened at their locators. No locator is flagged unverified by the author.

| Target | Text read | Outcome |
| --- | --- | --- |
| 1.5 | XZ lines 1779–1806 (§4.1.2, p. 38), 1870–1896 (§4.1.8, p. 40) | Kernel, `pr_{2,!}(pr_1^+ M ⊗ IC_V)` and the base-point formula (4.1.8.3) agree. |
| 1.6 | XZ lines 1836–1869 (Theorem 4.1.5, Lemma 4.1.6, §4.1.7, pp. 39–40), 1972–1985 (§4.1.13, p. 42); HNY line 857 (Theorem 1, printed p. 261) | Eigenobject, purity, affineness of `pr₂` on the big cell, smoothness from ULA agree. |
| 1.8 | XZ lines 1965–1971 (§4.1.12, p. 42) | The source states equality of traces; the README's passage to characteristic polynomials over all extensions is its own, and correct. |
| 2.5 | XZ lines 2243–2276 (§4.3.5, (4.3.5.1), pp. 48–49); Zhu lines 918, 925, 993, 1008 (Lemmas 18–21, pp. 20–23) | Filtered isomorphism `U(Lie V)^T ≅ Fun Op` and flat moment map agree. |
| 2.6 | XZ lines 2277–2289 (§4.3.6, p. 49) | Uniqueness up to a `Z`-local system on `𝔸¹`; the README's rational marking is an added hypothesis the source lacks, needed over non-closed `K`. |
| 3.5 | XZ lines 1994–1999 (Theorem 4.2.1, pp. 42–43), 2108–2135 (§4.2.8, pp. 45–46) | Tensor generators and decomposition agree. |
| 4.2 | XZ lines 2314–2322 (§4.4.2, p. 50), 1128–1147 (§2.9.3, p. 24) | Agrees; page slip is R05. |
| 4.5 | XZ lines 245–250 (Theorem 1.2.4, p. 5), 2323–2328 (§4.4.3, p. 50) | The printed equation is `δϕ·ϕ⁻¹ + Ad_ϕ(A) = qA(x^q)`, the README's `δS + SA = qA(x^q)S` after right multiplication. |
| 6.4 | XZ lines 2372–2393 and 2451–2467 (Theorem 4.5.2 and proof, pp. 51–53), 1939–1942 ((4.1.10.5), p. 41) | Statement (i), (iii) and the Swan parity argument agree. |
| 8.1 | XZ lines 2647–2688 (§§5.3.1–5.3.2, pp. 57–58) | Matrices (5.3.1.1) and the symplectic case agree. |
| 10.2 | XZ lines 3042–3075 (A.4, Theorem A.5, pp. 64–65), 3159–3200 (A.13, pp. 67–68); Dw69 lines 394–404 (Theorem 2), 527 (Theorem 3) | Modulus `2^s B⁽ˢ⁺¹⁾(m)` in (i′) agrees with the Lean statement. The source takes `k = 𝔽_p`; the proof is ring-theoretic and the README's general DVR is sound. |
| 10.5 | XZ lines 3088–3124 (A.8, Proposition A.9, pp. 65–66), 3129–3138 (A.11, p. 66) | The README's quotient `d + η dx` (dual of `E_F`) is right; the source writes `E_F` for both. Table row below. |
| 11.3 | XZ lines 255–258 (Theorem 1.2.4(ii), p. 5), 2932–2947 (Theorem 5.4.2, p. 62), 2948–3007 (Lemma 5.4.3, pp. 62–63) | Agrees; page slip is R05. |
| 11.4 | XZ lines 2385–2392 (Theorem 4.5.2(ii), p. 51), 2897–2899 (Corollary 5.3.10, p. 61) | Agrees. |
| 11.5 | XZ lines 2469–2516 (Corollaries 4.5.6–4.5.7, Remark 4.5.8, pp. 53–54), 2893–2911 (§§5.3.9–5.3.11, p. 61) | Agrees, with the README's shift and half twist. |

Also read for the findings: XZ lines 1160–1181 (§2.10, p. 25) and 2045–2107 (§§4.2.5–4.2.7, pp. 44–45).

### Adversarial table

Values are mine unless marked "inherited" (rows of the previous round that carry computed values).
Finite sums were evaluated exactly in `ℤ[ζ_p]` over explicitly constructed fields.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §3.3 statement vs its Check | `PGL₂`, `d = 2` | Statement: `τ_+(M)[1]` in one degree. Check and triangle: `ℋ⁰` rank `3`, `ℋ¹` rank `1`. | **R01** |
| §3.3 Check, compact supports | Triangle `j_! → j_{!+} → i_+i^+j_{!+}`, vertex stalk `K` in degree `−2` | `0 → K → H^{−1}_c(U) → 0`, `H⁰_c(U) = K³`: dimensions `1`, `3`. | Check correct |
| §3.3 Check, ordinary cohomology | Excision on the affine surface `Y_s`, `i^!L = L[−4](−2)` | `H³(U, L) ≅ H⁴_{vertex}(Y, L) = K`, so `H¹(U_s, M_s) = 1`; `H⁰ = 3`. | Check correct |
| §3.3 cone in characteristic `2` | `(x, y) ↦ (x², xy, y²)` | Degree `2`, purely inseparable, so a universal homeomorphism; `IC = K[2]`. | Check correct |
| §3.1 shift convention | Fibre `d`, total space `d + 1`, curve | `M_s = L[d]`, `M[1] = L[d+1]`, `Kl_W[1]` in the hearts; agrees with XZ line 2056. | Sound |
| §3.2 degree | `SL₂`, standard, `d = 1` | Normalized: `h⁰ = 2`. Unshifted: `h¹ = 2`. | Sound |
| §1.2 Braden map | `K` on `𝔸²`, weights `(1, −1)` and `(1, 1)` | Both sides `K[−2](−1)`, then `K[−4](−2)`. Source map: repelling → attracting. | **R02** (direction only) |
| §1.5 | `SL₂` standard; `W = 1`; `W ⊗ W` | `IC_W = K[1](1/2)`: scalar `−c_q^{−1}`; with `(1)`: `−q^{−1}`, ratio `c_q^{−1}`. Ranks `1` and `4`. | Sound |
| §1.6 headline | `𝔽₃`, `a = 1`; `𝔽₂`, `a = 1` | `R₂ = −1`, trace `1/√3`; eigenvalues of `T² − T + 3` have modulus `√3`, so weight `0` after the twist. `R₂ = 1`, trace `−1/√2`. | Sound |
| §1.8 | Eigenvalues `{1, 2}` and `{3/2, 3/2}` | Traces `3`, `3`; over `k₂`: `5` and `9/2`. | Sound |
| §2.5 | `PGL₂` | `T_ad` acts on `(u₁, u₀)` with weights `α, −α`; invariants `K[u₁u₀]`, degree `2 = h`; slice dimension `1`. | Sound |
| §2.6 | `P = diag(a, 1)` | `det(cP) = c²a`; no `c ∈ K` for nonsquare `a`; `c = b^{−1}` for `a = b²`. | Sound |
| §2.7, §8.1 sign Check | `r = 3`, `λ = 1` | `m³c_m = ∓c_{m−1}`: series `1 ∓ x + x²/8`; `δ³(x) + x·1` leaves `2x`. | Sound |
| §2.8, §6.6 | `SL₂` | `h¹ = 1 − 1 − 0 = 0`; with `I₀` twice, `−1`. | Sound |
| §3.5 | `E₈`; `SL₂` | `|P/Q| − 1 = 0` minuscule representations; adjoint rank `248`. `SL₂`: standard, `d = 1`. | Sound |
| §4.2 | `N = E₁₂` | `N² = 0`, rank `1`; unit residue `0`. | Sound |
| §4.3 | `C(0) = diag(c_q^{−1}, c_q)` | `NC(0) = c_q E₁₂ = qC(0)N`. | Sound |
| §4.5 (i)–(ii) | Transpose; `Ad((2ρ)(√−1))` | `δCᵗ + CᵗAᵗ = qAᵗ(x^q)Cᵗ`. Simple root vectors scale by `−1`, the lowest by `(−1)^{h−1}`: `−N − λ^h xE ↦ N + (−1)^h λ^h xE`. | Sound |
| §4.5 Check | `S(0) = diag(s₁, s₂)` | `Ad_S E₁₂ = (s₁/s₂)E₁₂ = qE₁₂` iff `S(0) = C(0)^{−1}`. | Sound |
| §6.3 | `SL₃`; `G₂` | `3 + 5 = 8`; printed indexing gives `1 + 3 = 4`. `14/6 < 3`. | Sound |
| §6.4 | `SO₇`, `Sp₄`, `SL₃` | `dim G₂ = 14 < 21`; descent to `𝔾_m/μ₂` doubles Swan, against Swan `1`. | Sound |
| §8.1 | `𝔽₃`, `a = ±1` | `R₂(1) = −1`, `R₂(−1) = 2`: traces `1/√3`, `−2/√3`. `ψ ↦ ψ^{−1}`: `a ↦ (−1)^r a`. | Sound |
| §8.2 | `n = 1` odd operator | `r³c_r = 2λ²(2r−1)c_{r−1}`: `c_r = (2r−1)!!(2λ²)^r/(r!)³`. | Sound |
| §8.3, §8.6 | `𝔽₂`, `n = 3` | `(1 + 8 − 2)/8 = 7/8`; minus `1` is `−1/8 = R₇(1)/8`. Printed constant: `5/8 − 1 = −3/8`. | Sound |
| §9.2 | Scalar | `(q^{−(n−1)/2}/α)(−1)^{n+m−1} = 1/((−c_q)^{n−1}∏g_j)`. | Sound |
| §9.4 | `𝔽₃`, `n = 2`, `a = 1` | `T_{SO₃} = −2/3, 1/3`; `K₂ = 1/√3, −2/√3`; sum `−4/(3√3)`; twisted `−4/9`; with `[1]`: `4/9 = (7 − 3)/9`. Rank `(2n−2) + 3`. | Sound |
| §10.1 Check | `B(j) = (−2)^{3j}/(j!)³` | `B(2) = 8`, `B(4) = 8/27`, ratio `1/27 ≡ −1 (mod 4)`. | Sound |
| §10.2 `signed_dwork_congruence` | `s = 0`, coefficient of `x^{2m}` | `B⁰(0)B¹(m) − B⁰(2m)B¹(0) = B¹(m)(unit − r·unit) ∈ B¹(m)R`. Inherited: 1,560 rational instances. | Sound |
| §10.3 | `B(j) = 1` | `η = 1/(1−x)`, `f = (1−x^p)/(1−x)`, `f′/f = η − px^{p−1}η(x^p)`. | Sound |
| §10.5 | `c = q^n/f_{F,q}` | `c′/c = −η(x) + qx^{q−1}η(x^q)`; `c(0) = q^n`; on the geometric series both sides are `−1/(1−x) + qx^{q−1}/(1−x^q)`. | Sound |
| §11.1 (i) | `𝔽₂` (`n ≤ 3`), `𝔽₄`, `𝔽₈` (`n ≤ 2`), all `a` | At `a = 1`, `n = 1`: `−1, 5, 17`; `n = 2`: `−1, 21, −151`, both sides. | Sound |
| §11.1 (i), control | `𝔽₄`, character `ψ₀(Tr(ω x))`, `a = 1` | `U₁ − 4 = −3`; `R₃(1) = 5`. | Trace character is needed |
| §11.1 (ii) | `𝔽₃`, `𝔽₅` (`n ≤ 2`), `𝔽₇`, `𝔽₉` (`n = 1`), all `a`, all character scalings | `𝔽₃`, `n = 1, 2`, `a = 1`: `U − q = −2, 4`; `𝔽₅`, `n = 2`: `21`. All differences zero. | Sound |
| §11.1 (iii) | `𝔽₂, 𝔽₄, 𝔽₈, 𝔽₃, 𝔽₅`, `N = 2` (and `3` over `𝔽₂`) | All differences zero. Scaling `ψ ↦ ψ(c·)` moves both sides to `a c^{2N}`. | Sound |
| All three identities | Total | 195 exact equalities, no failure. | Sound |
| §11.1 transport to any `K` | `K` of characteristic `2`, `F = 𝔽₃` | Difference is a multiple of `Φ_p(ζ)`, zero in `K`; characteristic-`p` `K` has no nontrivial `ψ`. | Sound |
| §11.2 | Polytope | Origin is a vertex; `2n + 1` facets off the origin, each of determinant `±d`; volume `(2n+1)·d/(2n+1)! = d/(2n)!`; degree `d(2n+1)`. Quotient slopes `1/2, …, 2n + 1/2`. | Sound |
| §11.3 `orthogonalSum_ordinary` | `𝔽₂`, `n = 1`, `a = 1`; `𝔽₃`, `n = 1` | Power sums `−1, 5, 17` give `T³ + T² − 2T − 8`, coefficient valuations `0, 0, 1, 3`, slopes `0, 1, 2`. `𝔽₃`: `α² + 3 + β² = −2`, `α⁴ + 9 + β⁴ = 16`, as computed. | Sound |
| §11.4 | `SL₃`, `SL₇` at `p = 2` | `dim SO₃ = 3 < 8`; `dim G₂ = 14 < 48`; trace side `U₁ − 2 = −1 = R₃`. | Sound |
| §11.5 | `𝔽₂`, `n = 2`; `sl₃` under `SO₃` | `(−1/2)(−1/√2)/√2 = 1/4`; `[1]` gives `−1/4 = (1 − 2)/4`. `sl₃ = 5 ⊕ 3`, no invariants. | Sound |
| Former-numbering table | Labels cited by GlobalShtukasAndFunctionFieldLanglandsPartII | 15 cited, 10 mapped, 5 missing. | **R03** |
| Convolution headline binder | Scratch copy without `[DecidableEq F]` | Exit `0`, identical conclusion. | **R04** |

Inherited without recomputation (rows of the previous round with values): §§0.1–0.3, 2.3, 5.2–5.3,
6.5, 7.1, 7.3, 8.5, 9.1.

### Lean file

- `lake env lean` on `packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean`, run from the
  content checkout: exit 0; five `declaration uses 'sorry'` warnings at lines 66, 133, 145, 156, 169;
  nothing else. The only import is `Mathlib`.
- Signatures: `#check @name` for all 11 declarations (six definitions, five theorems) in one scratch
  file, compared with the README. No binder is lost. One is superfluous (R04).
- One-tactic probe on all five theorems, each with `simp`, `rfl`, `infer_instance`, `aesop`, `omega`,
  `decide`, `trivial`: 35 attempts, 35 failures. None restates a definition, mirrors a Check or treats
  a boundary case. No padding.
- Every backticked name the README attributes to this roadmap is one of the 11 declarations.

### Headline theorems

| README headline | Disposition |
| --- | --- |
| Eigenobject and Bessel F-isocrystal (§§1.6, 4.1) | Docstring: not statable (no curve isocrystals, `ℓ`-adic local systems, `D`-modules). |
| Satake for arithmetic `D`-modules (§1.3) | Docstring: not statable. |
| Zhu's comparison, de Rham–rigid comparison (§§2.7, 3.5) | Docstring: not statable. |
| Monodromy (§§2.8, 6.4, 11.4) | Docstring: not statable. |
| Generic and everywhere ordinarity on Newton points (§§5.3, 11.3) | Docstring; types `B`, `D` on traces: `orthogonalSum_ordinary`. |
| Functoriality, companions (§§7.5–7.6) | Docstring: not statable. |
| Characteristic-two comparison (§10.6) | Docstring; trace form `orthogonalSum_sub_card_eq_kloostermanSum`. |
| Hypergeometric construction (§9.1) | Docstring: not statable. |
| Rigidity, simple-wild parameter (§§6.6, 11.5) | Docstring: not statable. |
| Signed Dwork congruences (§10.2) | `signed_dwork_congruence`. |
| Exponential-sum identities (§11.1) | Three theorems, lines 133, 145, 156. |

No statable headline is absent and none is forced through a stand-in.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d`.

- `Mathlib/Algebra/Group/AddChar.lean`:242 `compAddMonoidHom`, :354 `sum_eq_ite`, :463 `mulShift`.
- `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240 `sum_eq_zero_of_ne_one` (needs a domain).
- `Mathlib/FieldTheory/Finite/Trace.lean`:37 `trace_to_zmod_nondegenerate`, :49 `algebraMap_trace_eq_sum_pow`.
- `Mathlib/Algebra/Algebra/ZMod.lean`:47 `ZMod.algebra` (not an instance), :24 subsingleton.
- `Mathlib/NumberTheory/GaussSum.lean`:72 `gaussSum`, :200 `gaussSum_mul_gaussSum_eq_card`.
- `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`:120 `quadraticChar`;
  `Mathlib/NumberTheory/MulChar/Basic.lean`:455 `ringHomComp`.
- `Mathlib/RingTheory/PowerSeries/Expand.lean`:33 `expand`;
  `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57 `IsAdicComplete`;
  `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56 `IsDiscreteValuationRing`;
  `Mathlib/NumberTheory/Padics/Complex.lean`:35 `ℂ_[p]`.
- `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:95 `FGComoduleCat`;
  `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138
  `pointsFunctorIsoTensorAutFunctor`.
- `TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean`:176 and
  `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean`:98, the two Herbrand theorems.

No Kloosterman, Bessel or orthogonal-sum declaration exists at either pin (grep by object), so nothing
in `Suggested.lean` duplicates the libraries.

### Suppliers and ownership

Every cited section was resolved now, at main (`7342e8f`), at the open heads, or in the board packages.

| Supplier | Where read | Cited ids found |
| --- | --- | --- |
| CongruenceSpectralGap | open head | §4.2a (line 648), §4.2b (678); `hyperKloosterman` at 650. |
| CharacterSumsOverFiniteFields | open head | §3.3 (1124); `hasseDavenport_lift` at 1131. |
| KloostermanMomentsAndPotentialAutomorphy | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md` | §§1.1, 1.3, 2.1, 2.5, 2.6 (471, 534, 625, 725, 747). The resolver's one lead (§2.6 "found nowhere") is false: the roadmap is a board package at order 310. |
| GlobalShtukasAndFunctionFieldLanglands | open head | §§0.1, 0.3, 0.14, 1.1–1.6, 1.8, 1.9, 1.12. |
| ReductiveGroups, ReductiveGroupsPartII, AffineLieAlgebras, EtaleCohomologyFoundations | main | Layers 1, 7, 9, 10; RG2.3.3, RG2.3.6, RG2.4.1; A7, A8. |
| OrthogonalSpinGroups | main, completed | Layers 0–1. |
| PadicDifferentialEquationsAndRigidCohomology | open head | All 63 cited `RD.` sections, from RD.0.37 to RD.6.97. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | board package | MS.4, MS.4.6, MS.4.7. |
| BunGAndNewtonStrata, MotivesAndAlgebraicCycles, FormalConnectionsOpers, SpringerResolutionAndCharacteristicCycles, DeligneWeightsAndPurity | open heads | §§1.5, 1.22; §§6.1–6.3, 6.5; F2, F4, F6; §§8.1–8.6, 9.1, 9.2, 9.4, 9.6, 9.7; §§8.5, 8.12, 8.14, 8.19. |

All suppliers are on main or earlier in the merge order (the latest is
GlobalShtukasAndFunctionFieldLanglands at 360; this roadmap is at 366). None is on the never-cite list.

The 11 declared gaps have the same slug in `design/plan.json` and in a `What <Supplier> must provide`
line. Each names a supplier, states its hypotheses and asks for nothing the supplier's current text
or the pins provide. The acceptance, once the findings are repaired, will be conditional on them.

Ownership by object. `kloostermanSum` restates `hyperKloosterman` of CongruenceSpectralGap §4.2a in
this roadmap's namespace, and the README says so (README:63–66). CharacterSumsOverFiniteFields also
declares a `kloostermanSum`, a different sum in a different namespace. PotentialAutomorphyDworkMotivesPartII
§§3.1–3.3 owns Katz's tame hypergeometric sheaves over `ℤ[ζ_N, 1/N]`; §9.1 here owns Miyatani's wild
arithmetic hypergeometric modules with an additive character. They are different objects, and this
README does not use the former. Ownership was checked against the open heads the tools expose.

`scratch/overlaps.md` lists no competing pull request, no dropped id and no revision-only id. The id
check against the consumer is R03.

Overlap check: read GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands, CharacterSumsOverFiniteFields, AffineLieAlgebras; nothing shared (the scalar Kloosterman F-isocrystal is owned by PadicDifferentialEquationsAndRigidCohomology §§RD.6.94–RD.6.97 and the raw sum by CongruenceSpectralGap §4.2a, both cited here; the third list is empty).

Dependency check, complete output:

```
depcheck: 206 roadmaps, 1908 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Maintainer notes: none were left for this roadmap.

## Not verifiable

- The seven works settled as uncertified (AS89, Wan93, Wan04, Bal82, DH35, ESDE, KatzCC) were not
  read. Each is cited by locator, and what rests on them is a declared supplier gap or a supplier section.
- The texts LT, PRW, Miy, GR, FG, BD, DAd, Tsu, AC and VL-est are cached but outside this round's
  sample; I did not reopen them. Their rows in the previous round carry line numbers.
- Elaboration checks types only. The numerical rows test the five Lean headlines on small fields; they
  are not proofs.
- §3.3 as repaired by R01 remains a statement without a published proof at this generality: the
  source's argument needs the false affineness. I checked it on `PGL₂` only.

## Source issues

- **Error** in XZ at Lemma 4.2.6(i), printed p. 44: the source says the direct image of the normalized coefficient from the smooth locus, shifted by one, is holonomic; it should be that only its degree-zero part receives the eigenvalue injectively, higher cohomology being nonzero; affects the proof.
- **Error** in XZ at Theorems 1.1.4 and 1.2.4(i), printed pp. 3–5: the source says the normalized Frobenius is defined over the field generated by the p-th roots of unity; it should also contain a square root of p (trace one over root three at p = 3); affects a stated result.
- **Error** in XZ at (1.2.9.1), printed p. 6: the source says that at p = 2 the squared rank-two sum minus q equals a negative inverse root of q times the rank-three sum; it should be the raw rank-three sum with no factor; affects a stated result.
- **Error** in XZ at (5.3.9.1) and (5.3.11.1), printed p. 61: the source says the odd orthogonal object equals the unshifted convolution; it should carry a shift by one and a half twist, which changes the sign of the trace; affects a stated result.
- **Error** in XZ at Proposition 5.3.5(ii), printed pp. 59–60: the source says the boundary constant is (q − 1)q^(n−2); it should be q^(n−1) − q, as its own Corollary 5.3.11 forces at q = 2, n = 4; affects a stated result.
- **Misprint** in XZ at the proof of Proposition 5.3.8(i), printed p. 61: the source says the middle Frobenius eigenvalue at zero is 0; it should be 1; affects nothing.
- **Misprint** in XZ at the proof of Lemma 4.5.5, printed p. 53: the source says the adjoint representation is a sum of symmetric powers of twice the exponents minus two; it should be twice the exponents; affects nothing.
- **Misprint** in XZ at the proof of Proposition 4.4.5, printed p. 50: the source says the inverse conjugate of N by Frobenius at zero is qN and that ρ(q) scales N by 1/q; it should be the direct conjugate and the factor q; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1bdeb8401e437068323a5c1f380a0bb9698e2b7b", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals~6", "model": "fable", "worker": "chris-x57"} -->
