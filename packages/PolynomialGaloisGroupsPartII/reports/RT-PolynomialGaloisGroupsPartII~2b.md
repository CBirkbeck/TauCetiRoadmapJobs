<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/171#issuecomment-6348174155 -->
Red team round 2 pass b (claude) of 133e06d

Verdict: needs_changes

1. **F01** (P3) Eleven sorried theorems close with one tactic or one term from the pins

   **Location:** `packages/PolynomialGaloisGroupsPartII/Suggested.lean:93`: “theorem badTransitive_witness (G : Subgroup (Equiv.Perm α)) … σ ∈ BadTransitive α := by sorry”; likewise lines 65, 71, 74, 78, 125, 128, 296, 376, 414, 448.

   **Claim:** These eleven declarations are stated as targets although each closes with a single tactic or a single term against Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf` (the two imported modules built at the pin): the merging monotonicity, conjugation and relabeling transports, the five-cycle membership, the witness introduction, the unit and bounded-count facts of `maxFactorMultiplicity`, the diagonal pair bound, the complement sum, the `none` characterisation of `minSupport`, and the support inclusion of distinguishers. The remaining 43 sorried theorems did not close in a short probe (tried: `mergePerms_card`, `mergePerms_identity`, `minSupport_le`, `goodEvent_one_diagonal`, `partitionLaw_singleton`; all others judged nontrivial by reading).

   **Witness:** A probe copy of `Suggested.lean` with the eleven proofs below substituted elaborated with exit 0, 43 `declaration uses sorry` warnings and no other diagnostic; the submitted file gives 54.

   **Exact repair text:** replace the `by sorry` of each listed theorem by the following.

   ```lean
   -- line 65, mergePerms_mono
   fun _ ⟨b, h1, h2, h3⟩ => ⟨b, h1, h2, fun B hB => ⟨(h3 B hB).1, (h3 B hB).2.1.trans h, (h3 B hB).2.2⟩⟩
   -- line 71, mergePerms_conj
   by simp [MergePerms, Equiv.Perm.fullCycleType_conj]
   -- line 74, mergePerms_permCongr
   by simp [MergePerms, Equiv.Perm.fullCycleType_permCongr]
   -- line 78, mergePerms_five_cycle
   ⟨{{5}}, rfl, by simp [h], by simp⟩
   -- line 93, badTransitive_witness
   ⟨G, ht, ha, hs, hσ⟩
   -- line 125, maxFactorMultiplicity_unit
   by simp [maxFactorMultiplicity, normalizedFactors_of_isUnit h]
   -- line 128, maxFactorMultiplicity_le_iff
   by simp only [maxFactorMultiplicity, Finset.sup_le_iff, Multiset.mem_toFinset]
   -- line 296, PartitionLaw.pair_diagonal
   by simpa [Multiset.le_count_iff_replicate_le, Multiset.replicate_succ, Multiset.insert_eq_cons, sq] using h.pair k k hk hk hkn hkn
   -- line 376, goodEvent_two_complement
   Nat.eq_sub_of_add_eq (by rw [← Multiset.sum_add, tsub_add_cancel_of_le hu, ρ.parts_sum])
   -- line 414, minSupport_eq_none
   by simp [minSupport, Subgroup.eq_bot_iff_forall]
   -- line 448, orbitalDistinguishers_subset_support
   fun _ hz => Equiv.Perm.mem_support.mpr fun h => (Finset.mem_filter.mp hz).2 ⟨⟨g, hg⟩, rfl, h⟩
   ```

2. **F02** (P3) The divisor-bound supplier is cited by a declaration name that does not exist at its current head

   **Location:** `packages/PolynomialGaloisGroupsPartII/README.md:230`: “`eventualDivisorSubpower` supplies, for every real `η > 0`, the bound `τ(n) ≤ n^η` for all sufficiently large positive integers”; the same name at lines 44 and 822.

   **Claim:** The round-1 repair repointed the divisor estimate to ErdosProgressionPowers §0.9, which is the right owner: that section states the eventual divisor-subpower bound (every real ε > 0, all sufficiently large n, nonsquarefree n included) at the roadmap's current head, so the contract is supplied. But the backticked name `eventualDivisorSubpower` occurs nowhere in that roadmap at its current head, in its README or its `Suggested.lean`; the citation names a declaration the supplier does not declare. The copy of that roadmap on the board's main is the untouched initial import and does not own the bound at all (it cites AnalyticNumberTheory AN.5 for it), so only the open-pull-request head carries §0.9.

   **Witness:** `TauCetiRoadmap/ErdosProgressionPowers/README.md` at the head `e3c95fb` of its open pull request: line 477 “### 0.9 Explicit prime arithmetic”, lines 514–517 state the bound in prose; a search for `eventualDivisorSubpower` in that 1700-line README and in its 85-line `Suggested.lean` returns nothing. The board's `packages/ErdosProgressionPowers/README.md` (1203 lines) has no `### 0.9` heading and lists “`AnalyticNumberTheory:AN.5` — eventual divisor subpower bound” at line 613.

   **Exact repair text:** line 43–44: “**ErdosProgressionPowers, §0.9**, owns the eventual divisor-subpower bound.”; line 230: “ErdosProgressionPowers, §0.9, supplies the eventual divisor-subpower bound: for every real `η > 0`, `τ(n) ≤ n^η` for all sufficiently large positive integers, including nonsquarefree integers.”; line 822: “Invoke ErdosProgressionPowers §0.9, the eventual divisor-subpower bound, with exponent `δ/4`, …”. Keep the section citations at lines 228 and 903 unchanged.

## Verified sound

**Round-1 repairs, each confirmed on this head.** Pass a: F01 all 18 examples are proved and no admitted example remains (at most two per definition: 2, 1, 0, 1, 2, 2, 1, 2, 2, 2, 1, 2 for the twelve definitions); F02 the Mertens dependency is the declared gap `gap:mertens-prime-product` with the same slug, supplier `AnalyticNumberTheoryPartI` and `needs` sentence in `design/plan.json` and README lines 238–240 (settled as not actionable in this package; not re-raised); F03 repointed to ErdosProgressionPowers §0.9 (section correct; the name is F02 above); F04 README lines 116 and 161 carry the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; F05 every README Check now has a proved example or a named theorem target in both files (50 Check bullets mapped); F06 README lines 679–681 drop the zero-start negative control; F07 `babai_distinguishers` (line 452) and `bochert_minSupport` (line 457) are present with the requested hypotheses; F08 `sources.toml` has four certified entries whose sha256 extractions exist in the cache; F09 the E₅* Check is `{1,2}` at α = 1 (README 735–738, proved example at Lean 337); F10 the instance has a docstring (line 247) and the README names it (line 78); F11 README lines 27–34 assign the equality to NumberFieldArithmetic §3.10 under polynomial-discriminant nondivisibility, which the parent on the content repository's main states at its lines 43, 136 and 152, `Completed/NumberFieldArithmetic/README.md:1039` has the §3.10 heading, and the cited `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType` exists at the pin in `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean` inside `namespace TauCeti.NumberField` with hypothesis `¬ (p : ℤ) ∣ f.discr`. Pass b: F01 the twelve proofs are in place; F02 `galois_merging_certificate` (line 502) has no separability binder and README 6.2 says “(hence separable)”; F03 no `ArithmeticStatisticsPartIIRandomPolynomials` remains, the scope bullet (lines 46–49) and Downstream consumers (line 1351) name no roadmap; F04 no “current” and no research-blueprint link remains.

**Elaboration.** `Suggested.lean` as submitted, in the pinned Lake setup with both Tau Ceti modules' objects present: exit 0, 54 `declaration uses sorry` warnings, no other diagnostic. Imports are `import Mathlib` plus the two `TauCeti.*` modules, both used (`fullCycleType`, `factorDegrees`); no `lemma`, `set_option`, `#eval`, `#print`, `#synth`, `True` placeholder, `def := sorry` or LaTeX delimiter in either file; no process word, issue or pull-request number in the README; the title keeps “Galois” capitalised; the pull request changes only the package folder (seven files).

**Counts.** 89 Lean declarations read (13 definitions/abbreviations/structure/local instance, 18 proved examples, 58 theorems of which 54 sorried); 32 numbered README targets read (0.1–6.2); 27 locators verified with their page markers; about 50 Check bullets and the displayed inequalities recomputed; 11 supplier-citation checks (two roadmaps, the gap, eight pinned-declaration groups).

**Depcheck.** From the board clone the gate printed exactly:

```text
depcheck: 14 roadmaps, 103 edges, 0 problem(s)
```

`PolynomialGaloisGroupsPartII` is absent from the branch's `merge-order/ORDER.txt` (imported package); on the board's main it is line 188, directly after `ErdosProgressionPowers` (187); `AnalyticNumberTheoryPartI` is line 80. PolynomialGaloisGroups and NumberFieldArithmetic are on the content repository's main (the latter under `Completed/`) and are cited by roadmap name and section, never under a `TauCetiRoadmap.X` heading.

**Suppliers and pins.** ErdosProgressionPowers is an open board package and an open roadmap pull request whose §0.9 states the bound (F02). The gap `mertens-prime-product` is precise (D, x₀, inclusive prime endpoint, the `e^γ` coefficient and the identification proof) and names a supplier above this roadmap; the pinned Mathlib has no Mertens product theorem (the only “Mertens” hits are a docstring remark in `Mathlib/Analysis/SpecialFunctions/Log/Sum.lean:18` and the Dedekind–Mertens lemma TODO), and the pinned Tau Ceti has none. Mathlib `Mathlib/GroupTheory/GroupAction/Jordan.lean:370` and `:408` (swap and 3-cycle recognition) carry no cardinality hypothesis, so README line 151 is right; `IsMultiplyPretransitive.alternatingGroup_le` at `Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean:601` recognises at `Nat.card α − 2` with no further hypothesis, as 2.5 needs. Tau Ceti `fullCycleType_conj`, `fullCycleType_permCongr`, `sum_fullCycleType`, `fullCycleType_of_isEmpty` and the `factorDegrees` API exist at the pin with the stated contracts.

**Locators** (all consistent with the statements and hypotheses as the README gives them). bskk: p.5 lines 200–216 (k-fold irreducibility, the Φ₁₁ and (n−2) remarks), (11.1) p.54 line 3323, Definition 11.2 and its example p.56 lines 3490–3497 (y ≥ 1; `(2,3,6)` is not a 2-merging), Lemma 11.3 pp.56–57 line 3498 (monic square-free, any prime, M as the maximal exact power), Claim 11.4 p.57 line 3535, §11.3 p.57 line 3544, Proposition 12.1 p.59 lines 3611–3637 (the ranges, (a) with multiset containment, (b), (c) with multiplicity, uniform θ ∈ [0, δ/2−ε]), Lemma 12.5 pp.60–61 lines 3717 and 3745–3749 (the coefficient 1/2 − e^γ/8 > 1/4), Lemma 12.6 p.61 line 3751 (one witness per r; the four-witness form is declared as a strengthening), Lemmas 12.7–12.9 p.62 lines 3826, 3829, 3855, proof of 12.1 p.63 line 3900. babai: title and date 21 October 2018 lines 5–8, Definition 6.1 p.5 line 160, Exercise 6.2 p.6 line 167, Theorem 6.6 p.6 lines 178–180 (every distinct pair, at least √n/2), Lemma 8.5 p.7 line 222, Lemma 8.7 with n ≥ 5 p.7 line 230, Corollary 8.19 p.9 line 302, the closing comparison at the top of p.10 lines 310–313, Exercise 9.5 and Corollary 9.6 p.10 lines 335–338. schomburg: (2.1) p.1 line 32, standing hypothesis and Theorem 3.1 p.4 lines 120–122, the displayed `n ≤ 4m + 6/(m−3)` and the m ≥ 10 step p.5 lines 147–148. bary-soroker-kozma: Claim 1 p.9 line 438, proof continuing p.10 lines 444–451. The `sources.toml` page ranges agree with the `=== page N ===` markers.

**Checks recomputed.** The four 0.1 mergings; identity, five-cycle and empty-carrier memberships of 0.2; `BadTransitive (Fin n) = ∅` for n = 0, 1, 2, 3 and the C₅ witnesses; `{1,1}/{2}` and `{3,3}/{6}`; `maxFactorMultiplicity` values 0, 0, 3, 1 and the `X²−2`, p = 2 example (`{1,1}`, M = 2); the tuple-field and quotient values (⊥, degree two, base field for rational roots, leading coefficient 2); Φ₁₁ and `(X²−2)²`; harmonic masses 0, 1/2, 3/2; the law Checks `ν(univ) ≤ C`, `C exp(−κ/2)`, `C/4`; the five `GoodEvent` Checks including `{1,2}` at α = 1 (1 ∈ [1/3, 3/log 3], two occurrences); `minSupport` none, `some 2`, `some 3`; distinguishers ∅, univ, `{x,y}`; `e^γ < 2`; `n^(κα) ≤ n^(1/40) < n^(1/8)`; `√n/3 < (√n−1)/2` for n > 9; `4m + 6/(m−3)` equals 22, 23, 26, 29.5, 33.2, 37 for m = 4…9 and 40.86 at m = 10; `2(n−1)/3 > n/4`; `ε/2 ≤ α ≤ 1/40`; `δ/2 − α = δ/4 + θ/2 ≥ α` with equality at θ = 0, κ = 1; `1 − 3α − θ ≥ 7/8 ≥ κα`; the 3.6 sums `Σ_{j≤r/2} (nj/r)^(−δ) = O(r n^(−δ))` and `O(n^(−δ/2) τ(n))`.

**Adversarial pass.** Every sorried theorem was instantiated: `equivariant_cycle_fibres` at d = 1, m = 1, 2 and d = 3, m = 2; `ramified_merging` at `X−a`, `X²−2` with p = 2, squarefree reduction, constants excluded; `maxFactorMultiplicity_eq_one_iff` needs both guards (a unit is squarefree with value 0); `tupleRootQuotient_*` at j = 0, 1, n, f = 1 and the nonmonic quadratic; `kfold_iff_multiplyPretransitive` at k = 1, k = n and the excluded k > n; `kfold_degree_sub_two` at n = 3, 4; `badTransitive_small_degree` at n = 0, 1 (`⊤ = alternatingGroup = ⊥`), 2, 3; `babai_distinguishers` at the uniprimitive C₃ on three points (vacuously fine below n = 5) and the 2-transitive exclusion; `bochert_minSupport` with m = n and 4 ≤ m ≤ 9 excluded for n ≥ 38; `primitive_minSupport` for 5 ≤ n ≤ 37 via Jordan (m ≥ 4) and n ≥ 38 via Bochert; `primitive_exclusion` (repeated parts with a prime factor > n^(1/8) violate E₁, the chosen k survives merging, the power p^(a−1) q moves exactly k points); `imprimitive_exclusion` in the three block-count ranges; `four_nondivisible_parts_failure` through r = 2, 3 ≤ r ≤ log n, log n < r ≤ n^(κα) and r > n^(κα) (E₁ ∩ E₃ give five distinct long parts, at most one divisible by r; for r > n/log n nothing is divisible); `generalized_luczak_pyber` at θ = 0 and θ = δ/2 − ε; `galois_merging_certificate` with the image as its own witness. No false iff, missing finiteness, sign or normalisation error or vacuous statement found; the README's generality equals the Lean signatures throughout.

**Not re-raised.** Round-1 pass a F01–F11 and round-1 pass b F01–F04, all repaired as listed above; pass a F02 is the declared gap, settled as not actionable in this package. No round-2 pass a comment was posted at the time of this pass.

## Not verifiable

- `AnalyticNumberTheoryPartI` has no README anywhere readable: not on the content repository's main, not a board package, no open pull request; the board's `AnalyticNumberTheory` index package only links its §0.26 “Mertens's third theorem: the Euler product” and §0.31 “Mertens product input” into that Part I. Whether `gap:mertens-prime-product` duplicates a Part I target could therefore not be checked; the gap is a declared contract with a named supplier above this roadmap and is not raised.
- Ownership against open roadmap pull requests was checked only for ErdosProgressionPowers and the parent; the brief gave no other sibling heads.
- The local content checkout is behind the content repository's main; the parent roadmap was read from main through the API, `Completed/NumberFieldArithmetic` from the checkout.
- The 43 sorried theorems that did not close in the probe were checked by hand only.
