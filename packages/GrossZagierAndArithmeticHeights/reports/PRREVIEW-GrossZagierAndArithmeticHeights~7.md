# Review of GrossZagierAndArithmeticHeights (pull request #1487 at d4722a0)

**Verdict:** accepted

This is a full review of the roadmap folder at the same head the previous review read (the folder has no change since d4722a0; the change set is empty). Every passage of `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` (5774 lines) and `Suggested.lean` was read; the seeded sample of 15 targets was checked at its locators in the cached texts; the gate, the dependency check and the Lean elaboration were rerun; the supplier citations were resolved against main and the open heads. Two P3 notes remain; no P1 or P2 finding.

## Previous findings

- r6 R01 (P2, retire the three fulfilled supplier gaps in `packages/GrossZagierAndArithmeticHeights/design/plan.json`) — repaired: `design/plan.json` on the board now has `"gaps": []`, and the README imports the three contracts from TropicalAndBerkovichArithmetic §§2.7, 2.10–2.13, 3.1–3.3, 6.6–6.8 (README:106), AnalyticNumberTheoryPartI §§2.8, 2.10, 2.25 (README:132) and AutomorphicSpectralTheory §§1.14–1.15, 1.30, 2.17–2.18 with Mathlib `EisensteinSeries.E2` (README:140). All three suppliers were opened at their heads (see the citation table below). The brief confirms: no gap declared.
- r5 R01–R03, as recorded repaired in r6 (normalized intersection coefficients in §7.46a(5)/§7.47, CM supplier contracts in §§0a.1–0a.3, 9.4) — re-read at README:3651–3668, 3697–3703, 123–124, 5280–5286; the repaired passages stand and their Checks compute correctly (rows §7.46a(5), §7.47(3)–(4), §9.4 below).

## R01 (P3) — Stale sub-target names in supplier citations

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:107` (“AL.0 `standard-additive-character`, `self-dual-haar` … AL.4 `local-parameter-comparison`”), :108 (“AL.0 `bessel-laplace-mellin`”), :467, :1699, :5035 and :5085 (“`AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift`”, “`…/rs-global-functional-equation`”), :290 (“AbelianSchemesAndArithmeticModuli A1 (`relative-invariant-forms`)”), :138 and :5317 (“SelmerIwasawaCohomology §4.26 (`elliptic_exponential_kummer` and `elliptic_local_comparison_descent`)”), :3656 (“SerreWeightAndLevelOptimisation §2.6 (`deuring-eichler-supersingular-comparison`)”).

**Claim:** The cited layers and sections exist and carry the consumed content, but none of the ten backticked sub-target names occurs in the supplier at its current head, so a reader cannot locate the target by the name given.

**Witness:** AutomorphicLFunctionsAndLocalFactors at its open head numbers its targets `AL.k.n.m`; the consumed content is AL.0.2 “Characters, trace duality and self-dual measures”, AL.0.5 “Bessel transforms”, AL.3.3/AL.3.6 (functional equations), AL.4.2 “Weil–Deligne normalization and factor operations”; a search of that README for each of the six slugs returns 0 hits. Likewise `relative-invariant-forms` (AbelianSchemes A1.3 is “Invariant differentials”), the two Selmer names (§4.26 opens with the paragraph “Elliptic tangent, exponential and descent comparison”) and the Deuring–Eichler slug (§2.6 carries the bold paragraph “Deuring–Eichler supersingular comparison”) return 0 hits.

**Exact repair:** Replace each slug by the supplier's current locator: AL.0.2, AL.0.5, AL.3.3 and AL.3.6, AL.4.2; A1.3; “§4.26, Elliptic tangent, exponential and descent comparison”; “§2.6, Deuring–Eichler supersingular comparison”. Tested: each replacement locator is a heading or bold paragraph present at the open head, and the sentences consuming them (0.7, 6.2, 0a.5, 9.5, 9.20, 7.46a) need no other change.

## R02 (P3) — Two cited works have no manifest key

**Location:** `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:5772–5773` (“S. Bloch and K. Kato, L-functions and Tamagawa numbers of motives … Example 3.10.1”; “T. Matev, The p-adic analytic subgroup theorem and applications, preprint (2010)”), consumed at :5221 (“Fuchs–Pham Theorem 2.2; also Matev”) and :5505 (“Bloch–Kato Example 3.10.1”).

**Claim:** Both works are cited by locator but `packages/GrossZagierAndArithmeticHeights/sources.toml` has no entry for either (its 36 keys run from `muller-stoll` to `brooks`; no `bloch-kato`, no `matev`), so the citations are outside the manifest's lifetime rule.

**Witness:** `grep -i 'matev\|bloch' sources.toml` returns nothing; the References list writes both without a `Key`.

**Exact repair:** Either drop them (Fuchs–Pham Theorem 2.2 already carries 9.2, and 9.12 can cite SelmerIwasawaCohomology §4.26, which records the Bloch–Kato Example 3.10.1 locator), or add two manifest entries through the sources service (uncertified if only a paywalled copy resolves). Tested: with the two citations removed, every statement of 9.2 and 9.12 keeps a certified locator (fuchs-pham, castella-multiplicative, castella-exceptional).

## Verified sound

**Scope and principles.** Read `README.md`, `CONTRIBUTING.md`, the previous review and two roadmaps on main for shape (ImaginaryQuadraticClassNumber, Completed/LocalGaloisGroups). No route-specific shortcut: every classical statement is stated at the generality of its source and the quaternionic statements at YZZ's (Conventions, blocks (C), (H), (G), (L), (Q), (Q′), (A), (D)). No re-planned roadmap: CM points, class fields, heights, Hecke correspondences, integral models, Weil representations, Eisenstein families, measures and regulators are imported by name and section (supplier table README:96–140), and the owned specializations are named in the right-hand column. No copied passage (every locator is in the author's words; the two cst/gz86 quotations of at most a clause are paraphrases). No computational algorithm. No `set_option`, no sorry'd data, one `import Mathlib` plus one existing `TauCeti.*` module. Nothing outside the folder (`git diff --stat origin/main...HEAD` outside the folder is empty).

**Gate and build.** The worker's gate at d4722a0 reports every counter zero (set_option, blob, latex, prnum, sorry-data, sorry-examples, imports, forbidden, readme-ids-missing, round-labels, depcheck, stray-files, outside-folder, build). Rerun here:

    depcheck: 204 roadmaps, 1647 edges, 0 problem(s)

No UPWARD or CYCLE line. `lake env lean` on `Suggested.lean` finished in 9 s with the single warning `Suggested.lean:43:8: declaration uses sorry`. In ORDER.txt this roadmap is line 319; its suppliers in open pull requests are earlier (TropicalAndBerkovichArithmetic 220, EffectiveClassNumbers 233, PadicHodgeRegulators 304), and the roadmaps that consume it are later (ModularIwasawaMainConjectures 349, HeegnerPointEulerSystems 350, RankZeroOneBSDPartII 354).

**Lean.** One declaration, `canonicalHeightRat_exists_unique`; `#check` in a scratch file elaborates to `∀ (K) [Field K] [Height.AdmissibleAbsValues K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.toAffine.IsElliptic], ∃! q : QuadraticMap ℚ (ℚ ⊗[ℤ] W.Point) ℝ, ∀ P, q (1 ⊗ₜ P) = P.canonicalHeight`, which is README §0.2 (:331) binder for binder; no section variable was lost. One-tactic probe on a scratch copy: `simp` (no progress), `rfl` (not definitional), `infer_instance` (no instance goal), `exact` with a base-change lemma (fails: `QuadraticMap.baseChange` does not exist at the pin; `QuadraticForm.baseChange` in `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127` needs `Invertible (2 : R)`, false for ℤ, and returns an `A`-valued form, not an ℝ-valued map; the root-namespace `baseChange_ext` at :158 gives uniqueness only). Tau Ceti's `TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean` (692 lines) also assumes `Invertible (2 : R)` throughout and nothing in `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/*` tensors the point group with ℚ, so the headline is neither padding nor a duplicate. Docstring form, `theorem`, namespace and layer comment are as required.

**Headlines.** README headlines: the rational height extension (0.2, stated); Poincaré/Faltings–Hriljac heights (1.1, 2.12); strict GL₂ realization (3.4); half-weight central value (5.2); Waldspurger period formula (5.3); projected kernel and Fourier-height identities (8.1, 8.6); the marked-point comparison (8.8); YZZ/CST formulas and specializations (8.11, 8.14–8.19); the analytic subgroup and eigenlogarithm theorems (9.2, 9.13); the weight-two anticyclotomic formulas (9.11–9.22). All but 0.2 need carriers absent at the pins (arithmetic models and metrized lines, modular and Shimura curves as schemes with CM points, Rankin L-functions of newforms, quaternionic automorphic representations, Kohnen-plus eigenforms, p-adic CM moment measures and Abel–Jacobi maps, the algebraic-group logarithm), and the module docstring names each with what it lacks. Statable small facts (0.3 product rule, 0.4 unit index, 6.19 matrix inverse, 9.7 Euler factor) are rightly kept as README Checks and interfaces.

**Pinned declarations opened (file:line at the pins, Mathlib 6b7abb3, Tau Ceti a91d3aa).** `Point.canonicalHeight` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119`, the limit of the naive x-height of 2ⁿP over 4ⁿ, so h_x as README :29 says), `canonicalHeightQuadratic` (:341), `neronTatePairing` (:368, `QuadraticMap.associated'`, the halved polar form, so `neronTatePairing_self` :377 gives B_x(P,P)=h_x(P) as README :314 says), `canonicalHeight_nsmul` :285, `canonicalHeight_nonneg` :260, `canonicalHeight_eq_zero_iff_isOfFinAddOrder` :332, `tendsto_naiveHeight_two_pow_nsmul_div_four_pow` :161; `regulator` and `regulator_eq_abs_det_neronTateGramMatrix`, `regulator_eq_one_of_finrank_eq_zero` (`MordellWeil/Regulator.lean:91,95,104`); `CuspForm.frickeCompletedL` and `frickeCompletedL_eq_cpow_mul_Λ` (`TauCeti/NumberTheory/ModularForms/LFunction/FunctionalEquation.lean:180,223`); `hasse_bound`, `frobeniusTrace_sq_le_four_mul_card` (`HasseBound.lean:65,52`); `weakApproximation_denseRange` (`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:204`); `CuspForm.peterssonInnerCosets` (`TauCeti/NumberTheory/Modular.lean:270`, Hecke adjoints in `Petersson/Hecke.lean:33`); Mathlib `NumberField.Units.torsionOrder` (`Units/Basic.lean:174`) and `mem_torsion` (:151), `instAdmissibleAbsValues` and `totalWeight_eq_finrank` (`Height/NumberField.lean:77,157`), `prod_abs_eq_one` (`ProductFormula.lean:98`), `Gammaℂ_def` (`Gamma/Deligne.lean:55`), `Gamma_one` (`Gamma/Basic.lean:416`), `EisensteinSeries.E2` (`E2/Defs.lean:60`), `hasSum_qExpansion_E2` (`E2/Summable.lean:107`), `E2_slash_action` (used at `RamanujanFormula.lean:108`), `amiceTransform` and `amiceTransformEquiv` (`Padics/Measure/AmiceTransform.lean:76,157`; the equivalence is ℤ_p-coefficient only, as README :135 says), `injective_amiceTransform` (:92), `mahlerEquiv` (`MahlerBasis.lean:356`), `det_vandermonde` (`Vandermonde.lean:219`), `SlashAction` (`SlashActions.lean:34`), `Matrix.mul_apply` (`Data/Matrix/Mul.lean:306`).

**Cross-roadmap citations resolved (every citation in the supplier table and a sample of 130 `*Needs:*` locators).** On main: ModularCurves Layer 7F ST-1/ST-2/ST-4; PadicMeasuresIwasawaAlgebras §2.5 `boundedInvTransform` and §1.6 `characterIntegralAlgHom`; NewtonPolygons §§6.3–6.4; ImaginaryQuadraticClassNumber H1.2–H1.4, H3.1; ClassFieldTheory `ringClassField`, `gal_ringClassField_equiv_pic`, `ringClassNormSubgroup`; StableReduction Layers 4, 7; ComplexKahlerGeometry K5b.1; SchemeAndStackFoundations §§2.20, 5.8; JacobianChallenge Layer F; DiophantineApproximationAndTranscendence §2.8; IntegralLattices B5; EllipticCurves Layer 7; ModularForms 8G. At open heads (read through `roadmaps show` or the supplied checkouts): EffectiveClassNumbers §2.8 (its bold paragraph “Gross–Zagier with exact constants” states the class-character and elliptic formulas, the quotient-polarization comparison and ĥ_H=h ĥ_K, exactly what README :9, :109 consume); TropicalAndBerkovichArithmetic §§2.7, 2.11, 2.13, 3.3, 6.6–6.8 (§6.6 defines the mean-zero kernel and μ_a with bridge resistance ∞ and loop resistance 0, as README :759 uses); PadicHodgeRegulators §§1.9, 8.22 (§1.9: no reduction assumption, κ, H¹_e=H¹_f=H¹_g, D_cris^{φ=1}=0, as README :5665 uses); ColemanIntegrationPartII §§4.2–4.3, 7.2, 7.4, 7.7 (§7.7 gives the Tate primitive log(z)−(ν(z)/n)log(q), invariant under z↦qz, as README :5317 uses); ArithmeticStatisticsPartVI “Heegner logarithm and low rank”; NeronModels §6.4d `SemistableQuotientCotangent`, R11.1; SerreWeightAndLevelOptimisation §2.6 (Eichler order of level M on the special fibre, as 7.21 uses); EndoscopicTransfer §§10.2, 12.3; AbelianSchemes A4.9, A4.10 `SerreTate.homCriterion`, A5.6–A5.7, A6.13; ShimuraVarieties `CanonicalModel.special_action`, `special_rational`, `ReflexNorm`, `geometricArtin`, §§8.5, 8.22 (this resolves the worker's three Lean-name leads: they are supplier roadmap API names, not library declarations); MetaplecticAutomorphicForms §6.22 `toricTheta_pairingComparison`, §7.34 `shimura_eigenlineBijection`, `normTheta_integralRange`, `extendedSchwartzWeil`; AnalyticNumberTheoryPartI §§2.8, 2.10, 2.25; AutomorphicSpectralTheory §§0.38, 0.43, 0.45, 0.49, 1.30, 2.23–2.25 (§2.25 defines G_{N,s}=Σ_{Γ₀(N)/±I} g_s with g_s=−2Q_{s−1}(1+|z−z′|²/(2yy′)), matching 7.55/7.96; §0.43's p_{k,r} gives p_{2,0}=t²/8, p_{2,1}=1−t, p_{k,k−1}=Σ C(k−1,j)(−t)^j/j!, matching 6.2 and 6.35); ComplexMultiplicationAndExplicitReciprocity §1.2; HilbertModularVarietiesAndShimuraCurves R18.1.4, R18.2.6, R18.2.9, R18.2.12, R18.3.1, R18.3.29, R18.4.25a, R18.5.15, R18.5.21; PELModuli M1.2, M1.13, M4.1, M6.9 `hodgeLine`; HeightsRationalPointsAndObstructions §§0.12, 0.19, 0.21, 0.24, 1.8; ArakelovGeometryAndAbelianHeights `HermitianBundle`, `ArithmeticChow1.pairing`, §1.15; ComplexComparisonPartII C1.2, C5.3; MotivesAndAlgebraicCycles §0.1; EffectiveDiophantineMethods §§4.2, 4.6; SelmerIwasawaCohomology §4.26; AutomorphicLFunctionsAndLocalFactors “The normalized Whittaker newvector” (AL.2.2); GL2AutomorphicRepresentationsAndTransfer `rational-models`, `global-jl`, `local-classification`, `local-quaternionic-comparison`, `real-quaternionic-comparison`, `local-factors`, `spherical-whittaker-values`, `local-compatibility`, `iwasawa-cartan`, R17.3.8, R17.5; ModularCurvesPartII §§3.14, 5.15, 7.2 `weightTwoRegularDifferentials`, 9.10, 11.5, 12.4, 13.7, 14.13, 16.5, 17.3, R12.5; AbelianSchemesAndArithmeticModuliPartII P4.3; EllipticCurveModularity R29.5; ModularSymbolsPadicLFunctions Layer 1; AutomorphicGaloisRepresentations §4.2; FiniteFlatGroups R07.1.30, R07.2; AutomorphicFormsOnReductiveGroups §§2.7, 4.5, 7.2; SmoothRepresentations `frobenius-reciprocity`; ArithmeticGaloisRepresentations §2.7; ColemanIntegration L1. The only non-resolving strings are the ten slugs of R01.

**Ownership against open work.** The objects this roadmap owns (Néron symbols on curves, the admissible extension and Faltings–Hriljac comparison, Manin constants, the toric functionals and test lines, the classical and quaternionic Gross–Zagier formulas, the BDP/Brooks weight-two functions, the eigenlogarithm theorem) were searched by object in the sibling checkouts. HeegnerPointEulerSystems (rev 1423) cites GrossZagierAndArithmeticHeights 32 times and plans no height formula; EllipticCurvePeriodsAndModularParametrizations (rev 1715) imports §§3.1, 3.5, 3.7 for its Manin constant (its :197, :294, :1162, :1182); ModularIwasawaMainConjectures (rev 1499) and RankZeroOneBSDPartII (rev 1732) cite this roadmap as a supplier; CMRankZeroConverse, PeriodsAndSpecialValues, HilbertModularVarietiesAndShimuraCurvesPartII and AnticyclotomicLocalUnits mention none of these objects. All four consumers are later in ORDER.txt. Ownership against open pull requests whose files the brief did not supply was not checked beyond the indexed `roadmaps show` lookups above.

**Seeded sample (15 targets), each at its locator in the cached text.**

| Target | Source passage | Finding |
| --- | --- | --- |
| 0.9 | cst line 93 (§1, after Theorem 1.1, p. 2): P_K(f):=Tr_{H_K/K} f(P) | supports the trace convention; the h² factor is 0.2's quadraticity |
| 1.3 | gz86 line 166 (I (4.3), p. 228): ĥ(a)=⟨a,a⟩ is the Néron–Tate height for 2Θ | supports h𝒫(P,φ_(O)Q)=B_x; yzz-book/draft locators waived |
| 3.6 | cst lines 238–250 (§1.2, pp. 4–5): (f₁,f₂)=Vol(X_U)⁻¹(f₁∘f₂^∨), (f,f)_U=deg f for elliptic A | supports the statement including λ_J⁻¹ |
| 3.8 | cns lines 86–102 (Theorems 1.1–1.2, p. 3), 2282–2324 (Lemma 7.1, Theorem 7.2, pp. 46–47) | supports c_φ∣6 deg φ, the cube-free case, the δ_p refinement and the rational-singularity branch |
| 6.4 | yuan-zhang line 3386 (§8.1, p. 606): [t]°=[t]−ξ_{U,t} componentwise | supports the definition; book locator waived |
| 6.21 | yuan-zhang lines 2553–2589 (§7.2, pp. 591–592) | supports the five local components, the S₂ difference with degree 1+N_v+N_v², and the j_v choice |
| 6.29 | gz86 lines 1796–1831 (IV §1, pp. 270–271) | supports the unfolding with E_s=½Σ, M∣c, (d,M)=1, exponents −(2k−1), −2s, y^{s+2k} |
| 7.46 | gz86 line 1492 (III (8.1), p. 263) | the printed “α∂/∂t is a basis” is reversed; (8.2) ord α≥0 and (8.3) α≡j^{2/3}(j−1728)^{1/2} force ∂/∂t=α·basis, which the README adopts (Source issues) |
| 7.49 | yuan-zhang lines 3802–3813 (Prop. 8.5, pp. 615–616) | supports ī_v(t,t)=0 and the half-sum of the two unipotent multiplicities |
| 7.54 | gz86 lines 619–624 (II (2.19), p. 240) | supports the expansion; the O(e^{−Y}) at other cusps is for a width-one scaling (Source issues) |
| 7.61 | gz86 lines 1590–1593 (III (9.3), p. 265) | the lattice and congruence are as stated; the OCR does not resolve the order of 𝔟̄ and 𝔟⁻¹ (Not verifiable) |
| 7.39 | gz86 lines 1107–1117 (III (0.4), p. 253) | supports the formula, the split vanishing and log q_v=2 log p |
| 7.102 | gz86 line 3170 (V §1, p. 307, second display) | supports −u²Σσ′_A(n)r_A(m∣D∣−nN)+hu r_A(m)log(N/m) |
| 8.2 | cst lines 304–312 (§1.2, p. 6); zhang-survey lines 773–777 (Thm 4.3.1(2), p. 588) | supports P⁰_χ∈A(χ) with the inverse-character exponent |
| 8.3 | zhang-survey lines 702–705 (§4.2, p. 586); jsw lines 991–1004 (§4.1, p. 25) | supports ε=(−1)^{#Σ}; JSW's “(gen-H) implies sign −1” is false at an untwisted Steinberg ramified prime (Source issues) |

**Computed adversarial record.** Rows cover the sampled targets, the headlines, the targets touched by R01–R02 and the other statements whose values were recomputed while reading. Values are on each side of the claim.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.2 (Lean headline) | q=1, 1/2, 2; torsion P | q(q⊗P)=H, H/4, 4H from q(1⊗P)=H; torsion gives 0⊗P=0 and height 0; `baseChange_ext` gives uniqueness, existence is the content | sound; not one-tactic |
| 0.1 | rank 1, 37.a1 | half polar form of h_(O) is ½B_x; Gram det 2^{−r}·regulator; LMFDB Reg=0.0511114082 is det B_x (BSD check L′=Ω·Reg: 5.986917·0.051111=0.305999 ✓), so h_(O)(0,0)=0.0255557 | sound |
| 0.3 | Γ_ℂ(1)=2/(2π) | λ′(1)=√N·(1/π)L′(1); half-factor convention halves it | sound |
| 0.4 / block (A) | D=−3,−4,−7; t_K | u=3,2,1; w_K/[O^×:ℤ^×]=2 always, #Cl^ram=2^{t−1}, t_K=2^{2−t}: 6/(3·1)=2, 2/(1·2)=1 | sound |
| 0.7 | real place; unramified place | λ_{ℂ/ℝ}=±i, λ²=−1=η(−1); unramified ψ: all three ε=1, λ=1 | sound |
| 0.9 | orbit size 3 | Av=Tr⊗(1/3), ĥ_ℚ(Av)=ĥ(Tr)/9 | sound |
| 0.11 | [H:K]=h | B_H=hB_K=2hB_abs, gz86 (6.4) | sound |
| 0.12 | K=ℚ(√−23), N=2, class g∈C₃ | w₂:(1,𝔫)↦(g²,𝔫̄), [𝔫̄]=g², twice: (g²·g,𝔫)=(1,𝔫) | sound |
| 0a.1 | K=ℚ(i), c=1,d=3 | #Pic(O₃)=1·3·(1+1/3)/2=2 | sound |
| 0a.2 | ℤ[i], 𝔫=(2+i); ℤ[ω], 𝔫=(2−ω) | 1/(2+i)=(2−i)/5; N(2−ω)=7, 1/(2−ω)=(3+ω)/7 | sound |
| 0a.3 | Gaussian b₁=−1,b₂=−2+i; Eisenstein b₁=−1,b₂=3+ω | ι(i)=((2,−1),(5,−2)), square −I, det 1, 5∣c; ι(ω)=((−3,−1),(7,2)), M²+M+I=0, det 1 | sound |
| 0a.5 (R01 touched) | a=(2), ω↦2ω | false surface [2] degree 16, Morita factor 4, elliptic 4; weight-two value ×1/4 | sound; slug only |
| 1.3 | φ_(O)(P)=[−P]−[O] | h𝒫(P,φQ)=h_(O)(P+Q)−h_(O)(P)−h_(O)(Q)=B_x; AJ class [Q]−[O]=−φ(Q) gives −B_x | sound |
| 2.5 | ℙ¹/ℚ_p, a=(0)−(∞), b=(1)−(p); C₁+C₂ with C₁·C₂=2, C_i²=−2; ℚ_p(√p) | (ā·b̄)=−1, symbol log p; f=(t−1)/(t−p): log∣f(0)/f(∞)∣=log p; V=½C₁, (A·b̄)=½, −½log q; ramified: −(−2)log p/2=log p | sound |
| 2.11 | ℙ¹, a=(1)−(2), b=div t; genus-zero scope N=2, D=−7 | log1²−log2²=−2log2 both orders; −7≡1 mod 8, 3 inert, r_A(3)=0 | sound |
| 2.12 | elliptic diagonal | −(D̄·D̄)=ĥ_{2Θ}=2h_(O)=h_x | sound |
| 2.15 | H of degree 2h | h complex places, one squared-norm symbol each | sound |
| 3.6 | elliptic, degree d | (f,f)_U=deg f, (f,f)=deg f/vol | sound |
| 3.8 | 11a3 | c=deg=5≤5+0 | sound |
| 4.7 | ℚ₃, Ind(1,1), unramified torus; weight 2 real | Σ(m+1)²3^{−m}=(4/3)/(8/27)=9/2; L(1,ad)L(1,1)/L(2,1)=(27/8)(3/2)(8/9)=9/2, α=1; (W₀,W₀)=2Γ(2)/(4π)²=1/(8π²), α=1/4, C=π/(2(W₀,W₀))=4π³=4^{1}π^{3}/Γ(2) | sound |
| 5.2 | d>0, d<0; ⟨F,F⟩=6 | dit (5.17): Γ(1/2±ir/2−sgn d/4), real parts 1/4 and 3/4; dit line 704: norm 6 turns 12 into 2 | sound |
| 5.3 | probability vs quotient periods | ζ(2)L(1/2)/(8L(1,η)²L(1,ad)) × (2L(1,η))² = ζ(2)L(1/2)/(2L(1,ad)) = cst (2.1) | sound |
| 5.6 | cst Prop 2.1 | ⟨φ₁,φ₂⟩=2L(1,ad)L(2,1_F)⁻¹∏α_v, α_v=⟨W₁,W₂⟩/(L(1,ad)L(1,1)L(2,1)⁻¹) | sound |
| 6.1 | k=2, b_m=e^{−2πmy} | (4πm)³/2!·2/(4πm)³=1 | sound |
| 6.2 (R01 touched) | p₂(1), p_{2,0}, p_{2,1} from AST §0.43 | 1−2+½=−½; (t/2)²/2!=t²/8; 1−t | sound; slug only |
| 6.10 | N=11, D=−3 | 11 inert (−3≡8 nonresidue mod 11); 11-part Σa(11)^{2i}11^{−2is}=(1−11^{−2s})⁻¹ | sound |
| 6.16 | D=−15, D₁=−3, D₂=5; D=−3, n=±3 | prime over 3: ε_{−3}(3)=0, ε₅(3)=−1, genus via norm-2 ideal: ε_{−3}(2)=ε₅(2)=−1; ε(3,1)=1, ε(3,3)=ε_{−3}(−1)=−1, ε(−3,·)=1,1: σ(3)=0, σ(−3)=2 | sound |
| 6.18 | z=i; m=1,2; constant Mellin | E₂*(i)=−E₂*(i)⇒E₂(i)=3/π; −24σ₁=−24,−72; ∫−24σ₁e^{−4πmy}y^s=−6σ₁/(πm)+o(1) | sound |
| 6.19 | p=2, ν=1 | ((1,1/4),(1,1))·(1/3)((4,−1),(−4,4))=I | sound |
| 6.21 | N_v=2 | 1+2+4=7, coefficient −1/7 | sound |
| 6.29 | k=1, s=2 | Γ(3)(4π)^{−3}N²: with N=37 gives 1369/(32π³) (6.31) | sound |
| 6.31 | N=37, D=−7, m=16 | 37·3+1=112=16·7, r_A(1)=1; 109 splits (109≡4 mod 7), r_A(109)=2 | sound |
| 6.33 / 6.43 | D=−p, k=1, ε(N)=1 | terms (1,D): E^{(1)}(pz); (D,1): ε(N)/(i p^{s+1/2})E^{(D)}(z)=−ip^{−s−1/2}E^{(D)}(z) | sound |
| 6.48 | ρ, C_N⁻¹(1,N₁) | first row of C_{p^ν}⁻¹ is (1,−p^{−2},0,…)/(1−p^{−2}); product gives ρ⁻¹μ(N₁)/N₁² | sound |
| 6.61 | log δ(diag(y,1))=½log y | 4π∫e^{−4πy}log y·½ dy=−½(γ+log4π); L′_∞/L_∞(0,η)=−½(γ+log4π) per real place | sound |
| 6.69 | k=1 | (2π)²2¹(0)!/((0)!∣D∣^{1/2})=8π²/√∣D∣; δ(0)R(0)=2^t·h/(2^t u)=h/u | sound |
| 7.1 | char 2, Q=1+ε | Q³=1+3ε=Q | sound |
| 7.2 | q=3, s=1 | n₁=a(0)+1+1=2; n₃=a(0)+1+e₁+1 with e₁=4 (unram.)→6, e₁=6 (ram.)→8 | sound |
| 7.39 | inert p∤ND | log q_v=2log p; split gives 0 | sound |
| 7.40 | D=−7,p=3 | q=23: −69≡1 mod 7; q=11: 11≡−3 but −33≡2 | sound |
| 7.46 | tangent π·e vs π⁻¹e | ord α=1 vs −1; with ∂/∂t=αe, α=3ζ²u, ζ³∝j(x), ord α=(2/3)ord j≥0 and α∝j^{2/3} as (8.3) | sound; GZ (8.1) reversed |
| 7.46a(5) | C₁+C₂, degree vector (1,−1), q=5; ramified/unramified degree 2 | V=½C₁, V·(x′−y′)=½, symbol −log5/2; raw 1/e=½, and −½log25/2=−log5/2 | sound |
| 7.47(3)–(4) | φ=3, raw 1, e=2 | l=3/2; further ramified: 3·2/4=3/2; height −(3/2)log N_v once | sound |
| 7.49 | split v | ī_v(t,t)=0, proper part ½(m̄ν₁+m̄ν₂) (YZ p. 615) | sound |
| 7.54 | width 10 | e^{−πY/5}/e^{−Y}=e^{(1−π/5)Y}→∞ | sound |
| 7.58 | D=−7,N=2,p=m=3 | 3 inert, 2 splits; T₃x one level-1 orbit of degree 4; GZ (9.7): n∈{3,6,9}, r_A(15)=0 (3,5 inert), r_A(9)=1, r_A(3)=0; term δ(6)R(2)ord₃(18)=1·2·2=4, ⟨c,T₃d^σ⟩₃=−4log3=−(x·T₃x^σ)·2log3 ⇒ (x·T₃x^σ)=2 | sound |
| 7.61 | 𝔟R=S𝔟 vs R𝔟=𝔟S | conjugation of β by t,b gives β-ideal 𝔡⁻¹𝔮⁻¹𝔫𝔟̄𝔟⁻¹ resp. 𝔟𝔟̄⁻¹ | sound |
| 7.62 | D=−7,p=7,q=2,b=j; 𝔞=(7),b=7(1+j); D=−15,p=3,q=19,𝔞=(5) | (−2/7)=−1; N𝔠′=14, 0+14=2·7; N(b)=147=3·49, N𝔠=7, N𝔠′=14, 7+14=21; ord₇(686)−ord₇(49)=3−2=1; (−19/3)=−1, −19≡1 mod 5, δ/5 has valuation −1 | sound |
| 7.75 | D=−7,N=1,p=3,q=23,b=j | m=69, N𝔠′=7·23=161, 0+3·161=483=69·7 | sound |
| 7.79 | N=2 | κ₂=−4; 3log2−(4/3)log2=(5/3)log2 | sound |
| 7.81 | N=1, D=−4, τ=i | n=(b+c)²+(a−d)²=a²+b²+c²+d²−2(ad−bc); (a+d)²+(b−c)²=n+4m | sound |
| 7.102 | gz86 p. 307 | identical display | sound |
| 8.2 | C₃ over 𝔽₇, ζ=2 | σ(1,2,4)=(4,1,2)=4·(1,2,4)=χ(σ)⁻¹(1,2,4) | sound |
| 8.3 | 11a1, K=ℚ(√−11) | ε_11(St_{K_v})=−1≠χ(−1)=1 ⇒ 11∈Σ(A,1), #Σ=2, ε=+1; twist: ε_11(St⊗χ)=χ(−1)=(−1,−11)₁₁=−1, ε(E^{−11})=+1, consistent | sound |
| 8.11 / 8.15 (R01 touched) | D=−4, c=1 | 8π²/(u²√∣D∣)=8π²/(4·2)=π²; CST→YZZ: point 2L(1,η), height ×2, volume ×½ | sound; slug only |
| 8.16 | CST example | 2^{−1}·(9/2)·4=9 | sound |
| 9.5 | Tate curve q=5, [6],[36] | log₅6≡5−75≡55, 2·55=110, sum 165≡40 mod 125; [30]=[6] | sound |
| 9.7 | 11a1 p=5, 23; y²=x³+3x/𝔽₅ | a₅=1, E₅=1; −19≡4 mod 23, a₂₃=−1, E₂₃=25/23; affine counts 1,2,2,2,2 +∞=10, a₅=−4, E₅=2; p≥7: 2√p<p−1 so only #Ẽ=p is a multiple | sound |
| 9.9 | K=ℚ(i), N⁻=21, k=2, j=1; 30a1, K=ℚ(√−3) | C=¼π³·1·2·4·2·(2/4)(6/8)=3π³/2; a₃=1, χ((√−3))=27·(√−3)^{−4}=3, a₃χ(𝔩)=+3≠−3 so (ST) fails | sound |
| 9.12 | a_p=±1 | ((p∓1)/p)², valuation −2 | sound |
| 9.15 | E: y²+xy=x³+x²−11x; K=ℚ(√−31), p=5 | Δ=3⁶·11²=88209, c₄=553=7·79; #E(𝔽₃)=5 (x=0:1,x=1:2,x=2:1,+∞), a₃=−1; (−31/3)=−1,(−31/11)=−1,(−31/5)=+1; factors 8/9 (unit), 120/121 (v₅=1); good-place forms 5/3, 13/11 | sound; JSW Remark 5.1.4 wrong at level primes |
| 9.2 / 9.12 (R02 touched) | G=𝔾_a×𝔾_m, V diagonal; a_p=1 | no positive-dimensional H with Lie(H)⊂V, so p-adic Hermite–Lindemann follows; (1−a_p/p)=(p−1)/p≠0 | sound; manifest only |

**README shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0a–9 each with `### Examples` and `### Dependencies`, Source and interface limits, Downstream consumers, References. Every definition read carries an API list and at least three discriminating Checks (counted for 0.4, 0.7, 1.2, 1.4, 2.3, 2.5, 2.9, 2.11, 2.14, 3.2–3.6, 4.1–4.4, 5.1, 6.1–6.10, 6.16, 6.20–6.22, 6.35, 6.38, 7.2–7.4, 7.11–7.12, 7.19–7.20, 7.23, 7.28, 7.40, 7.46, 7.46a, 7.55, 7.63, 7.70–7.71, 7.75–7.76, 8.2, 8.5, 8.7–8.8, 9.3–9.4, 9.6, 9.14–9.15); every theorem has its hypotheses in the sentence and a locator; `*Needs:*` lines are per target. The README's generality equals the Lean's for the one stated headline. No LaTeX delimiters, process words, pull-request numbers or round labels (gate counters zero).

## Not verifiable

- `yzz-book` and `yzz-draft` are settled waived: the book-only inputs named in 7.47 (Theorem 7.8(4) at deep level) and 8.1 (Proposition 5.8) and every YZZ chapter/page locator were not read; the public restatements cited (Disegni, Yuan–Zhang, Yuan) were read for what they state.
- `argos` and `blr` are settled uncertified (7.1, 7.2, 9.1 locators cited by number only).
- gz86 III (9.3), p. 265 (gz86 line 1592): the OCR does not resolve whether the β-ideal is printed with 𝔟̄𝔟⁻¹ or 𝔟𝔟̄⁻¹, so the README's remark at 7.61/7.62/7.75 that the printed form corresponds to 𝔟R=S𝔟 is consistent with the algebra but not confirmed from the scan.
- gz86 IV (4.4), p. 283 (gz86 line 2286): the denominator of the displayed constant is unreadable in the scan; the README's claim at 6.69 that (5.6)'s constant carries an extra (k−1)! for k≥3 depends on (4.4) having 1/((k−1)!√δ). The k=1 target is unaffected; (5.5) and (5.6) as printed are mutually consistent.
- Ownership against open pull requests whose files were not supplied was not checked beyond the indexed lookups listed above.
- A successful `sorry` build checks elaboration only; the computed rows verify normalizations, conventions and instances, not the global analytic identities.

## Source issues

- **Misprint** in gz86 at III (8.1), printed p. 263 (gz86 line 1492): the source says α∂/∂t is a basis of the tangent module; it should be ∂/∂t = α times a basis, as (8.2) ord α ≥ 0 and (8.3) α ≡ j^{2/3}(j−1728)^{1/2} require; affects a stated result.
- **Gap** in gz86 at II (2.19), printed p. 240 (gz86 line 623): the source says the expansion at another cusp has remainder O(e^{−Y}) for some γ ∈ SL₂(ℝ) carrying the cusp to ∞; it should fix a width-one scaling or write O(e^{−cY}), since an arbitrary scaling changes the decay rate; affects nothing.
- **Gap** in gz86 at II §2, printed p. 241 (gz86 line 670): the source says T_m maps each cusp to itself; it should say T_m fixes the cusps 0 and ∞ (for N with a divisor d, gcd(d,N/d) > 2, T_m permutes cusps of denominator d); affects the proof.
- **Misprint** in gz86 at III (9.8), printed p. 266 (gz86 line 1642): the source prints the congruence without β; it should read α ≡ (−1)^{ord_𝔣(𝔟)}β mod O_𝔣; affects a stated result.
- **Misprint** in gz86 at III §9, printed p. 266 (gz86 line 1636): the source says each place above the ramified p has residual degree p^f; it should say residue cardinality p^f with f the order of [𝔭]; affects nothing.
- **Error** in jsw at §4.1, printed p. 25 (jsw lines 1000–1004): the source says (gen-H) implies ε(π,K,1/2) = −1; it should add a_ℓ(f) = −1 at every ramified ℓ ∥ N⁺ (e.g. 11a1 over ℚ(√−11) has sign +1); affects a stated result.
- **Error** in jsw at Remark 5.1.4, printed pp. 32–33 (jsw lines 1352–1353): the source says the inert Euler factor at w = (ℓ) is (1−a_ℓℓ⁻¹+ℓ⁻¹)(1+a_ℓℓ⁻¹+ℓ⁻¹); it should be 1−ℓ⁻² when ℓ ∣ N⁻, which Σ may contain; affects a stated result.
- **Misprint** in jsw at §5.1.5, printed p. 33 (jsw line 1361): the source says log_{ω_f} takes values in K_v; it should be K_v ⊗ O, since ω_f lies in Ω¹ ⊗ O; affects nothing.
- **Gap** in yuan-zhang at §7.2, printed p. 591 (yuan-zhang line 2552): the source says O_{E_v}^× ⊂ U_v induces O_{E_v} ⊂ O_{B_v}; it should assume the order containment, since at a split place with residue field 𝔽₂ the units generate a proper suborder; affects a stated result.
- **Misprint** in yuan-zhang at §8.2, printed p. 615 (yuan-zhang line 3800): the source says m̄_v = ½(m̄_{ν₂}+m̄_{ν₂}); it should be ½(m̄_{ν₁}+m̄_{ν₂}); affects nothing.
