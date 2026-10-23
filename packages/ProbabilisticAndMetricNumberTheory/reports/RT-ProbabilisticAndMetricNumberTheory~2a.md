<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/172#issuecomment-6353984997 -->
Red team round 2 pass a (codex) of 613f32d

Verdict: needs_changes

1. **F01** (P3) Boundary checks and one-tactic API remain in the acceptance test

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:44`, “On positive inputs the zero guard disappears”; also lines 247, 428, 461, 491, 607, 674, 744, 852, 857, 866 and 1000.

   **Claim:** These declarations are acceptance theorems for the completed roadmap.

   **Witness:** Line 47 already proves the first by `simp [primeDivisibilitySum, hn.ne']`. The others assert Dirac/two-atom, constant-orbit, singleton, terminating-digit, power-radius, interval, cylinder, transfer-endpoint or finite-window Checks.

   **Exact repair:** Delete `primeDivisibilitySum_apply`, `concentration_boundary_values`, `zero_not_equidistributed_haar`, `starDiscrepancy_singletons`, `terminating_binary_not_normal`, `power_gauge_radius_convention`, `gaussMeasure_digit_one_interval`, `two_atom_not_mixing_exact`, `gaussCylinder_boundary_values`, `gaussDensityTransfer_one_zero`, `normalizedGaussTransfer_boundary_values` and `logCorrelation_liouville_windows` from `Suggested.lean`. Keep their mathematics as README API or Checks, expressed in prose where no kept signature declares the name. Do not replace their admissions with proofs in place.

   **Retest:** The removed statements retain the same README values: strict two-atom concentration 1/2; singleton discrepancies 1 and 1/2; binary digit-one frequencies 0; Gauss upper-half mass log(4/3)/log 2; density transfer at zero π²/6; normalized identity transfer π²/6−1; Liouville windows 1/(2 log 2) and −1/(12 log 4). The repair removes padding without changing those conventions. This also addresses the now-inapplicable instruction in r1a F13/F15 and r1b F01 to add/prove such signatures.

2. **F02** (P1) Prime phases have the wrong conjugation in the Elliott proof

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:6279`, “where c_p=f(p)g(p)”; line 6292 invokes the multiplicative lower bound.

   **Claim:** These coefficients transport the original correlation to the prime-dilated correlation used in Proposition 2.6.

   **Witness:** Take completely multiplicative f with f(2)=i, g=1, p=2, n=1, h=1. The original product is 1; c₂f(2)g(4)=−1. TaoLogChowla line 733 requires equality of these products.

   **Exact repair:** Replace “where c_p=f(p)g(p)” with “where c_p=conj(f(p)g(p)); thus c_p f(pn)g(p(n+h))=f(n)g(n+h) for positive n,n+h.” Use these coefficients throughout the lower-bound transport, decoupling and Fourier argument. This is a normalization correction, not a restriction to real-valued functions.

   **Retest:** For f(2)=i, the repaired coefficient is −i, and (−i)i=1. For Liouville paired with itself, the coefficient remains 1. The fourth-moment contract allows arbitrary coefficients of modulus at most 1 and therefore still applies.

3. **F03** (P2) Homogeneous Birkhoff assumes the dynamical input it promises to establish

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:942`, hypothesis “hMixing : IsStrongMixing”; compare `README.md:6011`.

   **Claim:** The signature tests Birkhoff convergence for the specified diagonal map on the Haar modular quotient.

   **Witness:** The elaborated type requires strong mixing in addition to diagonal matrices and invariant Haar probability. README line 6017 instead derives this mixing from Howe–Moore; generic Birkhoff already proves the conditional signature.

   **Exact repair:** Delete the `hMixing` argument of `homogeneous_birkhoff`. Retain the explicit diagonal identity, native quotient Borel structure, probability instance, invariance under every G-translation and integrability. Its conclusion remains the displayed almost-everywhere convergence to the Haar integral. Derive time-one mixing from the cited supplier in the proof plan, rather than assuming it in the acceptance test.

   **Retest:** At a₁=diag(e,e⁻¹), invariant Haar probability and f=1, the averages and integral are both 1; the repaired statement needs no extra dynamical hypothesis. The identity matrix is excluded because its (0,0)-entry is 1 rather than e. The signature's diagonal hypothesis is present in the elaborated type; this is not a dropped-binder defect.

4. **F04** (P2) Several general headline theorems have no acceptance signature

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:12`, “This file is not exhaustive”; `README.md:2968`, 4183, 4221, 4234, 4262 and 6304.

   **Claim:** Representative special cases suffice for the roadmap's general polynomial-orbit, Hausdorff, simultaneous-approximation and logarithmic-Elliott conclusions.

   **Witness:** The file states only the line power-gauge mass-transference specialization. Native finite-dimensional real spaces, `Measure.mkMetric`, `dimH`, finite products, rational approximation inequalities and the existing correlation definition make the missing statements expressible.

   **Exact repair:** Add headline signatures, each with `sorry`, for (i) the polynomial finite-coset Haar-mixture limit of §2.6; (ii) §3.10's Euclidean mass transference for every k≥1 and admissible gauge; (iii) Jarník–Besicovitch, including infinite critical measure; (iv) gauge Hausdorff Duffin–Schaeffer; (v) §3.11's coordinatewise-reduced theorem for every k≥2; and (vi) §5.2's limiting corrected Elliott theorem with its full character/height hypothesis. Use real-bodied simple predicates or finite matrix/subgroup data where needed. Replace the module introduction by “Probabilistic and metric number theory: target signatures. The roadmap is README.md; this file states its headline theorems against the pinned APIs.” Identify any genuinely unstatable headline and its missing carrier explicitly; do not substitute a special case for it.

   **Retest:** Include the cases k=2 and f(r)=r² (expanded radius r), v=3 (dimension 2/3), ψ=0 (zero simultaneous volume), a polynomial orbit (n√2,n/2) (two equally weighted circle cosets), and f=g=1 as a negative control for Elliott (principal character/t=0 distance zero). These cases are expressible on the pinned carriers and are not covered by the current special-case signatures at the stated generality.

5. **F05** (P3) Definition-only API and forty examples displace the acceptance test

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:32`, “The empty prime sum is zero (`primeDivisibilitySum_empty`)”; lines 981–997 and 1054–1109.

   **Claim:** Mentioning API identifiers in docstrings satisfies declaration coverage, and unrelated model definitions plus forty small examples belong in the signature file.

   **Witness:** `primeDivisibilitySum_empty` has no declaration; it is only a comment occurrence. Neither random-model definition occurs in any theorem statement. Forty `example` declarations largely evaluate boundaries or unfold definitions.

   **Exact repair:** Remove the docstring catalogues of undeclared API names; write those README API items in prose, retaining backticked own names only for actual declarations. Delete `rademacherModel`, `steinhausModel` and their examples from this acceptance file unless a substantive kept headline requires them. Delete the elementary example blocks; retain at most a handful of nontrivial tests of kept definitions. Do not turn the API catalogue into additional admitted theorems.

   **Retest:** The README can still record the random models' values at 0,1,4,6,12, the Rademacher squarefree restriction and the Steinhaus prime-power distinction. None of the retained headline signatures depends on these two definitions, so removing them changes no acceptance proposition.

6. **F06** (P3) Source metadata contains two wrong years and a nonexistent locator

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/sources.toml:7`, “Exercise 1 and finite residue models”; lines 112 and 304 give years 2007 and 2012.

   **Claim:** These identify the cited versions of TAO-RESIDUES, BSKK2023 and Kubilius2021.

   **Witness:** TAO-RESIDUES numbers its first exercise 5, while the residue discussion is §3. BSKK2023 line 5 dates v3 to 2 June 2023; Kubilius2021 line 5 dates v1 to 14 November 2021.

   **Exact repair:** In the existing records, set BSKK2023 `year = 2023` and Kubilius2021 `year = 2021`. Set TAO-RESIDUES `locator = "Section 3, Equidistribution of residues, first six paragraphs and the product-modulus comparison"`. Keep all three existing IDs and cache provenance.

   **Retest:** The corrected years agree with README bibliography lines 6516 and 6542 and the exact arXiv versions. The corrected locator names the section actually used by the finite-residue targets; it no longer asserts the existence of Exercise 1.

7. **F07** (P3) Three definitions lack three discriminating Checks

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:4079`, “No child crosses the boundary of its parent”; line 4083, “at least two sublevels”.

   **Claim:** The bullets give three discriminating Checks for `MassTransferenceCantor`; the same issue occurs for `GCDGraph.restrictPow` (line 3567) and `gaussCylinderFiltration` (line 5219).

   **Witness:** Cantor containment and ≥2 repeat P1/P5. The restriction list repeats its odd-vertex bullet and exact-valuation definition. The filtration list repeats its generators twice. Each lacks three distinct discriminating tests.

   **Exact repair:** Keep the cutoff negative control. Replace the other bullets with: “For root [0,1], children centred at 1/4 and 3/4 with radius 1/20 have disjoint triples [1/10,2/5] and [3/5,9/10]; a child centred at 19/20 with radius 1/10 is rejected.” And: “For f(r)=√r, consecutive sublevels with radii 1/16 then 1/64 give f-values 1/4 and 1/8 and meet P4 exactly; using 1/16 again fails it.” These test individual defining constraints, not existence of a whole Cantor construction with those data.

   **Retest:** The first two triple intervals lie in [0,1] and are disjoint; the rejected triple reaches 5/4. The gauge inequality is 1/8≤(1/4)/2, while its negative control requires the false 1/4≤1/8.

   For `restrictPow`, replace the list by three tests on the complete bipartite graph V={1,2,4}, W={1,2,8}, unit weights and empty metadata: (p,k,ℓ)=(2,0,0) retains {1}×{1}; (2,1,3) retains {2}×{8}, with gcd valuation 1 and quality 4(1−2^(−31/30))^(−10); (2,3,0) has no left vertices and quality 0. For the filtration, use: F₀ has exactly ∅,D,Dᶜ,ℝ; C_[1] has Lebesgue mass 1/2 and separates irrational points with first digits 1 and 2 at F₁ but not F₀; C_[1,1]=D∩(1/2,2/3) has mass 1/6, is not F₁-measurable, and becomes F₂-measurable. These computed values exclude the incorrect all-Borel F₀ and a filtration that stops at first digits.

8. **F08** (P1) The good-integer mean-square bound loses the upper-endpoint truncation

   **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:6175`, “S_X={n∈[X,2X]”; line 6176 permits h=X without an endpoint error.

   **Claim:** The displayed mean-square discrepancy is o(X) for suitable growing prime intervals, uniformly up to h=X, even though the short sum is cut off at 2X.

   **Witness:** Set f=1, h=X and choose admissible intervals with |S_X|/X→1. For x≥7X/4 the short mean is ≤1/4+1/X while the long mean tends to 1. The integral is ≥X/36 eventually; the claimed bound can be o(X).

   **Exact repair:** Keep the finite set S_X and add `+ h/X` inside the right-hand bracket (equivalently, add `C_η h` to the unnormalized bound). Explicitly separate x≤2X−h from the terminal interval and bound the latter by its length times a uniform bound for the squared discrepancy. For applications requiring a vanishing error, choose h=o(X) or partition longer intervals and use the unrestricted mean theorem. Alternatively formulate and prove the global good-integer version, with the prime-factor condition imposed on all positive integers, before using it; merely citing the source's finite S_X is insufficient.

   **Retest:** With h=X the corrected upper bound contains C_ηX and accommodates the lower bound X/36. For h=o(X) the added normalized error tends to zero. A concrete asymptotic choice is η=1/12, P₁=(log X)^1000 and Q₁=exp(√log X), with the next interval beyond the cutoff: the source's sieve estimate gives density 1−o(1), and both original error terms tend to zero.

   MatomakiRadziwill lines 226–249 contain the same finite-support ambiguity; lines 1601–1607 use a shorter auxiliary length but assert a uniform comparison even at the upper endpoint. This is a source boundary error requiring an explicit correction, not a reason to preserve the false package statement. Update the text identifying the consumed mean-square contract so the endpoint convention is consistent.

## Verification of the first-round findings

Here `R` means `packages/ProbabilisticAndMetricNumberTheory/README.md`, `L` means its `Suggested.lean`, and `M` means its `sources.toml`. “Repaired” records the earlier defect's disposition, not certification of every proof in its section.

| Earlier ID | Status | Repaired passage and locator | Witness at this head |
|---|---|---|---|
| r1a F01 | Repaired | R17: “Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`” | Both match `lake-manifest.json`; the empirical module exists at that pin. |
| r1a F02 | Repaired by declared contract; settled upstream | R61: “What SieveMethodsAndPrimePatterns must provide (gap:kubilius-uniform-sieve)” | Same slug, named supplier and full sum-of-errors bound in plan.json. For an empty cutoff the vector law is δ on one point and TV=0. No re-raising of upstream absence. |
| r1a F03 | Repaired | R2136: “consume the supplied uniform expansion” | AnalyticNumberTheoryPartI §3.12a explicitly includes compact-parameter expansion and analytic remainder; §3.41 marks primes by z. Differentiating gives center L/2 and variance L/2+O(1). |
| r1a F04 | Repaired | R4645 requires “T and f are measurable”; R4648 supplies the non-Borel-indicator control | For T=id and f=1_E, orbitLimit=1_E; non-Borel E is excluded. |
| r1a F05 | Repaired | R2107: “No uniform subgaussian bound on μₙ is assumed” | The direct characteristic-function remainder tends to zero: at t=1 the order-2k bound is 1/(2^k k!). L276 states moment convergence with all absolute moments finite. |
| r1a F06 | Partly repaired | R6275: “Prove `entropy_decrement_scale`”; L1019 states finite Elliott | Finite entropy, decrement, decoupling and Fourier targets now exist. The new prime-phase normalization is wrong: S02. |
| r1a F07 | Repaired | R67: “this roadmap owns its characterization by bounded native partial denominators” | Main DiophantineApproximationAndTranscendence §0.6 defines bad approximation, without that equivalence; local R5967 supplies it. |
| r1a F08 | Repaired by ownership resolution | R6470 assigns pointwise Birkhoff here and names ArithmeticDynamics as consumer | Merge order places this roadmap before ArithmeticDynamics. The latter's §2.6 still contains overlapping pointwise work; it must consume this earlier owner, not supply it. No upward citation added. |
| r1a F09 | Repaired by named sections and declared contracts; settled upstream | R49: “§§3.18 and 3.33, pretentiousDist and halasz_mean”; R51–57 state four gaps | The named sections exist in the new supplier roadmap's open head. All four gaps match plan.json. S08 is a new false boundary formula, not a re-raising of unavailable upstream work. |
| r1a F10 | Repaired by declared general contract; settled upstream | R57: “for k≥1, multiplicative 0≤f≤τ_k” | The contract retains the general class; local R3911 is only a refinement. For f(p^ν)=1, x=1 both sides are 1 before the absolute constant. |
| r1a F11 | Repaired | L404: `polynomial_equidistribution_iff`; L411: `polynomial_total_equidistribution_iff` | For n²/2+n√2, the quadratic coefficient is torsion but the linear coefficient survives every nonzero character. Both signatures include this case. |
| r1a F12 | Partly repaired | M1: `schema = "tauceti-roadmap-sources/v1"` | Thirty unique work records and seven settled waivers exist; metadata errors remain in S06. |
| r1a F13 | Partly repaired | L247: `concentration_boundary_values`, and the new boundary examples | Values are correct (strict radius 1/2 gives concentration 1/2), but current acceptance-test rules require deleting the padding: S01/S05. |
| r1a F14 | Repaired | L670: `theorem gaussMeasure_probability` | The measure has a real density body; probability is now a proposition, not sorry-defined data. Integral of the density over (0,1] is 1. |
| r1a F15 | Partly repaired | R4196: “Dimension k=0 is excluded”; L607 power-radius convention | r=1/4,s=1/2 gives expanded radius 1/2; s=1 returns 1/4. The signature is a Check and must be removed under S01. |
| r1a F16 | Repaired, primary text waived | R4268: “Prove `coordinatewise_reduced_overlap`”; R4272 zero–one target | Both arithmetic prerequisites are explicit. At q=2,k=2, only the centre (1/2,1/2) is coordinatewise reduced. Primary proof text remains unverified under the settled waiver. |
| r1a F17 | Repaired | L1039: `real_multiplicative_two_point_nontrivial` | Full real completely multiplicative class, negativity hypothesis and every fixed h>0 are present; f=1 fails negativity. |
| r1a F18 | Partly repaired | R3928 gives the decay exponent; R3075 adds the BV integral bridge | Process notes and footer are removed, but undeclared-name catalogues were relocated into declaration docstrings; S05. |
| r1a F19 | Repaired | R3539: “use the native infinite product over the subtype 𝒫” | V=W={1}, E={(1,1)}, all-prime metadata and f=g=0 are admitted; the quality product is ζ(31/30)^10. Zero edges are guarded separately. |
| r1b F01 | Partly repaired under current contract | L47: `simp [primeDivisibilitySum, hn.ne']` | Elaboration defect repaired; the one-tactic theorem must now be deleted as padding (S01). |
| r1b F02 | Repaired in prose; acceptance defect remains | R71: “§4.2.1 howe_moore” and “§4.2.2 moore_ergodicity” | Both supplier sections and their hypotheses exist. The acceptance signature still adds mixing: S03. |
| r1b F03 | Repaired | R11 links `Completed/ArithmeticDirichletSeries/README.md` and its “Export contract” | Completed contract lines 86–102 supplies summation and series conventions. |
| r1b F04 | Repaired | R11: “Möbius orthogonality to nilsequences is outside this roadmap” | No AdditiveCombinatorics supplier remains; finite van der Corput and entropy decrement are local. |
| r1b F05 | Repaired | R5520 states the Gauss logarithmic integral directly | The earlier process-only remarks are absent. Integral value remains π²/(12 log 2). |
| r1b F06 | Repaired | R3451: “Overlap estimate … (corrected)” with cutoff 2M≥gcd | q=2,r=3, ψ=3/10 gives M=9/10, overlap 1/6 and 2M≥1. The original cutoff M>1 would wrongly force zero. KM-2020 line 613 retains the source misprint. |

The three findings explicitly settled as “not actionable in this package” are accepted conditional on their declared supplier contracts. None is re-raised solely because the supplier does not yet prove the contract.

## Statement and instance record

The tables give computed tests, not proofs by testing. “No defect” means the displayed instance did not refute the statement. Eventually quantified theorems are not asserted at N=0 or N=1. Arithmetic probability always has N=m+1≥1. Ring-theoretic degeneracies, nonabelian group substitutions and inseparable extensions are not inputs of these signatures; the applicable degeneracies are empty finite indices, zero weights/radii, zero-dimensional tori, trivial probability systems, rational endpoints, small primes and totalized division.

Every named signature was compared with the supplied elaborated type. There are 105 named declarations (31 definitions and 74 theorems), two local instances and forty proved examples. No Lean process was run. Definitions in the table have real bodies. The only inherited finite-type context is used by the torus declarations; it does not survive into unrelated namespaces. The homogeneous signatures explicitly retain ha, and the last two retain hu.

### Suggested.lean: every declaration

`L` denotes `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean`. Each row includes its namespace, layer, explicit parameter context and any inherited instances. Full quantifiers in the proposition remain at the cited line.

| Declaration and section | Variable and instance context | Instances | Computed values on the two sides | Result/change |
|---|---|---|---|---|
| L39, Arithmetic.primeDivisibilitySum; layer 0 | (P : Finset ℕ) (a : ℕ → ℝ) | P={2,3},a(p)=p; n=0,1,12 | 0,0,5; unguarded n=0 would be5 | No defect |
| L44, Arithmetic.primeDivisibilitySum_apply; layer 0 | (P : Finset ℕ) (a : ℕ → ℝ)     {n : ℕ} (hn : 0 < n) | n=12, same P,a | 5=2+3 | S01 |
| L50, Arithmetic.primeDivisibilitySum_secondMoment_error; layer 0 | (m : ℕ) (P : Finset ℕ)     (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p) | N=6,P={2,3},a=1 | moment17/36=V17/36, error0≤8/6 | No defect |
| L60, Arithmetic.primeDivisibilitySum_secondMoment_completePeriod; layer 0 | (m : ℕ) (P : Finset ℕ)     (a : ℕ → ℝ) (hP : ∀ p ∈ P, Nat.Prime p)     (hperiod : (∏ p ∈ P, p) ∣ m + 1) | N=6,P={2,3},a=1 | 17/36=1/4+2/9; product6 divides6 | No defect |
| L68, Arithmetic.divisibility_pattern_summed_error; layer 0 | (m : ℕ) (P : Finset ℕ)     (hP : ∀ p ∈ P, Nat.Prime p) | N=5,P={2,3} | atoms(2/5,2/5,1/5,0); model(1/3,1/3,1/6,1/6); L1=1/3≤9/5 | No defect |
| L77, Arithmetic.crt_complete_period_law; layer 0 | {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)     (q : ι → ℕ) [∀ i, NeZero (q i)]     (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))     (hperiod : (∏ i, q i) ∣ m + 1) (a : ∀ i, ZMod (q i)) | q=(4,9),N=36; empty index | atom1/36=(1/4)(1/9); empty event1=empty product1 | No defect |
| L85, Arithmetic.crt_statistic_error; layer 0 | {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ℕ)     (q : ι → ℕ) [∀ i, NeZero (q i)]     (hcop : Pairwise (fun i j => Nat.Coprime (q i) (q j)))     (F : (∀ i, ZMod (q i)) → ℝ) (L U : ℝ) (hLU : L ≤ U)     (hF : ∀ a, L ≤ F a ∧ F a ≤ U) | q=(3),N=5,F=1_{1,2} | error2/15=1·2·1/(5·3); q=1 gives0=0 | No defect |
| L97, Arithmetic.arithmetic_levy_criterion; layer 0 | (f : ℕ → ℕ → ℝ)     (ν : Measure ℝ) [IsProbabilityMeasure ν] | f=0,ν=δ0 | all empirical lawsδ0; charFun1=average1 | No defect |
| L109, Arithmetic.excess_exponential_mean; layer 0 | (m : ℕ) | N=4 | mean(1+1+1+3/2)/4=9/8≤exp2 | No defect |
| L114, Arithmetic.excess_all_moments; layer 0 | (m k : ℕ) | N=4,k=0,2 | moments1,1/4≤exp2,2exp2/log(3/2)^2 | No defect |
| L119, Arithmetic.excess_exponential_tail; layer 0 | (m : ℕ) (t : ℝ) | N=4,t=1,-1 | tails1/4,1≤exp(2−log(3/2)),exp(2+log(3/2)) | No defect |
| L124, Arithmetic.excess_distribution_transfer; layer 0 | (b s : ℕ → ℝ) (hs : Tendsto s atTop atTop)     (ν : Measure ℝ) [IsProbabilityMeasure ν] | s_m=m+1,b=0 | both normalized counts tend to0; excess L1≤1/(m+1)→0 | No defect |
| L134, Arithmetic.example; layer 0 | No declaration-local parameters; quantifiers are in the proposition. | n=12,1 | 2=1+1;5=2+3;0=empty sum | S05 |
| L145, Arithmetic.example; layer 0 | No declaration-local parameters; quantifiers are in the proposition. | n=0 | 0=guarded value; unguarded5 excluded | S05 |
| L157, MetricNumberTheory.IsAdditive; layer 0 | {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) | Ω on4·3; convolution unit | 3=2+1; unit f(1)=1≠0 | No defect |
| L162, MetricNumberTheory.IsStronglyAdditive; layer 0 | {R : Type*} [AddCommMonoid R] (f : ArithmeticFunction R) | ω,Ω at2² | ω4=ω2=1;Ω4=2≠Ω2=1 | No defect |
| L170, MetricNumberTheory.concentration; layer 0 | (ν : ProbabilityMeasure ℝ) (δ : ℝ) | ν=δ0,δ=0,1; fair atoms0,1 atδ=1/2 | 0,1,1/2; closed-radius convention would give1 | No defect |
| L174, MetricNumberTheory.kolmogorov_rogozin; layer 0 | No declaration-local parameters; quantifiers are in the proposition. | one fair Bernoulli,δ=1/2; empty family | D=1/2,Q=1/2≤C√2; empty D=0 excluded | No defect |
| L182, MetricNumberTheory.cdf_weak_criterion; layer 0 | (νs : ℕ → ProbabilityMeasure ℝ) (ν : ProbabilityMeasure ℝ) | ν_n=ν=δ0 | CDF(-1)=0,CDF(1)=1; continuity at0 fails as required | No defect |
| L189, MetricNumberTheory.kubilius_small_prime_model; layer 0 | (β : ℕ → ℝ)     (hβ : ∀ N, 0 < β N) (hβinf : Tendsto β atTop atTop)     (ν : (N : ℕ) → ProbabilityMeasure       ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ))     (hν : ∀ (N : ℕ) (v : ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)), (ν N : Measure ({p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊} → ℕ)).real {v} =       ∏ p : {p // p ∈ Nat.primesLE ⌊Real.rpow (N:ℝ) ((β N)⁻¹)⌋₊},         (1-1/(p:ℝ)) / (p:ℝ)^(v p)) | cutoff<2; fixed cutoff2,N even | TV0 for empty vector; v2 law mass0≈1/2,mass1≈1/4 matches geometric | No defect |
| L202, MetricNumberTheory.example; layer 0 | No declaration-local parameters; quantifiers are in the proposition. | ω12,Ω12 | 2=ω4+ω3;3=Ω4+Ω3 | S05 |
| L216, MetricNumberTheory.example; layer 0 | No declaration-local parameters; quantifiers are in the proposition. | unit at1;Ω at4 | 1≠0;2≠1 | S05 |
| L227, MetricNumberTheory.example; layer 0 | (ν : ProbabilityMeasure ℝ) | δ≤0 | all open intervals empty,Q=0 | S05 |
| L231, MetricNumberTheory.example; layer 0 | (x δ : ℝ) (hδ : 0 < δ) | Dirac at x,δ>0 | interval centered x hasmass1,Q=1 | S05 |
| L247, MetricNumberTheory.concentration_boundary_values; layer 0 | No declaration-local parameters; quantifiers are in the proposition. | δ0 and fair atoms0,1 | Qδ0(1)=1;Qfair(1/2)=1/2 | S01 |
| L257, MetricNumberTheory.turan_kubilius; layer 1 | (f : ArithmeticFunction ℝ) (hf : IsAdditive f) (N : ℕ) (hN : 2 ≤ N) | f=ω,N=2 | A=1/2,B=1/2;sum squares1/2≤30 | No defect |
| L265, MetricNumberTheory.hardy_ramanujan; layer 1 | (ε : ℝ) (hε : 0 < ε) | N=1,2; ε>0 | N1: L=0 and count0;N2:L<0 so exceptional fraction1; finite terms do not affect limit0 | No defect |
| L276, MetricNumberTheory.gaussian_weak_convergence_of_moments; layer 1 | (μ : ℕ → ProbabilityMeasure ℝ)     (hfinite : ∀ n k : ℕ, Integrable (fun x : ℝ => \|x\|^k) (μ n : Measure ℝ))     (hmom : ∀ k : ℕ, Tendsto (fun n => ∫ x : ℝ, x^k ∂(μ n : Measure ℝ))       atTop (𝓝 (∫ x : ℝ, x^k ∂ProbabilityTheory.gaussianReal 0 1))) | μ_n=standard Gaussian | moments(1,0,1,0,3) equal target; weak law constant | No defect |
| L284, MetricNumberTheory.restricted_squarefree_second_moment; layer 1 | No declaration-local parameters; quantifiers are in the proposition. | N=6,D={1,2,5} | ω=(0,1,1),centerL/2; sum=3L²/4−2L+2; wrong full-familycenter differs | No defect |
| L292, MetricNumberTheory.erdos_kac; layer 1 | (x : ℝ) | N=1,x=0; Gaussian threshold0 | finite normalizedω=Ω=0,frequency1; limiting CDF(0)=1/2, no claim atfiniteN | No defect |
| L305, MetricNumberTheory.restricted_squarefree_window; layer 1 | No declaration-local parameters; quantifiers are in the proposition. | N=6,D={1,2,5} | center≈0.292; deviations≈0.292,0.708,0.708; thresholdL^(2/3)≈0.699 excludes2 of3; eventual bound only | No defect |
| L327, Equidistribution.AsympEquidistributed; layer 2 | {X : Type*} [TopologicalSpace X] [MeasurableSpace X]     [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) | x_n=0,μ=δ0; μ=Haar | bounded test at0 equalsf0; circle frequency1 integral1 vs Haar0 | No defect |
| L334, Equidistribution.TotallyAsympEquidistributed; layer 2 | {X : Type*} [TopologicalSpace X] [MeasurableSpace X]     [OpensMeasurableSpace X] (x : ℕ → X) (μ : ProbabilityMeasure X) | x_n=n/2 | q2 progressionconstant0; charactermean1≠Haar0; total predicatefalse | No defect |
| L339, Equidistribution.circleHaar; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | whole circle; interval[0,1/2) | masses1,1/2 | No defect |
| L343, Equidistribution.torusHaar; layer 2 | (d : Type*) [Fintype d] | d=Fin0,Fin1 | mass unique point1; one-coordinate interval mass1/2 | No defect |
| L347, Equidistribution.example; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | x=0 and every q>0,r | all averagesf0=Dirac integral f0 | S05 |
| L362, Equidistribution.example; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | period1 | volume normalization1·Haar=Haar | S05 |
| L366, Equidistribution.example; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | d=0 | {0}=univ,mass1 | S05 |
| L379, Equidistribution.TorusIrrational; layer 2 | Inherited {d : Type*} [Fintype d]. (α : UnitAddTorus d) | d=0; α=(√2,√2),k=(1,-1) | no nonzero k givestrue; diagonal pairing0 excludesirrationality | No defect |
| L383, Equidistribution.weyl_criterion; layer 2 | Inherited {d : Type*} [Fintype d]. (x : ℕ → UnitAddTorus d) | constant0; d0 | k1 mean1≠0 sofalse/false;d0 bothtrue | No defect |
| L390, Equidistribution.linear_equidistribution_tfae; layer 2 | Inherited {d : Type*} [Fintype d]. (α β : UnitAddTorus d) | α=√2;α=1/2 | all nonzero characters irrational so3true; k2 character1 so3false | No defect |
| L397, Equidistribution.weyl_polynomial; layer 2 | Inherited {d : Type*} [Fintype d]. (s : ℕ) (hs : 1 ≤ s) (α : ℕ → UnitAddTorus d)     (hα : TorusIrrational (α s)) | s=1,α1=√2;d0 | frequency k has geometric average→0; pointtorus allaverages1 and correctlawδ | No defect |
| L404, Equidistribution.polynomial_equidistribution_iff; layer 2 | Inherited {d : Type*} [Fintype d]. (s : ℕ) (hs : 1 ≤ s)     (α : ℕ → UnitAddTorus d) | P=n²/2+n√2;P=n/2 | first: everyk detectslinearirrational; second:k2 pairs0 withallnonconstantcoefficients sofalse/false | No defect |
| L411, Equidistribution.polynomial_total_equidistribution_iff; layer 2 | Inherited {d : Type*} [Fintype d]. (s : ℕ) (hs : 1 ≤ s)     (α : ℕ → UnitAddTorus d) | P=n²/2+n√2,q=2 | linearirrationalcoefficient2√2 survives; bothcriteria true | No defect |
| L418, Equidistribution.uniformDistribution_mod_one_tfae; layer 2 | (u : ℕ → ℝ) | u_n=0,interval[0,1/2) | frequency1≠length1/2;character1 mean1≠0; all3false | No defect |
| L428, Equidistribution.zero_not_equidistributed_haar; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | constant0,k1 | mean1≠Haarintegral0 | S01 |
| L433, Equidistribution.example; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | d0 | unique k=0,nonzero conditionfalse | S05 |
| L438, Equidistribution.example; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | d1,α0,k1 | pairing0 contradicts≠0 | S05 |
| L452, MetricNumberTheory.starDiscrepancy; layer 2 | {N : ℕ} (x : Fin N → ℝ) | N=0;singleton0,1/2 | D=0,1,1/2 | No defect |
| L458, MetricNumberTheory.example; layer 2 | (x : Fin 0 → ℝ) | N0 | guard0=0 | S05 |
| L461, MetricNumberTheory.starDiscrepancy_singletons; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | N1,points0,1/2 | D=1,1/2 respectively | S01 |
| L466, MetricNumberTheory.erdos_turan; layer 2 | {N H : ℕ} (hN : 0 < N) (hH : 0 < H) (x : Fin N → ℝ)     (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) | N=H=1,x=0 | D1≤3/2+3=9/2 | No defect |
| L473, MetricNumberTheory.koksma; layer 2 | {N : ℕ} (hN : 0 < N) (x : Fin N → ℝ)     (hx : ∀ j, x j ∈ Set.Ico (0:ℝ) 1) (f : ℝ → ℝ) (hf : BoundedVariationOn f (Set.Icc 0 1)) | N1,x=0,f(t)=t | abs(0−1/2)=1/2≤variation1·D1; fconstant gives0≤0 | No defect |
| L481, MetricNumberTheory.IsNormalBase; layer 2 | (b : ℕ) [NeZero b] (x : ℝ) | b1; b2,x=1/2; emptyword | b1 fails2≤1;binary onesfrequency0≠1/2;empty blockfrequency1=2^0 | No defect |
| L488, MetricNumberTheory.example; layer 2 | (x : ℝ) | b1 | 2≤1 false | S05 |
| L491, MetricNumberTheory.terminating_binary_not_normal; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | binary0,1/2 | frequencyones0≠1/2 | S01 |
| L495, MetricNumberTheory.borel_normal; layer 2 | {b : ℕ} [NeZero b] (hb : 2 ≤ b) | b2,digit1 | cylinderlength1/2=targetfrequency1/2; exceptionalrationalshavevolume0 | No defect |
| L499, MetricNumberTheory.borel_normal_all_bases; layer 2 | No declaration-local parameters; quantifiers are in the proposition. | bases2,3 | wordlength1 probabilities1/2,1/3; countable union exceptionalnullsets hasmass0 | No defect |
| L508, DuffinSchaeffer.dsSet; layer 3 | (ψ : ℕ → ℝ) (q : ℕ) | q0,1;ψ=1/2 | q0 empty; q1 reducedinterval[1/2,1] | No defect |
| L513, DuffinSchaeffer.dsLimsup; layer 3 | (ψ : ℕ → ℝ) | ψ0;ψq=q | zero-radiusreducedlimsupempty;full-radiuslimsup[0,1] | No defect |
| L517, DuffinSchaeffer.khinchinSet; layer 3 | (ψ : ℕ → ℝ) (q : ℕ) | q0,1,ψ0 | q0 totalized{0};q1{0,1} | No defect |
| L522, DuffinSchaeffer.khinchinLimsup; layer 3 | (ψ : ℕ → ℝ) | ψ0 | limsup rationalsin[0,1],volume0; includes0 and1 | No defect |
| L526, DuffinSchaeffer.volume_dsLimsup_eq_zero; layer 3 | (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)     (hsum : Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) | ψ0 | series0,volume0 | No defect |
| L531, DuffinSchaeffer.volume_dsLimsup_eq_one; layer 3 | (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)     (hdiv : ¬ Summable fun q : ℕ => (q.totient : ℝ) * ψ q / q) | ψ(q)=q | weighted summandφ(q),sumdiverges;limsup[0,1],volume1 | No defect |
| L536, DuffinSchaeffer.catlin; layer 3 | (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q) | ψ0;ψ(q)=q | zero envelope0 givesvolume0;infinite envelope sum∞ givesvolume1 | No defect |
| L544, DuffinSchaeffer.khinchin; layer 3 | (ψ : ℕ → ℝ) (hψ : ∀ q, 0 ≤ ψ q)     (hmono : ∀ q r : ℕ, 1 ≤ q → q ≤ r → (r : ℝ) * ψ r ≤ q * ψ q) | ψ0;ψ(q)=1/q forpositiveq | qψ=0 or1; series0 or∞; conclusionvolume0 or1 | No defect |
| L551, DuffinSchaeffer.example; layer 3 | No declaration-local parameters; quantifiers are in the proposition. | q1,ψ1/2 | [1/2,3/2]∩[0,1]=[1/2,1] | S05 |
| L562, DuffinSchaeffer.example; layer 3 | (ψ : ℕ → ℝ) | x2 | 2∉[0,1],everyeventfalse | S05 |
| L566, DuffinSchaeffer.example; layer 3 | No declaration-local parameters; quantifiers are in the proposition. | q1,ψ0,a0 | abs(0−0)=0≤0 | S05 |
| L571, DuffinSchaeffer.example; layer 3 | No declaration-local parameters; quantifiers are in the proposition. | ψ0,x0 | membership at everyq viaa0; limsuptrue | S05 |
| L587, MetricNumberTheory.IsDimensionGauge; layer 3 | (f : ℝ≥0 → ℝ≥0) | f=r,r²,0,1 | at0 firsttwo0 andpositiveat1; f0 failspositiveat1; f1 origin1≠0 | No defect |
| L592, MetricNumberTheory.example; layer 3 | No declaration-local parameters; quantifiers are in the proposition. | f=r,r² | f0=0,f1=1,monotonecontinuous | S05 |
| L599, MetricNumberTheory.example; layer 3 | No declaration-local parameters; quantifiers are in the proposition. | f0,f1 | 0<0 false;1=0 false | S05 |
| L607, MetricNumberTheory.power_gauge_radius_convention; layer 3 | {r s : ℝ} (hr : 0 < r) (hr1 : r < 1)     (hs : 0 < s) (hs1 : s < 1) | r1/4,s1/2 | r^s=1/2>1/4;r^1=1/4 | S01 |
| L613, MetricNumberTheory.mass_transference_power; layer 3 | (s : ℝ) (hs : 0 < s) (hs1 : s < 1)     (c r : ℕ → ℝ) (hr : ∀ i, 0 < r i) (hr0 : Tendsto r atTop (𝓝 0))     (hfull : ∀ x : ℝ, ∀ R : ℝ, 0 < R →       volume (Metric.ball x R \ (limsup (fun i => Metric.closedBall (c i) (Real.rpow (r i) s)) atTop)) = 0) | allcenters0,r_i=2^(-i-1) | expandedlimsup{0},ballaround2 haspositivecomplementvolume,fullhypothesisfails | No defect |
| L621, MetricNumberTheory.duffin_schaeffer_dimension; layer 3 | (ψ : ℕ → ℝ)     (hψ : ∀ q, 0 ≤ ψ q ∧ ψ q ≤ 1/2) | ψ(q)=1/(2q²) forq>0;ψ0 | critical exponent2/3;zeroψ infpositiveexponents0,dimension0 | No defect |
| L635, MetricNumberTheory.birkhoff_pointwise; layer 4 | {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)     (T : Ω → Ω) (hT : MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω))     (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) | identityonfairtwoatoms,f=(0,2) | averagesf, invariantcondExpf; atn0average0 irrelevant | No defect |
| L642, MetricNumberTheory.birkhoff_pointwise_ergodic; layer 4 | {Ω : Type*} [MeasurableSpace Ω] (μ : ProbabilityMeasure Ω)     (T : Ω → Ω) (hT : Ergodic T (μ : Measure Ω)) (f : Ω → ℝ) (hf : Integrable f (μ : Measure Ω)) | oneatom,f=c | averagesc forN≥1=integralc; fairtwoatomidentityfailsErgodic | No defect |
| L650, MetricNumberTheory.gaussMap; layer 4 | (x : ℝ) | x0,1/2,2/3 | T=0,0,1/2 | No defect |
| L656, MetricNumberTheory.gaussMeasure; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | (0,1],(1/2,1],outside | mass1,log(4/3)/log2,0 | No defect |
| L660, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | negativehalfline | intersectionwith(0,1]empty,mass0 | S05 |
| L670, MetricNumberTheory.gaussMeasure_probability; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | integraldensity | (log2−log1)/log2=1 | No defect |
| L674, MetricNumberTheory.gaussMeasure_digit_one_interval; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | upperhalf | log(4/3)/log2≈0.415037 | S01 |
| L678, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | x1/2,0,2/3 | T0,0,1/2 | S05 |
| L685, MetricNumberTheory.gaussDigit; layer 4 | (x : ℝ) (n : ℕ) | x2/3; irrational√2−1 | firstdigits1,2,0; irrationalalldigits2 | No defect |
| L688, MetricNumberTheory.IsStrongMixing; layer 4 | {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) | oneatomidentity;fairtwoatomidentity | correlation1=1²;fairevent1/2≠1/4 | No defect |
| L698, MetricNumberTheory.IsExact; layer 4 | {Ω : Type*} [m : MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) | oneatomidentity;fairtwoatomidentity | tailmasses0/1;fairAandcomplementboth1/2 sofalse | No defect |
| L706, MetricNumberTheory.khinchinConstant; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | k0,1summands | 0 andlog(9/8); exp(sum)>1 | No defect |
| L711, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | oneatomidentity | indicatorsAB=indicatorA·indicatorB∈{0,1} | S05 |
| L718, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | oneatomidentity | oneofA,Aᶜmass0 | S05 |
| L726, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | constantK | exp(real)>0 | S05 |
| L729, MetricNumberTheory.khinchin_series_summable; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | a1,2;largea | terms0,log(9/8),and≤log(a)/(a²log2),summabletail | No defect |
| L734, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | a2 | log2·log(9/8)/log2=log(9/8)>0 | S05 |
| L744, MetricNumberTheory.two_atom_not_mixing_exact; layer 4 | (ν : ProbabilityMeasure ℝ)     (hν : (ν : Measure ℝ) = (1/2 : ℝ≥0∞) • Measure.dirac 0 +       (1/2 : ℝ≥0∞) • Measure.dirac 1) | fairidandswap,A={0} | idcorrelation1/2;swapalternates1/2,0; neither→1/4;tailmasses1/2 | S01 |
| L751, MetricNumberTheory.gauss_invariant; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | B=(0,1] | preimagehasGaussmass1=Bmass1;branches telescopeforgeneralB | No defect |
| L754, MetricNumberTheory.gauss_exact; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | tailA=empty,univ | masses0,1;exactnessnontrivialforotherA | No defect |
| L757, MetricNumberTheory.gauss_mixing; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | A=empty,B=univ | correlation0=0·1;A=B=univ gives1=1·1 | No defect |
| L760, MetricNumberTheory.gauss_ergodic; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | invariantempty,univ | masses0,1;nontrivialinvarianteventsruledoutbyexactness | No defect |
| L763, MetricNumberTheory.gauss_digit_frequency; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | a1,2 | frequencieslog(4/3)/log2,log(9/8)/log2;sum overallpositivea=1 | No defect |
| L769, MetricNumberTheory.gauss_word_frequency; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | word[1,2],[2,1] | masseslog(21/20)/log2 andlog(21/20)/log2; cylindersdiffer | No defect |
| L776, MetricNumberTheory.khinchin_geometric_mean; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | x=√2−1 negativecontrol | geometricmean2≠K≈2.68545; singletonexceptionmass0 | No defect |
| L781, MetricNumberTheory.levy_denominator; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | x=√2−1 negativecontrol | logdenominatorgrowthlog(1+√2)≈0.88137≠π²/(12log2)≈1.18657;exceptionnull | No defect |
| L786, MetricNumberTheory.gauss_kuzmin; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | n0,a1 | abs(1/2−log(4/3)/log2)≈0.08496≤C; uniformrateforlatern | No defect |
| L792, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | x2/3,indices0,1,2 | digits1,2,0 | S05 |
| L805, MetricNumberTheory.gaussCylinder; layer 4 | (w : List ℕ) | words[],[0],[1,2],[2,1] | D,empty,D∩(2/3,3/4),D∩(1/3,2/5) | No defect |
| L812, MetricNumberTheory.inverseWord; layer 4 | (w : List ℕ) | words[],[1,2],[2,1]at0 | 0,2/3,1/3; wrongcompositionorderdetected | No defect |
| L819, MetricNumberTheory.wordMatrix; layer 4 | (w : List ℕ) | words[],[1,2],[2,1] | I,[[1,2],[1,3]],[[1,1],[2,3]];det1 forlength2 | No defect |
| L828, MetricNumberTheory.gaussDensityTransfer; layer 4 | (f : ℝ → ℝ) (x : ℝ) | f1,x0,1 | L1=π²/6,π²/6−1;L0=0 | No defect |
| L838, MetricNumberTheory.normalizedGaussTransfer; layer 4 | (g : ℝ → ℝ) (x : ℝ) | g1,id atx0 | P1=1,Pid=π²/6−1;P0=0 | No defect |
| L844, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | word[] | allindexconditionvacuous,cylinderD | S05 |
| L847, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | x1/2,word[] | irrationalityfalse,membershipfalse | S05 |
| L852, MetricNumberTheory.gaussCylinder_boundary_values; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | word[0],[1,2],[2,1] | empty,(2/3,3/4)∩D,(1/3,2/5)∩D | S01 |
| L857, MetricNumberTheory.gaussDensityTransfer_one_zero; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | f1,x0 | Σa^(-2)=π²/6 | S01 |
| L861, MetricNumberTheory.gaussDensityTransfer_invariant_density; layer 4 | {x : ℝ} (hx : x ∈ I) | x0,1 | transferdensity=1/log2 and1/(2log2),sameasinvariantdensity | No defect |
| L866, MetricNumberTheory.normalizedGaussTransfer_boundary_values; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | g1,id atx0 | 1 andπ²/6−1 | S01 |
| L871, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | f0 | allterms0,tsum0 | S05 |
| L876, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | g0 | allterms0,tsum0 | S05 |
| L881, MetricNumberTheory.wordMatrix_native; layer 4 | {w : List ℕ} {x : ℝ} (hx : x ∈ gaussCylinder w)     (hn : 1 ≤ w.length) | word[1,2],xirrationalincylinder | p0=0,q0=1;p1=1,q1=1;p2=2,q2=3;matrix[[1,2],[1,3]] | No defect |
| L887, MetricNumberTheory.orbit_product_identity; layer 4 | {x : ℝ} (hx : x ∈ D) (N : ℕ) | N0,1;x=√2−1 | 1=q0=1;1/x=1+√2=2+x=q1+q0Tx | No defect |
| L894, MetricNumberTheory.transfer_derivative_contraction; layer 4 | {g : ℝ → ℝ} (hg : ContDiffOn ℝ 1 g I)     {M : ℝ} (hM : 0 ≤ M) (hb : ∀ x ∈ I, \|derivWithin g I x\| ≤ M) | g=id,x0,M1 | abs(Pid)′=2ζ3−π²/6≈0.75918≤0.9 | No defect |
| L899, MetricNumberTheory.density_uniform_error; layer 4 | (n : ℕ) {x : ℝ} (hx : x ∈ I) | n0,x0,1 | errors1/log2−1≈0.442695,1−1/(2log2)≈0.278652≤1 | No defect |
| L904, MetricNumberTheory.digit_marginal_error; layer 4 | {a : ℕ} (ha : 1 ≤ a) (n : ℕ) | n0,a1 | abs(1/2−log(4/3)/log2)≈0.084963≤1 | No defect |
| L910, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | inverseword[1,2],[2,1]at0 | 2/3,1/3 | S05 |
| L914, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | word[],[3] | id;value1/3at0 | S05 |
| L918, MetricNumberTheory.example; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | words[1,2],[2,1],[],[3] | [[1,2],[1,3]],[[1,1],[2,3]],I,[[0,1],[1,3]] | S05 |
| L928, MetricNumberTheory.local instance; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | determinantonesubtype | diag(e,e^(-1)) hasdet1,continuousentrymapsinherited | No defect |
| L932, MetricNumberTheory.local instance; layer 4 | No declaration-local parameters; quantifiers are in the proposition. | quotientBorel | preimageofempty/univ measurable;continuousquotientmappullbackopensopen | No defect |
| L942, MetricNumberTheory.homogeneous_birkhoff; layer 4 | G=SL₂(ℝ), X=G/SL₂(ℤ), determinant-subtype topology, Borel X; a and ha included; u and hu omitted as unused. (μ : Measure X) [IsProbabilityMeasure μ]     (hHaar : ∀ g : G, MeasurePreserving (fun z : X => g • z) μ μ)     (hMixing : IsStrongMixing (fun z : X => a 1 • z) ⟨μ, inferInstance⟩)     {f : X → ℝ} (hf : Integrable f μ) | actuala1,f1 | averages1=integral1; mixingextraassumption | S03 |
| L952, MetricNumberTheory.bounded_digits_compact_orbit; layer 4 | G=SL₂(ℝ), X=G/SL₂(ℤ), determinant-subtype topology, Borel X; a and ha included; u and hu included. {x : ℝ} (hx : x ∈ D) | x=√2−1 | alldigits2,bounded; qdistlowerboundpositive henceorbitshortestvectorboundedaway0 | No defect |
| L956, MetricNumberTheory.typical_unbounded_semiorbit; layer 4 | G=SL₂(ℝ), X=G/SL₂(ℤ), determinant-subtype topology, Borel X; a and ha included; u and hu included. No declaration-local parameters; quantifiers are in the proposition. | typicalunboundeddigits;quadraticnegativecontrol | positivefrequencyofa=B+1 for eachB givesunbounded;quadraticsingletonmass0 | No defect |
| L966, MetricNumberTheory.shortMean; layer 5 | (f : ArithmeticFunction ℝ) (x h : ℕ) | x1,h0,1; fpositiveunitconstant | means0,2; normalizationhnotnumberofterms | No defect |
| L973, MetricNumberTheory.logCorrelation; layer 5 | (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x w : ℝ) | λ,formsn,n+1;x=w=2,4 | 1/(2log2),−1/(12log4);w1value0 | No defect |
| L981, MetricNumberTheory.rademacherModel; layer 5 | {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) | signsξ2=−1,ξ3=1;n0,1,4,6,12 | 0,1,0,−1,0 | S05 |
| L989, MetricNumberTheory.steinhausModel; layer 5 | {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) | phasesζ2=i,ζ3=1;n0,1,4,6,12 | 0,1,−1,i,−1 | S05 |
| L995, MetricNumberTheory.example; layer 5 | (f g : ArithmeticFunction ℂ) (a₁ a₂ : ℕ) (b₁ b₂ : ℤ) (x : ℝ) | w1 | log1=0,totalquotient0;windowempty | S05 |
| L1000, MetricNumberTheory.logCorrelation_liouville_windows; layer 5 | No declaration-local parameters; quantifiers are in the proposition. | λwindows2,4 | n2term1/2;n2,3,4 harmonic1/2−1/3−1/4=−1/12 | S01 |
| L1009, MetricNumberTheory.matomaki_radziwill; layer 5 | No declaration-local parameters; quantifiers are in the proposition. | f1positive,h=X=2 | bothshortmeans3/2,difference0;exceptionalcount0providedthresholdpositive; forsmallhnegative threshold RHSlarge | No defect |
| L1019, MetricNumberTheory.logarithmic_elliott_finite; layer 5 | (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂)     (b₁ b₂ : ℤ) (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (ε : ℝ) (hε : 0 < ε) | f=g1,principalχ,t0 | distance0<A,excluded; determinant0 likewiseexcluded | No defect |
| L1032, MetricNumberTheory.logarithmic_chowla; layer 5 | (a₁ a₂ : ℕ) (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (b₁ b₂ : ℤ)     (hd : (a₁:ℤ)*b₂-(a₂:ℤ)*b₁ ≠ 0) (w : ℝ → ℝ)     (hw1 : ∀ᶠ x in atTop, 1 ≤ w x) (hwx : ∀ᶠ x in atTop, w x ≤ x) (hw : Tendsto w atTop atTop) | a1=a2=1,b1=0,b2=1 | derminant1;initialwindowvaluesasL1000;h0woulddet0excluded | No defect |
| L1039, MetricNumberTheory.real_multiplicative_two_point_nontrivial; layer 5 | (f : ArithmeticFunction ℝ)     (hf1 : f 1 = 1) (hf : ∀ r s : ℕ, 0 < r → 0 < s → f (r*s) = f r * f s)     (hb : ∀ n : ℕ, 0 < n → \|f n\| ≤ 1)     (hneg : ∃ n : ℕ, 0 < n ∧ f n < 0) (h : ℕ) (hh : 0 < h) | f1positive; f=λ | f1failsnegative;λ2=−1 satisfies;h0excludedcorrelationX | No defect |
| L1047, MetricNumberTheory.liouville_two_point_nontrivial; layer 5 | (h : ℕ) (hh : 0 < h) | h0negativecontrol;h1,X4 | h0sum4=Xexcluded;h1sum−2,absolutevalue2≤(1−δ)4 forδ≤1/2;thetheoremiseventual | No defect |
| L1053, MetricNumberTheory.example; layer 5 | (f : ArithmeticFunction ℝ) (x : ℕ) | h1 | (fx+f(x+1))/1=fx+f(x+1) | S05 |
| L1058, MetricNumberTheory.example; layer 5 | (f : ArithmeticFunction ℝ) (hf : ∀ n, 0 < n → f n = 1)     {x h : ℕ} (hx : 0 < x) (hh : 0 < h) | positiveconstant f,x=1,h=1,2 | means2,3/2=(h+1)/h | S05 |
| L1068, MetricNumberTheory.example; layer 5 | {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) | R4,R12 | both0 since4,12nonsquarefree | S05 |
| L1073, MetricNumberTheory.example; layer 5 | {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) | phaseζ2=i,n4 | S4=i²=−1 | S05 |
| L1082, MetricNumberTheory.example; layer 5 | {Ω : Type*} (ξ : ℕ → Ω → ℝ) (ω : Ω) | signsξ2=−1,ξ3=1,n1,6 | R1=1,R6=−1 | S05 |
| L1094, MetricNumberTheory.example; layer 5 | {Ω : Type*} (ζ : ℕ → Ω → ℂ) (ω : Ω) | phaseζ2=i,ζ3=1,n0,1,6 | S0=0,S1=1,S6=i | S05 |

### README: every bold target

`R` denotes `packages/ProbabilisticAndMetricNumberTheory/README.md`. There are 179 bold targets; the bold Checks label at R4648 is not a target. Each row retains the target's actual section and a numerical or exact symbolic instance.

| Target and section | Instances | Computed values on the two sides | Result/change |
|---|---|---|---|
| R151, Prime-power representation of additive functions; 0.1 Additive functions in the native arithmetic carrier | f=Ω,n=12; n=1 | Ω(12)=3=Ω(4)+Ω(3)=2+1; Ω(1)=0=empty sum | No defect |
| R161, Distinct-prime representation; 0.1 Additive functions in the native arithmetic carrier | f=ω,n=12; Ω as wrong model | ω(12)=2=ω(2)+ω(3); Ω(12)=3≠2 | No defect |
| R307, Exact divisibility probability; 0.3 Divisibility probabilities and the lcm | N=5,d=2; d=1,6 | 2/5=floor(5/2)/5; 1=5/5; 0=0/5 | No defect |
| R323, Signed finite counting error; 0.3 Divisibility probabilities and the lcm | N=5,d=3 | 1/5−1/3=−2/15=−(5 mod 3)/(5·3) | No defect |
| R340, Joint divisibility and the lcm; 0.3 Divisibility probabilities and the lcm | N=12,d=4,e=6 | 1/12=floor(12/lcm(4,6))/12; using product gives 0 | No defect |
| R366, Exact mean of a finite truncation; 0.4 First and second moments with the model center | N=5,P={2,3},a(p)=p | mean=7/5=2·2/5+3·1/5 | No defect |
| R384, Centering error; 0.4 First and second moments with the model center | Same instance | abs(7/5−2)=3/5≤5/5=1 | No defect |
| R400, Exact centered pair average; 0.4 First and second moments with the model center | N=5,p=2,q=3; p=q=2 | pair mean=−1/15=0−(1/3)(2/5)−(1/2)(1/5)+1/6; diagonal=1/4 | No defect |
| R417, Uniform prime-pair error; 0.4 First and second moments with the model center | Same instance | abs(error)=1/15≤2/5; diagonal error=0≤2/5 | No defect |
| R490, Simultaneous prime-divisibility probability; 0.5 Boolean patterns and complete periods | N=5,P={2,3}; empty P | joint=0=floor(5/6)/5; empty event=1=floor(5/1)/5 | No defect |
| R515, Signed formula for prime-divisibility patterns; 0.5 Boolean patterns and complete periods | N=5,S={2},T={3} | 2/5=2/5−0/5; S empty,T={2,3}:2/5=1−2/5−1/5+0 | No defect |
| R541, Bernoulli-product error for one pattern; 0.5 Boolean patterns and complete periods | Same pattern | abs(2/5−1/3)=1/15≤2/5 | No defect |
| R569, Complete-period Bernoulli law; 0.5 Boolean patterns and complete periods | N=6,S={2},T={3} | 2/6=(1/2)(1−1/3)=1/3 | No defect |
| R633, Exact centered prime-product average; 0.6 Mixed products and higher finite moments | N=5,P={2,3},α=(1,1) | mean=−1/15; expanded divisibility formula=−1/15 | No defect |
| R655, Explicit centered-product remainder; 0.6 Mixed products and higher finite moments | Same instance | v=(−1/2,−1/3),w=(1,1); error=1/15≤((3/2)(4/3)−1/6)/5=11/30 | No defect |
| R679, Uniform mixed-moment comparison; 0.6 Mixed products and higher finite moments | N=5,P={2,3},α=(1,1) | model=0; error=1/15≤2²/5=4/5 | No defect |
| R703, Complete-period mixed moments; 0.6 Mixed products and higher finite moments | N=6,P={2,3},α=(2,2) | mean=(1/4)(2/9)=1/18=product ν_p(2) | No defect |
| R732, Finite weighted moment comparison; 0.6 Mixed products and higher finite moments | N=6,P={2,3},a=1,k=0,2 | order 0:1=1; order 2:17/36=1/4+2/9; complete-period error 0 | No defect |
| R779, Exact residue probability; 0.7 Residues with a shifted remainder | N=5,d=3,residues0,1,2 | masses(1/5,2/5,2/5); rho=(2,0,1),R=2 gives same triple | No defect |
| R799, Residue atom error; 0.7 Residues with a shifted remainder | Same instance | signed errors(−2/15,1/15,1/15); max2/15<1/5 | No defect |
| R817, Exact summed residue error; 0.7 Residues with a shifted remainder | Same instance | L1=4/15=2·2·1/(5·3); N=2,d=3 gives2/3 | No defect |
| R840, Sharp residue event bound; 0.7 Residues with a shifted remainder | N=5,d=3,A={1,2} | abs(4/5−2/3)=2/15=R(d−R)/(Nd) | No defect |
| R863, Bounded residue statistic bound; 0.7 Residues with a shifted remainder | Same A,F=1_A,L=0,U=1 | error=2/15=(U−L)R(d−R)/(Nd) | No defect |
| R894, Joint residue atom formula; 0.8 Joint residue laws through CRT | N=5,q=(2,3),tuple=(0,0) | CRT c=0,rho=5,R=5; joint mass0=(0+0)/5 | No defect |
| R936, Exact joint residue error; 0.8 Joint residue laws through CRT | N=5,q=(2,3) | L1=1/3=2·5·1/(5·6); q=(4,9),N=2 gives17/9 | No defect |
| R985, Repeated-factor decomposition; 0.9 Repeated prime factors and finite distribution sandwiches | n=72=2³3²; n=1,0 | D=5−2=3=(3−1)+(2−1); at 1 and 0:0=empty sum | No defect |
| R1008, Repeated powers of one prime; 0.9 Repeated prime factors and finite distribution sandwiches | p=2,n=16,N=16 | indicators at j=2,3,4 sum3=valuation4−1 | No defect |
| R1029, Finite repeated-prime-power expansion; 0.9 Repeated prime factors and finite distribution sandwiches | n=72,N=72 | p=2 contributes2,p=3 contributes1,total3=D(72) | No defect |
| R1052, Exact repeated-factor mean; 0.9 Repeated prime factors and finite distribution sandwiches | N=12 | D-sum=5,mean5/12; floors for4,8,9 sum3+1+1=5 | No defect |
| R1072, Uniform repeated-factor mean bound; 0.9 Repeated prime factors and finite distribution sandwiches | N=12; N=1 | 5/12≤11/12; 0≤0 | No defect |
| R1099, Repeated-factor tail bound; 0.9 Repeated prime factors and finite distribution sandwiches | N=12,t=1,2,3 | tails1/3,1/12,0 ≤11/12,11/24,11/36 | No defect |
| R1124, Scaled repeated-factor L1 bound; 0.9 Repeated prime factors and finite distribution sandwiches | N=12,s=2 | mean abs(D/2)=5/24≤11/24 | No defect |
| R1145, Finite omega-to-Omega distribution comparison; 0.9 Repeated prime factors and finite distribution sandwiches | N=4,b=0,s=1,x=1,ε=1 | P(Y≤1)=3/4≤P(X≤1)=1; lower bound1/4−3/4=−1/2≤3/4; tail P(D≥1)=1/4 | No defect |
| R1179, Arithmetic observation frequencies; 0.10 Arithmetic laws and convergence in distribution | N=4,f=ω,B={1} | mapped mass3/4=count{2,3,4}/4 | No defect |
| R1197, Arithmetic cumulative distribution counts; 0.10 Arithmetic laws and convergence in distribution | N=4,f=ω,x=0,1 | CDF(0)=1/4; CDF(1)=1; counts1 and4 divided by4 | No defect |
| R1212, Arithmetic characteristic-function average; 0.10 Arithmetic laws and convergence in distribution | N=2,f=ω,t=π | charFun=(1+exp(iπ))/2=0; t=0 gives1 | No defect |
| R1255, Lipschitz comparison of prime-factor laws; 0.10 Arithmetic laws and convergence in distribution | N=4,b=0,s=2,φ=id,L=1 | mean difference1/8≤(1−1/4)/2=3/8 | No defect |
| R1276, Vanishing normalized repeated-factor mean; 0.10 Arithmetic laws and convergence in distribution | s_m=m+1 | mean bound(1−1/(m+1))/(m+1)→0; m=3 gives3/16 | No defect |
| R1296, Vanishing repeated-factor tail frequencies; 0.10 Arithmetic laws and convergence in distribution | s_m=m+1,ε=1 | frequency≤1/(m+1); m=3 actual0≤1/4; limit0 | No defect |
| R1369, Positive geometric expansion at one prime; 0.11 Exponential and fixed-moment bounds for repeated factors | p=2,n=16,N=16,a=3/2 | (3/2)^3=27/8=1+1/2+3/4+9/8 | No defect |
| R1390, Finite prime product for the excess exponential; 0.11 Exponential and fixed-moment bounds for repeated factors | n=72,a=3/2 | product(9/4)(3/2)=27/8=exp(log(3/2)·3) | No defect |
| R1409, Finite Euler upper bound for the excess mean; 0.11 Exponential and fixed-moment bounds for repeated factors | M=4,a=3/2 | mean9/8; Euler product for p=2,3 with j≤4 exceeds9/8 | No defect |
| R1435, Uniform bound for one repeated-factor Euler term; 0.11 Exponential and fixed-moment bounds for repeated factors | p=2,N→∞,a=3/2 | geometric repeated term=(1/2)/4·1/(1−3/4)=1/2≤2/4 | No defect |
| R1455, Uniform finite excess Euler product bound; 0.11 Exponential and fixed-moment bounds for repeated factors | P={2,3},N=2 | product=(1+1/8)(1+1/18)=19/16≤exp(2) | No defect |
| R1535, Scaled repeated-factor moment bounds; 0.11 Exponential and fixed-moment bounds for repeated factors | M=8,k=2,s=2 | mean(D²/s²)=5/32≤exp(2)·2/(4log(3/2)²) | No defect |
| R1669, Centered prime factor bounds; 1.1 The finite centered prime model | p=3,e=2,3,4 | ν=(2/9,2/27,2/27), all between0 and v=2/9; p=2,e=3 gives0 | No defect |
| R1694, Prime model multinomial expansion; 1.1 The finite centered prime model | P={2,3},k=4 | M4=203/432=1/16+6(1/4)(2/9)+2/27 | No defect |
| R1729, Paired prime contribution; 1.2 Paired supports and collision control | P={2,3},r=2 | paired contribution6v₂v₃=1/3; r=0:1=1 | No defect |
| R1751, Distinct prime variance tuples; 1.2 Paired supports and collision control | P={2,3},r=2 | injective tuple sum2v₂v₃=1/9=2!·H₂ | No defect |
| R1774, Prime variance collision estimate; 1.2 Paired supports and collision control | P={2,3},r=2 | V²−D₂=289/1296−1/9=145/1296=v₂²+v₃² | No defect |
| R1800, Fixed prime support moment bound; 1.2 Paired supports and collision control | S={2,3},k=5 | allowed exponents(2,3),(3,2); count2=binom(2,1); contribution5/27≤120·2·(1/18)/4=10/3 | No defect |
| R1827, Smaller prime support bound; 1.2 Paired supports and collision control | P={2,3},k=4 | lower-support term1/16+2/27=59/432; all terms nonnegative | No defect |
| R1860, Finite even Gaussian moment bound; 1.3 Comparison with Gaussian moments | P={2,3},N=6,r=2 | moment203/432,Gaussian3V²=289/432,error43/216; bound retains local fourth terms | No defect |
| R1894, Finite odd prime moment bound; 1.3 Comparison with Gaussian moments | P={2,3},N=6,r=1 | third moment2/27; Gaussian odd moment0; r=0 mean0 | No defect |
| R1929, Prime cutoff decomposition of omega; 1.4 Removing a prime cutoff | n=60,z=3; n=1 | ω60=3=2+1; ω1=0=0+0 | No defect |
| R1951, Logarithmic bound for discarded prime factors; 1.4 Removing a prime cutoff | n=60,z=3 | large-prime count1≤log60/log3≈3.727; n=1 gives0≤0 | No defect |
| R1975, Centered prime cutoff error; 1.4 Removing a prime cutoff | n=N=8,z=2,b=A_z=1/2 | centered differenceω8−S=0≤log8/log2=3 | No defect |
| R1998, Binomial prime cutoff power error; 1.4 Removing a prime cutoff | Same n,k=2 | both centered powers=1/4,error0≤2·(1/2)·3+9=12; k=0 error0 | No defect |
| R2023, Odd absolute prime moments from adjacent even moments; 1.4 Removing a prime cutoff | P={2},N=2,b=1/2,r=1 | EabsZ³=1/8=sqrt((1/4)(1/16)) | No defect |
| R2052, Finite prime cutoff moment transfer; 1.4 Removing a prime cutoff | P={2},N=2,z=2,b=1/2,k=2 | both second moments1/4,error0; binomial upper expression nonnegative | No defect |
| R2578, Equidistribution in T^d through one-dimensional projections; 2.4 Weyl criteria for Haar and arbitrary limits | x_n=(n√2,n√2),k=(1,−1) | projected orbit0, character mean1≠0; both full-torus criteria false | No defect |
| R2600, Weyl's criterion for an arbitrary limit measure on the torus; 2.4 Weyl criteria for Haar and arbitrary limits | x_n=0,μ=δ₀; μ=Haar | all character means1=δ₀ integrals1; at k=1 Haar integral0≠1 | No defect |
| R2627, Total equidistribution by rational twists; 2.4 Weyl criteria for Haar and arbitrary limits | x_n=n/2,k=1,rational twist1/2 | untwisted means→0,twisted mean1; progression q=2 constant0 | No defect |
| R2684, The equidistribution theorem on ℤ; 2.5 Linear and polynomial sequences | α=√2 and α=1/2 on circle | irrational character means→0 both n signs; rational k=2 mean1 | No defect |
| R2707, Van der Corput's difference theorem; 2.5 Linear and polynomial sequences | x_n=n²√2,h=1 | increment(2n+1)√2,nonzero-character coefficient2k√2 irrational; h=0 would give mean1 | No defect |
| R2937, Rational decomposition of torus points along a subtorus; 2.6 Subtori and rational decompositions | α=(√2,1/2) | Γ=0×ℤ after saturation; α′=(√2,0),α″=(0,1/2),2α″=0 | No defect |
| R2968, Equidistribution theorem for abelian polynomial sequences; 2.6 Subtori and rational decompositions | P(n)=(n√2,n²/3) | coset weights1/3 at0 and2/3 at1/3; total1 | S04 |
| R3001, Equidistribution for abelian linear sequences; 2.6 Subtori and rational decompositions | α=(√2,1/2),β=0 | two cosets with weights1/2,1/2; finite-order part period2 | No defect |
| R3132, Digit cylinders and expanding circle orbits; 2.8 Canonical normal digits | b=2,x=1/2; irrational x with first digit1 | terminating digits1,0,0,...; first cylinder[1/2,1) has length1/2 | No defect |
| R3341, Catlin's reduction to reduced fractions (2.2); 3.2 Duffin–Schaeffer, Catlin and Khinchin | ψ supported at q=2,ψ2=1/2 | ξ(1)=1/4,ξ(2)=1/2; both limsups empty off rational exceptional set | No defect |
| R3378, Totient weights do not change divergence for decreasing ψ; 3.2 Duffin–Schaeffer, Catlin and Khinchin | ψ(q)=1/q,q≥1 | Σψ diverges; weighted summandφ(q)/q², at q=2 equals1/4; weighted sum diverges | No defect |
| R3418, Second-moment lower bound for a finite union; 3.3 Second moments and overlap estimates | A=B,μ(A)=1/2 | union measure1/2; (sum masses)²/sum intersections=1/2 | No defect |
| R3431, Second moment for limsup events; 3.3 Second moments and overlap estimates | all E_n=A,μ(A)=1/2 | ΣfirstN masses=N/2, pair sum=N²/2; ratio1/2=limsup measure | No defect |
| R3443, Duffin–Schaeffer when ψ takes only large values (Lemma 5.2); 3.3 Second moments and overlap estimates | ψ(q)=1/2 for q≥1 | series diverges; predictedlimsup measure1; ψ=0 gives0 and fails divergence | No defect |
| R3451, Overlap estimate for 𝒜_q ∩ 𝒜_r (Lemma 5.3, corrected); 3.3 Second moments and overlap estimates | q=2,r=3,ψ=3/10 | M=9/10,overlap1/6,2M=9/5≥1; old M>1 false | Earlier repair survives |
| R3467, The second-moment bound (Proposition 5.4); 3.3 Second moments and overlap estimates | ψ=1/2,X=1,Y=3,t=1 | weight sum1/2+1/4+1/3=13/12; L_t≤1/2+1/3<10 so E_t empty,sum0 | No defect |
| R3656, High degree or a quality increment (Lemma 10.1); 3.5 Pruning vertices and finding weighted pieces | V=W={1,2},counting weights,diagonal E,P empty | δ=1/2,q=1/256; each degree1≥9/10 | No defect |
| R3669, Subgraph with high-degree vertices (Lemma 8.5); 3.5 Pruning vertices and finding weighted pieces | Same diagonal graph | G′=G,δ′=1/2≥1/2,q′=1/256≥1/256,degrees1≥9/10 | No defect |
| R3682, One part has limited quality loss (Lemma 11.2); 3.5 Pruning vertices and finding weighted pieces | Same graph,partition into singletons,I=J=2 | choose(1,1):δ′=1≥1/8,q′=1≥(1/256)/4^10 | No defect |
| R3697, Few edges between unbalanced sets (Lemmas 11.3 and 11.4); 3.5 Pruning vertices and finding weighted pieces | V=W={p},one edge,large p,r=1,k=1 | all off-band masses0≤1/(4p^(31/30)); class mass ratio1≥1−10^40/p | No defect |
| R3714, Few edges between small sets (Lemma 11.5); 3.5 Pruning vertices and finding weighted pieces | V=W={1,2},diagonal E,η=1/2 | A=B={1}:edge mass1>2·(1/2)^(9/5); singleton subgraph q′=1>1/256 | No defect |
| R3727, Subgraph with few edges between small sets (Lemma 11.6); 3.5 Pruning vertices and finding weighted pieces | Same graph,η=1/2 | choose singleton; only allowed small subsets empty,edge mass0≤(1/2)^(9/5); q′=1 | No defect |
| R3750, Some pair of prime-power classes carries many edges (Lemma 12.1); 3.6 Prime-by-prime quality increments | V=W={p},one edge,P empty | α₁=β₁=1,edge share1≥(1·1)^(9/10)=1; empty-edge case excluded | No defect |
| R3767, Quality increment unless a prime power divides almost all (Lemma 12.2); 3.6 Prime-by-prime quality increments | V=W={p},large p | class shares1≥1−10^40/p; after adding p,quality factor(1−1/p)^−2(1−p^−31/30)^−10>1 | No defect |
| R3784, Small quality loss or a dominant prime power (Lemma 13.1); 3.6 Prime-by-prime quality increments | V=W={2},one edge | class shares1≥9/10; p=2 allowed | No defect |
| R3798, Adding a small prime to 𝒫 (Lemma 13.2); 3.6 Prime-by-prime quality increments | V=W={2},one edge,P empty | R changes{2}→empty; quality factor4(1−2^−31/30)^−10>1≥10^−50 | No defect |
| R3817, Quality increment even when a prime power divides almost all (Lemma 14.1); 3.6 Prime-by-prime quality increments | V=W={p},p>10^2000 | R changes{p}→empty; q′=(1−1/p)^−2(1−p^−31/30)^−10>q=1 | No defect |
| R3838, Iteration when ℛ♭(G) ≠ ∅ (Proposition 8.1); 3.6 Prime-by-prime quality increments | R empty; V=W={1},one edge | RFlat empty,so nonempty premisefalse; quality1 positive does not imply that premise | No defect |
| R3851, Iteration when ℛ♭(G) = ∅ (Proposition 8.2); 3.6 Prime-by-prime quality increments | V=W={p},p>10^2000 | RSharp={p},RFlat empty; adding p removes R and multiplies q by factor>1 | No defect |
| R3863, Bounded quality loss for small primes (Proposition 8.3); 3.6 Prime-by-prime quality increments | V=W={2},one edge | newP={2},R′empty,quality gain>1 exceeds10^(−10^3000) | No defect |
| R3877, Removing the effect of ℛ(G) from L_t (Lemma 8.4); 3.6 Prime-by-prime quality increments | V=W={1},t=300,δ=1 | L_t=0<10,so premise excluded; deleting R alone cannot imply tail mass≥5 | No defect |
| R3911, Rankin-type bound for multiplicative functions (case of Lemma 7.2); 3.7 Arithmetic anatomy and the good subgraph | f(n)=1 for n>0,x=3 | Σf=3≤3exp(0)=3; primepower constancy used | No defect |
| R3928, Few integers with many large prime factors (Lemma 7.3); 3.7 Arithmetic anatomy and the good subgraph | x=6,t=1,c=1 | largest reciprocal-prime sum at6 is5/6<1,count0≤6exp(−1) | No defect |
| R3946, Existence of a good GCD subgraph (Proposition 7.1); 3.7 Arithmetic anatomy and the good subgraph | V=W={1},δ=1,t>10^2000 | L_t=0<10; empty reciprocal-tail condition correctly rejects this graph | No defect |
| R3971, Edge-set bound (Proposition 6.3); {p ∈ 𝒫⁽²⁾ \ 𝒫⁽¹⁾ : f ≠ g} (8.3). Case (a), q(G⁽²⁾)/q(G) ≥ (t/10)⁵⁰δ/10^{10^{3000}}: iterate Proposition 8.1 | ψ1=1,V={1},E empty,t=1 | μV=1,μE=0≤C; if E={(1,1)},L_t=0 fails E⊂E_t | No defect |
| R4031, Radius versus diameter Hausdorff conventions; 3.8 Gauges and disjoint expanded coverings | k=1,f(r)=sqrt(r),r=1/4 | radius cost1/2,diameter cost1/√2; ratio√2,not1 | No defect |
| R4046, Disjoint finite covering for mass transference; 3.8 Gauges and disjoint expanded coverings | unit root,k=1,f(r)=r | expanded radius=original; full limsup forces covering mass≥κ·root mass,κ>0; empty family mass0 excluded | No defect |
| R4145, Bounds on selected level-ball masses; 3.9 Separated Cantor levels and their probability measure | η=2,parent mass1,child f-weights1,3,total4 | child masses1/4,3/4 ≤1/2,3/2; root denominator4≥η | No defect |
| R4155, Ball intersection geometry; 3.9 Separated Cantor levels and their probability measure | A=[−2,2],M=[−1/2,1/2],c=3 | intersectionnonempty,2 outside3M; rM=1/2≤rA=2;3M⊂[−10,10]=5A | No defect |
| R4165, Arbitrary small-ball mass bound; 3.9 Separated Cantor levels and their probability measure | f=sqrt,η=2,r=1/16 | bound C_k/8; halving masses1/4+1/8+...=1/2=2f(r) | No defect |
| R4183, Mass transference principle; 3.10 Mass transference and Hausdorff consequences | k=2,f(r)=r²,r=1/4 | expanded radius((1/4)²)^(1/2)=1/4; both limsup sets identical | S04 |
| R4221, Jarník–Besicovitch dimension theorem; 3.10 Mass transference and Hausdorff consequences | v=3 | critical exponent2/3; cost q·q^(−3s),at s=1 givesq^−2summable,at s=2/3 givesq^−1divergent | S04 |
| R4234, Hausdorff Duffin–Schaeffer theorem; 3.10 Mass transference and Hausdorff consequences | ψ=0; f(r)=r | series0,limsupempty,H^f=0; linear gauge recovers Lebesgue0/1 | S04 |
| R4262, Higher-dimensional Duffin–Schaeffer theorem; 3.11 Simultaneous coordinatewise reduced approximation | k=2,q=2,ψ2=1/2 | one square neighbourhood side1/2,volume1/4; (φ2·ψ2/2)²=1/16,cover factor4 | S04 |
| R4344, Coloring estimate for Birkhoff limsup; 4.1 Pointwise averages, truncated limsups and first hits | T=id,f=2,L=1 | upper truncated limit1,integral1≤integral f=2 | No defect |
| R4358, Invariant limit and conditional expectation; 4.1 Pointwise averages, truncated limsups and first hits | T=id,f=(0,2) on fair two points | g=(0,2),conditional expectationsame; mean1=1 | No defect |
| R4504, Finite lower bound from blue blocks; 4.2 Finite coloring and signed convergence | T=id,f=g=1,ε=1/2,blue blocks length1 | A_Mf=1;blue lower target(1−ε)=1/2,remaining nonnegative | No defect |
| R4516, Integrated upper-limsup coloring inequality; 4.2 Finite coloring and signed convergence | T=id,f=2,L=1 | U_L=1;integral1≤2 plus nonnegative boundary errors | No defect |
| R4532, Removal of the bad-set and coloring boundary; 4.2 Finite coloring and signed convergence | Same instance | bad-set measure0,eventual boundary0;1≤2 | No defect |
| R4542, Finite integrable lower orbit limit; 4.2 Finite coloring and signed convergence | T=id,f=2 | lower orbit limit2,integral2 finite; f=0 gives0 | No defect |
| R4558, Finite upper bound for truncated blue sums; 4.2 Finite coloring and signed convergence | T=id,f=ℓ=1,ε=1/2,blocks length1 | blue sum per step1≤ℓ+ε=3/2; boundary term0 | No defect |
| R4568, Integrated lower-limsup coloring inequality; 4.2 Finite coloring and signed convergence | Same instance | integrals1≤1+ε=3/2 before ε→0 | No defect |
| R4581, Almost-everywhere convergence for nonnegative observables; 4.2 Finite coloring and signed convergence | fair two-point swap,f=(0,2) | even averages1,odd averages1±1/N; limit1 both points | No defect |
| R4592, Conull transport of a measurable representative; 4.2 Finite coloring and signed convergence | f=g off a null set,E;T measure-preserving | bad orbit set⊂union preimages E,measure≤Σ0=0 | No defect |
| R4609, Almost-everywhere convergence for integrable real observables; 4.2 Finite coloring and signed convergence | fair two-point swap,f=(−1,1) | even averages0,odd ±1/N→0; L1normf=1 | No defect |
| R4663, Integral convergence for bounded observables; 4.3 The canonical limit and conditional expectation | Same swap | integral abs(A_Nf−0)=0 if even,1/N if odd→0 | No defect |
| R4673, Integral convergence for every L1 observable; 4.3 The canonical limit and conditional expectation | T=id,any L1f | A_Nf=f for N≥1,L1error0→0 | No defect |
| R4685, Equality of integrals on native invariant sets; 4.3 The canonical limit and conditional expectation | T=id,f=(0,2),A={second point} | integral onA of limit1=integral onA of f1 | No defect |
| R4696, Identification with native invariant conditional expectation; 4.3 The canonical limit and conditional expectation | fair swap,f=(0,2) | invariant σ-algebra trivial; conditional expectation1=orbit limit1 | No defect |
| R4826, Gauss inverse branches and Jacobians; 4.4 The Gauss map, measure, digits and invariance | a=1,y=1/2 | v=2/3,T(v)=1/2; derivative−4/9,absolute4/9 | No defect |
| R4834, Absolute Gauss inverse-branch derivative; 4.4 The Gauss map, measure, digits and invariance | a=2,x=0,1 | v′=−1/4,−1/9; absolute1/4,1/9 | No defect |
| R4843, Invariant density telescope; 4.4 The Gauss map, measure, digits and invariance | x=0,1 | Σ1/(a(a+1))=1;Σ1/((a+1)(a+2))=1/2; equals1/(1+x) | No defect |
| R4914, Irrational points form a conull Borel domain; 4.5 Words, matrices and native convergents | x=0,1,1/2 versus sqrt2−1 | rational points excluded,measure countable rationals0; μ(D)=1 | No defect |
| R4992, Positive ordered matrix denominators; 4.5 Words, matrices and native convergents | w=[1,2] and [2,1] | bottom rows(1,3),(2,3); q≥r>0 gives3≥1,3≥2 | No defect |
| R5002, Native fractional-part stream equals Gauss iterates; 4.5 Words, matrices and native convergents | x=(√5−1)/2 | T(x)=x,native successive fractional partsx,x; digit1 each time | No defect |
| R5019, Irrational Gauss fractions never terminate; 4.5 Words, matrices and native convergents | Same x; rational1/2 control | irrational streamnever0; rational tailT(1/2)=0 terminates | No defect |
| R5041, Möbius formula for inverse words; 4.5 Words, matrices and native convergents | w=[1,2],y=0,1 | matrix[[1,2],[1,3]],fraction values2/3,3/4; reversedword gives1/3,2/5 | No defect |
| R5050, Signed inverse-word derivative; 4.5 Words, matrices and native convergents | w=[1],y=0;w=[1,2],y=0 | derivatives−1 and1/9; determinants−1 and+1 | No defect |
| R5064, Uniform shrinking of positive-word intervals; 4.5 Words, matrices and native convergents | w=[1,1,1] | q=3=fib4,length interval1/(3·5)=1/15≤1/9 | No defect |
| R5075, Inverse words parametrize cylinders; 4.5 Words, matrices and native convergents | w=[1,2] | imageirrationaldomain=D∩(2/3,3/4); T²(v_w(y))=y | No defect |
| R5097, Uniform logarithmic distortion of one Gauss branch; 4.5 Words, matrices and native convergents | a=1,x=0,y=1 | log derivative changeabs(log1−log1/4)=log4≤2 | No defect |
| R5108, Uniform finite-word cylinder distortion; 4.5 Words, matrices and native convergents | w=[1,2],y=0,1 | derivative ratio(4/3)²=16/9≤4; w=[1] endpoint ratio4 | No defect |
| R5121, Convergent denominators and orbit logarithms; 4.5 Words, matrices and native convergents | x=(√5−1)/2,N=1 | q1=1,logq1=0;orbitlog−logx≈0.481≤log2≈0.693 | No defect |
| R5257, Conditional expectation on a cylinder atom; 4.6 Cylinder filtrations, exactness and mixing | B=C_w | conditionalindicator1 onC_w=volume(C_w)/volume(C_w); Bempty gives0 | No defect |
| R5268, Cylinder conditional expectations recover indicators; 4.6 Cylinder filtrations, exactness and mixing | B=D | conditionalvalues1 a.e. for every n;limit1=indicatorD | No defect |
| R5278, Native pullback tail sigma-algebras decrease; 4.6 Cylinder filtrations, exactness and mixing | T=id on fair two points | all pullback σ-algebrasfull; inclusionfull⊂full; constant map yields trivial from n≥1 | No defect |
| R5287, A tail event has measurable pullback representatives; 4.6 Cylinder filtrations, exactness and mixing | T=id,B={0} | B_n=B,T^−nB_n=B; probability1/2=1/2 | No defect |
| R5296, Correct Lebesgue lower bound for a tail preimage; 4.6 Cylinder filtrations, exactness and mixing | B=D,any n | Lebesgue B_n=1≥(1/2)·1; emptyB gives0≥0 | No defect |
| R5309, Explicit constant-four cylinder measure comparison; 4.6 Cylinder filtrations, exactness and mixing | w=[1],E=(0,1/2) | image(2/3,1),length1/3; cylinderlength1/2; normalizedratio2/3 between(1/4)(1/2) and4(1/2) | No defect |
| R5332, Uniform conditional lower bound for positive tail events; 4.6 Cylinder filtrations, exactness and mixing | B=D | conditional1≥m(B)/8=1/8; Bempty0≥0 | No defect |
| R5347, Gauss tail events are null or conull; 4.6 Cylinder filtrations, exactness and mixing | B=D and Bempty | Gaussmeasure1 and0; fair-identity tail singletonmass1/2 shows need actual Gauss argument | No defect |
| R5357, Conditional expectation on an exact tail is constant; 4.6 Cylinder filtrations, exactness and mixing | one-point system,A=univ | conditionalexpectation1=μA; emptyA gives0 | No defect |
| R5368, Reverse conditional expectations converge in L1; 4.6 Cylinder filtrations, exactness and mixing | one-point exact system,A=univ | L1errorabs(1−1)=0 for every n | No defect |
| R5379, Exactness supplies the strong-mixing correlation bound; 4.6 Cylinder filtrations, exactness and mixing | one-point system,A=B=univ | correlationerrorabs(1−1·1)=0≤L1error0 | No defect |
| R5391, Rényi cylinder comparison; 4.6 Cylinder filtrations, exactness and mixing | w=[1],E=(0,1/2) | Lebesgue normalizedinverseimage2/3 versus m(E)=1/2; ratio4/3 within constant4 | No defect |
| R5499, Integrability of Gauss logarithmic observables; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | firstdigit a=1; x∈(0,1) | log1=0,−logx≥0; integralslogKfinite andπ²/(12log2)finite | No defect |
| R5520, Gauss logarithmic integral; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | Gauss negative-log integral | Σ(-1)^n/(n+1)²=π²/12;divide bylog2 givesπ²/(12log2) | No defect |
| R5540, Summable logarithmic digit weights; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | a=1,2 | weightedterms0 andlog(9/8); tailbounded by(loga)/(a²log2) | No defect |
| R5551, Integrability of logarithmic first digits; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | a=2 cylinder | μdigit2=log(9/8)/log2; log2 timesmass=log(9/8) | No defect |
| R5566, Integrability of negative logarithm for Gauss measure; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | x=1 endpoint;near0 | −log1=0;integral_0^1−logx dx=1, density≤1/log2 yieldsfinitebound1/log2 | No defect |
| R5577, Logarithmic monomial integral; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | n=0,1,2 | integrals1,1/4,1/9 =1/(n+1)² | No defect |
| R5592, Alternating reciprocal squares; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | firstfourterms | 1−1/4+1/9−1/16=115/144;fullsumπ²/12;absolutesumπ²/6 | No defect |
| R5600, Interchange for the Gauss logarithmic integral; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | geometricseries1/(1+x) | monomialintegrals1/(n+1)²,absolutesumπ²/6 permitsinterchange;resultπ²/12 | No defect |
| R5610, Evaluation of the Gauss logarithmic observable; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | densitynormalization | (π²/12)/log2=π²/(12log2)>0 | No defect |
| R5646, Absolute convergence of the density transfer; 4.8 Density transfer and normalized transfer | f=1,x=0,1 | L1(0)=π²/6,L1(1)=π²/6−1;seriesmajorantΣa^−2finite | No defect |
| R5762, C1 branch summands and their uniform majorants; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | g=1,branch a=1 | branch h1=1/(2+x);derivative−1/(2+x)², bounded1/4; g′=0 | No defect |
| R5773, Termwise derivative on the open interval; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | g=1 | Σh′_a=0; (P1)′=0; nativetermwiseformula matches | No defect |
| R5785, Endpoint derivatives and C1 closure of P; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | g=1,endpoints0,1 | Pg=1,within-derivatives0 at both endpoints | No defect |
| R5799, Cancellation of derivative weights; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | g constant c | g(v_a)−g(v_1)=0 andg′=0;allterms0=derivative0 | No defect |
| R5809, Correct absolute coefficient estimate; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | g=id,x=0 | abs derivative=2*zeta(3)−pi²/6≈0.759180; upper coefficient sum≤18913/21600≈0.875602 | No defect |
| R5823, First branch coefficient; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | x=0,1 | c1=1/2,1/12;both≤1/2 | No defect |
| R5830, Second branch coefficient; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | x=0,1 | c2=1/18 and1/48; both≤5/72 | No defect |
| R5838, Positive derivative coefficients after the second branch; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | a=3,x=0,1 | h′3=5/144 and1/200, both nonnegative; a=1,x=0 gives−1/4 | No defect |
| R5846, Third branch coefficient; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | a=3,x=0,1 | c3=7/216 and3/400; both≤7/216 | No defect |
| R5854, Fourth branch coefficient; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | a=4,x=0,1 | c4=19/800 and2/375; both≤19/800 | No defect |
| R5862, Reciprocal-square bound for branches with a≥5; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | a=5,x=0,1 | c5=41/2250 and23/5292; both≤1/25 | No defect |
| R5870, Telescoping bound on the reciprocal-square tail; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | a≥5 | Σ1/(a(a−1))=1/4,each1/a²≤1/(a(a−1)) | No defect |
| R5877, Uniform corrected contraction coefficient; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | five displayed upper bounds | 1/2+5/72+7/216+19/800+1/4=18913/21600;gap to9/10=527/21600 | No defect |
| R5890, C1 derivative bound for every iterate; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | gconstant,n=0,1 | derivative0≤M and0≤(9/10)M; atM0bothsides0 | No defect |
| R5898, Conserved weighted mean pins the transfer constant; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | gconstant c | weightedmean=c,oscillation0≤M; g=log2(1+x) hasmean1 | No defect |
| R5911, Iterated densities of the Gauss map; 4.9 An explicit derivative contraction and Gauss–Kuzmin rate | f=1,n=0,1 | initialdensity1;firstdensityL1;totalmassboth1;invariantdensity1/((1+x)log2)fixed | No defect |
| R5981, Row/column and diagonal-time comparison; 4.10 Modular homogeneous-space consumers | t=0,x=1/2 | columnu=[[1,1/2],[0,1]],transpose lowerunipotent; a_0=I;source time2t=0 | No defect |
| R5995, Bad approximation gives a uniform short-vector lower bound; 4.10 Modular homogeneous-space consumers | q=0,p=1,t=0; c=1/4 | maxcoordinates1≥min(1,1/2)=1/2; q≠0 productboundc→max≥1/2 | No defect |
| R6004, Uniform short vectors give a badly-approximable constant; 4.10 Modular homogeneous-space consumers | δ=1/2,q=1,t=log4 | secondcoordinate1/4;first≥1/2 impliesabs(error)≥1/8=δ²/2 | No defect |
| R6172, Good-integer mean-square input; 5.1 Inclusive short intervals and prime-block restrictions | f=1,h=X,densegoodset | terminalquarter shortmean≤1/4+1/X versuslongmean→1;integral≥X/36 versusclaimed o(X) | S08 |
| R6304, Corrected logarithmic Elliott theorem; 5.2 Harmonic two-point averages | f=g=1,principalχ,t=0 | distanceΣ(1−1)/p=0;nonpretentioushypothesisfalse;correlation≈1 not0 | S04;hypothesisnecessary |
| R6412, Rademacher covariance; 5.3 Outcome-wise multiplicative models and their laws | m=n=1,2,4; m=2,n=3 | covariances1,1,0 and0;R4identically0 | No defect |
| R6421, Steinhaus covariance; 5.3 Outcome-wise multiplicative models and their laws | m=n=4;m=2,n=4 | Eabs(S4)²=1;E(S2·conj(S4))=Econj(ξ2)=0 | No defect |
| R6430, Finite random-model second moments; 5.3 Outcome-wise multiplicative models and their laws | N=4 | Rpartialsumsecondmoment3=squarefreecount3;Steinhaussecondmoment4=N | No defect |

### README definitions and construction conventions

This table includes all 49 blocks beginning “Define”, including repeated construction instructions. Native carrier conventions and the opposite or wrongly normalized model are tested in the preceding table or below.

| Definition block and section | Instances | Computed values | Result/change |
|---|---|---|---|
| R83, Define IsAdditive; 0.1 Additive functions in the native arithmetic carrier | Ω on4·3; convolution unit | 3=2+1; unit f(1)=1≠0 | No defect |
| R118, Define IsStronglyAdditive; 0.1 Additive functions in the native arithmetic carrier | ω,Ω at2² | ω4=ω2=1;Ω4=2≠Ω2=1 | No defect |
| R175, Define primeDivisibilitySum; 0.2 Weighted finite prime sums | P={2,3},a(p)=p; n=0,1,12 | 0,0,5; unguarded n=0 would be5 | No defect |
| R1557, Define concentration; 0.12 Concentration of real laws | ν=δ0,δ=0,1; fair atoms0,1 atδ=1/2 | 0,1,1/2; closed-radius convention would give1 | No defect |
| R2191, Define convergence through the existing empirical probability measures; 2.1 Equidistribution as weak convergence | x_n=0,μ=δ0; μ=Haar | bounded test at0 equalsf0; circle frequency1 integral1 vs Haar0 | No defect |
| R2199, Define AsympEquidistributed; 2.1 Equidistribution as weak convergence | x_n=0,μ=δ0; μ=Haar | bounded test at0 equalsf0; circle frequency1 integral1 vs Haar0 | No defect |
| R2214, Define AsympEquidistributed x μ := Tendsto (empiricalMeasure x) atTop (𝓝 μ); no new measure or averaging; 2.1 Equidistribution as weak convergence | x_n=0,μ=δ0; μ=Haar | bounded test at0 equalsf0; circle frequency1 integral1 vs Haar0 | No defect |
| R2380, Define TotallyAsympEquidistributed; 2.2 Progressions and two-sided integer indexing | x_n=n/2 | q2 progressionconstant0; charactermean1≠Haar0; total predicatefalse | No defect |
| R2389, Define TotallyAsympEquidistributed x μ := ∀ q r : ℕ, 0 < q → AsympEquidistributed (fun n => x (q * n + r)) μ.; 2.2 Progressions and two-sided integer indexing | x_n=n/2 | q2 progressionconstant0; charactermean1≠Haar0; total predicatefalse | No defect |
| R2411, Define AsympEquidistributedInt; 2.2 Progressions and two-sided integer indexing | integer sequence x_n=n/2 | positive and negative character2 averages both1; Haar equidistribution fails both halves | No defect |
| R2422, Define AsympEquidistributedInt x μ := AsympEquidistributed (fun n : ℕ => x (n + 1)) μ ∧ AsympEquidistributed; 2.2 Progressions and two-sided integer indexing | constant integer sequence0,μ=δ0 | both half-sequence lawsδ0, all test integralsf0 | No defect |
| R2468, Define TorusIrrational; 2.3 Irrational torus points and characters | d=0; α=(√2,√2),k=(1,-1) | no nonzero k givestrue; diagonal pairing0 excludesirrationality | No defect |
| R2477, Define TorusIrrational α := ∀ k : d → ℤ, k ≠ 0 → ∑ i, k i • α i ≠ 0; 2.3 Irrational torus points and characters | d=0; α=(√2,√2),k=(1,-1) | no nonzero k givestrue; diagonal pairing0 excludesirrationality | No defect |
| R2823, Define Subtorus; 2.6 Subtori and rational decompositions | M=(2); diagonal column(1,1); n0 | first carrier wholecircle withmass1 despitekernel2; diagonal frequencies(1,−1),(1,0) haveintegrals1,0; n0lawδ0 | No defect |
| R3024, Define starDiscrepancy; 2.7 Discrepancy and quadrature | N=0;singleton0,1/2 | D=0,1,1/2 | No defect |
| R3093, Define IsNormalBase; 2.8 Canonical normal digits | b1; b2,x=1/2; emptyword | b1 fails2≤1;binary onesfrequency0≠1/2;empty blockfrequency1=2^0 | No defect |
| R3213, Define dsSet, dsLimsup, khinchinSet, khinchinLimsup; 3.1 Reduced and unrestricted approximation sets | q0,1;ψ=1/2 | q0 empty; q1 reducedinterval[1/2,1] | No defect |
| R3222, Define 𝒜_q, 𝒦_q as finite unions of closed intervals intersected with [0,1], and 𝒜, 𝒦 as Filter.limsup along; 3.1 Reduced and unrestricted approximation sets | ψ0 | limsup rationalsin[0,1],volume0; includes0 and1 | No defect |
| R3488, Define GCDGraph; 3.4 Weighted GCD graphs | V=W={1},E={(1,1)},all primes,f=g0 | vertex/edge masses1; gcd valuations0; every exact law0=0 | No defect |
| R3526, Define GCDGraph.quality; 3.4 Weighted GCD graphs | sameallprimegraph;emptyedges | δ1,q=ζ(31/30)^10; emptyedgesδ=q=0,evenwitharbitrarymetadata | No defect |
| R3539, Define each quantity as displayed; ℛ(G) is a finite set because ℰ is finite; 3.4 Weighted GCD graphs | positiveedge(1,1);emptyedges | positiveexponentshaveemptysupport;remainingEulerproductζ(31/30)^10 finite; zeroqualityguard0 | No defect |
| R3558, Define GCDGraph.restrictPow; 3.4 Weighted GCD graphs | V={1,2,4},W={1,2,8},completeedges,p2 | classes(0,0)={1}×{1};(1,3)={2}×{8};(3,0)=empty | S07 |
| R3995, Define IsDimensionGauge; 3.8 Gauges and disjoint expanded coverings | f=r,r²,0,1 | at0 firsttwo0 andpositiveat1; f0 failspositiveat1; f1 origin1≠0 | No defect |
| R4062, Define MassTransferenceCantor; 3.9 Separated Cantor levels and their probability measure | root[0,1],children1/4,3/4 radius1/20 | triples[1/10,2/5],[3/5,9/10]disjoint; f=sqrt radii1/16,1/64 gives1/4,1/8 | S07 |
| R4104, Define MassTransferenceMeasure; 3.9 Separated Cantor levels and their probability measure | parentmass1,gaugeweights1,3; equal3children | masses1/4,3/4,total1;equalchildren1/3each | No defect |
| R4380, Define upperOrbitTruncation; 4.1 Pointwise averages, truncated limsups and first hits | T=id,f=2,L1;f=−2 | truncatednonnegativelimsup1 and0; bothwithin[0,1] | No defect |
| R4425, Define firstOrbitHit; 4.1 Pointwise averages, truncated limsups and first hits | f2,c1orc2;swapf=(0,4),c1 | firsthits1,0;swapstartsfalse/truegive2,1 | No defect |
| R4464, Define greedyOrbitBlocks; 4.2 Finite coloring and signed convergence | σ2,M2,N5;σ0,M2,N3 | blueblocks(0,2),(2,2),tail1<2;redsingletons0,1,2,total3 | No defect |
| R4623, Define orbitLimit; 4.3 The canonical limit and conditional expectation | T=id,f2;two-cyclef0,2 | limits2and1;nonconvergentsequence default0onlywhenlimitfails | No defect |
| R4718, Define gaussMap; 4.4 The Gauss map, measure, digits and invariance | x0,1/2,2/3 | T=0,0,1/2 | No defect |
| R4750, Define gaussMeasure; 4.4 The Gauss map, measure, digits and invariance | (0,1],(1/2,1],outside | mass1,log(4/3)/log2,0 | No defect |
| R4786, Define gaussDigit; 4.4 The Gauss map, measure, digits and invariance | x2/3; irrational√2−1 | firstdigits1,2,0; irrationalalldigits2 | No defect |
| R4866, Define gaussCylinder; 4.5 Words, matrices and native convergents | words[],[0],[1,2],[2,1] | D,empty,D∩(2/3,3/4),D∩(1/3,2/5) | No defect |
| R4926, Define inverseWord; 4.5 Words, matrices and native convergents | words[],[1,2],[2,1]at0 | 0,2/3,1/3; wrongcompositionorderdetected | No defect |
| R4960, Define wordMatrix; 4.5 Words, matrices and native convergents | words[],[1,2],[2,1] | I,[[1,2],[1,3]],[[1,1],[2,3]];det1 forlength2 | No defect |
| R5136, Define IsStrongMixing; 4.6 Cylinder filtrations, exactness and mixing | oneatomidentity;fairtwoatomidentity | correlation1=1²;fairevent1/2≠1/4 | No defect |
| R5140, Define the precise mixing limit using native iterates, preimages and real measure; 4.6 Cylinder filtrations, exactness and mixing | oneatomidentity;fairtwoatomidentity | correlation1=1²;fairevent1/2≠1/4 | No defect |
| R5172, Define IsExact; 4.6 Cylinder filtrations, exactness and mixing | oneatomidentity;fairtwoatomidentity | tailmasses0/1;fairAandcomplementboth1/2 sofalse | No defect |
| R5208, Define gaussCylinderFiltration; 4.6 Cylinder filtrations, exactness and mixing | F0,F1,F2 | F0foursets;C[1]mass1/2 firstappearsF1;C[1,1]mass1/6 firstappearsF2 | S07 |
| R5261, Define the measurable step function by the displayed cell average on the countable cylinder partition and zero; 4.6 Cylinder filtrations, exactness and mixing | B=C[1,1],cellC[1] | cellmean(1/6)/(1/2)=1/3;integralovercell1/6=indicatorintegral | No defect |
| R5458, Define khinchinConstant; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | k0,1summands | 0 andlog(9/8); exp(sum)>1 | No defect |
| R5464, Define the scalar using native tsum and real exp, prove summability separately by comparison; {0≤j<N:gaussDigit(x,j)=a}/N tends to log((a+1)^2/(a(a+2)))/log 2. ([Smyth2020](#references) Lesson 9 §1.2, | k0,1summands | 0 andlog(9/8); exp(sum)>1 | No defect |
| R5622, Define gaussDensityTransfer; 4.8 Density transfer and normalized transfer | f1,x0,1 | L1=π²/6,π²/6−1;L0=0 | No defect |
| R5676, Define normalizedGaussTransfer; 4.8 Density transfer and normalized transfer | g1,id atx0 | P1=1,Pid=π²/6−1;P0=0 | No defect |
| R6122, Define shortMean; 5.1 Inclusive short intervals and prime-block restrictions | x1,h0,1; fpositiveunitconstant | means0,2; normalizationhnotnumberofterms | No defect |
| R6192, Define logCorrelation; 5.2 Harmonic two-point averages | λ,formsn,n+1;x=w=2,4 | 1/(2log2),−1/(12log4);w1value0 | No defect |
| R6265, Define finiteEntropy of a finite-valued random variable as −Σ_v P(X=v)log P(X=v), with 0log0=0, and finiteMutualInformation(X,Y)=finiteEntropy(X)+finiteEntropy(Y)−finiteEntropy(X,Y); 5.2 Harmonic two-point averages | constant;fairbit;independentbitpair;identicalbitpair | entropies0,log2,2log2,log2;mutualinformations0andlog2 | No defect |
| R6345, Define rademacherModel; 5.3 Outcome-wise multiplicative models and their laws | signsξ2=−1,ξ3=1;n0,1,4,6,12 | 0,1,0,−1,0 | Definition correct; S05 removes unused Lean copy |
| R6379, Define steinhausModel; 5.3 Outcome-wise multiplicative models and their laws | phasesζ2=i,ζ3=1;n0,1,4,6,12 | 0,1,−1,i,−1 | Definition correct; S05 removes unused Lean copy |

### Remaining named README targets

These 205 rows complete the non-bold theorem/API blocks. Elementary identities belong in the README even where S01/S05 removes their Lean copies.

| Target | Instances | Computed values | Result/change |
|---|---|---|---|
| R103, IsAdditive.map_one | f=ω,Ω; pointwise sum; n=1,4,3,12 | unit values0;ω12=1+1=2;Ω12=2+1=3;sum12=3+2=5;ω(2²)=ω2=1 | No defect in displayed instance |
| R108, IsAdditive.map_mul | f=ω,Ω; pointwise sum; n=1,4,3,12 | unit values0;ω12=1+1=2;Ω12=2+1=3;sum12=3+2=5;ω(2²)=ω2=1 | No defect in displayed instance |
| R113, IsAdditive.add | f=ω,Ω; pointwise sum; n=1,4,3,12 | unit values0;ω12=1+1=2;Ω12=2+1=3;sum12=3+2=5;ω(2²)=ω2=1 | No defect in displayed instance |
| R136, IsStronglyAdditive.isAdditive | f=ω,Ω; pointwise sum; n=1,4,3,12 | unit values0;ω12=1+1=2;Ω12=2+1=3;sum12=3+2=5;ω(2²)=ω2=1 | No defect in displayed instance |
| R141, IsStronglyAdditive.prime_pow | f=ω,Ω; pointwise sum; n=1,4,3,12 | unit values0;ω12=1+1=2;Ω12=2+1=3;sum12=3+2=5;ω(2²)=ω2=1 | No defect in displayed instance |
| R146, IsStronglyAdditive.add | f=ω,Ω; pointwise sum; n=1,4,3,12 | unit values0;ω12=1+1=2;Ω12=2+1=3;sum12=3+2=5;ω(2²)=ω2=1 | No defect in displayed instance |
| R204, primeDivisibilitySum_apply | n=12, same P,a | 5=2+3 | README API retained; S01 applies to Lean |
| R216, primeDivisibilitySum_empty | P={2,3},a=p,n=12,1,0; disjointcoprime4,3 | values5,0,0;emptyP0;doubledweights10=5+5;S12=2+3;S2³=2;unitweightsω12=2 | No defect in displayed instance |
| R229, primeDivisibilitySum_congr | P={2,3},a=p,n=12,1,0; disjointcoprime4,3 | values5,0,0;emptyP0;doubledweights10=5+5;S12=2+3;S2³=2;unitweightsω12=2 | No defect in displayed instance |
| R240, primeDivisibilitySum_add | P={2,3},a=p,n=12,1,0; disjointcoprime4,3 | values5,0,0;emptyP0;doubledweights10=5+5;S12=2+3;S2³=2;unitweightsω12=2 | No defect in displayed instance |
| R252, primeDivisibilitySum_mul_of_coprime | P={2,3},a=p,n=12,1,0; disjointcoprime4,3 | values5,0,0;emptyP0;doubledweights10=5+5;S12=2+3;S2³=2;unitweightsω12=2 | No defect in displayed instance |
| R269, primeDivisibilitySum_prime_pow | P={2,3},a=p,n=12,1,0; disjointcoprime4,3 | values5,0,0;emptyP0;doubledweights10=5+5;S12=2+3;S2³=2;unitweightsω12=2 | No defect in displayed instance |
| R285, primeDivisibilitySum_primeFactors | P={2,3},a=p,n=12,1,0; disjointcoprime4,3 | values5,0,0;emptyP0;doubledweights10=5+5;S12=2+3;S2³=2;unitweightsω12=2 | No defect in displayed instance |
| R438, primeDivisibilitySum_secondMoment_error | N=6,P={2,3},a=1 | moment17/36=V17/36, error0≤8/6 | No defect |
| R462, primeDivisibilitySum_secondMoment_completePeriod | N=6,P={2,3},a=1 | 17/36=1/4+2/9; product6 divides6 | No defect |
| R599, divisibility_pattern_summed_error | N=5,P={2,3} | atoms(2/5,2/5,1/5,0); model(1/3,1/3,1/6,1/6); L1=1/3≤9/5 | No defect |
| R916, crt_complete_period_law | q=(4,9),N=36; empty index | atom1/36=(1/4)(1/9); empty event1=empty product1 | No defect |
| R957, crt_statistic_error | q=(3),N=5,F=1_{1,2} | error2/15=1·2·1/(5·3); q=1 gives0=0 | No defect |
| R1231, arithmetic_levy_criterion | f=0,ν=δ0 | all empirical lawsδ0; charFun1=average1 | No defect |
| R1318, excess_distribution_transfer | s_m=m+1,b=0 | both normalized counts tend to0; excess L1≤1/(m+1)→0 | No defect |
| R1347, cdf_weak_criterion | ν_n=ν=δ0 | CDF(-1)=0,CDF(1)=1; continuity at0 fails as required | No defect |
| R1478, excess_exponential_mean | N=4 | mean(1+1+1+3/2)/4=9/8≤exp2 | No defect |
| R1493, excess_all_moments | N=4,k=0,2 | moments1,1/4≤exp2,2exp2/log(3/2)^2 | No defect |
| R1516, excess_exponential_tail | N=4,t=1,-1 | tails1/4,1≤exp(2−log(3/2)),exp(2+log(3/2)) | No defect |
| R1575, concentration_bounds | fairatoms0,1;translation3;dilation−2 | Q(0)=0,Q(1/2)=1/2,Q(1)=1;translatedQ(1/2)=1/2;dilatedQ(1)=1/2=originalQ(1/2) | No defect in displayed instance |
| R1580, concentration_mono | fairatoms0,1;translation3;dilation−2 | Q(0)=0,Q(1/2)=1/2,Q(1)=1;translatedQ(1/2)=1/2;dilatedQ(1)=1/2=originalQ(1/2) | No defect in displayed instance |
| R1585, concentration_translate | fairatoms0,1;translation3;dilation−2 | Q(0)=0,Q(1/2)=1/2,Q(1)=1;translatedQ(1/2)=1/2;dilatedQ(1)=1/2=originalQ(1/2) | No defect in displayed instance |
| R1590, concentration_scale | fairatoms0,1;translation3;dilation−2 | Q(0)=0,Q(1/2)=1/2,Q(1)=1;translatedQ(1/2)=1/2;dilatedQ(1)=1/2=originalQ(1/2) | No defect in displayed instance |
| R1595, kolmogorov_rogozin | one fair Bernoulli,δ=1/2; empty family | D=1/2,Q=1/2≤C√2; empty D=0 excluded | No defect |
| R1608, kubilius_small_prime_model | cutoff<2; fixed cutoff2,N even | TV0 for empty vector; v2 law mass0≈1/2,mass1≈1/4 matches geometric | No defect |
| R2085, turan_kubilius | f=ω,N=2 | A=1/2,B=1/2;sum squares1/2≤30 | No defect |
| R2095, hardy_ramanujan | N=1,2; ε>0 | N1: L=0 and count0;N2:L<0 so exceptional fraction1; finite terms do not affect limit0 | No defect |
| R2107, gaussian_weak_convergence_of_moments | μ_n=standard Gaussian | moments(1,0,1,0,3) equal target; weak law constant | No defect |
| R2119, erdos_kac | N=1,x=0; Gaussian threshold0 | finite normalizedω=Ω=0,frequency1; limiting CDF(0)=1/2, no claim atfiniteN | No defect |
| R2134, restricted_squarefree_second_moment | N=6,D={1,2,5} | ω=(0,1,1),centerL/2; sum=3L²/4−2L+2; wrong full-familycenter differs | No defect |
| R2146, restricted_squarefree_window | N=6,D={1,2,5} | center≈0.292; deviations≈0.292,0.708,0.708; thresholdL^(2/3)≈0.699 excludes2 of3; eventual bound only | No defect |
| R2262, asympEquidistributed_iff_integral_tendsto | constant0 inℝ,ν=δ0; changeoneinitialtermto1 | allcontinuousaveragesf0;changedaverage=f0+(f1−f0)/(N+1)→f0;sameuniquelawδ0 | No defect in displayed instance |
| R2276, asympEquidistributed_iff_integral_tendsto_complex | constant0 inℝ,ν=δ0; changeoneinitialtermto1 | allcontinuousaveragesf0;changedaverage=f0+(f1−f0)/(N+1)→f0;sameuniquelawδ0 | No defect in displayed instance |
| R2290, asympEquidistributed_comp_add_iff | constant0 inℝ,ν=δ0; changeoneinitialtermto1 | allcontinuousaveragesf0;changedaverage=f0+(f1−f0)/(N+1)→f0;sameuniquelawδ0 | No defect in displayed instance |
| R2304, AsympEquidistributed.congr_of_eventuallyEq | constant0 inℝ,ν=δ0; changeoneinitialtermto1 | allcontinuousaveragesf0;changedaverage=f0+(f1−f0)/(N+1)→f0;sameuniquelawδ0 | No defect in displayed instance |
| R2318, AsympEquidistributed.unique | constant0 inℝ,ν=δ0; changeoneinitialtermto1 | allcontinuousaveragesf0;changedaverage=f0+(f1−f0)/(N+1)→f0;sameuniquelawδ0 | No defect in displayed instance |
| R2332, AsympEquidistributed.tendsto_frequency | constant0,δ0,E=(−1,1),c=1/2 | boundarymass0;frequency1=μE;eventuallowerbound1≥1/2 | No defect in displayed instance |
| R2346, AsympEquidistributed.eventually_frequency_ge | constant0,δ0,E=(−1,1),c=1/2 | boundarymass0;frequency1=μE;eventuallowerbound1≥1/2 | No defect in displayed instance |
| R2360, AsympEquidistributed.denseRange | one-pointspace,δpoint | unique nonemptyopenmass1;rangewholespace,closurewholespace | No defect in displayed instance |
| R2450, AsympEquidistributedInt.natCast | constantintegersequence0,δ0 | bothhalfsequencesandpositiveprogressionshaveaveragef0=integralf0 | No defect in displayed instance |
| R2456, TotallyAsympEquidistributedInt.totallyAsympEquidistributed_natCast | constantintegersequence0,δ0 | bothhalfsequencesandpositiveprogressionshaveaveragef0=integralf0 | No defect in displayed instance |
| R2507, torusIrrational_iff_mFourier | circleα1/2,k2;α√2,m2 | pairing1=0mod1,characterexp2πi=1,falseirrational;2√2irrational,allnonzerocharacters≠1 | No defect in displayed instance |
| R2515, mFourier_eq_fourier_sum | circleα1/2,k2;α√2,m2 | pairing1=0mod1,characterexp2πi=1,falseirrational;2√2irrational,allnonzerocharacters≠1 | No defect in displayed instance |
| R2522, torusIrrational_unique_iff | circleα1/2,k2;α√2,m2 | pairing1=0mod1,characterexp2πi=1,falseirrational;2√2irrational,allnonzerocharacters≠1 | No defect in displayed instance |
| R2530, TorusIrrational.zsmul | circleα1/2,k2;α√2,m2 | pairing1=0mod1,characterexp2πi=1,falseirrational;2√2irrational,allnonzerocharacters≠1 | No defect in displayed instance |
| R2538, TorusIrrational.nsmul | circleα1/2,k2;α√2,m2 | pairing1=0mod1,characterexp2πi=1,falseirrational;2√2irrational,allnonzerocharacters≠1 | No defect in displayed instance |
| R2552, weyl_criterion | constant0; d0 | k1 mean1≠0 sofalse/false;d0 bothtrue | No defect |
| R2657, linear_equidistribution_tfae | α=√2;α=1/2 | all nonzero characters irrational so3true; k2 character1 so3false | No defect |
| R2732, weyl_polynomial | s=1,α1=√2;d0 | frequency k has geometric average→0; pointtorus allaverages1 and correctlawδ | No defect |
| R2756, uniformDistribution_mod_one_tfae | u_n=0,interval[0,1/2) | frequency1≠length1/2;character1 mean1≠0; all3false | No defect |
| R2785, polynomial_equidistribution_iff | P=n²/2+n√2;P=n/2 | first: everyk detectslinearirrational; second:k2 pairs0 withallnonconstantcoefficients sofalse/false | No defect |
| R2874, Subtorus.continuous_toHom | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R2882, Subtorus.isCompact_carrier | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R2891, Subtorus.isConnected_carrier | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R2900, Subtorus.haar_carrier | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R2908, Subtorus.integral_mFourier_haar | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R2917, Subtorus.mFourier_eq_one_iff | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R2926, Subtorus.haar_eq_of_carrier_eq | M=(2),M′=(1); diagonalcolumn(1,1) | bothcirclecarrierswholecompactconnectedcircle,mass1,nonzerocharacterintegrals0;diagonal k=(1,−1) pairs0,integral1 | No defect in displayed instance |
| R3041, starDiscrepancy_bounds | onepointx1/2→3/4,ε1/4;permutationtrivial | D1/2→3/4,difference1/4=ε;bothin[0,1];unchangedpermutationdifference0 | No defect in displayed instance |
| R3046, starDiscrepancy_perm | onepointx1/2→3/4,ε1/4;permutationtrivial | D1/2→3/4,difference1/4=ε;bothin[0,1];unchangedpermutationdifference0 | No defect in displayed instance |
| R3051, starDiscrepancy_perturb | onepointx1/2→3/4,ε1/4;permutationtrivial | D1/2→3/4,difference1/4=ε;bothin[0,1];unchangedpermutationdifference0 | No defect in displayed instance |
| R3060, erdos_turan | N=H=1,x=0 | D1≤3/2+3=9/2 | No defect |
| R3070, koksma | N1,x=0,f(t)=t | abs(0−1/2)=1/2≤variation1·D1; fconstant gives0≤0 | No defect |
| R3115, IsNormalBase.block | base2,wordlength0,1,2 | uniformwordtargets1,1/2,1/4;emptywordactualcountN dividedbyN=1 forN>0 | No defect in displayed instance |
| R3121, IsNormalBase.digit | base2,wordlength0,1,2 | uniformwordtargets1,1/2,1/4;emptywordactualcountN dividedbyN=1 forN>0 | No defect in displayed instance |
| R3126, IsNormalBase.empty_block | base2,wordlength0,1,2 | uniformwordtargets1,1/2,1/4;emptywordactualcountN dividedbyN=1 forN>0 | No defect in displayed instance |
| R3146, borel_normal | b2,digit1 | cylinderlength1/2=targetfrequency1/2; exceptionalrationalshavevolume0 | No defect |
| R3158, borel_normal_all_bases | bases2,3 | wordlength1 probabilities1/2,1/3; countable union exceptionalnullsets hasmass0 | No defect |
| R3248, TauCeti.DuffinSchaeffer.volume_dsSet_le | q1,ψ1/2 vsψ0 | A=[1/2,1],mass1/2 between1/2and1;ψ0set{1}subsetA;K=[0,1]containsA | No defect in displayed instance |
| R3254, TauCeti.DuffinSchaeffer.le_volume_dsSet | q1,ψ1/2 vsψ0 | A=[1/2,1],mass1/2 between1/2and1;ψ0set{1}subsetA;K=[0,1]containsA | No defect in displayed instance |
| R3260, TauCeti.DuffinSchaeffer.dsSet_mono | q1,ψ1/2 vsψ0 | A=[1/2,1],mass1/2 between1/2and1;ψ0set{1}subsetA;K=[0,1]containsA | No defect in displayed instance |
| R3266, TauCeti.DuffinSchaeffer.dsSet_subset_khinchinSet | q1,ψ1/2 vsψ0 | A=[1/2,1],mass1/2 between1/2and1;ψ0set{1}subsetA;K=[0,1]containsA | No defect in displayed instance |
| R3272, TauCeti.DuffinSchaeffer.mem_dsLimsup_of_mem_addWellApproximable | irrationalx=√2−1,ψ(q)=q | approximationradius1,closedintervaleventtrueeventually; doublednativeopenradius2 containsx; factor2preservesinclusion | No defect in displayed instance |
| R3279, TauCeti.DuffinSchaeffer.mem_addWellApproximable_of_mem_dsLimsup | irrationalx=√2−1,ψ(q)=q | approximationradius1,closedintervaleventtrueeventually; doublednativeopenradius2 containsx; factor2preservesinclusion | No defect in displayed instance |
| R3293, volume_dsLimsup_eq_zero | ψ0 | series0,volume0 | No defect |
| R3308, volume_dsLimsup_eq_one | ψ(q)=q | weighted summandφ(q),sumdiverges;limsup[0,1],volume1 | No defect |
| R3358, catlin | ψ0;ψ(q)=q | zero envelope0 givesvolume0;infinite envelope sum∞ givesvolume1 | No defect |
| R3396, khinchin | ψ0;ψ(q)=1/q forpositiveq | qψ=0 or1; series0 or∞; conclusionvolume0 or1 | No defect |
| R3580, TauCeti.DuffinSchaeffer.GCDGraph.quality_restrictPow | oneedge(2,8),p2,k1,ℓ3,emptyinitialmetadata | δold=δnew=1,vertexmasses1;qualityratio4/(1−2^(−31/30))^10 equalsdisplayedfactor | No defect in displayed instance |
| R3594, TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph.trans | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3600, TauCeti.DuffinSchaeffer.GCDGraph.IsSubgraph.refl | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3605, TauCeti.DuffinSchaeffer.GCDGraph.R_subset_of_isSubgraph | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3611, TauCeti.DuffinSchaeffer.GCDGraph.vertexMeasure_pos_of_isNontrivial | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3620, TauCeti.DuffinSchaeffer.GCDGraph.isNontrivial_iff | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3625, TauCeti.DuffinSchaeffer.GCDGraph.quality_eq | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3630, TauCeti.DuffinSchaeffer.GCDGraph.edgeDensity_le_one | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3638, TauCeti.DuffinSchaeffer.GCDGraph.restrictPow_isSubgraph | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R3643, TauCeti.DuffinSchaeffer.GCDGraph.R_restrictPow | oneedge(2,8),unitweights,Pempty;restrictp2,k1,ℓ3 | V,W,E masses1,δ1,q1;afterrestrictionR={2}→empty,quality4/(1−2^(−31/30))^10>0;selfanditeratedidentityrestrictionsunchanged | No defect in displayed instance |
| R4016, IsDimensionGauge.zero | f(r)=sqrt(r),r=0,1/16,1/64 | fvalues0,1/4,1/8;positiveradiuspositivevalue;2^(−n) inputs→0 imply2^(−n/2)→0 | No defect in displayed instance |
| R4021, IsDimensionGauge.positive | f(r)=sqrt(r),r=0,1/16,1/64 | fvalues0,1/4,1/8;positiveradiuspositivevalue;2^(−n) inputs→0 imply2^(−n/2)→0 | No defect in displayed instance |
| R4026, IsDimensionGauge.tendsto_zero | f(r)=sqrt(r),r=0,1/16,1/64 | fvalues0,1/4,1/8;positiveradiuspositivevalue;2^(−n) inputs→0 imply2^(−n/2)→0 | No defect in displayed instance |
| R4088, MassTransferenceCantor.nested | localcontainmenttestroot[0,1],triples[1/10,2/5],[3/5,9/10];cutoffs n | triplesdisjointandsubsetsroot;cutoffs n→∞excludeonlyfinitelymanysourceindices | No defect in displayed instance |
| R4093, MassTransferenceCantor.limsup | localcontainmenttestroot[0,1],triples[1/10,2/5],[3/5,9/10];cutoffs n | triplesdisjointandsubsetsroot;cutoffs n→∞excludeonlyfinitelymanysourceindices | No defect in displayed instance |
| R4098, MassTransferenceCantor.separated | localcontainmenttestroot[0,1],triples[1/10,2/5],[3/5,9/10];cutoffs n | triplesdisjointandsubsetsroot;cutoffs n→∞excludeonlyfinitelymanysourceindices | No defect in displayed instance |
| R4127, MassTransferenceMeasure.root | parentmass1,childweights1,3,η2 | childmasses1/4,3/4 sum1;bounds1/2,3/2 respectively;smallballgenericboundC_k f(r)/2 | No defect in displayed instance |
| R4132, MassTransferenceMeasure.children | parentmass1,childweights1,3,η2 | childmasses1/4,3/4 sum1;bounds1/2,3/2 respectively;smallballgenericboundC_k f(r)/2 | No defect in displayed instance |
| R4137, MassTransferenceMeasure.ball_bound | parentmass1,childweights1,3,η2 | childmasses1/4,3/4 sum1;bounds1/2,3/2 respectively;smallballgenericboundC_k f(r)/2 | No defect in displayed instance |
| R4205, mass_transference_power | allcenters0,r_i=2^(-i-1) | expandedlimsup{0},ballaround2 haspositivecomplementvolume,fullhypothesisfails | No defect |
| R4246, duffin_schaeffer_dimension | ψ(q)=1/(2q²) forq>0;ψ0 | critical exponent2/3;zeroψ infpositiveexponents0,dimension0 | No defect |
| R4268, coordinatewise_reduced_overlap | k2,q2,r3,ψ3/10 | one-dimensionaloverlap1/6;productoverlap1/36;productvolumes(3/10)^2(4/10)^2=9/625,finiteconstantboundneeded | No defect in displayed instance |
| R4272, coordinatewise_reduced_zero_one | ψ0;ψ(q)=q,k2 | limsupvolume0;fullradiuslimsupunit-squarevolume1 | No defect in displayed instance |
| R4329, birkhoff_pointwise | identityonfairtwoatoms,f=(0,2) | averagesf, invariantcondExpf; atn0average0 irrelevant | No defect |
| R4371, birkhoff_pointwise_ergodic | oneatom,f=c | averagesc forN≥1=integralc; fairtwoatomidentityfailsErgodic | No defect |
| R4398, upperOrbitTruncation_bounds | identity,f2,L1;two-pointswapf0,4,L3 | U=1;swapU=2atbothpoints,measurableandT-invariant | No defect in displayed instance |
| R4403, upperOrbitTruncation_measurable | identity,f2,L1;two-pointswapf0,4,L3 | U=1;swapU=2atbothpoints,measurableandT-invariant | No defect in displayed instance |
| R4411, upperOrbitTruncation_comp | identity,f2,L1;two-pointswapf0,4,L3 | U=1;swapU=2atbothpoints,measurableandT-invariant | No defect in displayed instance |
| R4442, firstOrbitHit_pos_iff | identity,f2,c1orc2 | firsthit1withaverage2>1;nocrossingτ0when2>2false;constantfibersmeasurable | No defect in displayed instance |
| R4447, firstOrbitHit_average | identity,f2,c1orc2 | firsthit1withaverage2>1;nocrossingτ0when2>2false;constantfibersmeasurable | No defect in displayed instance |
| R4452, firstOrbitHit_measurable | identity,f2,c1orc2 | firsthit1withaverage2>1;nocrossingτ0when2>2false;constantfibersmeasurable | No defect in displayed instance |
| R4483, greedyOrbitBlocks_partition | σ2,M2,N5;σ0,M2,N3 | blue(0,2),(2,2)cover4points,tail1<2;redthreeunitblockscover3,tail0 | No defect in displayed instance |
| R4489, greedyOrbitBlocks_blue | σ2,M2,N5;σ0,M2,N3 | blue(0,2),(2,2)cover4points,tail1<2;redthreeunitblockscover3,tail0 | No defect in displayed instance |
| R4494, greedyOrbitBlocks_red | σ2,M2,N5;σ0,M2,N3 | blue(0,2),(2,2)cover4points,tail1<2;redthreeunitblockscover3,tail0 | No defect in displayed instance |
| R4499, greedyOrbitBlocks_tail | σ2,M2,N5;σ0,M2,N3 | blue(0,2),(2,2)cover4points,tail1<2;redthreeunitblockscover3,tail0 | No defect in displayed instance |
| R4640, orbitLimit_of_tendsto | T=id,f1_E withBorelE;swapf0,2 | orbitLimit=1_E(measurable);swaplimit1atbothpoints;nonBorelEviolatesmeasurablehypothesis | No defect in displayed instance |
| R4645, orbitLimit_measurable | T=id,f1_E withBorelE;swapf0,2 | orbitLimit=1_E(measurable);swaplimit1atbothpoints;nonBorelEviolatesmeasurablehypothesis | No defect in displayed instance |
| R4655, orbitLimit_comp | T=id,f1_E withBorelE;swapf0,2 | orbitLimit=1_E(measurable);swaplimit1atbothpoints;nonBorelEviolatesmeasurablehypothesis | No defect in displayed instance |
| R4736, gaussMap_zero | inputs0,1/2,−2/3,2/3 | outputs0,0,1/2,1/2∈[0,1);reciprocal/fractionalpartareBorelincluding0 | No defect in displayed instance |
| R4740, gaussMap_range | inputs0,1/2,−2/3,2/3 | outputs0,0,1/2,1/2∈[0,1);reciprocal/fractionalpartareBorelincluding0 | No defect in displayed instance |
| R4745, gaussMap_measurable | inputs0,1/2,−2/3,2/3 | outputs0,0,1/2,1/2∈[0,1);reciprocal/fractionalpartareBorelincluding0 | No defect in displayed instance |
| R4770, gaussMeasure_univ | integralover(0,1] | (log2−log1)/log2=1;outsideintervalmass0 | No defect in displayed instance |
| R4776, gaussMeasure_interval | a0,b1;a1/2,b1;singleton1/2 | masses1,log(4/3)/log2,0;Lebesguesingletonmass0;densitybetween1/(2log2)and1/log2 | No defect in displayed instance |
| R4781, gaussMeasure_equivalent | a0,b1;a1/2,b1;singleton1/2 | masses1,log(4/3)/log2,0;Lebesguesingletonmass0;densitybetween1/(2log2)and1/log2 | No defect in displayed instance |
| R4806, gaussDigit_zero | x2/3 indices0,1,2; irrational√2−1 | firstdigits1,2,0;digit0(T(2/3))=2=digit1(2/3);irrationalnativepartialdenominatorsall2 | No defect in displayed instance |
| R4811, gaussDigit_shift | x2/3 indices0,1,2; irrational√2−1 | firstdigits1,2,0;digit0(T(2/3))=2=digit1(2/3);irrationalnativepartialdenominatorsall2 | No defect in displayed instance |
| R4816, gaussDigit_native | x2/3 indices0,1,2; irrational√2−1 | firstdigits1,2,0;digit0(T(2/3))=2=digit1(2/3);irrationalnativepartialdenominatorsall2 | No defect in displayed instance |
| R4852, gauss_invariant | B=(0,1] | preimagehasGaussmass1=Bmass1;branches telescopeforgeneralB | No defect |
| R4889, gaussCylinder_nil | words[],[0],[1,2] | D,empty,D∩(2/3,3/4);prefix1intersectionT^−1C[2]givessameopenintervaltrace | No defect in displayed instance |
| R4894, gaussCylinder_cons | words[],[0],[1,2] | D,empty,D∩(2/3,3/4);prefix1intersectionT^−1C[2]givessameopenintervaltrace | No defect in displayed instance |
| R4900, gaussCylinder_measurable | words[],[0],[1,2] | D,empty,D∩(2/3,3/4);prefix1intersectionT^−1C[2]givessameopenintervaltrace | No defect in displayed instance |
| R4909, gaussCylinder_zero | words[],[0],[1,2] | D,empty,D∩(2/3,3/4);prefix1intersectionT^−1C[2]givessameopenintervaltrace | No defect in displayed instance |
| R4943, inverseWord_nil | words[],[1],[2],at0 | identity0;v[1,2](0)=1/(1+1/2)=2/3=v[1](v[2](0));reverse1/3 | No defect in displayed instance |
| R4948, inverseWord_cons | words[],[1],[2],at0 | identity0;v[1,2](0)=1/(1+1/2)=2/3=v[1](v[2](0));reverse1/3 | No defect in displayed instance |
| R4954, inverseWord_append | words[],[1],[2],at0 | identity0;v[1,2](0)=1/(1+1/2)=2/3=v[1](v[2](0));reverse1/3 | No defect in displayed instance |
| R4977, wordMatrix_nil | words[],[3],[1,2] | matricesI,[[0,1],[1,3]],[[1,2],[1,3]];determinants1,−1,1=(-1)^length | No defect in displayed instance |
| R4982, wordMatrix_cons | words[],[3],[1,2] | matricesI,[[0,1],[1,3]],[[1,2],[1,3]];determinants1,−1,1=(-1)^length | No defect in displayed instance |
| R4987, wordMatrix_det | words[],[3],[1,2] | matricesI,[[0,1],[1,3]],[[1,2],[1,3]];determinants1,−1,1=(-1)^length | No defect in displayed instance |
| R5029, wordMatrix_native | word[1,2],xirrationalincylinder | p0=0,q0=1;p1=1,q1=1;p2=2,q2=3;matrix[[1,2],[1,3]] | No defect |
| R5087, orbit_product_identity | N0,1;x=√2−1 | 1=q0=1;1/x=1+√2=2+x=q1+q0Tx | No defect |
| R5154, IsStrongMixing.measurePreserving | oneatomidentity;fairtwoatomidentitynegativecontrol | oneatomcorrelation1=1²,tail0or1;faircorrelation1/2≠1/4 andtailmass1/2excludesmixing/exactness | No defect in displayed instance |
| R5159, IsStrongMixing.ergodic | oneatomidentity;fairtwoatomidentitynegativecontrol | oneatomcorrelation1=1²,tail0or1;faircorrelation1/2≠1/4 andtailmass1/2excludesmixing/exactness | No defect in displayed instance |
| R5167, IsStrongMixing.correlation | oneatomidentity;fairtwoatomidentitynegativecontrol | oneatomcorrelation1=1²,tail0or1;faircorrelation1/2≠1/4 andtailmass1/2excludesmixing/exactness | No defect in displayed instance |
| R5189, IsExact.measurePreserving | oneatomidentity;fairtwoatomidentitynegativecontrol | oneatomcorrelation1=1²,tail0or1;faircorrelation1/2≠1/4 andtailmass1/2excludesmixing/exactness | No defect in displayed instance |
| R5194, IsExact.tail_zero_one | oneatomidentity;fairtwoatomidentitynegativecontrol | oneatomcorrelation1=1²,tail0or1;faircorrelation1/2≠1/4 andtailmass1/2excludesmixing/exactness | No defect in displayed instance |
| R5199, IsExact.strongMixing | oneatomidentity;fairtwoatomidentitynegativecontrol | oneatomcorrelation1=1²,tail0or1;faircorrelation1/2≠1/4 andtailmass1/2excludesmixing/exactness | No defect in displayed instance |
| R5227, gaussCylinderFiltration_cylinder | F0,F1,F2;word[1,1] | F0foursets;C[1,1]mass1/6subsetC[1]mass1/2;F2distinguishesitbutF1doesnot;outsideDremainsoneatom | No defect in displayed instance |
| R5233, gaussCylinderFiltration_atoms | F0,F1,F2;word[1,1] | F0foursets;C[1,1]mass1/6subsetC[1]mass1/2;F2distinguishesitbutF1doesnot;outsideDremainsoneatom | No defect in displayed instance |
| R5243, gaussCylinderFiltration_generates | F0,F1,F2;word[1,1] | F0foursets;C[1,1]mass1/6subsetC[1]mass1/2;F2distinguishesitbutF1doesnot;outsideDremainsoneatom | No defect in displayed instance |
| R5405, gauss_exact | tailA=empty,univ | masses0,1;exactnessnontrivialforotherA | No defect |
| R5416, gauss_mixing | A=empty,B=univ | correlation0=0·1;A=B=univ gives1=1·1 | No defect |
| R5424, gauss_ergodic | invariantempty,univ | masses0,1;nontrivialinvarianteventsruledoutbyexactness | No defect |
| R5435, gauss_digit_frequency | a1,2 | frequencieslog(4/3)/log2,log(9/8)/log2;sum overallpositivea=1 | No defect |
| R5447, gauss_word_frequency | word[1,2],[2,1] | masseslog(21/20)/log2 andlog(21/20)/log2; cylindersdiffer | No defect |
| R5477, khinchin_series_summable | a1,2;largea | terms0,log(9/8),and≤log(a)/(a²log2),summabletail | No defect |
| R5485, khinchinConstant_pos | firsttwologarithmicsummands | 0,log(9/8);exp(total)>0;log(exp(total))=total=Gausslogdigitintegral | No defect in displayed instance |
| R5490, khinchinConstant_log_integral | firsttwologarithmicsummands | 0,log(9/8);exp(total)>0;log(exp(total))=total=Gausslogdigitintegral | No defect in displayed instance |
| R5508, khinchin_geometric_mean | x=√2−1 negativecontrol | geometricmean2≠K≈2.68545; singletonexceptionmass0 | No defect |
| R5529, levy_denominator | x=√2−1 negativecontrol | logdenominatorgrowthlog(1+√2)≈0.88137≠π²/(12log2)≈1.18657;exceptionnull | No defect |
| R5641, gaussDensityTransfer_zero | f=1,g=1,c2,x0;observableψ1 | L0=0;L2(0)=π²/3=2L1(0);L1(0)=π²/6>0;integralL1=1=integral1;uniformtail≤Σ_{a>A}a^−2→0 | No defect in displayed instance |
| R5655, gaussDensityTransfer_add | f=1,g=1,c2,x0;observableψ1 | L0=0;L2(0)=π²/3=2L1(0);L1(0)=π²/6>0;integralL1=1=integral1;uniformtail≤Σ_{a>A}a^−2→0 | No defect in displayed instance |
| R5660, gaussDensityTransfer_duality | f=1,g=1,c2,x0;observableψ1 | L0=0;L2(0)=π²/3=2L1(0);L1(0)=π²/6>0;integralL1=1=integral1;uniformtail≤Σ_{a>A}a^−2→0 | No defect in displayed instance |
| R5695, normalizedGaussTransfer_const | gconstant2;f1;intervalI | P2=2;P(1+x)=(1+x)L1;weightedconstantintegral2log2bothsides;bounds2≤2≤2 | No defect in displayed instance |
| R5700, normalizedGaussTransfer_conjugate | gconstant2;f1;intervalI | P2=2;P(1+x)=(1+x)L1;weightedconstantintegral2log2bothsides;bounds2≤2≤2 | No defect in displayed instance |
| R5707, normalizedGaussTransfer_integral | gconstant2;f1;intervalI | P2=2;P(1+x)=(1+x)L1;weightedconstantintegral2log2bothsides;bounds2≤2≤2 | No defect in displayed instance |
| R5714, gaussDensityTransfer_smul | f=1,g=1,c2,x0;observableψ1 | L0=0;L2(0)=π²/3=2L1(0);L1(0)=π²/6>0;integralL1=1=integral1;uniformtail≤Σ_{a>A}a^−2→0 | No defect in displayed instance |
| R5721, gaussDensityTransfer_nonnegative | f=1,g=1,c2,x0;observableψ1 | L0=0;L2(0)=π²/3=2L1(0);L1(0)=π²/6>0;integralL1=1=integral1;uniformtail≤Σ_{a>A}a^−2→0 | No defect in displayed instance |
| R5729, normalizedGaussTransfer_add | gconstant2;f1;intervalI | P2=2;P(1+x)=(1+x)L1;weightedconstantintegral2log2bothsides;bounds2≤2≤2 | No defect in displayed instance |
| R5737, normalizedGaussTransfer_smul | gconstant2;f1;intervalI | P2=2;P(1+x)=(1+x)L1;weightedconstantintegral2log2bothsides;bounds2≤2≤2 | No defect in displayed instance |
| R5742, normalizedGaussTransfer_bounds | gconstant2;f1;intervalI | P2=2;P(1+x)=(1+x)L1;weightedconstantintegral2log2bothsides;bounds2≤2≤2 | No defect in displayed instance |
| R5750, gaussDensityTransfer_continuous | f=1,g=1,c2,x0;observableψ1 | L0=0;L2(0)=π²/3=2L1(0);L1(0)=π²/6>0;integralL1=1=integral1;uniformtail≤Σ_{a>A}a^−2→0 | No defect in displayed instance |
| R5885, transfer_derivative_contraction | g=id,x0,M1 | abs(Pid)′=2ζ3−π²/6≈0.75918≤0.9 | No defect |
| R5923, density_uniform_error | n0,x0,1 | errors1/log2−1≈0.442695,1−1/(2log2)≈0.278652≤1 | No defect |
| R5937, digit_marginal_error | n0,a1 | abs(1/2−log(4/3)/log2)≈0.084963≤1 | No defect |
| R5947, gauss_kuzmin | n0,a1 | abs(1/2−log(4/3)/log2)≈0.08496≤C; uniformrateforlatern | No defect |
| R5967, bounded_partial_denominators_iff_badlyApproximable | x=√2−1;convergents1/2,2/5 | alldigits2;errors≈0.085786and0.014214; q²errors≈0.343146,0.355339>positiveuniformlowerbound | No defect in displayed instance |
| R6011, homogeneous_birkhoff | actuala1,f1 | averages1=integral1; mixingextraassumption | Prose generality correct; S03 fixes Lean |
| R6032, bounded_digits_compact_orbit | x=√2−1 | alldigits2,bounded; qdistlowerboundpositive henceorbitshortestvectorboundedaway0 | No defect |
| R6050, typical_unbounded_semiorbit | typicalunboundeddigits;quadraticnegativecontrol | positivefrequencyofa=B+1 for eachB givesunbounded;quadraticsingletonmass0 | No defect |
| R6141, shortMean_zero | fpositiveconstant1,x1,h0,1,2 | means0,2,3/2; doubledinputmeans0,4,3;bound(h+1)/hattainedforh>0 | No defect in displayed instance |
| R6146, shortMean_add | fpositiveconstant1,x1,h0,1,2 | means0,2,3/2; doubledinputmeans0,4,3;bound(h+1)/hattainedforh>0 | No defect in displayed instance |
| R6152, shortMean_bound | fpositiveconstant1,x1,h0,1,2 | means0,2,3/2; doubledinputmeans0,4,3;bound(h+1)/hattainedforh>0 | No defect in displayed instance |
| R6158, matomaki_radziwill | f1positive,h=X=2 | bothshortmeans3/2,difference0;exceptionalcount0providedthresholdpositive; forsmallhnegative threshold RHSlarge | No defect |
| R6212, logCorrelation_swap | λ,nandn+1,x=w2;w1 | correlation1/(2log2),swapsame;doublingfirstinput1/log2;unitwindow0 | No defect in displayed instance |
| R6218, logCorrelation_add_left | λ,nandn+1,x=w2;w1 | correlation1/(2log2),swapsame;doublingfirstinput1/log2;unitwindow0 | No defect in displayed instance |
| R6226, logCorrelation_one_window | λ,nandn+1,x=w2;w1 | correlation1/(2log2),swapsame;doublingfirstinput1/log2;unitwindow0 | No defect in displayed instance |
| R6232, logarithmic_chowla | a1=a2=1,b1=0,b2=1 | derminant1;initialwindowvaluesasL1000;h0woulddet0excluded | No defect |
| R6245, logarithmic_elliott_finite | f=g1,principalχ,t0 | distance0<A,excluded; determinant0 likewiseexcluded | No defect |
| R6257, logarithmic_affine_invariance | Xconstant1,q1,r0 | left1,right1,error0≤η;Z/logw→1normalizesboth | No defect in displayed instance |
| R6261, modulated_short_sum_bound | f=convolutionunitδ1,positivewindow | fprime0,distanceΣ1/puniformincharacterandt;allshiftedsums0≤positivebound | No defect in displayed instance |
| R6275, entropy_decrement_scale | Xconstant,YuniformmodM | H(X)=0,H(Y)=logM,H(X,Y)=logM;I=0≤H/(logHlogloglogH) | No defect in displayed instance |
| R6279, entropy_decoupling | unitcirclef2=i,g1,p2,n1,h1 | original1;wrongcoefficientproduct−1;conjugatecoefficientproduct1 | S02 |
| R6283, prime_fourier_large_spectrum_bound | allc_p=0;arrays0 | Fouriersums0,largespectrumempty,correlationsum0≤RHS0 | No defect in displayed instance |
| R6287, elliott_circle_bound | allc_p=0;arrays0 | Fouriersums0,largespectrumempty,correlationsum0≤RHS0 | No defect in displayed instance |
| R6318, real_multiplicative_two_point_nontrivial | f1positive; f=λ | f1failsnegative;λ2=−1 satisfies;h0excludedcorrelationX | No defect |
| R6330, liouville_two_point_nontrivial | h0negativecontrol;h1,X4 | h0sum4=Xexcluded;h1sum−2,absolutevalue2≤(1−δ)4 forδ≤1/2;thetheoremiseventual | No defect |
| R6364, rademacherModel_squarefree | ξ2=−1,ξ3=1;n1,4,6,12 | Rvalues1,0,−1,0;R6=R2R3=−1;R12=R4R3=0 | No defect in displayed instance |
| R6369, rademacherModel_nonsquarefree | ξ2=−1,ξ3=1;n1,4,6,12 | Rvalues1,0,−1,0;R6=R2R3=−1;R12=R4R3=0 | No defect in displayed instance |
| R6374, rademacherModel_multiplicative | ξ2=−1,ξ3=1;n1,4,6,12 | Rvalues1,0,−1,0;R6=R2R3=−1;R12=R4R3=0 | No defect in displayed instance |
| R6397, steinhausModel_mul | ζ2=i,ζ3=1;n1,4,6,12 | Svalues1,−1,i,−1;S12=S4S3=−1;allpositivenorms1 | No defect in displayed instance |
| R6402, steinhausModel_prime_pow | ζ2=i,ζ3=1;n1,4,6,12 | Svalues1,−1,i,−1;S12=S4S3=−1;allpositivenorms1 | No defect in displayed instance |
| R6407, steinhausModel_norm | ζ2=i,ζ3=1;n1,4,6,12 | Svalues1,−1,i,−1;S12=S4S3=−1;allpositivenorms1 | No defect in displayed instance |

## Headline coverage

| README headline family | Acceptance signatures at this head | Assessment |
|---|---|---|
| Arithmetic probability, exponential excess control and Kubilius comparison | Second-moment/CRT signatures, `excess_exponential_mean`, `excess_all_moments`, `excess_distribution_transfer`, `kubilius_small_prime_model` | General finite index types, composite coprime moduli, signed weights and geometric valuation law retained. |
| Turán–Kubilius, Hardy–Ramanujan and Erdős–Kac | `turan_kubilius`, `hardy_ramanujan`, `gaussian_weak_convergence_of_moments`, `erdos_kac` | Stated, including both ω and Ω and the Gaussian moment bridge. |
| Restricted squarefree family | `restricted_squarefree_second_moment`, `restricted_squarefree_window` | Separate half-log-log centre and relative denominator retained. |
| Weyl criteria and polynomial equidistribution | `weyl_criterion`, `linear_equidistribution_tfae`, both polynomial iff signatures | Stated. Finite-coset Haar-mixture conclusion missing: S04. |
| Discrepancy, bounded-variation quadrature and normality | `erdos_turan`, `koksma`, both Borel-normality signatures | Stated on native carriers with endpoint conventions. |
| Duffin–Schaeffer, Catlin and Khinchin | Both volume alternatives, `catlin`, `khinchin` | Stated; Catlin's envelope uses ENNReal and allows infinity. |
| Euclidean mass transference and Hausdorff approximation | `mass_transference_power`, `duffin_schaeffer_dimension` | Line/power special case does not replace general gauge/dimension headlines: S04. |
| Pointwise ergodic theorem | Both Birkhoff signatures | General integrable observables, probability spaces and native invariant conditional expectation retained. |
| Gauss dynamics and continued fractions | Invariance, exactness, mixing, digit/word laws, Khinchin, Lévy, Gauss–Kuzmin, transfer estimates | Stated. Boundary formulas are padding under S01; the quantitative derivative estimate survives the sign test. |
| Homogeneous applications | Three signatures at L942–956 | Diagonal and unipotent hypotheses survive elaboration; Birkhoff has the extra assumption in S03. |
| Multiplicative short intervals and correlations | MR, finite Elliott, logarithmic Chowla, general real and Liouville nontrivial correlations | Limiting general Elliott absent (S04); proof route has S02 and S08. |
| Random multiplicative second moments | Model definitions only | The definitions do not support any acceptance theorem; remove them under S05. Their elementary expectation identities remain README material. |

The module docstring identifies no theorem as unstatable and names no missing carrier. Native `Measure.mkMetric`, Hausdorff dimension, finite-dimensional real spaces, finite matrices, finite products, probability measures and the already-defined logarithmic correlation suffice for the missing headline statements. No heavy data construction needs a sorry-defined placeholder.

## Sources, ownership and dependency record

The source table records the 23 accessible source entries, with 22 locator bundles corroborated against their cached text or pinned code. Gorodnik's OCR only permits partial locator certification. This count concerns locator bundles, not a claim that every displayed formula in every cited page was recoverable. Seven other entries are settled waivers, listed below. No source text was copied into the package or report.

| Source | Locator evidence read | Result |
|---|---|---|
| TAO-RESIDUES | §3, line 406; finite residue discussion | Section exists; the manifest's Exercise 1 does not (S06). HTML extraction drops some formulas. |
| GS-SIEVING | Lines 70–159 and 217–334, finite moment expansion and pairing proof | The package correctly replaces the source's composition count by binom(k−s−1,s−1); k=5,s=2 gives 2. |
| TAO-PRIME-FACTORS | Lines 686–756, Hardy–Ramanujan discussion and Exercise 51 | Locator found; HTML mathematical expressions are partly absent. |
| TAO-CLT-2010 | Lines 276–300, moment convergence discussion | Source's extra tail assumptions are not silently imported; the roadmap supplies its direct Taylor-remainder bridge. |
| TAO-HOFA-1.1 | Lines 227–304, 329–367 and 424–512, Fourier criteria, progressions and polynomial/subtorus discussion | Character, progression and torsion conventions match the computed torus tests. |
| KM-2020 | Lines 40–160; 601–642; 877–930; 1060–1105; 1385–1439; 1723–1732; 1792–1797; 1836–1848; 1902–1949; 1968–1979; 2059–2072; 2183–2196; 2227–2237; 2379–2383; 2615–2626 | Duffin–Schaeffer/Catlin statements and GCD-graph definitions and iteration locators found. The repaired overlap cutoff withstands q=2,r=3. OCR inequalities were not used alone to allege a strict/weak inequality error. |
| BSKK2023 | Lines 2118–2138, Lemmas 7.1–7.2 | Strict concentration convention and positive-denominator restriction match. Version date error: S06. |
| KoymansPagano2022 | Lines 2831–2848, Theorem 7.2 | Restricted squarefree family and half-log-log window match; this is not the unrestricted Erdős–Kac centre. |
| ElsholtzTao2011 | Lines 2170–2219, Appendix A, Lemmas A.2–A.3 | Real additive mean-square statement with constant 30 and prime-power normalization matches. |
| Sarig2023 | Lines 1841–1860 and 2111–2130, Theorems 2.2–2.3 | General L1 pointwise conclusion and invariant conditional expectation match. |
| SarigTransfer | Lines 1137–1194, Appendix A.2 | Exactness, mixing, inverse cylinders and distortion argument match; native tail sigma-algebras retain measure preservation. |
| Smyth2020 | Lines 2103–2130, 2354–2381, 2416–2464 and 2530–2544 | Theorem 21, continued-fraction estimates, Legendre and bounded-quotient characterization found. The corrected a(a+2) digit denominator is essential. |
| BeresnevichVelani | Lines 204–312, 350–440, 492–534, 700–782 and 789–808 | General MTP, covering, Cantor properties, normalized masses and arbitrary-ball comparison support the local construction. Source radius and native diameter gauges are not declared equal. |
| MatomakiRadziwill | Lines 25–91, 207–256, 310–445, 1580–1608 | Theorem 1 agrees with the real multiplicative signature. Theorem 3's finite-support endpoint requires the correction in S08. |
| TaoLogChowla | Lines 209–271, 586–611, 640–790, 868–917, 980–1006, 1063–1078, 1113–1140, 1190–1216 and 1285–1305 | Finite/limiting hypotheses and entropy/Fourier locators found. Multiplicative transport determines the conjugation even where OCR loses a bar (S02). |
| Harper | Lines 40–48, p.2277 | Rademacher is squarefree-supported, Steinhaus retains prime exponents; distinct models at n=4. |
| Sarnak | Lines 96–119 and 185–215, Lecture 1 | General Chowla and Sarnak are background conjectures here, not advertised proven conclusions. |
| Kubilius2021 | Lines 35–54 and 94–113 | Positive β tending to infinity and independent geometric valuation comparison found. Version date error: S06. |
| Sun2017 | Lines 116–152 and 190–242, Theorem 2 proof | Source's signed derivative contribution is not reused as an absolute bound: the package uses absolute coefficients. At a=2,x=1, h′=−1/72. |
| Gorodnik2010 | Lines 134–160, 238–285 and 309–340 | Mahler and Dani passages identifiable; handwritten/OCR matrix and time conventions not fully legible. The local column-lattice comparison was tested directly. |
| StrauchPorubsky2018 | Lines 2736–2753 and 3626–3646 | Koksma and Erdős–Turán–Koksma locators found; exact printed constants partly damaged in extraction. |
| Mathlib | Pinned declaration checks listed below | Uses pinned code rather than a newer online library. |
| TauCeti | Pinned empirical-measure and probability modules listed below | Successor indexing N=m+1 and finite-law normalization verified in code. |

The settled waived entries are Koukoulopoulos2019 (Theorem 14.2), Kubilius1964, RS1962 (Theorem 5), Falconer1990, PollingtonVaughan1990, Rogozin1961a and Rogozin1961b. No new request or alternate manifest key was created for them.

| Supplier or pinned interface | Verification and implication |
|---|---|
| Mathlib arithmetic | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:258` and `:324` define Ω and ω; `Mathlib/Data/Nat/Factorization/Basic.lean:530` and `:544` supply multiple counts. Values at 0 are totalized; arithmetic samples exclude 0. |
| Tau Ceti empirical probability | `TauCeti/Probability/Process/EmpiricalMeasure.lean:134`, `:155`, `:180`: finite successor sample, measurable-event real evaluation and strongly measurable integral evaluation. The latter requires the native complete normed real target; ℝ and ℂ satisfy it. |
| Mathlib finite algebra | `ZMod.prodEquivPi`, `Mathlib/Data/ZMod/QuotientRing.lean:78`, accepts pairwise coprime natural moduli; the finite probability application additionally supplies nonzero moduli. `Nat.multinomial_spec` and `Finset.sum_pow_eq_sum_piAntidiag` are in `Mathlib/Data/Nat/Choose/Multinomial.lean:76` and `:350`. |
| Mathlib limits | `Mathlib/MeasureTheory/Measure/LevyConvergence.lean:214`, `ProbabilityMeasure.tendsto_iff_tendsto_charFun`, is the probability-law criterion; ℝ satisfies its finite-dimensional hypotheses. The empirical-sum transport is additional arithmetic work. |
| Mathlib Hausdorff and invariants | `Mathlib/MeasureTheory/Measure/Hausdorff.lean:416` and `:422` use diameter gauges in `Measure.mkMetric`; `:535` and `:541` provide Hausdorff/mass-distribution interfaces. `Mathlib/MeasureTheory/MeasurableSpace/Invariants.lean:33` defines the invariant measurable space. |
| ArithmeticDirichletSeries, main completed roadmap | `Completed/ArithmeticDirichletSeries/README.md:86`, Export contract, retains arithmetic-function and Dirichlet-series ownership. |
| AnalyticNumberTheoryPartI, current new-roadmap head | §§0.19/0.21 reciprocal primes; §1.5 Dirichlet means; §§3.18/3.33 pretentious distance and Halász; §§3.12a/3.32/3.41 compact analytic expansion and restricted-family counts. Compact parameter dependence and analytic remainder are explicitly supplied, so the differentiation in R2136 does not create a new ownership gap. |
| DiophantineApproximationAndTranscendence, main | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:502`, §0.6, owns bad approximation. Its statement does not own the bounded-native-digit equivalence; that equivalence belongs here. |
| GeometryOfNumbersAndQuadraticArithmetic, current new-roadmap head | §§4.2.1/4.2.2 at README lines 1895/1905 supply Howe–Moore/Moore; preceding Koopman targets explicitly impose strong continuity and standard quotient hypotheses. §4.5.8 at line 2496 supplies Mahler in dimension n≥2. SL₂ and its actual diagonal subgroup meet the intended scope. |
| AdelicAlgebraicGroups, current new-roadmap head | AA.2 quotient integration and AA.3 `Reduction.arithmetic_finite_volume_iff`, README line 3132: arithmetic quotient has finite volume iff the rational character group vanishes. SL₂ has trivial rational character group; Gₘ does not, and would not be an admissible substitute. |
| Six declared gaps | All six slugs, suppliers and needs match `design/plan.json` and README's Exact supplier contracts. None has supplier `none`; none is rejected merely for being unimplemented. MR's endpoint convention must be corrected consistently under S08. |

Ownership searches used the roadmap CLI across indexed heads and main, and direct object searches across the supplied fourteen sibling checkouts and board packages. The objects searched included pointwise Birkhoff, finite entropy, exactness/mixing, GCD graphs, mass transference, continued-fraction statistics, prime-factor laws, random multiplicative functions and logarithmic correlations. No fully qualified declaration collision with this package's namespace was found. ArithmeticDynamics §2.6 still plans pointwise Birkhoff and entropy infrastructure; it is later in the merge order and must consume this roadmap's earlier pointwise and finite Shannon-entropy ownership. This package does not acquire an upward edge to it. The other supplied sibling heads produced no competing ownership of these objects.

The read-only dependency check returned exit status 0:

```text
depcheck: 15 roadmaps, 106 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Local layer use was also traced: Layer 2 normality consumes Layer 4 pointwise convergence, whose proof does not use normality; the GCD graph iteration runs from its finite restrictions/quality targets to the overlap bound; Cantor mass estimates follow the separate construction; transfer differentiability precedes contraction; short-interval and Elliott analytic inputs remain declared supplier contracts. S02 and S08 identify invalid mathematical steps on those otherwise owned routes.

## Verified sound

Read all 6,554 README lines and all 1,111 Suggested.lean lines, the repository README/CONTRIBUTING rules, all 25 prior findings and their repair dispositions. The report records 147 Lean declarations (105 named, two local instances, forty examples), 179 bold README targets, 49 definition/construction blocks and 205 remaining named target blocks. Thus all 433 inventoried target blocks have witness rows; the additional bold label at R4648 is a Check heading.

There are 185 Checks blocks containing 436 bullet entries. They were inspected for truth and discrimination against their section's definitions and formulas; the computed trials are recorded against the corresponding statements above. S07 records the three deficient definition lists. The exact rational cross-check ran 4,854 assertions successfully: N=1,…,32, moduli 1,…,12, six prime sets with signed/zero weights, and twenty transfer branches at 101 points each. This certifies those finite calculations, not the asymptotic theorems.

Source coverage: 30 unique manifest records; 23 accessible records inspected, 22 locator bundles corroborated at least in part, one partially legible OCR record, seven settled waivers. Supplier citation coverage: six distinct cited roadmap owners checked (ArithmeticDirichletSeries, AnalyticNumberTheoryPartI, SieveMethodsAndPrimePatterns, DiophantineApproximationAndTranscendence, GeometryOfNumbersAndQuadraticArithmetic and AdelicAlgebraicGroups), six declared gap slugs reconciled, and all fourteen supplied sibling checkouts searched for ownership. ArithmeticDynamics' later overlapping pointwise work was explicitly resolved as a consumer obligation. The dependency gate reported 106 edges and zero problems.

The following prior repairs survive the new instances: full arbitrary-prime metadata in GCD graphs; composite CRT moduli and q=1; strict concentration at a touching endpoint; Gaussian moment convergence without a uniform subgaussian assumption; the polynomial criterion with an irrational lower coefficient; the corrected reduced-overlap cutoff; the corrected absolute transfer coefficient; the half-log-log restricted-family centre; and the general real multiplicative nontrivial-correlation conclusion. Native zero extensions and the inclusive short-mean convention agree between README and Lean. The head's changes are confined to this package. No `set_option`, admitted data definition, `True` placeholder or imported roadmap module occurs in Suggested.lean.

## Not verifiable

- No new Lean elaboration or build was run, as required by the read-only brief. The supplied 105 elaborated named signatures were read and compared; the three automated dropped-binder leads are false positives because the relevant ha/hu hypotheses appear explicitly in those types. Forty examples and two local instances were read statically, not rerun.
- Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990 and both Rogozin entries remain cited by their settled waived locators. Their primary proofs were not available for inspection and no new source request was made.
- The Gorodnik2010 handwritten extraction identifies the theorems but does not reliably preserve every matrix/time symbol. Direct matrix computations support the local comparison; they do not certify the damaged source typography. Some TAO-RESIDUES/TAO-PRIME-FACTORS HTML formulas and StrauchPorubsky2018 printed constants are also missing or damaged. Their locator presence is verified, their unrecoverable formula text is not.
- The six declared supplier contracts are assumptions of acceptance, not implemented results certified by this review. In particular, the restricted Dirichlet means and high-twist Liouville separation are not inferred from weaker currently supplied statements. S08 requires the MR endpoint convention to be corrected before that contract is consumed.
- Ownership coverage is the indexed roadmap heads/main plus the fourteen supplied sibling checkouts, not any unpublished work outside those inputs. Finite witness tables cannot certify every analytic argument; they record explicit attempted refutations and the limitations above.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "613f32d5a721a154250e8b9d236885ed781f822b", "job": "RT-ProbabilisticAndMetricNumberTheory~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
