# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at d8a67db)

**Verdict:** needs changes

This is a full review at the same head the previous review read: the folder has not changed (0 changed lines), and nothing outside `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/` is in the diff against main. The previous review's single finding concerned the pull-request description and is not repaired, because the description is unchanged. The whole roadmap was re-reviewed: every seeded sample target was read at its locator in the cached texts, every cross-roadmap citation was resolved on main or at the named open head, the gate and dependency check were re-run, `Suggested.lean` was re-elaborated with a one-tactic probe on every theorem, and the adversarial table below was recomputed from the Lean definitions rather than carried.

## R01 (P3) — ModularForms §0.2 and the normalized Fricke convention exist only at the open ModularForms revision, which the description still does not name

This is the previous report's R01 (carried since round 6), not repaired.

**Location.** README line 836: "*Needs:* TauCetiRoadmap.ModularForms §0.2; Mathlib `ModularForm.eta_ne_zero`, …"; the same citation at lines 13, 47, 48, 826, 846, 976 and 1770. Line 101: "the normalized Fricke operator, (√N)^(2−k) times the native weight-k slash by (0,−1;N,0)"; line 759: "Conventions (normalizations of Uₚ and of the Fricke operator)".

**Claim.** §5.2 consumes ModularForms §0.2 (eta's SL₂(ℤ) transformation with its τ-independent constant ε(γ) and Dedekind-sum closed form), and §4.8a consumes ModularForms' normalized Fricke convention.

**Witness.** ModularForms on main (content checkout b67091a7) has no heading `0.2`: its layer headings run from "Layer 0: diamond operators and modular forms with character" (line 259) and a grep for `0.2`, `Dedekind` or `eta multiplier` finds nothing; Fricke appears only in Layer 6 (line 678). The open revision #1706 (head 75cafd52) has "### 0.2 The eta transformation and eta quotients" at its line 395, cites it at lines 28–33 and 124–125, and has the normalized Fricke operator at line 95; its line 1541 names this roadmap only as a consumer. The description's "Depends on" list is #1172, #925, #851, #1314, #1063, and its merge order ends "#1314 (HabiroCyclotomicCompletions) → this pull request": #1706 is absent from both. The overlap tool reports the same: "ModularForms §0.2 … #1706 defines it at its head (main does not): that pull request must merge first".

**Repair.** Description only. Add ModularForms (#1706) to "Depends on" and place it before this pull request in the merge-order paragraph. No README or Lean change: the README cites the roadmap by name and section, as it must. Tested: #1706 does not cite this roadmap as a supplier, so no cycle arises, and `gate --depcheck` prints 0 problems at this head.

## Previous findings

- R01 (description names no #1706) — not repaired; raised again above. The folder is unchanged since the head the previous review read, so there was nothing else to check.

## Verified sound

### Gate and dependency check

- `gate … --base origin/main` at d8a67db, run for this review: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- `gate --depcheck … --movable`: `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Merge order: this roadmap is at line 244; its open suppliers HabiroCyclotomicCompletions (47), GeometryOfNumbersAndQuadraticArithmetic (52), AutomorphicSpectralTheory (95), ArithmeticStatisticsPartIV (113) and MetaplecticAutomorphicForms (149) precede it. ComplexKahlerGeometry, PDE, ClassicalArithmeticCompletion, PadicMeasuresIwasawaAlgebras, ThetaSeries, IntegralLattices, StandardDistributions and ContourIntegration are on main (the last two completed). `git diff --stat origin/main...HEAD` outside the folder: empty.

### Elaboration, signatures, padding

- A scratch copy of `Suggested.lean` with every `sorry` replaced by `first | rfl | simp | infer_instance | decide | (intro; simp) | (constructor <;> simp) | (refine ⟨1, one_pos, fun _ => 1, ?_⟩; simp)` and `#check @name` for all 41 declarations was elaborated with `lake env lean` from the worktree (18 s, Mathlib 6b7abb3c, Tau Ceti a91d3aaf). All 19 sorried theorems fail every alternative (19 "unsolved goals" or constructor-mismatch error sites at lines 58, 66, 77, 97, 123, 141, 151, 160, 172, 199, 207, 215, 256, 270, 282, 339, 348, 380, 405); none is padding. The 22 definitions have real bodies on native carriers.
- The worker's `signatures.md` lists 41 declarations with 0 lost binders; the file has no `variable` line, so every hypothesis is in each signature. The `#check` types agree with the README statements: `rankCompletion_modular` has `1 < t`, `0 < j`, `j < t`, `γ ∈ CongruenceSubgroup.Gamma N` with `0 < N`, and the principal `Complex.sqrt`; `rankResidueDeviation_mock` has `0 < t` and `r : ZMod t`; the two Lerch laws carry `0 < τ.im` and the two lattice-avoidance hypotheses.
- No sorry'd data, no `set_option`, imports `import Mathlib` plus `TauCeti.Analysis.SpecialFunctions.Erf` only (the module exists at the pin: `TauCeti/Analysis/SpecialFunctions/Erf.lean`).

### Headline theorems

The README (line 133) lists the acceptance test's headlines; all are in the file: the q-binomial, Euler, ₁ψ₁ and Bailey theorems (Layer 2), both Rogers–Ramanujan counting theorems and the analytic identities, the quintuple product (Layer 3), rank/crank equidistribution and the prime-power congruences (Layer 4), the completed Lerch elliptic and modular laws (Layer 5), the third-order f/rank identity and the T and S laws of H₃ (Layer 10), the common-multiplier law of the root-of-unity rank completions and the rank-residue deviation theorem (Layer 11). The module docstring names, with the missing carrier, the headlines that are not statable: Layer 7's signature-(r−1,1) transformations, Layer 8's Fourier and xi exact sequences, Layer 9's Jacobi decomposition, and the shadow, harmonicity and cusp-growth assertions of Layers 6, 10 and 11; the fifth- and seventh-order T and S laws are deferred there to the third-order acceptance test with the mechanism named. No headline is forced through a stand-in.

### Library declarations opened at the pins

Mathlib: `ModularForm.eta` (`DedekindEta.lean`:56, `𝕢 24 z * ∏' n, (1 - eta_q n z)`), `eta_ne_zero` (:113), `multipliableLocallyUniformlyOn_one_sub_pow` (:69); `eta_comp_eq_csqrt_I_inv` (`Discriminant.lean`:135), `ModularForm.discriminant` (:49, `(eta z)^24`), the cusp form `discriminant` (:236), `discriminant_T_invariant` and `discriminant_S_invariant` (:27–28); `jacobiTheta₂_term` (`JacobiTheta/TwoVariable.lean`:45, exponent `2πinz + πin²τ`), `jacobiTheta₂` (:251), `jacobiTheta₂_functional_equation` (:465), `hasDerivAt_jacobiTheta₂_fst` (:336); `Complex.sqrt a = a ^ (2⁻¹)` (`RCLike/Sqrt.lean`:41); `CongruenceSubgroup.Gamma` (`CongruenceSubgroups.lean`:41) with `Gamma_mem'` (:46); `ModularForm.slash_apply` (`SlashActions.lean`:141: `σ g (f (g • τ)) * |det g|^(k−1) * denom g τ^(−k)`, so at weight 0 the native slash by (0,−1;N,0) carries 1/N, as the §4.8a Check says); `Nat.Partition.ofSums` (`Partition/Basic.lean`:87), `restricted` (:205), `conjugate` and `conjugate_conjugate` (`YoungDiagram.lean`:76, 81), `rowLens_ofPartition_eq_sort_parts` (:42), `coeff_genFun` (`GenFun.lean`:60), `hasProd_genFun` (:170), `hasProd_powerSeriesMk_card_restricted`, `card_restricted_eq_card_countRestricted`, `card_odds_eq_card_distincts` (`Glaisher.lean`), `pentagonalSeries` (`Pentagonal/PowerSeries.lean`:81), `hasProd_one_sub_X_pow`; `Multiset.sort` (`Multiset/Sort.lean`:30); `PowerSeries.isUnit_iff_constantCoeff` (`Inverse.lean`:109), `invOfUnit` (:82), `coeff_expand` (`Expand.lean`:110); `ZMod.coe_mul_inv_eq_one` (`ZMod/Basic.lean`:778), `val_lt` (:61, `[NeZero n]`), `natCast_zmod_val` (:205); `Real.Gamma_eq_integral` (`Gamma/Basic.lean`:319), `GammaIntegral_convergent` (:66); `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable` (`Log/Summable.lean`:222, `[CompleteSpace R] [NormMulClass R]`).

Tau Ceti: `TauCeti.Real.erf` (`Erf.lean`:51, `2/√π ∫₀ˣ exp(−t²)`), `erfc` (:54), `erf_zero` (:64), `erfc_zero` (:68), `erf_neg` (:72), `hasDerivAt_erf`, `erf_pos` (:140), `erf_lt_one` (:186), `abs_erf_lt_one`; `TauCeti.lowerIncompleteGamma` (`IncompleteGamma.lean`:110) with `_eq_integral`, `hasDerivAt_`, `tendsto_…_atTop`; `modFormCharSpace` (`DiamondOperators.lean`:315), `cuspFormCharSpace` (:279), `mem_modFormCharSpace_iff_nebentypus`, `mem_cuspFormCharSpace_iff_nebentypus`; `TauCeti.CuspFormClass.eichlerIntegral_slash_apply` (`EichlerIntegral/Transformation.lean`); `TauCeti.Contour.classicalResidueTheorem_circle`, `homologyCauchyTheorem` (`Analysis/Contour/`).

### Cross-roadmap citations resolved

- ModularForms: §0.2 and the normalized Fricke operator only at #1706 (R01). Layer 10A on main (line 1052, cusp count, elliptic counts, genus via Riemann–Hurwitz) and at #1706 (line 1150, with the Γ₀(11) genus-one Check); Layer 10B on main (1068) and at #1706 (1173). The arithmetic Uₚ normalization is on main (lines 31–37).
- ComplexKahlerGeometry on main: K2 at line 193, K5b.1 at line 1208.
- PDE on main: Layer 5 at 1827 with §§5.1–5.7 = E20–E26 at 1837–2132; §3.1 at 1304.
- ClassicalArithmeticCompletion on main: §2.10 (2954), §2.31 (3619), §4.20 (8210), §4.40 (8809), §4.60 (9339), §4.61 (9366). (Line 13's "§4.7 … §4.8a" are this roadmap's own sections.)
- PadicMeasuresIwasawaAlgebras §2.9 on main (1788: `cartier`, `coeff_cartier`, `cartier_expand_mul` with `r < q`).
- ThetaSeries Layers 1–3 on main (423, 484, 587). ContourIntegration Layers 2–3 (completed; 159, 185). StandardDistributions Layer 2 (315, incomplete Gamma and error function). IntegralLattices on main: label 0G in the native rows (438, 455), 1G–1H (132–207).
- At open heads: AutomorphicSpectralTheory §1.16 (#925, line 1249, `weight_laplacian_slash` 1258, Powers bullet 1259); GeometryOfNumbersAndQuadraticArithmetic §4.3 (#851, heading 1527, with `qPochhammer`, `jacobiProduct`, `kronecker_single_identity` and `appell_lerch_difference_identity` at 1601–1603 inside it); HabiroCyclotomicCompletions §1.1 (#1314, line 205 "Elementary q-calculus and its consumers", naming this roadmap's §§1.2–1.5 as consumers at 82); ArithmeticStatisticsPartIV §3.2 (#1172, line 129: Gaussian binomial coefficient 131, Cauchy q binomial theorem 164) and §3.9 (781, Euler q-binomial sum 797); MetaplecticAutomorphicForms §§2.4b (477), 2.5 (521), 2.6 (529), 4.7 (1245, `finiteWeil_conjugate` 1255), 6.18 (1769), 6.20 (1805), 7.1 (1835), 7.2 (1851), 7.49 (2379) at #1063; AutomorphicFormsOnReductiveGroups §4.5 (#1037, line 708).
- The worker's `citations.md` lead "BruinierFunke2003, §3" is a source key, not a roadmap; false lead. The overlap lead "IntegralLattices §0G only at #1797" is false: main has 0G.

### Ownership and duplication

`roadmaps grep -i 'mock theta|Appell.Lerch|Dyson.s crank|crank of a partition|rank generating function|Rogers.Ramanujan identit'` over the 464 open heads and main: the only other hits are GeometryOfNumbersAndQuadraticArithmetic (#851, the Appell–Lerch kernel this roadmap consumes from §4.3), HabiroNahmSeries (#1427, a consumer naming HabiroCyclotomicCompletions §1.1 and this roadmap) and HalfIntegralWeightModularForms (#1721, whose lines 174–175 defer harmonic Maass forms, mock theta functions, shadows and completions to this roadmap's Layers 5–9 and whose §3.3 consumes §5.2's multiplier). No second owner of the rank/crank theory, the Lerch completions or the mock theta vectors. Nothing in `Suggested.lean` restates a pinned declaration: `partitionRank`, `partitionCrank`, `partitionResidueCount`, `IsGapTwo`, `IsPlusMinusOneMod5`, `zwegersOddTheta`, `zwegersR`, `zwegersMu`, `rankGenFun`, `rankCompletion`, the third-order functions and `rayPeriod` have no Mathlib or Tau Ceti counterpart at the pins (grep for `crank`, `Appell`, `Lerch`, `mockTheta`, `Zwegers` in both libraries: none).

### Declared gaps

The three gaps are declared in `design/plan.json` and stated under the suppliers' subsections with the same slugs (lines 95, 103, 123). Each `needs` sentence is one statement with its hypotheses; none asks for what the pins, main or an earlier roadmap provides (ComplexKahlerGeometry K2 and K5b.1 give the Dolbeault comparison and Serre duality, not the vanishing; PDE Layer 5 is smooth/Schauder regularity, not analytic; MetaplecticAutomorphicForms §§2.4b–2.6 build the cover, not the pair-model comparison).

### Seeded sample, read at the locators

- 2.7 (Andrews1986): Bailey's Lemma (2.3)–(2.6) at lines 93–102, pp. 114–115 (page marker 96 = p. 115); the limiting identity (3.1) at line 156 on p. 116 (page marker 130). The OCR of (2.4)–(2.6) is garbled (only the equation numbers survive), so the transformed pair was checked by exact computation (table).
- 3.1 (Gasper1995): (1.3.2)–(1.3.4) at lines 263–272, the q-binomial in Gaussian form.
- 3.3 (Gasper1995 (4.2.11)–(4.2.12) at 1672–1682; Pak2002 §7.1.1–7.1.3 at 3703–3755, pp. 38–39, with "parts ≡ ±1 mod 5" and "differ by at least 2" at 3746–3748).
- 4.1 (AndrewsGarvan1988 rank at line 10, crank definition at 80–83 with "parts larger than the number of ones"; Zagier2009 898–922).
- 4.2 (AndrewsGarvan1988 (1.4)–(1.11) at 33–63: weight (−1)^#π₁, crank #π₂−#π₃, symmetry (1.9)).
- 4.6 (BevilacquaChandranChoi2019 39–44: δ_(ℓ,k) the unique element of {0,…,ℓᵏ−1} with 24δ ≡ 1, and the three congruences with 7^(⌊k/2⌋+1)).
- 5.3 (Zwegers2002 Definition 1.6 and Lemma 1.7 at 485–505: E(z)=2∫₀ᶻe^(−πu²), E(x)=sgn(x)(1−β(x²)), β(x)=∫ₓ^∞u^(−1/2)e^(−πu); Lemma 1.8 proof split at 532–535).
- 5.4 (Zwegers2002 Definition 1.1 and Proposition 1.2 at 217–231: the six properties, p. 6).
- 5.5 (Zwegers2002 R at 506–518, Lemma 1.8 at 521, Propositions 1.9–1.10 at 640, 680).
- 5.7 (Zwegers2002 Theorem 1.11 at 734–751: (1) the joint shift law, (2) the modular law with v(γ)^(−3)(cτ+d)^(1/2)e^(−πic(u−v)²/(cτ+d)) and v(γ)=η(γτ)/((cτ+d)^(1/2)η(τ)); Zagier2009 Theorem 2.1 at 327–339 with μ̂=μ−½R, i.e. the normalization comparison of §5.7).
- 6.2 (Zwegers2002 Theorem 1.16 at 835–849: a∈(−½,½), the −τ̄ and 0 integrals; Lemmas 1.18–1.19 at 853, 884).
- 7.1 (Zwegers2002 §2.2 at 1275–1310: C_Q with B(c,c₀)<0, S_Q primitive isotropic, R(c), D(c); Definition 2.1 at 1311–1341).
- 8.4 (BruinierFunke2003 395–423: ODE b″−b+(k/w)(b′+b)=0, H(w)=e^(−w)∫_(−2w)^∞e^(−t)t^(−k)dt, convergence for k<1, the two asymptotics, and the n=0 modes 1, v^(1−k)).
- 8.7 (Zagier2009 §5 at 640–735: the exact sequence 0→M!_k→𝕄_k→M_(2−k)→0, the shadow definition with g*, and the ŷ-description; BruinierFunke2003 (3.2a)–(3.2b) at 423–438).
- 10.1 (BringmannOno2006 (2.1)–(2.2) at 270–278: ω with (q;q²)²_(n+1) and F=(q^(−1/24)f, 2q^(1/3)ω(q^(1/2)), 2q^(1/3)ω(−q^(1/2))); (2.3) at 279–284; Zagier2009 §1 at 160–200 for the third- and fifth-order definitions).

Also read for the headlines: Zagier2009 Theorem 7.1 at 929 with Remark 2 (933) and its proof (937–951), the corollary at 952–965; BruinierFunke2003 H_k definition at 366–379 (k≠1, finite-index Γ″, C², exponential growth), the regularity remark at 382, H⁺ at 487–489, Theorem 3.7 at 626, Corollary 3.8 at 697–699.

### Adversarial table

All rows were computed for this review in double precision from the Lean definitions (series, products, `math.erfc`, Simpson on the ray integral with t=u², 14000 panels, u ≤ 14; partitions enumerated to n=40, p(n) to 1400). Values are the two sides or the competing candidates.

| Statement / object | Instances tried | Computed sides or competing values | Result |
| --- | --- | --- | --- |
| `qBinomial` | (a,q,z)=(0.3+0.2i,0.4−0.3i,0.5+0.1i); (2−i,−0.5+0.2i,−0.3+0.7i); q=0 | 1.8736257319−0.4684739279i both; 1.2420422671−1.0390689318i both; 1.2454545455 both (=1+(1−a)z/(1−z)) | Keep |
| `qBinomial_largeBase` | (0.5,2,0.7), |az/q|=0.175; (0.3,1.5+0.8i,1.1−0.4i) | 0.65 both; 0.5205210755+0.9375321564i both | Keep |
| `euler_qExponential` | q=0.4−0.3i, z=0.5+0.1i and 3−2i; q=0 | inverse 2.4874562632−0.3500169047i both; entire 1.8335105310−0.3850740854i and −4.1980805035−4.0442739905i both; q=0: 2 = 1/(1−z), 1.5 = 1+z | Keep |
| `ramanujanOnePsiOne_hasSum` | (2,0.3,½,0.6); (1.5+0.5i,0.2−0.1i,0.4+0.3i,0.5−0.3i); b=0: (2,0,½,½); (3,½,½,0.4) | −0.0920302027; 0.2752885866−0.5504013968i; 0 (P(b/(az)) has the factor 1−1=0 in the numerator term P(b/a)=1? no: numerator P(q/(az))=P(½)… the b=0 sum is 2.97×10⁻¹⁷ against 0); −0.1045806765: residual ≤5.7×10⁻¹⁶ | Keep |
| `ramanujanOnePsiOneTerm`, j=−1 (§2.5 Checks) | a=2, q=z=½, b=0; b=q | −2/3; 0 | Keep |
| `baileyPair`, `baileyLemma_transform` | exact ℚ: a=⅓, q=½, ρ=(3/5,−2/7), α=(1,2/3,−5/7,1/11,3,−2,7/13,0,½) | β′ₙ equals the pair relation of α′ for n=0…8; β′₁=5484/2717 both ways; §2.6 non-example α=β=δ₁ at a=1, q=½: right side 8/3 ≠ 1 | Keep |
| `rogersRamanujan_count`, `_count_two` | n=0…20 | gap-two vs ±1 mod 5: 1,1,1,1,2,2,3,3,4,5,6,7,9,10,12,14,17,19,23,26,31 (both); parts ≥2 vs ±2 mod 5: 1,0,1,1,1,1,2,2,3,3,4,4,6,6,8,9,11,12,15,16,20 (both) | Keep |
| `rogersRamanujan_hasSum` | q=0.45+0.3i; −0.6+0.1i | 1.2605476441+0.7632052939i and 0.9347715059+0.4255246886i; 0.7135856425−0.0432006090i and 1.2428781156−0.1057352275i; residuals ≤4.4×10⁻¹⁶ | Keep |
| `quintupleProduct_hasSum` | (q,z)=(0.3+0.2i,0.7−0.4i); (−0.5+0.1i,2+i) | 1.8340448725−0.8634664154i; 6.1995259290−7.1152754960i; residuals ≤2.1×10⁻¹⁴ | Keep |
| `partitionRank`, `partitionCrank` (§4.1 Checks) | (3,2,1,1),(1),(3,3),(2,2,2),() | rank −1,0,1,−1,0; crank −1,−1,3,2,0 | Keep |
| `rank_equidistribution_five_seven` | sizes 4,9,14,19,24 mod 5; 5,12,19,26 mod 7 | classes [1],[6],[27],[98],[315] all equal; [1],[11],[70],[348] all equal | Keep |
| `crank_equidistribution_five_seven_eleven` | sizes 4,9,14; 5,12,19; 6,17,28 | crank classes equal: [1],[6],[27]; [1],[11],[70]; [1],[27],[338]; rank mod 11 control at 6: (1,2,1,1,0,1,1,0,1,1,2), at 28: 332…344 | Keep |
| `partition_primePowerCongruences` | all ℓʳn+δ ≤ 1400, ℓ=5,7,11, r=1,2,3 | δ=(4,24,99),(5,47,243),(6,116,721); every value divisible by 5ʳ, 7^(⌊r/2⌋+1), 11ʳ (280,56,11; 200,28,4; 127,11,1 cases); p(243)=…≡245 mod 343 and ≡0 mod 49 | Keep |
| §4.6 δ Checks | M=13, 65, 1 | δ(13)=6, δ(65)=19 with 19 mod 13=6; M=1: d=0 satisfies 0<1 and 24·0≡1 (mod 1) | Keep |
| `thirdOrderF`, `thirdOrderF_rank` | q=0.3+0.25i; coefficients n≤6 | f=1.2056564842+0.0794678723i; Σ(signed rank counts)qⁿ to n=25: 1.2056564849+0.0794678713i (tail 10⁻⁹); counts 1,1,−2,3,−3,3,−5 | Keep |
| `zwegersOddTheta` (§5.1 Checks) | τ=0.17+1.1i; τ=i | ϑ′(0)=−2.6219290524−0.3451705427i vs −2πη³ (7.8×10⁻¹¹ by central difference); ϑ(0;i)=5.6×10⁻¹⁷; ϑ(¼;i)=−0.6435897640 | Keep |
| `zwegersMu`, `zwegersMuHat` (§§5.6–5.7 Checks) | τ=i, u=⅓, v=¼ | μ=−0.8941872843i; μ̂=−0.7325888912i; μ̂(u+1)=+0.7325888912i; wrong sign μ−(i/2)R=−1.0557856775i | Keep |
| `zwegersMuHat_elliptic` | (k,l,m,n)=(1,0,0,0),(0,0,1,0),(0,1,0,1),(1,−1,2,1),(−1,1,0,−2) at τ=0.17+1.1i | residuals 7×10⁻¹⁷, 1×10⁻¹⁶, 5×10⁻¹⁶, 3×10⁻¹⁶, 9×10⁻¹⁷ | Keep |
| `zwegersMuHat_modular` | S at (i,⅓,¼); T, −I, (2 1;1 1) at 0.17+1.1i; (1 0;2 1) at −0.3+0.8i; (3 −1;1 0) at 0.45+0.6i | S both sides 0.7167793626i; residuals 5.8×10⁻¹⁰, 4.6×10⁻¹⁶, 1.1×10⁻¹⁶, 1.3×10⁻¹⁰, 1.3×10⁻¹⁰, 8.9×10⁻¹¹ | Keep |
| `thirdOrderCompletion` (§10.2 Check "third fixed point") | τ=i | F₃=(1.3017,0.2690,0.2263), G₃=(0.7951,−0.2375,0.2263), H₃=(0.5065660287,0.5065660287,−1.7×10⁻¹⁴) | Keep |
| `thirdOrderCompletion_T`, `_S` | τ=i, 0.17+1.1i, −0.3+0.8i, 0.45+0.6i | T residuals 4.1×10⁻¹⁵, 1.1×10⁻¹⁴, 4.7×10⁻¹⁵, 3.8×10⁻¹⁵; S residuals 3.5×10⁻¹⁴, 4.8×10⁻¹⁴, 4.5×10⁻¹⁴, 8.1×10⁻¹⁴; F₃+G₃ fails S by 0.48, 0.43, 0.59, 0.75 | Keep |
| `rankGenFun` | q=0.3+0.2i; w=1, −1, e(±⅕) | R(1;q)=1.2466747023+0.6187812874i = 1/(q;q)∞; R(−1;q)=1.1979880710+0.0665615617i = f(q); R(e(⅕))=R(e(−⅕))=1.3307791487+0.2461160269i | Keep |
| `rankCompletion`, α=½ (§11.2 Check "rank even root") | τ=i; 0.17+1.1i | F_½(i)=0.5065660287 = H₃,₁(i) (3×10⁻¹⁵); F_½=0.5786585666−0.0247959850i = H₃,₁ (6×10⁻¹⁵) | Keep |
| `rankCompletion_modular`, t=5 (§11.2 Check "rank common multiplier") | γ=(1 0;25 1), α=⅕,⅖,⅗,⅘, τ=−0.04+0.04i and −0.0348+0.036i | every ratio F(γτ)/(√(25τ+1)F(τ)) = 0.9659258263+0.2588190451i = e(1/24), spread between the two τ ≤3.7×10⁻¹², moduli 1.000000000; e(1/24)=ν_eta(γ)⁻¹ with ν_eta(γ)=e(−25/24) from s(1,25)=(24·23)/(300) | Keep |
| same, t=3, 4, 6 | (1 0;9 1); (1 0;32 1) and (1 0;16 1); (1 0;24 1), (1 24;0 1), (577 24;24 1) | t=3: e(3/8) for both α; t=4, N=32: e(⅓) for α=¼,½,¾ (α=½ to 2.6×10⁻⁷); N=16: α=¼ gives e(1/6) but α=½ gives e(2/3), so N=16 has no common χ and the theorem's N must be larger (32 works); t=6: ratio 1 for all five α on all three generators (α=½ to 5×10⁻⁸) | Keep |
| negative control: +D/2 for −D/2 | t=5, α=⅕, the two τ | ratios 0.7820−0.6232i and 0.8262−0.5906i: arguments −0.107 and −0.099 turns, moduli 1.000 and 1.016, not constant | Keep −D/2 |
| `rankResidueDeviation_mock`, HasSum | t=1…7, every r, τ=0.13+0.5i and −0.21+0.37i, n ≤ 40 | worst residual 9.0×10⁻¹⁶; t=1: 0=0; t=2,r=1: −0.5870211866+0.0040594317i both; t=3,r=0: 0.7827788946−0.0041168931i both; t=5,r=1: −0.2348184856+0.0020493826i both | Keep |
| `rankResidueDeviation_mock`, Φ law | t=5, r=0,1,2 on (1 0;25 1); t=4, r=1,2 on (1 0;32 1); t=6, r=1 on (1 0;24 1) | e(1/24) with spread ≤4.7×10⁻¹⁵; e(⅓) with spread 6.4×10⁻⁹ and 1.5×10⁻¹⁵; 1 with spread 1.2×10⁻¹⁵ | Keep |
| §2.3 Check "large base radius" | q=2, a=−½, r=1, s=0 | cₙ₊₁/cₙ=(1−a2ⁿ)/(1−2ⁿ⁺¹)→a/2, |·|=¼, radius 4; d=0 formula |q∏B/∏A|=|2/(−½)|=4 | Keep |
| §2.4 Check "euler finite field base" | q=½ | 1/P₁=2, 1/P₂=1/((½)(¾))=8/3 | Keep |
| §3.1 Check "Root of unity" | G(4,2)=1+Q+2Q²+Q³+Q⁴ at Q=−1 | 1−1+2−1+1=2; (1−Q)(1−Q²)/(1−Q)² at −1 is 0/4=0=G(2,1)(−1) | Keep |
| §5.2 Check "eta multiplier positive c" | γ=(1 0;1 1) | η(γτ)=e(1/24)²√(−i(τ+1))η(τ)=exp(πi/6)√(−i(τ+1))η(τ); √(−i(τ+1))=exp(−πi/4)√(τ+1) gives ν_eta=exp(−πi/12); Dedekind form exp(πi(1/6−0−¼))=exp(−πi/12) | Keep |
| §11.2 Check "rank level lower unipotent" | γ=(1 0;N 1), N=10368 and N/3 | s(1,N)=(N−1)(N−2)/(12N) gives ν_eta=exp(−πiN/12); N/12=864 and 3456/12=288 are even integers, so both values are 1 | Keep |
| §10.1 conventions φ, ψ | coefficients to q⁴ | roadmap's ψ=Σ_(n≥1)(−q)^(n²)/Pₙ(−q;q²)=−q+q²−q³+2q⁴; f+4ψ=1−3q+2q²−q³+5q⁴ = Σ(−q)^(n²)·(q;q²)∞ = (1−2q+2q⁴)(1−q−q³+q⁴−q⁵); so the roadmap's φ,ψ are the classical φ(−q),ψ(−q) and φ=f+2ψ, Q₃=q^(−1/24)(f+4ψ) hold | Keep |
| §4.8a Check "weight-zero normalizations" | W=(0,−1;11,0), k=0 | pinned slash: |det W|^(k−1)=11⁻¹ and denom⁰=1, so (F∣[0]W)(τ)=11⁻¹F(−1/(11τ)); (√11)² restores F(−1/(11τ)) | Keep |

39 rows, all keep. Note on the method: at Im τ = 0.04 the correction coefficient must be evaluated as `erfc` (which is exactly `sgn(ν) − erf(X)`); computing it as the difference loses the α=⅖ and α=½ rows to rounding amplified by exp(πν²y) ≈ 10¹¹, which is a property of double precision, not of the statement. The Lean definition states the difference and is unaffected.

### Degenerate cases and context

- `rankCompletion_modular` with t=2 asserts one multiplier for the single j=1 (vacuously common); `Gamma 0` would be {1}, excluded by `0 < N`. `rankResidueDeviation_mock` at t=1: `Finset.Ioo 0 1 = ∅`, Φ=0, N(0,1,n)−p(n)=0, both sides 0. `ZMod.val` is used only with `0 < t`.
- `partition_primePowerCongruences` at ℓ=7, r=1: `r/2+1 = 1`, modulus 7, as §4.5; `hδ : δ < ℓ^r` and `Nat.ModEq` fix δ uniquely (§4.6 bounded inverse).
- `rogersRamanujan_count` at n=0: both sides 1 (the empty partition); `IsGapTwo` on `Multiset.sort` keeps multiplicity, so (2,2) fails (§3.3 Check).
- `partitionCrank` at (1): o=1, no part >1, crank −1 (Conventions line 24).
- `ramanujanOnePsiOneTerm` with b=0: the negative tail (b−q^(r+1))/(a−q^(r+1)) never divides by b.
- `baileyPair` over the zero ring: every `IsUnit` holds and the relation is 0=0.
- `zwegersR`'s `u.im / τ.im` and `Real.sqrt (2 * τ.im)` are junk for Im τ ≤ 0, excluded by `hτ` in both Lerch laws; `rayPeriod`'s `Real.sqrt (2 * τ.im + t)` is positive for t>0 when Im τ>0.
- `zwegersMuHat_modular` with γ=−I: w=−1, w²=1, η quotient 1, exp factor 1: simultaneous negation, as the §5.7 Check says.

### Shape

The README has the house headings (Summary, Scope and ownership, Conventions, Exact supplier contracts per supplier, How to read the build, Layers 1–11 with `### k.n` prose subsections, each with `*Needs:*`, `**Checks.**`, `### Examples`, `### Dependencies`; Downstream consumers; References). Every definition has an API list and at least three Checks (counted: the fewest are §§3.2, 3.4, 4.8, 4.9, 6.2, 8.6, 10.4, 10.8 with two Checks each, all theorem sections, not definitions). Every backticked Lean name in the README is declared in `Suggested.lean` (gate `readme-ids-missing=0`), and every Lean name appears in the README. No LaTeX delimiters, process words or pull-request numbers (gate counters 0).

## Not verifiable

- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified. §4.4a's complete rank dissections (AtkinSwinnertonDyer1954) and §10.3a's seventh-order identities (Hickerson1988) are cited by locator only.
- Andrews1986's equations (2.4)–(2.6) are not legible in the cached OCR (lines 99–102 carry only the equation numbers); the transformation was verified by exact computation instead of against the text.
- The common multiplier of `rankCompletion_modular` was sampled on generators of Γ(N) for t=3, 4, 5, 6, not proved for every t. Zagier2009 Theorem 7.1 (line 929) asserts mock modularity for every root of unity ξ≠1; its Remark 2 (line 933) notes that Bringmann–Ono prove the even-order case only on a subgroup of infinite index, so the odd and even cases rest on Zagier's proof via the Gordon–McIntosh identity, which §11.2 follows.

## Source issues

- none
