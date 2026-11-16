<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6911151106 -->
Review (claude) of bfb759c

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the proof of §2.8 follows the source's proof clause by clause

   **Location.** `packages/RealSurfacePeriodIndex/README.md:950–951` (§2.8, steps 1–2): "Apply §2.7 with two consecutive large integers d, d + 1: there are smooth T ∈ |dnH| and T′ ∈ |(d+1)nH| on which α vanishes. Their function fields are splitting fields of α of degrees dn and (d+1)n over ℂ(S) …"

   **Claim.** The proof plan is in the roadmap's own words.

   **Witness.** B19 lines 244–247 (proof of Theorem 1.1, p. 69): the same three clauses in the same order with words exchanged ("big enough" → "large", "We obtain two" → "there are"); 11 consecutive tokens shared, from "T ∈ |dnH|" to "α vanishes".

   **Exact repair.** Replace steps 1 and 2 of §2.8 (step 3, the locator and the *Needs:* line stay) by:

   1. Let n = per(α). For every sufficiently large d, §2.7 gives a point b of B_d(ℂ) with p_b*α = 0 in Br(T_b). The surface T_b is a smooth ample divisor of the connected threefold ℙ¹ × S, so it is connected, hence integral, and its function field is an extension of ℂ(S) of degree dn (§2.1). This field splits α, because the restriction of α to it factors through Br(T_b).
   2. The index divides the degree of every finite splitting field (§0.12). So ind(α) divides dn for every large d, and using d and d + 1 it divides gcd(dn, (d + 1)n) = n.

   **Repair test.** S a complex Enriques surface and α the nonzero class (n = 2, the section's Check): the degrees are 2d and 2d + 2, gcd 2, so ind(α) | 2, and per(α) = 2 | ind(α) gives 2. α = 0 (n = 1): degrees d and d + 1, gcd 1, index 1. The longest run the new text shares with B19 lines 240–247 is the formula "ind(α)".

2. **F02** (P3) §0.10 cites no source for the direction of Springer's theorem that the roadmap uses

   **Location.** `README.md:409` (§0.10): "anisotropic over K iff both residue forms … are anisotropic over k. … (EKM, Lemma 19.4, Lemma 19.10 and Exercise 19.15, pp. 80–82 …)".

   **Claim.** The cited results give the equivalence.

   **Witness.** EKM line 4161 (Lemma 19.4, p. 80) is "anisotropic over the complete ring ⇒ residue anisotropic"; lines 4209 and 4311 are the residue maps on Witt groups. The converse, used in §§0.7, 1.5 and 7.9, is Lemma 19.5, EKM lines 4169–4170, p. 80.

   **Exact repair.** In the locator of §0.10 replace "EKM, Lemma 19.4, Lemma 19.10 and Exercise 19.15, pp. 80–82" by "EKM, Lemma 19.4 (an isotropic residue form makes q isotropic, R complete) and Lemma 19.5 (anisotropic residue forms make q anisotropic, any discrete valuation ring), p. 80; Lemma 19.10 and Exercise 19.15, pp. 81–82, for the Witt-ring form". Add "19.5" to the EKM locator of `sources.toml` ("Lemmas 19.4, 19.5, 19.10").

   **Repair test.** ⟨1, y₁, −y₂, −y₁y₂⟩ over ℂ((y₁))((y₂)) (§7.9): residue forms ⟨1, y₁⟩ and ⟨−1, −y₁⟩ at y₂, each with residue forms ⟨±1⟩ and ⟨±1⟩ over ℂ, all anisotropic; Lemma 19.5 applied twice gives anisotropy, and Lemma 19.4 is not used. Negative control of the section: ⟨1, −1⟩ ⊥ t⟨1⟩ over ℝ((t)) has the isotropic residue form ⟨1, −1⟩, and Lemma 19.4 gives the zero (1, 1, 0).

3. **F03** (P3) finite generation is not needed in §7.11 and §7.13

   **Location.** `README.md:2090` (§7.11): "Let K be a field finitely generated of transcendence degree 2 over ℝ in which −1 is a sum of squares"; `README.md:2127` (§7.13), the same with degree 1; `Suggested.lean:141–145` and `154–158`, the binder `[Algebra.EssFiniteType ℝ K]`.

   **Claim.** The hypothesis is needed by the statement or its route.

   **Witness.** K an algebraic closure of ℝ(x, y): transcendence degree 2, −1 a square, not finitely generated; every form of dimension ≥ 2 is isotropic. In general §7.11 step 2 uses only §7.8 (`README.md:2027`: "not necessarily finitely generated") and §0.6.

   **Exact repair.**

   - §7.11: replace "Let K be a field finitely generated of transcendence degree 2 over ℝ in which −1 is a sum of squares; for instance K = ℝ(S) …" by "Let K be a field of transcendence degree 2 over ℝ, not necessarily finitely generated, in which −1 is a sum of squares; for instance K = ℝ(S) …". In the standing line replace "S(ℝ) = ∅, so ℝ(S) is nonreal" by "K nonreal; for K = ℝ(S) with S(ℝ) = ∅, ℝ(S) is nonreal".
   - §7.13: replace "Let K be a field finitely generated of transcendence degree 1 over ℝ" by "Let K be a field of transcendence degree 1 over ℝ, not necessarily finitely generated,"; in step 2 replace "K(t) is finitely generated of transcendence degree 2 over ℝ and nonreal" by "K(t) has transcendence degree 2 over ℝ and is nonreal".
   - `Suggested.lean`: delete `[Algebra.EssFiniteType ℝ K]` from `not_anisotropic_of_not_isSemireal` and from `exists_common_zero_of_not_isSemireal`; in their docstrings replace "(finitely generated of transcendence degree `2` over `ℝ`, with `-1` a sum of squares)" by "(more generally any field of transcendence degree `2` over `ℝ` in which `-1` is a sum of squares)", and the same with `1`.
   - Add to the Checks of §7.11: "Finite generation is not used: over an algebraic closure of ℝ(x, y), which has transcendence degree 2 and is not finitely generated, every form of dimension ≥ 2 is isotropic, as §7.8 gives for every nonreal field of transcendence degree 2."

   **Repair test.** The two signatures without the binder elaborate in a scratch file (`sorry` the only warning). On the witness field both conclusions hold. On ℝ(x, y, z | x² + y² + z² = −1), finitely generated, the statements are the present ones. For §7.13 on an algebraic closure of ℝ(x): K(t) has transcendence degree 2 and is nonreal, q₁ + tq₂ is isotropic by §7.11, and Amer–Brumer (§0.11, any field) gives the common zero. The statements of Theorems 0.3 and 0.4 keep finite generation: their route (§§7.4, 7.6) uses a projective model.

Three findings: one P2 (a proof plan that follows B19 clause by clause, the pattern repaired in rounds 9 and 10) and two P3 (a missing locator, a hypothesis the statement does not need). The four round-10 findings are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, no statement is padding, the dependency check is clean, and the three declared supplier gaps are still valid contracts. No package file was changed by this review; `sources.toml` gained no entry.

## Verified sound

### Round-10 findings

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01 (P2), §§6.3, 9.12 | README:1632 "Assumption 6.1 is an open condition on the map: an embedding ι : 𝒮 → Ξ satisfying it has a neighbourhood in C^∞(𝒮, Ξ) … consisting of embeddings that satisfy it as well"; README:2610 "The real locus S(K) is the disjoint union of four semialgebraic 2-spheres, one for each pair of signs taken by the functions u/w and v/w …" | **Repaired.** Against B19 lines 1123–1124 the longest shared run is the name "in C^∞(𝒮, Ξ) for the strong"; against lines 1811–1813 the formula "u/w and v/w". S², one circle, perturbed: still an embedding (𝒮 compact), two discs, class 0 = cl_R(R). Chart w = 1: (1 − u² − v²)u²v² ≥ t > 0 in four quadrant regions, each a disc, double cover a sphere, H¹ = 0. The same pattern elsewhere: R01. |
| F02 (P3), Tau Ceti contract | README:71–72, two new "From Tau Ceti" bullets; README:21, 22, 130; *Needs:* of §§0.3, 0.8, 2.10, 9.11; Dependencies of Layers 0, 2, 9 | **Repaired.** Opened at the pin: `FieldTheory/RealClosure/QuadraticExtension.lean:63` (`[IsRealClosed R] [Algebra.IsQuadraticExtension R K] : IsAlgClosed K`) and `:144` (`(hR : ¬IsSquare (-1 : R)) {i : K} (hi : i ^ 2 = -1) [IsAlgClosed R⟮i⟯] : IsRealClosed R`); `RingTheory/LaurentSeries/Puiseux/Basic.lean:70` (`IntermediateField K (HahnSeries ℚ K)`, any field); `Puiseux/AlgClosure.lean:63` (under `[IsAlgClosed K] [CharZero K]`, namespace `TauCeti.puiseuxField`); `RingTheory/LaurentSeries/Ramified.lean:418` (namespace `LaurentSeries`); Mathlib `LinearAlgebra/Dimension/StrongRankCondition.lean:666`. R = ℝ: ℂ quadratic and algebraically closed; −1 has negative leading coefficient in the Puiseux field of ℝ, so it is not a square. |
| F03 (P3), §0.6 | README:300, 302 "char F ≠ 2 (a field of positive characteristic has no orderings …)"; new Check at README:331 | **Repaired.** 𝔽₃: squares {0, 1}, ⟨1, 1⟩ anisotropic, ternary forms isotropic, u = 2; u(𝔽₉) = 2 ≤ 4 and 2 ∈ {0, 1, 2, 4, 6}. BEC05 line 66 fixes characteristic ≠ 2. |
| F04 (P3), §1.5 step 2 | README:665 "a finite étale V-scheme W of degree d whose base change along Spec K → Spec A is an integral finite étale cover of the dense open `V_K` … with function field L, and an Azumaya algebra on V, pulled back from one representing α on a dense open of X" | **Repaired**, in the fixer's form, which is what step 3 needs. ℚ̄ ⊂ ℂ, (x, y): W = Spec ℚ̄[x, y, z, (xy)⁻¹]/(z² − x), function field ℚ̄(x, y)(√x), base change with function field ℂ(x, y)(√x); x is a square on W, so (x, y) splits, d = 2. |

### Adversarial table (sampled targets, headlines, targets of findings and of repairs)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.6 u-invariant | ℝ, ℂ, ℝ(t), 𝔽₃; odd dimension over a real field | 0, 1, 2, 2; EKM line 8825 defines u by the same isotropy condition on locally hyperbolic forms, even-dimensional over real fields | sound |
| `HasZeroTotalSignature` | ⟨1, −1⟩, ⟨1, 1⟩, ⟨1, 1, −1⟩ over ℝ; ⟨1, 0⟩; nonreal K | line x = y; no isotropic line; 2·dim W = 3 impossible; holds on the radical, and a radical vector is a zero; no K-algebra R exists (−1 a sum of squares in R) | sound |
| §0.10 Springer | r = 0 or s = 0; ⟨1, t⟩, ⟨1, 1⟩ over ℂ((t)); ⟨1, −1⟩ ⊥ t⟨1⟩ over ℝ((t)); ⟨1, y₁, −y₂, −y₁y₂⟩ | empty form anisotropic; residues ⟨1⟩, ⟨1⟩ anisotropic; ⟨1, 1⟩ isotropic over ℂ; zero (1, 1, 0); residues ⟨1, y₁⟩, ⟨−1, −y₁⟩ then ⟨±1⟩ | sound; R02 on the locator |
| §0.14 | √−1 ∈ F; F real closed; 𝔽₃; ℝ(x, y) | u(F) = u(F(√−1)) ∈ {1, 2, 4}, I³F = 0 (8-dimensional Pfister forms isotropic); u = 0, I² torsion-free (EKM Proposition 37.7, lines 9252–9270); 2; ≤ 6 | sound |
| §0.5, §0.9, §0.11, §0.13, §0.15 | trace forms; (−1, t), (−1, 1 + t²); ⟨1, 1⟩ and ⟨1, −1⟩; a = b = c = d = −1 | signatures d and −d (ℍ: ⟨2, −2, −2, −2⟩); nonzero where t < 0, zero since 1 + t² is a norm; t² − 1 not a square in ℝ(t); ⟨−1, −1, −1, 1, 1, 1⟩ isotropic, M₄(ℝ) | sound |
| §1.5 (repaired step) | k = K; ℚ̄ ⊂ ℂ with (x, y); ℝ ⊂ ℂ | empty; ind = per = 2 on both sides; 2 against 1 | sound |
| §1.7, §1.8 | (s, st) for l = 2; s_t/s₁^l at a crossing | (s, t) = (s, st) + (s, −1); c·ss′·(ss′)^(−l), so (s, s′) = (s, s_t/s₁^l) + (s, −c⁻¹) | sound |
| §2.1, §2.4 | H²·K_X; p_*p* | (2hA + A²)(−2h + K_S) = 2(A·K_S − A²), ℙ²: −8; dn·α̃ = 0 mod n | sound |
| §2.8 | Enriques, n = 2; α = 0 | gcd(2d, 2d + 2) = 2; gcd(d, d + 1) = 1 | sound; R01 on the wording |
| §2.10, `index_dvd_two_mul_orderOf_of_isRealClosed` | √−1 ∈ F; n odd; Albert's class over ℝ(x, y) | ind = per; ind ∈ {n, 2n} with the same primes gives n; 4 = 2·2 | sound |
| `index_eq_orderOf_of_isAlgClosed` | 0 and (x, y) over ℂ(x, y) | 1 = 1; 2 = 2 | sound |
| §3.1 | R = D = ∅, b = 1; 𝔸², r = x, s = y; twists | S ⊔ S; z² = xy, A₁; r ∈ O(R), s ∈ L²(R), rs ∈ (L(R))²; discriminant 4b | sound |
| §4.6 | twists; H⁰(K_S) = 0; ψ | ω = p̄*(K_S ⊗ L(R)) (Proj Sym convention, det(O ⊕ L) = L); K_S ⊗ L(R)(−C) = K_S ⊗ N; ψ onto from H¹(L) = H¹(R, N|_R) = 0; agrees with B19 lines 995–1018 | sound |
| §4.7 | C = ∅; quartic with a line | both 0; H⁰(O(1)²) = 4 → H⁰(O(4)) = 5 → H¹(O(−2)) = 1 → H¹(O(1)²) = 0, then H¹(C, O(−2)) → H²(O_T) onto since H²(O_T(C)) = H⁰(O_T(−C))* = 0 | sound |
| §4.9 | twists of N ⊗ K and N⁻¹ ⊗ K(R′) | μ*(A₀K_S)(3F − E) and μ*(A₀⁻¹K_S(R))(3E − F); cl_R(N) = 2(…) = 0 for A₀ a square | sound |
| §5.3 | T(ℝ) = ∅; a point of T(ℝ) over R | only the norm step; evaluation is locally constant and p⁻¹(R)(ℝ) has empty interior, so it is 0; forgetting G, N(c) ↦ 2c in H⁴(T(ℂ), ℤ) = ℤ and a torsion class ↦ 0, so c = 0 | sound; B19 lines 708–745 |
| §5.4, §5.5 | B19's formula; the Enriques example | (a, b, c) ↦ (0, b + a ∪ [e]₁, …) at B19 lines 866–868, so [ζ]₁ = a₀ ∪ [e]₁ for b = 0; minors of B: 1, 3, 2, 2, 8, 6, 1, 5, 6, det 2; X(ℝ) = ({±}³ × S²)/± = 4 spheres, ι antipodal on each; no point with conj(P) = ι(P) (x_j² = −(By′²)_j < 0); deg(w₁ ∪ (h₁ + h₂)) = 1 + 1 = 0; c_Ψ = (1, 1, 0, 0)·(h₁ + h₃) = h₁, coefficient sum 1, not in w₁^⊥; (i)–(iii) hold with T(ℝ) = ∅ and kernel 0 | sound |
| §6.10 | ℙ¹ × ℙ¹ → ℙ² | p*h = (1, 1), p_*(a, b) = a + b, vanishing lattice ℤ(1, −1), determinants 1 and −2 | sound |
| §6.11 | R = ∅; R smooth, R ∩ D_x = ∅; a node of R; a point of R ∩ D_x | P = ∅; P = R̃ × Λ; xy = s u²: {r = w = 0} is two branches through the double point, separated by the blow-up, p⁻¹(node) the exceptional conic; r = s_x u² with p⁻¹(R) = {s_x u = 0} | sound; the control data are the declared gap |
| §7.9 | w′ and y_j; E10 | w′ ↦ (−2)/(2i) = i; w′² + 1 = (w² + 1)²/(4w²); y_j ≡ 2(1 + i)z_j mod m²; with w, dy_j = a + c·dz_j, c = 2(1 + i), determinant c(λ + μ + c) for a = λdz₁ + μdz₂, zero when λ + μ = −c | sound |
| `not_anisotropic_of_hasZeroTotalSignature`, `exists_anisotropic_hasZeroTotalSignature` | dimension 5 over a real K; nonreal K; §7.9 at (x² + 1, y) | predicate false; predicate always true, the classical bound; signature 1 + 1 − 1 − 1 | sound |
| `index_eq_orderOf_of_not_isSemireal`, `index_eq_orderOf_of_forall_isRealClosed` | Albert's class over ℝ(x, y); ℍ over ℝ(x, y); nonreal K | 4 ≠ 2, excluded by nonreality; survives at every ordering, excluded; hypothesis empty, the statement is Theorem 0.3 | sound |
| `not_anisotropic_of_not_isSemireal`, `exists_common_zero_of_not_isSemireal` | ℝ(x, y, z : x² + y² + z² = −1); an algebraic closure of ℝ(x, y); ⟨1, 1⟩, ⟨1, −1⟩ over ℝ | (1, x, y, z, 0) is a zero of ⟨1, 1, 1, 1, a⟩; holds without finite generation; no common zero | sound; R03 |
| §7.12 | d = 4; d = 3 | 5 and 13 against 15; 10 = 10 | sound |
| §8.6 | no crossing; n = 2; m_i = 2 and 4 | ε̃ = ε̂; Θ₀ avoids Δ(ℝ) (m_i = 1 odd); discrepancy m_i/2 mod 2 = 1 and 0; B19 lines 1544–1617 | sound |
| Layer 8 Examples | n = 4, ζ = [(1, 0, 0, 0)] | ψ = Tr − n: (−3, 1, 1, 1); α̃ = −1 = 3; (3, −1, −1, −1) ≡ (3, 3, 3, 3) mod 4 | sound |
| §9.2, §9.5 | a real point; S(ℝ) ≠ ∅ | δ restricted to x vanishes iff the fibre of the cover is split, so [δ]₀ is the indicator of the complement of the half; four classes, two lifts differing by the constant class | sound |
| §9.4 | period 4 | α_ℂ ≠ 0 (else 2α = cor(res α) = 0), index 2; ind(α) | 2·2 and 4 | ind(α) | sound; MVH98 lines 135–142 give period 4 exactly for orientable real locus with both halves nonempty |
| §9.8 | ℝℙ² ⊔ ℝℙ²; one ℝℙ²; two Klein bottles; independent check | 1 + 1 = 0; 1; 0; χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2, so the number of components of odd Euler characteristic is even | sound, and E25 with it |
| §9.9 | the correcting component Σ | deg(a ∪ w₁) = 1 + χ(Σ) = 0; Σ exists outside Θ: odd count inside, even total | sound |
| §9.11 (repaired) | X² − t, −t, n·t; the alternative route | ±t^{1/2}; leading coefficient −1; t − r has leading coefficient −r; −1 not a square in the ordered K, K(i) the whole algebraically closed Puiseux field of R(√−1) | sound |

The whole README was read this round.

### Sources: the seeded sample

The author flagged no locator as unverified. B19 file page N is printed page 62 + N; EKM printed page is file page − 8.

| Target | Locator read | Outcome |
|---|---|---|
| 0.6 | B19 lines 128–131 (§0.5, p. 66); EKM lines 8818–8830 (§36, p. 161); BEC05 lines 88–91 (§2, p. 3) | supported |
| 0.10 | EKM lines 4116–4120 (§19, p. 79), 4161–4170 (Lemmas 19.4, 19.5, p. 80), 4209 (Lemma 19.10, p. 81), 4311–4316 (Exercise 19.15, p. 82); B19 lines 1327–1329 (p. 96) | supported; Lemma 19.5 not cited (R02); SPR55 not read |
| 0.14 | BEC05 lines 110–112 (§3, p. 3), 26–28 (§1, p. 1); EKM lines 8879 (Corollary 36.4, p. 162), 9122–9128 (Theorem 37.4, p. 167), 9241–9244 (Corollary 37.5, p. 168), 9252–9270 (Proposition 37.7, pp. 168–169) | supported; BEC05 states the case = 4, the case < 4 is the README's own, from the EKM results cited; EL73 not read |
| 2.8 | B19 lines 234–247 (Theorem 1.1, p. 69) | supported; wording R01 |
| 2.10 | B19 lines 36–39 (§0.2, p. 63), 1291–1292 (p. 95), 1676–1677 (p. 104), 101–102 (p. 65), 1816 and 1833 (§8.2, pp. 107–108, where the bound is used without being stated) | supported |
| 3.1 | B19 lines 537–556 (§3.1, pp. 76–77), 1001–1004 ((5.5), p. 87) | supported as corrected (E1) |
| 4.6 | B19 lines 976–1018 (Lemma 5.3, pp. 87–88) | supported |
| 4.7 | BEN18 lines 232–300 (Proposition 2.1, pp. 6–7); B19 lines 1021–1030 (p. 88) | supported as corrected (E12); SER06 not read |
| 5.3 | B19 lines 708–745 (Proposition 4.3, pp. 80–81) | supported |
| 5.5 | B19 lines 748–879 (Proposition 4.4, pp. 81–84; (4.8) at 856–870) | supported as corrected (E3) |
| 6.11 | B19 lines 537–556 (pp. 76–77), 1235–1283 (pp. 94–95) | the setting is the source's; the stratification is the README's own |
| 8.6 | B19 lines 1541–1617 (Lemma 7.6, pp. 101–102) | supported |
| 9.2 | B19 lines 72–74 (p. 64), 1763–1770 (p. 106) | supported; DK96 cited through B19 |
| 9.4 | B19 lines 1749–1753 (p. 106); MVH98 lines 135–142 (Theorem 1.3, p. 3) | supported |
| 9.8 | MVH98 lines 500–540 (Proposition 4.2, Theorem 4.4, p. 12); B19 lines 77–80 (p. 65), 1784–1790 (p. 107) | supported |

All 23 cited works have a manifest key, and every key occurs in the body.

### Lean

`lake env lean` on `packages/RealSurfacePeriodIndex/Suggested.lean` from the content checkout: exit 0, eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else.

Padding probe on a scratch copy, all eight theorems: `fail_if_success (first | (simp; done) | rfl | infer_instance | decide | (aesop; done) | (simp_all; done) | omega | trivial | (exact?; done) | (intros; simp_all; done) | (intros; exact?; done) | (intro h; exact h) | (constructor <;> simp_all; done))` before each `sorry`: exit 0 and no error, so none of these closes any goal. `#check @name` for the nine declarations in the same file: every binder of the README statements is present (`[Invertible 2]`, `[FiniteDimensional K V]`, `[Algebra.EssFiniteType ℝ K]`, `Algebra.trdeg … = 2` or `= 1`); nothing was lost. The two binders R03 removes are present and unneeded.

Headlines of the Summary: de Jong's theorem and the norm bound, Theorems 0.3, 0.4 (birational form), 0.10, 0.12 (two statements) and the pair-of-quadrics form of 0.13 are stated; the scheme form of 0.4, Theorems 0.5 and 0.6, Proposition 0.7 and the del Pezzo form of 0.13 are named in the docstring with the missing carriers. The README's own backticked names are exactly the nine declarations. No `set_option`, no sorry'd data, no `lemma`, no example. The three `TauCeti.*` imports are each used (`index`, `mk`, `baseChange`).

### Pinned declarations

69 name-and-line locators of the two contracts compared mechanically with the pinned files (35 Mathlib, 34 Tau Ceti): each cited line carries the cited name. Opened by hand besides those of F02: `Algebra/Order/Group/Cone.lean:63` (`LinearOrder.ofSubmonoid` with `to_additive`), `AlgebraicGeometry/Scheme/Regular/Scheme.lean:118` (`isRegular_Spec`), `AlgebraicGeometry/FunctionField.lean:37`, `GroupTheory/Perm/Sign.lean:358`, `RingTheory/Henselian.lean:95`, `LinearAlgebra/CliffordAlgebra/Even.lean:53`, `RingTheory/MvPolynomial/Homogeneous.lean:46`. Searched and absent at the pins: an `IsRealClosed` statement for the Puiseux field, a u-invariant, a space of orderings with the Harrison topology, a C_i predicate, the Amer–Brumer theorem.

### Suppliers, direction and ownership

Dependency check, whole output:

    depcheck: 254 roadmaps, 2410 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The overlap file lists no dropped id, no revision-only id, no conflicting head and no second copy.

Resolved at the current heads, by heading or name: MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10 (lines 161, 1422, 1435, 1464, 1500; its §7.10 states H¹_alg = w₁^⊥ and cl_R(K_X) = w₁ as targets); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3, 15.1, 15.6, 16.1–16.4; ComplexComparisonPartII C5.2, C5.3, C6.2, C6.3 with the eight names; HeightsRationalPointsAndObstructions §§2.16b, 2.19a with the five names; EnriquesSurfaces §§1.1, 1.3, 1.4; WeilConjectures WC.7 (the Enriques condition, at its line 1849); ShimuraData §3.1; PurityForFlatCohomology §8.4; LefschetzPencilsAndVanishingCycles §0.10; PurityOfBranchLocus §2.3; AffineMorseLefschetz A3, A5; FormalLaurentPuiseux L4, L5 and its names in `TauCetiRoadmap/FormalLaurentPuiseux/Suggested.lean`; StableReduction Layer 4; ModularCurves Layer 4D; ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8; AlgebraicModuliForArithmeticGeometry §§1.1, 1.4 and `amplePowersAndFixedTwists`; QuadraticFormInvariants Layers 0, 1, 2, 4, 5; RealAlgebraicGeometry Layer 1; AlgebraicTopology Stage 6; SchemeAndStackFoundations §2.16.

The three gaps have the same slugs in the README and in `design/plan.json`, each with a named supplier and section and one sentence with its hypotheses, and none is provided today: MotivesAndAlgebraicCycles §7.8 (line 1464) uses "the torsion-free divisor cokernel" inside a proof without stating it; AlgebraicTopologyPartII §16.2 (line 1676) still takes invariant control data as a hypothesis ("an application to a particular divisor family supplies them"); ComplexComparisonPartII has no comparison over ℝ.

Duplication by object, searched on main and at the open heads: Harrison topology and spaces of orderings, the Elman–Lam u-invariant, Albert forms, Amer–Brumer, period and index of a Brauer class, real Enriques surfaces: no other owner (the hits for "Harrison" and "u-invariant" on main are other notions). The Tsen–Lang theory is stated here (§0.7) and in QuadraticFormInvariantsPartII §§5.1–5.6 (line 391 of the merge order against 229 here; its README lines 119 and 2030 say this roadmap takes §5.6 from there). The round-4 repair report marked this not actionable in this package; the reason holds (the later roadmap is the one to cite the earlier) and it is not re-raised. SchemeAndStackFoundations §2.16 proves C₁ for function fields of curves only; §0.7 cites it as a Check.

Overlap check: read QuadraticFormInvariantsPartII, LogicAndDefinabilityInNumberTheoryPartII, AlgebraicTopologyPartII, MotivesAndAlgebraicCycles, QuadraticFormInvariants (open); QuadraticFormInvariants, RealAlgebraicGeometry, SchemeAndStackFoundations (main); the Tsen–Lang theory is shared with QuadraticFormInvariantsPartII and its owner is this roadmap (§0.7), the earlier one; nothing else shared.

### Shape, policy and source independence

Every numbered section has a *Needs:* line, Checks and a locator; every section with an API list has at least three Checks; every layer ends with Examples and Dependencies. No LaTeX delimiter, pull-request number, path, round label, HTML anchor or process word. No algorithm. The header of `Suggested.lean` is the `module` form with `public import`, as 101 of the 242 `Suggested.lean` files on main have it.

Arrangement against B19 (134 of 271 occurrences of a source key), by number: Layer 1 ↔ §2 in part, Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8. Layer 0 has no counterpart, Layers 1 and 2 and Layers 4 and 5 reverse the source, §6 is split, and Layer 1 adds de Jong's reduction from CT05. Layer 3 before 4 and 5 (§§4.1, 5.1 need §3.2), Layer 6 after both, Layer 7 after 6 and Layer 9 after 7 and 8 (§§9.6, 9.7 need §§7.7, 8.10) are forced by the *Needs:* lines. Not a one-to-one run.

Wording: a mechanical sweep of the README against the cached texts of B19, EKM, BEC05, BEN18, BW20, BW20II, MVH98, VOI06 and VA13 for shared runs of seven words or more; its hits are stock openings, exact sequences and statements of results (the longest, 19 words with formula letters, is the statement of Lemma 6.4 in §6.7, which round 10 examined). Then 21 passages set by hand beside B19, EKM, BEC05, BEN18 and MVH98 at the locators above: §§0.6, 0.10, 0.14, 2.8, 2.10, 3.1, 4.5, 4.6, 4.7, 5.3, 5.4, 6.2, 6.3, 7.5, 7.9, 8.6, 9.2, 9.4, 9.9, 9.12, 9.13 and the docstring of Theorem 0.3. One follows B19 (R01). CT05 is in French and was not swept.

Source independence: 21 passages compared with 5 sources, one shared (R01); largest share B19, 134 of 271 locators; contents compared with B19: independent.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00 are settled uncertified; their texts were not read. §§6.5, 6.6, 9.13 and the sign statement of §9.12 rest on them through B19.
- That τ ≠ 0 in the Enriques example of §5.5 rests on AlgebraicTopologyPartII §16.4 and on the criterion of the section; the inputs of the example were recomputed, the comparison of that supplier was not reproved.
- CT05, VOI06, VA13, BW20 and BW20II were not reopened this round beyond the wording sweep; §§1.6–1.8, 2.5 and 7.12 rest on the round-10 table.

## Source issues

Only what was confirmed against the text in this round.

- **Gap** in B19 at proof of Proposition 4.4, printed p. 84, after (4.8): the source says the degree-one boundary component on the avoided set is the cover class; its own formula gives that class times the evaluation of the Brauer class; affects a stated result.
- **Error** in B19 at Theorem 0.6 (ii) and its proof, printed pp. 65 and 107: the source says one nonempty half with an odd number of components of odd Euler characteristic gives index 4; it should say this case never occurs, the Euler characteristic of the real locus being even; affects the proof.
- **Error** in B19 at §3.1, printed p. 76: the source says the incidence surface is a finite double cover of S; it should say generically of degree two, the fibres over the crossings of R and D being projective lines; affects nothing.
- **Misprint** in B19 at §3.1, printed p. 77: the source says the singular points are those over the singular locus of R where v vanishes; it should be where w vanishes; affects nothing.
- **Misprint** in B19 at (5.7), printed p. 88: the source says the boundary of the normal sequence lands in degree-zero cohomology of the normal bundle of C in T; it should be degree one; affects nothing.
- **Misprint** in B19 at (7.13), printed p. 103: the source says the pulled-back lift is the pullback of η plus ψ(ζ); it should be minus, as its map (1, −φ) requires; affects nothing.
- **Gap** in B19 at proof of Theorem 0.12, printed p. 95: the source says K is the union of the finite extensions of a finitely generated subfield carrying the class; it should first add a transcendence basis to that subfield; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, lower bound, printed p. 96: the source says two non-proportionality conditions make the two functions local parameters; it should exclude the case where their differentials become dependent, for instance by changing the lift of √−1; affects the proof.
- **Misprint** in B19 at proof of Proposition 0.7, printed p. 107: the source says the quaternion class lies in the Brauer group of the function field over the reals; it should be over the Puiseux field; affects nothing.
- **Misprint** in B19 at proof of Theorem 0.6, printed p. 107: the source says the class with zero degree-zero component is unique; it should say the unique nonzero such class; affects nothing.

## For the human reviewers

- **Ownership.** QuadraticFormInvariantsPartII (open; its README lines 119 and 2030, §§5.1–5.6) and this package (§0.7, `README.md:24`) each state the Tsen–Lang theory and each names the other as consumer; this package is earlier in the merge order (line 229 against 391).
- **Scope.** `packages/RealSurfacePeriodIndex/README.md:24` and source corrections E3 and E25 replace Propositions 4.4 and 4.5 of the refereed source B19 by other criteria and call Theorem 0.6 (ii) vacuous; no refereed source states these corrections.
- **Licence.** EKM is read from an author page, BEC05 and VA13 from institutional hosts (`sources.toml`, classes `author-page` and `institutional`); thirteen works are cited by locator without their text.
- **Supplier outside the merge order.** EnriquesSurfaces §§1.1, 1.3, 1.4 is consumed from an open pull request that adds the roadmap; `merge-order/ORDER.txt` lists EnriquesSurfacesAndIntegralNonexistence (line 325) but not EnriquesSurfaces.
- **Import header.** `packages/RealSurfacePeriodIndex/Suggested.lean:1–6` uses `module` with `public import Mathlib` and `@[expose] public section`; the brief's form names the single line `import Mathlib`, and main has both forms.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bfb759cae3c38d8ee4e42c29acad0453a63aac6d", "job": "REV-PKG-RealSurfacePeriodIndex~11", "model": "fable", "worker": "chris-x89"} -->
