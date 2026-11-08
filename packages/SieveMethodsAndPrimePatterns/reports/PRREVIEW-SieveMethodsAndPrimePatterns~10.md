# Review of SieveMethodsAndPrimePatterns (pull request #1495 at 8111bc5)

**Verdict:** needs changes

This is a full review of the folder at 8111bc5. The gate passes on my rerun, the dependency check reports 0 problems, and `Suggested.lean` elaborates with 45 `sorry` warnings and nothing else. Every sampled locator that I could read is correct. The k=5 and k=105 Maynard evaluations and every spin and reciprocity witness check out exactly.

There are five findings, two of them blocking:
- R01 and R02 (P2): two open roadmaps also own objects that this roadmap owns.
- R03–R05 (P3): a supplier locator the latest commit added, the reference list, and two padding declarations.

The findings of the last report on the board (R03–R07 of the review at f07c3fe) are all repaired at this head (see Verified sound).

## R01 (P2) — The Hilbert inequality π/δ and the sharp additive and primitive large sieves have a second owner, ArithmeticStatisticsPartVII

**Location.**
- `README.md:13`: "the uniform-spacing constant π/δ of §2.9 is owned here, because the sharp additive large-sieve constant N−1+δ⁻¹ needs exactly π".
- `README.md:2404`, `:2414` and `:2424`: §2.9's separated Hilbert inequality, "Prove `SieveTaper.sharp_additive_largeSieve`" and "Prove `SieveApplications.sharp_primitive_largeSieve`".
- `Suggested.lean:236–241` and `:261–265`.

**Claim.** ArithmeticStatisticsPartVII owns all three objects as well, and it says that this roadmap consumes them from it. Each roadmap therefore hands the same objects to the other, and they have no single owner.

**Witness.**
- ArithmeticStatisticsPartVII at #1178, `README.md:17`: its multiplicative-large-sieve target "owns the Montgomery–Vaughan Hilbert inequality with the uniform-spacing constant `π/δ` …, the sharp additive large sieve … `0<δ≤1`, and the sharp primitive-character large sieve … SieveMethodsAndPrimePatterns consumes these three inequalities".
- The same README proves all three at `:1031–1035`.
- Merge order: this roadmap is `ORDER.txt` line 55, ArithmeticStatisticsPartVII line 142.
- ExplicitZetaBounds (#1954, `README.md:133–134`, `:145–146`) and ExplicitPrimeCounting (#1945, `README.md:149`) already cite §2.9 here as the owner.

**Repair.**
- §2.9 stays the owner, because this roadmap is earlier in the merge order.
- In #1178, replace "owns … SieveMethodsAndPrimePatterns consumes these three inequalities" with a citation of SieveMethodsAndPrimePatterns §2.9 (`SieveTaper.sharp_additive_largeSieve`, `SieveApplications.sharp_primitive_largeSieve` and the separated Hilbert inequality), and drop the three proofs from its target.
- So that the citation covers the range #1178 uses, widen `sharp_additive_largeSieve` here from `δ ≤ 1/2` to `0 < δ ≤ 1`:
  - in the README at line 2414;
  - in the Lean, `hδ' : δ ≤ 1`.
- Add ArithmeticStatisticsPartVII to Downstream consumers.

**Tested.** The widened statement is true.
- Two distinct points that are δ-separated modulo one force δ ≤ 1/2 (the README's "cardinality above the circle diameter" lemma, line 1930).
- With at most one point and 1/2 < δ ≤ 1, Cauchy–Schwarz gives |Σ_j a_j e((M+j+1)x)|² ≤ H·Σ|a_j|² ≤ (H−1+1/δ)·Σ|a_j|².
- Instance: δ=1, one point x=0, a=(1,1) gives 4 ≤ (2−1+1)·2 = 4.

## R02 (P2) — Degree-uniform Lang–Weil is planned again in ArithmeticStatisticsPartIII

**Location.**
- `README.md:13`: "This roadmap also owns … the uniform and fixed-model Lang–Weil estimates (§5.4)".
- `README.md:3575`: `SieveLangWeil.lang_weil_uniform`.

**Claim.** ArithmeticStatisticsPartIII plans the proof of degree-uniform Lang–Weil from scratch and never cites this roadmap.

**Witness.**
- ArithmeticStatisticsPartIII at #1174, `README.md:2081`, in its target "Degree-uniform hypersurface smooth points": "Prove degree-uniform Lang–Weil by induction on dimension: the curve case uses the genus bound and the curve Weil estimate; average hyperplane sections …". It cites Lang–Weil Theorem 1 and Lemmas 1–2.
- No occurrence of "SieveMethodsAndPrimePatterns" exists in that README.
- Merge order: this roadmap is line 55, ArithmeticStatisticsPartIII line 111.
- InverseGaloisAndArithmeticFundamentalGroups (#850, `README.md:164–165` and the table row at 306) already takes the fixed-model estimate from §5.4 here.

**Repair.**
- §5.4 stays the owner.
- Name InverseGaloisAndArithmeticFundamentalGroups (IG.2.5, IG.2.7) and ArithmeticStatisticsPartIII under Downstream consumers.
- In #1174, the smooth-point target cites `SieveLangWeil.lang_weil_uniform` and keeps only the removal of the singular locus.

**Tested.** The hypersurface statement follows from §5.4.
- For a geometrically integral degree-d form f in n+1 variables, its affine cone is one equation of degree ≤ d, geometrically irreducible of dimension n. So |#cone(𝔽_q) − qⁿ| ≤ C q^(n−1/2), and #H(𝔽_q) = (#cone − 1)/(q − 1) = q^(n−1) + O(q^(n−3/2)).
- The singular cone {f = ∂f/∂x_i = 0} has n+2 equations of degree ≤ d and dimension ≤ n−1. The upper half of §5.4 bounds it by C q^(n−1), which is O(q^(n−2)) projective points.

## R03 (P3) — The uniform totient-sum lower bound cites a PNT+ theorem that does not state it, and the wrong Heath-Brown display

**Location.** `README.md:1085`: "This last lower estimate is uniform in k, unlike a fixed-k asymptotic (HB-SIEVES, (3.5)–(3.6), pp.17–18; [PNT-PLUS](#references), `…/Sieve/SelbergBounds.lean`, `selbergBoundingSum_ge_sum_div`)."

**Claim.**
- `selbergBoundingSum_ge_sum_div` assumes that every prime up to the level divides P and that ν is completely multiplicative and positive on P. Its conclusion is that the Selberg bounding sum is at least Σ_(m≤√level) ν(m).
  - It cannot encode the restriction (d,k)=1: that needs ν(p)=0 at p|k, which the positivity on P forbids.
  - So it gives only the k=1 case.
- HB (3.5)–(3.6) is the Brun–Titchmarsh application. The uniform bound itself is HB (3.2), in the proof of Corollary 3.1, and it holds with c=1.

**Witness.**
- PNT+ `PrimeNumberTheoremAnd/Mathlib/NumberTheory/Sieve/SelbergBounds.lean`, main branch: the hypotheses are `hP : ∀ p, p.Prime → (p:ℝ) ≤ s.level → p ∣ s.prodPrimes` and `hnu : CompletelyMultiplicative s.nu`.
- HB-SIEVES lines 684–686: "H_k(z) ≥ (φ(k)/k)H_1(z) ≥ (φ(k)/k) log z (3.2)", p.13.

**Repair.**
- Cite "(HB-SIEVES, proof of Corollary 3.1, (3.2), p.13)".
- State the bound with c=1, which is what the source proves; a general k reduces to its squarefree kernel.
- Drop the PNT-PLUS locator from this sentence, or describe it as the k=1 case at a pinned commit.
- The PNT-PLUS citation of `selberg_bound_simple` at line 1290 is correct. Its cutoffs are l² ≤ y and d ≤ y, against l < z and d < z² here.

**Tested.** With c=1 the three Checks hold:
- k=1, z=2: 1 ≥ log 2 ≈ 0.693;
- k=2, z=3: 1 ≥ (log 3)/2 ≈ 0.549;
- k=6, z=4: 1 ≥ (log 4)/3 ≈ 0.462.

## R04 (P3) — An uncited reference, and four references with no manifest entry

**Location.**
- `README.md:4331`: "**IEANTN.** … Cited in no section of this roadmap."
- `README.md:4325` (DAVENPORT-51), `:4327` (LANG-WEIL-54) and `:4329` (PNT-PLUS).

**Claim.**
- A reference that no statement cites is padding, and "Cited in no section of this roadmap" is not part of a reference.
- None of these four ids has an entry in the package's `sources.toml`, whose 38 ids cover every other reference.
- PNT-PLUS locates declarations in a moving repository without a commit.

**Witness.** `packages/SieveMethodsAndPrimePatterns/sources.toml` has no `id = "IEANTN"`, `"PNT-PLUS"`, `"DAVENPORT-51"` or `"LANG-WEIL-54"`.

**Repair.**
- Delete the IEANTN entry.
- Record the other three through `sources fetch`:
  - DAVENPORT-51: DOI 10.1112/jlms/s1-26.3.179, the theorem on pp.179–183 and the 1964 correction on p.580;
  - LANG-WEIL-54: DOI 10.2307/2372655, Theorem 1 and Lemma 1;
  - PNT-PLUS: the repository URL at a fixed commit.
- Mark these uncertified where paywalled.
- Add that commit to the PNT-PLUS reference line.

## R05 (P3) — Padding: two Gram inequalities are one-step specialisations of the uniform-row inequality

**Location.**
- `Suggested.lean:66–69` (`SieveGram.sum_norm_inner_sq_le_max_row`) and `:73–76` (`SieveGram.sum_norm_inner_sq_le_of_diag_offdiag`).
- The module docstring lists both as headlines at lines 12–13.

**Claim.** Both are `sum_norm_inner_sq_le_of_row_le` at a particular C. The README says so itself: line 11 calls them "deduced from it", and the proof sketches at lines 506 and 518 say the same. They are API variants, not headline theorems.

**Witness.** In a scratch copy, each closes in one step from `sum_norm_inner_sq_le_of_row_le`, and the file elaborates without error:
- `simpa [mul_comm] using sum_norm_inner_sq_le_of_row_le (C := univ.sup' …) y x (…) (fun i => Finset.le_sup' _ (Finset.mem_univ i))`;
- `sum_norm_inner_sq_le_of_row_le y x hDO fun i => by rw [← Finset.add_sum_erase _ _ (Finset.mem_univ i), inner_self_eq_norm_sq_to_K]; simpa [norm_pow] using add_le_add (hdiag i) (hoff i)`.

**Repair.**
- Delete both from `Suggested.lean` and from the docstring's headline list.
- Keep both as README targets in §0.4 without their backticked Lean names (lines 500 and 512).

## Verified sound

**Gate, dependencies, build.**
- My rerun of the gate on this head ends with every scanner 0, `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The dependency check for this README prints `depcheck: 237 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean Suggested.lean` exits 0 with 45 `declaration uses sorry` warnings and nothing else.
- The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.

**Lean form.**
- The 76 elaborated declarations of `signatures.md` keep their binders; for example the `SieveGram` theorems keep `[RCLike 𝕜] [InnerProductSpace 𝕜 E] [Fintype ι]`.
- One-tactic probe: I replaced each `sorry` with `first | rfl | simp | norm_num | positivity | infer_instance | decide | sorry`, each closed with `done`. All 45 `sorry` warnings remain.
- There is no `set_option`, no `lemma` and no sorry'd data, and `import Mathlib` is followed by three existing Tau Ceti modules.

**Library declarations opened at the pins.**
- Mathlib `NumberTheory/SelbergSieve.lean`:
  - `BoundingSieve` (:54, with `nu_pos_of_prime` and `nu_lt_one_of_prime`);
  - `multSum` :163, `rem` :169, `siftedSum` :172, `mainSum` :175, `errSum` :178, `selbergTerms` :277.
- Mathlib has no Kronecker symbol, large sieve, Vaughan identity or Brun–Titchmarsh.
- Tau Ceti:
  - `ZLattice.successiveMin` (`Algebra/Module/ZLattice/SuccessiveMinima.lean:111`, zero-based `sInf`), `finite_setOf_gauge_le` :300, `monotone_successiveMin` :416, `successiveMin_pos` :424, `exists_basis_mem_flag_of_gauge_lt_successiveMin` :552;
  - `Ideal.powerResidueSymbolIdeal` (`NumberTheory/NumberField/PowerResidueSymbol/Ideal.lean:94`, a `MulChar` built from the prime symbols);
  - `TauCeti.IsSemialgebraic` (`Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75`);
  - `fundamentalDiscriminantChar` (`…/FundamentalDiscriminant/Character.lean:38`).
- Tau Ceti has no sieve or prime-distribution objects.

**Cross-roadmap citations resolved.**
- On main:
  - IntegralLattices: Layer 0 at `TauCetiRoadmap/IntegralLattices/README.md:536`, Layer 3 at :744. So the overlaps lead that only #1797 defines Layer 0 is a false positive; it comes from the second folder `Completed/IntegralLattices`.
  - ThetaSeries 2H (`kroneckerSym` :562, `kroneckerChar` :573).
  - ClassicalArithmeticCompletion §1.57 (:1977) and §1.66 (:2195).
  - QuadraticFormInvariants 6C.
  - GlobalNumberFields Layer 3 (:337), 3C (:365) and Layer 11 (:571).
  - Chebotarev Layer 13 (:593).
  - Isoperimetry I2 (:144, convex-body isoperimetry).
  - RiemannianGeometry R4.9.6a (:856, signed turning and tangent-angle lift).
  - RealAlgebraicGeometry Layers 5 (:374) and 6 (:437).
  - SchemeAndStackFoundations `generic_fibre_spreading`, `fibre_locus_constructible` (:806–808), `weil_bound` (:7332) and `bezout_inequality` (:7338).
  - ReductiveGroups Layer 7a (:690).
  - ReductiveGroupsPartII RG2.4.4: `Decomposition.IsAbsolutelyAlmostSimple` at README :6371 and `Suggested.lean:253`.
- AnalyticNumberTheoryPartI at #1126:
  - §§0.10, 0.11, 0.18 (`character_psi_le`, with (log N)⁴ and no exceptional term), 0.21, 0.26, 0.31, 0.32;
  - §0.34 (`landau_siegel_exclusion`);
  - §1.5a (3π/2);
  - §§3.1, 3.3, 3.4, 3.22, 3.24 (the τ² estimate), 3.26, 3.34 (`smoothCount_dickman`) and 3.35.
- AnalyticNumberTheoryPartII at #1167: §5.29.
- AdelicAlgebraicGroups at #792: §1.1 and §4.2 now own strong approximation (`Approximation.HasStrongApproximation`), and its dependency check prints 0 problems. The previous cycle is closed.

**Previous findings (review at f07c3fe) repaired.**
- The joint-spin theorem is stated (`Suggested.lean:743`).
- "Hypotheses of §4.6" is gone.
- `zetaFourthMoment.divisorDiagonal` is replaced by the §3.24 estimate (README :79).
- ReductiveGroupsPartII is restored (:141–143).
- The Tau Ceti `ZLattice` names and `AddSubgroup.index_range_nsmul` are cited (:1025).
- KM-21 (4.3) is cited at p.18 (:4030) and Lemma 9.12 at p.226 (:1379); KM-16RANK is removed.

**Ownership against open pull requests.** I searched the open heads by object, which turned up R01 and R02. Every other object is cited, not restated:
- CircleMethodThreePrimes (#1803, :43) consumes §2.4 `vaughan_identity`.
- ExplicitCharacterSumsAndSieves (#1948) consumes the forbidden-residue sieve and Selberg's weights.
- GeometryOfNumbersAndQuadraticArithmetic (#851, :234, :1255) cites §0.11a for Henk and Davenport.
- ArithmeticStatisticsPartIII requests Davenport's lemma through GeometryOfNumbersAndQuadraticArithmetic §4.1.
- HeightsRationalPointsAndObstructions (#1017) owns only a function-field-place Lang–Weil.
- Maynard, Barban–Davenport–Halberstam, Jutila's 1975 lemmas and Chen occur nowhere else as targets.

**Sampled locators read at the source.**

| Target | Read at | Result |
|---|---|---|
| 0.1 | HB-SIEVES lines 80–217: (1.1) p.2, (1.2)–(1.3) and Corollary 1.1 p.3, (1.5)–(1.8) p.5; KED-ANT-11 line 381 (Lemma 11.1) | correct |
| 0.2 | KED-ANT-11 lines 411 (Lemma 11.2, weighted inclusion–exclusion), 500 (Definition 11.6) | correct |
| 0.7 | KHAYUTIN-19 lines 3415–3484: Definition 9.1(1)–(5) p.221, Lemmas 9.2–9.3 pp.221–222, Definition 9.6 p.222; lines 3791–3828: Definition 9.15 p.227, Remark 9.16 and Corollary 9.17 p.228; Definition 10.5 p.242 (line 4802); Proposition 10.10 p.245 (line 4950) | correct |
| 0.8 | KHAYUTIN-19 lines 6112–6529: Lemma B.1 and Remark B.2 p.265, Proposition B.3 pp.265–266, Lemma B.4 pp.266–268, Proposition B.5 pp.268–269, Corollary B.6 p.269, Proposition B.8 pp.270–271 | correct; the three corrections the README records are real (Source issues) |
| 1.4 | KHAYUTIN-19: Theorem 9.7 p.222; Lemma 9.8 and (35)–(37) pp.223–224; Lemma 9.9 pp.224–225; 9.11 p.225; 9.12 p.226; 9.13 p.226; Lemma 9.18 and Remark 9.19 p.228; 9.20 and 9.21 p.229, with (41)–(44) to p.230; 9.23 p.231; Definition 9.24 and Proposition 9.25 p.235; (50) and Proposition 9.26 p.236 | correct |
| 1.5 | BSKK-23 lines 2263–2526: Lemma 8.2 p.39, (8.1)–(8.7) pp.39–41, v_p=⌈3/2+2log ℓ_p⌉ at line 2367, Lemma 8.3 pp.41–42 | correct |
| 2.2 | BOMBIERI-1971 OCR: Theorem p.401 (line 33), Proposition 1 and (3)–(5) p.402, the bins I_m with (m+1)δ≤1/2 and the nearest-integer taper p.404 (lines 100–119) | correct |
| 2.7 | JUTILA-ORIGINAL page image p.194: Lemma 2 XY log⁸X, Lemma 3 (12) with Z₈^(1/4) log⁶N, (16) N²X log⁸N, (17); HB-REAL-95 Corollary 4 p.238 (lines 243–254), proof p.267 (line 2571); SS-23 Lemma 6.3 p.726 (line 2803); SMITH-17 Proposition 6.6 p.62 (line 3226); KP-22 Proposition 7.6 p.61, (7.11) p.63 (line 2996) | correct; (16)–(17) give log^(21/4)N ≤ log⁶N, so the log⁶ statement is supported |
| 2.9 | KED-chap-largesieve Lemma 15.1 (line 391), Theorem 15.5 and Exercise 15.4.4 (lines 512–527); KED-ANT-16 Theorem 16.2 (line 401), Theorem 16.4 (line 485), Lemma 16.5, Definition 16.6, Theorem 16.7 and line 565 | correct |
| 3.1 | MAYNARD-2015 (1.3) p.384 (lines 48–55), footnote line 86 | correct |
| 3.4 | KED-ANT-18 Definition 18.1 (line 355), Lemma 18.2 (373), Theorem 18.3 (429), Theorem 18.5 (630), Corollary 18.6 (652); KED-chap-bombieri Theorem 17.4 (line 431) | correct |
| 4.5 | MAYNARD-2015 §2 (2.1) p.386, Proposition 4.2 p.389 | correct |
| 5.2 | HB-SIEVES: (5.1)–(5.3) pp.30–33 (lines 1466–1673), Theorem 5.1 p.35 (1768), Corollary 5.1 p.36 (1791), Fundamental Lemma p.38 (1908), (6.1)–(6.4) pp.39–44, Theorems 6.1 p.42 and 6.2 p.45, Example 2 p.46; IWA-ROSSER Theorem 1 p.172 (line 79) | correct; HB's Theorem 5.1 sign corrected in the README (Source issues) |
| 5.3 | KM-21 Conjecture Cₙ p.7 (lines 340–345), Corollary 2.2 p.7 (353) | correct |
| 5.6 | KM-21 Theorem 1 and Theorem 2 p.2 (lines 70–93), (2.4) p.5, (2.5)–(2.6) p.7; FIMR-13 Lemma 2.1 p.6 (line 299), Proposition 5.1 p.22, Proposition 5.2 p.24 (line 1304) | correct |

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 Legendre identity | support 1..10, P=6; support {0,1,2,3,6} | S=3=10−5−3+1; S=1=5−3−3+2 | holds |
| 0.1 remainder cutoff | P=6, c(2)=1, c(3)=−1, R₂=R₃=1 | errSum=2 | holds |
| 0.2 finite family | n(10−n), 2≤n≤8 | 4 labels {16,21,24,25}, multSum(1)=7 | holds |
| 0.3 residue sieve | Q={2,3}, Ω₂=∅, Ω₃={1}, samples −2..3; label of 33 | P=3, S=4; label 1155 | holds |
| 0.4 `selberg_weighted_inner` | x=1, y=(1,2); single y=1/2 with squared denominators | 1/3+4/6=1; squared denominators give 4>1 | holds; the Check excludes the wrong model |
| 0.4 `…_of_row_le` | same data; two equal unit vectors | 5≤6; 2≤2 | holds |
| 0.5 `remainderMass` | P=6, every R_d=1, D=1,2,3,6,7 | 0,1,2,3,4 | holds |
| 0.6 `discriminantValue` | (5,2),(8,2),(8,3),(−3,2),(−7,2) | −1,0,−1,−1,1 (−3%8=5, −7%8=1) | Kronecker values |
| 0.7 ρ, ρ̃ | Q=x₀ at 9; Q=0 at 4; Q=2 at 2,4; Q=x₀² at 4 | 9/9; 16/0; ρ̃(2)=4, ρ̃(4)=0; 8/4; lifting 4·4=4·8−16 | holds |
| 0.7 θ_Q | Q=x₀ at 9 and 6 | 5/3; 10/3 | holds |
| 0.8 conics | x²−y² mod 3; x²+3y²+12 mod 3 and 9; B.8 at p=3, u=u_A=ω=1, k=1, ε=−1 | 5 (source 1); 3 then 0; 18 (source 9) | README corrections right |
| 0.9 ℤ[i] counts | r(5), r(25), r(3), r(9) | 2, 3, 0, 1 | holds |
| 1.1 uniform lower bound (R03) | (k,z)=(1,2),(2,3),(6,4) | 1 ≥ 0.693, 0.549, 0.462 | holds with c=1 |
| 1.2 `fundamental_estimate` | κ=1, K=2, u=10 and 20; X=0, R₁=1 | δ=1024 and 0.04649; −1≤1≤1 | holds; a lower 1+δ fails |
| 1.3 Selberg weights | P=6, ν(2)=1/2, ν(3)=1/3, z=4 | G=5/2, λ=(1,−4/5,−3/5,0), main sum 2/5 | holds |
| 1.4 character Gram Check | (0,0),(1,0) with ±1, moduli 1,2 | sums 0,2,0,2; total 8, energy 2 | holds |
| 1.5 BSKK v_p | ℓ=11 | ⌈1.5+2log 11⌉=7 ≤ 3log 11≈7.19 | holds |
| 1.6 `prime_interval_upper` | y=2 | right side ≥ 5.77, left side ≤ 2 | holds |
| 2.2 taper | δ=1/2, L=2; δ=3/10, L=3 | 3.645≤4; 6.046≤6.667 | holds |
| 2.2 interval vector and phase | H=2, L=1; H=2, M=−2, a=(1,i), x=1/4 | (0,0,a,b,0); sum 0, opposite phase 2i | holds |
| 2.4 `vaughan_identity` | n=12, U=V=2; n=4, U=V=1; n=0 | 0+log2−0−log2=0=Λ(12); log4−log2=Λ(4); 0=0 | holds |
| 2.7 Jutila | X=3, Y=1; X=12, Y=1; X=8, N=2, a₂=1 | 1; 9 (8 fundamental); 3 | holds |
| 2.7 `prime_quadratic_bilinear` | K=4, L=9 | K√L+L√K=30 ≤ 2KL/√min=36 | holds |
| 2.8 Farey | p=2, ℓ=1, m=2 | words (1,0),(1,1); 2≤4 | holds |
| 2.9 sharp primitive and Linnik | Q=H=1, a=2+i; N=16, ε=1/2 | 5=5; 28 smooth numbers, 511 | holds |
| R01 widened `sharp_additive_largeSieve` | δ=1, one point, a=(1,1) | 4≤4 | true for 0<δ≤1 |
| 3.0 `small_conductor_maximal` | χ mod 3, x=y=3, s=1 and s=2 | −log 2; 0 | holds |
| 3.1 `PrimesHaveLevel` | discrepancy(10,3), discrepancy(5,3), θ≤0 | 1, 3/2, empty sum | holds |
| 3.2 convolution | δ₂*δ₃ at q=5 | 3/4 | holds |
| 3.4 variance and correlation | point mass at 1, Q=3; Δ=1/16, x=16, y=1, Q=2 | 1/2; 3 against √(297/8)≈6.093 | holds; Δ on x |
| 4.3 M_k | k=1; triangle; F=x on the triangle | M₁=1; 4/3; I=1/12, J=1/20 and 1/30 | holds |
| 4.6 Gram forms (Lean `maynardGramI/J`) | k=1..4, b+2c≤4, random rationals, against exact simplex integration | all equal | the Lemma 8.2 theorems are not false |
| `maynardM_five_ge` | k=5 witness | I=29509/1222452000, J/I=1417255/708216≈2.001162 (also by direct integration) | holds |
| `four_lt_maynardM_105` | 42 monomials, k=105 | largest generalised eigenvalue ≈4.0020698; an exact rational vector has J/I≈4.0020698>4 | holds |
| 4.5 `infinite_many_primes_of_level` | k=0; k=1 | M₀=0, so every n; M₁=1, so one prime | holds |
| 5.2 linear sieve and Rosser | F(1), f(3); d=2, D=8; Λ₂, Λ₃ | 2e^γ, 2e^γlog2/3; upper 0, lower −1; 1.834, 2.772 | holds |
| 5.3 Cₘ Check | χ mod 3 on (0,2] and (1,3] | 0 and −1 | holds |
| 5.6 spins | 3−t at σ and σ²; 4−t and −(4−t); t²(3−t) | −1, 1; −1, 1; −1 | holds |
| 5.6 kernel reciprocity | α=1+8t, β=1+16σ(t) | N=377 and 3569; Φ(α,β)=1, Φ(β,α)=−1; infinite factor −1 | holds |
| 5.6 prime saving | n=3, \|S\|=1, δ=1 | 1/5994 | holds |
| `joint_spin_sign_equidistribution` | S=∅; units under the hypothesis | limit 1; U⁺=U² gives every principal ideal a totally positive generator | holds |
| `lattice_count_lt_successive_minima` | unit square; d=1 | 9<18; 3=3, so d≥2 is needed | holds |
| `lang_weil_uniform` | x²−2y², p≡±3 mod 8; e=0; S={1} | 1 point against p, radical not prime; a geometric point is rational; ⊥ dimension | holds |

## Not verifiable

- FIMR-ERRATUM-2015, BGS-10 and DFI-1997 (settled uncertified), and CHEN-73-CN, HR-SIEVE and RICHERT-1969 (settled waived): cited by their locators; I did not re-request them.
- DAVENPORT-51 and LANG-WEIL-54: not in the cache or the manifest (R04). These are journal articles behind publisher paywalls, and they are outside the sample.
- IWA-ROSSER Theorem 4: the OCR of the scanned pages has no readable heading for it. Theorem 1 p.172 was located.
- PNT-PLUS was read from the repository's main branch; no commit is pinned (R04).

## Source issues

- **Misprint** in KED-ANT-12 at Theorem 12.2, §12.4 (KED-ANT-12 line 661): the source says V⁻(z) exceeds (1+e^(β−s)K¹⁰)V(z); it should be (1−e^(β−s)K¹⁰)V(z), as in its own "Consequently" display; affects a stated result.
- **Misprint** in HB-SIEVES at Theorem 5.1, p.35: the source says M⁻(z,y) ≤ W(z){f(s)+O(e^(−s)(log y)^(−1/3))}; it should be ≥, and only for y ≥ z²; affects a stated result.
- **Misprint** in HB-SIEVES at the Brun–Titchmarsh Theorem (3.6), p.18: the source says the bound holds for x ≥ 4φ(k); it should be x ≥ 4k, the range of its derivation, since log(x/k) < 0 when x < k; affects a stated result.
- **Error** in KED-ANT-18 at Corollary 18.6, §18.3: the source says the bound is (x+Q)^(1/2)(Δy+Q)^(1/2); it should be (Δx+Q)^(1/2)(y+Q)^(1/2), because only f satisfies (18.1.1); affects a stated result.
- **Error** in KHAYUTIN-19 at Lemma B.4, proof Case II, p.267: the source says the nonzero zeros of q₀ modulo p number 1−(disc q₀/p); it should be (p−1)(1+(disc q₀/p)), and x²−y² modulo 3 has 4; affects a stated result.
- **Misprint** in KHAYUTIN-19 at Proposition B.5, proof (68), p.268: the source says u p^(l+2ϖ)x₀² and −4ωu u_A; it should be u p^(l+ϖ)x₀² and +4ωu u_A, since −ωD=4ωuA; affects the proof.
- **Error** in KHAYUTIN-19 at Proposition B.8, (69), p.270: the source says f contains (ωu/p); it should be (−ωu/p), and at p=3, u=u_A=ω=1, k=1, ε=−1 the count is 18, not 9; affects a stated result.
- **Misprint** in MAYNARD-2015 at Lemma 8.1, p.409: the source says G_(b,j) sums over r=1,…,b; it should include r=0, so G_(0,j)=1, and at k=5, a=2, b=0 the integral is 1/2520; affects a stated result.
