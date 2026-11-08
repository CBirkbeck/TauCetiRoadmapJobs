# Review of SieveMethodsAndPrimePatterns (pull request #1495 at a0ce011)

**Verdict:** needs changes

This is a full review: the folder changed by 265 lines since eecdf1d. The gate passes on this head, and the build is clean. There are two findings:
- R01 (P2): §5.3a still shares three objects with AdelicAlgebraicGroups. This is the part of the previous R01 that the repair did not reach.
- R02 (P3): two sentences still call the §4.6 evaluations hypotheses.

## Previous findings

- **R01 (strong approximation has two owners): partly repaired.**
  - Repaired: AdelicAlgebraicGroups at the head of #792 now cites §5.3a for the predicate, Borel density and the simply connected theorem. Its README lines 127–128 read "SieveMethodsAndPrimePatterns §5.3a supplies the strong approximation predicate, Borel density…", and its Suggested.lean has the comment "Supplied by SieveMethodsAndPrimePatterns: §5.3a…".
  - Repaired: the CONRAD-12 locator now adds Proposition 2.1 and Examples 2.2–2.3 (`README.md:3567`).
  - Not repaired: AdelicAlgebraicGroups still owns, and still declares in Lean, the adelic-point carriers, weak approximation for simply connected groups and the closed-subgroup theorem. §5.3a states all three again. See R01 below.
- **R02 (Chen and Maynard conditional on numerical facts): repaired.**
  - `Suggested.lean:629` `theorem maynardM_five_ge : (1417255 / 708216 : ℝ) ≤ maynardM 5`, `:633` `four_lt_maynardM_105 : 4 < maynardM 105`, `:637`, `:643` `elliottHalberstam_gaps (hEH : ElliottHalberstam)`, `:755` `chen_goldbach :` and `:762` carry no numerical hypotheses.
  - The evaluations are README targets (§4.6 lines 3174–3189, §4.7 lines 3225–3237, §5.5 lines 3954–3967).
  - The Check "{0,2,6,8,12} is admissible" is restored at line 2854.
- **R03 (TeX at line 1792): repaired.** The subscript is now in a code span: "tapered vectors `φ_{N,L}(x_i)` and f". The gate shows `tex=0`.
- **R04 (kernel reciprocity witness): repaired.** `README.md:4118` adds the cyclic cubic Check "Φ(α,β)=1 and Φ(β,α)=−1 … reads 1=(−1)(−1)".
- **R05 (Lang–Weil not stated): repaired.**
  - `Suggested.lean:732` `theorem lang_weil_uniform (n r d : ℕ)` states both the upper bound and the irreducible estimate.
  - The module docstring lists "the uniform Lang–Weil estimates".
  - README 3647–3663 adds the presentation conventions and two new Checks.
- **R06 (AnalyticNumberTheoryPartI §§3.3–3.4 contract): repaired.** `README.md:13` lists "3.1, 3.3–3.4", and line 69 states both bounds with the ℚ(i) example. This matches AnalyticNumberTheoryPartI at #1126, §3.3 (line 2189) and §3.4 (line 2197).
- **R07 (twelve undeclared gaps): repaired.** `design/plan.json` is now `{"gaps": []}`, and the README contains no `gap:` contract.

## R01 (P2) — Adelic points, weak approximation and closed p-adic subgroups still have two owners: §5.3a and AdelicAlgebraicGroups

**Location.**
- `README.md:3559`: "Define `SieveStrongApproximation.AdelicPoints` … with values in the adele ring…".
- `README.md:3595` ("Closed subgroups of p-adic analytic groups") and `README.md:3603` ("Weak approximation for simply connected groups … (PR-94 … Theorem 7.8, p.415)").
- `README.md:13`: "This roadmap also owns … adelic points with strong approximation…".
- `Suggested.lean:675–699` (`evaluationTopology`, `AdelicPoints`, `FiniteAdelicPoints`, `InfinitePoints`, `LocalPoints`, `diagonal`, `finiteProjection`).

**Claim.** The repair kept §5.3a and had AdelicAlgebraicGroups cite it. AdelicAlgebraicGroups still claims the inputs of §5.3a as its own. So three objects have two owners, and each roadmap hands objects to the other. The two Lean files also declare the same carriers under two fully qualified names.

**Witness.**
- AdelicAlgebraicGroups at #792, `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean`:
  - line 100 declares `scoped instance evaluationTopology`, with the same body as ours;
  - lines 121–149 declare `AdelicPoints`, `diagonal` and `finiteProjection`;
  - line 342 declares `Approximation.hasWeakApproximation_of_simplyConnected`, citing Platonov–Rapinchuk Theorem 7.8, p.415.
- Its README line 4054 owns "Closed subgroups of p-adic Lie groups", and its scope (lines 39–42) owns AA.1.

**Repair.**
- Return the strong-approximation chain to its natural owner, as the previous review's first option proposed:
  - delete §5.3a and the `SieveStrongApproximation` block (`Suggested.lean:668–721`) with its three `TauCeti.Algebra.AlgebraicGroup.*` imports;
  - add `### From TauCetiRoadmap.AdelicAlgebraicGroups`: AA.1 (adelic points, integral models, S-integral points) and AA.4.2 (strong approximation for simply connected semisimple groups);
  - repoint the §5.3a citations at lines 3645, 3705, 3799 and 3900;
  - drop §5.3a from lines 13, 19, 87 and 135 and from the module docstring (`Suggested.lean:23`);
  - remove CONRAD-12, RAPINCHUK-14, PR-94, PLATONOV-69, BOREL-63 and SCHNEIDER-11, which only §5.3a uses (lines 3567–3623).
- AdelicAlgebraicGroups (merge order line 51, before this roadmap at line 56) then restates the predicate and theorem it now cites, and stops citing this roadmap.
- Tested: a scratch copy of the README with §5.3a removed and that supplier section added gives `depcheck: 236 roadmaps, 2421 edges, 0 problem(s)`.
- The alternative is for AdelicAlgebraicGroups to delete its AA.1 carriers, AA.4.1 weak approximation and AA.4.2 closed-subgroup target and cite §5.3a instead. That would make its Layers 1–3 wait on this roadmap. In that case also name `SieveStrongApproximation.evaluationTopology` in the README: it is the one Lean declaration that the README does not mention.

## R02 (P3) — Two sentences still call the §4.6 evaluations hypotheses

**Location.**
- `README.md:2831`: "reduce the variational lower bounds to rational quadratic forms, whose numerical values are the named hypotheses of §4.6".
- `README.md:3134`: "Under the hypotheses of §4.6, k = 105 and θ = 1/2 − ε give r₁₀₅ ≥ 2".

**Claim.** §4.6 now has no hypotheses: it proves the Gram-form values as targets. These sentences contradict the README's own scope statement.

**Witness.** `README.md:21` says each finite evaluation "is stated as a proposition about explicit numbers … and none is a hypothesis of the theorems that use it". `Suggested.lean:629–646` takes no such hypothesis.

**Repair.**
- Line 2831: "whose values are the finite evaluations stated as targets in §4.6".
- Line 3134: "With the bounds M₁₀₅ > 4 and M₅ ≥ 1417255/708216 of §4.6, k = 105 …".

## Verified sound

**Gate and dependencies.**
- My rerun of the gate on this head shows every scanner at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also has `build=0`.
- Dependency check, verbatim: `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line for this roadmap.
- On AdelicAlgebraicGroups' README at #792, the same check prints `moved: SieveMethodsAndPrimePatterns moved in the merge order up before AdelicAlgebraicGroups` and `0 problem(s)`. That is the expected move, not a defect.
- The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`). The diff outside the folder is empty.
- README line 47 pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`. These equal `lake-manifest.json` and both checkouts.

**Lean.**
- `lake env lean Suggested.lean` exits 0 with exactly 45 `declaration uses sorry` warnings and nothing else.
- I appended `#check @name` for all 82 declarations to a scratch copy. It elaborates with no error, and each type matches `signatures.md` and the README statement.
  - The one lead (`InfinitePoints` without `[NumberField F]`) is harmless: `NumberField.InfiniteAdeleRing F` needs only `[Field F]`.
  - The new `lang_weil_uniform` keeps `[Field k] [Finite k]` and both conjuncts.
  - `chen_goldbach`, `chen_prime_shift`, `maynardM_five_ge`, `four_lt_maynardM_105`, `frequently_nth_prime_succ_sub_le_600` and `elliottHalberstam_gaps` have no stray binders.
- One-tactic padding probe: I replaced every `sorry` by `first | (rfl; done) | (simp; done) | (norm_num; done) | (infer_instance; done) | (positivity; done) | sorry`. All 45 `sorry` warnings remained.
- Every Lean name appears in the README except `evaluationTopology` (see R01). Every backticked own name in the README is declared (gate `readme-ids-missing=0`).

**Library declarations opened at the pins (file:line).**
- `Real.log_two_near_10`, `Analysis/Complex/ExponentialBounds.lean:74`, and `Real.hasSum_log_one_add_inv`, `Analysis/SpecialFunctions/Log/Deriv.lean:398`: the new Needs of §5.5.
- `Nat.IsAtMostAlmostPrime`, `NumberTheory/AlmostPrime.lean:46`: n≠0 ∧ Ω n ≤ k.
- The README's line-numbered contracts all match:
  - `Pi.norm_def` (Constructions.lean:310) and `norm_le_pi_norm` (:346);
  - `ContDiffBump.normed`, `integral_pos`, `integral_normed` and `tsupport_normed_eq` (Normed.lean:35, 66, 71, 79);
  - `Nat.exists_prime_lt_and_le_two_mul` (Bertrand.lean:225);
  - `Polynomial.monicEquivDegreeLT` and `degreeLTEquiv` (RingTheory/Polynomial/Basic.lean:141, 114);
  - `ArithmeticFunction.mul_apply` (Defs.lean:254);
  - `IsApproximateSubgroup`, `.subgroup` and `.of_small_tripling` (ApproximateSubgroup.lean:64, 120, 128);
  - `AddChar.sum_eq_zero_of_ne_one` and `sum_eq_card_of_eq_one` (AddCharacter.lean:240, 250).
- Tau Ceti: `IdealArithmeticFunction.vonMangoldt` (VonMangoldt.lean:82), `norm_vonMangoldt_le_log` (:178) and `convolution_one_one_apply` (Convolution/Basic.lean:366).

**Cross-roadmap citations resolved.**
- On main:
  - IntegralLattices Layers 0 and 3 (`TauCetiRoadmap/IntegralLattices/README.md:507, 829`). This shows the `overlaps.md` lead naming #1239 is false;
  - QuadraticFormInvariants 6C (line 1984), with `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula` (Suggested.lean:2578);
  - ThetaSeries 2H (line 562), with `kroneckerSym` and `kroneckerChar`;
  - SchemeAndStackFoundations §§0.8, 5.11 and 5.12 (lines 798, 7273, 7336), with `generic_fibre_spreading`, `fibre_locus_constructible`, `weil_bound` and `bezout_inequality`;
  - SuccessiveMinima `finite_gauge_sublevel` and `exists_integral_minimum_flag`;
  - ReductiveGroupsPartII `kneserTits_local` (Suggested.lean:278);
  - Isoperimetry I2 and RiemannianGeometry R4.9.6a.
- AnalyticNumberTheoryPartI at #1126: every cited section exists (§§0.10, 0.11, 0.18, 0.21, 0.26, 0.31, 0.32, 0.34, 1.5a, 3.1, 3.3, 3.4, 3.22, 3.24, 3.26, 3.34, 3.35), with `landau_siegel_exclusion`, `zetaFourthMoment.divisorDiagonal` and `smoothCount_dickman`. Its three mentions of this roadmap (lines 13, 17, 3379) are consumer notes, so there is no cycle.
- AnalyticNumberTheoryPartII at #1167: §5.29 (line 1457).

**Ownership against open pull requests.**
- No open pull request cites the Lean names this head deleted (`MaynardFiveRecord`, `ChenUpperEnvelope` and so on): the search returns "no match".
- Every id that consumers cite exists at this head:
  - §0.4 (ErdosProgressionPowers);
  - §§0.5 and 1.1 (ExplicitMultiplicativeFunctions, ArithmeticDirichletSeriesPartII);
  - §0.11a (GeometryOfNumbersAndQuadraticArithmetic);
  - §2.4 (CircleMethodThreePrimes);
  - §§2.6 and 2.9 (ExplicitZetaBounds);
  - §§2.9 and 3.1 (ExplicitPrimeCounting);
  - §5.4 (InverseGaloisAndArithmeticFundamentalGroups);
  - §5.6 (ArithmeticStatisticsPartV).
- ExplicitCharacterSumsAndSieves (#1948, order line 270) consumes §§1.3, 1.6, 2.9 and 5.2 and says it re-proves none of them. I checked "Large sieve for forbidden residues" at `README.md:2432` and "Selberg optimal weights" at `README.md:1252`.
- ProbabilisticAndMetricNumberTheory's divisor-bounded multiplicative mean (line 4135, of Shiu type) is a different object from §1.1's Selberg diagonal sums.
- ArithmeticStatisticsPartIII (#1174, order line 113) §2.23 re-derives degree-uniform Lang–Weil for hypersurfaces inside its smooth-point target. As the later roadmap, it should cite §5.4 `lang_weil_uniform`; that repair belongs to its own review.
- The only double ownership found is R01.

**Sources read at the locators: the seeded sample.**
- §0.2: KED-ANT-11 §11.2 Lemma 11.2 (line 411) and §11.4 Definition 11.6 (line 500).
- §0.7: KHAYUTIN-19 Definition 9.1, Lemmas 9.2–9.3 (lines 3415–3448, p.221) and Definition 9.6 (line 3479, p.222).
  - Lemma 9.3 assumes Q≠0. The README form also holds at Q=0, since both sides vanish.
  - Definition 9.15, Remark 9.16 and Corollary 9.17 are at lines 3791–3815, pp.227–228.
- §0.8: KHAYUTIN-19 Lemma B.1, Remark B.2, Proposition B.3, Lemma B.4 with (67), Proposition B.5 with (68), Corollary B.6 and Proposition B.8 with (69)–(72), lines 6112–6529, pp.265–271. The README's three corrections are confirmed below and under Source issues.
- §0.11a: HENK-02 Theorem 1.5 (line 109, p.3; 0-symmetric bodies, d≥2) and (1.3) (line 82, p.2).
- §2.2: BOMBIERI-1971 Theorem (p.401), the translation to 2N or 2N+1 (p.402), and the sine bound, at-most-two intervals and nearest-integer L (p.404). The OCR is poor, but each step is present.
- §2.6: KED-chap-largesieve Lemma 15.4 (line 476).
- §3.0: LS-EXCLUSION Theorem 1 (line 23); GREEN-LS Theorem 1.1 (line 27); KED-ANT-18 Theorem 18.3 proof (line 469, Σ τ(s)/φ(s)).
- §3.1: MAYNARD-2015 (1.3) and footnote 1 (lines 48–55 and 85–87, p.384).
- §3.2: KED-ANT-18 Definition 18.1 (line 355), Lemma 18.2 (line 373), Theorem 18.3 (line 429, log²Q) and Theorem 18.4 (line 520, fixed x).
- §4.1: MAYNARD-2015 p.383 (lines 20–23).
- §4.3: MAYNARD-2015 Propositions 4.1–4.2 (lines 268 and 311, pp.388–389).
- §4.5: MAYNARD-2015 (2.1) (line 146, p.386) and the last sentence of Proposition 4.2 (line 326).
- §4.6: MAYNARD-2015 Proposition 4.3 (line 353, p.390), Lemma 8.1 (line 1718, p.409) and (8.15)–(8.17) (lines 2008–2026, p.412). (8.17) prints only the ratio, as the README says.
- §4.7: MAYNARD-2015 proof of Theorems 1.3–1.4 and footnote 2 (lines 359–386, p.390), and proof of Theorem 1.1 (lines 394–400, p.391).
- §5.1: KED-ANT-11 §11.1 (line 368).

**Adversarial table** (values computed with exact rationals or brute force; scripts maynard.py, adm.py, chen.py, tri.py, vg.py, b4.py and misc.py in the job's scratch directory).

| Statement (line) | Instance | Values computed | Result |
|---|---|---|---|
| §0.2 pushforward weights (264, 276) | 2≤n≤8 ↦ n(10−n); two labels at 7, weights 2 and 3 | 4 distinct labels, multSum(1)=7; weight 5 | holds |
| §0.3 Legendre example (1053) | 1…10, P=6; support {0,1,2,3,6} | 10−5−3+1=3 (survivors 1,5,7); 5−3−3+2=1 | holds |
| §0.7 densities (768–771) | Q=x₀, mod 9; Q=0, mod 4; Q=2; Q=x₀², mod 4 | ρ=ρ̃=9; ρ=16, ρ̃=0; ρ̃(2)=4, ρ̃(4)=0; ρ=8, ρ̃=4 | holds |
| §0.7 lifting law (764) | Q=x₀², p=2, k=2 | p²ρ̃=16; p²ρ(4)−ρsing(8)=32−16=16 | holds |
| §0.7 growth class (814–817) | ζ; f=2^Ω at 4 and 2 | 1≤min(1,n); f(4)=4, 2^Ω≤n; fails at n=2 for M(1,1,1) | holds |
| §0.7 θ_Q (840–843) | Q=x₀ at 9 and 6 | 1+6/9=5/3; 2·5/3=10/3; λ(9)=0 | holds |
| §0.8 smooth part (869–877) | x²−y² mod 3 (n=m=1); x²+y² at p=3, 5 | ρ₁=4, 12, 36 = (p−1)(1+χ)p^(n−1), against 0 from the printed p^(n−1)(1−χ); 0 against 2, 6, 18 | README corrects the source |
| §0.8 ramified form | x²+3y²+12 mod 9 | 0 roots; 3 non-lifting roots mod 3 | holds |
| §0.8 genus sum (891–897) | p=3, u=u_A=ω=1, k=1, ε=−1 | x²+3y²≡3 mod 9: 3·6=18; README formula 18; printed formula 9 | README corrects the source |
| §0.11a Henk (Lean 112) | [−1,1]²; [−1,1]×[−1/3,1/3]; d=1, [−1,1] | 9<18; 3<6; 3=3 (so d≥2 is needed, as stated) | holds |
| §0.11a Davenport (Lean 142) | n=1; unit square sheared by (x,y+Mx) | sSup ∅=0, bound C; 4 points, volume 1, original projections 1 | holds |
| §1.3 Selberg weights (1273–1274) | P=6, ν(2)=1/2, ν(3)=1/3, z=4; P=2, z=3 | G=5/2, λ(2)=−4/5, λ(3)=−3/5, λ(6)=0; G=2, λ(2)=−1, main sum 1/2=1/G | holds |
| Brun and Selberg (Lean 164, 183) | P=1 | (1−δ)X−\|R₁\| ≤ X+R₁ ≤ (1+δ)X+\|R₁\|; S=X+R₁ ≤ X/1+\|R₁\| | holds |
| §1.6 (Lean 194, 200, 208) | x=y=2; x=3; N=4; k=3, a=2, x=12 | π(4)−π(2)=1≤5.77; twins {3}; Goldbach {2}, 1≤2.08C; {2,5,11}=3≤4.33C | holds |
| §2.2 taper width (1832) | δ=1/2, 3/10 | L=2, 3; r²+π²/12≤2r on [2/3,1] (1.266≤1.333 at 2/3) | holds |
| §2.2 radial bins (1812) | δ=3/10, x=(0,2/5); δ=1/4, antipode | floor(4/3)=1 with 0.6>1/2; floor(2)=2 | holds |
| §2.9 sharp additive (Lean 236) | x=(0,1/2), δ=1/2, H=1 | LHS 2\|a₀\|², RHS (1−1+2)\|a₀\|² | equality, holds |
| §2.6 duality (2231) | KED Lemma 15.4 allows C∈ℝ | C≥0 is imposed here; C<0 with J=∅ makes the source false | holds |
| §2.4 Vaughan (Lean 374) | n<150, U,V≤12 (25,350 cases, including n=0 and U=V=0) | max \|RHS−Λ\|=1.3e−15 | holds |
| §0.4 Gram (Lean 56–76) | 3000 random ℂ-families with zero and repeated rows | max violation 2.7e−15, 5.3e−15, 7.1e−15 (rounding) | holds |
| §3.0 moments (2521–2523) | Q=2, j=0,1,2; Q=3, j=1, with (q,2)=1 | 2, 3, 5; 4 and 2 | holds |
| §3.0 small conductor (Lean 428) | χ mod 3, x=y=3, s=1, 2; s=12, y=10; r=0 sign character | −log 2, 0; mask log 72≤2 log 10; LHS 0 and log 0=0, so the bound holds trivially | holds |
| §3.1 discrepancy (2576–2585) | (10,3); (5,3); windowError(2,3) | classes 1, 2 against mean 2 → 1; 0, 2 against 3/2 → 3/2; 1+1=2 | holds |
| §3.2 discrepancy (2612–2615) | 1_{n=2}, q=2; 1_{n=1}, q=3; δ₂*δ₃ at q=5 | 0; ±1/2; 3/4 (the pointwise product gives 0) | holds |
| §3.2 convolution mean (Lean 447) | δ₁*δ₁, x=y=1, Q=3, Δ=1 | LHS 1/2 ≤ 6C(1+log 3)²; hypothesis 1−1/φ(N)≤1 | holds |
| §4.1 admissible (2851–2856) | {0,2,6,8,12}; {0,2,4}; {0,1} | misses 1, 1, 4 mod 2, 3, 5; covers mod 3; covers mod 2; translates {2}, {3} | holds |
| §4.3 functionals (2979–2992) | triangle; F=x; kernel polynomial; G_{2,1}(2) | I=1/2, J=1/3; 1/12, 1/20, 1/30; I=1/3150, both fibre polynomials ≡0, F(1/4,1/4)=1/128; 6 | holds |
| §4.3 shrink/mollify (3010–3012) | k=4, η=1/10 | u=1/30: sum 31/30 (excluded by r<1/40); ±1/80: 19/20 and 17/20; 7/80>0 | holds |
| §4.5 positivity (3102, 3110) | ρ=θM/2−ε | ⌊ρ+1⌋=⌈θM/2⌉, both when θM/2 is an integer and when it is not | holds |
| §4.6 Lemma 8.1 (3160) | k=5, a=2, b=0 | 2!/7!=1/2520; the printed r≥1 sum gives 0 | README corrects the source |
| §4.6 Gram values (3176, Lean 587–610) | Lean definitions at k=5 | I=29509/1222452000, J=40493/838252800, ratio 1417255/708216≈2.00116 | holds |
| §4.6 r≥1 Check (3186) | G without the r=0 term | I=17753/977961600 | Check correct |
| §4.6 constant witness (3187) | (0,0), k=2 and k=105 | I=1/k!; ratio 4/3 and 105/53 | Check correct |
| §4.6 headlines (Lean 629, 633) | unconditional | M₅≥2.00116 from the witness; M_k≤k makes sSup finite; M₀=0 | holds |
| §4.7 tuples (3225–3235) | footnote set; all 5-subsets of [0,12] | 105 distinct, in [0,600], admissible at all 27 primes ≤103; misses 1,2,1,4,7,6 at 2,3,5,7,11,13; minimum diameter 12, only {0,2,6,8,12} and {0,4,6,10,12} | holds |
| §4.7 gaps (Lean 637, 643, 650, 658) | m=1; singletons | Thm 1.3 and 1.4 as in Maynard p.385; C e⁴≥600 for C≥11; c=1 | holds |
| §4.5 clusters (Lean 571) | k=0; k=1, θ=1/2 | ⌈0⌉=0, all n; ⌈1/4⌉=1, infinitely many primes | holds |
| §5.1 roughness (3342) | n=8, z=2, k=2 | 8<8 false; Ω=3 | holds |
| §5.3a strong approximation (Lean 712) | SL_n; definite quaternion; G_a, G_m | hS holds, fails, …; ℚ^×∩∏ℤ_p^×={±1} | holds; duplicated (R01) |
| §5.4 Lang–Weil (Lean 732) | S=∅, n=2, 𝔽₃; xy; x²−2y² over 𝔽₃; x²+y²−1 over 𝔽₃ and 𝔽₇; S={1}; n=0 | 9=q²; 5≤3C with radical not prime; 1 point, radical not prime; 4=3+1 and 8=7+1, \|N−p\|=1; N=0; N=1=q⁰ | holds |
| §5.5 Chen constants (3954–3966) | as written | envelope 0.4924633<0.49255; integral 0.4909952; V=−0.0164726; 4+24 log 3−40 log 2=2.6408077 (margin 7.7e−6); 4-decimal logs give 2.6424; 2.6408−1.9702=0.6706 | holds |
| §5.5 weight and factor (3922–3949) | N=1000: n=11, 286, 3, 27; C₆, C₁₀, C₁₈ | z=1.995, N^(1/3)=10; weights 1, 0, 1/2, 1/2; 2C₂, (4/3)C₂, 2C₂ | holds |
| Chen headlines (Lean 755, 762) | N=10; h=2, x=10 | p∈{3,5,7}; p∈{2,3,5,7}; Ω(N−p)≥1 since N−p≥2 | holds |
| §5.6 cubic witness (4118) | t³+t²−2t−1, α=1+8t, β=1+16σ(t) | norms 377=13·29 and 3569=43·83, all ≡±1 mod 7 (split); α<0 at 2 real places; sign pairs (−,+), (+,−), (−,−) | holds |
| Layer 4 intro and §4.5 (2831, 3134) | text against line 21 | "named hypotheses of §4.6" against "none is a hypothesis" | R02 |

## Not verifiable

- DAVENPORT-51 (pp.179–183, correction p.580) and LANG-WEIL-54 (Theorem 1, Lemma 1): Wiley DOI (HTTP 403 in the previous round) and JSTOR without an open copy.
- PR-94 (Theorems 7.8 and 7.12) and SCHNEIDER-11: printed books.
- PLATONOV-69: mathnet.ru timed out in the previous round.
- DAVENPORT-51, LANG-WEIL-54, PLATONOV-69 and PR-94 have no entry in the package's `sources.toml`. The worker should record them as uncertified. No manifest is edited by this review.
- CHEN-73-CN, RICHERT-1969, HR-SIEVE, BGS-10, DFI-1997, FIMR-ERRATUM-2015 and KM-16RANK-published are settled as waived or uncertified, and are cited by locator only.
- Effectivity of the small-conductor constants (§3.0, Summary) rests on the AnalyticNumberTheoryPartI §0.34 contract. LS-EXCLUSION Theorem 1 (line 23) states only an absolute constant, and its §6 argument (line 444) runs by contradiction along a sequence. GREEN-LS (line 23) notes that an exposition by Banks gives explicit constants.
- Ownership against open pull requests was checked through `roadmaps grep`/`show` at their heads for AdelicAlgebraicGroups, AnalyticNumberTheoryPartI/II, ExplicitCharacterSumsAndSieves, ArithmeticStatisticsPartIII and ProbabilisticAndMetricNumberTheory, and by name search across all 471 heads. It was not checked against unpublished board packages.

## Source issues

- **Error** in KHAYUTIN-19 at Appendix B, Lemma B.4, Case II, printed p.266: for m≥1 the source counts the solutions not reducing to zero as p^(n−1)(1−χ); it should be p^(n−1)(p−1)(1+χ), e.g. 4 for x²−y² mod 3; affects a stated result.
- **Error** in KHAYUTIN-19 at Proposition B.5, proof, equation (68), printed p.268: the source writes the exponent 2ϖ and a minus sign before 4ωuu_A; it should be ϖ=l mod 2 and a plus sign, from Q=q−ωD; affects the proof.
- **Error** in KHAYUTIN-19 at Proposition B.8, factor f, printed p.270: the source uses (ωu/p); it should be (−ωu/p), giving 18 rather than 9 at p=3, u=u_A=ω=1, k=1, ε=−1; affects a stated result.
- **Misprint** in MAYNARD-2015 at §8, Lemma 8.1, printed p.409: the sum defining G_{b,j} starts at r=1, so b=0 gives 0; it should start at r=0 with G_{0,j}=1; affects a stated result (the k=5 I-form would be 17753/977961600).
- **Gap** in MAYNARD-2015 at §4, proof of Theorem 1.1, printed p.391: admissibility is justified by no element being a multiple of a prime less than k; the prime p=k also needs this, and it holds since every element exceeds k; affects the proof.
- **Gap** in KED-chap-largesieve at §15.2, Lemma 15.4: the source allows any real C; with no column indices and C<0 the hypothesis holds and the conclusion fails; C≥0 is needed; affects nothing.
- **Misprint** in HENK-02 at §1, before Conjecture 1.4, printed p.2: the source defines ⌊x⌋ as the smallest integer not less than x; it should be the largest integer not greater than x; affects nothing.
