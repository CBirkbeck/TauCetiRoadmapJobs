<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6902191141 -->
Review (claude) of d539f22

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a Check of §9.12 contradicts the statement of §9.12

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2626` (§9.12 Checks): "The four components are not separated by the sign of any rational function on S (BCR Example 15.2.2), unlike real loci of surfaces over ℝ."

   **Claim.** No rational function on S has different signs on different components of S(K).

   **Witness.** Same section, README:2606: the four components are "distinguished by the signs of u/w and v/w". The function u/w is positive on two components and negative on the other two. B19 lines 1802–1804 state the weaker fact: one component against the other three.

   **Exact repair.** Replace the Check by: "No rational function on S is positive on one of the four components and negative on the other three (BCR, Example 15.2.2; for the component Ξ of §9.13 this is the case f = g of the sign argument of §9.14), although u/w and v/w tell the components apart in pairs; over ℝ a single component of the real locus is always cut out by the sign of a rational function (§6.6 (a))."

   **Repair test.** u/w: signs (+, +, −, −) on the components (u, v) = (++, +−, −+, −−), two against two; v/w: (+, −, +, −); uv/w²: (+, −, −, +). None is one against three, so the repaired Check agrees with README:2606. §9.14 steps 2–4 use only the property "x ∈ Ξ iff f(x) > 0 or g(x) > 0", so they exclude f = g positive exactly on Ξ. Over ℝ, §6.6 (a) gives a function with any prescribed locally constant signs.

2. **F02** (P3) four works of the manifest are not cited under their keys; one is not cited at all

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2759` (References, BRE97) with `sources.toml` (`BRE97`, `cited_for = ["Layer 4"]`); README:1301 (§4.6 step 4): "(connecting maps commute with cup products)"; README:1633 (§6.3): "(Golubitsky–Guillemin III.3.11)"; README:1826 (§6.12): "citing Dimca 1985, Lemma 4"; README:2511 and 2567 (§§9.7, 9.10 Checks): "(Degtyarev–Itenberg–Kharlamov classification)".

   **Claim.** Every work of the References is cited in the text by its key and locator, and the manifest's `cited_for` says where.

   **Witness.** The string BRE97 (or "Bredon") occurs once in the README, in the References; Layer 4 never cites it. GG73, DIM85 and DIK00 also occur only in the References: the body names the authors, and the two DIK Checks carry no locator. The manifest records "Chapter II, Theorem 7.1 (c)", "Chapter III, Theorem 3.11", "Lemma 4", "Appendix C".

   **Exact repair.**

   - §4.6 step 4: replace "(connecting maps commute with cup products)" by "(connecting maps commute with cup products: BRE97, Chapter II, Theorem 7.1 (c))".
   - §6.3 step 2: replace "(Golubitsky–Guillemin III.3.11)" by "(GG73, Chapter III, Theorem 3.11)".
   - §6.12 locator: replace "citing Dimca 1985, Lemma 4" by "citing DIM85, Lemma 4".
   - §9.7 Check: replace "(Degtyarev–Itenberg–Kharlamov classification)" by "(DIK00, Appendix C)"; §9.10 second Check: replace "(Degtyarev–Itenberg–Kharlamov)" by "(DIK00, Appendix C)".

   **Repair test.** B19 line 1009 cites Bredon, Chapter II, Theorem 7.1 (c) for exactly the step of §4.6 (the composite (5.6) is a cup product); B19 line 1128 cites Golubitsky–Guillemin, Chapter III, Theorem 3.11 for §6.3; B19 line 1258 cites Dimca, Lemma 4 for the equivariant Ehresmann step; B19 lines 81–82 cite Degtyarev–Itenberg–Kharlamov, Appendix C. After the repair each of the 23 keys occurs in the body and `cited_for` of BRE97 is true. No manifest entry changes.

3. **F03** (P3) Λ names two different objects in consecutive steps of §6.13

   **Location.** `packages/RealSurfacePeriodIndex/README.md:1863–1864` (§6.13 steps 5–6): "The image of H²_G(T(ℂ), ℤ(1)) in Λ = H²(T(ℂ), ℤ(1))^G has finite index m" and "For some x ∈ Λ(ℝ), ν is of type (1,1) on T_x."

   **Claim.** The x of step 6 lies in the real parameter neighbourhood of §§6.9 and 6.12.

   **Witness.** In step 5, Λ is the lattice of invariant integral classes; Λ(ℝ) of that object is undefined, and T_x needs x ∈ B(ℝ). The parameter neighbourhood Λ of §6.9 (README:1753) and §6.12 (README:1826) is never introduced in the proof of §6.13.

   **Exact repair.** In step 5 write the lattice as Γ_T: "The image of H²_G(T(ℂ), ℤ(1)) in Γ_T = H²(T(ℂ), ℤ(1))^G has finite index m (AlgebraicTopologyPartII §16.3); for y ∈ Γ_T in the rational subspace …" (rest unchanged), and replace "Apply §6.9 to H = H²_van with the class" by "Apply §6.9 to H = H²_van, on a G-stable neighbourhood Λ of s as in §§6.9 and 6.12, with the class". Step 6 then reads correctly as it stands.

   **Repair test.** For p : ℙ¹ × ℙ¹ → ℙ² branched along a conic (the instance of the §6.10 Checks): Γ_T ⊂ H²(T, ℤ(1)) = ℤ², the vanishing lattice is ℤ(1, −1), and m·Γ_T ∩ ker p_* is a full lattice of the line ker p_* ⊗ ℝ; x ranges over the real conics near s, a subset of B(ℝ). The two symbols no longer collide and no statement changes.

Three findings, all P3 (no P1, no P2). The four round-7 findings are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, no statement is padding, every pinned locator resolves, and the dependency check is clean. No package file was changed by this review.

## Verified sound

### Round-7 findings

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01 (P3), index under infinite extensions | README:447 "for every field extension L/K, finite or not, per(α_L) divides per(α) and ind(α_L) divides ind(α); and for a finite extension L/K, ind(α) divides [L : K]·ind(α_L)"; step 3 (README:453); two API bullets (README:462–463); Check (README:474); §7.8 step 2 (README:2028) and its *Needs:* line (README:2035) | **Repaired.** ℝ ⊂ ℂ(t), Hamilton class: ind 1 divides 2, per 1 divides 2. ℝ ⊂ ℝ(t): 2 divides 2 (⟨1,1,1,1⟩ anisotropic over a real field). `baseChange_mk`, `deg_baseChange`, `index_dvd_deg` opened at the pin (list below). §7.8: K_i ⊂ K algebraic, ind(α) divides ind(α_i) = 2 and per(α) = 2 divides ind(α), so ind(α) = 2. |
| F02 (P3), smooth implies regular | README:65 "regular by `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (same file, line 90 …)"; §1.9 step 1 (README:748) and *Needs:* (README:759); §3.1 step 3 (README:1018) names the pinned Serre criterion | **Repaired.** `Scheme/Regular/Scheme.lean:90, 118, 200` and `SerreCondition/Normal.lean:214` carry the cited names. z² = xy: singular locus the origin, codimension 2, so R₁ and normal; z² = x²y: singular along a line, R₁ fails. |
| F03 (P3), nontriviality | README:44 "a nontrivial ordered ring without zero divisors is strictly ordered" | **Repaired.** Zero ring excluded; `Algebra/Order/Ring/Defs.lean:107` carries the name. |
| F04 (P3), the Check of §7.7 | README:2014–2015, two Checks | **Repaired.** ℙ²_ℝ: Pic/2 = ℤ/2, Br[2] = ℤ/2, four classes, two over the Hamilton class, with first components 0 and h; ind = per = 2. |

The repaired patterns were searched in the rest of the text: every other use of §0.12 is a finite extension or the Ω of §1.8, covered by the new statement; no other roadmap section is cited for a pinned declaration; the remaining uses of orientability (§§9.6, 9.9) are on real Enriques surfaces, where it is what makes cl_R onto.

### Coverage

The whole README was read this round (Summary to References, 2760 lines), including Layer 4 and §§6.9–6.12, which round 7 had not re-read.

### Adversarial table (sampled targets, headlines, sections not re-read in round 7, findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.3 no topological obstruction | S = ℙ²; S Enriques, n = 2 | H³(ℙ²) = 0. In general i_*i* = ∪ dn·c₁(H) kills n-torsion; H³(T) ≅ H₁(T) ≅ H₁(X) ≅ H⁵(X) since H_j(X, T) = 0 for j < 3. Enriques: τ_S of order 2, 2d·c₁(H) ∪ pr₂*τ_S = 0 | sound |
| §2.9 de Jong, char 0 | (x, y) over ℂ(x, y) and ℚ̄(x, y); per l², l prime | ind = per = 2 (⟨1, −x, −y, xy⟩ anisotropic by Springer twice). β = lα has period l, E of degree l splits β, α_E has period dividing l, so ind(α) divides l·l | sound |
| §3.6 equivariant pushforward | i ≥ 5; S(ℝ) = ∅ | H^q(G, ℤ(j)) ≠ 0 for q > 0 iff q ≡ j mod 2, so only H¹ of the real locus survives. S(ℝ) = ∅: I = 0, condition empty, p_* onto, as §3.5 gives for i = 2 | sound |
| §4.1 | ℙ², A = O(1), l = 2, R a line, N = O and N = O(−1) | L = O(1) very ample; c = x² + y² + z², conic meeting R in two conjugate points. N = O(−1): L = O, not very ample | sound |
| §4.2 | twist of the kernel; base locus | L²(R)(−C) = L ⊗ N, H¹ = 0, so rg² lifts. Base locus of {a₁s₀ + a₂c} is C ∩ {rg² = 0}, finite; at a₁ = 0 the zero locus is C ∪ {a₂ = 0}, smooth and transverse to R at base points | sound |
| §4.5 normal-bundle bound | twists; ℙ² instance | L(−C) = N(−R); T_{X/S} = O(2) ⊗ L⁻¹ (det of O(1) ⊕ O(1) ⊗ L⁻¹), restricting to L on C. ℙ², C a conic: L restricted to C is O_{ℙ¹}(2), A^l restricted is O_{ℙ¹}(4), both H¹ = 0, and h²(O) = 0: 0 ≤ 0 | sound |
| §4.6 | dualizing sheaf; kernel | O(T̄) = O(2)(R), K_X̄ = K_S ⊗ L ⊗ O(−2), so ω = K_S ⊗ L(R). Kernel of restriction to C is H⁰(K_S ⊗ N) = 0; ψ onto by H¹(L) = H¹(R, N) = 0 | sound |
| §4.7 Check | quartics containing a line | 34 − 5 + 4 = 33: a divisor, codimension h^{2,0} = 1 | sound |
| §4.8 | three maps | first two: H⁰(L²(R)) onto H⁰(C, L²(R)) by H¹(L ⊗ N) = 0; third has cokernel ≤ h¹(N_{C/X}) ≤ h²(O_S); fourth onto by §4.6 | sound |
| §4.9 | twists on the blow-up | N ⊗ K_{S′} = μ*(A₀ ⊗ K_S)(3F − E), sections = H⁰(A₀ ⊗ K_S ⊗ I_P); N⁻¹ ⊗ K_{S′}(R′) = μ*(…)(3E − F), sections = H⁰(… ⊗ I_Q). A₀ = O(2) on ℙ²: cl_R(N) = 0; A₀ = O(1): μ*h ≠ 0 | sound |
| §6.4 blow-ups | torus, loops a, b, c = a + b | pairwise intersection numbers 1, 1, 1; three double points; Ξ′ = T² # 3ℝℙ², H¹ = 𝔽₂⁵; strict transforms μ*a + e₁ + e₂, μ*b + e₁ + e₃, μ*(a + b) + e₂ + e₃, total 0, and with e₁, e₂, e₃ they span 𝔽₂⁵. Two loops: total a + b ≠ 0, (ii) fails | sound; matches B19 lines 1129–1154 |
| §6.9 real Green criterion | ten-sphere quartic | Nikulin invariants from g = (22 − r − a)/2 = 0, k = (r − a)/2 = 9: r = 20, a = 2, so the (−1)-eigenlattice has rank 2 and signature (2, 0), and its (1,1) part has rank 1 | sound; BEN18 lines 119–123, 198–208 |
| §6.10 vanishing variation | ℙ¹ × ℙ¹ → ℙ²; conic on ℙ² | p*h = (1, 1), vanishing lattice ℤ(1, −1), det((1,1),(1,−1)) = −2. λ_van = λ − p*h, p_*λ_van = 2h − 2h = 0. Image of ∇λ in the vanishing part with cokernel ≤ h²(O_S) = dimension of the constant part: onto | sound |
| §6.11 strata | fibre over a smooth point of R off D | sw² = 0 with s ≠ 0 gives w = 0: one point, on {r = w = 0}, the same curve for every x; conjugation permutes the exceptional curves, so the strata are invariant as unions | sound |
| §6.12 Check | ℙ¹ × ℙ¹ → ℙ², α = 0 | β = cl(O(1, 0)) reduces to (1, 0) ≠ 0 = p*α̃; the normalisation subtracts it | sound |
| §6.13 lattice step | y in the lattice with real class in ker p_* | my is the image of an equivariant class with zero constant component; ε₁ = ½·p*cl(θ) of type (1,1) | sound; R03 on the notation |
| §7.5 real closures to real points | Hamilton class; the field ℝ((z₁))((z₂)) | Br(ℝ) → Br(ℝ[[z₁, z₂]]) → Br(K) sends (−1, −1) to a nonzero class; ℝ((z₁))((z₂)) has uncountable transcendence degree over ℝ(U), so its real closure is not a real closure of ℝ(U); the relative algebraic closure is | sound; the README closes a gap of the source (Source issues) |
| §7.11 rank five | K = ℝ(x, y, z with x² + y² + z² = −1) | (1, x, y, z, 0) is a zero of ⟨1, 1, 1, 1, a⟩: 1 + x² + y² + z² = 0. Dimension 4 is anisotropic on ℂ(x, y)-type examples (§7.9), so 5 is the threshold | sound |
| §8.1 finite-flat open | z² = f, α = (−1, f) | p(T(ℝ)) = {f ≥ 0}, Θ = {f < 0}, disjoint; p*α = (−1, z²) = 0 | sound |
| §8.2 branch multiplicities | n = 2; n = 4 with fibre types (2,1,1), (2,2), (3,1), (4) | m = 1; m = 1, 2, 2, 3 with monodromy a transposition (odd), a double transposition (even), a 3-cycle (even), a 4-cycle (odd): parity of m equals parity of the permutation | sound; B19 lines 1395–1419 |
| §8.5 circle cover | n = 2; n = 4 | n = 2: Q(1) = ℤ trivial, cokernel of 1 ↦ (1, 2) in 𝔽₂ ⊕ ℤ, where (0, 1) has order 4: ℤ/4. n = 4: Q(1)^G = ℤf₁ ⊕ ℤf₂, relations (1; 1, −1), (1; 1, 1), quotient of order 4 with 2(0; 1, 0) = r₁ + r₂ and 2(0; 0, 1) = r₂ − r₁: 𝔽₂² | sound; B19 lines 1532–1534 |
| §9.4 period four | α of period 4 | α_ℂ = 0 would give 2α = cor(0) = 0; so α_ℂ has period 2, index 2, and ind(α) divides 2·2 and is divisible by 4 | sound |
| §9.5 empty half | four classes of H¹_G | 0, c with [c]₀ = 1, two lifts with [·]₀ the indicator of the other half; S(ℝ) = ∅: all restrictions zero, uniqueness fails, as the standing line says | sound |
| §9.8 deg(w₁²) = 0 | independent route | χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2 (free orbits come in pairs), so the number of components of odd Euler characteristic is even. 4ℝℙ² (§5.5): four, even | sound; MVH98 lines 500–540 |
| §9.9 one nonempty half | deg([α̃]₁ ∪ w₁) = 1 | then deg([α̃]₀ ∪ w₁²) = 1, an odd number of odd components in Θ, even in total, so some Σ outside Θ; deg(a ∪ w₁) = 1 + χ(Σ) = 0 | sound; B19 lines 1791–1799 |
| §9.12 K3 double plane | singular points of the sextic over K | affine critical points have u² = v² = 1/3, value 1/27 − t ≠ 0; at infinity two points with local form z² = −v² − t w⁶, type A₅, with no K-points on the resolution. Real points: (1 − u² − v²)u²v² ≥ t, four regions | sound; R01 on a Check |
| §9.14 not a quaternion class | u/w, v/w | each positive on two components, not on one; ind divides 2·2 by §2.10 | sound; B19 lines 1814–1833 |
| `index_eq_orderOf_of_isAlgClosed` | ℂ(x, y): 0 and (x, y) | 1 = 1; 2 = 2 | sound |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | Albert class over ℝ(x, y) | index 4 divides 2·2 | sound |
| `index_eq_orderOf_of_not_isSemireal` | ℝ(x, y) control | Albert class: 4 ≠ 2, so the hypothesis is needed | sound |
| `index_eq_orderOf_of_forall_isRealClosed` | nonreal K; Albert class | hypothesis vacuous, reduces to the previous theorem; Albert class survives where x < 0 | sound |
| `not_anisotropic_of_hasZeroTotalSignature` | 5⟨1⟩ over ℝ(x, y) | anisotropic, and 2·dim W = 5 is impossible: the predicate fails, as it must | sound |
| `exists_anisotropic_hasZeroTotalSignature` | ⟨1, y₁, −y₂, −y₁y₂⟩ | signature 1 + 1 − 1 − 1 = 0; isotropic plane over every real closed R, 2·2 = 4 | sound |
| `not_anisotropic_of_not_isSemireal` | as §7.11 | explicit isotropic vector above | sound |
| `exists_common_zero_of_not_isSemireal` | dimension 4; real K | q₁ = x₁² − a x₂², q₂ = x₃² − a x₄² with a a nonsquare: no common zero in dimension 4. ℝ(t), q₁ = q₂ = 5⟨1⟩: none, so nonreal is needed | sound |

### Sources: the seeded sample

B19 page N of the file is printed page 62 + N. The author flagged no locator as unverified.

| Target | Locator read | Outcome |
|---|---|---|
| 2.3 | B19 lines 263–279 (Lemma 1.3, pp. 69–70) | supported |
| 2.9 | B19 lines 24–25 (Theorem 0.1, p. 63); 198–200 (§0.6, p. 68) | supported; the source states every characteristic, the target characteristic zero, as its title says |
| 3.6 | B19 lines 639–666 (Proposition 3.3, p. 79) | supported, same hypotheses |
| 4.5 | B19 lines 976–988 (Lemma 5.3, p. 87) | supported |
| 6.4 | B19 lines 1129–1154 (Lemma 6.3, p. 91) | supported |
| 7.5 | B19 lines 1320–1328 (p. 96) | supported; the README's step 3 repairs the source's use of a non-algebraic real closed extension |
| 7.11 | B19 lines 123–124 (Theorem 0.10, p. 66) | supported; BCR §4.1 not read |
| 8.1 | B19 lines 1350–1351 (§7.1, p. 96); 1413–1414 (p. 98) | supported |
| 8.2 | B19 lines 1395–1419 (§7.2, pp. 97–98) | supported |
| 8.5 | B19 lines 1472–1540 ((7.5)–(7.9), Lemma 7.5, pp. 99–101) | supported, including the stalks |
| 9.4 | B19 lines 1748–1753 (p. 106) | supported |
| 9.5 | B19 lines 1767–1775, 1782–1784 (pp. 106–107) | supported |
| 9.8 | MVH98 lines 500–540 (Proposition 4.2, Theorem 4.4, p. 12 of arXiv v1); B19 lines 77–80, 1784–1790 | supported; the deduction deg(w₁²) = 0 is the README's own and is confirmed by the Euler characteristic congruence |
| 9.9 | B19 lines 1791–1799 (p. 107) | supported |
| 9.14 | B19 lines 1814–1833 (pp. 107–108) | supported |

Also read: B19 lines 43–53, 65–69, 106–107, 138–147 (Theorems 0.3, 0.4, 0.5, 0.12, 0.13, Proposition 0.7), 234–290, 1107–1128, 1257–1283, 1305–1338; BEN18 lines 100–140, 183–208, 245–250. A mechanical comparison of the 104 B19 locators of the form "item a.b, p. N" with the printed pages gave 95 exact and 9 inside multi-page sections, each of which I confirmed (§0.5 p. 66, §0.6 p. 68, §6.4 p. 96, §5.1 pp. 86–87). All 23 cited works have a manifest key; no entry was added or changed.

### Lean

`lake env lean` on `packages/RealSurfacePeriodIndex/Suggested.lean`, from the content checkout: exit 0, eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else.

Padding probe on a scratch copy: each of the eight theorems tried with `simp`, `rfl`, `infer_instance`, `exact?`, `aesop`, `intros; simp_all`, `decide`, `omega`, each wrapped in `fail_if_success`; exit 0 with no error, so no probe closes a goal. `#check @name` for all nine declarations in the same file: every binder of the README statements is present; nothing changed. `not_anisotropic_of_not_isSemireal` and `index_eq_orderOf_of_not_isSemireal` follow mathematically from the two theorems before them, but not in one tactic, and each is a numbered theorem of the source.

Headlines: Theorem 0.1 and the norm bound, 0.3, 0.4 (birational form), 0.10, 0.12 (two statements) and the pair-of-quadrics form of 0.13 are stated; the scheme form of 0.4, Theorems 0.5 and 0.6, Proposition 0.7 and the del Pezzo form of 0.13 are named in the docstring with the missing carriers. The backticked names of the README's own are the nine declarations of the file. No `set_option`, no sorry'd data, no `lemma`, no example. Imports: `Mathlib` and the three Tau Ceti modules used.

Remark, no change asked: `not_anisotropic_of_not_isSemireal` and §7.11 keep the finite generation of the source's Theorem 0.10, which §7.8 shows is not needed; README and Lean agree and are at the source's generality.

### Pinned declarations opened this round

All 62 file-and-line locators of the Mathlib and Tau Ceti contracts were compared with the pinned files; each line carries the cited name. Mathlib: `Algebra/BrauerGroup/Defs.lean:100`; `Algebra/Order/Ring/Ordering/Defs.lean:40, 54, 61, 115, 287`; `Algebra/Order/Group/Cone.lean:63`; `Algebra/Order/Ring/Cone.lean:25, 28, 33`; `Algebra/Order/Ring/Ordering/Basic.lean:88`; `Algebra/Order/Ring/Defs.lean:107`; `LinearAlgebra/QuadraticForm/Signature.lean:65, 98, 121, 133, 243`; `Algebra/Ring/Semireal/Defs.lean:38`; `FieldTheory/IsRealClosed/Basic.lean:52, 80`; `LinearAlgebra/QuadraticForm/Basic.lean:1054`, `TensorProduct.lean:128`, `IsometryEquiv.lean:177`, `Real.lean:78`; `Algebra/QuadraticAlgebra/Defs.lean:44, 387, 405` and `Discriminant.lean:54`; `RingTheory/Morita/Matrix.lean:187`; `RingTheory/AlgebraicIndependent/Basic.lean:45`; `RingTheory/EssentialFiniteness.lean:40`; `RingTheory/Ideal/KrullsHeightTheorem.lean:282`; `Topology/Compactness/Compact.lean:1172`; `AlgebraicGeometry/AffineScheme.lean:303`. Tau Ceti: `Algebra/BrauerGroup/Group.lean:139, 174`, `BaseChange.lean:136, 148`, `Division.lean:69`, `Real.lean:102`; `Algebra/CentralSimple/Index.lean:99, 112, 196, 255`, `BaseChange.lean:109`; `RingTheory/RegularLocalRing/DimensionTwo.lean:202`; `AlgebraicGeometry/Scheme/Regular/Scheme.lean:90, 118, 200`; `RingTheory/SerreCondition/Normal.lean:214`; `Algebra/CrossedProduct/Comparison.lean:274, 317`; `LinearAlgebra/QuadraticForm/Hyperbolic.lean:76`, `BaseChange.lean:389`, `RegularFormClass/Signature.lean:52, 66, 111, 140`, `Witt/Signature.lean:133`; `Algebra/Order/Ring/Ordering/Extension.lean:62`, `Map.lean:64, 85, 105`; `FieldTheory/RealClosure/Basic.lean:120`.

Duplication by object: the pinned libraries have no space of orderings, no C_i predicate, no u-invariant, no Amer–Brumer or Springer theorem, and no statement relating `orderOf (BrauerGroup.mk A)` to `Algebra.index` beyond the order-two lemmas of `Algebra/BrauerGroup/Group.lean:258`.

### Suppliers, direction and ownership

Dependency check, whole output:

    depcheck: 240 roadmaps, 2267 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `roadmaps resolve` lists nothing found nowhere, and `scratch/overlaps.md` lists no dropped id, no revision-only id and no conflicting head.

Citations resolved now, at main or at the open head: MotivesAndAlgebraicCycles §0.5b, §7.6a, §7.6b, §7.8, §7.10 (the last states H¹_alg = w₁^⊥ and cl_R(K_X) = w₁ for real Enriques surfaces; §7.8 uses the torsion-free cokernel inside its divisor theorem, as the gap says); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3, 15.1–15.6, 16.1–16.4 (§16.2 assumes invariant control data, as the gap says; the signs of §15.4 and §16.4 agree with the README); HeightsRationalPointsAndObstructions §2.16b and §2.19a with the four names; ComplexComparisonPartII §§C5.2, C5.3, C6.2, C6.3 with the seven names; EnriquesSurfaces §§1.1, 1.3, 1.4 (an open pull request of another author that adds the roadmap); WeilConjectures Layer WC.7; ShimuraData §3.1; PurityForFlatCohomology §8.4; LefschetzPencilsAndVanishingCycles §0.10; AlgebraicModuliForArithmeticGeometry §§1.1, 1.4 (`amplePowersAndFixedTwists`); RealAlgebraicGeometry Layer 1 (completed, on main); AffineMorseLefschetz A3, A5; FormalLaurentPuiseux L4, L5 (`puiseuxField`, `ramifiedEmbedding`, `puiseuxField_isAlgClosed` in its `Suggested.lean`); PurityOfBranchLocus §2.3; StableReduction Layer 4; AlgebraicTopology Layer 6 (its table maps "Stage 6"); ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8; QuadraticFormInvariants Layers 0, 1, 2, 4, 5; SemisimpleAlgebras under RepresentationTheory; SchemeAndStackFoundations as in round 7. ModularCurves "4D" resolves through main's table of former labels (Layer 4D is Layer 0.9 and Layer 3.6; miracle flatness is in Layer 0.9), which keeps the citation valid.

The three gaps have the same slugs in the README (README:96, 102, 112) and in `design/plan.json`, each with a named supplier and section; each is precise and minimal and none is re-raised.

The only object stated twice is the Tsen–Lang theory: QuadraticFormInvariantsPartII (open, later in the merge order) still states it and names this roadmap as consumer (its README:119, 2030). The round-4 repair report marked this not actionable in this package; the reason holds (the other text must change) and it is not re-raised.

Overlap check: read QuadraticFormInvariantsPartII, AlgebraicTopologyPartII, MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions (open), QuadraticFormInvariants, RealAlgebraicGeometry, SchemeAndStackFoundations (main); the Tsen–Lang theory is shared with QuadraticFormInvariantsPartII and its owner is this roadmap (§0.7), the earlier one; nothing else shared.

### Shape, policy and source independence

Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, ten layers each ending in Examples and Dependencies (108 Checks blocks and 108 *Needs:* lines), Downstream consumers, Source corrections, References. Every section with an API list has at least three Checks. A scan of the three text files for LaTeX delimiters, pull-request numbers, paths, round labels and process words found none; no algorithm.

Arrangement against B19 (119 of the 176 keyed locators), by number: Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6–7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8. Layers 0 and 1 have no counterpart, the source's §2 is left to suppliers, Layers 4 and 5 are in the opposite order to the source, and §6 is split. Not a one-to-one run.

Wording: 18 passages set beside the source at the locators above (§§2.3, 2.8, 3.6, 4.5, 4.6, 6.2, 6.4, 6.9, 6.13, 7.5, 8.1, 8.2, 8.5, 9.4, 9.5, 9.8, 9.9, 9.14 and the docstring of Theorem 0.4). The longest shared run is eight words, in the definition of U₀ (§8.1, B19 line 1413), a hypothesis that can be written in one way only; the remark of §6.9 on the neighbourhood Λ follows the three steps of BEN18 lines 114–116 with at most three consecutive words shared.

Source independence: 18 passages compared with 3 sources (B19, BEN18, MVH98), none shared; largest share B19, 119 of 176 locators; contents compared with B19: independent.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00 are settled uncertified; their texts were not read. In the sample this leaves unread BCR §4.1 (§7.11); for R01 and R02 the statements attributed to BCR Example 15.2.2, Bredon, Golubitsky–Guillemin, Dimca and Degtyarev–Itenberg–Kharlamov were checked only through B19's own citations (lines 1802–1804, 1009, 1128, 1258, 81–82).
- CT05, EKM, BEC05, VOI06, VA13, BW20 and BW20II were not re-read this round; their locators rest on rounds 2 to 7.

## Source issues

Only what was confirmed against the text in this round.

- **Gap** in B19 at proof of Theorem 0.12, printed p. 96: the source says the class vanishes over any real closed extension of the iterated series field; it should pass to the relative algebraic closure of the function field, which is a real closure; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, printed p. 95: the source says the field is the union of the finite extensions of a finitely generated subfield; it should first enlarge that subfield by a transcendence basis; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, lower bound, printed p. 96: the source says two non-proportionality conditions make the two functions local parameters; it should also exclude a vanishing 2×2 determinant; affects the proof.
- **Gap** in B19 at Lemma 1.4, printed p. 70: the source says the reduction of the pushed-forward integral lift is the pushforward of the pulled-back Kummer lift; it should first choose the integral lift with that reduction; affects the proof.
- **Error** in B19 at Theorem 0.6 (ii) and its proof, printed pp. 65, 107: the source says one nonempty half with an odd number of odd-Euler-characteristic components gives index 4; that case cannot occur, the Euler characteristic of the real locus being even; affects nothing.
- **Misprint** in B19 at proof of Theorem 0.6, printed p. 107: the source says the class with zero degree-zero component is unique; it should say the unique nonzero class; affects nothing.
- **Misprint** in B19 at proof of Proposition 7.1, printed p. 103: the source says the pulled-back lift is the reduction of the sum of the two terms; it should be their difference, by the sign of the trace sequence; affects nothing.
- **Misprint** in B19 at proof of Proposition 0.7, printed p. 107: the source says the quaternion class lies in the Brauer group of the function field over the reals; it should be over the Puiseux field; affects nothing.
- **Gap** in B19 at proof of Proposition 0.7, printed p. 108: the source says the signs are constant near one fixed point and near points avoiding poles; it should take general points avoiding zeros and poles of the unit parts; affects the proof.

## For the human reviewers

- **Ownership.** QuadraticFormInvariantsPartII (open; its README:119, 2030, §5.6) and this package (§0.7) each state the Tsen–Lang theory and each names the other as consumer; this package is earlier in the merge order.
- **Scope.** `packages/RealSurfacePeriodIndex/README.md:24` and source corrections E3 and E25 replace Propositions 4.4 and 4.5 of the refereed source B19 by other criteria and call Theorem 0.6 (ii) vacuous; no refereed source states these corrections.
- **Licence.** EKM is read from an author page, BEC05 and VA13 from institutional hosts (`sources.toml`, classes `author-page` and `institutional`); thirteen works are cited by locator without their text.
- **Supplier outside the merge order.** EnriquesSurfaces §§1.1, 1.3, 1.4 is consumed from another author's open pull request that adds the roadmap; it is not listed in `merge-order/ORDER.txt`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d539f22f0b4fbb17aecd7b67d4056bfa1473d2fa", "job": "REV-PKG-RealSurfacePeriodIndex~8", "model": "fable", "worker": "chris-x79"} -->
