<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6914857642 -->
Red team round 1 pass a (claude) of 2f325ff

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Pfister's local–global principle is used and owned nowhere

   **Location.** `packages/RealSurfacePeriodIndex/README.md:302` (§0.6): "u(F) … is the supremum of dim q over nondegenerate anisotropic quadratic forms q over F with zero total signature"; `:370` (§0.8), `:505` (§0.14), `:523` (§0.15) take their bounds from EKM and BEC05.

   **Claim.** The bounds u(F) ≤ 2 (§0.8), u(F) ∈ {0, 1, 2, 4, 6} with a zero-signature Albert form (§0.14) and hence u ≤ 4 (§§0.15, 7.8, `not_anisotropic_of_hasZeroTotalSignature`) hold for the invariant of §0.6.

   **Witness.** EKM line 8824 and BEC05 line 73 define u through forms whose Witt class is torsion. Passing to zero total signature is EKM Theorem 31.22 (EKM line 6811, p. 128): no target, no *Needs:* entry, absent from the pins and from every roadmap (`roadmaps grep`).

   **Repair.** Add the target below after §0.6, add "§0.6a" to the *Needs:* lines of §0.8 (`:381`) and §0.14 (`:517`), add "QuadraticFormInvariants Layer 9" to the Layer 0 Dependencies if the transfer route is used, and add to the Scope list of owned Layer 0 inputs "Pfister's local–global principle".

   > ### 0.6a Pfister's local–global principle
   >
   > char F ≠ 2; forms nondegenerate; W(F) is the Witt ring of QuadraticFormInvariants Layer 4.
   >
   > Let F be a field of characteristic ≠ 2 and q a nondegenerate quadratic form over F. Then sign_P(q) = 0 for every P ∈ X_F if and only if the Witt class of q is torsion in W(F), and a torsion class is killed by a power of 2; if F is nonreal, every class of W(F) is killed by a power of 2. Consequently u(F) of §0.6 is the supremum of the dimensions of anisotropic forms with torsion Witt class, which is the invariant of EL73, EKM §36 and BEC05 §2. (EKM, Theorem 31.22, p. 128; EKM, Corollary 34.12, p. 141; EKM, §36, p. 161)
   >
   > A proof can proceed as follows.
   >
   > 1. Each sign_P factors through a ring homomorphism W(F) → ℤ (§0.4), and ℤ is torsion-free, so a torsion class has zero total signature.
   > 2. Conversely suppose no 2^m·q is hyperbolic. By Zorn's lemma choose an algebraic extension K/F maximal with this property for q_K. For a ∈ Kˣ not a square, 2^m·q dies in W(K(√a)) for some m, so 2^m·q = ⟨1, −a⟩·y (the kernel of W(K) → W(K(√a)), EKM Corollary 34.12) and ⟨1, a⟩·2^m·q = 0; if −a is not a square either, likewise ⟨1, −a⟩·2^{m′}·q = 0, and adding the two gives 2^{m″+1}·q = 0 because ⟨1, a⟩ + ⟨1, −a⟩ = 2 in W(K). So a or −a is a square for every a.
   > 3. −1 is not a square in K (otherwise 2·q = ⟨1, −1⟩·q = 0), and a sum of two squares is a square (if b² + c² were not, its negative would be, so the Pfister form ⟨1, 1, 1, 1⟩ would be isotropic, hence hyperbolic, and 4·q = 0). So the squares of K are an ordering P_K, q_K ≅ r⟨1⟩ ⊥ s⟨−1⟩ with r ≠ s, and sign of q at the restriction of P_K to F is r − s ≠ 0 (§0.4).
   >
   > **Checks.**
   >
   > - Over ℝ(t), q = ⟨1, −(1 + t²)⟩ has zero total signature and 2·q = ⟨1, 1⟩ ⊥ −⟨1 + t², 1 + t²⟩ is hyperbolic, since ⟨1, 1⟩ represents 1 + t² and both binary forms have determinant a square: the class has order 2.
   > - Over ℝ(t), ⟨1, −t⟩ has signature 2 at the orderings with t < 0 and n·⟨1, −t⟩ has signature 2n there, so no multiple is hyperbolic.
   > - Over ℂ(x, y), nonreal, 2·q = ⟨1, 1⟩·q = ⟨1, −1⟩·q = 0 for every q, although ⟨1, x, y, xy⟩ is anisotropic: torsion does not mean hyperbolic.
   > - Over ℝ, W(ℝ) ≅ ℤ by the signature is torsion-free, and a zero-signature form is hyperbolic (u(ℝ) = 0).
   >
   > *Needs:* §0.1; §0.4; QuadraticFormInvariants Layer 4; QuadraticFormInvariants Layer 9.

   Tested on the instance: with §0.6a, EKM Corollary 37.8 applied to ⟨1, 1, −f, −f⟩ in §0.9 step 3 is an application to a torsion form (2·⟨1, −f⟩ is hyperbolic when f is a sum of two squares; in general by §0.6a).

2. **F02** (P2) The Artin–Lang theorem is used in three proof plans and has no owner

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2098` (§7.11 step 2): "by the Artin–Lang theorem the function field of an integral real variety is real iff the variety has a smooth real point"; also `:32`, `:1999` (§7.6 step 4), and `:394` (§0.9 step 4, orderings of ℝ(C) as half-branches).

   **Claim.** S(ℝ) = ∅ makes ℝ(S) nonreal (Theorems 0.10 and 0.13 in the form of B19), the scheme form of Theorem 0.4 follows from the birational one, and a function positive on a dense set of real points of a curve is positive at every ordering.

   **Witness.** `roadmaps grep -i 'Artin.Lang'` finds only this README; RealAlgebraicGeometry (on main, Layers 1–8) states no such target; `:2107` reads "*Needs:* §7.8; §0.6; §0.1". BCR is cited (`:2093`), and a citation is not a supplier.

   **Repair.** Add the target below to Layer 0 (after §0.5), replace step 4 of §0.9 by the text given, and add "§0.5a" to the *Needs:* lines of §0.9, §7.6, §7.11 and §7.13; add "RealAlgebraicGeometry Layer 6" to the Layer 0 Dependencies and to the supplier contract of RealAlgebraicGeometry.

   > ### 0.5a The Artin–Lang theorem
   >
   > A a finitely generated ℝ-algebra that is a domain, K its fraction field.
   >
   > Let P be an ordering of K and f_1, …, f_r ∈ A with f_i >_P 0. Then there is an ℝ-algebra homomorphism x : A → ℝ with x(f_i) > 0 for every i. Consequently, for an integral variety V over ℝ, the function field ℝ(V) is real if and only if V has a smooth real point, if and only if V(ℝ) is Zariski dense in V; in particular V(ℝ) = ∅ makes ℝ(V) nonreal. (BCR, §4.1, Artin–Lang homomorphism theorem, pp. 85–87)
   >
   > A proof can proceed as follows.
   >
   > 1. Let R be a real closure of K at P (§0.3). Write A = ℝ[t_1, …, t_n]/(g_1, …, g_m); the images of the t_j in R are a solution in R of g_1 = ⋯ = g_m = 0, f_i > 0.
   > 2. The existence of a solution of this finite system is a first-order sentence with parameters in ℝ; quantifier elimination for real closed fields (RealAlgebraicGeometry Layer 6) makes its truth the same in R and in ℝ.
   > 3. Corollary: if ℝ(V) is real and Z ⊂ V is a proper closed subset, take an affine open Spec A of the smooth locus and a nonzero g ∈ A vanishing on Z, and apply the first part to A[1/g] with f_1 = g²: it gives a smooth real point outside Z, so V(ℝ) is Zariski dense. Conversely a smooth real point orders ℝ(V) through its completed local ring ℝ[[z_1, …, z_d]].
   >
   > **Checks.**
   >
   > - V = {x² + y² + z² = −1}: V(ℝ) = ∅, and −1 = x² + y² + z² is a sum of squares in ℝ(V).
   > - Negative control: V = {x² + y² = 0} ⊂ 𝔸² is integral over ℝ with the real point (0, 0), which is singular, and ℝ(V) contains y/x with (y/x)² = −1; a real point that is not smooth does not make the function field real.
   > - A = ℝ[t], P the ordering with t positive and smaller than every positive real, f_1 = t, f_2 = 1 − t: the point t = 1/2 satisfies both inequalities.
   >
   > *Needs:* §0.1; §0.3; RealAlgebraicGeometry Layer 6.

   Replacement for §0.9 step 4: "(b) Suppose f <_P 0 for some ordering P of F. Let C′ ⊂ C be an affine open on which f and f⁻¹ are regular. By §0.5a there is x ∈ C′(ℝ) with f(x) < 0, so f < 0 on a Euclidean neighbourhood of x, which contains a point w of the dense set W; there β is unramified, f is a unit, and β(w) = (−1, f(w)) ≠ 0, a contradiction. So f >_P 0 for every P and (a) applies." Tested on the instance (−1, t) over ℝ(t): f = t is negative at the orderings with t < 0, and the points t < 0 are real points where the class is nonzero, as the Check at `:400` records.

3. **F03** (P3) §1.3 cites AlgebraicTopologyPartII §7.4 for a formula that needs its §14.2

   **Location.** `packages/RealSurfacePeriodIndex/README.md:613` (§1.3 step 2): "the Bockstein of 0 → ℤ(1) → ℤ(1) → 𝔽₂ → 0 followed by reduction modulo 2 is (a₀, a₁) ↦ (0, a₁, Sq¹a₁) in canonical components (AlgebraicTopologyPartII §7.4 …)".

   **Claim.** §7.4 gives this formula.

   **Witness.** AlgebraicTopologyPartII §7.4 at its open head (first paragraph of the section) gives b_i = β(a_{i−1}) + (k − i)a_i for the untwisted Bockstein: for k = 1 this is (a₀, 0, Sq¹a₁). On Spec ℝ with a₀ = 1 the target H²_G(pt, ℤ(1)) is 0.

   **Repair.** In step 2 write "(AlgebraicTopologyPartII §7.4 for the untwisted Bockstein and §14.2 for the sign system ℤ(1) of S × G → S, whose class is ω: the boundary is β + ω ∪, so (a₀, 0, Sq¹a₁) + (a₀, a₁, 0) = (0, a₁, Sq¹a₁))". Add "AlgebraicTopologyPartII §14.2" to the *Needs:* line of §1.3 (`:622`) and to the Layer 1 Dependencies. Add the Check: "On X = Spec ℝ and e = ω (a₀ = 1, a₁ = 0), the untwisted formula of §7.4 alone gives degree-zero component 1, while H²_G(pt, ℤ(1)) = 0 (§1.2 Checks); the term ω ∪ e of §14.2 cancels it." Tested: 1 + 1 = 0 in degree zero.

4. **F04** (P3) Source corrections that no target cites, against the section's own sentence

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2719`: "The targets cite these entries as source corrections."

   **Claim.** Every entry E1–E26 is cited by a target.

   **Witness.** E2, E7, E8, E11, E14, E15, E20, E21 and E23 occur once in the README, in their own entries (`grep -o '\bE[0-9]*\b' README.md | sort | uniq -c`). E11 concerns the Gysin twist of B19 (2.1), which no target of this roadmap states.

   **Repair.** Add "(source correction E2)" to the header line of §2.4, "E7" to §8.4, "E8" to §7.3, "E14" to §9.14, "E15" to §9.5, "E20" to §5.2, "E21" to §6.12 and "E23" to §5.8, each next to the step the entry corrects. Delete entry E11 from the README (it stays in the errata register through the report), or cite it in §3.6 step 1 where the real Gysin map is used.

5. **F05** (P3) Process wording about the merge order in the README

   **Location.** `packages/RealSurfacePeriodIndex/README.md:24`: "QuadraticFormInvariantsPartII, later in the merge order, imports it for its Layer 5"; `:2716`: "QuadraticFormInvariantsPartII, later in the merge order, consumes §0.7".

   **Claim.** The README describes the mathematics only.

   **Witness.** "merge order" is the job board's ordering file, which the roadmap repository does not contain; the phrase occurs twice (`grep -n 'merge order' README.md`).

   **Repair.** `:24`: "The Tsen–Lang theory of §0.7 has this roadmap as its single owner; QuadraticFormInvariantsPartII consumes it for its Layer 5." `:2716`: delete ", later in the merge order," and keep the rest of the sentence.

Five findings: one P1, one P2, three P3. Files reviewed: `packages/RealSurfacePeriodIndex/README.md` (2773 lines, read in full) and `packages/RealSurfacePeriodIndex/Suggested.lean` (165 lines, read in full). No Lean was run in this pass; the elaborated types are those of the supplied signature transcript.

## Verified sound

**Dependency check** (output of the command of the brief): `depcheck: 260 roadmaps, 2498 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

**Counts.** 9 declarations of `Suggested.lean` read with their elaborated types; 108 README targets read; 70 pinned file-and-line locators verified (all correct); 86 source locators verified against the cached texts (B19 40, EKM 19, CT05 7, BW20 6, BEN18 5, MVH98 3, VA13 3, BEC05 2, VOI06 2, BW20II 1; all pages and numbers correct); 64 Checks recomputed; 83 sibling citations resolved (sections and declaration names at main or at the open head).

**Suggested.lean, one row per declaration.**

| Declaration | Context | Instances and computed values | Result |
|---|---|---|---|
| `HasZeroTotalSignature` | no section variables; binders explicit; R : Type u | ℝ, ⟨1, −1⟩: line x = y, 2·1 = 2 ✓ holds; ⟨1, 1⟩: fails; odd dimension over real K: 2·finrank odd, fails; nonreal K: no real closed K-algebra, holds for all; ⟨1, 0⟩ over ℝ: radical line, holds (degenerate) | determines sign_P = 0 for nondegenerate q; universe u suffices (real closures in Type u) |
| `index_eq_orderOf_of_isAlgClosed` | k, K : Type u; `EssFiniteType`, trdeg = 2 | ℂ(x, y), (x, y): per 2, ind 2; A = M_n(K): 1 = 1; orderOf never 0 (Brauer group torsion) | true as typed |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | R real closed, K over R | ℝ(x, y), (x, x) + (y, xy): ind 4 = 2·2 (Albert form ⟨−1, x, x, x, −y, −xy⟩ anisotropic over ℝ((x))((y))); K ∋ √−1: ind = per | true as typed |
| `index_eq_orderOf_of_not_isSemireal` | `¬ IsSemireal K` ⇔ −1 sum of squares (pin: `isSemireal_iff_not_isSumSq_neg_one`) | ℂ(x, y) ✓; ℝ(x, y) excluded (Albert class 4 ≠ 2) | true as typed |
| `index_eq_orderOf_of_forall_isRealClosed` | hypothesis over R : Type u | nonreal K: hypothesis empty, reduces to Theorem 0.3; ℍ ⊗ ℝ(x, y): hypothesis fails; Albert class: fails at orderings x < 0 | true as typed; equivalent to scheme form |
| `not_anisotropic_of_hasZeroTotalSignature` | no `EssFiniteType`; dim > 4 | degenerate q: isotropic anyway; real K, odd dim: hypothesis false; algebraic closure of ℝ(x, y): all forms of dim ≥ 2 isotropic | true as typed, given R01 |
| `exists_anisotropic_hasZeroTotalSignature` | `EssFiniteType`; Fin 4 → K | ℝ(x, y): ⟨1, −(1 + x²)⟩ ⊗ ⟨1, −y⟩, norm form of (1 + x², y), ramified at y = 0; ℂ(x, y): ⟨1, x, y, xy⟩ | true as typed |
| `not_anisotropic_of_not_isSemireal` | no `EssFiniteType`; dim ≥ 5 | ℂ(x, y, z) excluded by trdeg (8-dim anisotropic); ℝ(x, y) excluded (5⟨1⟩) | true as typed |
| `exists_common_zero_of_not_isSemireal` | trdeg 1 | ℝ(x): 5⟨1⟩ no zero, excluded; ℂ(x, y): ⟨1, x, y, xy, 0⟩, ⟨0, 0, 0, 0, 1⟩ no common zero, excluded by trdeg | true as typed |

Headline theorems: de Jong, the norm bound, Theorems 0.3, 0.4, 0.10, 0.12 (both halves) and the pair-of-quadrics form of 0.13 are stated; 0.4 (scheme form), 0.5, 0.6, 0.7 and 0.13 (del Pezzo form) are named in the module docstring with the missing carriers. One-tactic probe: none of the eight theorems follows from one library lemma (the nearest, Theorem 0.10 from 0.12, needs that a nonreal field has no real closed algebra and a dimension step). No padding found; no `set_option`, `lemma`, `#eval`, sorry'd data or machine path.

**README statements, computed.**

| Statement | Instance | Values | Result |
|---|---|---|---|
| §0.5 trace-form criterion | M_d(R); ℍ_R | d(d+1)/2 − d(d−1)/2 = d; 2⟨1, −1, −1, −1⟩ → −2, times d/2 = −d | ✓ |
| §0.7 one-variable step | N(m+1) unknowns, (dm+c+1)·d^i threshold | N > d^{i+1} wins for m large | ✓ |
| §0.11 Check | ⟨1 + t, 1 − t⟩ over ℝ(t) | −(1 + t)(1 − t) = t² − 1 not a square | ✓ |
| §0.13 normal form | e = −x₁x₂x₃ | ex₃ ≡ −ab; ex₆ ≡ cd iff −x₁⋯x₆ square | ✓ |
| §0.14 | 𝔽₃; ℝ; ℝ((t)) | u = 2, 0, 0, all in {0, 1, 2, 4, 6} | ✓ |
| §1.2 Spec ℝ | H²(G, ℤ(1)), H³(G, ℤ(1)) | 0, ℤ/2 | ✓ |
| §1.3, §5.4 twisted Bockstein | components for ℤ(j), degree k | Sq¹a_{i−1} + (k − i + j)a_i; k = 1, j = 1: (0, a₁, Sq¹a₁); §5.4: (0, a₁ + a₀e₁, Sq¹a₁ + a₁e₁) | ✓ (citation: R03) |
| §1.7 crossing | (s, t) = (s, st) + (s, −1), l = 2 | from (s, s) = (s, −1) | ✓ |
| §1.7 empty locus | 1 + s² + t² two squares | b² + d² = 1, ab + cd = 0 ⇒ a² + c² = λ², 1 + s² not a square | ✓ |
| §2.1 | H²·K_X | (2hA + A²)(−2h + K_S) = 2(A·K_S − A²); ℙ²: −8 | ✓ |
| §2.3, §2.4 | weak Lefschetz on the threefold | H³(T) = H₁(T) ≅ H₁(X) = H⁵(X); H₂(T) ↠ H₂(X) | ✓ |
| §2.9 prime-power step | per l^r | ind | l^{r−1}·l | ✓ |
| §3.2 | r = xy, s unit, chart u = w/v | xy = su², node at x = y = u = 0 | ✓ |
| §4.1–4.6 twists | L = A^l ⊗ N(−R) | L²(R)(−C) = L ⊗ N; T_{X/S}|_C = L|_C; L(−C) = N(−R); ω = p̄*(K_S ⊗ L(R)) | ✓ |
| §4.4 Check | ℙ², R a line, N = O(−1) | H⁰(O(−4)) = H⁰(O(−1)) = H¹(ℙ¹, O(−1)) = 0 | ✓ |
| §5.5 Check (Enriques) | x_j² = Σ B_jl y_l² modulo y ↦ −y | 8 sign vectors × S² modulo ±: 4 spheres, antipodal action, 4 copies of ℝℙ²; c_Ψ = (1, 1, 0, 0)·(h₁ + h₃) = h₁, coefficient sum 1, not in w₁^⊥; deg(w₁(h₁ + h₂)) = 0 | ✓ as computed |
| §6.4 Check | torus, loops a, b, a + b | 3 double points; H¹ = 𝔽₂⁵; total class 0 | ✓ |
| §6.7 | ord_R(t) | −1 + 1 = 0 | ✓ |
| §6.13 step 3 | a₂ near t | a₂c ∈ H⁰(A^{2l} ⊗ N²(−R)) = H⁰(L²(R)); rs ≈ rt·c < 0 on Ψ | ✓ |
| §7.9 | w′ = (w² − 1)/(2w) | w′ ≡ i; w′² + 1 = (w² + 1)²/(4w²); dy_j ≡ 2(1 + i)dz_j | ✓ |
| §7.12 | degree 4, degree 3 | h⁰(−K) = 5, h⁰(−2K) = 13 < 15; cubic: 10 = 10 | ✓ |
| Layer 8 Examples | n = 4, ψ(1, 0, 0, 0) | (−3, 1, 1, 1) ≡ (1, 1, 1, 1) = p*φ; lift (3, −1, −1, −1) ≡ (3, 3, 3, 3) | ✓ |
| §9.8 (source correction E25) | Lefschetz number of conjugation | χ(S(ℝ)) ≡ Σ b_i(S(ℂ)) = 12 ≡ 0 mod 2, so deg(w₁²) = 0 | ✓, independent of the route of §9.8 |
| §9.9 step 2 | a = [α̃]₁ + w₁(Σ) | deg(a·w₁) = 1 + χ(Σ) = 0 | ✓ |
| §9.4 Check | MVH98 Theorem 1.3 | ℤ/4 summand exactly for orientable, both halves nonempty | ✓ (MVH98 line 135) |

**Suppliers.** Every cited section exists where cited: SchemeAndStackFoundations (17 sections, 16 names), ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8 (`exists_resolution`), AlgebraicModuliForArithmeticGeometry §§1.1, 1.4, ComplexComparisonPartII §§C5.2, C5.3, C6.2, C6.3 (8 names), AffineMorseLefschetz A3 and A5, QuadraticFormInvariants Layers 0, 1, 2, 4, 5, SemisimpleAlgebras Layer 6, RealAlgebraicGeometry Layer 1, FormalLaurentPuiseux L4 and L5 (`puiseuxField_isAlgClosed` is in its `Suggested.lean`), StableReduction Layer 4, PurityOfBranchLocus §2.3, AlgebraicTopology Stage 6 on main; AlgebraicTopologyPartII (Layer 6 and 25 sections), MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10, HeightsRationalPointsAndObstructions §§2.16b, 2.19a (5 names), PurityForFlatCohomology §8.4, LefschetzPencilsAndVanishingCycles §0.10, ShimuraData §3.1, WeilConjectures WC.7 and EnriquesSurfaces §§1.1, 1.3, 1.4 at their open heads. "ModularCurves 4D" is the former numbering of its Layer 0.9, mapped by the table on main, so the citation is valid. Signs agree with the suppliers: b = p*η − ψ(ζ) (AlgebraicTopologyPartII §15.4), the plus sign of §16.4, (id, n/2 mod 2) of §15.5.

**Declared gaps.** The three slugs are in `design/plan.json` (`gaps`) and in the README under the supplier's subsection with the same wording. `gap:real-artin-comparison`: neither ComplexComparisonPartII §C6.3 nor MotivesAndAlgebraicCycles §7.6a states an étale comparison over ℝ. `gap:picard-cokernel-torsion-free`: BW20 Proposition 2.9 (BW20 line 1361) is stated for a smooth variety, not necessarily proper, which is the generality the gap asks for and §§5.6, 8.9 use. `gap:at2-stratified-pair-transport`: AlgebraicTopologyPartII §16.2 takes invariant control data as a hypothesis. Precise, minimal, declared.

**Ownership.** Searched by object (space of orderings, Harrison topology, signature at an ordering, u-invariant, Amer–Brumer, Albert forms, period and index, Tsen–Lang) on main, in the pins and at the open heads: no second owner other than the Tsen–Lang case under "For the human reviewers". No declaration of `Suggested.lean` has a fully qualified name declared by another roadmap.

**Policy.** The pull request changes only `packages/RealSurfacePeriodIndex/` (`git diff --stat origin/main...HEAD`). Every target has a locator; every definition has at least three Checks (the fewest is §8.1, with three).

**Copyright, wording.** 18 passages compared with 6 sources (B19 Theorems 0.3, 0.4, 0.6, Assumptions 4.1 and 6.1, the end of the proof of Proposition 4.4, Propositions 5.5, 7.1 and 0.7, Lemma 6.4; BEC05 §3; EKM 97.2, 37.7, 19.5; MVH98 4.4 and 1.3; BW20 2.9; VA13 Remark 1.11). The longest shared runs are seven words, inside hypothesis lists (README §6.2 against B19 line 1111; README §6.7 against B19 line 1157); the README's statements are reworded and reordered. No table, figure or list of examples is taken over.

**Copyright, arrangement.** B19 has the largest share. Its sections against the layers, by number: Layer 2 ↔ §1 (with CT05 §3 and BEN18 §1 added), Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8; Layers 0 and 1 have no counterpart (B19 §2 is delegated to suppliers). The correspondence is not in the same order (Layers 4 and 5 are transposed) and not one to one (§6 is split), and the *Needs:* lines force 3 before 4 and 5 (§§4.2, 5.1 need §3.2), both before 6 (§6.13), 6 before 7 (§7.2), and 7 and 8 before 9 (§§9.6, 9.7). Not raised as a finding; recorded for the human reviewers.

Source independence: 18 passages compared with 6 sources, none shared beyond seven-word runs in hypothesis lists; largest share B19, 132 of 250 locators; contents compared with B19: order and scope differ at Layers 0–2, 4–5 and 6–7, layers 3, 8 and 9 have the scope of B19 §§3, 7 and 8, the order is forced by the dependency lines named above: independent.

## Not verifiable

- The thirteen uncertified sources (BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85): cited by locator only; their statements were not read. The targets §§6.5, 6.6, 9.13 and the BCR example of §9.12 rest on them.
- The failure of B19 Proposition 4.4 claimed in the §5.5 Check (τ ≠ 0 on the Enriques example): the combinatorics were recomputed (table above); the criterion "τ = 0 iff c_Ψ ∈ J|_Ψ" it is fed into is the roadmap's own §5.5 and was checked only for internal consistency with §§3.6, 5.3, 5.4.
- VOI06 Proposition 9 at the generality of §2.5 (a threefold fibred in rational curves over a surface with H²·K_X < 0): the statement was read (VOI06 line 773); its proof, which refers back to earlier propositions of that paper, was not checked.
- Elaboration: no Lean command is given in this brief, so the nine signatures were compared with the README through the supplied transcript, not re-elaborated.
- The entries E1, E2, E4–E24 and E26 of the README's "Source corrections" were not re-derived against the source texts in this pass; E3 and E25 were (see "Source issues").
- The step "only ADE singularities" of §9.12 and the sign argument of §9.14 were read against B19 pp. 107–108 for the statement, not recomputed.

## Source issues

- **Error** in B19 at proof of Proposition 4.4, after (4.8), printed page 84: the source says the degree-one component of ζ on Ψ equals that of e once the lift has zero degree-one component there; it should be the product of the degree-zero component of the lift with [e]₁, which vanishes where the class evaluates to 0; affects the proof.
- **Error** in B19 at Theorem 0.6 (ii), printed page 65: the source says the criterion includes one nonempty half with an odd number of components of odd Euler characteristic; it should be dropped, since χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2 makes that number even; affects nothing.

## For the human reviewers

- **Scope.** The layers 3, 4, 5, 6–7, 8, 9 correspond to B19 §§3, 5, 4, 6, 7, 8 (`packages/RealSurfacePeriodIndex/README.md:1011–2391`); 132 of 250 locators are to B19. Whether this is the roadmap's own organisation is yours to judge.
- **Scope.** Source correction E3 (`README.md:2723`) states that the published Proposition 4.4 of B19 fails for some Ψ, by a counterexample constructed in the README (§5.5 Checks); no published correction is cited.
- **Ownership.** QuadraticFormInvariantsPartII at its open head still plans C_i fields and Tsen–Lang (its §§5.1, 5.4–5.6) and names this roadmap, as "Layer PI.0", as their consumer; the README here states the reverse. An earlier repair report marked this not actionable in this package.
- **Licence.** BEC05 is cited from a preprint-server copy (LAG preprint 154, `sources.toml`); the README gives no journal reference for it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2f325ff815572badacb1119829db648e9de3e342", "job": "RT-RealSurfacePeriodIndex~1a", "model": "fable", "worker": "chris-x26"} -->
