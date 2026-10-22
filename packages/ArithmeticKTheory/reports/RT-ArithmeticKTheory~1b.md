<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/127#issuecomment-6335217229 -->
Red team round 1 pass b (claude) of a6cca4e

Verdict: needs_changes

1. **F01** (P3) Four sorried theorems close in one tactic line from the pinned Mathlib

   **Location:** `packages/ArithmeticKTheory/Suggested.lean:65`: “theorem borelRank_even (r₁ r₂ k : ℕ) : borelRank r₁ r₂ (2 * k) = 0 := by sorry”; also lines 78, 134 and 153.

   **Claim:** `borelRank_even`, `mem_divisibleSubgroup_iff`, `bottCohomologySlot_totalDegree` and `evenTwoRank_add_prime` are stated as targets, but each is a one-line consequence of its definition at the pins; two more (`divisibleSubgroup_eq_bot_of_finite`, `divisibleSubgroup_int`) close in under ten lines. Leaving them `sorry` records no mathematics and hides that the only substantive Lean targets are `integer_isLocalization_iff`, `integer_isLocalization_of_torsion_classGroup`, `inter_mul_eventually_eq_divisibleSubgroup` and the four regular-prime theorems.

   **Witness:** a probe copy of the file with the proofs below elaborated with no errors against Mathlib 6b7abb3 (`lake env lean`, the `divisibleSubgroup_int` and `divisibleSubgroup_eq_bot_of_finite` proofs in a second probe copy).

   **Exact repair text:**
   ```lean
   theorem borelRank_even (r₁ r₂ k : ℕ) : borelRank r₁ r₂ (2 * k) = 0 := by
     unfold borelRank; split_ifs <;> omega

   theorem mem_divisibleSubgroup_iff {x : A} :
       x ∈ divisibleSubgroup A ↔ ∀ m : ℕ, 1 ≤ m → ∃ y, m • y = x := by
     simp [divisibleSubgroup, AddSubgroup.mem_smul_pointwise_iff_exists]

   theorem divisibleSubgroup_eq_bot_of_finite [Finite A] :
       divisibleSubgroup A = ⊥ := by
     rw [eq_bot_iff]
     intro x hx
     simp only [divisibleSubgroup, AddSubgroup.mem_iInf, AddSubgroup.mem_smul_pointwise_iff_exists,
       AddSubgroup.mem_top, true_and] at hx
     obtain ⟨y, hy⟩ := hx (Nat.card A) Nat.card_pos
     rw [AddSubgroup.mem_bot, ← hy]
     exact card_nsmul_eq_zero'

   theorem divisibleSubgroup_int : divisibleSubgroup ℤ = ⊥ := by
     rw [eq_bot_iff]
     intro x hx
     simp only [divisibleSubgroup, AddSubgroup.mem_iInf, AddSubgroup.mem_smul_pointwise_iff_exists,
       AddSubgroup.mem_top, true_and] at hx
     obtain ⟨y, hy⟩ := hx (x.natAbs + 1) (by omega)
     rw [AddSubgroup.mem_bot]
     refine Int.eq_zero_of_abs_lt_dvd (m := |x| + 1) ⟨y, ?_⟩ (lt_add_one _)
     rw [nsmul_eq_mul] at hy; push_cast at hy; exact hy.symm

   theorem bottCohomologySlot_totalDegree (j : ℤ) (positive : Bool) :
       2 * (bottCohomologySlot j positive).2 -
         ((bottCohomologySlot j positive).1 : ℤ) = 2 * j := by
     unfold bottCohomologySlot; split_ifs <;> simp <;> omega

   theorem evenTwoRank_add_prime (r s t j n : ℕ) (hs : 1 ≤ s) (hn : Even n) :
       evenTwoRank r (s + 1) t j n = evenTwoRank r s t j n + 1 := by
     obtain ⟨m, rfl⟩ := hn; unfold evenTwoRank; split_ifs <;> omega
   ```

2. **F02** (P3) The TauCeti import is unused

   **Location:** `packages/ArithmeticKTheory/Suggested.lean:2`: “import TauCeti.RingTheory.DedekindDomain.SInteger.Basic”.

   **Claim:** No declaration in the file uses that module: `Set.integer`, `IsUnit.submonoid`, `Submonoid.comap`, `ClassGroup`, `CyclotomicField` and `bernoulli` are all Mathlib. The import policy admits only `TauCeti.*` modules actually used; the same file without line 2 elaborates with exactly the thirteen intended `sorry` warnings.

   **Witness:** probe copy with line 2 deleted: 13 `declaration uses 'sorry'` warnings, no errors (the module's object is not built in the review environment, so the submitted file could only be checked without it). The pinned Tau Ceti source does contain the module, but nothing in `Suggested.lean` refers to any of its declarations (its contents are instances and lemmas on `S.integer K` not named in the file).

   **Exact repair text:** delete line 2 of `packages/ArithmeticKTheory/Suggested.lean`, leaving `import Mathlib` as the only import; adjust the README sentence at lines 174–175 as pass a F15 asks.

3. **F03** (P3) The elementary extension normal form carries a spurious parity hypothesis on r

   **Location:** `packages/ArithmeticKTheory/README.md:1062`: “Let r>0 and w>0 be even.”

   **Claim:** As written both r and w are required even. The argument needs only w even (so that wx has order 2 in (ℤ/2)^r); r is arbitrary positive, and the roadmap's own instances use r = 1 (ℚ, giving ℤ/48 at line 1103 and the r₁ = 1 row of the §5.4 table). The hypothesis as stated excludes the headline example.

   **Witness:** `packages/ArithmeticKTheory/README.md:1103`: “For w=24,r=1 the diagonal extension is ℤ/48”; K-book Theorem VI.9.5(b) (the cached legal copy, line 31715) has the (ℤ/2)^(r₁−1) term for every r₁ > 0.

   **Exact repair text:** replace line 1062 by “First prove the elementary extension normal form. Let r>0 be an integer and let w>0 be even.”

4. **F04** (P3) Process narrative about earlier drafts of this roadmap

   **Location:** `packages/ArithmeticKTheory/README.md:1777`: “so the old strict-root-enlargement test incorrectly rejected F.” and `README.md:2021`: “for the formerly missing exceptional odd image step”.

   **Claim:** Both sentences describe how the roadmap came to say what it says (a test an earlier version used, a step an earlier version lacked). The README is timeless; a reader a year from now cannot know what the “old test” or the “formerly missing step” were. (Lines 245–248 and 2425, “does not yet name” / “The current §5.4”, are process narrative of the same kind; pass a F02 already rewrites those and they are not re-raised.)

   **Witness:** the two quoted lines; nothing elsewhere in the package defines the “strict-root-enlargement test”.

   **Exact repair text:** line 1777: replace “so the old strict-root-enlargement test incorrectly rejected F.” by “so a test demanding a strictly larger dyadic root group in F_v(i) than in F(i) would wrongly reject F; the disjunction above is the correct criterion.” Line 2021: replace “Use Hutchinson's independent cohomological result for the formerly missing exceptional odd image step;” by “Use Hutchinson's independent cohomological result for the exceptional odd image step;”.

5. **F05** (P3) Caputo's Proposition 2 is on page 4, not page 5

   **Location:** `packages/ArithmeticKTheory/README.md:1549`: “(Caputo, arXiv:1002.2936v2, Proposition 2, p. 5, Theorem 1, pp. 12–14, Proposition 4 and Example 2, pp. 16–17.)”

   **Claim:** In the cited arXiv v2 the statement of Proposition 2 (the splitting equivalence between the H² and K_(2i) localization sequences) sits on page 4; page 5 begins after it. The other three locators in the same parenthesis are correct.

   **Witness:** cached legal copy of arXiv:1002.2936v2, line 203 (Proposition 2), page marker for page 5 at line 213; Theorem 1 at line 588 (page 12), Proposition 4 at line 823 (page 16), Example 2 at line 847 (page 17).

   **Exact repair text:** “(Caputo, arXiv:1002.2936v2, Proposition 2, p. 4, Theorem 1, pp. 12–14, Proposition 4 and Example 2, pp. 16–17.)”

6. **F06** (P3) Supplier contracts are not written per supplier, so the gap contracts that pass a requires have no subsection to live in

   **Location:** `packages/ArithmeticKTheory/README.md:177`: “### From the K-theory and homotopy roadmaps”; `README.md:207`: “### From arithmetic, étale and hermitian roadmaps”.

   **Claim:** The README shape requires one `### From TauCetiRoadmap.<X>` subsection per supplier roadmap; declared gaps are read by the intake “in the supplier's subsection” as “What <X> must provide (gap:<slug>)”. The package groups twelve suppliers (and three nonexistent ones, pass a F01) under two thematic headings, so the gap declarations pass a F02 asks for (IntegralIwasawaTheory) and the per-supplier citations have no home, and the dependency tooling cannot attribute a contract to a roadmap by heading.

   **Witness:** `README.md:177–253` contains no heading of the form `### From TauCetiRoadmap.`; the merge order lists `IntegralIwasawaTheory`, `GeneralAlgebraicKTheory`, `StableHomotopyKTheory`, `SchemeKTheoryOperations`, `KTheoryLowDegrees`, `K2SymbolsBrauer`, `KTheoryFiniteLocalFields`, `ArithmeticGaloisDuality`, `SelmerIwasawaCohomology`, `GeometryOfNumbersAndQuadraticArithmetic` and `HermitianKTheoryOfPoincareCategories` as separate roadmaps.

   **Exact repair text:** replace the two thematic headings by one subsection per supplier, in merge order, each headed `### From TauCetiRoadmap.<X>` and containing only that roadmap's consumed sections and the text already written for it (for example `### From TauCetiRoadmap.IntegralIwasawaTheory` holding the paragraph now at lines 243–253 together with the three `What IntegralIwasawaTheory must provide (gap:…)` lines of pass a F02). Suppliers on `main` or in `Completed/` (NumberFieldArithmetic, IntegralLattices, LocalGaloisGroups, ProfiniteArithmetic, ClassFieldTheory, Chebotarev) keep their plain names in `## Scope and ownership`.

## Verified sound

- Read in full: `packages/ArithmeticKTheory/README.md` (3,606 lines, 8 layers, 52 numbered subsections, 62 `**Checks.**` lists), `packages/ArithmeticKTheory/Suggested.lean` (225 lines: 7 definitions, 13 sorried theorems, 12 proved examples, all 20 named declarations appear in the README), `metadata.toml` (`topic = "math.NT"`, the same single key as every other package on the board), `review.json`; `sources.toml` is absent (pass a F14, not re-raised). Every pass a comment on the pull request was read; none of its 21 findings is repeated here. Findings seen independently and not re-raised: F01 (BorelRegulators / MotivicEtaleKTheory / RefinedTraceMethods exist nowhere), F02 (undeclared IntegralIwasawaTheory gaps), F03 (prime-enlargement Check), F04 (name catalogue at lines 201–223, missing docstrings), F05 (wreath valuation needs the maximal root group), F11 (unmirrored Checks), F14, F15, F19 (`IsRegularPrime.decidable`), F21 (hypothesis-contains-conclusion headline).
- Elaboration: as submitted the file does not elaborate in the roadmap repository's Lake environment (error at line 1: the object file of the imported TauCeti module does not exist); with the import removed it elaborates with exactly 13 `declaration uses 'sorry'` warnings and no other diagnostic (F02). Triviality probe: four sorried theorems close in one line and two more in short proofs (F01); `integer_isLocalization_iff`, `integer_isLocalization_of_torsion_classGroup`, `inter_mul_eventually_eq_divisibleSubgroup`, `kummer_criterion`, `isRegularPrime_three`, `isRegularPrime_of_lt_37`, `not_isRegularPrime_37` are genuine targets. `CyclotomicField` takes `ℕ` at the pin, so `IsRegularPrime 0`/`1` are well typed and the proved example is honest.
- Lean versus README: `sUnitSubmonoid` is Mathlib's `Set.integer` units pulled back; both localization statements are true (the forward direction of `integer_isLocalization_iff` uses an element of v⁻¹ with valuation −1 at v, the backward direction clears denominators supported in S by products of the chosen m_v); `divisibleSubgroup` is ⋂_{m≥1} mA with the pointwise image (confirmed by the proved ℚ and ℤ/4 examples); `bottCohomologySlot` reproduces the four rows of the Bott table at lines 2230–2235 and the j = 0, −1, 1 Checks; `evenTwoRank` reproduces K-book Corollary VI.9.9 (cached copy, line 31898); `bernoulliTop` 1, 2 and 0 agree with the stated values; `kummer_criterion` has the odd-prime hypotheses and the range 1 ≤ k ≤ (p−3)/2 of K-book Example VI.2.4.1 (line 28567). Section variables are not silently dropped from any sorried statement (`Finite A`, `Finite T` are explicit).
- Locators verified against the cached legal copies, 60 anchors in 16 sources, 59 correct, one off by a page (F05): K-book Prop. VI.2.2 and Lemma 2.2.1, Prop. VI.2.3 (the four-row dyadic table and the definition of exceptional, lines 28491–28500), Lemma VI.2.4 and Example 2.4.1, Example VI.8.3.1, Thm VI.9.5(a)(b), Def. VI.9.6.1 and the exact sequence (9.6.2) with u = t + j, Lemma 9.6.3, Thm 9.7, Cor. 9.8, Cor. 9.9, the definition of ρ and Cor. 9.10, Thm 9.11, Thm 9.12, Thm VI.10.6 ((ℓ+3)/2 generators in degrees 0, 2ℓ−3, 4k+1), III.6.5.1 (p. 236), Exercise I.3.8 (p. 29); printed pages 471–472, 522–523, 527, 531 agree with the `=== page N ===` markers and the printed footers. Caputo Thm 1 (p. 12), Prop. 4 (p. 16), Example 2 (p. 17); Yokoyama Thm 4 (printed p. 354); Rognes–Weibel Thms 6.7 and 6.9 (pp. 32–33); Hutchinson Remark 2.4, Thm 2.8, Cor. 2.9, Cor. 4.7, Lemma 5.1, Lemma 5.2, Remark 5.4 (pp. 4, 6, 7, 14, 16, 18, 18); Feng–Galatius–Venkatesh (2.6), Prop. 2.9, Lemma 2.10, Lemma 2.11, Cor. 2.12, Remark 2.13, Lemma 2.14 (pp. 12–15; the four-row table at line 649 of the cached copy is exactly the README's); Banaszak (56) p. 17, Remark 6.1 and Thm 6.4 p. 31; Bass–Tate II §3 (printed p. 403), Appendix Prop. 1 (p. 430), Prop. 2 (p. 431); Quillen Thm 1 with Remarks (p. 179) and the end of its proof (pp. 184–185); Kahn Def. 2.3.2 (p. 10), Cor. 2.3.7 and Thm 2.4.1 (p. 12), Prop. 4.2.4 and Cor. 4.2.6 (p. 16), 4.3.2 and Thm 4.3.3 (p. 17); Sharifi Thm 4.4.2 (p. 111), Cors. 4.4.4–4.4.5 (p. 113), Thm 4.5.7 (p. 117), Def. 5.2.4 and Prop. 5.2.5 (p. 134), Remarks 5.2.8–5.2.9 (pp. 135–136); Ribet Main Theorem 1.1 and Thms 1.2–1.3, Prop. 2.1, Lemma 3.1, Props 4.1–4.3 and Thm 4.4 (OCR copy, pages consistent with pp. 151–162); Mitchell Thm 3.4 (printed p. 184); Calegari–Garoufalidis–Zagier Lemma 3.5 (p. 20); Putman–Studenmund Prop. 2.1 (p. 8); Weibel Handbook Thm 73 (p. 169); Sun pp. 4–6 (comma category and pure-submodule poset); Serre III §1 Prop. 1.
- Checks recomputed (36, all correct): w₂, w₄, w₆, w₁₀ of ℚ = 24, 240, 504, 264; w₂(ℚ(i)) = 24 with dyadic part 8; w₂(ℚ(√5)) = 120 and 4/120 = 1/30; w_i(ℚ(i)) = 4 for odd i; w^(3)_i(ℚ) = 1, 3, 9 at i = 1, 2, 6; the ℚ(√−2) subgroup {1,3 mod 8} is cyclic and ℚ(√−7) is exceptional; the mod-two order table of §6.4 against Thm VI.9.7 and against Cor. 9.8's orders 2,4,4,4,2,2,1,2 for ℤ[1/2]; the §6.5 ratios 1/12 and 1/120 and the dyadic H² factor 2; the §6.2 sign computations for ℚ(√7) (j = 1, then 0 after inverting 7; h = 1, h⁺ = 2) and ℚ(√34) (5+√34 of norm −9 with signs (+,−)); ρ = 0 for ℚ(√2) and 1 for ℚ(√7); the special quadratic fields d ≡ −1 (mod 8), d ≡ ±2 (mod 16); ℚ(√−17) and ℚ(√−14) dyadic completions; the three finite-field norm Checks of §6.10; H₁(C₂, ℤ/4) = ℤ/2; the C₄-over-𝔽₅ twist Check; exponent 5 mod 36 for ℓ = 37, k = 16; the §7.4 generator degrees and dimension patterns at ℓ = 3, 5; the §7.5 table at degrees 2, 6, 10, 14, 22 (ℤ/2, 0, ℤ/2, 0, ℤ/691) with c_(2a+2) in degree 8a+6; K₂(ℤ[1/p]) at p = 2, 3 and K₄(ℤ[1/2]) = ℤ/3; 3 has order 10 mod 61, the conductor-61 cubic splits at 3, [F_v:ℚ₃] = 6, and Caputo's Theorem 1 forces the order-3 coefficient kernel with div = 0; the div A counterexample (2x = 0, 2ⁿyₙ = x); the Gaussian relations 3{i,i} = 0 and 4{i,i} = 0 and the eight-element set at q = 5; the golden-field product, conjugation and norm formulas, the eleven prime generators with norms 4,5,9,11,11,19,19,29,29,31,31 and their completeness below 33, the residue images at the norm-5 prime and row 1 of its certificate (g^A − g^B = π_v g^C holds), the covolume 5^(s/2)q^(s−1), d = 2√5/π, and all four cutoff inequalities (16d² < 33, (20d)^(2/3) < 10, d³ < 27/8, 2^(12/5)d^(12/5) < 16d²); |GL₂(𝔽₇)| = 2016 with index 112; the Steinitz transfer formula and tr₀res₀ = ·(d, c_B); β{5,2} = 2, β{2,5} = 3 and t{2,5} = 2.
- Suppliers and merge order. `grep -nx ArithmeticKTheory merge-order/ORDER.txt` is empty: the package is an import not yet in the order, which is not a defect. Depcheck:
  ```text
  NOT IN ORDER: ArithmeticKTheory (insert it after its last supplier)
  depcheck: 8 roadmaps, 57 edges, 1 problem(s)
  ```
  No UPWARD or CYCLE line. Of the suppliers named, eleven are in the merge order (StableHomotopyKTheory, GeneralAlgebraicKTheory, IntegralIwasawaTheory, SchemeKTheoryOperations, KTheoryLowDegrees, K2SymbolsBrauer, ArithmeticGaloisDuality, SelmerIwasawaCohomology, GeometryOfNumbersAndQuadraticArithmetic, HermitianKTheoryOfPoincareCategories, KTheoryFiniteLocalFields), six are on `main` (IntegralLattices, LocalGaloisGroups, ProfiniteArithmetic, ClassFieldTheory, GlobalNumberFields, Chebotarev) and NumberFieldArithmetic is in `Completed/` and is cited by plain name, not as `TauCetiRoadmap.NumberFieldArithmetic`. BorelRegulators, MotivicEtaleKTheory, RefinedTraceMethods and “Part II DA.0” exist nowhere (pass a F01, F17; not re-raised). No gap is declared (pass a F02).
- Policy: lower-case title keeping “K-theory”; no `lemma`, `set_option`, `#eval`/`#print`/`#synth`, LaTeX delimiters, pull-request or issue numbers; ≤ 2 proved examples per definition; no `def := sorry`; the module docstring has the required form. The adversarial pass over the main targets (field versus DVR, S = ∅ and S = Spec¹, r₁ = 0, p = 2, i = 0 and i = 1, the zero group, m = 1, q = 2) found no false “iff” or missing hypothesis beyond those pass a reports; the §1.1 criterion, §3.3 finite kernel/cokernel parities, §3.4 infinite torsion of K_(2i)(F), §5.2 Bockstein, §6.6 stabilization statement and §7.5 Vandiver deduction are correct as stated.

## Not verifiable

- `Suggested.lean` as submitted: the TauCeti module it imports is present in the pinned Tau Ceti source but not compiled in the roadmap repository's Lake environment, so the file could only be elaborated after deleting the import (F02); the result with the import present is inferred, not observed.
- Pass a F11's Bernoulli mirrors: `norm_num [bernoulli, bernoulli']` and `norm_num [bernoulli'_def]` at indices 10 and 12 exceed the default heartbeat/recursion limits in a probe copy, so the repair of F11 will need an explicit finite-sum evaluation rather than a one-tactic proof; the values 5/66 and 691/2730 themselves are correct.
- Groenewegen locators use the author preprint's pagination; only the journal version is in the cache, so pages 5–13 were not checked (pass a's remark stands). Harris–Segal §3 (Annals, paywalled) was not checked. The Ribet copy is an OCR of a scan with a cover page, so its printed-page attributions were checked only up to a one-page uncertainty.
- The 173 golden-field relations and 23 signed minors beyond row 1 at norm 5 were not recomputed here (pass a reports all 207 checks pass).
- The claims that need unavailable supplier exports (M.7 edges, R.1 Steinberg finiteness, H.3 finite-type theorem, the hermitian comparison ranges) were checked for internal consistency only.
