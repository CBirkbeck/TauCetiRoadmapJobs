<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/171#issuecomment-6335266914 -->
Red team round 1 pass b (claude) of 54a5052

Verdict: needs_changes

1. **F01** (P3) Twelve admitted examples close with short proofs from the pins

   **Location:** `packages/PolynomialGaloisGroupsPartII/Suggested.lean:27`: “example : EqualPartMerging 2 {1, 1, 2, 2, 2, 3} {1, 1, 2, 3, 4} := by sorry”, and the examples at lines 29, 41, 65, 87, 96, 133, 158, 180, 186, 212, 220.

   **Claim:** These examples are stated as admitted tests although each closes with a short proof against Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf` (the two imported modules built at the pin). This overlaps pass a F01, which asks for proved examples; this finding supplies the verified proof text for twelve of the twenty-three. The remaining eleven (lines 37, 49, 51, 67, 100, 108, 111, 154, 183, the second conjunct of 186, 214, 223) did not close in a short probe and stay as pass a left them.

   **Witness:** A probe copy of `Suggested.lean` with the proofs below appended elaborated with no error (only the original `sorry` warnings).

   **Exact repair text:** replace the `by sorry` of each listed example by the following.

   ```lean
   -- line 27
   ⟨{{1}, {1}, {2}, {2, 2}, {3}}, by decide, by decide, by simp⟩
   -- line 29
   by
     refine ⟨⟨{{1, 1}, {2}}, by decide, by decide, by simp⟩,
       ⟨{{2, 2}}, by decide, by decide, by simp⟩, ?_⟩
     rintro ⟨blocks, hs, hm, hb⟩
     obtain ⟨B, rfl, -⟩ := Multiset.map_eq_singleton.mp hm
     simp only [Multiset.sum_singleton] at hs
     subst hs
     have := (hb _ (Multiset.mem_singleton_self _)).2.2 1 (by simp) 2 (by simp)
     omega
   -- line 41
   ⟨0, by simp [Equiv.Perm.fullCycleType_of_isEmpty]⟩
   -- line 65
   by simp [maxFactorMultiplicity]
   -- line 87
   by simp [TupleRootField]
   -- line 96
   by simp [tupleRootQuotient, Polynomial.map_map, ← IsScalarTower.algebraMap_eq]
   -- line 133
   by norm_num [harmonicMass, Finset.sum_Icc_succ_top]
   -- line 158
   by
     have h8 : (8 : ℝ) ≤ n := by exact_mod_cast hn
     simpa [Multiset.le_count_iff_replicate_le, Multiset.replicate_succ, Multiset.insert_eq_cons,
       show (C : ℝ) / ((2 : ℝ) * 2) = C / 4 by norm_num] using
       h.pair 2 2 le_rfl le_rfl (by linarith) (by linarith)
   -- line 180
   by intro H; have := H 2 2 (by norm_num) (by norm_num) (by rw [h]; decide); norm_num at this
   -- line 186, first conjunct only
   fun ρ => by simp [GoodEvent]
   -- line 212
   by simp [minSupport, Subsingleton.elim _ (1 : Equiv.Perm (Fin 0))]
   -- line 220
   by ext z; simp [orbitalDistinguishers, h]
   ```

2. **F02** (P3) `galois_merging_certificate` carries a hypothesis derivable from another

   **Location:** `packages/PolynomialGaloisGroupsPartII/Suggested.lean:268`: “(hsep : (A.map (Int.castRingHom ℚ)).Separable)”; `packages/PolynomialGaloisGroupsPartII/README.md:1271`: “with separable irreducible image over ℚ”.

   **Claim:** Over ℚ an irreducible polynomial is separable, so `hsep` follows from `hirr` and the signature asks the consumer for a fact it already has. The same class: in `equivariant_cycle_fibres` (line 56) `hd : 0 < d` follows from `hp` (full-cycle parts are positive) and `hm : 0 < m` from `hs` with `hf`.

   **Witness:** Mathlib `Mathlib/FieldTheory/Separable.lean:509`, `Irreducible.separable [CharZero F]`; a probe copy proved `example (g : ℚ[X]) (hirr : Irreducible g) : g.Separable := hirr.separable`.

   **Exact repair text:** delete the binder `(hsep : (A.map (Int.castRingHom ℚ)).Separable)` from `galois_merging_certificate` (the proof uses `hirr.separable`), and in README 6.2 write “let `A : ℤ[X]` be monic with irreducible image over `ℚ` (hence separable), and let `p` be prime.” Optionally drop `hd` and `hm` from `equivariant_cycle_fibres` for the same reason.

3. **F03** (P3) The scope defers material to a roadmap that exists nowhere, under a colliding name

   **Location:** `packages/PolynomialGaloisGroupsPartII/README.md:40`: “**ArithmeticStatisticsPartIIRandomPolynomials**, the proposed continuation of ArithmeticStatistics for random polynomials of growing degree, owns concrete coefficient laws”; also line 1325.

   **Claim:** The Scope assigns ownership of coefficient laws, repeated-factor tails and quantitative irreducibility to a named roadmap that is not on `main`, not in the merge order and not a board package; the name also collides with `ArithmeticStatisticsPartII`, which does exist in the order. Since nothing in this roadmap consumes it, this is a deferral to an unowned name, not an unowned prerequisite.

   **Witness:** `merge-order/ORDER.txt:84`–`88` and `106`–`108` list `ArithmeticStatisticsPartI` … `PartVIII` and no `…RandomPolynomials`; the content repository at `main` has no `ArithmeticStatistics*` folder; the board has no such package.

   **Exact repair text:** replace the bullet by “Concrete coefficient laws, bounds for repeated reduction factors and quantitative irreducibility for random polynomials of growing degree are outside this roadmap. They consume 6.1 and 6.2 and are motivation for a future continuation of ArithmeticStatistics; its distribution estimates are not prerequisites of the theorem for arbitrary partition laws.” In `## Downstream consumers` write “A continuation of ArithmeticStatistics for random polynomials would use the certificate and the uniform partition theorem after establishing …”, with no roadmap name.

4. **F04** (P3) Timeless wording: “current” and research-blueprint links

   **Location:** `packages/PolynomialGaloisGroupsPartII/README.md:190`: “### From the current Tau Ceti cycle-fibre API”; also “current” at lines 32, 193, 362, 517 and 1105, and the two links at lines 244–245 to a `tauceti-explorer` research blueprint.

   **Claim:** “current” dates the text to the moment of writing, and a link into the explorer's research-blueprint pages is not a roadmap citation (pass a F02 already asks for the AN.2/AN.5 contracts to be restated; the links go with them).

   **Witness:** the lines above; the parent is cited correctly by roadmap name and section at line 222.

   **Exact repair text:** line 32 “Tau Ceti also owns single-cycle fibre arithmetic for equivariant maps.”; line 190 “### From Tau Ceti, cycle-fibre arithmetic”; line 193 “`TauCeti.GroupTheory.Perm.Semiconj` supplies the single-cycle arithmetic:”; line 362 “*Needs:* 0.1–0.2 and the cycle-fibre supplier contract.”; line 517 “Tau Ceti also has `Polynomial.rootSet_divByMonic_X_sub_C`:”; line 1105 “*Needs:* the parent Layer 1 imprimitivity quotient and the cycle-fibre supplier contract.”; delete the sentence “See [AnalyticNumberTheory, Mertens product](…) and [its divisor estimate](…).” at lines 243–245.

## Verified sound

**Elaboration.** `Suggested.lean` as submitted elaborates against the pinned Mathlib and Tau Ceti: exit 0, 34 `declaration uses sorry` warnings, no other diagnostic. (The review Lake setup lacked the oleans of the two imported Tau Ceti modules; both exist at Tau Ceti `a91d3aaf` and were built there first.) Imports are `import Mathlib` plus the two `TauCeti.*` modules actually used; no `lemma`, no `set_option`, no `#eval`/`#print`/`#synth`, no `def := sorry`, no LaTeX delimiters; the title keeps “Galois” capitalised.

**Counts.** 47 Lean declarations read (13 definitions/abbreviations/structure/local instance, 11 sorried theorems, 23 examples); 32 numbered README targets read (0.1–6.2); 29 locators verified; about 40 Checks and displayed inequalities recomputed; 16 Tau Ceti and 18 Mathlib supplier declarations plus 7 Tau Ceti modules confirmed at the pins; the parent's Layer 0, Layer 1 (wreath-embedding target with the `α ≃ (block system) × B` identification, and the `#layer-1-…` anchor), Layer 5 and Layer 9 headings confirmed on `main`.

**Depcheck.** The gate ran from the board clone and printed exactly:

```text
depcheck: 8 roadmaps, 48 edges, 0 problem(s)
```

`PolynomialGaloisGroupsPartII` is absent from `merge-order/ORDER.txt` (imported package; not a defect). No `gap:` contract is declared.

**Suppliers.** At Tau Ceti `a91d3aaf`: `Equiv.Perm.fullCycleType`, `sum_fullCycleType`, `fullCycleType_eq_of_isConj`, `fullCycleType_permCongr`, `fullCycleType_of_isEmpty`; `Polynomial.factorDegrees` (the multiset of `natDegree` over `normalizedFactors` of the reduction, exponents retained, as the Conventions say) and `Polynomial.Monic.sum_factorDegrees`; `NumberField.exists_isArithFrobAt_int_of_liesOver` (no unramifiedness premise); `TauCeti.FiniteField.exists_orbit_eq_rootSet_factor`; `TauCeti.isPretransitive_iff_irreducible` (separable, positive degree); `TauCeti.stabilizer_eq_fixingSubgroup_adjoin_simple`; `TauCeti.is_two_pretransitive_iff_irreducible_divByMonic`; `Equiv.Perm.IsCycle.pow_apply_eq_self_iff`; `Function.Semiconj.minimalPeriod_dvd`, `setOf_sameCycle_and_eq`, `ncard_sameCycle_and_eq_mul_minimalPeriod`; `TauCeti.orbitCount_le_mul_orbitCount_of_semiconj`; `Polynomial.rootSet_divByMonic_X_sub_C`. At Mathlib `6b7abb3c`: `Polynomial.Gal.galActionHom_injective`, `restrict_surjective`, `Ideal.exists_maximal_ideal_liesOver_of_isIntegral`, `rootMultiplicity_mul`, `rootMultiplicity_X_sub_C`, `MulAction.isMultiplyPretransitive_iff`, `SubMulAction.ofStabilizer.isMultiplyPretransitive` (the Wielandt 9.1 recursion), `isMultiplyPretransitive_of_le`, `IsMultiplyPretransitive.alternatingGroup_le`, `alternatingGroup.isMultiplyPretransitive`, `isPreprimitive_of_is_two_pretransitive`, both Jordan recognition theorems, `harmonic_le_one_add_log`, `log_add_one_le_harmonic`, `eulerMascheroniConstant_lt_two_thirds`, `log_two_gt_d9`, `Nat.Partition.indiscrete` (parts of `indiscrete 0` are empty by `partition_zero_parts`, so the line-41 example and the 0.2 empty-carrier Check are true). The AN.2/AN.5 and parent-Layer-5 citations are pass a F02, F03, F11 and are not re-raised.

**Locators** (all consistent with the statements and hypotheses as the README states them). BSKK (cached legal copy of arXiv:2007.14567v3): Definition 11.2 and its example, p.56 (line 3490); Lemma 11.3, p.56 (line 3498; monic square-free, every prime); Claim 11.4, p.57 (line 3535); (11.1), p.54 (line 3323); the k-fold-irreducibility paragraph, p.5 (lines 201–213); Proposition 12.1, p.59 (line 3611: C ≥ 1, t ∈ (0,1), κ ∈ (0,1], δ ∈ (0,1/10]; (a) k,ℓ ∈ [2,n/4] with multiset containment, (b) k ∈ [n^{1−δ/2}, n/2], (c) m ∈ [1, n/log n] with multiplicity; conclusion `(log n)² n^{−κ(δ/4−θ/2)}` uniform for θ ∈ [0, δ/2−ε]); Lemmas 12.2–12.6, pp.59–61 (lines 3653, 3673, 3701, 3717, 3751; the source E₅ asks one witness per r, the README's four-witness strengthening is declared as such); Lemmas 12.7–12.9, p.62 (lines 3826, 3829, 3855); proof of 12.1, p.63 (line 3900). Babai notes (cached author copy): Definition 6.1, p.5 (line 160); Exercise 6.2, p.6 (line 167); Theorem 6.6, p.6 (line 178: at least √n/2 distinguishers); Lemma 8.5, p.7 (line 222); Lemma 8.7 with n ≥ 5, p.7 (line 230); Corollary 8.19, p.9 (line 302); Exercise 9.5 and Corollary 9.6, p.10 (lines 335, 337); Exercises 3.4 and 4.4–4.8, pp.4–5 (lines 121, 133, 144). Schomburg (cached arXiv:2209.12049v1): (2.1), p.1 (line 32); Lemmas 2.3–2.5, p.3 (lines 76, 88, 95); standing hypothesis “G does not contain Alt(Ω)” and Theorem 3.1 “t ≥ 2, m ≥ n/4 for n ≥ 38”, p.4 (lines 120–122), with the displayed `n ≤ 4m + 6/(m−3)` and the m ≥ 10 step, p.5 (lines 147–148). Bary-Soroker–Kozma (cached arXiv:1710.05165v2): Claim 1, p.9 (line 438: primitive, not containing A_n, min deg ≥ (√n−1)/2), proof continuing on p.10.

**Checks recomputed** (all correct): the four 0.1 merging Checks (including that `{2,3,6}` needs three `2`s or two `3`s, and that `{1,1,2}` cannot reach `{4}` at any bound); the identity/5-cycle/empty-carrier Checks of 0.2; `BadTransitive (Fin n) = ∅` for n ≤ 3 including n = 0, 1 where `⊤ = alternatingGroup`; the C₅ witnesses; the 0.4 examples `{1,1}/{2}` and `{3,3}/{6}`; `maxFactorMultiplicity` of 1, 0, `(X+1)³` over F₂ (3), `X(X−1)` over F₃ (1); `X²−2` at p = 2 (`{1,1}`, M = 2); the tuple-field and quotient Checks (⊥, degree two for √2, base field for rational roots, leading coefficient 2 for `2X(X−1)`); Φ₁₁ (regular group of order 10, so 1-fold but not 2-fold); `(X²−2)²` fails separability; harmonic masses 0, 1/2, 3/2; the three law Checks (`ν(univ) ≤ C`, `C exp(−κ/2)`, `C/4`); the five `GoodEvent` Checks; `minSupport` none/`some 2`/`some 3`; distinguishers ∅, univ, `{x,y}`; `e^γ < 2` hence `1/2 − e^γ/8 > 1/4`; `n^(κα) ≤ n^(1/40) < n^(1/8)`; `√n/3 < (√n−1)/2` for n > 9; `4m + 6/(m−3) ≤ 37` for 4 ≤ m ≤ 9 and the derivation of that inequality from the incidence counts; `2(n−1)/3 > n/4`; the Moore bound `v_i ≤ n−1−√(n−1)` and `n − v_max > √n`, including the complete-symmetrisation case `(n+1)/2 > √n`; `ε/2 ≤ α ≤ 1/40`; `δ/2 − α = δ/4 + θ/2 ≥ α` with equality at θ = 0, κ = 1; `1 − 3α − θ ≥ 35/40 ≥ κα`; `(√n−1)/2 ≤ 2.54 < 4` for n ≤ 37.

**Adversarial pass.** For each sorried theorem: `equivariant_cycle_fibres` at d = 1, m = 1, 2 and d = 3, m = 2 (return orbits partition a fibre, blocks of m_i copies of d); `ramified_merging` at `X−a`, `X²−2` with p = 2 (σ = 1 already witnesses the 2-merging), squarefree reduction (M = 1 forces equality), constants excluded by `hdeg`; `kfold_iff_multiplyPretransitive` at k = 1 (reduces to `isPretransitive_iff_irreducible`), k = n (quotient linear at j = n−1), and the vacuity of `IsMultiplyPretransitive` for k > n, which the bound `k ≤ natDegree` excludes on both sides; `kfold_degree_sub_two` at n = 3 (irreducible cubic ⇔ A₃ ≤ image) and the `Nat.card α − 2` form of the Mathlib theorem; `nonsmooth_harmonic_mass` (the smooth reciprocal mass equals the finite Euler product, 1 included); `four_nondivisible_parts_failure` through the three r-ranges with κ ≤ 1 (`n^{2κα/r} ≤ e^{2κα}` for r > log n) and the uniform `3 ≤ tL_r`; `primitive_minSupport` at n = 5…37 (Jordan gives m ≥ 4), n ≥ 38 doubly transitive (Bochert), uniprimitive (Babai), and the trivial group excluded by `hm`; `primitive_exclusion` (k occurs once by E₁ since k > n^{1/8} ≥ n^{κα}; every other output length is prime to p; the power p^{a−1}q keeps all k points moved); `imprimitive_exclusion` in the three block-count ranges, including the pull-back to a sub-multiset of `ρ.parts` for E₂ and the `gcd(k,ℓ) ≥ r'/m` steps; `generalized_luczak_pyber` (n^θ ≤ n^{1/8} since θ ≤ 1/20; each of the five rates is at least `n^{−κα}` because κα ≤ δ/4 and α ≤ 1/4); `galois_merging_certificate` (the image itself is the `BadTransitive` witness; reducible or inseparable inputs are excluded by `hirr`). No false iff, missing finiteness, sign or normalisation error, or vacuous statement found; the README's generality equals the Lean signatures throughout.

**Not re-raised** (pass a, codex, of this head): F01 all examples admitted and the third `GoodEvent` example; F02 AnalyticNumberTheory AN.2 contract; F03 AN.5 divisor-bound owner; F04 declared library pins; F05 statable Checks without Lean mirrors; F06 the harmonic zero-start Check; F07 the omitted `babai_distinguishers` and `bochert_minSupport` signatures; F08 missing `sources.toml`; F09 the degree-three E₅* Check; F10 the undocumented local instance; F11 the parent Layer 5 ownership sentence.

## Not verifiable

- The package has no `sources.toml` (pass a F08), so the sha256 route of the brief could not be followed; the four cached legal copies were identified by the URLs recorded in their extraction headers and the locators checked against those.
- Eleven examples (lines 37, 49, 51, 67, 100, 108, 111, 154, 183, the second conjunct of 186, 214, 223) were not closed by a short probe; their truth was checked by hand only.
- The AN.2 Mertens estimate and the AN.5 divisor bound have no admissible supplier at this head (pass a F02, F03); the soundness of 3.4, 3.6, 3.8 and 6.1 is conditional on those contracts.
