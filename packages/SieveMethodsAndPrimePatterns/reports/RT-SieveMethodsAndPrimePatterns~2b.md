<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/177#issuecomment-6351990546 -->
Red team round 2 pass b (claude) of 4fbab2b

Verdict: needs_changes

1. **F01** (P1) The finite Gram inequalities are cited upward from a later roadmap that itself imports them from this one; the object now has no owner

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:67`: “ErdosProgressionPowers §3.1 supplies the uniform-row, maximum-row and diagonal/off-diagonal finite Gram inequalities, including empty families; §0.4 here supplies the weighted denominator theorem.”; the same citation at `README.md:11`, `:1119`, `:1129`, `:1533`; the proof sketch at `README.md:1529`: “Apply bombieri-row-bound to the family of tapered vectors and f.”

   **Claim:** On the board's main the merge order places this roadmap at position 83 and ErdosProgressionPowers at 187, so every one of these citations is an upward dependency and the gate prints an UPWARD line. ErdosProgressionPowers is an accepted board package whose sections are EP.0–EP.7: it has no §3.1, its `Suggested.lean` declares nothing about a Gram matrix, and its own supplier table imports “the diagonal/off-diagonal Gram inequality” from this roadmap. The round-1 repair of pass a's F09 deleted the three §0.4 targets (uniform-row bound, maximum-row bound, diagonal/off-diagonal bound) on a witness (`TauCetiRoadmap/ErdosProgressionPowers/README.md:1001`, `Suggested.lean:400 finiteGramBound`) that exists neither on `main` nor in the board package. The uniform-row bound that `README.md:1529`, `:1119`, `:1129` and `:1533` consume is therefore stated nowhere, and `README.md:1529` still names the deleted target by its slug. The order cannot be repaired by moving this roadmap: ProbabilisticAndMetricNumberTheory (position 84, open board package) declares two gaps against this roadmap and must stay below it. The notion moves down to the earlier owner, which is this roadmap: the three bounds are one-line corollaries of the kept `SieveGram.selberg_weighted_inner`, and ErdosProgressionPowers already consumes them from here.

   **Witness:** the dependency check prints `UPWARD: SieveMethodsAndPrimePatterns (#82) -> ErdosProgressionPowers (#186) at README lines [67, 1119, 1129, 1533]`; `packages/ErdosProgressionPowers/README.md:56`: “`SieveMethodsAndPrimePatterns:SV.2` | the diagonal/off-diagonal Gram inequality | EP.3”; `packages/ErdosProgressionPowers/README.md:613`: “`SieveMethodsAndPrimePatterns:SV.2` — bombieri diagonal offdiagonal”; `packages/ErdosProgressionPowers/README.md` headings run `## EP.0.` (line 152) to `## EP.7.` (line 943) with no 3.1; the string `bombieri-row-bound` occurs in this README only at line 1529, and no target of that title exists.

   **Exact repair text:** (a) insert after `README.md:438` (the *Needs* line of “Selberg's weighted inner-product inequality”):

   ```
   **Inner-product bound from a uniform Gram row estimate.** If B≥0 and rᵢ≤B for every i, then Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖²B.

   x∈E; B is a real nonnegative bound. I may be empty.

   ([BOMBIERI-1971](#references), p.402, Proposition 1; p.403, reduction to the uniform row bound (5).)

   *Proof sketch.* If rᵢ=0 then the vanishing-row law makes yᵢ=0, so its numerator is zero. For rᵢ>0 multiply rᵢ≤B by the nonnegative quotient |⟨x,yᵢ⟩|²/rᵢ. Sum and multiply the weighted inner-product inequality by B≥0. No maximum is taken, so the empty family is included.

   B=0 forces every indexed vector to vanish. For the empty family and x=1, B=−1 would assert 0≤−1; the sign hypothesis is needed in the empty case.

   *Needs:* Layer 0 §0.4 vanishing gram row detects the zero vector; Layer 0 §0.4 selberg's weighted inner-product inequality.

   **Bombieri–Selberg Gram-row inequality.** For nonempty I, Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖² maxᵢ∈I rᵢ.

   x∈E; I nonempty; the maximum is the finite supremum of the row sums.

   ([BENNETT-SIKSEK-2020](#references), §8.2, Theorem 7, p.379; [BOMBIERI-1971](#references), pp.402–403, Proposition 1 and the uniform-row reduction.)

   *Proof sketch.* Take B to be the finite supremum of the row sums; every row is bounded by it, and one index shows B≥0. Apply the uniform-row bound.

   For m copies of one unit vector and x that vector both sides equal m. For y=(1,2) and x=1 over ℝ the left side is 5 and the maximal row is 6. Taking the maximum of single entries instead of row sums fails on repeated unit vectors.

   *Needs:* Layer 0 §0.4 inner-product bound from a uniform gram row estimate; Mathlib `Finset.sup'`; Mathlib `Finset.le_sup'`.

   **Diagonal and off-diagonal Gram estimate.** If D,C≥0, ‖yᵢ‖²≤D for every i and |⟨yᵢ,yⱼ⟩|≤C for i≠j, then Σᵢ|⟨x,yᵢ⟩|² ≤ ‖x‖²(D+(|I|−1)₊C), with (|I|−1)₊ natural truncated subtraction.

   x∈E; I may be empty; D,C real and nonnegative.

   ([BENNETT-SIKSEK-2020](#references), §8.2, p.380, the diagonal/off-diagonal estimates between (34) and (35).)

   *Proof sketch.* Split each row into its diagonal term ‖yᵢ‖² and the |I|−1 remaining entries, each at most C. Every row is at most D+(|I|−1)₊C, and the uniform-row bound applies. For nonempty I, dividing by |I| gives the normalized form ‖x‖²(D/|I|+C).

   The empty family gives 0≤‖x‖²D; a singleton has no off-diagonal term; m≥1 repeated unit vectors with D=C=1 give equality with constant m; an orthonormal family with D=1, C=0 is the finite Bessel bound.

   *Needs:* Layer 0 §0.4 inner-product bound from a uniform gram row estimate; Mathlib `inner_self_eq_norm_sq`; Mathlib `Finset.add_sum_erase`; Mathlib `Finset.card_erase_of_mem`.
   ```

   (b) at `README.md:11` replace “ErdosProgressionPowers §3.1 owns the uniform Gram-row, maximum-row and diagonal/off-diagonal inequalities; the weighted denominator inequality here is stronger and remains a target.” by “Layer 0 §0.4 owns the weighted denominator inequality and its uniform-row, maximum-row and diagonal/off-diagonal corollaries; ErdosProgressionPowers EP.3 consumes the last of these.”; (c) at `README.md:67` replace the sentence beginning “ErdosProgressionPowers §3.1 supplies” by “§0.4 here supplies the weighted denominator theorem and its uniform-row, maximum-row and diagonal/off-diagonal corollaries.”; (d) at `README.md:1119` replace “ErdosProgressionPowers §3.1 finite Gram inequality” and at `:1129` and `:1533` replace “ErdosProgressionPowers §3.1 uniform Gram-row inequality” by “Layer 0 §0.4 inner-product bound from a uniform gram row estimate”; (e) at `README.md:1529` replace “Apply bombieri-row-bound to the family of tapered vectors and f.” by “Apply the inner-product bound from a uniform Gram row estimate of §0.4 to the family of tapered vectors and f.”. On the consumer side (not this package): `packages/ErdosProgressionPowers/README.md:56` and `:613` should cite “SieveMethodsAndPrimePatterns §0.4” instead of the explorer label `SieveMethodsAndPrimePatterns:SV.2`. The merge order itself needs no change.

2. **F02** (P3) A fixed supplier-and-gap string is pasted onto 29 *Needs* lines, including targets that use none of it

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3387`: “*Needs:* Mathlib `Nat.primeFactors`; AnalyticNumberTheoryPartI §§0.10–0.11, 0.21, 0.26 and 3.26; gaps analytic-divisor-moments and uniform-wirsing.”; the identical string also at `README.md:2256` and `:2595`.

   **Claim:** The string “AnalyticNumberTheoryPartI §§0.10–0.11, 0.21, 0.26 and 3.26; gaps analytic-divisor-moments and uniform-wirsing” occurs verbatim on 29 *Needs* lines (835, 901, 927, 1078, 1145, 1185, 1281, 1291, 1301, 1327, 1377, 2256, 2315, 2325, 2339, 2353, 2363, 2373, 2399, 2595, 2605, 2617, 2627, 2639, 2651, 2954, 3119, 3387, 3646), the round-1 replacement of the former AN.2/AN.3/AN.5 labels. A *Needs* line lists what the statement and its route need, item by item. The Goldbach local factor (3364–3387) needs only that Σ1/(p−1)² converges and that a product of positive factors with summable logarithms is positive, both pinned Mathlib; the definition PrimesHaveLevel (2221–2256) needs only its carriers; the λ-size bound (2585–2595) names its real input, §0.21, separately at the end of the same line. Each false edge blocks a target behind two analytic gaps and inflates the dependency graph the gate reads (106 edges).

   **Witness:** `README.md:3370`: “The sum of 1/(p−1)² converges and each factor is positive; invoke the convergent positive-product criterion.”; `README.md:2595` ends “…gaps analytic-divisor-moments and uniform-wirsing; AnalyticNumberTheoryPartI §0.21.”; the pinned Mathlib declarations `Real.summable_one_div_nat_pow`, `Summable.of_nonneg_of_le`, `Real.multipliable_one_add_of_summable` and `Real.summable_log_one_add_of_summable` elaborate in a probe copy.

   **Exact repair text:** line 3387: “*Needs:* Mathlib `Nat.primeFactors`; Mathlib `Real.summable_one_div_nat_pow`; Mathlib `Summable.of_nonneg_of_le`; Mathlib `Real.multipliable_one_add_of_summable`; Mathlib `Real.summable_log_one_add_of_summable`.”; line 2256: “*Needs:* Mathlib `Nat.primeCounting`; Mathlib `Nat.totient`; Mathlib `Nat.ModEq`; Mathlib `Asymptotics.IsBigO`.”; line 2595: “*Needs:* Layer 4 §4.2 maynard's multidimensional sieve weights; AnalyticNumberTheoryPartI §0.21.”; on each of the other 26 lines keep only the AnalyticNumberTheoryPartI sections and the gaps that the target's own proof sketch names.

3. **F03** (P3) The manifest names one author for a three-author work

   **Location:** `packages/SieveMethodsAndPrimePatterns/sources.toml:384`: “authors = "Duke"”.

   **Claim:** The manifest records the authors of every cited work; the README's own reference entry lists three authors for the same key, so the manifest entry misidentifies the work.

   **Witness:** `packages/SieveMethodsAndPrimePatterns/README.md:3851`: “**DFI-1997.** W. Duke, J. Friedlander and H. Iwaniec, Bilinear forms with Kloosterman fractions (1997), Lemma 9”.

   **Exact repair text:** replace line 384 by `authors = "W. Duke, J. Friedlander, H. Iwaniec"`.

4. **F04** (P3) Process vocabulary in a target statement

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2054`: “This is the normalized form of the routed equation (7.11); it does not include the consumer’s prebox equidistribution induction.”

   **Claim:** “routed” is neither the literature's nor Mathlib's vocabulary and is not defined in the roadmap; it records how the explorer assigned the source equation to this target, which a reader a year from now cannot interpret.

   **Witness:** the word occurs only at line 2054 of the README; the sentence reads correctly without it.

   **Exact repair text:** replace “This is the normalized form of the routed equation (7.11); it does not include the consumer’s prebox equidistribution induction.” by “This is the normalized form of equation (7.11); it does not include the consumer’s prebox equidistribution induction.”

## Verified sound

Read all 3,851 README lines and all 413 Lean lines. The Lean file has 44 declarations (15 definitions, 29 theorems, 0 examples), each with its own docstring; every one of the 44 backticked own names in the README is declared in the file and every Lean name occurs in the README. All 228 targets and definitions carrying a *Needs* line were read with their hypotheses, Checks and dependencies, together with the 12 outstanding supplier contracts and the 68 source-sensitive conventions.

Elaboration: the submitted `Suggested.lean` (single `import Mathlib`, no `TauCeti.*` import) elaborated in a probe copy against the pinned Mathlib `6b7abb3c` with exit code 0 and exactly 29 `declaration uses 'sorry'` warnings and no other diagnostic. The pins the README advertises at line 41 are the ones checked out (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`). No standing `variable` is lost: the only `variable` block (`SieveGram`) is mentioned by its single theorem, and every other binder is explicit.

One-tactic probe: `selberg_upper_bound`, `vaughan_identity`, `selberg_weighted_inner`, `brun_reciprocals` and `positive_proportion_prime_tuples` were each tried with `simp` and `exact?` in a probe copy; none closes. The remaining 24 theorems are analytic statements with no plausible one-tactic proof. No sorried theorem is a one-tactic consequence of the pins; no padding remains (the 68 admitted examples are gone).

Round-1 repairs verified on this head (not re-raised): pass b F01 (`progression_upper` at Lean 80–85, exactly the proposed signature), F02 (`max_def`, `Int.cast_abs` at README:1431, both at the pin), F03 (the word “finding” is absent), F04 (the Completed link at line 65; no “ST.2”); pass a F01 (0 examples), F02 (μ² at 1313 with the 2ᵃ3ᵇ control), F03 (n+h₁>0 at 2510), F04 (the square-sum inference is gone; the sparse-prime control at 1319–1321), F05 (the positive lower sieve above 9t at 3051–3067, consumed at 3313–3325), F06 (no affine stand-in), F07 (no AN./FF./AC./ES. label survives), F08 and F12 (12 gaps, each with one owner, present in both `design/plan.json` and the README and consumed by at least one *Needs* line: 24, 24, 3, 2, 8, 2, 2, 3, 1, 1, 1, 1 uses), F10–F11 (the adapter at 646–665 with hD and 1<D.natAbs), F13 (the reciprocity adapter at 3464–3478), F14 (the ideal divisor bounds at 3565–3581), F15 (both headlines in Lean), F16–F17, F18, F19 (29 manifest entries: 22 certified with cached extractions, 3 uncertified, 4 waived), F20 (the strict local margin at 3105 with the multiples-of-30 control), F21 (the full range at 1121–1130 with the named conservative cutoff). Pass a's F09 repair is F01 above. The “not actionable” reasons for F08 and F12 hold.

Lean versus README, instantiated by hand: `progression_upper` at k=1 (Chebyshev) and the positivity of log(x/k) for x≥4k; `smith_prime_legendre_bilinear` and `koymans_pagano_row_mean` against the README (quantifier order ε before C; c₂,c₄,a before ε) and the derivation of the latter from the former (t₁t₂^{3/4+ε}≤t₂t₁^{3/4+ε} for t₁≤t₂, division by the two cardinality bounds, (log t₂)^{c₄}≤t₁^{c₂c₄}); `prime_quadratic_bilinear` from Heath-Brown's Corollary 4 (K√L+√K L≤2KL/√min(K,L), the K term at p=2); `vaughan_identity` at n=V=2, U=1 (log 2 + log 2 − log 2 + 0) and as the convolution identity Λ=Λ_{≤V}+μ∗λ_V; `maynardM 0 = 0` and `maynardM 1 = 1` from the Lean definitions (the empty cube has mass one; J≤I by Cauchy–Schwarz, equality for the indicator of [0,1]); `infinite_many_primes_of_level` at k=0 and k=1; `discrepancy` at q=0 (empty supremum 0) and q=1; `barban_davenport_halberstam` at Q=1 (the prime number theorem with a logarithmic saving); `bombieri_vinogradov_maximal` (the inner set is nonempty and bounded for every q≥1).

Checks recomputed (34, those added or changed by the fix): the squarefree denominator Σ_{d<z}μ²(d)/φ(d)∼log z with H_g=1 and the general constant 1/(Γ(κ+1)H_g) by the Dirichlet-series expansion; each 2ᵃ3ᵇ contributes 1/2 without μ²; Richert's multiples of 30 (g(2)=g(3)=g(5)=1, Ω≥3, |R_d|≤1); Brun's λ± at P=6, y=4, β=2 (λ⁻: 1,−1,−1,0; λ⁺ keeps only 1) and at P=2, y=8; exp(10−u)K¹⁰=1024 at u=10, K=2; the curvature comparison (R=32: 1024≤1024π and 4≤56.7; R≤1 forces z⁵≤π; the unrelated-R control 248.832≤10⁸ but 14400>10⁴); the finite-character Gram Checks (w=1: N² against N; two points at moduli 1 and 2: character sums 0,0,2,2, squared sum 8, energy 2; θ=1/4: exponent 13/2 and w^{13/2}=z⁵) and the row-error algebra w^{2−θ}Σ_{n≤w}n^{4−θ}≤w^{7−2θ} with the bound (1+3Cₗ)A; the §0.4 instance x=1, y=(1,2): 1/3+4/6=1, the squared-denominator failure at y=1/2 (4>1), coefficient 1/2 against the printed 1/8 (defect 0 against 9/16); discrepancy(5,3)=3/2 and the wrong value 1; windowError(2,3)=2; primeCountAP(5,0,5)=1 and (4,0,5)=0; wResidue({0,2},3)=5 and wModulus(1)=1; F=x on the triangle (I=1/12, J=1/20, 1/30); G_{1,1}(x)=x, G_{2,1}(2)=6, G_{0,2}(5)=1; the Lemma 8.1 instances 1/2520 and 1/2; the taper width at δ=1/2 and 3/10 and the roots 1±0.4213 of r²−2r+π²/12; the Fourier-translation examples 0, 2i, i; the three intervalVector shapes; the dyadic sum 112≤126 and the cover R=2, Q=5, J=2; stdAddChar at (4,1,−1)=−i; the ideal symbols (2/(5))=−1, (4/(5))=1, (15/(5))=0 and (2/(5O_K))=1 in every quadratic field; the reciprocity instances (3,7) and (−1,−1); Λ₂≈1.834, Λ₃≈2.771; 2.6408−1.9702=0.6706.

Locators verified against the cached legal copies (35 locators in 17 sources): SMITH-17 Proposition 6.6 (the bound t′₁t′₂^{3/4+ε}+t′₂t′₁^{3/4+ε} on disjoint sets of odd primes, line 3226); KP-22 Proposition 7.6 (line 2891) and (7.11) (line 2996, the exponent −(1/4−c₂c₄−ε)); KM-21 Conjecture C_n (lines 340–345: δ(n), C(n,ε), Q≥3, N≤Q^{1/n}, real nonprincipal characters of modulus q≤Q) and Corollary 2.2 (line 353); GGPY-2009 Lemma 3 (line 410, (2.3)–(2.4) are (Ω₁),(Ω₂)) and Lemma 4 (line 443); KHAYUTIN-19 Definition 9.4 (lines 3460–3469: R_max is the maximal radius of curvature and L(Cₗ,θₗ) is exactly the gap's displayed discrepancy) and the Lemma 9.9 discrepancy construction (lines 3611–3624, printed p.225); KED-ANT-14 (14.2.1) (line 463); IWA-ROSSER Theorem 4, the Fundamental Lemma (line 221, on the printed spread 176–177) and Theorem 1 (line 79); KED-chap-bombieri Theorem 17.4 (line 431); KED-ANT-18 Corollary 18.6 (line 652) and Exercise 18.4.5 (line 670); KED-ANT-16 Lemma 16.5 (516), Definition 16.6 (549), Theorem 16.7 (556); KED-chap-largesieve Lemma 15.1 (391), Exercise 15.4.2 (407) and the remark that only δ⁻¹+N is proved there (527); BSKK-23 (3.5) (1395), Lemma 6.2 (1832, 2ℓ≥m), Lemma 8.2 (2269), Lemma 8.3 (2504, T excluded); SS-23 Theorem 1.1 (71) and Lemma 6.3 (2803, printed p.726); FIMR-13 Lemma 2.1 (299), Proposition 5.1 (1120), Proposition 5.2 (1304); HB-REAL-95 Corollary 4 (243, p.238) and its proof (2571–2600, p.267); HB-SIEVES Corollary 3.3 (1054) and Theorem 5.1 (1768); MAYNARD-2015 Theorem 1.2 (107); BOMBIERI-1971 Proposition 1 on p.402.

Supplier citations checked: ThetaSeries §2H declares `kroneckerSym` and `kroneckerChar` (`TauCetiRoadmap/ThetaSeries/README.md:563`, `:573`); QuadraticFormInvariants §6C names `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula` (`:569–577`); ClassFieldTheory Layer 14 is “Hilbert reciprocity and quadratic reciprocity” (`:1872`); Chebotarev Layer 13 is “`ϑ_C` and `π_C`” (`:590`); GlobalNumberFields states `rayClassIdealCount` and its companions (`:136–138`) and has twelve layers; the active IntegralLattices has the half-norm and dyadic Jordan data; Isoperimetry I2 and RiemannianGeometry R4.9.6a (`:856`) exist; ArithmeticDirichletSeries is linked as Completed. The Tau Ceti line citations `VonMangoldt.lean:84`, `:180`, `Convolution.lean:369` and `Character.lean:34` and the Mathlib line citations `AddCharacter.lean:240`, `:250`, `LinearOrder.lean:132`, `Cast.lean:81` print the declarations claimed; `fundamentalDiscriminantChar D hD` has level `D.natAbs` with the explicit proof. All 199 Mathlib names cited in *Needs* lines elaborate under `#check` at the pin. Mathlib has no large-sieve inequality, no Kronecker symbol and no Selberg weighted inner-product inequality, and Tau Ceti has no Kronecker symbol, so the module docstring's not-statable claims hold. AnalyticNumberTheoryPartI (80), GeometryOfNumbersAndQuadraticArithmetic (63), AdelicAlgebraicGroups (30) and InverseGaloisAndArithmeticFundamentalGroups (42) are above this roadmap (83) in the merge order on the board's main and so count as owners. ProbabilisticAndMetricNumberTheory (84, open board PR) consumes this roadmap through its gaps kubilius-uniform-sieve and prime-restriction-fourth-moment (its README lines 59–63): the consumer edge the merge order records is real.

Policy: one `import Mathlib`, no `TauCeti.*` import, no example, no `set_option`, no `lemma`, no `def := sorry`, no LaTeX delimiters, no issue or pull-request numbers, no “finding”, “review”, “round” or “so far”, lower-case title, `/-! ## Layer k -/` comments in README order, namespace `TauCetiRoadmap.SieveMethodsAndPrimePatterns`. The dependency check printed:

```text
UPWARD: SieveMethodsAndPrimePatterns (#82) -> ErdosProgressionPowers (#186) at README lines [67, 1119, 1129, 1533]
depcheck: 14 roadmaps, 106 edges, 1 problem(s)
```

The package is present in the merge order on the board's main (position 83); its absence from the branch's own `merge-order/ORDER.txt` snapshot is not a defect. No pass a round-2 comment was posted when this pass was written.

## Not verifiable

- The printed constant of Bombieri's main Theorem (BOMBIERI-1971 p.401): the cached OCR does not render the display; the README's H+2/δ is proved by the roadmap's own taper-width argument, so nothing depends on it.
- CHEN-73-CN, HR-SIEVE, RICHERT-1969 and KM-16RANK-published are waived and BGS-10, FIMR-ERRATUM-2015 and DFI-1997 uncertified: the Chen constants, Richert's Theorem A, Halberstam–Richert Lemmas 5.3–5.4, the affine and spin exponents and the 9t sifting limit cited from BGS-10 Theorem 3.1 were not collated.
- AnalyticNumberTheoryPartI §§0.10–0.11, 0.21, 0.26, 0.31, 0.32, 3.1, 3.3–3.4, 3.26, 3.32, 3.34–3.35 (with `smoothCount_dickman`, `smoothCount_rankin`), GeometryOfNumbersAndQuadraticArithmetic §4.1, AdelicAlgebraicGroups §4.2 and InverseGaloisAndArithmeticFundamentalGroups §IG.2.5: these roadmaps have no files on `main`, in the board's packages or in an open board pull request, so the section numbers and declaration names could not be checked.
- KP-22 Proposition 7.6 assumptions (ii)–(iii) behind (7.11): only the equation and the proposition head were read; the growth and cardinality hypotheses at README:2054 were checked against the derivation, not against the source text.
- JUTILA-ORIGINAL Lemma 3: the (log N)⁵ factor and the discriminant range remain illegible in the spread OCR, as in round 1.
- The analytic content of the 29 deep sorried theorems and of the long proof obligations (maximal Bombieri–Vinogradov, Khayutin's corrected-density R₂ step, the spin Type I extension): a sorry build checks elaboration only; only boundary instances were examined.
- Pass a's round-1 witness for ErdosProgressionPowers (`§3.1`, `Suggested.lean:400 finiteGramBound`) matches no file on `main` or on the board; this pass treats the accepted board package as the authoritative head.
