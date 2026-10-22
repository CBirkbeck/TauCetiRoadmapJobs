<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/177#issuecomment-6332483779 -->
Red team round 1 pass a (codex) of 25cdbc4

Verdict: needs_changes

1. **F01** (P3) Every Lean example is admitted

   **Location:** `packages/SieveMethodsAndPrimePatterns/Suggested.lean:40`, and every subsequent `example`.

   **Claim:** The file supplies discriminating validation examples for its definitions.

   **Witness:** All 68 `example` declarations use `sorry`; none is proved. Lines 40–46 test the imported `BoundingSieve`, not a definition introduced here.

   **Exact repair text:** “Keep at most two proved, discriminating examples per retained definition. Replace every admitted boundary example that cannot yet be proved by a named theorem target, with the same statement and locator in README.md. Delete examples solely about imported objects.” Apply this to all 68 examples; retain no admitted `example`.

2. **F02** (P1) The general Selberg denominator omits squarefree support

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1279`, “Σ_(d<z)∏_(p|d)g(p)/(1−g(p))”.

   **Claim:** This sum is asymptotic to the stated constant times (log z)^κ.

   **Witness:** Set g(n)=μ²(n)/n and κ=1. For a,b≥1, every d=2^a3^b contributes 1/2. There are ≍(log z)² such d<z, whereas the claimed asymptotic is log z.

   **Exact repair text:** Replace the sum by “Σ_(1≤d<z) μ(d)² ∏_(p|d) g(p)/(1−g(p))”. Add the negative-control Check: “For g(n)=μ²(n)/n, omitting μ(d)² produces at least quadratic logarithmic growth from 2^a3^b.”

3. **F03** (P2) Maynard’s native divisor comparison fails at zero

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2463`, `maynardWeight_one_eq_sum_lambdaSquared`; also the construction at line 2448.

   **Claim:** In dimension one, the weight always equals the native divisor sum over n+h₁.

   **Witness:** Take n=h₁=0, R=2, W=1 and F(0)=1. The finite supported weight is 1. Mathlib’s divisor finset at zero is empty, so the displayed right side is 0.

   **Exact repair text:** “For k=1 and n+h₁>0, w_n=Σ_(e∣n+h₁) BoundingSieve.lambdaSquared(λ)(e). At n+h₁=0 use the finite support sum directly.” Add the zero-value negative control and its proved Lean example once this definition is retained.

4. **F04** (P1) The diagonal-sum proof assumes a divergent prime series is finite

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:938`, “Σ_p g(p)² log p = O_{A₁,A₂}(1)”.

   **Claim:** (Ω₁) and (Ω₂) imply this square-sum estimate.

   **Witness:** Choose one prime p_j∈(2^j,2^(j+1)) for j≥2; set γ(p_j)/p_j=log(2)/log(p_j), zero elsewhere. Both Ω conditions hold with fixed constants, but g(p_j)²log(p_j)≍1/j.

   **Exact repair text:** “Do not assert square-sum convergence from (Ω₁),(Ω₂). Prove the dimension-one diagonal asymptotic directly under those hypotheses using the complete Halberstam–Richert argument; retain the coprime correction terms without this estimate.” Add the sparse-prime construction as a negative-control Check. Do not strengthen the theorem by silently adding square summability.

5. **F05** (P1) The affine factor bound consumes a stronger Brun theorem than is provided

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3225` and `:3235`, “s>9t”.

   **Claim:** The preceding Brun theorem gives a positive lower count for every s>9t and hence the displayed factor bound with coefficient 9t.

   **Witness:** Line 1031 requires s≥9t+1 and its error is exp(9t+1−s)K^10. For t=1, s=9.5 the theorem is inapplicable; even s=10 gives error K^10>1.

   **Exact repair text:** “Before affine_saturation, state and prove a sieve theorem giving a positive lower count for every s>9t under the affine density hypotheses, with its exact locator and uniform constants. Use that theorem in affine_factor_bound.” The existing elementary Brun estimate cannot discharge the published factor bound; a conditional substitute must be separately named.

6. **F06** (P2) The Lean affine headline is only a finite error-summing bound

   **Location:** `packages/SieveMethodsAndPrimePatterns/Suggested.lean:694`; `packages/SieveMethodsAndPrimePatterns/README.md:3199`.

   **Claim:** `affine_expansion_level` is the headline deriving a level from congruence expansion.

   **Witness:** The Lean signature quantifies an arbitrary function R and assumes its pointwise bound. It contains no orbit, word population, squarefree reduction, expansion or sieve level; it also assumes the bound for all integers k.

   **Exact repair text:** “Keep affine_expansion_level as a README target until its word-population and mixing interfaces exist. Remove this Lean stand-in. If useful, name the finite sum estimate separately in README.md with its own hypotheses and locator.”

7. **F07** (P1) Supplier names and section identifiers do not resolve

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:47`, `:66`, `:68`, `:76`.

   **Claim:** AnalyticNumberTheory AN.2/AN.3/AN.5, FiniteFieldsAndCharacterSums FF.2/FF.3, AdditiveCombinatorics AC.1/AC.4 and ExponentialSumsAndCircleMethod §1.3 provide the cited interfaces.

   **Witness:** None of those four roadmap folders exists in the supplied active/completed main checkout or seven permitted sibling heads. `merge-order/ORDER.txt` instead names AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII; the advertised declarations cannot be checked at these invented sections.

   **Exact repair text:** “Replace every affected supplier-table and Needs citation by an existing earlier roadmap's exact name, current section and target. For each stronger or absent interface, register a precise gap with that existing owner; do not treat the old AN/FF/AC labels as supplied declarations.” Recheck all downstream occurrences, including maximal Siegel–Walfisz, divisor moments, Wirsing uniformity, Lang–Weil, smooth counts and C_m.

8. **F08** (P1) The expansion and spin endpoints consume undeclared supplier gaps

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:64`, `:68`, `:3093`, `:3245`, `:3405`.

   **Claim:** Unconditional SL₂ expansion and the Type I spin estimate conditional only on C_|S|n consume outstanding geometric, subgroup-approximation and noncommutative expansion requests as proof inputs.

   **Witness:** Lines 64 and 68 acknowledge that the cited layers do not state these inputs. There is no readable `design/plan.json` or matching gap slug. The endpoints at 3239 and 3405 do not retain those additional hypotheses.

   **Exact repair text:** “Register separate precise gaps for the sliced lattice estimate, codimension-two geometric sieve, subgroup strong approximation, squarefree-ring sum-product and noncommutative flattening. Give each an existing earlier owner, exact section and hypotheses; add matching plan gaps and ‘What <Supplier> must provide (gap:<slug>): <needs>’ sentences under Exact supplier contracts. Cite these contracts at spin_squarefull_tail, spin_common_norm_tail and sl2_squarefree_expansion, and propagate them through joint_spin_typeI.” Alternatively own the missing targets here. A geometric theorem explicitly conditional on its counting estimate is not itself asserted false by this finding.

9. **F09** (P1) The finite Gram bound is already owned by an earlier sibling

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:426`, `:438`, `:450`; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:62`.

   **Claim:** The uniform Gram-row, maximum-row and diagonal/off-diagonal bounds are new roadmap targets.

   **Witness:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:980`–985, §3.1, owns all three forms, including empty families; its `Suggested.lean:400` states `finiteGramBound` with the same real/complex inner-product hypotheses. ErdosProgressionPowers precedes this package.

   **Exact repair text:** “Supplied by ErdosProgressionPowers §3.1, finiteGramBound and its diagonal/off-diagonal specialization.” Delete the duplicated target and Lean blocks; repoint consumers to that supplier. Keep any genuinely stronger weighted denominator theorem separate from the already owned unweighted corollaries.

10. **F10** (P1) The general discriminant character duplicates ThetaSeries

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:670`; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:157`.

   **Claim:** Extending the fundamental-discriminant character to nonfundamental discriminants requires a new dyadic/Jacobi construction here.

   **Witness:** `TauCetiRoadmap/ThetaSeries/README.md:562`–574, §2H, already owns `kroneckerSym`, its dyadic values, multiplicativity and the character for every nonzero D≡0,1 modulo 4, without fundamentalness.

   **Exact repair text:** “Import ThetaSeries §2H, kroneckerSym and kroneckerChar. Define only the sieve adapter χ_D(0)=0 and χ_D(n)=kroneckerSym D n for n>0, with the real coercion and |D|>1 comparison.” Remove the duplicated construction and periodicity/multiplicativity development. Because the supplier carrier is not at the pins, keep this adapter in README until it is statable without another roadmap import.

11. **F11** (P2) The fundamental-character API forgets its modulus-one exclusion

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:685`, “For a fundamental discriminant D and every natural n”.

   **Claim:** The exposed API equates χ_D(n) to the native character for every fundamental D, although lines 672 and 694 exclude modulus one.

   **Witness:** D=1 is fundamental (`TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean:81`). At n=0, the new χ₁ is zero, while every Dirichlet character modulo one evaluates to one. The native definition also takes an explicit fundamentalness proof.

   **Exact repair text:** “For hD : IsFundamentalDiscriminant D, with 1 < D.natAbs, and every natural n, χ_D(n) equals the real coercion of fundamentalDiscriminantChar D hD evaluated at n.” Add the D=1,n=0 inequality as the negative-control Check; make the API match its surrounding restriction.

12. **F12** (P1) Conductor-prime ideal counting has no supplied theorem

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:858`, `:864`, “imported conductor-local ideal-count formula”.

   **Claim:** GlobalNumberFields Layer 11 and ArithmeticDirichletSeries Layer 1 supply the local norm-fibre formulas for invertible ideals of arbitrary quadratic orders.

   **Witness:** `TauCetiRoadmap/GlobalNumberFields/README.md:586`–590 provides extension/contraction only away from the conductor. `Completed/ArithmeticDirichletSeries/README.md`, Layer 1, counts maximal-order ideals. Neither provides the conductor-prime formula consumed at line 864.

   **Exact repair text:** “Register a GlobalNumberFields Layer 11 gap for finite norm fibres and explicit prime-power counts of integral invertible ideals of a quadratic order, including primes dividing its conductor, sufficient for the stated multiplicative-growth bound.” Keep the arbitrary-order theorem and its conductor cases; cite the gap instead of asserting the formula is supplied.

13. **F13** (P1) The ideal reciprocity comparison is assigned to the wrong owner

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:74`, `:90`, `:3403`.

   **Claim:** ClassFieldTheory Layer 14 supplies the number-field ideal-symbol reciprocity identity with explicit odd, dyadic and infinite comparisons.

   **Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md:1884`–1892 supplies the cohomological product formula and explicit reciprocity for ℚ. `TauCetiRoadmap/QuadraticFormInvariants/README.md:1873`–1883 owns the classical-symbol comparison and multiplicative product formula.

   **Exact repair text:** “Import ClassFieldTheory Layer 14 for the cohomological product formula and QuadraticFormInvariants §6C for hilbertSymbol_eq_cohomological, hilbertSymbol_productFormula and the local-symbol computations. Add a named adapter proving (α/(β))(β/(α))=∏_(v|2∞)(α,β)_v for nonzero coprime odd integral elements of a number field.” State its finite-support and odd-residue identifications before the spin-kernel consumer.

14. **F14** (P1) Ideal divisor coefficient bounds are claimed from an absent supplier target

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:74`, `:88`, `:3463`, “ideal-count and divisor moments from ADS”.

   **Claim:** ArithmeticDirichletSeries Layers 1, 2 and 5 supply the ideal divisor moments and subpower bounds that absorb Λ and τ coefficients in the Type II conversion.

   **Witness:** `Completed/ArithmeticDirichletSeries/README.md:237`–254 states norm-fibre counting, higher-prime-power removal and residue-degree removal. Its Layers 1–2 define ideal convolution, but no ideal divisor-moment or τ(a)≪ε(Na)^ε theorem is stated there.

   **Exact repair text:** “Add precisely stated ideal divisor-subpower and required moment estimates as owned prerequisites, or register them as gaps to ArithmeticDirichletSeries with their exact coefficient weights and uniformity. Cite existing prime-power removal separately.” Do not infer analytic estimates merely from convolution and norm-fibre carriers.

15. **F15** (P2) Easy quadratic-branch headlines are missing from Lean

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:2004`, `:2014`; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:355`.

   **Claim:** Suggested.lean records the statable milestones, but the Smith estimate and Koymans–Pagano row-mean endpoint are absent.

   **Witness:** Both statements quantify only real bounds, finite sets of natural primes, cardinalities, logarithms and native Jacobi symbols. Those carriers already occur in this file; neither statement needs a new construction or another roadmap import.

   **Exact repair text:** “Add theorem smith_prime_legendre_bilinear and theorem koymans_pagano_row_mean with the exact README hypotheses and constant quantifier order: ε before C, and fixed c₂,c₄,a before ε,C. Use Finset ℕ, positive real bounds, disjointness, odd primality and the written cardinality/growth conditions.” These are signatures, proved by sorry, with the existing source locators. Do not substitute an assumed bilinear bound for either conclusion.

16. **F16** (P3) Existing definitions lack their discriminating Lean Checks

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:484`, `:692`, `:2502`–2505; `packages/SieveMethodsAndPrimePatterns/Suggested.lean:432`–434.

   **Claim:** The README Checks are mirrored and discriminate the definitions.

   **Witness:** The single-prime dimension test, χ₅(0)=0, triangle I=1/2 and J=1/3, and constant-one support failure have no Lean mirrors. The two Elliott–Halberstam examples merely instantiate their hypothesis and also pass if PrimesHaveLevel is replaced by True.

   **Exact repair text:** “Mirror each statable Check, combining related assertions so each retained definition has at most two proved examples. Include a nonempty dimension test, the zero-argument convention, the separate triangle integrals and the unsupported constant function. Replace hypothesis-specialization tests with discriminating boundary cases.” For every bundled definition block, give each introduced definition at least three discriminating README Checks; the five Checks shared by the variational block do not test every introduced definition three times.

17. **F17** (P3) The compact-signature form includes a forbidden catalogue and unnamed tests

   **Location:** `packages/SieveMethodsAndPrimePatterns/Suggested.lean:136`, `:542`, `:553`, `:556`, `:701`.

   **Claim:** The file follows the required declaration/documentation form and every Lean name is registered in README.md.

   **Witness:** Lines 701–722 are a catalogue of absent construction names. BinaryPolynomial is not named in README.md. The declarations at 542, 553 and 556 have no individual docstring.

   **Exact repair text:** “Delete the closing catalogue. Name SieveBinary.BinaryPolynomial in the binary-polynomial convention if the abbreviation is kept. Give every retained declaration its own mathematical docstring; combined proved examples can replace the adjacent undocumented examples.”

18. **F18** (P3) The advertised pins are stale

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:41`; also the ‘after the pinned commit’ claim at line 11.

   **Claim:** The reviewed APIs are Mathlib 082e2d37 and Tau Ceti f7904748, and fundamentalDiscriminantChar is later than the pins.

   **Witness:** The supplied `lake-manifest.json` pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34` already defines fundamentalDiscriminantChar at that pin.

   **Exact repair text:** “The pinned APIs are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.” Replace the later-library claim by its actual pinned declaration, module and proof argument, and recheck the Lean signatures at these pins during repair.

19. **F19** (P3) The required source manifest is absent

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3666`–3724; missing `packages/SieveMethodsAndPrimePatterns/sources.toml`.

   **Claim:** The source register provides reproducible legal provenance and exact locators for the package's citations.

   **Witness:** The package contains no sources.toml. Its Markdown bibliography records neither fetched hashes/licence classes nor settled uncertified statuses; the sources service has now resolved 24 source records for this audit.

   **Exact repair text:** “Add sources.toml using schema tauceti-roadmap-sources/v1. Record every cited work's authors, title, year, version, exact locator and cited_for, together with the sources service's URL, fetched_from, fetched_at, sha256, licence_class and status.” Retain uncertified/waived decisions; do not copy cache paths or source text into the package.

20. **F20** (P2) Richert's stated hypotheses permit a fixed prime obstruction

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3029`–3031, “All five hypotheses above”.

   **Claim:** The displayed prime-sum, square-exception, remainder and integral conditions imply a positive P_r count without an explicit strict local-density hypothesis on this family.

   **Witness:** Let A_N={30m≤N}, X=N/30, g(d)=gcd(30,d)/d, r=2, γ=.9, α=.225, β=.81. Every listed estimate holds and the normalized integral margin exceeds .499, but every member has Ω≥3.

   **Exact repair text:** “Require multiplicative density data with 0≤g(p)≤1−1/A₁ for every sieving prime, for a fixed A₁>1, and the corresponding uniform product condition needed by linear_sieve_estimate; treat every omitted prime explicitly.” Add the multiples-of-30 negative control. Here |R_d|≤1, the summed remainder is O(N^.9), and the square-exception mass is O(N^.775+√N), both o(X/log²N). The native BoundingSieve convention alone does not put this hypothesis into the displayed A_N theorem.

21. **F21** (P2) The published binary-sieve range has no full target

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1093`, “wider A^(1/2) range is an explicit gap”.

   **Claim:** The general binary-domain development is replaced by the convenient z≤A^(1/4) version, leaving the wider source theorem outside any named target.

   **Witness:** The named binary_convex_largeSieve stops at A^(1/4). Line 3606 diagnoses an lcm proof gap; it gives no counterexample to the wider theorem and no named theorem owning its repair.

   **Exact repair text:** “Retain binary_convex_largeSieve for the full source range z≤min((A/R^θ)^(1/5),A^(1/2)), and add a separately named conservative-cutoff intermediate result. State the missing lcm-discrepancy argument as an owned prerequisite, with exact hypotheses and source locator.” A useful restricted intermediate result does not replace the general library target.

## Verified sound

Read all 3,724 README lines, all 725 Lean lines, and both repository policy files. The inventories below cover 224 bold target paragraphs and all 130 Lean declarations: 28 definitions, one abbreviation, 33 theorems and 68 examples. Also read the 71 remaining bold paragraph headings and their text. There are 42 Checks blocks containing 172 named Check bullets; these were inspected against their definitions and boundary cases. None is counted as a proved Lean test.

Checked 95 source-locator groups, recorded below. The sources service obtained 24 certified source records; three additional records remain settled uncertified. Audited the 11 named external supplier-contract groups and searched all seven supplied sibling heads. One sibling ownership interface was compared directly in both README and Lean: ErdosProgressionPowers §3.1. The additional owners ThetaSeries §2H and QuadraticFormInvariants §6C were checked on main. IntegralLattices §§0B,3A–3D supports the integral half-norm/local-classification import; Chebotarev Layer 13 supports the principal-class natural-density normalization. Findings distinguish these interfaces from stronger absent claims.

The following independent computations found no further defect:

- Vaughan’s exact formula passed 2,009 substitutions: n=0,…,40 and U,V=0,…,6, including zero cutoffs and n=0,1. This was a numerical check of the logarithmic identity, not a Lean proof.
- Exact rational integration gives the printed M₅ certificate I=29509/1222452000 and ratio 1417255/708216. All 42 coefficients of the M₁₀₅ polynomial reproduce the printed exact I, sumJ and ratio, with I>0 and sumJ>4I.
- The displayed nonzero two-variable polynomial has square integral 1/3150 and both fibre-integral polynomials identically zero. It witnesses positive semidefiniteness, rather than positive definiteness, of the J-form.
- The 105-shift tuple has distinct entries, diameter 600, and misses a residue class at every one of the 27 primes at most 103; primes above 105 are automatic.
- For x²−y² the finite-field zero counts at p=3,5,7 are 5,9,13. The singular conic x²+3y²+12 has three zeros modulo 3 and none modulo 9. The written genus-sign convention gives the independently counted value 18 at p=3, k=1, ε=−1.
- The Iwaniec scan confirms the exponent −1/3 in the displayed error term. The published-numbering Koymans–Milović Proposition 3.6 was located in a legal institutional copy and compared with KM-21 Lemma 4.1; its absence from an earlier arXiv numbering is not a defect here.

The file has one `import Mathlib`, no `set_option`, no `lemma` declaration, no admitted data definition, and fewer than 5,000 lines. Object searches covered pinned Mathlib/Tau Ceti, active/completed main roadmaps and the seven supplied sibling folders. The 200 distinct explicit Mathlib dependency basenames resolve to pinned declarations or notation; this is not a claim that 200 elaborated signatures were checked.

The read-only dependency checker returned exactly:

```text
NOT IN ORDER: SieveMethodsAndPrimePatterns (insert it after its last supplier)
depcheck: 8 roadmaps, 50 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The NOT IN ORDER diagnostic is not a finding under this brief. The checker’s limited graph does not certify the unresolved supplier labels in R07.

The pull-request diff contains four files, all under `packages/SieveMethodsAndPrimePatterns/`: README.md, Suggested.lean, metadata.toml and review.json, with 4,458 insertions. This review changed none of them. No Lean command, build or Git write was run.

### Statement and adversarial-instance ledger

Each row names a bold target by its README line. “No counterexample found” records boundary inspection, not a proof of an analytic theorem. Supplier findings propagate through consumers even where the local finite statement is correct. The listed instances are the applicable tests for that target’s block; unrelated algebraic cases such as zero rings do not occur in its carriers.

| README line | Section | Statement | Instances tried | Result | Change |
|---|---|---|---|---|---|
| 107 | 0.1 | BoundingSieve.sum_multSum_eq_sum_gcd_divisors | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 119 | 0.1 | BoundingSieve.siftedSum_eq_moebius_multSum | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 129 | 0.1 | BoundingSieve.siftedSum_eq_eulerProduct_add_rem | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 141 | 0.1 | BoundingSieve.abs_siftedSum_sub_eulerProduct_le | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 151 | 0.1 | BoundingSieve.sum_multSum_le_siftedSum_of_divisor_lower | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 163 | 0.1 | BoundingSieve.mainSum_sub_errSum_le_siftedSum | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 175 | 0.1 | BoundingSieve.errSum_le_truncated_remSum | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 187 | 0.1 | BoundingSieve.multSum_one_sub_prime_multSum_le_siftedSum | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Boundary/sign inspection: no counterexample found | — |
| 201 | 0.2 | BoundingSieve.ofFiniteFamily | empty family; two labels 7 with weights 2,3; seven parameters/four image values | Boundary/sign inspection: no counterexample found | — |
| 228 | 0.2 | BoundingSieve.ofFiniteFamily_multSum | empty family; two labels 7 with weights 2,3; seven parameters/four image values | Boundary/sign inspection: no counterexample found | — |
| 238 | 0.2 | BoundingSieve.ofFiniteFamily_siftedSum | empty family; two labels 7 with weights 2,3; seven parameters/four image values | Boundary/sign inspection: no counterexample found | — |
| 252 | 0.3 | BoundingSieve.prime_dvd_residueLabel_iff | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 264 | 0.3 | BoundingSieve.dvd_residueLabel_iff | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 276 | 0.3 | BoundingSieve.coprime_residueLabel_iff | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 288 | 0.3 | BoundingSieve.ofResidueClasses | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 316 | 0.3 | BoundingSieve.ofResidueClasses_multSum | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 326 | 0.3 | BoundingSieve.ofResidueClasses_siftedSum | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 336 | 0.3 | BoundingSieve.ofResidueClasses_eulerProduct | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 346 | 0.3 | BoundingSieve.full_residueClass_siftedSum_eq_zero | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 362 | 0.3 | BoundingSieve.residueClass_legendre_error | empty/full local sets; p=2; excluded residue 1; sample 0; composite d=6 | Boundary/sign inspection: no counterexample found | — |
| 382 | 0.4 | SieveGram.gramRow_eq_zero_iff | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Boundary/sign inspection: no counterexample found | — |
| 392 | 0.4 | SieveGram.norm_sum_smul_sq_le_gramRows | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Boundary/sign inspection: no counterexample found | — |
| 402 | 0.4 | SieveGram.selberg_defect_le | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Boundary/sign inspection: no counterexample found | — |
| 414 | 0.4 | SieveGram.selberg_weighted_inner | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Boundary/sign inspection: no counterexample found | — |
| 426 | 0.4 | SieveGram.bombieri_of_gramRow_le | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Finding R09 | R09 |
| 438 | 0.4 | SieveGram.bombieri_selberg | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Finding R09 | R09 |
| 450 | 0.4 | SieveGram.bombieri_diagonal_offDiagonal | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Finding R09 | R09 |
| 464 | 0.5 | SieveQuantitative.HasLogSieveDimension | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 491 | 0.5 | SieveQuantitative.HasProductSieveDimension | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 518 | 0.5 | SieveQuantitative.remainderMass | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 545 | 0.5 | SieveQuantitative.HasSieveLevel | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 572 | 0.5 | SieveQuantitative.errSum_le_remainderMass | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 584 | 0.5 | SieveQuantitative.density_euler_moment | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 596 | 0.5 | SieveQuantitative.rankin_weighted_prefix | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 608 | 0.5 | SieveQuantitative.rankin_weighted_tail | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 620 | 0.5 | SieveQuantitative.log_dimension_euler_bound | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 632 | 0.5 | SieveQuantitative.dimension_divisor_count | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 644 | 0.5 | SieveQuantitative.dimension_divisor_tail | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 656 | 0.5 | SieveQuantitative.eratosthenes_mass_cutoff | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 670 | 0.6 | SieveQuadratic.discriminantCharacter | D=0,1,−4,5,8; n=0,1,2,3; nonfundamental D | Finding R10/R11 | R10/R11 |
| 700 | 0.7 | SieveBinary.rho | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Boundary/sign inspection: no counterexample found | — |
| 731 | 0.7 | SieveBinary.curve_lifting_correction | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Boundary/sign inspection: no counterexample found | — |
| 741 | 0.7 | SieveBinary.rho_prime_le_degree_mul | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Boundary/sign inspection: no counterexample found | — |
| 751 | 0.7 | SieveBinary.HasMultiplicativeGrowth | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Boundary/sign inspection: no counterexample found | — |
| 776 | 0.7 | SieveBinary.thetaDensity | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Boundary/sign inspection: no counterexample found | — |
| 804 | 0.8 | SieveConic.conic_normal_form_adapter | split/singular conics; p=2,3; x²+3y²+12; repeated-root valuations; split density 5 at p=3 | Boundary/sign inspection: no counterexample found | — |
| 814 | 0.8 | SieveConic.conic_regular_density | split/singular conics; p=2,3; x²+3y²+12; repeated-root valuations; split density 5 at p=3 | Boundary/sign inspection: no counterexample found | — |
| 824 | 0.8 | SieveConic.conic_singular_density_recursion | split/singular conics; p=2,3; x²+3y²+12; repeated-root valuations; split density 5 at p=3 | Boundary/sign inspection: no counterexample found | — |
| 836 | 0.8 | SieveConic.conic_uniform_local_bound | split/singular conics; p=2,3; x²+3y²+12; repeated-root valuations; split density 5 at p=3 | Boundary/sign inspection: no counterexample found | — |
| 846 | 0.8 | SieveConic.conic_genus_density_sum | split/singular conics; p=2,3; x²+3y²+12; repeated-root valuations; split density 5 at p=3 | Boundary/sign inspection: no counterexample found | — |
| 858 | 0.9 | SieveBinary.quadratic_order_ideal_count_growth | maximal versus nonmaximal order; conductor primes; k=0,1; coprime norms | Finding R12 | R12 |
| 870 | 0.10 | SievePolynomialVector.vectorNorm | empty prime vector; monic unit; zero polynomial; degree 0; correlated joint law | Boundary/sign inspection: no counterexample found | — |
| 930 | 1.1 | SieveSelberg.abs_sum_squarefree_diagonal_sub_le | γ=1; W=1,6; z=2; sparse dyadic primes with γ(p)/p=log(2)/log(p) | Finding R04 | R04 |
| 942 | 1.1 | SieveSelberg.abs_sum_squarefree_diagonal_smooth_sub_le | γ=1; W=1,6; z=2; sparse dyadic primes with γ(p)/p=log(2)/log(p) | Boundary/sign inspection: no counterexample found | — |
| 956 | 1.2 | SieveBrun.brunCoefficients | P=1; first prime 2; strict prefix endpoint; u=9κ+1; positivity of lower main term | Boundary/sign inspection: no counterexample found | — |
| 983 | 1.2 | SieveBrun.brun_divisor_brackets | P=1; first prime 2; strict prefix endpoint; u=9κ+1; positivity of lower main term | Boundary/sign inspection: no counterexample found | — |
| 995 | 1.2 | SieveBrun.abs_brunCoefficients_le_one | P=1; first prime 2; strict prefix endpoint; u=9κ+1; positivity of lower main term | Boundary/sign inspection: no counterexample found | — |
| 1007 | 1.2 | SieveBrun.brunCoefficients_support_lt | P=1; first prime 2; strict prefix endpoint; u=9κ+1; positivity of lower main term | Boundary/sign inspection: no counterexample found | — |
| 1019 | 1.2 | SieveBrun.brun_main_term_bounds | P=1; first prime 2; strict prefix endpoint; u=9κ+1; positivity of lower main term | Boundary/sign inspection: no counterexample found | — |
| 1031 | 1.2 | SieveBrun.brun_fundamental_estimate | P=1; first prime 2; strict prefix endpoint; u=9κ+1; positivity of lower main term | Boundary/sign inspection: no counterexample found | — |
| 1045 | 1.3 | SieveSelberg.optimalWeight | P=1; z=1 and z>1; ν(p)=1/2; zero/negative approximate mass | Boundary/sign inspection: no counterexample found | — |
| 1071 | 1.3 | SieveSelberg.selberg_upper_bound | P=1; z=1 and z>1; ν(p)=1/2; zero/negative approximate mass | Boundary/sign inspection: no counterexample found | — |
| 1083 | 1.4 | SieveBinary.binary_euler_denominator | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1093 | 1.4 | SieveBinary.binary_convex_largeSieve | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Finding R21 | R21 |
| 1103 | 1.4 | SieveBinary.binary_euler_cutoff_comparison | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1113 | 1.4 | SieveBinary.binary_power_level_sieve | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1123 | 1.4 | SieveBinary.binary_divisibility_sieve | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1133 | 1.4 | SieveBinary.multiplicative_decoupling | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found | — |
| 1143 | 1.4 | SieveBinary.binary_theta_average | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1153 | 1.4 | SieveBinary.binary_smooth_large_factor_average | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found | — |
| 1163 | 1.4 | SieveBinary.binary_extremely_smooth_average | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1173 | 1.4 | SieveBinary.binary_multiplicative_sieve | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1185 | 1.4 | SieveBinary.binary_homogeneous_congruence_sieve | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1195 | 1.4 | SieveBinary.binary_inhomogeneous_congruence_sieve | Q=x²; content primes; singular conics; small area; α approaching 0; full prime-power densities | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 1207 | 1.5 | SievePolynomialVector.polynomial_bonferroni | empty vector; D=1; zero degree; dependent coordinates; unit versus zero polynomial | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 1217 | 1.5 | SievePolynomialVector.polynomial_brun_arbitrary_law | empty vector; D=1; zero degree; dependent coordinates; unit versus zero polynomial | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 1227 | 1.5 | SievePolynomialVector.polynomial_euler_excluding_variable | empty vector; D=1; zero degree; dependent coordinates; unit versus zero polynomial | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 1239 | 1.6 | SieveApplications.prime_interval_upper | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Boundary/sign inspection: no counterexample found | — |
| 1249 | 1.6 | SieveApplications.progression_upper | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Boundary/sign inspection: no counterexample found | — |
| 1259 | 1.6 | SieveApplications.twin_goldbach_upper | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Boundary/sign inspection: no counterexample found | — |
| 1269 | 1.6 | SieveApplications.brun_reciprocals | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Boundary/sign inspection: no counterexample found | — |
| 1279 | 1.6 | SieveApplications.selberg_dimension_kappa | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Finding R02 | R02 |
| 1289 | 1.6 | SieveApplications.parityWeight | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Boundary/sign inspection: no counterexample found | — |
| 1347 | 2.1 | SieveTaper.card_difference_pairs | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1359 | 2.1 | SieveTaper.triangular_fourier | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1369 | 2.1 | SieveTaper.geometric_sine_square | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1381 | 2.1 | SieveTaper.taper_weight | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1393 | 2.1 | SieveTaper.taperedCharacter | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1419 | 2.1 | SieveTaper.taperedCharacter_apply | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1431 | 2.1 | SieveTaper.taperedCharacter_core | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1441 | 2.1 | SieveTaper.taperedCharacter_inner | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1451 | 2.1 | SieveTaper.taperedCharacter_norm_sq | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1461 | 2.1 | SieveTaper.taperedCharacter_inner_norm_le | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1471 | 2.1 | SieveTaper.taperedCharacter_pairing | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1483 | 2.1 | SieveTaper.largeSieve_of_cosecantRow_le | N=0,1; L=0,1,2; integral phase; phase 1/4; first-variable conjugation | Boundary/sign inspection: no counterexample found | — |
| 1499 | 2.2 | SieveTaper.four_circle_norm_sq_le_sin_sq | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1509 | 2.2 | SieveTaper.circular_bin_card_le_two | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1519 | 2.2 | SieveTaper.cosecantRow_le | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1529 | 2.2 | SieveTaper.floor_taper_bound | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1539 | 2.2 | SieveTaper.largeSieve_centered | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1551 | 2.2 | SieveTaper.intervalVector | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1577 | 2.2 | SieveTaper.intervalVector_apply | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1589 | 2.2 | SieveTaper.intervalVector_support | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1599 | 2.2 | SieveTaper.intervalVector_norm_sq | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1609 | 2.2 | SieveTaper.intervalVector_fourier | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1619 | 2.2 | SieveTaper.card_le_one_of_half_lt_separation | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1629 | 2.2 | SieveTaper.additive_largeSieve | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Boundary/sign inspection: no counterexample found | — |
| 1645 | 2.3 | SieveCharacters.reduced_fraction_separation | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1655 | 2.3 | SieveCharacters.reduced_fraction_largeSieve | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1665 | 2.3 | SieveCharacters.standard_character_phase | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1675 | 2.3 | SieveCharacters.primitive_gauss_norm_sq | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1687 | 2.3 | SieveCharacters.finite_gauss_expansion | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1699 | 2.3 | SieveCharacters.character_parseval | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1709 | 2.3 | SieveCharacters.primitive_modulus_energy | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1719 | 2.3 | SieveCharacters.primitive_largeSieve | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Boundary/sign inspection: no counterexample found | — |
| 1733 | 2.4 | SieveVaughan.incompleteLog | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1760 | 2.4 | SieveVaughan.incompleteLog_eq_sub | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1770 | 2.4 | SieveVaughan.incompleteLog_eq_zero_of_le | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1780 | 2.4 | SieveVaughan.incompleteLog_bounds | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1790 | 2.4 | SieveVaughan.moebius_mul_incompleteLog | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1800 | 2.4 | SieveVaughan.vaughan_identity | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1810 | 2.4 | SieveVaughan.weighted_vaughan_hyperbola | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1820 | 2.4 | SieveVaughan.vaughan_bilinear_support | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1830 | 2.4 | SieveVaughan.vaughan_typeI_typeII | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1840 | 2.4 | SieveVaughan.vaughan_coefficient_energy | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Boundary/sign inspection: no counterexample found | — |
| 1854 | 2.5 | SieveCharacters.dyadic_primitive_energy | empty dyadic range; R=1; shared endpoint 2R; x=t⁴,y=1,Q=t; Δ=1 | Boundary/sign inspection: no counterexample found | — |
| 1866 | 2.5 | SieveCharacters.dyadic_primitive_bilinear | empty dyadic range; R=1; shared endpoint 2R; x=t⁴,y=1,Q=t; Δ=1 | Boundary/sign inspection: no counterexample found | — |
| 1878 | 2.5 | SieveCharacters.dyadic_modulus_partition | empty dyadic range; R=1; shared endpoint 2R; x=t⁴,y=1,Q=t; Δ=1 | Boundary/sign inspection: no counterexample found | — |
| 1890 | 2.5 | SieveCharacters.dyadic_bilinear_kernel | empty dyadic range; R=1; shared endpoint 2R; x=t⁴,y=1,Q=t; Δ=1 | Boundary/sign inspection: no counterexample found | — |
| 1902 | 2.5 | SieveCharacters.primitive_bilinear_dyadic_tail | empty dyadic range; R=1; shared endpoint 2R; x=t⁴,y=1,Q=t; Δ=1 | Boundary/sign inspection: no counterexample found | — |
| 1914 | 2.5 | SieveCharacters.primitive_bilinear_cutoff | empty dyadic range; R=1; shared endpoint 2R; x=t⁴,y=1,Q=t; Δ=1 | Boundary/sign inspection: no counterexample found | — |
| 1928 | 2.6 | SieveDuality.squared_matrix_duality | empty matrix dimensions; zero matrix; complex transpose/conjugate conventions | Boundary/sign inspection: no counterexample found | — |
| 1940 | 2.7 | SieveQuadratic.quadratic_largeSieve | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | Boundary/sign inspection: no counterexample found | — |
| 1950 | 2.7 | SieveQuadratic.quadratic_bilinear | empty prime sets; M=N=1; p=2; repeated square parts; unequal size bounds | Boundary/sign inspection: no counterexample found | — |
| 1960 | 2.7 | SieveQuadratic.primeDenominatorSymbol | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | Boundary/sign inspection: no counterexample found | — |
| 1984 | 2.7 | SieveQuadratic.prime_quadratic_bilinear | empty prime sets; M=N=1; p=2; repeated square parts; unequal size bounds | Boundary/sign inspection: no counterexample found | — |
| 1994 | 2.7 | SieveQuadratic.jutila_real_character_mean | empty prime sets; M=N=1; p=2; repeated square parts; unequal size bounds | Boundary/sign inspection: no counterexample found | — |
| 2004 | 2.7 | SieveQuadratic.smith_prime_legendre_bilinear | empty prime sets; M=N=1; p=2; repeated square parts; unequal size bounds | Finding R15 | R15 |
| 2014 | 2.7 | SieveQuadratic.koymans_pagano_row_mean | empty prime sets; M=N=1; p=2; repeated square parts; unequal size bounds | Finding R15 | R15 |
| 2028 | 2.8 | SievePolynomialVector.fareyCoefficient | degree ℓ=0; denominator 1; empty prime vector; p=2; dependent coefficient laws | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2054 | 2.8 | SievePolynomialVector.polynomial_farey_large_sieve | degree ℓ=0; denominator 1; empty prime vector; p=2; dependent coefficient laws | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2064 | 2.8 | SievePolynomialVector.bskk_additive_large_sieve | degree ℓ=0; denominator 1; empty prime vector; p=2; dependent coefficient laws | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2076 | 2.9 | SieveDuality.separated_hilbert_inequality | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Boundary/sign inspection: no counterexample found | — |
| 2086 | 2.9 | SieveTaper.sharp_additive_largeSieve | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Boundary/sign inspection: no counterexample found | — |
| 2096 | 2.9 | SieveApplications.sharp_primitive_largeSieve | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Boundary/sign inspection: no counterexample found | — |
| 2106 | 2.9 | SieveApplications.forbidden_residue_largeSieve | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Boundary/sign inspection: no counterexample found | — |
| 2116 | 2.9 | SieveApplications.leastNonresidue | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Boundary/sign inspection: no counterexample found | — |
| 2141 | 2.9 | SieveApplications.linnik_exceptional | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Boundary/sign inspection: no counterexample found | — |
| 2181 | 3.1 | SieveDistribution.PrimesHaveLevel | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2213 | 3.2 | SieveArithmeticDistribution.discrepancy | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2240 | 3.2 | SieveArithmeticDistribution.discrepancy_character_transfer | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2250 | 3.2 | SieveArithmeticDistribution.primitive_conductor_reduction | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2260 | 3.2 | SieveArithmeticDistribution.convolution_discrepancy_mean | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2270 | 3.2 | SieveArithmeticDistribution.bombieri_vinogradov_maximal | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2282 | 3.3 | SieveDistribution.primesHaveLevel_of_lt_half | θ<0,0 and θ approaching 1/2; window endpoints N−1 and 2N−1 | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2296 | 3.4 | SieveArithmeticDistribution.weighted_prime_distribution | q=1; zero coefficient; common divisors; diagonal variance; Q at logarithmic cutoff | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2308 | 3.4 | SieveArithmeticDistribution.arithmetic_discrepancy_variance | q=1; zero coefficient; common divisors; diagonal variance; Q at logarithmic cutoff | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2318 | 3.4 | SieveArithmeticDistribution.barban_davenport_halberstam | q=1; zero coefficient; common divisors; diagonal variance; Q at logarithmic cutoff | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2328 | 3.4 | SieveArithmeticDistribution.bilinear_congruence_correlation | q=1; zero coefficient; common divisors; diagonal variance; Q at logarithmic cutoff | Boundary/sign inspection: no counterexample found; supplier unresolved (R07) | R07 |
| 2360 | 4.1 | SieveMaynard.IsAdmissible | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Boundary/sign inspection: no counterexample found | — |
| 2387 | 4.1 | SieveMaynard.PrimeTuplesConjecture | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Boundary/sign inspection: no counterexample found | — |
| 2415 | 4.2 | SieveMaynard.wResidue | k=0,1; R=2; F(0)=1; n+h=0; repeated prime in different tuple coordinates | Boundary/sign inspection: no counterexample found | — |
| 2442 | 4.2 | SieveMaynard.maynardLambda | k=0,1; R=2; F(0)=1; n+h=0; repeated prime in different tuple coordinates | Finding R03 | R03 |
| 2477 | 4.3 | SieveMaynard.maynardM | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Finding R16 | R16 |
| 2511 | 4.3 | SieveMaynard.exists_smooth_maynardRatio_gt | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Boundary/sign inspection: no counterexample found | — |
| 2527 | 4.4 | SieveMaynard.abs_maynardLambdaOfY_le | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2539 | 4.4 | SieveMaynard.sieveSumS1_diagonal | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2549 | 4.4 | SieveMaynard.sieveSumS2_diagonal | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2561 | 4.4 | SieveMaynard.maynardYm_sub_sum_le | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2571 | 4.4 | SieveMaynard.sieveSumS1_smooth | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2583 | 4.4 | SieveMaynard.sieveSumS2_smooth | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2595 | 4.4 | SieveMaynard.tendsto_sieveSums | k=1; W=1; strict support at R; m-coordinate 1; δ approaching θ/2; zero test function | Boundary/sign inspection: no counterexample found | — |
| 2609 | 4.5 | SieveMaynard.exists_card_prime_gt_of_sum_pos | k=0,1; exact integer ceiling; strict positive weighted sum; zero weights; θ=0 excluded | Boundary/sign inspection: no counterexample found | — |
| 2621 | 4.5 | SieveMaynard.frequently_nth_prime_sub_le | k=0,1; exact integer ceiling; strict positive weighted sum; zero weights; θ=0 excluded | Boundary/sign inspection: no counterexample found | — |
| 2633 | 4.5 | SieveMaynard.infinite_many_primes_of_level | k=0,1; exact integer ceiling; strict positive weighted sum; zero weights; θ=0 excluded | Boundary/sign inspection: no counterexample found | — |
| 2647 | 4.6 | SieveMaynard.eventually_log_sub_lt_maynardM | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | Boundary/sign inspection: no counterexample found | — |
| 2659 | 4.6 | SieveMaynard.integral_simplex_moment | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | Boundary/sign inspection: no counterexample found | — |
| 2671 | 4.6 | SieveMaynard.maynardI_J_symmetricPoly | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | Boundary/sign inspection: no counterexample found | — |
| 2683 | 4.6 | SieveMaynard.maynardM_five_ge | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | Boundary/sign inspection: no counterexample found | — |
| 2695 | 4.6 | SieveMaynard.four_lt_maynardM_105 | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | Boundary/sign inspection: no counterexample found | — |
| 2764 | 4.7 | SieveMaynard.engelsma_tuple_admissible | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | Boundary/sign inspection: no counterexample found | — |
| 2776 | 4.7 | SieveMaynard.firstPrimesAbove_admissible | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | Boundary/sign inspection: no counterexample found | — |
| 2788 | 4.7 | SieveMaynard.frequently_nth_prime_succ_sub_le_600 | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | Boundary/sign inspection: no counterexample found | — |
| 2800 | 4.7 | SieveMaynard.elliottHalberstam_gaps | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | Boundary/sign inspection: no counterexample found | — |
| 2812 | 4.7 | SieveMaynard.exists_frequently_nth_prime_sub_le | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | Boundary/sign inspection: no counterexample found | — |
| 2824 | 4.7 | SieveMaynard.positive_proportion_prime_tuples | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | Boundary/sign inspection: no counterexample found | — |
| 2838 | 4.8 | SievePolynomial.BouniakowskyAdmissible | x+1; x²+x+2; x(x+2); constant/zero polynomials; empty tuple; separate versus joint obstruction | Boundary/sign inspection: no counterexample found | — |
| 2904 | 5.1 | SieveAlmostPrime.rough_to_at_most_almost_prime | n=0,1,8,25; z=2; strict threshold n<z^(k+1); multiplicity versus distinct factors | Boundary/sign inspection: no counterexample found | — |
| 2918 | 5.2 | SieveWeighted.linearUpper | κ=1/2,1,2; s=1,2,3,4; Rosser D=2,8; repeated factors in 8; Richert r=1,2,3 | Boundary/sign inspection: no counterexample found | — |
| 2946 | 5.2 | SieveWeighted.rosserWeight | κ=1/2,1,2; s=1,2,3,4; Rosser D=2,8; repeated factors in 8; Richert r=1,2,3 | Boundary/sign inspection: no counterexample found | — |
| 2973 | 5.2 | SieveWeighted.linear_sieve_estimate | κ=1/2,1,2; s=1,2,3,4; Rosser D=2,8; repeated factors in 8; Richert r=1,2,3 | Boundary/sign inspection: no counterexample found | — |
| 2983 | 5.2 | SieveWeighted.beta_sieve_general_dimension | κ=1/2,1,2; s=1,2,3,4; Rosser D=2,8; repeated factors in 8; Richert r=1,2,3 | Boundary/sign inspection: no counterexample found | — |
| 2993 | 5.2 | SieveWeighted.weighted_fundamental_lemma | κ=1/2,1,2; s=1,2,3,4; Rosser D=2,8; repeated factors in 8; Richert r=1,2,3 | Boundary/sign inspection: no counterexample found | — |
| 3003 | 5.2 | SieveWeighted.richertPrimeWeight | κ=1/2,1,2; s=1,2,3,4; Rosser D=2,8; repeated factors in 8; Richert r=1,2,3 | Boundary/sign inspection: no counterexample found | — |
| 3029 | 5.2 | SieveWeighted.richert_weighted_sieve | multiples of 30; γ=.9, α=.225, β=.81; r=2; strict local density | Finding R20 | R20 |
| 3039 | 5.2 | SieveWeighted.richert_threshold | multiples of 30; γ=.9, α=.225, β=.81; r=2; strict local density | Finding R20 (inherited hypotheses) | R20 (inherited hypotheses) |
| 3051 | 5.3 | SieveJointSpin.JointSpinData | trivial and order-two Galois groups excluded; cyclic cubic singleton; repeated class primes; zero differences excluded | Boundary/sign inspection: no counterexample found; contract unresolved (R07) | R07 |
| 3077 | 5.3 | SieveJointSpin.joint_spin_short_input | trivial and order-two Galois groups excluded; cyclic cubic singleton; repeated class primes; zero differences excluded | Boundary/sign inspection: no counterexample found | — |
| 3087 | 5.3 | SieveJointSpin.spin_squarefull_tail | trivial and order-two Galois groups excluded; cyclic cubic singleton; repeated class primes; zero differences excluded | Boundary/sign inspection: no counterexample found; contract unresolved (R08) | R08 |
| 3097 | 5.3 | SieveJointSpin.spin_common_norm_tail | trivial and order-two Galois groups excluded; cyclic cubic singleton; repeated class primes; zero differences excluded | Boundary/sign inspection: no counterexample found; contract unresolved (R08) | R08 |
| 3109 | 5.4 | SieveAffine.IsPrimitivePair | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Boundary/sign inspection: no counterexample found; BGS source uncertified | — |
| 3135 | 5.4 | SieveAffine.almostPrimeLocus | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Boundary/sign inspection: no counterexample found; BGS source uncertified | — |
| 3163 | 5.4 | SieveAffine.walkSieve | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Boundary/sign inspection: no counterexample found; contract unresolved (R07/R08); BGS source uncertified | R07/R08 |
| 3189 | 5.4 | SieveAffine.affine_local_density | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Boundary/sign inspection: no counterexample found; contract unresolved (R07/R08); BGS source uncertified | R07/R08 |
| 3199 | 5.4 | SieveAffine.affine_expansion_level | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Finding R06; BGS source uncertified | R06 |
| 3209 | 5.4 | SieveAffine.affine_escape | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Boundary/sign inspection: no counterexample found; contract unresolved (R07/R08); BGS source uncertified | R07/R08 |
| 3219 | 5.4 | SieveAffine.affine_saturation | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Finding R05; BGS source uncertified | R05 |
| 3229 | 5.4 | SieveAffine.affine_factor_bound | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Finding R05; BGS source uncertified | R05 |
| 3239 | 5.4 | SieveAffine.sl2_squarefree_expansion | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Boundary/sign inspection: no counterexample found; contract unresolved (R07/R08); BGS source uncertified | R07/R08 |
| 3251 | 5.5 | SieveWeighted.chenWeight | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | Boundary/sign inspection: no counterexample found | — |
| 3276 | 5.5 | SieveWeighted.goldbachLocalFactor | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | Boundary/sign inspection: no counterexample found | — |
| 3301 | 5.5 | SieveWeighted.chen_switched_distribution | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | Boundary/sign inspection: no counterexample found; Chen text unavailable | — |
| 3313 | 5.5 | SieveWeighted.chen_prime_shift | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | Boundary/sign inspection: no counterexample found; Chen text unavailable | — |
| 3323 | 5.5 | SieveWeighted.chen_original_lower | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | Boundary/sign inspection: no counterexample found; Chen text unavailable | — |
| 3333 | 5.5 | SieveWeighted.chen_goldbach | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | Boundary/sign inspection: no counterexample found; Chen text unavailable | — |
| 3345 | 5.6 | SieveJointSpin.idealQuadraticSymbol | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Boundary/sign inspection: no counterexample found | — |
| 3376 | 5.6 | SieveJointSpin.jointSpin | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Finding R13 | R13 |
| 3405 | 5.6 | SieveJointSpin.joint_spin_typeI | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Supplier contracts R08/R13; conditional analytic proof not certified | R08/R13 |
| 3415 | 5.6 | SieveJointSpin.spinKernel | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Finding R13 | R13 |
| 3441 | 5.6 | SieveJointSpin.number_field_kernel_bilinear | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Boundary/sign inspection: no counterexample found; KM original Proposition 3.6 read | — |
| 3451 | 5.6 | SieveJointSpin.joint_spin_typeII | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Boundary/sign inspection: no counterexample found | — |
| 3461 | 5.6 | SieveJointSpin.fimr_prime_conversion | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Finding R14 | R14 |
| 3471 | 5.6 | SieveJointSpin.joint_spin_prime_oscillation | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Boundary/sign inspection: no counterexample found | — |
| 3481 | 5.6 | SieveJointSpin.joint_spin_sign_patterns | unit/zero/even ideal; numerator zero; quadratic field rational denominator 5; ψ=0 and scaling; repeated prime ideals | Boundary/sign inspection: no counterexample found | — |

### Lean declaration and context ledger

Global context: `noncomputable section`, BigOperators/Moebius scopes and local classical decidability where written. `Type*` denotes the file’s polymorphic carriers. Only variables and instances occurring in a declaration’s type survive; no unmentioned ambient hypothesis is credited. Inspection did not substitute for elaboration.

| Lean line | Layer | Declaration | Variable and instance context | Instances tried | Result | Change |
|---|---|---|---|---|---|---|
| 27 | 0 | BoundingSieve.abs_siftedSum_sub_eulerProduct_le | No ambient variable; (s : BoundingSieve) | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | No additional signature counterexample found | — |
| 34 | 0 | BoundingSieve.mainSum_sub_errSum_le_siftedSum | No ambient variable; (s : BoundingSieve) (c : ℕ → ℝ) (hc : ∀ r, r ∣ s.prodPrimes → (∑ d ∈ r.divisors, c d) ≤ if r = 1 then (1 : ℝ) else 0) | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | No additional signature counterexample found | — |
| 41 | 0 | BoundingSieve.example@41 | No ambient variable; (s : BoundingSieve) (hA : s.support = {0, 1, 2, 3, 6}) (hP : s.prodPrimes = 6) (hw : ∀ n ∈ s.support, s.weights n = 1) | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Statement inspected; proof admitted | R01 |
| 46 | 0 | BoundingSieve.example@46 | No ambient variable; (s : BoundingSieve) (hX : s.totalMass = 7) (hA : s.multSum 1 = 10) | P=1, P=6; n=0; empty support; X=7 versus mass 10; signed remainder | Statement inspected; proof admitted | R01 |
| 57 | 0 | SieveGram.selberg_weighted_inner | 𝕜,E : Type*; [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]; ι : Type*; [Fintype ι]; (y : ι → E) (x : E) | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | No additional signature counterexample found | — |
| 62 | 0 | SieveGram.bombieri_diagonal_offDiagonal | 𝕜,E : Type*; [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]; ι : Type*; [Fintype ι]; (y : ι → E) (x : E) (D C : ℝ) (hD : 0 ≤ D) (hC : 0 ≤ C) (hdiag : ∀ i, ‖y i‖ ^ 2 ≤ D) (hoff : ∀ i j, i ≠ j → ‖⟪y i, y j⟫_𝕜‖ ≤ C) | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Earlier owner | R09 |
| 69 | 0 | SieveGram.example@69 | 𝕜,E : Type*; [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]; (x : E) | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Statement inspected; proof admitted | R01 |
| 74 | 0 | SieveGram.example@74 | No ambient variable; No explicit parameter | empty/singleton index; zero vectors; two equal unit vectors; complex conjugation | Statement inspected; proof admitted | R01 |
| 82 | 0 | SieveQuantitative.HasLogSieveDimension | No ambient variable; (P : Set ℕ) (g : ℕ → ℝ) (κ C : ℝ) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | No additional signature counterexample found | — |
| 90 | 0 | SieveQuantitative.HasProductSieveDimension | No ambient variable; (P : Set ℕ) (g : ℕ → ℝ) (κ K : ℝ) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | No additional signature counterexample found | — |
| 99 | 0 | SieveQuantitative.remainderMass | No ambient variable; (s : BoundingSieve) (D : ℝ) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | No additional signature counterexample found | — |
| 104 | 0 | SieveQuantitative.HasSieveLevel | No ambient variable; (F : ℝ → BoundingSieve) (θ : ℝ) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | No additional signature counterexample found | — |
| 112 | 0 | SieveQuantitative.example@112 | No ambient variable; No explicit parameter | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 114 | 0 | SieveQuantitative.example@114 | No ambient variable; No explicit parameter | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 116 | 0 | SieveQuantitative.example@116 | No ambient variable; No explicit parameter | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 118 | 0 | SieveQuantitative.example@118 | No ambient variable; No explicit parameter | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 120 | 0 | SieveQuantitative.example@120 | No ambient variable; (s : BoundingSieve) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 122 | 0 | SieveQuantitative.example@122 | No ambient variable; (s : BoundingSieve) (hP : s.prodPrimes = 1) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 125 | 0 | SieveQuantitative.example@125 | No ambient variable; (F : ℝ → BoundingSieve) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 127 | 0 | SieveQuantitative.example@127 | No ambient variable; (F : ℝ → BoundingSieve) (θ : ℝ) (hθ : 0 < θ) (hm : ∀ x : ℝ, 2 ≤ x → 0 ≤ (F x).totalMass) (hr : ∀ x d, (F x).rem d = 0) | empty prime set; κ=0; C<0; K=1/2; D=1,2,3,6,7; R₁ nonzero; Rankin exponent approaching 1 | Statement inspected; proof admitted | R01 |
| 136 | 0 | SieveBinary.BinaryPolynomial | No ambient variable; No explicit parameter | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Unregistered abbreviation | R17 |
| 140 | 0 | SieveBinary.rho | No ambient variable; (Q : BinaryPolynomial) (a : ℕ) | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | No additional signature counterexample found | — |
| 147 | 0 | SieveBinary.example@147 | No ambient variable; (Q : BinaryPolynomial) | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Statement inspected; proof admitted | R01 |
| 149 | 0 | SieveBinary.example@149 | No ambient variable; (p : ℕ) (hp : p.Prime) | Q=0,1,x²; moduli 0,1,p,p²; p=2,3,5,7; zero/unit growth functions | Statement inspected; proof admitted | R01 |
| 157 | 0 | SieveQuadratic.discriminantCharacter | No ambient variable; (D : ℤ) (n : ℕ) | D=0,1,−4,5,8; n=0,1,2,3; nonfundamental D | Earlier owner; modulus-one API checked separately | R10/R11 |
| 164 | 0 | SieveQuadratic.example@164 | No ambient variable; No explicit parameter | D=0,1,−4,5,8; n=0,1,2,3; nonfundamental D | Statement inspected; proof admitted | R01 |
| 166 | 0 | SieveQuadratic.example@166 | No ambient variable; No explicit parameter | D=0,1,−4,5,8; n=0,1,2,3; nonfundamental D | Statement inspected; proof admitted | R01 |
| 168 | 0 | SieveQuadratic.example@168 | No ambient variable; No explicit parameter | D=0,1,−4,5,8; n=0,1,2,3; nonfundamental D | Statement inspected; proof admitted | R01 |
| 170 | 0 | SieveQuadratic.discriminantCharacter_periodic | No ambient variable; (D : ℤ) (hD : 1 < D.natAbs) (hdisc : D % 4 = 0 ∨ D % 4 = 1) | D=0,1,−4,5,8; n=0,1,2,3; nonfundamental D | Earlier owner; modulus-one API checked separately | R10/R11 |
| 181 | 1 | SieveSelberg.diagonalMass | No ambient variable; (s : BoundingSieve) (z : ℝ) | P=1; z=1 and z>1; ν(p)=1/2; zero/negative approximate mass | No additional signature counterexample found | — |
| 185 | 1 | SieveSelberg.example@185 | No ambient variable; (s : BoundingSieve) | P=1; z=1 and z>1; ν(p)=1/2; zero/negative approximate mass | Statement inspected; proof admitted | R01 |
| 187 | 1 | SieveSelberg.example@187 | No ambient variable; (s : BoundingSieve) (hP : s.prodPrimes = 1) (z : ℝ) (hz : 1 < z) | P=1; z=1 and z>1; ν(p)=1/2; zero/negative approximate mass | Statement inspected; proof admitted | R01 |
| 192 | 1 | SieveSelberg.selberg_upper_bound | No ambient variable; (s : BoundingSieve) (z : ℝ) (hz : 1 < z) | P=1; z=1 and z>1; ν(p)=1/2; zero/negative approximate mass | No additional signature counterexample found | — |
| 203 | 1 | SieveApplications.parityWeight | No ambient variable; (odd : Bool) (n : ℕ) | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | No additional signature counterexample found | — |
| 207 | 1 | SieveApplications.example@207 | No ambient variable; No explicit parameter | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Statement inspected; proof admitted | R01 |
| 209 | 1 | SieveApplications.example@209 | No ambient variable; No explicit parameter | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | Statement inspected; proof admitted | R01 |
| 213 | 1 | SieveApplications.prime_interval_upper | No ambient variable; No explicit parameter | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | No additional signature counterexample found | — |
| 219 | 1 | SieveApplications.twin_goldbach_upper | No ambient variable; No explicit parameter | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | No additional signature counterexample found | — |
| 227 | 1 | SieveApplications.brun_reciprocals | No ambient variable; No explicit parameter | small x; N=4 even; odd N excluded; squareful d=2^a3^b; parity at 0,1,4,12 | No additional signature counterexample found | — |
| 240 | 2 | SieveTaper.additive_largeSieve | No ambient variable; {ι : Type*} [Fintype ι] [DecidableEq ι] (M : ℤ) (H : ℕ) (a : Fin H → ℂ) (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ) (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j)) | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | No additional signature counterexample found | — |
| 248 | 2 | SieveTaper.sharp_additive_largeSieve | No ambient variable; {ι : Type*} [Fintype ι] [DecidableEq ι] (M : ℤ) (H : ℕ) (hH : 1 ≤ H) (a : Fin H → ℂ) (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ) (hδ' : δ ≤ 1/2) (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i - x j)) | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | No additional signature counterexample found | — |
| 256 | 2 | SieveTaper.example@256 | No ambient variable; (M : ℕ) | H=0,1,2,3; δ=1/2 and >1/2; arbitrary negative integer origin; end-bin packing | Statement inspected; proof admitted | R01 |
| 262 | 2 | SieveCharacters.primitive_largeSieve | No ambient variable; (Q H : ℕ) (M : ℤ) (a : Fin H → ℂ) | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | No additional signature counterexample found | — |
| 270 | 2 | SieveCharacters.example@270 | No ambient variable; No explicit parameter | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Statement inspected; proof admitted | R01 |
| 273 | 2 | SieveCharacters.example@273 | No ambient variable; No explicit parameter | Q=0,1; H=0; primitive modulus 1; imprimitive principal modulus 4; zero Gauss sum | Statement inspected; proof admitted | R01 |
| 280 | 2 | SieveApplications.sharp_primitive_largeSieve | No ambient variable; (Q H : ℕ) (hQ : 1 ≤ Q) (hH : 1 ≤ H) (M : ℤ) (a : Fin H → ℂ) | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | No additional signature counterexample found | — |
| 290 | 2 | SieveApplications.leastNonresidue | No ambient variable; (p : ℕ) | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | No additional signature counterexample found | — |
| 296 | 2 | SieveApplications.example@296 | No ambient variable; No explicit parameter | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Statement inspected; proof admitted | R01 |
| 298 | 2 | SieveApplications.example@298 | No ambient variable; No explicit parameter | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | Statement inspected; proof admitted | R01 |
| 302 | 2 | SieveApplications.linnik_exceptional | No ambient variable; (ε : ℝ) (hε : 0 < ε) | Q=1; H=1; δ=1/2; forbidden residue with nonzero coefficient; p=2,3,7; smooth multiplicities | No additional signature counterexample found | — |
| 311 | 2 | SieveQuadratic.primeDenominatorSymbol | No ambient variable; (a : ℤ) (p : ℕ) | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | No additional signature counterexample found | — |
| 315 | 2 | SieveQuadratic.example@315 | No ambient variable; No explicit parameter | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | Statement inspected; proof admitted | R01 |
| 317 | 2 | SieveQuadratic.example@317 | No ambient variable; No explicit parameter | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | Statement inspected; proof admitted | R01 |
| 321 | 2 | SieveQuadratic.quadratic_largeSieve | No ambient variable; (ε : ℝ) (hε : 0 < ε) | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | No additional signature counterexample found | — |
| 332 | 2 | SieveQuadratic.prime_quadratic_bilinear | No ambient variable; (ε : ℝ) (hε : 0 < ε) | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | No additional signature counterexample found | — |
| 344 | 2 | SieveQuadratic.jutila_real_character_mean | No ambient variable; No explicit parameter | M=N=1; arbitrary versus squarefree numerator; p=2; symbol(9,3)=0; D=−4,5,8 | No additional signature counterexample found | — |
| 361 | 2 | SieveVaughan.incompleteLog | No ambient variable; (V : ℕ) | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | No additional signature counterexample found | — |
| 365 | 2 | SieveVaughan.example@365 | No ambient variable; No explicit parameter | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Statement inspected; proof admitted | R01 |
| 367 | 2 | SieveVaughan.example@367 | No ambient variable; No explicit parameter | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | Statement inspected; proof admitted | R01 |
| 371 | 2 | SieveVaughan.vaughan_identity | No ambient variable; (U V n : ℕ) | n=0,…,40; U,V=0,…,6; prime-power cutoff; empty divisor set at zero | No additional signature counterexample found | — |
| 390 | 3 | SieveDistribution.primeCountAP | No ambient variable; (x : ℝ) (q a : ℕ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | No additional signature counterexample found | — |
| 395 | 3 | SieveDistribution.discrepancy | No ambient variable; (x : ℝ) (q : ℕ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | No additional signature counterexample found | — |
| 401 | 3 | SieveDistribution.PrimesHaveLevel | No ambient variable; (θ : ℝ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | No additional signature counterexample found | — |
| 408 | 3 | SieveDistribution.ElliottHalberstam | No ambient variable; No explicit parameter | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | No additional signature counterexample found | — |
| 413 | 3 | SieveDistribution.windowError | No ambient variable; (N q : ℕ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | No additional signature counterexample found | — |
| 419 | 3 | SieveDistribution.example@419 | No ambient variable; No explicit parameter | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 421 | 3 | SieveDistribution.example@421 | No ambient variable; No explicit parameter | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 423 | 3 | SieveDistribution.example@423 | No ambient variable; (x : ℝ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 426 | 3 | SieveDistribution.example@426 | No ambient variable; No explicit parameter | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 428 | 3 | SieveDistribution.example@428 | No ambient variable; No explicit parameter | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 430 | 3 | SieveDistribution.example@430 | No ambient variable; No explicit parameter | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 432 | 3 | SieveDistribution.example@432 | No ambient variable; (h : ElliottHalberstam) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Nondiscriminating hypothesis specialization | R01/R16 |
| 434 | 3 | SieveDistribution.example@434 | No ambient variable; (h : ElliottHalberstam) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Nondiscriminating hypothesis specialization | R01/R16 |
| 436 | 3 | SieveDistribution.example@436 | No ambient variable; (N : ℕ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 438 | 3 | SieveDistribution.example@438 | No ambient variable; (q : ℕ) | q=0,1,2,3; x=0,5,10; θ=0,1/2,2; inclusive endpoint; added window error 1 | Statement inspected; proof admitted | R01 |
| 442 | 3 | SieveDistribution.primesHaveLevel_of_lt_half | No ambient variable; {θ : ℝ} (hθ : θ < 1 / 2) | θ<0,0 and θ approaching 1/2; window endpoints N−1 and 2N−1 | No additional signature counterexample found | — |
| 452 | 3 | SieveArithmeticDistribution.discrepancy | No ambient variable; (f : ℕ → ℂ) (x : ℝ) (q : ℕ) (a : ℤ) | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | No additional signature counterexample found | — |
| 458 | 3 | SieveArithmeticDistribution.example@458 | No ambient variable; (f : ℕ → ℂ) (x : ℝ) | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Statement inspected; proof admitted | R01 |
| 460 | 3 | SieveArithmeticDistribution.example@460 | No ambient variable; No explicit parameter | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Statement inspected; proof admitted | R01 |
| 462 | 3 | SieveArithmeticDistribution.example@462 | No ambient variable; No explicit parameter | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | Statement inspected; proof admitted | R01 |
| 466 | 3 | SieveArithmeticDistribution.bombieri_vinogradov_maximal | No ambient variable; (A : ℝ) (hA : 0 < A) | q=0,1; nonunit residue; point mass at 2; prime powers 4,9; zero function; maximal cutoff 0 | No additional signature counterexample found | — |
| 477 | 3 | SieveArithmeticDistribution.barban_davenport_halberstam | No ambient variable; (A : ℝ) (hA : 0 < A) | q=1; zero coefficient; common divisors; diagonal variance; Q at logarithmic cutoff | No additional signature counterexample found | — |
| 494 | 4 | SieveMaynard.IsAdmissible | No ambient variable; (H : Finset ℕ) | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | No additional signature counterexample found | — |
| 499 | 4 | SieveMaynard.primeTranslates | No ambient variable; (H : Finset ℕ) | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | No additional signature counterexample found | — |
| 504 | 4 | SieveMaynard.PrimeTuplesConjecture | No ambient variable; No explicit parameter | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | No additional signature counterexample found | — |
| 509 | 4 | SieveMaynard.maynardSimplex | No ambient variable; (k : ℕ) | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | No additional signature counterexample found | — |
| 514 | 4 | SieveMaynard.maynardI | No ambient variable; (k : ℕ) (F : (Fin k → ℝ) → ℝ) | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | No additional signature counterexample found | — |
| 519 | 4 | SieveMaynard.maynardJ | No ambient variable; (k : ℕ) (m : Fin k) (F : (Fin k → ℝ) → ℝ) | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | No additional signature counterexample found | — |
| 525 | 4 | SieveMaynard.IsMaynardAdmissible | No ambient variable; (k : ℕ) (F : (Fin k → ℝ) → ℝ) | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | No additional signature counterexample found | — |
| 532 | 4 | SieveMaynard.maynardRatio | No ambient variable; (k : ℕ) (F : (Fin k → ℝ) → ℝ) | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | No additional signature counterexample found | — |
| 537 | 4 | SieveMaynard.maynardM | No ambient variable; (k : ℕ) | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | No additional signature counterexample found | — |
| 541 | 4 | SieveMaynard.example@541 | No ambient variable; No explicit parameter | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Statement inspected; proof admitted | R01 |
| 542 | 4 | SieveMaynard.example@542 | No ambient variable; No explicit parameter | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Statement inspected; proof admitted | R01 |
| 544 | 4 | SieveMaynard.example@544 | No ambient variable; No explicit parameter | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Statement inspected; proof admitted | R01 |
| 546 | 4 | SieveMaynard.example@546 | No ambient variable; No explicit parameter | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Statement inspected; proof admitted | R01 |
| 548 | 4 | SieveMaynard.example@548 | No ambient variable; (h : PrimeTuplesConjecture) | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Statement inspected; proof admitted | R01 |
| 550 | 4 | SieveMaynard.example@550 | No ambient variable; No explicit parameter | empty tuple; {0,1}; {0,2}; {0,2,4}; shift 2 versus 3 | Statement inspected; proof admitted | R01 |
| 552 | 4 | SieveMaynard.example@552 | No ambient variable; No explicit parameter | simplex boundary (1/2,1/2); exterior (1,1) | Statement inspected; proof admitted | R01 |
| 553 | 4 | SieveMaynard.example@553 | No ambient variable; No explicit parameter | simplex boundary (1/2,1/2); exterior (1,1) | Statement inspected; proof admitted | R01 |
| 555 | 4 | SieveMaynard.example@555 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 556 | 4 | SieveMaynard.example@556 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 558 | 4 | SieveMaynard.example@558 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 560 | 4 | SieveMaynard.example@560 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 562 | 4 | SieveMaynard.example@562 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 564 | 4 | SieveMaynard.example@564 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 566 | 4 | SieveMaynard.example@566 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 568 | 4 | SieveMaynard.example@568 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 570 | 4 | SieveMaynard.example@570 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 574 | 4 | SieveMaynard.infinite_many_primes_of_level | No ambient variable; (θ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1) (hlevel : PrimesHaveLevel θ) (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h) (hH : IsAdmissible (Finset.univ.image h)) | k=0,1; exact integer ceiling; strict positive weighted sum; zero weights; θ=0 excluded | No additional signature counterexample found | — |
| 583 | 4 | SieveMaynard.eventually_log_sub_lt_maynardM | No ambient variable; No explicit parameter | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | No additional signature counterexample found | — |
| 590 | 4 | SieveMaynard.maynardM_five_ge | No ambient variable; No explicit parameter | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | No additional signature counterexample found | — |
| 595 | 4 | SieveMaynard.four_lt_maynardM_105 | No ambient variable; No explicit parameter | k=0,1; b=0 simplex moment; exact M₅ polynomial; all 42 M₁₀₅ coefficients; singular J-form kernel | No additional signature counterexample found | — |
| 600 | 4 | SieveMaynard.frequently_nth_prime_succ_sub_le_600 | No ambient variable; No explicit parameter | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | No additional signature counterexample found | — |
| 606 | 4 | SieveMaynard.elliottHalberstam_gaps | No ambient variable; (hEH : ElliottHalberstam) | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | No additional signature counterexample found | — |
| 613 | 4 | SieveMaynard.exists_frequently_nth_prime_sub_le | No ambient variable; No explicit parameter | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | No additional signature counterexample found | — |
| 621 | 4 | SieveMaynard.positive_proportion_prime_tuples | No ambient variable; (m : ℕ) (hm : 1 ≤ m) | empty first-prime tuple; k=1; zero-based prime indexing; m=1; all 27 local tests for H₁₀₅ | No additional signature counterexample found | — |
| 629 | 4 | SieveMaynard.example@629 | No ambient variable; No explicit parameter | k=0,1,2; zero and constant-one functions; triangle indicator; nonzero zero-fibre kernel | Statement inspected; proof admitted | R01 |
| 642 | 5 | SieveAlmostPrime.rough_to_at_most_almost_prime | No ambient variable; {z n k : ℕ} (hz : 2 ≤ z) (hn : n ≠ 0) (hsmall : n < z^(k+1)) (hrough : ∀ p : ℕ, p.Prime → p ∣ n → z ≤ p) | n=0,1,8,25; z=2; strict threshold n<z^(k+1); multiplicity versus distinct factors | No additional signature counterexample found | — |
| 647 | 5 | SieveAlmostPrime.example@647 | No ambient variable; No explicit parameter | n=0,1,8,25; z=2; strict threshold n<z^(k+1); multiplicity versus distinct factors | Statement inspected; proof admitted | R01 |
| 649 | 5 | SieveAlmostPrime.example@649 | No ambient variable; No explicit parameter | n=0,1,8,25; z=2; strict threshold n<z^(k+1); multiplicity versus distinct factors | Statement inspected; proof admitted | R01 |
| 656 | 5 | SieveWeighted.chen_goldbach | No ambient variable; No explicit parameter | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | No additional signature counterexample found | — |
| 662 | 5 | SieveWeighted.chen_prime_shift | No ambient variable; (h : ℕ) (hh : 0 < h) (hh2 : Even h) | N=1000 weight cases; square exceptions; h=0/odd excluded; C₀,C₆,C₁₀,C₁₈; source constants uncertified | No additional signature counterexample found | — |
| 671 | 5 | SieveAffine.IsPrimitivePair | {d : ℕ}; (O : Set (Fin d → ℤ)) (f : MvPolynomial (Fin d) ℤ) | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | No additional signature counterexample found | — |
| 674 | 5 | SieveAffine.example@674 | No ambient variable; No explicit parameter | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Statement inspected; proof admitted | R01 |
| 676 | 5 | SieveAffine.example@676 | No ambient variable; No explicit parameter | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Statement inspected; proof admitted | R01 |
| 679 | 5 | SieveAffine.example@679 | {d : ℕ}; (f : MvPolynomial (Fin d) ℤ) | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Statement inspected; proof admitted | R01 |
| 682 | 5 | SieveAffine.almostPrimeLocus | {d : ℕ}; (O : Set (Fin d → ℤ)) (f : MvPolynomial (Fin d) ℤ) (r : ℕ) | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | No additional signature counterexample found | — |
| 686 | 5 | SieveAffine.example@686 | No ambient variable; No explicit parameter | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Statement inspected; proof admitted | R01 |
| 689 | 5 | SieveAffine.example@689 | No ambient variable; No explicit parameter | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | Statement inspected; proof admitted | R01 |
| 694 | 5 | SieveAffine.affine_expansion_level | No ambient variable; (X τ dim D C : ℝ) (hX : 1 ≤ X) (hτ : 0 ≤ τ) (hτ1 : τ < 1) (hdim : 1 ≤ dim) (hD : 1 ≤ D) (hC : 0 ≤ C) (R : ℕ → ℝ) (hR : ∀ k : ℕ, 1 ≤ k → (k : ℝ) ≤ D → ∣R k∣ ≤ C*X^τ*(k : ℝ)^(dim-1)) | empty orbit; values 2,3 versus modulus 6; −6,0,1,8; word length 0; τ endpoint; Brun positivity | True finite sum estimate; wrong headline | R06 |

### Source-locator comparison ledger

These are locator groups, so a row can cover several repeated citations. A located statement and a complete proof are distinguished in the result column. Sources are identified by their extraction line numbers; no source passage is reproduced.

| Source | Locator group | Extraction witness | Result |
|---|---|---|---|
| HB-SIEVES | Corollary 3.3 | HB-SIEVES line 1054 | Twin reciprocal convergence located |
| HB-SIEVES | Theorem 5.1 and Corollary 5.1 | HB-SIEVES line 1768 | Linear-sieve normalization; source lower-sign correction retained |
| KED-ANT-11 | Lemma 11.1 | KED-ANT-11 line 381 | Inclusion-exclusion |
| KED-ANT-11 | Lemma 11.2 | KED-ANT-11 line 411 | Weighted brackets |
| KED-ANT-11 | Lemma 11.5 | KED-ANT-11 line 474 | Rankin cutoff |
| KED-ANT-11 | Lemmas 11.7–11.8 | KED-ANT-11 line 530 | Dimension products and tails; endpoint conventions checked |
| KED-ANT-11 | Theorem 11.9 | KED-ANT-11 line 582 | Mass/cutoff distinction retained |
| KED-ANT-12 | Lemma 12.1 and D± construction | KED-ANT-12 line 475 | Brun parity and prefix inequalities |
| KED-ANT-12 | Theorem 12.2 | KED-ANT-12 line 655 | 9κ+1 and K^10; R05 |
| KED-ANT-14 | §14.1 (14.1.1)–(14.1.5) | KED-ANT-14 line 353 | Wirsing normalization and Euler product |
| KED-ANT-14 | §14.2 (14.2.1) | KED-ANT-14 line 438 | Squarefree Selberg denominator; R02 |
| KED-chap-largesieve | Lemma 15.1 | KED-chap-largesieve line 391 | Separated Hilbert inequality |
| KED-chap-largesieve | Corollaries 15.2–15.3 | KED-chap-largesieve line 412 | Periodic cosecant and two Fourier twists |
| KED-chap-largesieve | Lemma 15.4 | KED-chap-largesieve line 476 | Squared duality |
| KED-chap-largesieve | Theorem 15.5 | KED-chap-largesieve line 512 | H−1+δ⁻¹ with H≥1 |
| KED-chap-largesieve | Exercise 15.4.4 | KED-chap-largesieve line 582 | Sharp padding argument |
| KED-ANT-16 | Theorem 16.1 | KED-ANT-16 line 373 | Reduced-fraction large sieve |
| KED-ANT-16 | Theorem 16.2 | KED-ANT-16 line 401 | Primitive-character normalization, including modulus 1 |
| KED-ANT-16 | Theorem 16.4 and Lemma 16.5 | KED-ANT-16 line 485 | Restricted-coefficient correction needed and already retained |
| KED-ANT-16 | Theorem 16.7 | KED-ANT-16 line 556 | Linnik bound; smooth-number proof correction checked |
| KED-chap-bombieri | Theorem 17.1 | KED-chap-bombieri line 381 | BV cutoff |
| KED-chap-bombieri | Conjecture 17.2 | KED-chap-bombieri line 406 | EH remains a hypothesis |
| KED-chap-bombieri | Theorem 17.4 | KED-chap-bombieri line 431 | BDH second moment |
| KED-ANT-18 | Lemma 18.2 / Theorem 18.3 | KED-ANT-18 line 373 | Small-conductor and convolution estimates; acknowledged proof losses retained |
| KED-ANT-18 | Equation (18.2.1) | KED-ANT-18 line 510 | Vaughan identity; small-n correction independently tested |
| KED-ANT-18 | Theorem 18.4 | KED-ANT-18 line 520 | BV statement located; maximal upgrade remains part of roadmap work |
| KED-ANT-18 | Theorem 18.5 | KED-ANT-18 line 630 | Variance and coefficient norm |
| BOMBIERI-1971 | Proposition 1, pp.402–403 | BOMBIERI-1971 line 53 | Weighted denominator and its zero-row convention checked against finite examples |
| BENNETT-SIKSEK-2020 | Theorem 7, p.379 | BENNETT-SIKSEK-2020 line 1046 | Uniform Gram-row version; ownership R09 |
| MAYNARD-2015 | Theorems 1.1–1.4 | MAYNARD-2015 line 83 | Gap constants, growth and subset proportion |
| MAYNARD-2015 | Proposition 4.1 | MAYNARD-2015 line 268 | W powers, λ support, I/J normalization |
| MAYNARD-2015 | Proposition 4.2 | MAYNARD-2015 line 311 | Ceiling and strict positivity |
| MAYNARD-2015 | Proposition 4.3 | MAYNARD-2015 line 353 | M₅, M₁₀₅ and large-k bound |
| MAYNARD-2015 | Lemma 6.1 | MAYNARD-2015 line 1100 | Ω hypotheses and constant dependence |
| MAYNARD-2015 | Lemma 8.1 | MAYNARD-2015 line 1718 | Simplex moments; missing r=0 term corrected in roadmap |
| MAYNARD-2015 | Lemmas 8.2–8.3 | MAYNARD-2015 line 1844 | Moment formula; positive-semidefinite J correction and kernel tested |
| MAYNARD-2015 | Equations (8.16)–(8.17) | MAYNARD-2015 line 2020 | M₅ exact polynomial and quotient |
| GGPY-2009 | Lemma 3, (2.3)–(2.5) | GGPY-2009 line 410 | Squarefree diagonal asymptotic; R04 concerns added proof step |
| GGPY-2009 | Lemma 4 | GGPY-2009 line 443 | Weighted diagonal sum |
| SS-23 | Lemma 6.3 | SS-23 line 2803 | Prime-denominator convention and original prime-indexed form |
| HB-REAL-95 | Theorem 1 | HB-REAL-95 line 189 | Odd squarefree restrictions on both variables |
| HB-REAL-95 | Corollary 4 | HB-REAL-95 line 243 | Bilinear extension to unrestricted numerators |
| JUTILA-ORIGINAL | Lemma 3, p.194 | JUTILA-ORIGINAL line 127 | Square-product diagonal and eighth-moment error; scan checked |
| SMITH-17 | Proposition 6.6 | SMITH-17 line 3226 | Prime Legendre bilinear range |
| KP-22 | Proposition 7.6 / (7.11) | KP-22 line 2891 | Growth hypotheses and row normalization |
| KHAYUTIN-19 | §9 definitions and Theorem 9.7 | KHAYUTIN-19 line 3370 | Ordinary versus corrected densities; analytic gap retained |
| KHAYUTIN-19 | Lemma B.4 | KHAYUTIN-19 line 6177 | Singular-prime recursion; source corrections checked |
| KHAYUTIN-19 | Proposition B.5 and Corollary B.6 | KHAYUTIN-19 line 6305 | Odd and dyadic formulas and uniform 16 bound |
| BSKK-23 | Lemma 6.2 | BSKK-23 line 1832 | Polynomial Farey bound |
| BSKK-23 | Lemma 8.2 | BSKK-23 line 2269 | Joint-law polynomial Brun estimate |
| BSKK-23 | Lemma 8.3 | BSKK-23 line 2504 | Euler product excluding variable |
| IWA-ROSSER | Theorem 1, equations (1.4)–(1.5) | IWA-ROSSER line 79 | Exponent −1/3 confirmed by the scan; κ-dependent delay normalization retained |
| KM-21 | §2.3, equation (2.4) | KM-21 line 240 | Unit-averaged ideal sequence; ψ dependence retained |
| KM-21 | Lemma 4.1 | KM-21 line 1205 | Element/ideal typo and rational norm period corrected in roadmap |
| FIMR-13 | Propositions 5.1–5.2 | FIMR-13 line 1120 | Type I/II sieve conversion; θϑ/(2+θ) exponent |
| HB-SIEVES | §1, (1.1)–(1.8), Corollary 1.1 | HB-SIEVES line 80 | Finite interchange, signed remainder and both bracket directions |
| HB-SIEVES | §2, Lemmas 2.1–2.2 and (2.2)–(2.6) | HB-SIEVES line 362 | Normalization at one, squarefree diagonalization, support and optimizer |
| HB-SIEVES | Fundamental Theorem for Selberg’s sieve | HB-SIEVES line 556 | 3^ω(d) error coefficient and strict squared cutoff |
| HB-SIEVES | Corollary 3.1, (3.1) | HB-SIEVES line 588 | Progression-prime deletion and μ²/φ denominator |
| HB-SIEVES | §3 applications, (3.3), (3.5)–(3.6) | HB-SIEVES line 848 | Interval/progression bounds with x≥4k in the roadmap |
| HB-SIEVES | Corollary 3.2; Theorems 3.1–3.2 | HB-SIEVES line 690 | Twin/Goldbach local factor; roadmap separates prime two |
| HB-SIEVES | §4, A± and (4.2) | HB-SIEVES line 1198 | Multiplicity parity, exact floor identity and surviving unit |
| HB-SIEVES | §5, (5.1)–(5.3), Lemma 5.1 | HB-SIEVES line 1505 | Odd/even prefix brackets and strict support inspected |
| HB-SIEVES | Fundamental Lemma, p.38 | HB-SIEVES line 1908 | Roadmap correctly requires relative remainder o(XV) |
| HB-SIEVES | Theorems 6.1–6.2, pp.42–45 | HB-SIEVES line 2088 | Integral criterion located; missing local-density hypothesis R20 |
| HB-SIEVES | §6, (6.7), pp.47–48 | HB-SIEVES line 2302 | Chen squarefree weight inequality; square exceptions retained |
| MAYNARD-2015 | Lemma 5.1 and (5.9) | MAYNARD-2015 line 452 | S₁ diagonal and coefficient bound located |
| MAYNARD-2015 | Lemma 5.2 | MAYNARD-2015 line 746 | Prime coordinate, g(p)=p−2 and added window error one |
| MAYNARD-2015 | Lemma 5.3 | MAYNARD-2015 line 947 | The rm=1 hypothesis is explicit |
| MAYNARD-2015 | Lemma 6.2 | MAYNARD-2015 line 1128 | S₁ has φ(W)^k/W^(k+1) normalization |
| MAYNARD-2015 | Lemma 6.3 | MAYNARD-2015 line 1229 | S₂ normalization includes log R/log N |
| MAYNARD-2015 | §7, (7.1)–(7.21) | MAYNARD-2015 line 1406 | Large-k construction and eventual log k−2loglog k−2 lower bound |
| BSKK-23 | Lemma 3.7, equation (3.5) | BSKK-23 line 1395 | Probability Fourier energy has the squared ℓ² norm |
| KHAYUTIN-19 | Lemma 9.8, (35)–(37) | KHAYUTIN-19 line 3522 | Squarefree Euler-denominator bound |
| KHAYUTIN-19 | Lemma 9.9, (38) | KHAYUTIN-19 line 3573 | Full A^(1/2) cutoff is stated in the source; R21 |
| KHAYUTIN-19 | Lemma 9.11 | KHAYUTIN-19 line 3669 | Roadmap corrects the source’s s→0 issue by requiring s≥1 |
| KHAYUTIN-19 | Lemma 9.12 | KHAYUTIN-19 line 3686 | Power-level extension; depends on the preceding geometric bound |
| KHAYUTIN-19 | Lemma 9.13 and Corollary 9.14 | KHAYUTIN-19 line 3718 | Coprime quotient uses corrected density; unrestricted quotient uses ordinary density |
| KHAYUTIN-19 | Definition 9.15, Remark 9.16, Corollary 9.17 | KHAYUTIN-19 line 3791 | Squarefree correction kernel and growth-class change |
| KHAYUTIN-19 | Lemma 9.18 and Remark 9.19 | KHAYUTIN-19 line 3832 | Nonnegative multiplicative decoupling; infinite tails require convergence |
| KHAYUTIN-19 | Lemma 9.20 | KHAYUTIN-19 line 3923 | ε<r yields convergent correction Euler factors |
| KHAYUTIN-19 | Lemma 9.21, (41)–(44) | KHAYUTIN-19 line 3968 | Roadmap correctly retains the missing Möbius-difference factors in its proof obligation |
| KHAYUTIN-19 | Lemma 9.23 | KHAYUTIN-19 line 4061 | Roadmap explicitly repairs α=0 and keeps constants dependent on fixed α |
| KHAYUTIN-19 | Definition 9.24; Propositions 9.25–9.26 | KHAYUTIN-19 line 4330 | Congruence normalizations located; stronger rescaled curvature condition retained |
| KHAYUTIN-19 | Definition 10.5 and Proposition 10.10 proof | KHAYUTIN-19 line 4802 | Arbitrary-order ideal counts need conductor modifications; R12 |
| KHAYUTIN-19 | Lemma B.1, Remark B.2 and Proposition B.3 | KHAYUTIN-19 line 6112 | Integral basis changes and regular conic sign located |
| KHAYUTIN-19 | Proposition B.8, (69)–(72) | KHAYUTIN-19 line 6430 | Two-term genus-sign normalization checked by the p=3 count |
| KM-21 | Theorems 1–2 | KM-21 line 70 | Field, inverse-free subset, unit and conditional-character hypotheses |
| KM-21 | Conjecture Cn and Corollary 2.2 | KM-21 line 340 | Progression hypothesis located; reduced-conductor repair is needed and retained |
| KM-21 | Lemma 3.1 | KM-21 line 533 | Squarefull-radical tail and order-of-automorphism exponent |
| KM-21 | Lemma 3.2 | KM-21 line 719 | Codimension-two norm-divisor tail; zero loci require separation |
| KM-21 | Equations (2.5)–(2.6) | KM-21 line 364 | Type I/II exponents agree with the prime-sum exponent |
| KM-21 | Equation (4.3) | KM-21 line 1100 | Reciprocity factor depends on residue/sign data; ownership R13 |
| KM-KERNEL-PUBLISHED | Proposition 3.6 and its proof | KM-KERNEL-PUBLISHED line 557 | Published-numbering institutional copy located; weaker squarefull version compared with KM Lemma 4.1 |
| FIMR-13 | §2 and Lemma 2.1 | FIMR-13 line 177 | Odd-ideal symbol and reciprocity convention; zero/even extensions are explicit adapters |

### Other bold paragraph headings read

| README line | Bold item | Kind |
|---|---|---|
| 3 | Summary. | Annotation/correction read; no separate theorem signature |
| 694 | Additional check. | Annotation/correction read; no separate theorem signature |
| 1181 | Analytic proof requirement. | Annotation/correction read; no separate theorem signature |
| 3536 | HB-SIEVES, arXiv v1 p.1, introductory question (i); not collated with the published proceedings. | Annotation/correction read; no separate theorem signature |
| 3538 | HB-SIEVES, arXiv v1 p.2, Example 1; related divisor-count equality on p.4; not collated with the published proceedings. | Annotation/correction read; no separate theorem signature |
| 3540 | HB-SIEVES, arXiv v1 pp.2-3, Example 2 image set and the next page's first counting equality; not collated with the published proceedings. | Annotation/correction read; no separate theorem signature |
| 3542 | HB-SIEVES, arXiv v1 p.2, Example 2 displayed prime-pair count; distinct from the image-multiplicity convention above. | Annotation/correction read; no separate theorem signature |
| 3544 | HB-SIEVES, arXiv v1 p.2, Example 3 primitive sum-of-two-squares interpretation; not collated with the published proceedings. | Annotation/correction read; no separate theorem signature |
| 3546 | HB-SIEVES, arXiv v1 p.4, Corollary 1.2 and its immediately preceding asymptotic argument; not collated with the published proceedings. | Annotation/correction read; no separate theorem signature |
| 3548 | KED-ANT-11, §11.5, proof of Theorem 11.11 invoking Theorem 11.9. | Annotation/correction read; no separate theorem signature |
| 3550 | KED-ANT-11, §11.5, proof of Theorem 11.11 between (11.5.1) and the asserted sieve estimate. | Annotation/correction read; no separate theorem signature |
| 3552 | BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.402, coefficient choice immediately after equation (4). | Annotation/correction read; no separate theorem signature |
| 3554 | BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.403, display immediately after the definition of K_M. | Annotation/correction read; no separate theorem signature |
| 3556 | BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.404, opening definition of I_m and the immediately following assertion that the bins cover all points. | Annotation/correction read; no separate theorem signature |
| 3558 | KED-ANT-16, §16.1, display (16.1.2), and §16.3, proof of Theorem 16.7. | Annotation/correction read; no separate theorem signature |
| 3560 | KED-ANT-16, §16.3, Definition 16.3, Theorem 16.4 and Lemma 16.5. | Annotation/correction read; no separate theorem signature |
| 3562 | KED-ANT-16, §16.3, proof of Theorem 16.4. | Annotation/correction read; no separate theorem signature |
| 3564 | KED-ANT-16, §16.3, proof of Lemma 16.5, Chinese-remainder display. | Annotation/correction read; no separate theorem signature |
| 3566 | KED-ANT-16, §16.3, proof of Theorem 16.7, the density of the sieved classes. | Annotation/correction read; no separate theorem signature |
| 3568 | KED-ANT-16, §16.3, proof of Theorem 16.7, final lower bound for smooth integers. | Annotation/correction read; no separate theorem signature |
| 3570 | KED-ANT-16, §16.3, Definition 16.6. | Annotation/correction read; no separate theorem signature |
| 3572 | KED-ANT-18, §18.1, Theorem 18.3 proof, small-r bound after (18.1.2). | Annotation/correction read; no separate theorem signature |
| 3574 | KED-ANT-18, §18.1, Theorem 18.3 proof, summation of the dyadic large-r estimates. | Annotation/correction read; no separate theorem signature |
| 3576 | KED-ANT-18, §18.2, boundary explanation following (18.2.2). | Annotation/correction read; no separate theorem signature |
| 3578 | KED-ANT-18, §18.2, multiplicative partition parameter after (18.2.3). | Annotation/correction read; no separate theorem signature |
| 3580 | KED-ANT-18, §18.2, multiplicative partition and rectangles after (18.2.3). | Annotation/correction read; no separate theorem signature |
| 3582 | KED-ANT-18, §18.2, display defining D(L,M;N,m). | Annotation/correction read; no separate theorem signature |
| 3584 | KED-ANT-18, §18.2, last aggregate bound and substitution δ=Δ^(1/2). | Annotation/correction read; no separate theorem signature |
| 3586 | KED-ANT-18, §18.3, Theorem 18.5 display. | Annotation/correction read; no separate theorem signature |
| 3588 | MAYNARD-2015, Proof of Proposition 4.2, display (4.4), p. 389 (arXiv v3 p. 6) | Annotation/correction read; no separate theorem signature |
| 3590 | MAYNARD-2015, Proof of Lemma 5.1, display (5.8), p. 393 (arXiv v3 p. 9) | Annotation/correction read; no separate theorem signature |
| 3592 | MAYNARD-2015, Proof of Theorem 1.1, p. 391 (arXiv v3 p. 7) | Annotation/correction read; no separate theorem signature |
| 3594 | MAYNARD-2015, §7, sentence before (7.10), p. 407 (arXiv v3 p. 19) | Annotation/correction read; no separate theorem signature |
| 3596 | MAYNARD-2015, Lemma 8.1, definition of G_{b,j}, p. 409 (arXiv v3 p. 21); also (8.6) | Annotation/correction read; no separate theorem signature |
| 3598 | MAYNARD-2015, Proof of Lemma 8.2, display (8.10), p. 411 (arXiv v3 p. 23) | Annotation/correction read; no separate theorem signature |
| 3600 | KED-ANT-12, §12.4, Theorem 12.2, second inequality. | Annotation/correction read; no separate theorem signature |
| 3602 | KED-ANT-12, §12.1, paragraph beginning with the all-prime specialization, and the prime-indicator example before §12.2 | Annotation/correction read; no separate theorem signature |
| 3604 | KED-ANT-12, §12.1 inclusive P(z) definition versus Lemma 12.1 V(p_n) and p₁<z, and Exercise 12.6.1 hint | Annotation/correction read; no separate theorem signature |
| 3606 | KHAYUTIN-19, Published Lemma 9.9, pp.224–225, lcm discrepancy step | Annotation/correction read; no separate theorem signature |
| 3608 | KHAYUTIN-19, Published Lemma 9.11, pp.225–226 | Annotation/correction read; no separate theorem signature |
| 3610 | KHAYUTIN-19, Published Theorem 9.7 proof, equation (47), p.233 | Annotation/correction read; no separate theorem signature |
| 3612 | KHAYUTIN-19, Published Proposition 9.25, pp.235–236, scaled-domain hypothesis | Annotation/correction read; no separate theorem signature |
| 3614 | KHAYUTIN-19, Published Proposition 9.26, pp.236–237, local factor and first proof congruence | Annotation/correction read; no separate theorem signature |
| 3616 | KHAYUTIN-19, Published Lemma B.4, pp.266–267, m≥1 smooth term and closed formula | Annotation/correction read; no separate theorem signature |
| 3618 | KHAYUTIN-19, Published Proposition B.5, equation (68) and odd-valuation branch, pp.268–269 | Annotation/correction read; no separate theorem signature |
| 3620 | KHAYUTIN-19, Published Proposition B.5, p.268, second displayed branch | Annotation/correction read; no separate theorem signature |
| 3622 | KHAYUTIN-19, Published Corollary B.7, p.269, n≤ℓ branch and n=ℓ formula | Annotation/correction read; no separate theorem signature |
| 3624 | KHAYUTIN-19, Published Proposition B.8, equations (69)–(72), pp.270–271 | Annotation/correction read; no separate theorem signature |
| 3626 | HB-SIEVES, arXiv math/0209360v1, Theorem 5.1, p.35 | Annotation/correction read; no separate theorem signature |
| 3628 | HB-SIEVES, arXiv math/0209360v1, Example 1 after Corollary 5.1, p.36 | Annotation/correction read; no separate theorem signature |
| 3630 | HB-SIEVES, arXiv math/0209360v1, Example 4, p.38 | Annotation/correction read; no separate theorem signature |
| 3632 | HB-SIEVES, arXiv math/0209360v1, fundamental lemma at end of §5, p.38 | Annotation/correction read; no separate theorem signature |
| 3634 | HB-SIEVES, arXiv math/0209360v1, partial summation after (6.3), p.44 | Annotation/correction read; no separate theorem signature |
| 3636 | HB-SIEVES, arXiv math/0209360v1, Chen theorem local constant, p.46 | Annotation/correction read; no separate theorem signature |
| 3638 | KM-21, arXiv:1809.09597v1, definition (2.4), pp.5–6 | Annotation/correction read; no separate theorem signature |
| 3640 | KM-21, arXiv:1809.09597v1, Lemma 4.1 domain, p.20 | Annotation/correction read; no separate theorem signature |
| 3642 | KM-21, arXiv:1809.09597v1, Lemma 4.1(P3), p.20 | Annotation/correction read; no separate theorem signature |
| 3644 | KM-21, arXiv:1809.09597v1, Theorem 1, p.2, implied-constant dependence | Annotation/correction read; no separate theorem signature |
| 3646 | HB-SIEVES, arXiv math/0209360v1, p.24, definition of E_c and the Liouville summatory bound; p.25 second-moment calculation | Annotation/correction read; no separate theorem signature |
| 3648 | HB-SIEVES, arXiv math/0209360v1, p.25, cutoff choice following (4.2) | Annotation/correction read; no separate theorem signature |
| 3650 | HB-SIEVES, arXiv math/0209360v1, p.33, (5.3) and the immediately following normalized main-sum display | Annotation/correction read; no separate theorem signature |
| 3652 | HB-SIEVES, arXiv math/0209360v1, p.28, Theorem 4.1 induction, before (4.5) | Annotation/correction read; no separate theorem signature |
| 3654 | MAYNARD-2015, Published Ann. Math. 181 (2015), p.404, (6.18) | Annotation/correction read; no separate theorem signature |
| 3656 | MAYNARD-2015, Published Ann. Math. 181 (2015), p.411, matrix-positivity assertion after Lemma 8.2 | Annotation/correction read; no separate theorem signature |
| 3658 | KHAYUTIN-19, Published Ann. Math. 189 (2019), pp.230–231, Lemma 9.21, (43)–(44) and final prime-sum estimate | Annotation/correction read; no separate theorem signature |
| 3660 | KHAYUTIN-19, Published Ann. Math. 189 (2019), p.231, Lemma 9.23, the two-case proof | Annotation/correction read; no separate theorem signature |
| 3662 | FIMR-13, Public author manuscript, §5, Proposition 5.1 proof, pp.21–24, dyadic block sizes | Annotation/correction read; no separate theorem signature |
| 3664 | FIMR-13, Published Invent. Math. 193 (2013), pp.723,727–730 and §9 progression reduction, as corrected by the published 2015 erratum, pp.923–925 | Annotation/correction read; no separate theorem signature |
| 3666 | BGS-10, Published Invent. Math. 179 (2010), p.577, (3.23) and (3.28) | Annotation/correction read; no separate theorem signature |
| 3668 | BGS-10, Published Invent. Math. 179 (2010), p.581, (3.47), compared with Theorem 3.1 and (3.33) | Annotation/correction read; no separate theorem signature |
| 3670 | CHEN-73-CN, Chinese original, p.127, (27) | Annotation/correction read; no separate theorem signature |

## Not verifiable

- **HR-1974, Sieve Methods, Lemmas 5.3–5.4:** the sources service found no legal readable copy. GGPY-2009 Lemmas 3–4 state the relevant results but defer their proofs. The complete dimension-one diagonal-asymptotic proof remains unverified; R04 concerns an independently false added proof step.
- **RICHERT-1969, Selberg’s sieve with weights, Theorem A:** DOI 10.1112/S0025579300004563 returned a Wiley access failure; the service recorded failed, not uncertified. Its use in the Chen original-family lower estimate cannot be collated. The accessible Heath-Brown weighted-sieve theorem was checked separately.
- **CHEN-73-CN, Chinese pp.111–128:** the publisher DOI request failed and lawful provenance of the linked third-party scan was not established. The original statements, 3.9404/2.6408 constants, and claimed equation-(27) misprint cannot be certified from that text. The differently paginated English edition was not substituted. These three missing works are consolidated in the scratch `needs-references.toml` request.
- **BGS-10:** the source record is settled uncertified, DOI 10.1007/s00222-009-0225-3. Its printed locators and alleged source corrections were not certified against the full text; no new missing-text request is made. R05 is the package’s internal Brun mismatch and is independent of this limitation.
- **FIMR-ERRATUM-2015:** settled uncertified, DOI 10.1007/s00222-015-0613-9, pp.923–925. The exact applicability of items 1,3–5,7 remains uncollated; no renewed request is made.
- **DFI-1997, Lemma 9:** settled uncertified, DOI 10.1007/s002220050135. FIMR-13 cites it for separation of variables, but its full proof was not available; no renewed request is made.
- **Unavailable supplier heads:** AnalyticNumberTheoryPartI/PartII, GeometryOfNumbersAndQuadraticArithmetic and AdelicAlgebraicGroups are earlier merge-order names, but their current head files were not among the supplied main/completed folders or seven sibling checkouts. Their stronger interfaces cannot be certified from the target’s descriptions. R07 records the wrong names actually cited; R08 records prerequisites the target itself says are absent.
- **Elaboration and proof closure:** the read-only brief prohibits Lean builds, so no elaborated `#check @name`, compiler result or proof validation is claimed. The 95 locator comparisons and boundary ledger do not certify the roadmap’s remaining long analytic proof obligations, including the acknowledged corrected-density R₂ argument, maximal-cutoff transfers and spin exceptional-set estimates.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "25cdbc47ba6cac53c700dd858f463d944628bbef", "job": "RT-SieveMethodsAndPrimePatterns~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
