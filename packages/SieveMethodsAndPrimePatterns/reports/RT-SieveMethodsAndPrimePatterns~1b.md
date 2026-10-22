<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/177#issuecomment-6336385898 -->
Red team round 1 pass b (claude) of 25cdbc4

Verdict: needs_changes

1. **F01** (P2) Missing easy headline: the Brun–Titchmarsh bound is a README target but absent from Suggested.lean

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1249`: “Prove `SieveApplications.progression_upper`. There is an absolute C such that for k≥1, gcd(a,k)=1 and x≥4k, π(x;k,a)≤C x/[φ(k)log(x/k)].”

   **Claim:** This classical Layer 1 headline is statable on the pinned carriers alone (a filtered `Finset.range` count, `Nat.totient`, `Real.log`), exactly like its two neighbours `prime_interval_upper` and `twin_goldbach_upper`, which the file does state; a missing easy headline is a major defect under the Suggested.lean rules. The file records the interval and twin/Goldbach Selberg applications but not the progression bound, so the one uniform-in-the-modulus statement of the subsection, the one later consumers (Chen, Richert) actually use, is not among the signatures contributors are held to.

   **Witness:** `packages/SieveMethodsAndPrimePatterns/Suggested.lean:213` (`prime_interval_upper`) and `:219` (`twin_goldbach_upper`) are present; no declaration named `progression_upper` occurs in the file. The statement below elaborated in a probe copy against the pinned Mathlib with only the `declaration uses 'sorry'` warning.

   **Exact repair text:** insert after `twin_goldbach_upper` in `namespace SieveApplications` (Layer 1):

   ```lean
   /-- Brun–Titchmarsh: a Selberg-sieve upper bound for primes in a reduced residue class,
   uniform in the modulus. -/
   theorem progression_upper : ∃ C : ℝ, 0 < C ∧ ∀ (k a : ℕ) (x : ℝ), 1 ≤ k → Nat.Coprime a k →
       4 * (k : ℝ) ≤ x →
       ((((Finset.range (⌊x⌋₊ + 1)).filter (fun p => p.Prime ∧ p ≡ a [MOD k])).card : ℕ) : ℝ) ≤
         C * x / ((k.totient : ℝ) * Real.log (x / k)) := by sorry
   ```

2. **F02** (P3) A target with an empty dependency line

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:1391`: “*Needs:* .”

   **Claim:** The target `SieveTaper.taper_weight` (`README.md:1381`) is the only target in the README whose `*Needs:*` line names nothing; every other target lists its Mathlib or Layer inputs, and the build-order rules require one `*Needs:*` line per theorem with its inputs. The proof sketch at `README.md:1387` uses the two maxima defining T and real casts of integer absolute values, so the inputs are nameable.

   **Witness:** `README.md:1391` is the only line matching an empty `*Needs:*` pattern in the file; the pinned Mathlib has `max_def` and `Int.cast_abs`.

   **Exact repair text:** replace line 1391 by “*Needs:* Mathlib `max_def`; Mathlib `Int.cast_abs`.”

3. **F03** (P3) Review-process narrative in the source-sensitive conventions

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:3550`: “this finding concerns the displayed inference, not a claim that the prior homework lacks a stronger result.”; `README.md:3568`: “This finding does not assert Linnik’s theorem is false.”; `README.md:3644`: “No finding is asserted against the uncollated Duke text.”

   **Claim:** “finding” is the vocabulary of the review process; the README must be timeless and carry no review narrative. A reader a year from now cannot tell what a “finding” was.

   **Witness:** the three lines above are the only occurrences of the word in the README (a whole-file search); the surrounding convention entries say the same thing without it.

   **Exact repair text:** at line 3550 replace “this finding concerns the displayed inference” by “this note concerns the displayed inference”; at line 3568 replace “This finding does not assert Linnik’s theorem is false.” by “Linnik’s theorem is not asserted to be false.”; at line 3644 replace “No finding is asserted against the uncollated Duke text.” by “Nothing is asserted about the uncollated Duke text.”

4. **F04** (P3) A completed supplier cited as if active, and a downstream consumer cited by a layer label it does not have

   **Location:** `packages/SieveMethodsAndPrimePatterns/README.md:74`: “ArithmeticDirichletSeries Layers 1, 2 and 5 supply finite ideal norm fibres, ideal convolution/divisor moments and the removal of prime powers in the ideal sieve.”; `README.md:3528`: “ArithmeticStatistics Layer ST.2 consumes the large sieve and the bilinear estimates of Layer 2.”

   **Claim:** ArithmeticDirichletSeries exists on `main` only as `Completed/ArithmeticDirichletSeries`; sibling roadmaps on `main` cite it with the Completed link, whereas this README names it bare at lines 11, 74, 88, 866, 920, 3449, 3469, 3489 and 3524. `ArithmeticStatistics` is an open board package (in the merge order on the board's main, above the eight `ArithmeticStatisticsPartI` … `PartVIII` roadmaps), but neither it nor the Parts carry `ST.`-numbered layers, so “Layer ST.2” points at no section. (The supplier-content questions about ArithmeticDirichletSeries are pass a’s F14 and are not re-raised here.)

   **Witness:** `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:15` and `TauCetiRoadmap/TauberianBoundaryConvergence/README.md:8` end a citation with `Completed/ArithmeticDirichletSeries/README.md)`; the merge order on the board's main lists `ArithmeticStatistics` and its eight Parts; the board package `packages/ArithmeticStatistics/` and the Parts' READMEs use `## Layer k` / `### k.n` headings and contain no `ST.` label.

   **Exact repair text:** at line 74 write “[ArithmeticDirichletSeries](../../Completed/ArithmeticDirichletSeries/README.md) Layers 1, 2 and 5 supply finite ideal norm fibres, ideal convolution/divisor moments and the removal of prime powers in the ideal sieve.” (first mention; later mentions may stay bare); at line 3528 delete the sentence “ArithmeticStatistics Layer ST.2 consumes the large sieve and the bilinear estimates of Layer 2.” or replace “Layer ST.2” by the section of ArithmeticStatistics (or of the Part) that states that consumer.

## Verified sound

Read all 3,724 README lines and all 725 Lean lines; the Lean file has 130 declarations (29 definitions/abbreviations, 33 theorems, 68 examples), and every bold README target (the 224 counted by pass a) was read with its hypotheses, Checks and `*Needs:*` line.

Elaboration: the submitted `Suggested.lean` (single `import Mathlib`, no `TauCeti.*` import) elaborated in a probe copy against the pinned Mathlib with exit code 0 and exactly 101 `declaration uses 'sorry'` warnings and no other diagnostic. Every sorried declaration carries its binders explicitly (the only `variable` blocks are `SieveGram`'s `{𝕜 E ι}` with instances and `SieveAffine`'s `{d}`, all mentioned in the statements), so no standing hypothesis is lost.

One-tactic probe of sorried theorems: `affine_expansion_level` (tried `simp`, `positivity`, `nlinarith`, `gcongr`) and `rough_to_at_most_almost_prime` (tried `simp [Nat.IsAtMostAlmostPrime]`, `exact ⟨hn, by omega⟩`) do not close; the remaining 31 theorems are analytic statements (large sieves, Bombieri–Vinogradov, Maynard, Chen) with no plausible one-tactic proof and were not attempted. No sorried theorem is a one-tactic consequence of the pins. Of the examples, `IsAtMostAlmostPrime 0 1 ∧ ¬ IsAtMostAlmostPrime 100 0` closes by `simp [Nat.IsAtMostAlmostPrime]` and `jacobiSym 2 3 = -1 ∧ jacobiSym 9 3 = 0` by `decide` (recorded for the repair of pass a's F01, not re-raised).

Lean versus README, instantiated by hand (no counterexample found): `abs_siftedSum_sub_eulerProduct_le` and `mainSum_sub_errSum_le_siftedSum` against Mathlib's `multSum`/`rem`/`siftedSum`/`mainSum`/`errSum` at P = 1 and P = 6 (support {0,1,2,3,6} gives S = 1; X = 7, A₁ = 10 gives R₁ = 3); Selberg's weighted inequality and the diagonal/off-diagonal bound with zero rows, empty index and the conjugate-linear convention (⟪i,1⟫ = −i); `HasLogSieveDimension`/`HasProductSieveDimension` endpoints (inclusive at z, half-open [w,z)), `remainderMass` at D = 1, 2; `rho` at modulus 1 and `x₀²` mod p² (p³); `discriminantCharacter` at (5,2), (8,2), (8,3), (1,0), (1,1), (12,3), (12,5) and its period |D| for D ≡ 0,1 mod 4, |D| > 1; `diagonalMass` and the optimiser values G = 5/2, λ = (1, −4/5, −3/5, 0), main term 2/5 from Mathlib's `selbergTerms`; `selberg_upper_bound` as the strict-cutoff corollary of Mathlib's `selberg_bound`; `parityWeight` at 4, 12, 0; `prime_interval_upper`, `twin_goldbach_upper` (N = 4), `brun_reciprocals`; the additive large sieve at H = 0 and a single point, the sharp forms, the primitive-character sieve at modulus 1 (Gauss sum 1) and the principal character mod 4 (Gauss sum 0, imprimitive); `leastNonresidue` 3 ↦ 2, 7 ↦ 3, 2 ↦ 0; `primeDenominatorSymbol`; the quadratic large sieve and the prime bilinear bound (its shape is the (KL)^ε(K√L + √K L) + K form of Heath-Brown's Corollary 4 restricted to prime denominators, the K term covering p = 2); `incompleteLog` at (3,2), cutoff 0; Vaughan's four-term identity by the convolution algebra μ_{≤U} + μ_{>U}, Λ_{≤V} + Λ_{>V}, including n = 0; `primeCountAP` (5,1,0) = 3, (10,2,0) = 1; `discrepancy` 10 3 = 1 and x 1 = 0; `PrimesHaveLevel 0`, `¬ PrimesHaveLevel 2`; the arithmetic discrepancy values −1/2 and 0; both Bombieri–Vinogradov forms and Barban–Davenport–Halberstam; `IsAdmissible` on {0,2}, {0,1}, {0,2,4}, {0,2,6,8,12}; `primeTranslates` of ∅, {0,1}, {0,2,4}; `maynardI`/`maynardJ` on the triangle (1/2, 1/3, ratio 4/3), `maynardM 1 = 1`, `maynardM 0 = 0` (the empty product measure has mass 1), M_k ≤ k; `infinite_many_primes_of_level` at k = 0, 1; `positive_proportion_prime_tuples` (the source's Theorem 1.2 indeed has no admissibility hypothesis on A, and the README's thinning argument is correct); `eventually_log_sub_lt_maynardM` (strict `>` as in Maynard's Proposition 4.3(3)); `rough_to_at_most_almost_prime` against Mathlib's `IsAtMostAlmostPrime`; Chen's two theorems; `IsPrimitivePair` and `almostPrimeLocus` at the three Checks.

Checks recomputed (45): the Legendre, remainder, optimiser, Brun-coefficient (P = 6, y ∈ {4, 100}, β = 2; P = 2, y = 8), remainder-mass (0,1,2,3,4), product-dimension endpoint, single-prime dimension, `rho` (9, 9; 16, 0; 4, 0; 8, 4) and the lifting identity p²ρ̃(p^k) = p²ρ(p^k) − ρ_sing(p^{k+1}) at three instances, `thetaDensity` 5/3 and 10/3, the regular conic density p^{n−1}(p − χ_D(p)) at p = 3, 5 for x²+y²+4, the growth-class Checks, the dyadic kernel sum 112 ≤ 126, the floor-taper algebra r² − 2r + π²/12 ≤ 0 on (2/3, 1], the cosecant row bound π²/(12δ²), Λ₂ ≈ 1.834 and Λ₃ ≈ 2.771 (so 1/Λ₃ < 1/2 < 1/Λ₂), the Chen weights at 11, 286, 3, 27, the Goldbach factors C₆ = 2C₂, C₁₀ = (4/3)C₂, C₁₈ = C₆, 2.6408 − 3.9404/2 = 0.6706, the exponent δ/[54|S|²n(12n+1)] from ϑ = δ/(54n|S|²) and θ = 1/(6n), the wResidue value 5, and the Maynard λ bound by Σ_{u<R} μ²(u)τ_k(u)/φ(u) with constant 1. No false, vacuous or definition-restating Check was found beyond those pass a lists.

Locators verified against the cached legal copies (44 locators in 12 sources): HB-SIEVES (3.3) p.16, (3.5)–(3.6) pp.17–18 (the source states x ≥ 4φ(k); the README's x ≥ 4k is a special case), Corollary 3.3 p.21, the Fundamental Theorem pp.11–12, Λ_r in Theorem 6.2 p.45, (6.7) pp.47–48; MAYNARD-2015 (1.3) p.384, Theorems 1.1 p.384 and 1.2–1.4 p.385, the proof of Theorem 1.2 p.391, Proposition 4.2 p.389, Proposition 4.3 (strict inequality in (3)), footnote 2 p.390 with the 105-element list, Lemma 8.1's printed G_{b,j} starting at r = 1; HB-REAL-95 Theorem 1 p.237 (odd squarefree restriction on both variables) and Corollary 4 p.238 (odd m, arbitrary n, bound (MN)^ε(MN^{1/2} + M^{1/2}N), exactly as at README:1950); JUTILA-ORIGINAL Lemma 3 with X ≥ 3, N ≥ 2 on the spread pp.194–195; KED-ANT-18 Lemma 18.2 (hypothesis Δ⁹, conclusion x^{1/2}Δ³rτ(s)|f|₂; the README's factor 2 is a weakening), Theorem 18.4, Theorem 18.5 (printed (log Q)², README's (1+log Q)⁵ is a declared weakening); KED-ANT-16 Theorems 16.1, 16.2, 16.4, 16.7 and Definition 16.6; KED-chap-largesieve Lemmas 15.1, 15.4 and Theorem 15.5 (δ ∈ (0,1/2]); KED-ANT-12 Theorem 12.2 (β = 9κ+1, s ≥ β, δ = e^{β−s}K^{10}, and the printed sign slip the README's convention records) and (12.3.1); IWA-ROSSER Theorem 1 (1.4) with e^{√K}Q(s)(log y)^{−1/3}; BOMBIERI-1971 Proposition 1 p.402; KHAYUTIN-19 Lemma 9.2, Lemma 9.8 p.223, Lemma 9.9 p.224; KM-21 Theorems 1–2, (2.5) and (2.6) p.7, Lemma 3.1 p.10, Lemma 3.2 p.12, Lemma 4.1 p.20; GGPY-2009 Lemma 3 p.9 and Lemma 4 p.10. The sources.toml is absent (pass a's F19); the hashes were taken from the manifest the sources service produced for this audit.

Supplier citations checked: IntegralLattices Layers 0 and 3 resolve to the active `TauCetiRoadmap/IntegralLattices` (Layer 0 dictionary, Layer 3 localisation/Jordan/dyadic data), not to the differently titled `Completed/IntegralLattices`; GlobalNumberFields, ClassFieldTheory and Chebotarev exist on `main` (their section contents are pass a's F12–F14); ArithmeticDirichletSeries exists only as Completed (F04 above); ErdosProgressionPowers, GeometryOfNumbersAndQuadraticArithmetic and AdelicAlgebraicGroups are in the merge order (pass a's F08–F09 cover what they supply); AnalyticNumberTheory, FiniteFieldsAndCharacterSums, AdditiveCombinatorics and ExponentialSumsAndCircleMethod exist nowhere under those names (pass a's F07). The Tau Ceti name `TauCeti.Multiquadratic.fundamentalDiscriminantChar` is correct at the pin (namespace `TauCeti.Multiquadratic`). All 201 Mathlib names cited in `*Needs:*` lines resolve to declarations of the pinned Mathlib, including `Chebyshev.pi_ge'`, `Finset.prod_fiberwise_of_maps_to'` and `MulChar.star_apply'`.

Policy: one `import Mathlib`, no `set_option`, no `lemma`, no `def := sorry`, no LaTeX delimiters, no target-numbering tables, no pull-request or issue numbers, lower-case title with proper names capitalised in subsection titles; the package is absent from `merge-order/ORDER.txt` (an imported package; not a defect). The dependency check printed:

```text
depcheck: 9 roadmaps, 75 edges, 0 problem(s)
```

Not re-raised (pass a, round 1): F01 admitted examples, F02 missing μ² in the dimension-κ denominator, F03 Maynard k = 1 divisor comparison at zero, F04 the square-sum step at README:938, F05 the s > 9t Brun consumption, F06 the `affine_expansion_level` stand-in, F07 unresolved supplier names, F08 undeclared expansion/spin gaps, F09 Gram bounds owned by ErdosProgressionPowers, F10 kroneckerSym duplication, F11 the D = 1 exclusion, F12 conductor-prime counts, F13 reciprocity ownership, F14 ideal divisor moments, F15 missing Smith/Koymans–Pagano headlines, F16 missing Lean Checks, F17 the closing catalogue and undocumented examples, F18 stale pins (including the “current library” wording at README:11 and :685), F19 absent sources.toml, F20 Richert's local-density hypothesis, F21 the restricted binary range.

## Not verifiable

- CHEN-73-CN (Theorems 1–2, Lemmas 5–9, the 3.9404 and 2.6408 constants and the (27) endpoint): no cached legal text; not checked.
- RICHERT-1969 Theorem A and Halberstam–Richert Lemmas 5.3–5.4: cited only through Chen and GGPY; the README says so at line 3724; not checked.
- BGS-10, FIMR-ERRATUM-2015, DFI-1997: settled uncertified in the audit manifest; their locators and the affine/spin exponents were not collated.
- JUTILA-ORIGINAL Lemma 3's display: the cached copy is an OCR of two-page spreads; the power of log N and the exact discriminant range of the sum are not legible, so the (log N)⁵ factor and the non-fundamental range at README:1994 were not confirmed.
- IWA-ROSSER (1.5)–(1.10): the OCR does not render the κ-dependent constants β_κ, A_κ, B_κ of README:2983.
- SS-23, SMITH-17, KP-22, BSKK-23, BENNETT-SIKSEK-2020 and KED-ANT-11/14 locators: not sampled in this pass (pass a sampled them).
- The analytic content of the 31 deep sorried theorems (large sieves, Bombieri–Vinogradov, Maynard's Lemmas 5.1–6.3, Chen, the spin and affine estimates): a sorry build checks elaboration only; only boundary instances were examined.
- GlobalNumberFields Layers 3/3C and 11, ClassFieldTheory Layer 14 and Chebotarev Layer 13 section contents: not re-read here; pass a's F12–F14 stand.
