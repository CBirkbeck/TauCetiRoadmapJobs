<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2224#issuecomment-6628025223 -->
Review (claude) of 6b4e6a1

Verdict: accepted
Conditional on the announced gaps: `equal-characteristic-projective-image`, `barsotti-tate-components-general-base`, `cht-archimedean-ring-two-adic`, `completed-product-components`, `semistable-stable-category`, `nonsplit-minimally-ramified`, `generic-tame-pcris-domain`, `two-adic-polarized-presentation`, `nonsplit-polarized-problems`, `square-zero-determinant-cotangent`, `rank-one-ordinary-finiteness`, `enormous-image-taylor-wiles-primes`, `group-equivariant-patching`, `brochard-ultrapatching`, `bounded-denominator-determinant-lifts`, `unitary-shimura-integral-cohomology`, `unitary-dual-conjugate-self-duality`

1. **F01** (P3) Wrong page for the Tho15 display with the stray factor `1/2`

   **Location:** `packages/PotentialAutomorphyInfrastructurePartII/README.md:1774`. Quote: "without the factor `1/2` of the last display of Tho15 p. 69".

   **Claim:** The display `dim R ≤ … ≤ n[L⁺ : ℚ] − rn(n + 1)/2 − 5` is the last display of p. 69.

   **Witness:** Tho15 line 3371 carries that display; the page marker for p. 70 is Tho15 line 3360 and the footer "69" is Tho15 line 3359. The last display of p. 69 is (7.1), Tho15 line 3356, which has no factor `1/2`.

   **Repair:** Replace "the last display of Tho15 p. 69" by "the display at the end of the proof of Theorem 7.1, Tho15 p. 70". Tested: with that locator a reader lands on the display containing `rn(n + 1)/2 − 5`.

2. **F02** (P3) The §10.5 route does not make the `p`-adic places split in `L`

   **Location:** `packages/PotentialAutomorphyInfrastructurePartII/README.md:2340`. Quote: "Choose it so that `L/L⁺` is unramified at all finite places and `p` is unramified in `L⁺`".

   **Claim:** After this base change §4.8 applies to the polarized problem over `L`.

   **Witness:** §4.8 (README line 1169) and the Layer 3 set-up (README line 764) require every place of `L⁺` above `l` to split in `L`; LLHLM23 Theorem 9.2.1 (LLHLM23 lines 6233–6248) imposes no splitting of `F/F⁺` above `p`, so an inert `p`-adic place of `F⁺` stays inert unless the route arranges otherwise.

   **Repair:** Add to the base-change sentence "and every place of `L⁺` above `p` splits in `L`", noting that PotentialAutomorphyInfrastructure §2.5 provides this with unramified local prescriptions (`L⁺_w ⊇ F_v` for `F_v/F⁺_v` unramified quadratic, as in the §5.9 route), so `p` stays unramified in `L⁺` and the type, genericity and semisimplicity hypotheses are unchanged. Tested on an `F` in which some `p`-adic place is inert: after the added prescription the place splits and §4.8's hypothesis holds.

Two findings, both P3. No P1 or P2 finding. All fifteen findings of the first round are repaired (one, F07, differently from the proposed repair, for a reason that holds). The acceptance is conditional on the seventeen declared supplier gaps listed at the end of "Verified sound".

## Verified sound

### Round-1 findings, one by one

| Finding | Status | Repaired passage and check |
|---|---|---|
| F01 cycles | repaired | A scratch script over all 110 `*Needs:*` lines (one per numbered target; 110 targets) reports 0 forward edges and 0 cycles. The four cited cycles (3.3→3.5→3.7→3.3, 3.9→3.11, 3.9→3.12, 9.5↔9.6) are gone: base change is §3.5, constituents §3.6, residual/`𝒢_n` representations §3.7; finiteness is §3.11; the unpolarized trace map is §9.5 and equivariance §9.6. |
| F02 residual ideal sign | repaired | README line 917: "`T_w^j − q_w^{−j(j−1)/2} tr ∧^j r̄(Frob_w)` (`Frob_w` geometric)"; the `𝔽₇` Check at line 937 computes `2T² = 1`, `T² = 4` against the printed `T² = 2`, `qT² = 4`. The printed sign is NT21 line 3893; NT21's Hecke operator (NT21 lines 1017–1031) and polynomial (Ger19 line 1096) have the positive exponent, so the correction is right. |
| F03 Teichmüller determinant | repaired | README line 1616: `d₀` unramified at `S − S_l` with `d₀d₀^c = µ^n`, built as `ψ₀χ^{1/2}` with `χ = µ^n(ψ₀ψ₀^c)^{−1}`; characteristic-`l` form kept with `ψ₀`. Computed: `χ` is `c`-invariant, residually trivial, its unique residually trivial square root is `c`-invariant, so `d₀d₀^c = ψ₀ψ₀^cχ = µ^n`. Witness at line 1629 recomputed below. §8.13 uses the mod-`ϖ` form (line 1962), §8.9 uses `d₀` (line 1906). Tho15 line 1326 prints the Teichmüller form. |
| F04 projective-image gap | repaired | README line 147 and `design/plan.json` gap `equal-characteristic-projective-image` now state `l > 3`, `A = k⟦T⟧`, `σ₀` with multiplicatively independent eigenvalues, `l ∤ n`, `ν(r(c)) = −1`, Proposition 5.1 and Lemma 5.2(1)–(3) with `K₀` independent of `a, m` and the `K₁` hypotheses; compared word by word with Tho15 lines 2525–2563. The `Sp₄(𝔽₅⟦T⟧)` non-example (dimensions 10 and 15, torus product 1) is included. |
| F05 Dwork twist | repaired | README line 1359: the polynomial with roots `α q_F^i` is stated for `V_{λ,t}((N−1−n)/2)`, roots `α q_F^{(N−1−n)/2+i}` on `V_{λ,t}`; "`n ≥ 2` even" (line 1350); determinant Check at line 1380 and `n = 0` exclusion at line 1381. BLGHT11 line 266 (geometric Frobenius), lines 1018–1021 (pairing on the twist), lines 1269–1273 (untwisted polynomial with `α = ±1`). Recomputed below. |
| F06 geometric lemma | repaired | README line 339: the geometric lemma is applied to the full induced representation, exactness partitions the Weyl terms among subquotients, the segment classification places the increasing-valuation character in the generic constituent. `GL₂(ℚ₃)` Check at line 349 recomputed below. |
| F07 change of weight | repaired differently | The conditional §10.6 is deleted; Scope (README line 69) records that the generic Serre weight theorem and Remark 9.2.2(1) come after ModularityAndLanglandsExtensions §2.32. The chain was checked: LLHLM23 line 6231 (Theorem 9.1.6 from Lemmas 9.1.10 and A.1.1), LLHLM23 lines 6738–6740 (Lemma A.1.1(2) through LLHL19 Theorem 4.3.8), LLHL19 lines 1956–1961 and 2072–2077 (that theorem's (2)⇒(3) uses Theorem 4.3.1, a form of automorphic lifts with prescribed potentially diagonalizable types). ModularityAndLanglandsExtensions, an open pull request at merge-order position 269, owns "Change of weight and level (Theorem 4.4.1)" (its README line 1355); this package sits at 258. A `*Needs:*` on it would be upward, and re-planning it is forbidden, so the deletion is the only repair consistent with the principles. The defect of round 1 (a theorem assuming its own modular-weight conclusion) is gone; §10.5 is stated with the source's seed hypothesis (LLHLM23 lines 6244–6246). |
| F08 generic WD duplication | repaired | README line 2086 imports AutomorphicGaloisRepresentationsPartII AG2.6 "Generic monodromy orbits and local genericity" (that README line 3171, with `Hom_WD((r,N),(r(1),N)) = 0` and the LLC criterion at its lines 3176–3181); §9.1 keeps only transport statements (1)–(4), none of which AG2.6 contains. The same import is in the supplier contract (line 217), §1.3 (line 572) and the Layer 1 and 9 dependencies. |
| F09 AG2.2 vs AG2.3 | repaired | Supplier contract lines 214–215 split AG2.2 (twisting, base change, discrete sums) from AG2.3 "Arbitrary regular conjugate-self-dual existence" (that README line 1365: "No odd-rank, slight-regularity, … or imaginary-quadratic-subfield hypothesis remains"). AG2.3 is cited for existence in §§0.3, 3.6, 3.10, 10.2 and the Layer 3 dependencies. |
| F10 ratio test | repaired | README line 2297: all `(α/β)^j`, `−(N−1) ≤ j ≤ N−1`; Check at line 2306 recomputed below. |
| F11 impossible congruence | repaired | README line 987: `ℤ₅[ζ₅]`, `ϖ = ζ₅ − 1`, characters `1` and `ζ₅` congruent modulo `λ` and not `λ²`; `v_ϖ(ζ₅ − 1) = 1`. |
| F12 scalar conjugation | repaired | README line 870: `(aI,1)(A,b)j(aI,1)^{−1} = (a²A,b)j`, `ν` unchanged, `(4I,1)j` for `a = 2`; strict equivalence when `a ≡ 1 mod 𝔪`. |
| F13 slopes | repaired | README line 327: slopes `−1/2`, sum `−1` matching `φ = l^{−1}` on `D_cris(ε_l)`; dual `H¹` has `+1/2`. |
| F14 locators | repaired | README line 1960 "Proposition 5.6, pp. 71–72, with the set-up preceding it on pp. 70–71" (NT21 line 3494 after the p. 71 marker at 3484; p. 72 marker at 3532); line 1974 "Theorem 5.7, pp. 72–73" (NT21 line 3578; p. 73 marker at 3580); line 126 `SplitsCompletely/Basic.lean:74`, where the theorem keyword of `ncard_primesOver_eq_finrank_iff_of_isGalois` is at the pinned Tau Ceti, line 74. |
| F15 Needs line and docstring | repaired | §10.4 has a `*Needs:*` line (README line 2312); `Suggested.lean` lines 6–8 say that `README.md` is the roadmap and this file is not; §§6.3 and 10.3 are listed with their missing carriers (lines 34–39, 53–58); the Serre weight exclusion is explained (lines 63–65). |

No finding was marked "not actionable in this package"; nothing is re-raised.

### Seeded source audit (this round's fifteen targets)

| Target | Text opened | Comparison |
|---|---|---|
| 0.3 | BLGGT14 lines 1574–1590 (pp. 34–35), line 1460 (level, p. 32) | The four notions and their independence of `ι` by Clozel's Theorem 3.13 match; the residual pair and finite realization are routed to AG2.7 (that README lines 3415, 3430). |
| 1.7 | BLGGT14 lines 1207–1225 (remarks (4)–(5), p. 26), lines 1230–1233 (p. 27); LocalGaloisDeformationRings §6.8 (`Connects.sum_tensor_dual`, `Connects.symPow`) | Sums, tensors, duals, restriction match the remarks; symmetric powers are supplied by §6.8's `symPow` and NT21B as cited. |
| 2.1 | Tho15 lines 584–602 (Definition 3.2, Lemmas 3.3–3.4, p. 13) | Definition and both lemmas match, including the torsor under `∏ k^×/(k^×)²`. The README's added hypothesis `ν ∘ r̄′ = ν ∘ r̄` in (2) is needed: see the counterexample under "Source issues". |
| 3.7 | Tho12 lines 1562–1592 (Propositions 6.6–6.7, p. 36), line 1752 (Corollary 6.9, p. 40 after the marker at 1725); Ger19 lines 1090–1131 (Propositions 2.7.3–2.7.4, pp. 24–26); Tho17 line 698 (Theorem 3.2, p. 16) | Hecke polynomial, conjugate self-duality, hyperspecial condition at inert places (Ger19 item 3, Tho12 6.7(ii)), uniqueness up to `GL_n(𝕋_𝔪)` elements trivial modulo `𝔪` (Ger19 line 1121), parity sources all match. |
| 3.11 | Tho12 lines 1982–1989 (Proposition 8.2, p. 46); Ger19 lines 716–739 (Proposition 2.5.3, pp. 16–17); Tho15 line 1804 (Proposition 4.3, p. 36); NT21 lines 3888–3891 (Proposition 6.5, p. 79); ANT20 lines 650–651 (sufficiently small) | Rank formula, `Λ_{b₀}`-freeness, the "sufficiently small" hypothesis (a place `v ∉ S_l` with `U_v` torsion free) and the datum form all match. |
| 5.9 | BG19 lines 1637–1639 (Definition 4.2.1), 1671–1675 (Proposition 4.2.6, p. 36), 1769–1787 (Corollary 5.1.1, pp. 38–39) | "Discrete series and odd" is the archimedean fixed-space count, i.e. `µ(c_v) = −1`; the `H⁰(ad(1)) = 0` hypothesis and its proof from absolute irreducibility over `F(ζ_l)` with `ζ_l ∉ F` match §5.8. Nonsplit places are declared gaps. |
| 6.4 | BLGGT14 lines 2239–2273 (Proposition 4.1.1, pp. 50–51) | Hypotheses (1)–(3), the `n²` distinct sums, the `∼` away from `l`, the reduction list (unramified `F/F⁺`, split places, trivial residual, diagonalizable, `π_u` unramified) match. |
| 7.2 | NT21 lines 3274–3281 (Lemma 5.1, p. 66) | Statement and Frobenius-reciprocity proof match. |
| 7.4 | Own deduction | Verified: a unipotent element permuting blocks in a cycle of length `m` prime to `p` has all `m`-th roots of unity as eigenvalues, so orbit sizes are `p`-powers dividing `n`, hence `1`; `N ⊂ H`, `τ^{ss}` descends to `H/N`. Sound. |
| 7.8 | ANT20 lines 577–582 (Definition 3.7, p. 10) | Generic at `l` and generic match. |
| 7.20 | ANT20 lines 684–702 (Theorem 4.1, p. 15) | Hypotheses 1–6 match; the README replaces (4) by weak primitivity over `k` and over `k_𝔭`, for the reason recorded in round 1 (Tho15 line 2851 enlarges the field after assuming primitivity). |
| 8.4 | ANT20 lines 763–768 (Proposition 5.3, pp. 16–17); Tho15 lines 3124–3129 (Proposition 6.2 proof, p. 65) | Conclusion matches; the README's added `[L⁺ : ℚ] > |R|` is Tho15 line 3126 and `l^N > n` is Theorem 4.1(3). |
| 8.9 | Tho15 lines 3179–3206 (Theorem 7.1, p. 66), 3223–3251 (proof) | Hypotheses 1–9 and the preliminary conditions 10–13 match; `l > 3` at line 3179. |
| 8.17 | ANT20 lines 804–829 (Theorem 6.1, pp. 17–18) | Hypotheses 1–8 match §8.8 with "primitive" read as weak primitivity over `F̄_l`. |
| 9.7 | NT23 lines 57–63 (Theorem A, p. 2), 937 (Definition 2.23), 1074–1103 (Examples 2.29–2.30), 1213–1215 (§4.1 set-up: `F/F⁺` everywhere unramified, `[F⁺ : ℚ]` even), 1856 (Theorem 4.27), 1863 (Theorem 4.28), 1906–1908 (Theorem 5.2) | All match; the Steinberg example and the `[F⁺ : ℚ]` parity are as stated. |

No author-flagged unverified locator exists in the manifest; all 22 entries are `certified`. The manifest gained `LLHL19` (arXiv:1610.04819v4, sha256 recorded) in the repair; its locator Theorem 4.3.8 was read at LLHL19 lines 2072–2081.

### Adversarial calculations

Rows cover the repaired passages, the sampled targets, the headline theorems and the two findings. "Survives" means the instance did not refute the statement.

| Statement | Instance | Computed values | Result |
|---|---|---|---|
| §0.1 supersingular Check | `V_lE`, `det = ε_l` | `φ = l^{−1}` on `D_cris(ε_l)`, slope `−1`; `−1/2 − 1/2 = −1`; old `+1/2 + 1/2 = +1` | repaired, survives |
| §0.1 convention | `ε_l`, geometric `Art` | `ε_l(Art(u)) = u` on `ℤ_l^×` (arithmetic normalization gives `u^{−1}`), so `ε_l · x^{−1}` trivial, weight `(−1)`, `HT = {−1}` | survives |
| §0.2 route and Check | `GL₂(ℚ₃)`, `n-Ind(|·|^{1/2} ⊗ |·|^{−1/2})` | unnormalized Jacquet terms `χδ^{1/2} = δ_B` and `χ^wδ^{1/2} = 1`; Steinberg gets `δ_B`, trivial gets `1`; dimensions `1 + 1 = 2` | repaired, survives |
| §0.6 Check | `GL₂(ℚ₅)`, `ψ(5) = 1` | `δ_B(diag(5,1)) = 1/5`; `δ_B^{−1}(α) · δ_B(α) = 1`; omitting the factor gives `1/5`, valuation `−1` | survives |
| §0.3 parity Check | `n = 1`, `w = 1` | printed `χ_v(−1) = −1` gives `µ(c_v) = (−1)^{1}·(−1) = +1`; corrected `χ_v(−1) = (−1)^{2} = +1` gives `−1`; formula at AutomorphicGaloisRepresentationsPartII README line 775 | survives |
| §0.4 Check | good ordinary `E/ℚ_l` | `V_lE^∨`: unramified line, quotient `ε^{−1}`·unr, `HT = {0, 1} = {λ₂, λ₁ + 1}` with `λ = (0,0)`; `ψ₂(Art x)x^{λ₁+1} = x^{−1}x = 1` | survives |
| §1.2 Check | `n = 2`, `Frob = diag(1,q)`, `q ≡ 1 mod l` | family `sN` on the Steinberg component, `s = 0` gives `ρ₁`; `ρ₁` also unramified; `1 ⊕ 1` has ratio `1 ≠ q` | survives |
| §1.7 Check | `Sym²(1 ⊕ ε^{−1})` | `1 ⊕ ε^{−1} ⊕ ε^{−2}`, weights `{0,1,2}` | survives |
| §2.1(2) multiplier | `Δ = S₃`, `c` central, `ρ` standard over `𝔽₅` | `ρ ⊗ sign ≅ ρ`; symmetric pairing with `µ|Δ = 1`, `µ(c) = −1`; alternating pairing `B(R₉₀x, y)` with `µ′|Δ = sign`, `µ′(c) = +1`; equal traces, different multipliers, not conjugate | README's added hypothesis needed; source issue below |
| §2.1(3) | block scalars, `char k ≠ 2` | `c` acts by `X ↦ −AᵗXA^{−1} = −X`; invariants `0`; in characteristic `2` they are `k^d` | survives |
| §3.1 existence | `n = 2`, `L⁺ = ℚ`; `n = 1`, `[L⁺:ℚ] = 2` | product of local classes `(−1)^{(n/2)[L⁺:ℚ]}`: `−1` for the first (no form), `n[L⁺:ℚ] = 2 ≢ 0 mod 4` for the second yet `U_1` exists | survives |
| §3.2 last Check | `Γ = ℤ/l` on the augmentation ideal `I` | `I^Γ = 0` (`l·a = 0` forces `a = 0`), `(I ⊗ k)^Γ ≠ 0`; cokernel `H¹(Γ, M)[ϖ]` from the `ϖ`-sequence | survives |
| §3.3 duality Check | `n = 1`; general `j` | `ι_w(g) = ϖ_w^{−1}diag(1_j, ϖ_w1_{n−j})`, double coset of central `ϖ^{−1}` times `diag(ϖ1_{n−j}, 1_j)`; `n = 1`: `T_{w^c} = T_w^{−1}` | survives |
| §3.7 Check | `n = 2` | constant term `(Nw)^{1}T²`, dropped factor wrong | survives |
| §3.9 twisted structure | `n = 2`, one `τ` | `ν = (1,0)`, `w₀ν = (0,1)`, `(w₀ν)(u)^{−1} = τ(u₂)^{−1} = ∏ τ(u_i)^{1−i}` | survives |
| §3.10 generator | `𝔽₇`, `q = 2`, `det = 1` | `T² = 4`, `2·4 = 1`; printed `T² = 2`, `2·2 = 4` | repaired, survives |
| §3.12 arithmetic prime | general | `(w₀λ)(u) = ∏ τ(u_i)^{λ_{n+1−i}}`, `(w₀ν)(u) = ∏ τ(u_i)^{i−1}`, inverse exponent `1 − i − λ_{τ,n+1−i}`, agreeing with §0.1's `ψ_i(Art x) ≈ ∏ τ(x)^{−(λ_{n+1−i}+i−1)}` | survives |
| §3.12(4) Check | `ℤ₅[ζ₅]` | `v_ϖ(ζ₅ − 1) = 1` | repaired, survives |
| §4.1 Check | `n = 2`, `p = 5`, `q = 11`, inertia `(1+ε)I` | `τ^{11} = 1 + 11ε = 1 + ε`, consistent with `q ≡ 1`; `s`-block ramified, excluded here | survives |
| §4.4 route | `p = 2`, `A = 1_n` and `Ψ₂` | image of `1 + c`: `X + ᵗX`, alternating, misses `I`; for `Ψ₂`: `(a+d)I`, contains `I` | survives |
| §4.5 parity Check | `n = 1`, `[L⁺:ℚ] = 2` | wrong parity drops `dim R_∞` by `[L⁺:ℚ]n(1−(−1))/2 = 2` | survives |
| §4.8 Check | trivial `ρ̄` over `ℚ_l`, HT `{0,1}` | determinant `ε^{−1}`·unr reduces to `ω^{−1}`·unr `≠ 1`: no such lift | survives |
| §5.4 Checks | `SL₂(𝔽₄)`; trivial group | `0 = H¹(H,k) → H¹(H,ad) → H¹(H,ad₀)`; trivial group: `tr W = 0` on trace-zero lines | survives |
| §5.6 Check | `n = 1`, `κ = 1` | `ν = δ² = 1`, alternating pairing on a line vanishes; `κ = 0` gives `ν(c_v) = −1` | survives |
| §5.8 Check | `F = ℚ(ζ₃)`, `l = 3`, `n = 1` | `ω = δ_{F/ℚ}`, `ωδ = 1`, scalar line invariant, bound `dim ≥ 0` | survives |
| §5.9 `n = 1` | inert place | `dim (G′)^der = 0` plus the free determinant direction `= 1 = n²` (LocalGaloisDeformationRings §2.28: generic fibre of dimension `dim G^der` with fixed abelianization) | survives |
| §6.1(5)(b) | `n = 2`, `N = 5`, `q_F = 11` | pairing on `V(1)` to `(1−n) = (−1)`: `det V(1) = ε^{−1}`, `det V = ε^{−3}`, geometric Frobenius determinant `11³ = 1331`; twisted roots `±1, ±11`, product `11` | repaired, survives |
| §6.1 rank boundary | `n = 0` | zero sheaf has `0` Jordan blocks against the asserted `1` | excluded by `n ≥ 2` |
| §6.4 Check | `n = 2`, `HT = {0,1}` twice | sums `{0,1,1,2}`, not distinct | survives |
| §7.2 Check | `n = 3`, `η` of order `3` | `χ₁ ⊗ (1 ⊕ η ⊕ η²) = Ind_{Γ′}^Γ χ₁|Γ′`; ratios of order exactly `n` | sharp, survives |
| §7.3 route | `d = [Γ:H] ≤ n < p` | `[Γ:N] | d!` invertible; `Res_N Ind_H^Γ τ = ⊕_{Γ/H} γτ|N` since `N ⊂ H` | survives |
| §7.4 | `S₃` standard, `p = 5` | over `𝔽₂₅`: `24 = 3·8`, a character of order `3` exists, induced; over `𝔽₅`: `4` not divisible by `3`, strongly primitive | survives |
| §7.8 Checks | `A = k⟦T₁,T₂⟧`; `n = 1` | `(1+T₁)^a = (1+T₂)^{−b}` forces both constant, `a = b = 0`; finite-order `x ∈ 1 + m_A` in characteristic `l`: `(x−1)^{l^m} = 0`, `x = 1` | survives |
| §7.9(2) Check | `k⟦x,y⟧` | primes `(x − f(y))`, `f ∈ yk⟦y⟧`, uncountable, each of dimension `1 = d − 1` | survives |
| §7.11(1) witness | `n = 1`, `l = 5`, `F = ℚ(i)`, `ρ = ε₅^{−1}`, `µ = δε₅^{−2}` | at `ε₅(g) = 6`: `ψ₀ψ₀^c(g) = ω^{−2}(6) = 1`, `µ(g) = 1/36`, `1 − 1/36 = 35/36`, `v₅ = 1`; `1/36 ≡ 16 ≢ 1 mod 25`, so the fixed-`ψ₀` ring is killed by `5`; `d₀ = ω^{−1}·ε₅^{−1}ω = ε₅^{−1}`, `d₀d₀^c(g) = 1/36` | repaired, survives |
| §7.12 lattice | `T = u²` | `v_u = 2v_T`; `(2γ)^{#_u} = 2γ^{#} = 2γ`, selfdual, integer weights; reduction has the same constituents, multiplicity free, so Schur and `≅ ρ̄` | survives |
| §7.15 Check | `S₃` standard over `𝔽₅`, `𝔽₂₅` | as in §7.4 row; only `C₃` has index `2` | survives |
| §8.1 Check | `L = ℚ(i)`, `M = ℚ(ζ₈)`, `X = {(1+i)}` | `2` totally ramified in `ℚ(ζ₈)` (`e = 4`), so `(1+i)` ramifies in `M`: one prime, not `[M:L] = 2` | survives |
| §8.4 Check | `L⁺ = ℚ`, `|R| = 1` | `[M₁⁺:ℚ] = [M₁⁺:L⁺]·1 > [M₁⁺:L⁺]·1` fails | survives |
| §8.5 bounds | ANT20 Lemma 3.9 on `A = R/(Q₁,Q₂,J_R)` | ANT20 line 788 gives `dim A ≥ nD − |R|n(n+1) − 2`; Lemma 3.9 (ANT20 line 606) needs `dim A/(λ) > nD − d₀`; `dim A/(λ) ≥ dim A − 1 = nD − |R|n(n+1) − 3`, so `d₀ > |R|n(n+1) + 3` is needed; Tho15 line 3166 charges the extra `1` | README's `+3` correct; source issue below |
| §8.5 Check | `n = 2`, `|R| = 1` | `|R|n(n+1) + 3 = 9` | survives |
| §8 numerical bounds | Tho15 last display | Tho15 line 3371: `1 + nD − (6 + rn(n+1)) = nD − rn(n+1) − 5`, printed with `/2`; the display is on p. 70 | R01 |
| §8.11 Check | `n = 2`, `λ_τ = (0,0)`, `w = 1` | weights at `ṽ`: `{1,0}`; at `ṽ^c`: `1 − {1,0} = {0,1}`; `w = 3` gives `{2,3}` | survives |
| §8.12 Check | `n = p = 2` | `Φ = ((0,1),(a,0))`: `tr Φ = 0`, `tr Φ² = 2a = 0`, `det = a` arbitrary | survives |
| §8.20 Check | `n = 2`, `Φ = diag(1,a)` | eigenvalues of `X ↦ qΦXΦ^{−1}`: `q, qa, qa^{−1}, q` | survives |
| §9.1 Checks | `(1 ⊕ |·|, 0)`; Tate curve | `Hom` contains `|·| → 1(1) = |·|`: dimension `1`; with `N e₀ = e₁`, `f∘N(e₀) = λe₀′`, `N∘f(e₀) = 0`, so `λ = 0` | survives |
| §9.2 Checks | unramified `(1, q)`; `n = 1`, `K = ℚ_p` | `α_j = qα_i` with `(α_1,α_2) = (1,q)`; `H¹(ℚ_p, E)` of dimension `2`, `D_cris(E(1))^{φ=1} = 0`, `log∘ε` not Hodge–Tate | survives |
| §9.3 Checks | `n = 1`; odd `r` | Euler characteristic `h¹ ≥ [F⁺:ℚ]·(1 − 0)`; fixed space of `X ↦ −X^*` is antisymmetric matrices, `n(n−1)/2`, so `h¹ ≥ [F⁺:ℚ]n(n+1)/2` | survives |
| §9.4 Check | `a = b = 0`, `ρ̄ = ω`, `p > 2` | semistable with all weights `0` forces `N = 0`, crystalline, unramified; `ω` ramified; quotient `0` | survives |
| §9.5 Check | `n = 1`, `F = ℚ`, `S = {p}`, `[0,0]` | `H¹(G_{ℚ,S}, O/ϖ^m) = Hom(ℤ_p, O/ϖ^m) = O/ϖ^m`; `H¹_𝓔 = 0`; `R^{[0,0]} = O` | survives |
| §9.6 Check | `n = 1`, `[a,a]` | involution sends weight `a` to `w − a`; preserved iff `w = 2a` | survives |
| §10.1 Check | `N = 2`, `d = 1`, `µ` odd | `χ(c_v) = (−1)^{1+2+1} = +1`, `δ = 1`, archimedean term `3` against `1`, deficit `Nd = 2` | survives |
| §10.3 Check | `y² = x³ + 3x + 2` over `𝔽₅`, `ℓ = 7`, `N = 3` | points at `x = 1, 2` only (`6 ≡ 1`, `16 ≡ 1`; `2, 3, 3` are non-residues), `#E = 5`, `a_5 = 1`, `X² − X + 5`; mod `7`: discriminant `2 = 3²`, roots `2, 6`, ratio `2·6 = 5 = q`; printed exponents `{4,1,2}` miss `5`; `ΦτΦ^{−1} = I + 35E₂₁ = τ⁵`; `11904 = 7·1700 + 4` | repaired, survives |
| §10.4 Check | `n = 3`, `λ^s = (2,1,0)` | `λ^c = (−2,−3,−4)`; `λ^s + η = (4,2,0)`, `λ^c + η = (0,−2,−4)`; `V(2,1,0)^∨ ⊗ det^{−2} = V(−2,−3,−4)` | survives |
| §10.5 Check | `n = 2`, `λ^s = 0` | `λ^s + η = (1,0)`, `λ^c + η = (0,−1)` | survives; route gap R02 |
| gap projective image | `Sp₄(𝔽₅⟦T⟧)` | `dim PSp₄ = 10`, `dim PGL₄ = 15`, `a·b·a^{−1}·b^{−1} = 1` | repaired, survives |

### Headline theorems and the acceptance test

Headline families (README): §5.1, §5.3, §5.5, §§5.6–5.7, §6.2, §6.3, §6.5, §§8.7–8.8 and 8.17–8.18, §9.7, §10.2, §10.3, §10.5. Every one needs automorphic representations of `GL_n(𝔸_F)`, their Galois representations, `𝒢_n`-valued polarized representations or Galois deformation rings, none of which exists in Mathlib 6b7abb3 or Tau Ceti a91d3aa (object searches of round 1 repeated by name and by structure field: no carrier). All are named in the module docstring with the carriers they lack; the Serre weight exclusion is explained there. `Suggested.lean` declares nothing, has a single `import Mathlib`, no `set_option`, no `lemma`, no `sorry`.

Elaboration: `lake env lean` on `Suggested.lean` from the content checkout exited `0` with empty output (no warnings, no sorry). No `TauCeti.*` module is imported, so nothing was built. With no declarations there is nothing to `#check`, no signature comparison and no one-tactic padding probe to run; nothing in the file is padding.

### Policy and shape

No `$`, `\(`, `\[` in the README; no process words ("so far", "checkpoint", "removed", "optional", "deferred", pull-request references, job ids) found by grep; all 110 numbered targets have a `*Needs:*` line, at least three Checks each (counted), every layer ends with Examples and Dependencies; locators cite the registered versions. Standard vocabulary throughout; the only coined terms (weakly and strongly primitive, relaxed-adequate, potentially pro-automorphic, good extension) are defined where introduced.

### Supplier resolution and ownership

The citation resolver reports no cross-roadmap citation and no Lean name found nowhere. Resolved by hand this round, at the open heads (`roadmaps show`) or on main:

| Supplier | Resolved |
|---|---|
| AutomorphicGaloisRepresentationsPartII | AG2.0 parity target (README line 775), AG2.2 layer (1264), AG2.3 "Arbitrary regular conjugate-self-dual existence" (1365), AG2.6 "Generic monodromy orbits and local genericity" (3171), AG2.7 "Finite `p`-adic realization before lattices" (3415) and "Residual representation of `π`" (3430). |
| ModularityAndLanglandsExtensions (later, position 269; cited only as a downstream consumer and in Scope) | §§2.1, 2.2, 2.9–2.16, 2.32 "Change of weight and level (Theorem 4.4.1)", 4.1, 4.2 exist (its README lines 777–1086, 1355, 2408, 2431). |
| LocalGaloisDeformationRings | §§0.3, 1.7, 1.13, 1.14, 2.3, 2.8, 2.12, 2.15, 2.20, 2.21, 2.23, 2.24, 2.26, 2.28, 3.2, 3.4, 3.9, 3.11, 3.13, 4.10–4.14, 6.8 (with `Connects.sum_tensor_dual`, `Connects.symPow`), 6.24, 6.30, 8.7, F.2.11 (its README lines 891–3786). |
| GlobalGaloisDeformations | §§3.6, 4.2, 4.4, 8.1–8.7 (its README lines 495–2108). |
| DeformationAndDerivedPatchingAlgebra | §§1.9, 4.1–4.2, 5.4–5.8, 6.1–6.7 (its README lines 233–1303). |
| ArithmeticGaloisRepresentations | §§1.3, 1.6, 1.8, 1.12, 5.3, 7.4, 7.9, 7.10 (its README lines 897–4932); `ResidualImage.IsAdequate` is declared in its `Suggested.lean` (line 367); `ResidualImage.IsGHTAdequate` and `ResidualImage.IsEnormousCharZero` are named targets of its §§7.9–7.10 (README lines 4852, 4956), not yet declarations. |
| IntegralHeckeAndGaloisDeterminants | §§0.2, 0.5, 1.1–1.4, 3b.1 (its README lines 584–3013). |
| AutomorphicFormsOnReductiveGroups | Layer 2, §§2.4–2.6, 5.1, 7.4, 7.5 (its README lines 298–1231). |
| PotentialAutomorphyInfrastructure | §§0.4, 2.3, 2.5, 3.44–3.48 (its README lines 333–1857). |
| ReductiveGroupsPartII | §§RG2.2.1, RG2.2.4 (its README lines 2847, 3409). |
| SmoothRepresentationsOfLocalGroups | Layer SR.1, §§SR.2.2 (Jacquet functors, geometric lemma), SR.2.3, SR.3.4, SR.5.2 (its README lines 1012–3796). |
| Mathlib (pin) | `Ideal.finite_minimalPrimes_of_isNoetherianRing` at `Mathlib/RingTheory/Ideal/MinimalPrime/Noetherian.lean:26`; `Module.finite_of_surjective_of_ker_le_nilradical` at `Mathlib/RingTheory/Finiteness/NilpotentKer.lean:22`; `Ideal.primesOver` at `Mathlib/RingTheory/Ideal/Over.lean:375`; `Group.IsSolvable` at `Mathlib/GroupTheory/Solvable.lean:108`; `IntermediateField.normalClosure` in `Mathlib/FieldTheory/Normal/Closure.lean`; the round-1 table for the others. |
| Tau Ceti (pin) | `NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois` at `TauCeti/NumberTheory/NumberField/SplitsCompletely/Basic.lean:74`, with the Dedekind, finite, torsion-free and Galois-group hypotheses as the README says. |

Ownership against the board packages (index read: AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) and against the open heads: no second owner of the polarized lifting theorems, the determinant subring, the primitivity comparisons, the selfdual midpoint lattice or the Dwork-family properties was found by object; the overlap with ModularityAndLanglandsExtensions §§2.15–2.16 is the ownership move toward this package recorded in round 1, and that roadmap is later in the order. Ownership against open pull requests not given to this job with their files was not checked.

Dependency check output:

```text
moved: PotentialAutomorphyInfrastructurePartII moved in the merge order from #85 to #258, right after its last supplier PotentialAutomorphyInfrastructure (GlobalGaloisDeformations, PadicHodgeTheory, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII, PadicFamilies, PotentialModularityAndCompatibleSystems also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 205 roadmaps, 1769 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the `moved:` line is not a defect.

### Declared supplier gaps

All seventeen slugs occur once in `design/plan.json` `gaps` and once in the README's supplier contracts with the same supplier and section: `equal-characteristic-projective-image`, `barsotti-tate-components-general-base`, `cht-archimedean-ring-two-adic`, `completed-product-components`, `semistable-stable-category`, `nonsplit-minimally-ramified`, `generic-tame-pcris-domain`, `two-adic-polarized-presentation`, `nonsplit-polarized-problems`, `square-zero-determinant-cotangent`, `rank-one-ordinary-finiteness`, `enormous-image-taylor-wiles-primes`, `group-equivariant-patching`, `brochard-ultrapatching`, `bounded-denominator-determinant-lifts`, `unitary-shimura-integral-cohomology`, `unitary-dual-conjugate-self-duality`. None has supplier `none`; each `needs` sentence states one statement with its hypotheses (the rewritten projective-image gap now carries the full Tho15 §5.1 hypotheses). Observation, not a finding: `rank-one-ordinary-finiteness` follows from §7.11(1) with `n = 1` (`R^univ ≅ O⟦Δ_S/(c+1)⟧`) and class field theory (the inertia groups above `p` generate a finite-index subgroup of `Δ_S/(c+1)`, whose `ℤ_l`-rank is `[F⁺ : ℚ]`), so the supplier's work for it is small; as a design-stage contract it is left as declared.

## Not verifiable

- Pink, Tadić, Liu, Brochard, Labesse, Clozel–Harris–Taylor and Chenevier–Harris are cited only through the registered sources that invoke them; no independent reading is claimed.
- The §7.12 selfdual midpoint lattice argument is the package's own; it was checked step by step above (duality of adapted norms, affine duality on segments, `T = u²` making weights integral, Schur semisimplicity of the reduction) but is not a stated theorem of Sk13 or Tho15.
- Ownership against open pull requests not listed with their files in this brief was not checked.

## Source issues

- **Misprint** in Tho15 at Lemma 3.3(2), printed p. 13: the source says two Schur homomorphisms with equal traces on `Δ` over an algebraically closed field are conjugate; it should also require equal multipliers, since the standard representation of `S₃` carries both a symmetric pairing with multiplier `1` and an alternating one with multiplier `sign`; affects a stated result.
- **Gap** in ANT20 at Theorem 5.1, proof, printed p. 16: the source says the bound `d₀, d_l > |R|n(n+1) + 2` lets Lemma 3.9 produce a generic prime in `R/(Q₁,Q₂,J_R)`; it should be `+3`, since Lemma 3.9 reads the dimension modulo `λ`, one less than the displayed bound; affects the proof.
- **Misprint** in Tho15 at the proof of Theorem 7.1, last display, printed p. 70: the source says `n[L⁺:ℚ] − rn(n+1)/2 − 5`; it should be `n[L⁺:ℚ] − rn(n+1) − 5`, as the preceding line computes; affects nothing.
- **Misprint** in NT26 at Definition 2.5(1), printed p. 11: the source says `v_p(ιχ_i(ϖ_v))`; it should be `v_p(ι^{−1}χ_i(ϖ_v))`, the characters being complex-valued; affects nothing.
- **Misprint** in NT26 at the proof of Proposition 6.1, printed p. 46: the source says potential diagonalizability follows from BLGGT14 Lemma 1.4.1; it should cite Lemma 1.4.3(2), Lemma 1.4.1 being conjugation invariance; affects nothing.
- **Misprint** in BCG25 at the proof of Theorem 3.1, printed p. 10: the source says "[Tho17, Thm. 7.1]"; it should cite Tho17 Corollary 7.3 (or Theorem 5.1), there being no Theorem 7.1 in Tho17; affects nothing.
- **Misprint** in NT21 at Corollary 5.4, printed p. 69: the source says the lift is a homomorphism of `G_{F⁺,S}`; it should be `G_{F⁺,S∪Σ}`, the lift being of Steinberg type at `Σ`; affects nothing.
- **Misprint** in Tho15 at Proposition 4.4, items 1(c) and 2(c), printed p. 37: the source says `σ_w ≅ π_w ∘ ι_w^{−1}`; it should be `σ_v ≅ π_w ∘ ι_w`, `ι_w` mapping `G(L⁺_v)` to `GL_n(L_w)`; affects nothing.
- **Misprint** in Tho17 at Proposition 2.21(i), printed p. 14: the source says `µ(c_v) = −1` for the residual multiplier, vacuous when `p = 2`; it should be `χ(c_v) = −1` for the multiplier of the deformation problem, which the Euler characteristic uses; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6b4e6a1e81bebe1f9726ea69fb6da2b3b3f6a757", "job": "REV-PKG-PotentialAutomorphyInfrastructurePartII~2", "model": "fable", "worker": "chris-x11"} -->
