<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6896074903 -->
Review (claude) of eb13029

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §7.6 obtains quasi-projectivity from three results that nobody owns

   **Location.** `packages/RealSurfacePeriodIndex/README.md:1976` (§7.6, hypotheses line): "U is quasi-projective (a smooth separated surface over a field is, by Nagata compactification, resolution of surface singularities and Zariski's projectivity of smooth proper surfaces)". Step 1 (line 1982) then applies ResolutionOfSingularitiesCharacteristicZero §6.2 to U.

   **Claim.** The route to Theorem 0.4 in its scheme form may compactify an arbitrary connected smooth surface U by §6.2.

   **Witness.** `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:895` states §6.2 for "a smooth quasi-projective finite-type variety U". The §7.6 *Needs:* line (README:1991) cites no supplier for Nagata compactification or for projectivity of smooth proper surfaces; a search of the READMEs on main finds no owner of the latter, and neither is a target here.

   **Exact repair.** The three inputs are not needed. Replace the hypotheses line by: "U connected smooth over ℝ, not necessarily proper and not assumed quasi-projective: the proof passes to a nonempty affine open." Replace step 1 by: "Replace U by a nonempty affine open U′ ⊂ U. It is a connected smooth quasi-projective surface with ℝ(U′) = ℝ(U), α restricts to Br(U′), and α_x = 0 for x ∈ U′(ℝ) ⊂ U(ℝ); period and index depend only on the class of α in Br(ℝ(U)). Compactify U′ to a connected smooth projective S with ℝ(S) = ℝ(U) (ResolutionOfSingularitiesCharacteristicZero §6.2); then U′ ⊂ U_α." In step 2 read U′ for U. Add the Check: "For U = S = ℙ²_ℝ and U′ = 𝔸²_ℝ, the complement of U′(ℝ) in ℝℙ² is a line, with empty interior, so a class vanishing on U′(ℝ) has Θ(α) = ∅: passing to the affine open loses nothing."

   **Repair test.** On the refuting instance (U smooth, separated, with no projective embedding given) a nonempty affine open exists and is closed in some 𝔸ⁿ, hence quasi-projective, so §6.2 applies as stated. S ∖ U′ has dimension ≤ 1, so U′(ℝ) is dense in the surface S(ℝ) and the clopen set Θ(α) ⊂ U_α(ℝ), which misses U′(ℝ), is empty; §7.3 then gives ind = per for the same class. The same sentence stands in `packages/RealSurfacePeriodIndex/design/README.md:2373`; the design is not re-opened, only the package README changes.

2. **F02** (P3) `cartierClass_picard_equiv` is not in SchemeAndStackFoundations on main

   **Location.** `packages/RealSurfacePeriodIndex/README.md:71` (supplier contract): "§3.4 (Picard groups through Cartier and Weil divisors, `cartierClass_picard_equiv`, hence surjectivity of Pic(S) → Pic(V) for a dense open V of a smooth S)".

   **Claim.** SchemeAndStackFoundations §3.4 defines `cartierClass_picard_equiv`.

   **Witness.** Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5967–6021` (§3.4) has no such name, nor has its `Suggested.lean`; it cites Tau Ceti's `classGroupAddEquivLineBundleClass` and states `classGroup_picard_locallyFactorial` and `picard_excision_sequence`. The old name survives only at the head of open revision #1808 (its README:4959), which is why the citation resolver was silent.

   **Exact repair.** A roadmap on main is cited as it is on main. Replace the parenthesis by: "§3.4 (Picard groups through Weil divisors: `classGroup_picard_locallyFactorial`, Pic → Cl is bijective on a locally factorial scheme, and `picard_excision_sequence`, Pic(X) → Pic(U) is onto for X locally factorial and U the complement of a prime divisor; together they give surjectivity of Pic(S) → Pic(V) for a dense open V of a smooth S)". The citations of `SchemeAndStackFoundations §3.4` in the *Needs:* and Dependencies lines stay as they are.

   **Repair test.** For S = ℙ²_ℝ and V = 𝔸², `picard_excision_sequence` reads ℤ → Cl(ℙ²) = ℤ → Cl(𝔸²) = 0 → 0 with 1 ↦ [line], and Pic = Cl on both by `classGroup_picard_locallyFactorial`: Pic(ℙ²) → Pic(𝔸²) is onto, as §1.9 step 1 needs. The 13 other SchemeAndStackFoundations names in the contract were found on main (list under Verified sound).

3. **F03** (P3) pinned cone-order declarations are used and restated without citation

   **Location.** `packages/RealSurfacePeriodIndex/README.md:166` (§0.1 API): "A linear order making F a strictly ordered ring gives the ordering {a : 0 ≤ a}, and every ordering arises this way." README:239 (§0.4 step 2): "ι is strictly monotone from `F_{ι⁻¹Q}` to L_Q."

   **Claim.** These are facts this roadmap proves; the contract (README:43, 67) lists only `exists_le_isOrdering` and `IsOrdering.comap` for orderings.

   **Witness.** Pinned Tau Ceti `TauCeti/Algebra/Order/Ring/Ordering/Map.lean:105`, `Subsemiring.IsOrdering.strictMono_comap`: a field embedding is strictly monotone for the cone orders of f⁻¹(P) and P; line 85 is the converse form. Pinned Mathlib `Mathlib/Algebra/Order/Ring/Cone.lean:28, 33`: `Subsemiring.IsSpanning.nonneg`, `IsOrderedRing.ofSubsemiring`.

   **Exact repair.** Add to "From Mathlib": "`IsOrderedRing.ofSubsemiring` and `Subsemiring.IsSpanning.nonneg` (Algebra/Order/Ring/Cone.lean:33, 28): a pointed subsemiring is the nonnegative cone of an ordered-ring structure, and the nonnegative cone of a linearly ordered ring is spanning." Add to "From Tau Ceti", in the orderings bullet: "`Subsemiring.IsOrdering.strictMono_comap` and `Subsemiring.IsOrdering.strictMono_iff_nonneg_iff_mem_comap` (Algebra/Order/Ring/Ordering/Map.lean:105, 85: a field embedding is strictly monotone for the cone orders of ι⁻¹(Q) and Q, and exactly then ι⁻¹(Q) is the nonnegative cone)". Reword the §0.1 bullet: "The cone order of P (Mathlib `IsOrderedRing.ofSubsemiring`) makes F a strictly ordered field with nonnegative cone P, and conversely the nonnegative cone of such an order is an ordering (`Subsemiring.IsSpanning.nonneg`); both are the pinned constructions." In §0.4 step 2 cite `Subsemiring.IsOrdering.strictMono_comap` at the quoted sentence, and add these names to the *Needs:* lines of §§0.1, 0.3, 0.4 and to the Layer 0 Dependencies.

   **Repair test.** F = ℚ(√2), ι : F → ℝ with √2 ↦ −√2, Q = ℝ_{≥0}: ι⁻¹(Q) is the ordering with √2 < 0, and `strictMono_comap` gives ι(√2) = −√2 < 0, the signature −1 of ⟨√2⟩ computed in the fifth Check of §0.4. No target, statement or Lean signature changes.

Three findings: one P1 (an unowned input in the proof route of §7.6) and two P3 (a supplier name that main no longer defines; pinned declarations used but not cited). The three round-5 findings are repaired. `Suggested.lean` elaborates with `sorry` as the only warning, no statement is padding, and the dependency check is clean. No package file was changed by this review.

## Verified sound

### Round-5 findings

| Finding | Repaired passage | Status and recomputation |
|---|---|---|
| F01, special fibre of the order | §1.6, fourth Check: "its fibre O/tO at t = 0 has dimension 4 … span a two-sided ideal J with J² = 0 … (O/tO)/J ≅ ℂ × ℂ" | **Repaired.** Basis e₁₁, e₁₂, te₂₁, e₂₂; x·y = te₁₁ ∈ tO, y·x = te₂₂ ∈ tO, x² = y² = 0; dim 4, radical 2, quotient 2. Entrywise image has dimension 3. |
| F02, sign of the ternary forms | §0.13 step 3: "the square forms x ↦ x² on the trace-zero quaternions … negatives of the pure reduced norm forms ⟨−a, −b, ab⟩" | **Repaired.** In (−1,−1): i² = −1, Nrd(i) = 1. Pin `TauCeti/Algebra/Quaternion/NormForm.lean:183` gives −a, −b, ab. Common value −1 gives ℝ(√−1) = ℂ; M₄(ℝ) has index 1. |
| F03, docstring locator | `Suggested.lean:88`: "B19 §0.2, p. 63" | **Repaired.** §0.2 begins at B19 line 36, dichotomy at lines 37–39, page 1 of the file = printed 63. The two further docstring locators the repair changed (lines 110–111, 152–153) agree with B19 lines 1301, 1319–1328 (printed 95, 96) and 143–145 (printed 66). |

The pattern of F03 (a locator in a docstring) was rechecked on all nine docstrings; the pattern of F01 and F02 occurs nowhere else (full norm forms ⟨1, 1, −f, −f⟩ in §0.9 and ⟨1, −x, −y, xy⟩ in §1.5 have the right signs).

### Coverage

The README was read in full (ten layers, 108 targets, Source corrections, References). Rows below give values computed in this round for the 15 sampled targets, every headline and every finding.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.1 Harrison space | ℝ, ℂ, ℚ(√2), ℝ(t) | 1, 0, 2 orderings; in ℝ(t) neither t nor −t is a sum of squares. EKM takes H(a) = {P : −a ∈ P} (EKM line 7231); a ↦ −a gives the same topology. | sound; R03 on its last API bullet |
| §0.3 real closure at P | ℝ, ℂ, nonreal F | Br(R) has 2 elements for R real closed; ℂ fails `IsRealClosed`; for nonreal F the vanishing predicate is vacuous. | sound |
| §0.4 signature at an ordering | ⟨1,1⟩, ⟨1,−1⟩, ⟨−1,−1⟩ over ℝ; ⟨1,−t⟩ over ℝ(t); ⟨√2⟩ | 2, 0, −2; 0 for t > 0 and 2 for t < 0; −1 at √2 < 0. | sound; R03 on step 2 |
| §0.5 clopen survival locus | M_d(R), ℍ_R, M_{d/2}(ℍ_R) | Trace-form signatures d(d+1)/2 − d(d−1)/2 = d; −2; (d/2)(−2) = −d. For d = 2: 2 against −2. | sound |
| §0.7 Tsen–Lang | i = 0; d = 1; step 3 count | C₀ ⇔ algebraically closed; N(m+1) unknowns against (dm+c+1)·d^i needs N > d^{i+1}; ⟨1,x⟩ over ℂ(x) anisotropic, so 2¹ is attained. | sound |
| §0.10 Springer | ⟨1,t⟩ and ⟨1,1⟩ over ℂ((t)); ⟨1,−1⟩ ⊥ t⟨1⟩ over ℝ((t)) | Residue forms (⟨1⟩,⟨1⟩) anisotropic; (⟨1,1⟩, –) isotropic; zero (1,1,0) with one isotropic residue form. ⟨1,y₁,−y₂,−y₁y₂⟩ = ⟨1,y₁⟩ ⊥ y₂⟨−1,−y₁⟩. | sound |
| §0.11 Amer–Brumer | ⟨1,1⟩, ⟨1,−1⟩ over ℝ; dimension 4 over ℂ(t) | (t+1)/(t−1) is not a square in ℝ(t); q₁ = x₁² − t x₂², q₂ = x₃² − t x₄² have only the zero common zero. | sound; 5 is sharp in Theorem 0.13 |
| §0.12 period and index | Hamilton, M₂(ℍ), l ∤ per | per 2, ind 2; degree 4, index 2; a splitting L acts on L^d of D-rank [L:K]/d. | sound |
| §0.13 Albert | e = −x₁x₂x₃ | ex₃ ≡ −x₁x₂ ≡ −ab; ex₆ ≡ x₄x₅ ≡ cd iff −x₁⋯x₆ is a square. | sound |
| §1.2 Kummer and Brauer sequences | Spec ℝ, ℙ¹_ℂ | H²(G,ℤ(1)) = 0, H³ = ℤ/2, H¹(G,𝔽₂) = 𝔽₂; ℤ/n = Pic/n, Br[n] = 0; conj(exp(2πik/n)) = exp(−2πik/n). | sound |
| §1.3 real class of a 2-torsion bundle | degree k = 1 | Untwisted Bockstein (a₀,a₁) ↦ (a₀, 0, βa₁); adding ω∪ gives (0, a₁, βa₁), as B19 line 503. | sound |
| §1.6 prescribed degree | c = re, d = me | dim V = mre², rank P = mre²/c = me = d. | sound |
| §1.8 specialisation | local equation at a crossing | s_t/s₁^l = c·ss′·(ss′)^{−l}; (s,s′) = (s, s_t/s₁^l) + (s, −c⁻¹). | sound |
| §2.1 hypersurface family | ℙ², quintic | H²·K_X = 2(A·K − A²): −8; 5 = 5 excluded; deg p_b = dn. | sound |
| §2.6 cones and cosets | ℝ, ℤ, n = 2; ball; ℤ × 0 | 1 ∈ (1 + 2ℤ) ∩ (0,∞); radius ½ ball misses; {y > 0} misses. | sound |
| §3.3 Čech computation | charts (r,x), (s,y) | Monomials r^a x^b with 0 ≤ b ≤ 2a: generated by r, rx, rx². | sound |
| §4.5 normal-bundle bound | twists | L(−C) = N(−R); T_{X/S}\|_C = (O(2) ⊗ L⁻¹)\|_C = L\|_C; h¹ ≤ 0 + h²(O_S). | sound |
| §4.6 dualising sheaf | adjunction | K_X̄ + T̄ = π*(K_S ⊗ L) − 2ξ + 2ξ + R = π*(K_S ⊗ L(R)). | sound |
| §4.7 Kodaira–Spencer | C = ∅; quartic with a line | 0 = 0; h^{2,0} = 1, codimension 1. Boundary lands in H¹(C, N_{C/T}). | sound |
| §5.5 obstruction criterion | Enriques example | det B = 2; 2×2 minors of the Vandermonde rows all ≠ 0; 8 sign vectors modulo ±1 = 4 spheres; c_Ψ = h₁ has sum 1 ∉ J; h₁ + h₂ has sum 0 ∈ J. | sound |
| §6.9 Green over ℝ | (0,2)-part zero; conic on ℙ² | Ω the whole space; p_*λ_van = 2h − 2h = 0. | sound |
| §7.9 anisotropic form | w′ = (w² − 1)/(2w) | w′ ≡ i; w′² + 1 = (w²+1)²/(4w²) ∈ m²; y_j ≡ 2(1+i)z_j mod m². With the source's w, det = 2(1+i)(2(1+i) + c₁ + c₂), zero at c₁ = c₂ = −(1+i). | sound |
| §8.9 even-degree obstruction | n = 4 | ψ(1,0,0,0) = (−3,1,1,1), trace 0; −ψ ≡ (3,3,3,3) = p*(−1) mod 4, +ψ ≡ (1,1,1,1). | sound |
| §9.4 period 4 | MVH98 | Br ≅ (ℤ/2)^{2s−2} ⊕ ℤ/4 when both halves are nonempty (MVH98 line 141). | sound |
| `index_eq_orderOf_of_isAlgClosed` | ℂ(x,y): split, (x,y) | 1 = 1; residue of (x,y) along x = 0 is the nonsquare y, so 2 = 2. Pin `index_eq_one_of_isAlgClosed` needs K itself closed. | sound |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | constant ℍ, Albert class, odd n | 2 ∣ 4; 4 ∣ 4; ind ∣ 2n with equal primes gives ind = n. | sound |
| `index_eq_orderOf_of_not_isSemireal` | ℂ(x,y) over ℝ; ℝ(x,y) | −1 = i²; over ℝ(x,y) Albert's class has 2 ≠ 4, so the hypothesis is needed. | sound |
| `index_eq_orderOf_of_forall_isRealClosed` | Albert class (−1,x) + (y,xy) | Survives where x < 0, or x > 0 and y < 0: hypothesis fails, as it must. Nonreal K: hypothesis vacuous. | sound |
| `not_anisotropic_of_hasZeroTotalSignature` | rank 4 norm form; degenerate form | Threshold 4 < dim is strict; a radical vector is isotropic. | sound |
| `exists_anisotropic_hasZeroTotalSignature` | ⟨1,y₁,−y₂,−y₁y₂⟩ over R | With s² = 1/y₂: (1,0,s,0) and (0,1,0,s) span a totally isotropic plane, 2·2 = 4. | sound |
| `not_anisotropic_of_not_isSemireal` | ⟨1,x,y,xy⟩ over ℂ(x,y) | Rank 4 anisotropic; 5 is the threshold. | sound |
| `exists_common_zero_of_not_isSemireal` | ℂ(t); ℝ(t) | C₁: 2 quadrics, 5 > 2·2 variables; Σx_i² has no zero over ℝ(t). | sound |
| R01 | U′ ⊂ U affine | values in the finding | repair |
| R02 | ℙ² ⊃ 𝔸² | values in the finding | repair |
| R03 | ℚ(√2) → ℝ | values in the finding | repair |

A remark that needs no change: the README's own route (§7.8 has no finiteness hypothesis) proves Theorems 0.10 and 0.13 without `Algebra.EssFiniteType`; the statements keep it, at the generality of B19 lines 123 and 146.

### Sources: the seeded sample

B19 page N of the file is printed page 62 + N; EKM page N is printed N − 8; CT05 page N is printed 378 + N.

| Target | Locator read | Outcome |
|---|---|---|
| 0.1 | B19 lines 1313–1314 (p. 95); EKM lines 7222–7235 (p. 133) | supported; BCR not read |
| 0.3 | B19 line 1310 (p. 95) | supported; BCR §1.3 not read |
| 0.4 | EKM lines 7238–7258 (pp. 133–134); B19 lines 129–131 (p. 66) | supported |
| 0.5 | B19 line 1317 (p. 96), citing Hilfssatz 2 | closedness supported; the README proves clopen itself; ARA75 not read |
| 0.10 | EKM lines 4161, 4209, 4311 (pp. 80, 81, 82); B19 lines 1334–1336 (p. 96) | supported; SPR55 not read |
| 1.2 | B19 lines 255, 260 (p. 69); 522, 528 (p. 76); 1746 (p. 106) | supported |
| 1.3 | B19 lines 485–505 (p. 75); BW20 line 1655 | supported |
| 1.6 | CT05 lines 256–258 (p. 385) | first assertion supported, same hypotheses |
| 2.1 | B19 lines 236–241 (p. 69) | supported |
| 2.6 | B19 lines 321–324 (p. 71); 1253–1262 (p. 94) | the step is used there; the lemma is the roadmap's own |
| 4.5 | B19 lines 976–988 (p. 87) | supported |
| 4.7 | BEN18 lines 232–250 (p. 6), proof p. 7; B19 lines 1021–1030 (p. 88) | supported; SER06 not read |
| 5.5 | B19 lines 748–749 (p. 81), 852–861 (p. 84) | the source's statement and the step the README corrects are as described |
| 6.9 | BEN18 lines 112–135 (pp. 3–4), 187–190 (p. 5); B19 lines 1244–1254 (p. 94) | supported |
| 8.9 | B19 lines 1341–1346 (p. 96), 1653–1672 (pp. 103–104) | supported |

Also read: EKM 17.14 (line 3877, p. 74, any field), 37.8 (line 9272, p. 169), 97.2–97.7 (lines 20227–20284, pp. 385–386), 98.19 (p. 392); BEC05 lines 102–107 (p. 3); VA13 lines 388, 419; BW20 Proposition 2.9 (line 1361). The author flagged no locator as unverified. All 23 cited works have a manifest key; no entry was added or changed.

### Lean

`lake env lean` on `packages/RealSurfacePeriodIndex/Suggested.lean`, from the content checkout: exit 0, eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else. The three imported Tau Ceti object files were present.

Padding probe on a scratch copy: each of the eight theorems was tried with `simp`, `rfl`, `infer_instance`, `exact?` and `aesop` under `fail_if_success`; the copy elaborated with exit 0, so none of the 40 probes closed a goal. `#check @name` for all nine declarations: every binder of the README statement is present (`[IsAlgClosed k] [CharZero k]`, `[IsRealClosed R]`, `[Algebra.EssFiniteType _ K]`, the `trdeg` and `¬ IsSemireal K` hypotheses, `[Invertible 2]`, `[FiniteDimensional K V]`); nothing changed.

Headlines: Theorem 0.1 and the norm bound (§§2.9, 2.10), 0.3, 0.4 (birational form), 0.10, 0.12 (two statements) and the pair-of-quadrics form of 0.13 are stated; the scheme form of 0.4, Theorems 0.5 and 0.6, Proposition 0.7 and the del Pezzo form of 0.13 are named in the docstring with the missing carriers. Object searches at the pin found no scheme Brauer group, no Enriques or del Pezzo carrier, and no Harrison space, u-invariant or C_i predicate. The nine names of the README are the nine declarations. No `set_option`, no sorry'd data, no `lemma`, no example.

### Pinned declarations opened

All 44 file-and-line locators of the Mathlib and Tau Ceti contracts were opened at the pins and match their names. Also opened: `QuadraticAlgebra.finrank_eq_two` (`Mathlib/Algebra/QuadraticAlgebra/Defs.lean:405`), `discr_def` (`Discriminant.lean:54`, b² + 4a), `TauCeti.Algebra.index_eq_one_of_isAlgClosed` (`Index.lean:242`), `puiseuxField` (`TauCeti/RingTheory/LaurentSeries/Puiseux/Basic.lean:70`, an intermediate field of `HahnSeries ℚ K`; `puiseuxField_isAlgClosed` is not at the pin and is correctly cited from the roadmap), and the declarations of R03.

### Suppliers, direction and ownership

Dependency check, whole output:

    depcheck: 245 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Resolved now:

- On main: SchemeAndStackFoundations §§0.1, 0.6, 0.9, 0.17, 2.2, 2.6, 2.11, 2.16, 2.20, 2.22, 3.4, 4.9, 4.11, 4.13, 4.17, 5.4, 5.10 (README lines 706–8625) and 13 of its 14 cited names (`isReflexive_iff_forall_stalk`, `reflexiveHull`, `reflexiveHull.lift`, `ample_serre_vanishing`, `projectiveSpace_cohomology`, `tsen_theorem`, `mk_opposite`, `mk_tensor`, `mk_eq_zero_iff`, `brauer_field`, `brauer_regular_injectivity`, `brauer_kummer_sequence`, `brauer_henselian_local`; R02 is the other); ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8 (lines 791, 893, 1150); AffineMorseLefschetz A3, A5 (534, 1323); FormalLaurentPuiseux L4, L5 (195, 233; `Suggested.lean:45, 71, 250`); QuadraticFormInvariants Layers 0, 1, 2, 4, 5; StableReduction Layer 4; PurityOfBranchLocus §2.3; SemisimpleAlgebras Layer 6; ModularCurves 4D and AlgebraicTopology Stage 6 through their numbering maps; completed RealAlgebraicGeometry Layer 1.
- At open heads: AlgebraicTopologyPartII Layer 6 and §§7.4–16.4 (lines 837–1702; the signs of §15.4 and §16.4 and "given control data" in §16.2 are as the contract says); MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10 (lines 161, 1422, 1435, 1464, 1500); HeightsRationalPointsAndObstructions §§2.16b, 2.19a with their five names; PurityForFlatCohomology §8.4; LefschetzPencilsAndVanishingCycles §0.10; ComplexComparisonPartII C5.2, C5.3, C6.2, C6.3 with eight names; ShimuraData §3.1; EnriquesSurfaces §§1.1, 1.3, 1.4; WeilConjectures WC.7; AlgebraicModuliForArithmeticGeometry §§1.1, 1.4.

The three gaps have the same slugs and sentences in the README and in `design/plan.json`. Each is precise and minimal: C6.3 gives the complex comparison only, and MotivesAndAlgebraicCycles §7.6a compares semialgebraic with Borel cohomology, not étale; §7.8 uses the torsion-free cokernel without naming it; §16.2 assumes invariant control data.

`scratch/overlaps.md` lists no conflicting head, no dropped id and no revision-only id; R02 is one it could not see. QuadraticFormInvariantsPartII (#1834, later in the order) still states C_i fields and Tsen–Lang in its §§5.1–5.6 and says this roadmap takes them from it (its README:119, 2030). The repair report of round 4 marked that finding not actionable in this package; the reason holds and it is not re-raised. No roadmap on main owns a Layer 0 object (searched Harrison, u-invariant, Springer, Amer–Brumer, Albert, Tsen–Lang, Saltman, del Pezzo).

Overlap check: read QuadraticFormInvariantsPartII, AlgebraicTopologyPartII, MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions (open), QuadraticFormInvariants, GlobalQuadraticForms, RealAlgebraicGeometry (main); the Tsen–Lang theory is shared with QuadraticFormInvariantsPartII and its owner is this roadmap (§0.7), the earlier one; nothing else shared.

### Shape, policy and source independence

Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, ten layers each ending in Examples and Dependencies, Downstream consumers, References. Every definition has an API list and at least three Checks; every target has hypotheses, a locator and its own *Needs:* line. No LaTeX delimiters, pull-request numbers, paths or round labels in the README or the Lean file. No algorithm.

Arrangement against B19, by number: Layer 2 ↔ §1, Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layer 6 ↔ §§6.1–6.2, Layer 7 ↔ §§6.3–6.4, Layer 8 ↔ §7, Layer 9 ↔ §8; Layers 0 and 1 have no counterpart and the source's §2 is left to suppliers. The order is not the source's (Layers 4 and 5 are exchanged and independent: their Dependencies lines are "Layer 2; Layer 3" and "Layer 0; Layer 1; Layer 3"), §6 is split by role, and Layer 9 after Layers 7 and 8 is forced by §9.6 and §9.7.

Wording: 18 passages compared (§§0.7, 0.10, 0.11, 1.2, 1.3, 1.6, 2.5, 2.8, 4.5, 4.6, 4.7, 6.9 twice, 7.2, 7.9, 8.9, 8.10 and the docstring of Theorem 0.10). The longest shared run of prose is five words (a standard phrase in §4.6, B19 line 991); the rest is formulas.

Source independence: 18 passages compared with 4 sources (B19, EKM, BEN18, CT05), none shared; largest share B19, 129 of 205 locators; contents compared with B19: independent.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85, DIK00 are settled uncertified: their texts were not read. In the sample this leaves unread BCR Example 7.1.4 a) and §1.3 (§§0.1, 0.3), ARA75 Hilfssatz 2 (§0.5), SPR55 (§0.10) and SER06 Proposition 3.2.9 (i) (§4.7). B19 lines 1317, 1335 and 1021 confirm that the source cites these results at these numbers.
- The head of #1808 was read only at the lines R02 names.

## Source issues

Only what was confirmed against the text in this round; the README's Source corrections list the rest.

- **Gap** in B19 at Lemma 1.4, printed p. 70: the source says an integral lift of the pulled-back class reduces modulo n to the pulled-back Kummer lift; it should first choose the lift with that reduction; affects the proof.
- **Misprint** in B19 at proof of Theorem 1.5, printed p. 71: the source says Voisin's proposition is applied with n = dl; it should use a separate letter, the degree being d times the period; affects nothing.
- **Misprint** in B19 at (5.7), printed p. 88: the source says the normal-sequence boundary lands in degree zero of the normal bundle of the curve in the surface; it should land in degree one; affects nothing.
- **Gap** in B19 at proof of Theorem 0.12, printed p. 95: the source says the field is the union of the finite extensions of a finitely generated subfield; it should first enlarge that subfield by a transcendence basis; affects the proof.
- **Gap** in B19 at proof of Theorem 0.12, lower bound, printed p. 96: the source says two non-proportionality conditions make the two functions local parameters; it should exclude the case where the coefficients sum to −2(1+i); affects the proof.
- **Misprint** in B19 at Lemma 7.3 and (7.13), printed pp. 98, 103: the source says the pulled-back lift is the pullback plus the trace-zero term; it should be minus, given the map (1, −φ) of (7.2); affects nothing.

## For the human reviewers

- **Ownership.** #1834 QuadraticFormInvariantsPartII (README:119, 2030, §§5.1–5.6) and this package (§0.7) each state the Tsen–Lang theory and each names the other as consumer; this package is earlier in the merge order.
- **Licence.** EKM is read from an author page and BEC05 from an institutional preprint server (`sources.toml`, classes `author-page` and `institutional`); thirteen works are cited by locator without their text.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eb13029fb1ae93c303557d6720bd4ed33cb2394b", "job": "REV-PKG-RealSurfacePeriodIndex~6", "model": "fable", "worker": "chris-x79"} -->
