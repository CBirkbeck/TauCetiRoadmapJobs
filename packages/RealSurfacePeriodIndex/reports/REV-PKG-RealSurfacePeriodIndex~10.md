<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6908114636 -->
Review (claude) of dc9e153

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) two statements reproduce the wording of B19

   **Location.** `packages/RealSurfacePeriodIndex/README.md:1628` (§6.3, statement): "If ι : 𝒮 → Ξ satisfies Assumption 6.1, so does every ι′ close enough to ι in C^∞(𝒮, Ξ) for the strong C^∞ topology." `README.md:2606` (§9.12, statement): "S(K) has four semialgebraically connected components, distinguished by the signs of u/w and v/w, each semialgebraically homeomorphic to a sphere, so H¹(S(K), 𝔽₂) = 0".

   **Claim.** The statements are in the roadmap's own words.

   **Witness.** B19 lines 1123–1124 (Lemma 6.2): the §6.3 sentence is the source's with two words changed; 11 consecutive tokens shared after "ι′". B19 lines 1811–1813: the §9.12 sentence follows the source's four clauses in order with synonyms exchanged; 7 consecutive tokens shared ("by the signs of u/w and v/w").

   **Exact repair.**

   - §6.3, replace the statement sentence (keeping the locator) by: "Assumption 6.1 is an open condition on the embedding: each ι : 𝒮 → Ξ that satisfies it has a neighbourhood in C^∞(𝒮, Ξ), in the strong (Whitney) C^∞ topology, all of whose members are embeddings satisfying it as well. (B19, Lemma 6.2, p. 91)"
   - §9.12, replace the sentence "S(K) has four … (semialgebraic cohomology)." by: "The real locus S(K) is a disjoint union of four semialgebraic spheres, one for each choice of signs of the two functions u/w and v/w; these spheres are its semialgebraically connected components, and therefore H¹(S(K), 𝔽₂) = 0 in semialgebraic cohomology."

   **Repair test.** §6.3 on Ξ = S², R(ℝ) = ∅, ι one circle (the §6.2 Check): maps near ι in the strong topology are embeddings (𝒮 compact), each still bounds two discs, class 0 = cl_R(R): (i)–(iv) persist. §9.12 in the chart w = 1: z² = (1 − u² − v²)u²v² − t needs (1 − u² − v²)u²v² ≥ t > 0, four regions, one per sign quadrant of (u, v), each a disc whose double cover is a sphere; at infinity the two points [1 : 0 : 0], [0 : 1 : 0] are A₅ points z² + v² + t w⁶ = 0 whose resolution has no real point (last exceptional conic z² + v² + t = 0). Both new texts agree with the API bullets and Checks of their sections; the longest run shared with B19 is "for the strong" (§6.3) and the formula "u/w and v/w" (§9.12).

2. **F02** (P3) inputs the pinned Tau Ceti proves are cited as roadmap sections, and missing from four *Needs:* lines

   **Location.** `README.md:21` ("RealAlgebraicGeometry Layer 1, which also supplies the algebraic closedness of R(√−1)"), `README.md:22` and `README.md:128` ("FormalLaurentPuiseux L4 (`puiseuxField K`, `ramifiedEmbedding` …) and L5 (… `puiseuxField_isAlgClosed`)"), `README.md:2600` (§9.11 *Needs:*); §0.3 step 3, §0.8 step 1 and §2.10 steps 1–2 use "R(√−1) is algebraically closed" with no *Needs:* entry.

   **Claim.** The supplier contracts name the library declarations consumed; each *Needs:* line lists what its route uses.

   **Witness.** At the pinned Tau Ceti: `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension` (FieldTheory/RealClosure/QuadraticExtension.lean:63), `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin` (same file, line 144), `TauCeti.puiseuxField` (RingTheory/LaurentSeries/Puiseux/Basic.lean:70), `TauCeti.puiseuxField.instIsAlgClosed` (Puiseux/AlgClosure.lean:63), `LaurentSeries.ramifiedEmbedding` (RingTheory/LaurentSeries/Ramified.lean:418).

   **Exact repair.**

   1. Add to "From Tau Ceti":
      - "Quadratic extensions of real closed fields: `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension` (FieldTheory/RealClosure/QuadraticExtension.lean:63: every quadratic extension of a real closed field is algebraically closed) and `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin` (same file, line 144: a field in which −1 is not a square is real closed when adjoining a square root of −1 gives an algebraically closed field)."
      - "The Puiseux field: `TauCeti.puiseuxField` (RingTheory/LaurentSeries/Puiseux/Basic.lean:70: the intermediate field of `HahnSeries` ℚ K over K of series whose exponents have a common denominator), `LaurentSeries.ramifiedEmbedding` (RingTheory/LaurentSeries/Ramified.lean:418: the level K((t^{1/n})) → `HahnSeries` ℚ K) and `TauCeti.puiseuxField.instIsAlgClosed` (RingTheory/LaurentSeries/Puiseux/AlgClosure.lean:63: for K algebraically closed of characteristic zero the Puiseux field is algebraically closed)."
   2. `README.md:21`: replace ", which also supplies the algebraic closedness of R(√−1) for real closed R" by "; the algebraic closedness of R(√−1) for real closed R is Tau Ceti's `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`". `README.md:22` and `README.md:128`: after the FormalLaurentPuiseux citations add "consumed in their Tau Ceti form `TauCeti.puiseuxField`, `LaurentSeries.ramifiedEmbedding` and `TauCeti.puiseuxField.instIsAlgClosed`", and in line 128 replace "adjoining √−1 to a real closed field gives an algebraically closed field; " by "adjoining √−1 to a real closed field gives an algebraically closed field, consumed as `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`; ".
   3. Add "Tau Ceti `TauCeti.RealClosure.isAlgClosed_of_isQuadraticExtension`" to the *Needs:* lines of §§0.3, 0.8, 2.10 and 9.11 and to the Dependencies of Layers 0, 2 and 9; add "Tau Ceti `TauCeti.puiseuxField`; Tau Ceti `TauCeti.puiseuxField.instIsAlgClosed`; Tau Ceti `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin`" to §9.11 *Needs:* and Layer 9 Dependencies.
   4. §9.11, end of step 3, add: "Alternatively, −1 is not a square in the ordered field K and K(√−1) is algebraically closed, so K is real closed by `TauCeti.RealClosure.isRealClosed_of_isAlgClosed_adjoin`."

   **Repair test.** R = ℝ: ℝ(√−1) = ℂ is a quadratic extension, algebraically closed; `TauCeti.puiseuxField` ℂ is algebraically closed; −1 has negative leading coefficient in K = `TauCeti.puiseuxField` ℝ, so it is not a square; K⟮√−1⟯ is all of the Puiseux field of ℂ (f = g + √−1·h at one level). Hence K is real closed, as the §9.11 Checks compute (X³ − t has exactly one root in K). The roadmap targets keep their names on main (`puiseuxField`, `ramifiedEmbedding`, `puiseuxField_isAlgClosed` in `TauCetiRoadmap/FormalLaurentPuiseux/Suggested.lean:45, 71, 250`), so no citation breaks.

3. **F03** (P3) the u-invariant is defined in characteristic 0 and used in characteristic ≠ 2

   **Location.** `README.md:298` and `README.md:300` (§0.6): "char F = 0. … For a field F of characteristic 0, u(F) ∈ ℕ ∪ {∞} is the supremum …"; `README.md:502` (§0.14): "Let F be a field of characteristic ≠ 2 with u(F(√−1)) ≤ 4. Then … u(F) ∈ {0, 1, 2, 4, 6}".

   **Claim.** §0.14 is a statement about the invariant §0.6 defines.

   **Witness.** F = 𝔽₃ satisfies the hypotheses of §0.14 (u(𝔽₉) = 2 ≤ 4), but §0.6 defines u only in characteristic 0, so u(𝔽₃) is undefined in the roadmap. BEC05 line 66 (§2, p. 2) fixes characteristic ≠ 2 for the definition.

   **Exact repair.** In §0.6 replace "char F = 0." by "char F ≠ 2 (in positive characteristic F is nonreal and the signature condition is empty)." and "For a field F of characteristic 0," by "For a field F of characteristic ≠ 2,". §0.4 already notes that 2 invertible suffices; nothing else changes.

   **Repair test.** 𝔽₃: X_F = ∅; ⟨1, 1⟩ is anisotropic (−1 is not a square) and every ternary form is isotropic (Chevalley–Warning), so u(𝔽₃) = 2 ∈ {0, 1, 2, 4, 6}; I³ = 0 is torsion-free. Characteristic 0 instances are unchanged: u(ℝ) = 0, u(ℂ) = 1, u(ℝ(t)) = 2.

4. **F04** (P3) §1.5 step 2 gives the spread-out cover the wrong function field

   **Location.** `README.md:662` (§1.5, step 2): "a finite étale V-scheme W of degree d with function field L, and an Azumaya algebra on V of class α whose pullback to W is split".

   **Claim.** W, a scheme of finite type over the finitely generated k-algebra A, has function field L.

   **Witness.** k = ℚ̄ ⊂ K = ℂ, X = 𝔸², α = (x, y), L = ℂ(x, y)(√x): A = ℚ̄, W = Spec ℚ̄[x, y, z, (xy)⁻¹]/(z² − x) has function field ℚ̄(x, y)(√x) ≠ L. L contains K; the function field of W is finitely generated over k.

   **Exact repair.** Replace the quoted clause by: "a finite étale V-scheme W of degree d whose base change along Spec K → Spec A is a finite étale cover of the dense open V ×_{Spec A} Spec K of X_K with function field L, and an Azumaya algebra on V whose class is the pullback of α and whose pullback to W is split".

   **Repair test.** On the instance above the base change of W to ℂ is Spec ℂ[x, y, z, (xy)⁻¹]/(z² − x), with function field L; step 3 then specialises at a = the point of Spec ℚ̄ and gives the splitting field ℚ̄(x, y)(√x) of degree 2 = d, so ind(α) ≤ 2 as the section's Check states.

Four findings: one P2 (two statements that reproduce the wording of B19, the pattern repaired in round 9) and three P3. The six round-9 findings are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, no statement is padding, and the dependency check is clean. No package file was changed by this review; `sources.toml` gained no entry.

## Verified sound

### Round-9 findings

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01 (P2), §1.1 | README:551 "Say that α … ramifies along a prime divisor Γ … the reduced divisor they form is called the ramification divisor … An open V ⊂ X satisfies α ∈ Br(V) … exactly when V meets none of the prime divisors along which α ramifies" | **Repaired.** (x, y) on 𝔸²: ramified along x = 0 and y = 0, U_α = {xy ≠ 0}; V = 𝔸² meets both, V = {xy ≠ 0} meets none; α ∈ Br(X) gives U_α = X. Longest run shared with B19 lines 506–513: 3 words. Same pattern found elsewhere: R01. |
| F02 (P3), §5.1 Check | README:1413 "Take instead α = (−1, x/z) … R = {x = 0} ∪ {z = 0} is SNC … Θ(α) = {x/z < 0} ≅ ℝ²" | **Repaired.** Valuations of x/z: +1 and −1, residue the class of −1 ≠ 0 in ℝ(t)ˣ/2; α at (u, v) = (−1, 0) is (−1, −1) ≠ 0, at (1, 0) is 0; ℝℙ² minus two lines is two discs; kernel of H¹(ℝℙ²) → H¹(Ψ) = 0 is 𝔽₂ = ⟨h⟩, and {x = 0}(ℝ) misses Ψ; cl_R(R) = 2h = 0. The Layer 5 Examples use the same α. |
| F03 (P3), locators | §0.10 "whose §19, p. 79, attributes these results to SPR55"; §0.14 "the list {0, 1, 2, 4, 6} … is EL73, as cited in BEC05, §1, p. 1" | **Repaired.** BEC05 line 28 gives the list for n = 2 with "cf. [5]". All 23 keys occur in the body; SPR55 and EL73 now appear only through the attributing sources. |
| F04 (P3), Mathlib contract | README:48 "`QuadraticAlgebra.finrank_eq_two` (same file, line 405 …) and `QuadraticAlgebra.discr_def` (Algebra/QuadraticAlgebra/Discriminant.lean:54 …)" | **Repaired.** Pin: Defs.lean:405 `theorem finrank_eq_two [StrongRankCondition R]`; Discriminant.lean:54 `discr a b = b ^ 2 + 4 * a`; for z² = b: 0 + 4b. The same pattern (a consumed pinned declaration absent from a contract) recurs for Tau Ceti: R02. |
| F05 (P3), §8.6 | README:2275 "ε̂ … the class of the double cover of 𝕊¹ obtained by pulling back along ι the complex points of the alternating double cover … ε̂ = ι*[ê]₁" | **Repaired**, in the fixer's form. H¹_G(Y) = H⁰(Y)·ω ⊕ H¹(Y) for trivial action; forgetting G is restriction to Y × pt, which kills ω: the constant class (1, 0) maps to 0 (the cover 𝕊¹ ⊔ 𝕊¹), (0, h) to h. Agrees with B19 lines 1541–1543 and with §8.8 step 2. |
| F06 (P3), manifest | `sources.toml` ARA75 `authors = "Jón Kr. Arason"`, EL73 `title = "Quadratic forms and the u-invariant. I"` | **Repaired.** The manifest parses; 23 entries, 10 certified, 13 uncertified. |

### Adversarial table (sampled targets, headlines, targets of findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.6 u-invariant | ℝ, ℂ, ℝ(t), 𝔽₃ | 0, 1, 2 (⟨1, −(1 + t²)⟩ anisotropic, signature 0); 𝔽₃ outside the stated domain | sound in char 0; R03 |
| §0.7 Tsen–Lang | i = 0; d = 1; ℂ as C₁ with r = 2, d = 2, N = 5; algebraic step; transcendental step | C₀ ⇔ algebraically closed (homogenise); r < N linear; height ≤ 2 < 5; rN > r·d^i; N(m + 1) > (dm + c + 1)d^i for N > d^{i+1}, m ≫ 0; ⟨1, x, y, xy⟩ over ℂ(x, y) anisotropic, 2² attained | sound; covers the case EKM's proof omits (Source issues) |
| §0.12 period and index | ℍ; M₂(ℍ); 0; (x, x) + (y, xy) over ℝ(x, y) | (2, 2); index 2, degree 4; (1, 1); Albert form ⟨x, x, −1, −y, −xy, x⟩: y-adic residues ⟨x, x, x, −1⟩ and ⟨−1, −x⟩, x-adic residues ⟨−1⟩, ⟨1, 1, 1⟩ and ⟨−1⟩, ⟨−1⟩, all anisotropic: index 4, period 2; dim_K L^d = d[L : K] over dim D = d² gives d ∣ [L : K] | sound |
| §0.13 Albert | normal form; a = b = c = d = −1 | e = −x₁x₂x₃: ex₃ ≡ −ab, ex₆ ≡ cd using −x₁⋯x₆ ∈ F²; ⟨−1, −1, −1, 1, 1, 1⟩ isotropic, (−1, −1)^{⊗2} = M₄(ℝ), index 1; i² = −1, Nrd(i) = 1 | sound |
| §0.14 | ℝ(x, y); F real closed; 𝔽₃ | u(F(√−1)) = 4, 1, 2; u(F) ≤ 6, 0, 2 | sound; R03 on the domain of u |
| §1.5 | ℚ̄ ⊂ ℂ, (x, y); ℝ ⊂ ℂ; m = per(α_K) | ind = per = 2 both sides; 2 against 1; ind(mα) = ind(mα_K) = 1 gives mα = 0 | statement sound; R04 on step 2 |
| §1.6 Azumaya models | β = 0, A = M_d(K); ranks; ℍ over ℝ[t]_(t); the order with lower-left entry in tR | 𝒜 = End(N); dim V = mre², rank P = mre²/c = me = d; fibre ℍ, index 2 = d; x² = y² = xy = yx = 0 in O/tO, radical of dimension 2, quotient ℂ × ℂ | sound |
| §2.3 | i_*i*; n-torsion; S = ℙ² | cup with dn·c₁(H); n·(d c₁(H) ∪ pr₂*τ_S) = 0; H₁(T) ≅ H₁(X) from H_j(X, T) = 0, j < 3; τ_S = 0 | sound |
| §2.5 | H²·K_X; p_*p* | (2f·A + A²)(−2f + K_S) = 2(A·K_S − A²); ℙ², O(1): −8; quintic, O(1): 5 = 5 excluded, O(2): 20 > 10; p_*p*σ = dn·σ | sound |
| §2.6 | W = 0; ℝ, ℤ, n = 2, (0, ∞); ball of radius ½; Γ = ℤ × 0, {y > 0} | {0} meets {0}; 1 ∈ Ω; misses 1 + 2ℤ; misses | sound, both hypotheses needed |
| §3.2 incidence model | twists; charts; r = xy, s unit; r = x, s = y | rv², sw² ∈ O(2) ⊗ O(R); z = rt gives z² = r·rt² = rs, z = su gives z² = s·su² = rs; xy = s u² singular only at x = y = u = 0, i.e. w = 0 (B19 prints v); y = xa², x = yc², c = a⁻¹, fibre ℙ¹ | sound |
| §3.3 | Čech on two charts; blow-up of (r, z) | monomials r^i x^j, 0 ≤ j ≤ 2i: k[r, rx, rx²] = k[r, z, s]/(z² − rs); charts ra² = s and z = cs, both smooth, exceptional ℙ¹ | sound |
| §5.1, §5.4 | S(ℝ) = ∅; T(ℝ) = ∅; (a₀, a₁) = (t, 0); a₀ = (0, 1) | all hold with Ψ = ∅; (i), (iii) trivial; t·cl_R(M); (0, e₁) against the printed (e₀, e₁); B19 lines 856–861 give (a, b, c) ↦ (0, b + a ∪ [e]₁, …) | sound |
| §5.5 criterion | Enriques quotient of x_j² = Σ B_jl y_l²; two choices of cl_R(L) | 2 × 2 minors 1, 3, 2, 2, 8, 6, 1, 5, 6, det 2: smooth (support argument on λ, y); ι free; X(ℝ) = 4 spheres, antipodal ι, other half empty (x_j² = −(By′²)_j); a₀ = (1, 1, 0, 0): c_Ψ = h₁ (sum 1 ∉ J) for h₁ + h₃, c_Ψ = h₁ + h₂ ∈ J for h₁ + h₂; four components of odd Euler characteristic, even as §9.8 requires | sound |
| §5.6, §5.8 | pushforward; step 3 of §5.8 | p_*b = 2η − Tr ψ(ζ) = 2η; 2(δ − η − p_*γ₀) = cl(p_*φ₀ − θ₁); 2δ + cl(θ₁) − 2(δ − cl μ − cl φ_Ψ − cl ν) = cl(θ₁ + 2μ + 2φ_Ψ + 2ν) | sound; gap as declared |
| §6.2 | S², one circle; torus, null-homotopic circle; Ξ = ∅ | (i)–(iv) hold; (iii) fails unless curve classes generate; empty embedding | sound |
| §6.3 | S², one circle perturbed | still two discs, class 0 | sound; R01 on the wording |
| §6.7 | orders along R, D′, H; signs | as a section of A^l ⊗ N²(−R): div(ru) = div(u) + R + 2D′, div(h₁h₂) = H − R − D′ + (nonreal): total div(u) + H + D′ ≥ 0, order 0 along R; with a zero of h₁ along R: order 2; rt = −h₁h₂·Σ(ru_i)² < 0 off Ξ | sound, and B19's choice fails as E22 says |
| §7.9 | w′, y_j at x | w′ = (w² − 1)/(2w) ↦ (−2)/(2i) = i; w′² + 1 = (w² + 1)²/(4w²) ∈ m²; y_j ≡ 2(1 + i)z_j mod m²; signature 1 + 1 − 1 − 1 | sound |
| §9.11 | X² − t, X³ − t, −t; n·t | roots ±t^{1/2}; one root t^{1/3} in K; not a square; n·t < 1 | sound; R02 on the suppliers |
| §9.12 | singular points of the sextic; real locus | affine critical points need u² = v² = 1/3, value 1/27 − t ≠ 0; at [1 : 0 : 0]: −v² − t w⁶ + …, A₅; at [1 : ±i : 0]: smooth; four discs | sound; R01 on the wording |
| §9.13 | Θ(α) | three components; α ≠ 0; period 2; matches B19 lines 1814–1816 | sound (CTP90 not read) |
| `HasZeroTotalSignature` | nonreal K; odd dimension; ⟨1, −1⟩, ⟨1, 1⟩ over ℝ; ⟨1, −t⟩ over ℝ(t); ⟨1, 0⟩ | vacuous; 2·dim W odd impossible; holds, fails; fails where t < 0; holds on the radical, harmless (degenerate forms are isotropic) | sound |
| `index_eq_orderOf_of_isAlgClosed` | ℂ(x, y): 0, (x, y) | 1 = 1; 2 = 2 | sound |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | Albert's class over ℝ(x, y); √−1 ∈ K | 4 ∣ 2·2; K is then finitely generated of transcendence degree 2 over R(√−1), ind = per | sound |
| `index_eq_orderOf_of_not_isSemireal` | Albert's class over the real field ℝ(x, y) | 4 ≠ 2: nonreal is needed | sound |
| `index_eq_orderOf_of_forall_isRealClosed` | nonreal K; ℍ over ℝ(x, y); transcendental real closed R ⊃ K | hypothesis vacuous, the statement is Theorem 0.3; ℍ survives everywhere, excluded; the relative algebraic closure of K in R is a real closure, so quantifying over all R equals quantifying over real closures | sound |
| `not_anisotropic_of_hasZeroTotalSignature` | dimension 5 over a real K; 6⟨1⟩ | predicate false in odd dimension; fails the predicate | sound |
| `exists_anisotropic_hasZeroTotalSignature` | §7.9 at (x² + 1, y) | values above; y_j sums of two squares, nonzero in every real closed R ⊃ K | sound |
| `not_anisotropic_of_not_isSemireal` | ⟨1, 1, 1, 1, a⟩ over ℝ(x, y, z : x² + y² + z² = −1) | zero (1, x, y, z, 0) | sound |
| `exists_common_zero_of_not_isSemireal` | K(t); ⟨1, 1⟩, ⟨1, −1⟩ over ℝ | finitely generated, degree 2, nonreal, dimension ≥ 5: isotropic; control: t² − 1 not a square, no common zero | sound |

The whole README was read this round. Also recomputed, without a row: trace-form signatures ±d (§0.5); Witt's theorem through (−1, f) and ⟨1, 1, −f, −f⟩ (§0.9); Springer's two cases (§0.10); the characteristic-2 control of §0.11; the degree-zero component (n/2 mod 2)·1_Θ (§1.4); (s, t) = (s, st) + (s, −1) and the crossing computation of §1.8; O_S(Δ) = (L(R))² (§3.5); L²(R)(−C) = L ⊗ N and L(−C) = N(−R) (§§4.2, 4.5); the three vanishings on ℙ² with N = O(−1) (§4.4); N ⊗ K_{S′} = μ*(A₀K_S)(3F − E) (§4.9); the torus example a·b = a·c = b·c = 1, rank 5 (§6.4); λ_van on ℙ¹ × ℙ¹ → ℙ², determinants 1 and −2 (§6.10); cor(α_T) = 2α giving n ∣ 2m (§7.2); h⁰(−K) = 5, h⁰(−2K) = 13 against 15 (§7.12); sign of the local monodromy (−1)^{m_i} (§8.2); ψ[(1, 0, 0, 0)] = (−3, 1, 1, 1) and (3, −1, −1, −1) ≡ (3, 3, 3, 3) mod 4 (Layer 8 Examples); H^i(G, ℤ(1)) = 0, ℤ/2 for i = 2, 3 (§1.2).

### Sources: the seeded sample

The author flagged no locator as unverified. B19 file page N is printed page 62 + N; EKM printed page is file page − 8; CT05 file page N is printed page 378 + N.

| Target | Locator read | Outcome |
|---|---|---|
| 0.7 | EKM lines 20208–20288 (§97, Theorem 97.2, Corollaries 97.5, 97.6, Theorem 97.7, pp. 385–386); B19 line 111 (Theorem 0.8, p. 65) | supported |
| 0.12 | CT05 lines 122–177 (§2.2, Proposition 2.2, pp. 382–383) | supported |
| 0.13 | BEC05 lines 88–104 (§§2–3, p. 3); EKM lines 20715–20719 (Theorem 98.19, p. 392), 9338–9366 (Lemma 38.1, Corollary 38.2, pp. 170–171) | supported; the split case is the README's |
| 1.5 | B19 lines 198–200 (§0.6, p. 68); CT05 lines 150–155 (p. 382) | supported; the proof is the README's (R04) |
| 1.6 | CT05 lines 256–258 (Theorem 2.5, p. 385), 906 (p. 401) | supported |
| 2.3 | B19 lines 263–279 (Lemma 1.3, pp. 69–70) | supported |
| 2.5 | B19 lines 294–311 (Theorem 1.5, pp. 70–71); VOI06 lines 724, 773 (Propositions 8, 9, file pp. 20–21) | supported |
| 2.6 | B19 lines 320–324 (p. 71), 1271–1276 (p. 94) | supported |
| 3.2 | B19 lines 537–558 (§3.1, pp. 76–77), 932–963 (§§5.1–5.2, p. 86) | supported as corrected (E1, E18) |
| 3.3 | B19 lines 989–998 (proof of Lemma 5.3, p. 87) | supported |
| 5.5 | B19 lines 748–749, 836–879 (Proposition 4.4, pp. 81–84) | supported as corrected (E3) |
| 5.6 | B19 lines 883–892 (pp. 84–85); BW20 lines 1361–1362 (Proposition 2.9) | supported |
| 6.2 | B19 lines 1111–1121 (Assumption 6.1, pp. 90–91) | supported; a list of hypotheses, kept with the source's labels |
| 6.7 | B19 lines 1157–1170 (Lemma 6.4, p. 92) | supported as corrected (E22) |
| 9.13 | B19 lines 1814–1816 (p. 107) | supported; CTP90 cited through B19 |

All 23 cited works have a manifest key.

### Lean

`lake env lean` on `packages/RealSurfacePeriodIndex/Suggested.lean` from the content checkout: exit 0, eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else.

Padding probe on a scratch copy, all eight theorems: `fail_if_success (first | (simp; done) | rfl | infer_instance | decide | (aesop; done) | (simp_all; done) | omega | trivial | (exact?; done) | (intros; simp_all; done) | (intros; exact?; done))` before each `sorry`: exit 0, no error, so no tactic closes any goal. `#check @name` for the nine declarations in the same file: every binder of the README statements is present (`[Invertible 2]`, `[FiniteDimensional K V]`, `[Algebra.EssFiniteType ℝ K]`, `Algebra.trdeg ℝ K = 2` or `= 1`); nothing changed.

Headlines of the Summary: Theorem 0.1 (with the norm bound), 0.3, 0.4 (birational form), 0.10, 0.12 (two statements) and the pair-of-quadrics form of 0.13 are stated; the scheme form of 0.4, Theorems 0.5 and 0.6, Proposition 0.7 and the del Pezzo form of 0.13 are named in the docstring with the missing carriers. The README's own backticked names are the nine declarations. No `set_option`, no sorry'd data, no `lemma`, no example. The three `TauCeti.*` imports are each used (`index`, `mk`, `baseChange`).

### Pinned declarations

38 name-and-line locators of the two contracts compared mechanically with the pinned files, the two-name locators opened by hand (Signature.lean:98 `sigNeg`, Defs.lean:387 `basis`, Cone.lean:63 `LinearOrder.ofSubmonoid` with `to_additive`): each line carries the cited name. Opened for R02: the five Tau Ceti declarations named there. The pins have no `IsRealClosed` statement for the Puiseux field, no u-invariant, no space of orderings, no Amer–Brumer theorem and no period–index statement in transcendence degree 2.

### Suppliers, direction and ownership

Dependency check, whole output:

    depcheck: 250 roadmaps, 2373 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The overlap file lists no dropped id, no revision-only id, no conflicting head and no second copy.

Resolved at the current heads, by heading or name: MotivesAndAlgebraicCycles §§0.5b (line 161), 7.6a (1422), 7.6b (1435), 7.8 (1464), 7.10 (1500); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3, 15.1–15.6, 16.1–16.4; ComplexComparisonPartII C5.2, C5.3, C6.2, C6.3 with the eight names; HeightsRationalPointsAndObstructions §§2.16b, 2.19a with the five names; SchemeAndStackFoundations, the 14 names and 11 section headings cited; EnriquesSurfaces §§1.1, 1.3, 1.4; FormalLaurentPuiseux L4, L5 and its three names; PurityForFlatCohomology §8.4; LefschetzPencilsAndVanishingCycles §0.10; PurityOfBranchLocus §2.3; AffineMorseLefschetz A3, A5; WeilConjectures WC.7; ShimuraData §3.1; ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8 and `exists_resolution`; AlgebraicModuliForArithmeticGeometry §§1.1, 1.4 and `amplePowersAndFixedTwists`; StableReduction Layer 4; ModularCurves 4D through main's table of former labels; QuadraticFormInvariants Layers 0, 1, 2, 4, 5; RealAlgebraicGeometry under `Completed/`; SemisimpleAlgebras Layer 6.

The three gaps have the same slugs in the README and in `design/plan.json`, each with a named supplier and section and one sentence with its hypotheses, and none is provided today: MotivesAndAlgebraicCycles §7.8 uses "the torsion-free divisor cokernel" inside a proof without stating it; AlgebraicTopologyPartII §16.2 still assumes invariant control data (§16.1c gives compatible, not invariant, data); ComplexComparisonPartII §C6.3 has no comparison over ℝ.

Duplication by object, searched on main and at the open heads: Harrison topology and spaces of orderings, the u-invariant, Albert forms, Amer–Brumer, Springer's theorem for complete discretely valued fields (QuadraticFormInvariantsPartII §2.5 is Springer's odd-degree theorem, another statement), period and index of a Brauer class: no other owner. The Tsen–Lang theory is stated here (§0.7) and in QuadraticFormInvariantsPartII §5.6 (line 391 of the merge order against 229 here; its README:118 and README:2029 say this roadmap takes it from there, and LogicAndDefinabilityInNumberTheoryPartII cites that §5.6). The round-4 repair report marked this not actionable in this package; the reason holds (the later roadmap is the one to cite the earlier) and it is not re-raised.

Overlap check: read QuadraticFormInvariantsPartII, LogicAndDefinabilityInNumberTheoryPartII, AlgebraicTopologyPartII, MotivesAndAlgebraicCycles (open), QuadraticFormInvariants, RealAlgebraicGeometry, SchemeAndStackFoundations (main); the Tsen–Lang theory is shared with QuadraticFormInvariantsPartII and its owner is this roadmap (§0.7), the earlier one; nothing else shared.

### Shape, policy and source independence

Every numbered section has a *Needs:* line, Checks and a locator; every section with an API list has at least three Checks. No LaTeX delimiter, pull-request number, path, round label, HTML anchor or process word; "lemma" occurs only in names of results. No algorithm. The labels of the Source corrections skip E16 and E19; they are identifiers and need no change.

Arrangement against B19 (130 of 237 keyed locators), by number: Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8. Layers 0 and 1 have no counterpart, §2 is left to suppliers, Layers 4 and 5 reverse the source, §6 is split; Layer 3 before 4 and 5, and Layers 7, 8 before 9, are forced by their *Needs:* lines (§3.2; §§7.4, 7.7, 8.10). Not a one-to-one run.

Wording: every sentence of the README of 14 tokens or more was compared mechanically (token LCS against three-line windows) with the cached texts of B19, EKM, BEC05, BEN18, BW20, BW20II, MVH98, VOI06 and VA13, and the hits above 0.72 were read; 22 passages were then set by hand beside B19, EKM, CT05 (French), BEC05, BW20 and MVH98 at the locators above, among them §§0.7, 0.12, 1.1, 2.3, 2.5, 3.2, 5.1, 5.6, 6.1, 6.2, 6.3, 6.7, 8.6, 9.12, 9.13 and the docstring of Theorem 0.3. Two follow B19 (R01). The other hits are statements of theorems and lists of hypotheses that admit one wording (Lemma 6.4, Assumptions 4.1 and 6.1, Proposition 6.6, BEC05 §3).

Source independence: 22 passages compared with 6 sources, two shared (R01); largest share B19, 130 of 237 locators; contents compared with B19: independent.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00 are settled uncertified; their texts were not read. §6.5, §6.6, §9.13 and the sign statement of §9.12 rest on them through B19.
- The existence of the Kummer lift used in the Enriques example of §5.5 rests on §9.1 (B19 Proposition 8.1) and on MVH98 Theorem 4.4, which were read but not reproved.
- BEN18, VA13, BW20II and the EKM locators of §§0.8–0.10 and 0.14 were not reopened this round beyond the mechanical wording sweep; they rest on the round-9 table.

## Source issues

Only what was confirmed against the text in this round.

- **Gap** in EKM at proof of Theorem 97.2, printed p. 385: the source says that for n > 0 and d > 1 a normic form exists by Lemma 97.1; it should first treat algebraically closed fields for every n, since they are C_n and have no normic form; affects the proof.
- **Misprint** in CT05 at §2.3, printed p. 383: the source says the tensor product of Azumaya algebras of degrees n and m lands in degree n + m; it should be degree nm, as in §2.2; affects nothing.
- **Misprint** in B19 at §3.1, printed p. 77: the source says the singular points are those over the singular locus of R where v vanishes; it should be where w vanishes; affects nothing.
- **Error** in B19 at §3.1, printed p. 76: the source says the incidence surface is a finite double cover of S; it should say generically of degree two, the fibres over the crossings of R and D being projective lines; affects nothing.
- **Gap** in B19 at proof of Proposition 4.4, printed p. 84, after (4.8): the source says the degree-one component of the boundary class equals that of the cover class on the avoided set; its own formula gives that class multiplied by the evaluation of the Brauer class; affects the proof.
- **Error** in B19 at proof of Lemma 6.4, printed p. 92: the source says the auxiliary function vanishes to order one along R; it should have a simple pole along R, otherwise the section vanishes doubly along R; affects the proof.
- **Misprint** in B19 at proof of Lemma 6.5, printed p. 92: the source says the image of the real locus is disjoint from the nonzero evaluation locus; it should say disjoint from the complement of Ξ; affects nothing.
- **Misprint** in B19 at proof of Theorem 1.5, printed p. 71: the source says Voisin's proposition is applied with degree dl; it should be dn, the letter l being undefined there; affects nothing.
- **Misprint** in B19 at proof of Proposition 0.7, printed p. 107: the source says the quaternion class lies in the Brauer group of the function field over the reals; it should be over the Puiseux field; affects nothing.

## For the human reviewers

- **Ownership.** QuadraticFormInvariantsPartII (open; its README:118, README:2029 and §5.6) and this package (§0.7) each state the Tsen–Lang theory and each names the other as consumer; this package is earlier in the merge order (line 229 against 391).
- **Scope.** `packages/RealSurfacePeriodIndex/README.md:24` and source corrections E3 and E25 replace Propositions 4.4 and 4.5 of the refereed source B19 by other criteria and call Theorem 0.6 (ii) vacuous; no refereed source states these corrections.
- **Licence.** EKM is read from an author page, BEC05 and VA13 from institutional hosts (`sources.toml`, classes `author-page` and `institutional`); thirteen works are cited by locator without their text.
- **Supplier outside the merge order.** EnriquesSurfaces §§1.1, 1.3, 1.4 is consumed from another author's open pull request that adds the roadmap; it is not listed in `merge-order/ORDER.txt`.
- **Import header.** `packages/RealSurfacePeriodIndex/Suggested.lean:1–6` uses `module` with `public import Mathlib` and `@[expose] public section`; the brief's form names the single line `import Mathlib`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dc9e15344e658cb2d1b9b1330d3ecd0de4c93ab4", "job": "REV-PKG-RealSurfacePeriodIndex~10", "model": "fable", "worker": "chris-x55"} -->
