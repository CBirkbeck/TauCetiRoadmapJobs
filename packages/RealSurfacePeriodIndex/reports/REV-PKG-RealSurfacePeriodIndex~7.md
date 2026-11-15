<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6900347080 -->
Review (claude) of 9a0efa3

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §0.12 states the index under extension for finite extensions only; §1.5 and §7.8 use it for infinite ones

   **Location.** `packages/RealSurfacePeriodIndex/README.md:446` (§0.12): "for a finite extension L/K, ind(α_L) divides ind(α), which divides [L : K]·ind(α_L)"; API bullet at line 461. Used at line 658 (§1.5 step 1): "ind(α_K) divides ind(α) and per(α_K) divides per(α) (§0.12)", and at line 2024 (§7.8 step 2, "replace K by K_i").

   **Claim.** §0.12 supplies ind(α_L) | ind(α) and per(α_L) | per(α) where §1.5 and §7.8 apply them.

   **Witness.** §1.5 applies it to k(X) ⊂ K(X_K), e.g. ℚ̄(x, y) ⊂ ℂ(x, y), of infinite transcendence degree; §7.8 to K_i ⊂ K, algebraic but infinite. §0.12 states neither case, and states nothing about the period under extension. §7.8's *Needs:* line (README:2031) has no §0.12.

   **Exact repair.** The mathematics is already in step 3 of §0.12, which uses no finiteness for the first divisibility.

   - In the §0.12 statement replace the quoted clause by: "for every field extension L/K, finite or not, per(α_L) divides per(α) and ind(α_L) divides ind(α); and for a finite extension L/K, ind(α) divides [L : K]·ind(α_L)".
   - Begin step 3 with: "For any field extension L/K, restriction Br(K) → Br(L) is a group homomorphism, so per(α_L) divides per(α), and D ⊗_K L ≅ M_r(D′) gives ind(α_L) = deg D′ dividing d. For finite L/K, a splitting field of α_L …" (rest unchanged).
   - Replace the API bullet "ind(α_L) | ind(α) | [L : K]·ind(α_L) for finite L/K" by two bullets: "per(α_L) | per(α) and ind(α_L) | ind(α) for every field extension L/K." and "ind(α) | [L : K]·ind(α_L) for finite L/K."
   - Add the Check: "Along the transcendental extensions ℝ ⊂ ℝ(t) and ℝ ⊂ ℂ(t) the Hamilton class has index 2 (ℝ(t) is real, so ⟨1, 1, 1, 1⟩ stays anisotropic) and 1: ind(α_L) | ind(α) holds for both, while the reverse bound is stated for finite L/K only."
   - In §7.8 step 2, after "replace K by K_i" add "(ind(α) divides ind(α_i) by §0.12, K/K_i being algebraic, possibly infinite)", and add §0.12 to the *Needs:* line of §7.8.

   **Repair test.** ℚ̄(x, y) ⊂ ℂ(x, y), α = (x, y): ind(α_L) = 2 | 2 = ind(α), per 2 | 2. ℝ ⊂ ℂ(t), Hamilton class: 1 | 2. No target, hypothesis or Lean signature changes.

2. **F02** (P3) smooth ⇒ regular is a pinned Tau Ceti declaration, cited through a roadmap section

   **Location.** `packages/RealSurfacePeriodIndex/README.md:65` (Tau Ceti contract): "a surface smooth over a field, regular by SchemeAndStackFoundations §4.13, is locally factorial"; README:745 (§1.9 step 1): "S is regular (SchemeAndStackFoundations §4.13)". Both sentences were written by the round-7 repair.

   **Claim.** SchemeAndStackFoundations §4.13 is the owner of "smooth over a field implies regular".

   **Witness.** Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6953–6958`: regular schemes "are Tau Ceti's", citing `IsRegular.of_smooth` (`:90`). Pin: `TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:90`, `IsRegular.of_smooth`, and `:118`, `isRegular_Spec`. This is the pattern of round-6 F03.

   **Exact repair.** In the Tau Ceti contract bullet (README:65) replace "regular by SchemeAndStackFoundations §4.13" by "regular by `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (same file, line 90: the source of a smooth morphism to a regular scheme is regular; the spectrum of a field is regular by `isRegular_Spec`, line 118)". In §1.9 step 1 replace "(SchemeAndStackFoundations §4.13)" by "(Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`, applied to S → Spec ℝ)". In the *Needs:* line of §1.9 replace "SchemeAndStackFoundations §4.13" by "Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.of_smooth`", and add that name to the Layer 1 Dependencies (which keep §4.13 for the Bertini step of §1.8).

   **Repair test.** S = ℙ²_ℝ → Spec ℝ is smooth and Spec ℝ is regular, so `IsRegular.of_smooth` gives `IsRegular` S; every point has coheight ≤ 2, so `uniqueFactorizationMonoid_stalk` applies, as §1.9 needs. On the quadric cone xy = z² the structure map is not smooth at the vertex and the lemma does not apply, matching the negative control.

3. **F03** (P3) the paraphrase of `IsOrderedRing.toIsStrictOrderedRing` drops nontriviality

   **Location.** `packages/RealSurfacePeriodIndex/README.md:44`: "`IsOrderedRing.toIsStrictOrderedRing` (Algebra/Order/Ring/Defs.lean:107: an ordered ring without zero divisors is strictly ordered)".

   **Claim.** Every ordered ring without zero divisors is strictly ordered.

   **Witness.** The zero ring is an ordered ring without zero divisors and is not strictly ordered: `IsStrictOrderedRing` extends `Nontrivial` (pinned `Mathlib/Algebra/Order/Ring/Defs.lean:74–76`). The pinned instance (line 107) assumes `[NoZeroDivisors R] [Nontrivial R]`.

   **Exact repair.** Replace the parenthesis by "(Algebra/Order/Ring/Defs.lean:107: a nontrivial ordered ring without zero divisors is strictly ordered)".

   **Repair test.** Zero ring: excluded by "nontrivial". A field F with the cone order of P (§0.1): nontrivial, no zero divisors, so strictly ordered, as §§0.1, 0.3, 0.4 use.

4. **F04** (P3) the only Check of §7.7 carries a hypothesis it does not need and computes nothing

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2011` (§7.7 Checks): "If S(ℝ) is orientable and every class of H¹(S(ℝ)) is algebraic, the condition can be met by a Picard correction."

   **Claim.** Orientability is part of what makes the Picard correction work.

   **Witness.** S = ℙ²_ℝ, α the Hamilton class: S(ℝ) = ℝℙ² is nonorientable, H¹(ℝℙ², 𝔽₂) = ⟨h⟩ = cl_R(Pic), and the two lifts of α differ by κ(O(1)) with [κ(O(1))]₁ = h, so one has [ξ]₁ = 0.

   **Exact repair.** Replace the Check by: "For S = ℙ²_ℝ and α the Hamilton class (n = 2, Θ = ℝℙ²), the two lifts of α in H²_G(ℙ²(ℂ), 𝔽₂) differ by κ(O(1)), whose first component is cl_R(O(1)) = h, the generator of H¹(ℝℙ², 𝔽₂); so exactly one lift has [ξ]₁ = 0 and ind(α) = per(α) = 2, although ℝℙ² is nonorientable. In general, when cl_R : Pic(S) → H¹(S(ℝ), 𝔽₂) is onto, a Picard correction always produces such a lift."

   **Repair test.** On the instance: Pic(ℙ²_ℝ)/2 = ℤ/2 and Br(ℙ²_ℝ)[2] = ℤ/2 give four classes in H²_G, two over α; [ξ]₁ ∈ {0, h} takes both values on them. ℍ ⊗ ℝ(x, y) is a division algebra (ℝ(x, y) is real), so ind = 2 = per.

Four findings, all P3 (no P1, no P2). The three round-6 findings are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, no statement is padding, and the dependency check is clean. No package file was changed by this review.

## Verified sound

### Round-6 findings

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01 (P1), unowned quasi-projectivity in §7.6 | README:1980 "not assumed quasi-projective: the proof passes to a nonempty affine open"; step 1 (README:1986) compactifies U′ | **Repaired.** U′ affine of finite type is closed in 𝔸ⁿ ⊂ ℙⁿ; ResolutionOfSingularitiesCharacteristicZero §6.2 (main README:893) is for smooth quasi-projective varieties. ℙ² ⊃ 𝔸²: complement of real points is ℝℙ¹, empty interior. Complement of x² + y² = z²: disc ⊔ Möbius band, dense. |
| F02 (P3), `cartierClass_picard_equiv` | README:73 cites `classGroup_picard_locallyFactorial` and `picard_excision_sequence` | **Repaired.** Both are on main (SchemeAndStackFoundations README:5985, 6005) with the hypotheses the contract quotes. ℙ² ⊃ 𝔸²: ℤ → ℤ → 0 → 0. Quadric cone: Pic 0, Cl ℤ/2 (div x = 2·ruling), Pic(cone ∖ vertex) = ℤ/2, not onto. R02 is on a sentence this repair added. |
| F03 (P3), cone-order declarations | README:44, 69, 168, 203, 207, 236, 241 | **Repaired.** All nine names opened at the pin (list below); statements agree, except the paraphrase of R03. ℚ(√2) with √2 < 0: ι(√2) = −√2 < 0 under `strictMono_comap`. |

The pattern of F01 (an unowned geometric input) was searched in the proof routes read this round and gave R01; the pattern of F03 gave R02.

### Coverage

Read in full this round: Summary to "How to read the build", Layers 0, 1, 2, 3, 5, §§6.1–6.8, 6.13, Layers 7, 8 (§§8.1–8.10), 9, Downstream consumers, Source corrections, References. **Not re-read in full this round:** Layer 4 and §§6.9–6.12; for these I rely on the round-6 rows with computed values (§§4.5, 4.6, 4.7, 6.9) and say so under "Not verifiable".

### Adversarial table (sampled targets, headlines, findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1 Harrison space, cone-order bullet | ℝ, ℂ, ℚ(√2), zero ring | 1, 0, 2 orderings; support of a nonneg cone in a field is {0}, prime; zero ring not strictly ordered | sound; R03 on the contract paraphrase |
| §0.5 survival locus | M_d(R), ℍ_R, M_m(ℍ_R) | d(d+1)/2 − d(d−1)/2 = d; Trd(x²) = 2(a² − b² − c² − d²), signature −2; m·(−2) = −d | sound |
| §0.6 `HasZeroTotalSignature` | ⟨1,−1⟩, ⟨1,1⟩, ⟨1,0⟩ over ℝ; odd dimension; nonreal K | line x = y, 2·1 = 2; no isotropic line; radical line, 2·1 = 2 (degenerate, isotropic); 2·dim W odd impossible; vacuous | sound |
| §0.7 Tsen–Lang | counts in steps 2, 3 | rN > r·d^i; N(m+1) > (dm+c+1)·d^i for N > d^{i+1}, m large | sound |
| §0.12 period and index | Albert class (x,x)+(y,xy) over ℝ(x,y); infinite L/K | Albert form ⟨−1,x,x,−y,−xy,x⟩: x-adic residue forms ⟨−1,−y⟩, ⟨1,1,1,−y⟩ anisotropic over ℝ((y)), so index 4, period 2; ℝ ⊂ ℂ(t): 1 | 2 | sound; R01 |
| §1.6 prescribed degree | c = re, d = me; order with lower-left entry in tR | dim V = mre²; rank P = mre²/(re) = me = d; xy = te₁₁, yx = te₂₂ ∈ tO, J² = 0, quotient ℂ × ℂ | sound |
| §1.7 Saltman, Checks | (s,t), l = 2; (−1, 1+s²+t²) | (s,t) = (s,st) + (s,−1); b² + d² = 1, ab + cd = 0 give (a,c) = λ(−d,b), so 1 + s² = λ², not a square in ℝ(s) | sound |
| §1.8 specialisation | local equation at a crossing; fibres t = 0, 1 | ord_D(s_t) = 1 for t ≠ 1; s_t/s₁^l = c·ss′·(ss′)^{−l}; (s,s′) = (s, s_t/s₁^l) + (s, −c⁻¹); t = 1: z^l = s₁^l splits | sound |
| §1.9 extension and injectivity | ℙ² ⊃ 𝔸²; cone; S², torus, ℝ² minus a point | ℤ → ℤ → 0; Pic 0 → ℤ/2 not onto; H¹(D, D ∖ pt) = H̃⁰(S¹) = 0, so injective; 𝔽₂² → 𝔽₂² | sound; R02 on the citation |
| §2.1 | H = h + A, K_X = −2h + K_S | (2hA + A²)(−2h + K_S) = 2(A·K_S − A²); ℙ²: −8 | sound |
| §3.2 singular points of T̄ | chart r = su², chart rt² = s | u = 0: dr = 0, r = xy, node; u ≠ 0: s = 0 and dr = u²ds contradict transversality; second chart smooth | sound |
| §3.3 local structure | charts (r,x), (s,y), y = x⁻¹, s = rx² | blow-up of (r,z): z = rx gives s = rx²; r = zy gives z = ys. Γ(O): r^a x^b with 0 ≤ b ≤ 2a, generated by r, rx, rx²; H¹ = 0 since b ≥ 0 or b ≤ 2a always | sound |
| §3.6 equivariant pushforward | i ≥ 5 on a real surface | H^q(G, ℤ(j)) ≠ 0 iff q ≡ j mod 2 (q > 0); q = i − p ≡ i − 1 forces p = 1: H^i_G(S(ℝ), ℤ(i−1)) = H¹(S(ℝ), 𝔽₂) | sound |
| §5.4 boundary component | a = a₀ω² + a₁ω + a₂, e = ω + e₁ on Ψ | Sq¹a = (0, a₁, βa₁); ω∪a = (a₀, a₁, a₂); e∪a = (a₀, a₁ + a₀e₁, a₂ + a₁e₁); sum (0, a₁ + a₀e₁, βa₁ + a₁e₁); a₀ = (0,1) gives (0, e₁) | sound; agrees with B19 line 858 |
| §5.5 Enriques control | B Vandermonde on 1, 2, 3 | det 2; 2×2 minors 1,3,2; 2,8,6; 1,5,6; 8 sign vectors mod ±1 = 4 spheres, ι antipodal; c_Ψ = h₁, sum 1 ∉ J; h₁ + h₂, sum 0 ∈ J | sound |
| §6.7 branch section | divisor of t as a section of A^l ⊗ N²(−R) | div(h₁h₂) + R + div(u): with h₁ of real divisor H − R gives H; with the source's R + H gives 2R + H; rt = −h₁h₂·Σ(ru_i)² < 0 off Ξ | sound |
| §7.1 half-period class | n = 2, 4, 6 | t = n/2 mod 2 = 1, 0, 1 | sound |
| §7.2 induction step | m = per(α_T) | m | n/2; cor(α_T) = 2α gives n | 2m, so m = n/2 | sound |
| §7.6 | rows of F01 above; Hamilton class on ℙ²_ℝ | evaluates to 1 on 𝔸²(ℝ): excluded by the hypothesis on U′ as on U | sound |
| §7.7 sufficient half of Theorem 0.5 | ℙ²_ℝ, Hamilton class | lifts ξ, ξ + κ(O(1)); [·]₁ ∈ {0, h}; ind = per = 2 | sound; R04 on its Check |
| §7.9 anisotropic form | w ≡ i | w′ = (w²−1)/(2w) ≡ −2/(2i) = i; w′² + 1 = (w²+1)²/(4w²) ∈ m²; y_j = (1 + w′²) + 2(1 + w′)z_j + 2z_j² ≡ 2(1+i)z_j mod m²; signature 1+1−1−1 = 0 | sound |
| §7.10 u = 4 | ℝ(x,y) | ≤ 4 by §7.8, ≥ 4 by §7.9 | sound |
| §7.12 | d = 4, 3 | h⁰(−K) = 5, h⁰(−2K) = 13 < 15; cubic: 10 = 10 | sound |
| §8.3 trace sequence | (a, [x]) ↦ a − Tr x mod n | kernel of (Tr, quot): x ∈ ℤ, nx = 0, so 0; middle exact: a = Tr(x + k); ℙ¹ × ℙ¹: κ(O(1,0)) ≠ 0 | sound |
| §8.7 against §5.4 | n = 2, m_i = 1 | θ = M ⊗ O(Δ) = M³, cl_R(θ) = cl_R(M) = [e]₁ | consistent |
| §9.8 deg(w₁²) = 0 | independent route | deg(cl_R(D)∪cl_R(D′)) ≡ D·D′ mod 2 (nonreal intersection points pair up); K_S² = 0. Controls: ℙ², χ = 1, K² = 9; quadric sphere, χ = 2, K² = 8 | sound |
| §9.9 one nonempty half | deg([α̃]₀∪w₁²) = 1 | odd number of odd-χ components in Θ, even total, so some Σ outside Θ; deg(a∪w₁) = 1 + χ(Σ) = 0 | sound; route is B19 lines 1791–1799 |
| §9.13 | Ξ = {u/w, v/w > 0} | Θ(α) = three of the four components; α ≠ 0 | sound; cited input not read |
| `index_eq_orderOf_of_isAlgClosed` | ℂ(x,y): 0, (x,y) | 1 = 1; 2 = 2 | sound |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | Albert class; odd n | 4 | 2·2; ind | 2n with equal primes gives n | sound |
| `index_eq_orderOf_of_not_isSemireal` | ℝ(x,y) control | Albert class: 4 ≠ 2, hypothesis needed | sound |
| `index_eq_orderOf_of_forall_isRealClosed` | Albert class; nonreal K | survives where x < 0: hypothesis fails; vacuous hypothesis reduces to the previous theorem | sound |
| `not_anisotropic_of_hasZeroTotalSignature` | degenerate q; dimension 4 | radical vector isotropic; ⟨1,y₁,−y₂,−y₁y₂⟩ shows 4 < dim is sharp | sound |
| `exists_anisotropic_hasZeroTotalSignature` | R real closed over K | y_j > 0, signature 0, isotropic plane, 2·2 = 4 | sound |
| `not_anisotropic_of_not_isSemireal` | ⟨1,x,y,xy⟩ over ℂ(x,y) | rank 4 anisotropic, so 5 is the threshold | sound |
| `exists_common_zero_of_not_isSemireal` | K(t) | finitely generated of transcendence degree 2, nonreal; 5 ≥ 5 | sound |

### Sources: the seeded sample

B19 page N of the file is printed page 62 + N; CT05 page N is printed 378 + N. The author flagged no locator as unverified.

| Target | Locator read | Outcome |
|---|---|---|
| 0.1 | B19 lines 1313–1314 (p. 95); EKM line 7222 (§33, p. 133), line 20198 | supported; BCR not read |
| 1.6 | CT05 lines 256–258 (Théorème 2.5, file page 7 = p. 385) | first assertion supported |
| 1.9 | B19 line 819 (p. 83), lines 883–901 (pp. 84–85), 1621, 1654 (pp. 102–103) | both steps are used there |
| 3.3 | B19 lines 537–550 (§3.1, p. 76); 989–998 (proof of Lemma 5.3, p. 87) | the splitting of p_*O_T is at line 998; the source's "finite double cover" (line 546) is what the README corrects |
| 3.6 | B19 lines 640–646 (Proposition 3.3, p. 79) | supported, same hypotheses |
| 5.4 | B19 lines 844–861 ((4.8), p. 84); 485 (Lemma 2.1, p. 75) | formula (0, b + a∪[e]₁, …) at line 858; the source's conclusion at line 861 is as the README describes |
| 6.7 | B19 lines 1157–1170 (Lemma 6.4, p. 92) | statement supported; the proof step the README corrects is as described |
| 7.1, 7.2 | B19 lines 1286–1300 (Proposition 6.7, p. 95) | supported |
| 7.7 | B19 lines 65–69 (Theorem 0.5, p. 64); 1301–1304 (p. 95) | supported |
| 7.9, 7.10 | B19 lines 138 (Theorem 0.12, p. 66); 1329–1338 (p. 96) | supported |
| 8.3 | B19 lines 1422–1427 (Lemma 7.2, p. 98) | supported |
| 9.9 | B19 lines 1782–1799 (p. 107) | supported |
| 9.13 | B19 lines 1814–1816 (p. 107) | B19 cites CTP90 Proposition 3.1.2 as stated; CTP90 not read |

Also read: B19 lines 24, 43, 52, 77–80, 106, 123, 146 (Theorems 0.1, 0.3, 0.4, 0.6, 0.10, 0.13, Proposition 0.7: printed pages 63–66 as cited), 520–528 ((2.16)–(2.17), p. 76), 748–749, 1746–1781; EKM line 3774 (Corollary 17.6); BW20II line 1018 (Proposition 8.3). All 23 cited works have a manifest key; no entry was added or changed.

### Lean

`lake env lean` on `packages/RealSurfacePeriodIndex/Suggested.lean`, from the content checkout: exit 0, eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else. The three imported Tau Ceti object files were present.

Padding probe on a scratch copy: each of the eight theorems tried with `simp`, `rfl`, `infer_instance`, `exact?`, `aesop`, `intros; simp_all`, `decide`, `omega`, each wrapped as `fail_if_success (tac; done)`; exit 0, so none of the 64 probes closes a goal. `#check @name` for all nine declarations in the same file: every binder of the README statements is present (`[IsAlgClosed k] [CharZero k]`, `[IsRealClosed R]`, `[Algebra.EssFiniteType _ K]`, the `trdeg` and `¬ IsSemireal K` hypotheses, `[Invertible 2]`, `[FiniteDimensional K V]`); nothing changed, the file being unchanged since round 6.

Headlines: Theorem 0.1 and the norm bound, 0.3, 0.4 (birational form), 0.10, 0.12 (two statements) and the pair-of-quadrics form of 0.13 are stated; the scheme form of 0.4, Theorems 0.5 and 0.6, Proposition 0.7 and the del Pezzo form of 0.13 are named in the docstring with the missing carriers. The nine backticked names of the README's own are the nine declarations. No `set_option`, no sorry'd data, no `lemma`, no example. The import header is `import Mathlib` followed by the three Tau Ceti modules used.

### Pinned declarations opened this round

Mathlib: `LinearOrder.ofSubmonoid` with its additive form (`Algebra/Order/Group/Cone.lean:63`), `Subsemiring.IsPointed.nonneg`, `Subsemiring.IsSpanning.nonneg`, `IsOrderedRing.ofSubsemiring` (`Algebra/Order/Ring/Cone.lean:25, 28, 33`), `Subsemiring.IsOrdering` and `IsOrdering.of_isPrime_supportIdeal` (`Algebra/Order/Ring/Ordering/Defs.lean:40, 54`), `IsPreordering.isPointed` (`Ordering/Basic.lean:88`), `IsStrictOrderedRing` and `IsOrderedRing.toIsStrictOrderedRing` (`Algebra/Order/Ring/Defs.lean:74, 107`), `Scheme.isBasis_affineOpens` (`AlgebraicGeometry/AffineScheme.lean:303`). Tau Ceti: `IsOrdering.comap`, `strictMono_iff_nonneg_iff_mem_comap`, `strictMono_comap` (`Algebra/Order/Ring/Ordering/Map.lean:64, 85, 105`), `IsRegular.of_smooth`, `isRegular_Spec`, `IsRegular.uniqueFactorizationMonoid_stalk` (`AlgebraicGeometry/Scheme/Regular/Scheme.lean:90, 118, 200`; the last assumes `Order.coheight x ≤ 2`). The 44 other contract locators were opened in round 6 and the pins have not moved.

### Suppliers, direction and ownership

Dependency check, whole output:

    depcheck: 246 roadmaps, 2253 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `roadmaps resolve` lists no citation and no Lean name found nowhere. Resolved this round on main: SchemeAndStackFoundations §3.4 (README:5967, with the two names) and §4.13 (README:6951); ResolutionOfSingularitiesCharacteristicZero §6.2 (README:893). The other citations were resolved in round 6; `scratch/overlaps.md` reports no dropped id, no revision-only id and no conflicting head since.

The three gaps have the same slugs in the README (README:95, 101, 111) and in `design/plan.json`, each with a named supplier and section; each is precise and minimal, as round 6 found, and none is re-raised.

Duplication by object: the open roadmaps and main were searched for the Harrison topology, the Elman–Lam invariant, Amer–Brumer and period–index; the only second statement is the Tsen–Lang theory of QuadraticFormInvariantsPartII (its README:116–118, 2029), which still says this roadmap takes Tsen–Lang from it. The round-4 repair report marked that not actionable in this package; the reason holds (the other text must change) and it is not re-raised. BorelRegulators §3.1 is the number-field period–index input, a different object.

Overlap check: read QuadraticFormInvariantsPartII, AlgebraicTopologyPartII, MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions (open), QuadraticFormInvariants, RealAlgebraicGeometry, GlobalQuadraticForms (main); the Tsen–Lang theory is shared with QuadraticFormInvariantsPartII and its owner is this roadmap (§0.7), the earlier one; nothing else shared.

### Shape, policy and source independence

Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, ten layers each ending in Examples and Dependencies, Downstream consumers, References. Definitions read this round have an API list and at least three Checks; theorems have hypotheses, a locator and a *Needs:* line. No LaTeX delimiters, pull-request numbers, paths, round labels or process words; no algorithm. Source corrections E16 and E19 are neither defined nor cited.

Arrangement against B19 (129 of 205 locators), by number: Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8; Layers 0 and 1 have no counterpart, the source's §2 is left to suppliers, Layers 4 and 5 are in the opposite order to the source and independent of each other, and Layer 9 after Layers 7 and 8 is forced by §§9.6, 9.7. Not a one-to-one run.

Wording: 14 passages set beside the source at the locators above (§§0.1, 1.6, 3.6, 5.4, 6.7, 7.2, 7.6, 7.7, 7.9, 8.3, 9.5, 9.9, 9.12 and §5.5 step 1). The longest shared run of prose is ten words, the opening hypothesis of Theorem 0.4 in §7.6 (B19 line 52), a hypothesis that can be written in one way only; elsewhere the runs are formulas and standard names.

Source independence: 14 passages compared with 3 sources (B19, CT05, EKM), none shared; largest share B19, 129 of 205 locators; contents compared with B19: independent.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00 are settled uncertified; their texts were not read. In the sample this leaves unread BCR Example 7.1.4 a) (§0.1) and CTP90 Proposition 3.1.2 (§9.13); B19 lines 1313 and 1815 confirm that the source cites them for these statements.
- Layer 4 and §§6.9–6.12 were not re-read in full this round; the round-6 rows for §§4.5, 4.6, 4.7 and 6.9 carry computed values, the other targets of these sections were not recomputed.

## Source issues

Only what was confirmed against the text in this round.

- **Error** in B19 at §3.1, printed p. 76: the source says the incidence surface is a finite double cover of the base; it should say finite only away from the crossings of the two branch divisors, where the fibre is a projective line; affects a stated result.
- **Misprint** in B19 at §3.1, printed p. 77: the source says the fixed singular points are those over the singular locus of the ramification divisor where the first tautological section vanishes; it should be the second; affects nothing.
- **Error** in B19 at Proposition 4.4, proof after (4.8), printed p. 84: the source says the first component of the boundary class on the avoided set equals that of the cover class; it should carry the factor of the degree-zero component of the lift, which is 1 only on the nonzero evaluation locus; affects a stated result.
- **Error** in B19 at Lemma 6.4, proof, printed p. 92: the source says the auxiliary function vanishes to order one along both the ramification divisor and the approximating curve; it should have a simple pole along the ramification divisor; affects the proof.
- **Error** in B19 at Theorem 0.6 (ii) and its proof, printed pp. 65, 107: the source says one nonempty half with an odd number of odd-Euler-characteristic components gives index 4; that case cannot occur, the canonical class being algebraic; affects nothing.
- **Gap** in B19 at proof of Theorem 0.12, printed p. 95: the source says the field is the union of the finite extensions of a finitely generated subfield; it should first enlarge that subfield by a transcendence basis; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, lower bound, printed p. 96: the source says two non-proportionality conditions make the two functions local parameters; it should also exclude the case where the 2×2 determinant vanishes; affects the proof.

## For the human reviewers

- **Ownership.** QuadraticFormInvariantsPartII (open; its README:116–118, 2029, §§5.1–5.6) and this package (§0.7) each state the Tsen–Lang theory and each names the other as consumer; this package is earlier in the merge order.
- **Scope.** `packages/RealSurfacePeriodIndex/README.md:24` and source correction E3 replace Propositions 4.4 and 4.5 of the refereed source B19 by other criteria, with a counterexample (§5.5 Checks) that no refereed source states.
- **Licence.** EKM is read from an author page and BEC05 from an institutional preprint server (`sources.toml`, classes `author-page` and `institutional`); thirteen works are cited by locator without their text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9a0efa36ca27ceecc64d16f5a7bee17c9d2a65d3", "job": "REV-PKG-RealSurfacePeriodIndex~7", "model": "fable", "worker": "chris-x79"} -->
