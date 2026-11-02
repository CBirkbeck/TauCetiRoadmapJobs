# Review of SieveMethodsAndPrimePatterns (pull request #1495 at 302221d)

**Verdict:** accepted

Full review of the repaired head (201 changed lines since b7b40cf). Both findings of the previous review are repaired; the whole roadmap was re-read and re-checked. Three P3 notes remain; none blocks.

## Repair of the previous review's findings

- **r1 R01 (P2, restore the log² distribution endpoints): repaired.** `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2553` now states "Convolution discrepancy mean value … `(Δ√(xy)+√x+√y+Q)(1+log Q)^2`", line 2644 the variance "`(Δx+Q)(1+log Q)^2`", line 2680 the correlation "`√(Δx+Q)√(y+Q)(1+log Q)^2`", each with its own proof route (lines 2537–2551 "Separate cofactor bounds for convolution", lines 2623–2642 "Squared conductor sums with separate ranges"). The intermediate log³/log⁵/log⁴ estimates are kept as intermediate targets, as the finding asked. All three endpoints are stated in `Suggested.lean` (`convolution_discrepancy_mean` line 348, `arithmetic_discrepancy_second_moment` line 377, `bilinear_congruence_correlation` line 399). The routes were recomputed below and close: small conductors cost `Δ³R²L²=ΔL²` and `Δ⁶xR³L⁴=Δ³xL⁴`, the large range keeps the dyadic factor `J≤L` on one logarithm only, and the variance split at `Δ(1+log Q)=1` recovers power two.
- **r1 R02 (P2, state the unweighted Jutila theorem): repaired.** `README.md:2185` "Jutila unweighted mean square. Prove `SieveQuadratic.jutila_unweighted_mean_square`… `≤ C X Y (log X)^8`" and `Suggested.lean:219`. Checked against the page image of JUTILA-ORIGINAL printed p.194 (the OCR text at line 122 drops the exponent): Lemma 2 reads `Σ'_{|D|≤X}|Σ_{1≤n≤Y}χ_D(n)|² ≪ XY log⁸X` for `X≥3, Y≥1`, with `Σ'` over nonsquare `D≡0,1 (mod 4)` exactly as the Lean filter (JUTILA-ORIGINAL lines 54–56 for the convention). The new Check at line 2196 (nine discriminants at X=12) was recomputed: the nonsquare `D≡0,1 mod 4` with `|D|≤12` are −12,−11,−8,−7,−4,−3,5,8,12, and −12 is the one nonfundamental member.

## R01 (P3) — Record the ownership split with AnalyticNumberTheoryPartI §1.5a for the Hilbert inequality

Location: `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2294`, "Separated Hilbert inequality … at most (π/δ)Σ_i|z_i|²"; also the Scope paragraph at lines 13–19.

Claim: the same object, a finite Hilbert-type inequality for separated real frequencies, is a target of AnalyticNumberTheoryPartI §1.5a, "Weighted finite Hilbert inequality", in Montgomery–Vaughan's weighted form `|Σ_{r≠s}u_r ū_s/(λ_r−λ_s)| ≤ (3π/2)Σ|u_r|²/δ_r`. The README neither cites it nor says why §2.9 keeps its own version.

Witness: AnalyticNumberTheoryPartI README at #1126, section "§1.5a Weighted finite Hilbert inequality" (its constant is 3π/2 with local spacings δ_r). With uniform spacing it gives only `(3π/(2δ))Σ|z_i|²`, whereas the sharp additive large sieve of §2.9 needs the constant π: with δ=1/2, H=1 the target constant is `H−1+δ⁻¹=2`, and 3π/2 in place of π would give 3.

Repair: add one clause in Scope and ownership and in the §2.9 *Needs:* line: AnalyticNumberTheoryPartI §1.5a owns the weighted 3π/2 form; §2.9 owns the uniform-spacing π/δ constant because the sharp constant `N−1+δ⁻¹` needs exactly π. No statement changes.

## R02 (P3) — Cite a named AnalyticNumberTheoryPartI interface for the squared-divisor moment

Location: `README.md:71` "§1.2a for Σ_(n≤Y)τ(n)²≪Y log³(2Y)" and `README.md:2423` (*Needs:* of "Divisor moments over reciprocal totients"), also lines 2198, 2214, 2385.

Claim: AnalyticNumberTheoryPartI §1.2a is "Uniform Möbius major/minor arcs"; the bound `Σ_{n≤Z}τ(n)²≪Z log³(2Z)` appears there only as one sentence inside its proof route and is not one of its named interfaces (`mobius_vaughan_identity`, `mobius_type_I_bound`, `mobius_type_II_bound`, …). The named statement of that moment in AnalyticNumberTheoryPartI is `zetaFourthMoment.divisorDiagonal` in §3.24, "Fourth moment of zeta": `Σ_(n≤X)τ(n)²=X(log X)³/π²+O(X(log X)²)` and `Σ_(n≤X)τ(n)²/n=(log X)⁴/(4π²)+O((log X)³)` for `X≥2`.

Witness: AnalyticNumberTheoryPartI README at #1126, §1.2a paragraph "Use `Σ_(n≤Z)τ(n)²≪Z log³(2Z)`, since `τ²≤τ₄`…", and §3.24 bullet `zetaFourthMoment.divisorDiagonal`.

Repair: in the supplier contract (line 71) and the five *Needs:* lines, replace "§1.2a" by "§3.24 `zetaFourthMoment.divisorDiagonal`" (the asymptotic implies the bound for `X≥2`; the range `1≤X<2` is the single term τ(1)²=1).

## R03 (P3) — Add the Corollary 18.6 correction to Source-sensitive conventions

Location: `README.md:2684` "correcting the assignment of Δ in the printed conclusion"; the list at lines 3964–4104 has entries for KED-ANT-18 §18.1, §18.2 and Theorem 18.5 but none for Corollary 18.6.

Claim: the correction is asserted in-line only. The house rule is that every source correction a statement relies on is recorded in Source-sensitive conventions.

Witness: KED-ANT-18 line 654–661: "With conditions as in Theorem 18.3, for ab≠0, … ≤ c|f||g|(x+Q)^{1/2}(Δy+Q)^{1/2}log²Q"; the conditions of Theorem 18.3 (line 431) impose (18.1.1) on f, whose support length is x, not on g. With f-only hypotheses the Cauchy–Schwarz route gives `√(Var_f)√(Var_g) ≤ C E_fE_g√(Δx+Q)L·√(y+Q)L^{1/2}`, i.e. Δ on x. At `Δ=1/16, x=16, y=1, Q=2` the two factors are `√3·√3=3` and `√18·√(33/16)≈6.093`.

Repair: add the entry "**KED-ANT-18, §18.3, Corollary 18.6.** Read the conclusion as `(Δx+Q)^{1/2}(y+Q)^{1/2}`: (18.1.1) is assumed of f, whose support is [1,x]; the printed factor attaches Δ to y." No statement changes.

## Verified sound

Read both roadmap files completely (README 4163 lines, Suggested.lean 544 lines), the normative checklist in README.md and CONTRIBUTING.md, the previous review and the change set. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SieveMethodsAndPrimePatterns'` is empty). The folder has only README.md, Suggested.lean and metadata.toml. No worktree file was changed.

**Gate.** The worker's gate at 302221d passes every check including `build=0`. My rerun of the full gate on this head also passed (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). The dependency check:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

No UPWARD or CYCLE line for this roadmap (SieveMethodsAndPrimePatterns is line 251 of the merge order; its suppliers AdelicAlgebraicGroups 30, InverseGaloisAndArithmeticFundamentalGroups 43, GeometryOfNumbersAndQuadraticArithmetic 65, AnalyticNumberTheoryPartI 81, AnalyticNumberTheoryPartII 82, ArithmeticStatisticsPartV 99, ErdosProgressionPowers 180 are all earlier; the Completed and on-main suppliers need no position).

**Lean.** A scratch copy of `Suggested.lean` with every `sorry` replaced by `first | simp | norm_num | infer_instance` and `#check @name` for all 55 declarations appended was elaborated with `lake env lean`: all 35 theorems fail the probe with "unsolved goals" (none closes in one tactic), and all 55 `#check` lines print their elaborated types. Each type was compared with its README statement; no declaration lost a section binder (the only section variables are the Gram space `𝕜 E ι` of `selberg_weighted_inner`, all mentioned in its type). The module docstring names the headlines not statable at the pins (L-domain convex sieve and finite-character Gram bound, weighted general sieve endpoints, joint-spin equidistribution, affine saturation and SL₂ squarefree expansion) with the carrier each lacks. Every backticked name of the roadmap's own in the README is declared in the Lean (gate `readme-ids-missing=0`); the 52 "found nowhere" leads of `roadmaps resolve` are exactly these own declarations. No padding: no declaration restates a definition, mirrors a Check or computes a small value (`maynardM_five_ge` and `four_lt_maynardM_105` are exact-arithmetic lower bounds for a supremum over an L² class, not computations).

**Imports and pins.** `import Mathlib` only. Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lake-manifest.json), as the README's supplier contract records.

**Seeded source sample.** Every locator below was opened in the cached text (or page image) and the statement compared with the README's wording and hypotheses.

| Target | Opened at | Result |
|---|---|---|
| 0.2 weighted finite families | KED-ANT-11 lines 411–419 (Lemma 11.2), 500–514 (Definition 11.6) | Weighted inclusion–exclusion with an arbitrary f and the residue-class setup support the fibre-weight construction; the source counts elements, the README's multiplicity-preserving pushforward is the stated repair. |
| 0.5 dimension, remainder mass, Rankin | KED-ANT-11 lines 520–526 ((11.4.1)), 530–539 (Lemma 11.7), 552–560 (Lemma 11.8), 582–597 (Theorem 11.9); KED-ANT-12 lines 518–524 (R(x,y)), 545–551 ((12.3.1)) | Log-dimension predicate, product-dimension predicate and strict `d<y` remainder mass match. README's tail bound `(log z)^κ` is stronger than the source's `(log z)^{κ+1}` and is proved by Rankin with `a=1/log z` (checked below). Theorem 11.9's hypotheses `|#A_d−ω(d)X/d|≤cω(d)` and `#A_d=0` for `d>Cx` are restated explicitly. |
| 0.8 conic local counts | KHAYUTIN-19 lines 6112–6128 (Lemma B.1), 6154–6159 (Proposition B.3), 6177–6190 (Lemma B.4), 6305–6315 (Proposition B.5), 6407–6408 (Corollary B.6), 6409–6424 (Corollary B.7), 6430–6440 (Proposition B.8) | Normal forms, `ρ(p)=p−(D/p)` with `ρ̃=ρ=ρ(p)p^{k−1}` off `ωD`, the bound `16p^{3n/2}`, and the genus-restricted sums are as cited. The README's corrections of B.4, B.5 and B.8 were recomputed (table). |
| 1.2 Brun coefficients | KED-ANT-12 lines 464–471 (Brun's D±), 475–502 (Lemma 12.1), 535–541 (y_m and single-prime exception), 655–670 (Theorem 12.2) | Prefix conditions, strict cutoffs, `β=9κ+1`, `s≥β`, `z=y^{1/s}` and `(1±e^{β−s}K^{10})` match; the printed sign of the lower main term is wrong (Source issues). |
| 2.1 tapered Fourier vectors | BOMBIERI-1971 lines 14–39 (statement), 53–95 (Proposition 1, tapered φ_i, K_M, (3)–(5)), 100–120 (bins, cosecant sum, choice of L) | Selberg's Gram inequality, the taper `L^{−1/2}(N+L−|n|)^{1/2}`, the kernel difference, the bin argument and `L` near `π/(√12 δ)` are as the README describes, with the OCR-illegible displays confirmed by the surrounding text. |
| 2.2 separation and the additive sieve | same, lines 100–118 | The at-most-two-points bin claim and the `(m+1)δ≤1/2` restriction are present; the README's boundary correction and its `L=⌊1/δ⌋` choice are the stated repairs. |
| 2.6 finite duality | KED-chap-largesieve lines 476–486 (Lemma 15.4) | Unconjugated duality with the same constant; the README's conjugated form is equivalent. |
| 2.7 quadratic sieves and real-character means | HB-REAL-95 lines 233–254 (Corollaries 3–4); SS-23 lines 2803–2815 (Lemma 6.3); JUTILA-ORIGINAL p.194 image (Lemmas 2–3, (12)–(17)); SMITH-17 lines 3226–3231 (Proposition 6.6); KP-22 lines 2891–2912 (Proposition 7.6) and 2990–2998 ((7.11)) | Corollary 4: odd m, arbitrary n≤N, `(MN)^ε(MN^{1/2}+M^{1/2}N)` for sup-norm-one coefficients. Lemma 6.3's `(KL)^{1+ε}(min K,L)^{−1/2}+K` is for prime k,l; the README's all-k numerators follow from Corollary 4 directly (it has no restriction on n). Lemma 2 and (12) as in the Lean, with `Z₈^{1/4}` and `log⁶N`; (16) has `log⁸N`. Smith and the (7.11) normalization agree (the saving exponent is `−1/4+c₂c₄+ε`; the OCR drops the sign). |
| 2.9 Hilbert, sharp sieves, Linnik | KED-chap-largesieve lines 391–399 (Lemma 15.1), 512–519 (Theorem 15.5), 565–572, 582–584 (Exercises 15.4.2, 15.4.4); KED-ANT-16 lines 373–381 (16.1), 401–409 (16.2), 485–503 (16.4), 516–522 (16.5), 549–551 (16.6), 556–565 (16.7) | Constants `π/δ`, `δ⁻¹+N−1`, `Q²+N−1`, `(N+Q²)/H` and Linnik's `c(ε)` bound are as stated; the README's coefficient-masking repair of Lemma 16.5 was re-derived (table). |
| 3.1 prime level | MAYNARD-2015 lines 48–58 ((1.3) and footnote), 83–87 | `Σ_{q≤x^θ}max_{(a,q)=1}|π(x;q,a)−π(x)/φ(q)|≪_A x/(log x)^A`, π(x)/φ(q) centring, as in `PrimesHaveLevel`. |
| 3.2 discrepancies and maximal BV | KED-ANT-18 lines 355–364 (Definition 18.1), 373–385 (Lemma 18.2), 429–436 (Theorem 18.3), 446–500 (its proof), 520–529 (Theorem 18.4), 630–636 (Theorem 18.5), 652–662 (Corollary 18.6) | Definition, the all-moduli hypothesis (18.1.1), `2x^{1/2}Δ³rτ(s)` transfer, `log²Q` convolution, variance and correlation endpoints, and the `Q=x^{1/2}(log x)^{−B}` range are as restated. The README's maximal-in-y form is a stated strengthening with its own route. |
| 4.3 M_k | MAYNARD-2015 lines 268–326 (Propositions 4.1–4.2), 353–357 (Proposition 4.3) | Riemann-integrable `S_k`, `r_k=⌈θM_k/2⌉`, M₅>2, M₁₀₅>4, `log k−2 log log k−2`. The L² class is the README's recorded enlargement with the smooth-approximation target. |
| 4.7 admissible sets and gaps | MAYNARD-2015 lines 83–124 (Theorems 1.1–1.4), 359–366 (proof of 1.3, Engelsma) | Theorem 1.2 takes an arbitrary set of r distinct integers, as the Lean does; 600, 12, `m³e^{4m}` as stated. |
| 5.5 Chen | HB-SIEVES lines 2285–2330 (Chen's theorem and sketch, (6.7)); CHEN-73-CN is waived | Switching weight `1−ω/2−a/2`, `z=N^{1/10}`, the claim `w(n)≤0` off P₂ on squarefree n, and the nonsquarefree exception `≪N/log³N` match the README's §5.5 weight target; the 2.6408/3.9404/0.6706 constants are cited by locator only. |
| 5.6 ideal symbols and spins | FIMR-13 lines 299–312 (Lemma 2.1), 1120–1126 (Proposition 5.1), 1304–1314 (Proposition 5.2); KM-21 lines 88–93 (Theorem 2), 340–345 (Conjecture C_n), 353–361 (Corollary 2.2) | Reciprocity with the 2∞ factor, the sieve conversion exponent `1−ϑθ/(2+θ)`, the spin-sign proportion `2^{−t}`, and the conjecture's quantifier order (`δ(n)` before `ε`, all `Q≥3`, `N≤Q^{1/n}`, real nonprincipal χ mod `q≤Q`) agree with §5.3, §5.6 and the supplier contract. |

Also opened for the Lean headlines: HB-SIEVES lines 855–863 ((3.3)), 880–903 ((3.5)–(3.6), range `x≥4k` in the derivation), 1011–1023 (Theorem 3.1), 1038–1058 (Theorem 3.2, Corollary 3.3); KED-ANT-18 lines 510–516 (Vaughan's identity (18.2.1)).

**Library declarations opened at the pins** (file:line): `Mathlib/NumberTheory/SelbergSieve.lean` (`BoundingSieve`, `selbergTerms`, `mainSum_lambdaSquared_eq_sum_mul_sum_sq`, `siftedSum_le_mainSum_errSum_of_upperMoebius`, `prod_primeFactors_nu`, `nu_pos_of_dvd_prodPrimes`); `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:144` (`IsMultiplicative.prodPrimeFactors_one_sub_of_squarefree`); `Mathlib/NumberTheory/AbelSummation.lean:129` (`sum_mul_eq_sub_sub_integral_mul`, declared under `_root_`); `Mathlib/NumberTheory/Chebyshev.lean:812` (`pi_ge'`); `Mathlib/Analysis/Fourier/ZMod.lean:219` (`IsPrimitive.fourierTransform_eq_inv_mul_gaussSum`); `Mathlib/NumberTheory/Bertrand.lean` (`Nat.exists_prime_lt_and_le_two_mul`); `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean` (`AddChar.sum_eq_zero_of_ne_one`, `AddChar.sum_eq_card_of_eq_one`); `Mathlib/Combinatorics/Additive/ApproximateSubgroup.lean` (`IsApproximateSubgroup`, `.subgroup`, `.of_small_tripling`); `Mathlib/RingTheory/Polynomial/Basic.lean` (`monicEquivDegreeLT`, `degreeLTEquiv`); `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean` (`ContDiffBump.normed`, `integral_normed`, `tsupport_normed_eq`); and 70 further names of the *Needs:* lines (`Nat.chineseRemainderOfFinset`, `primorial_le_four_pow`, `Polynomial.ofFn`, `jacobiSym.quadratic_reciprocity`, `UnitAddCircle.norm_eq`, `AddCircle.norm_le_half_period`, `hasSum_zeta_two`, `Real.le_sin_mul`, `gaussSum_mulShift_of_isPrimitive`, `ZMod.dft_dft`, `DirichletCharacter.sum_char_inv_mul_char_eq`, `Nat.IsAtMostAlmostPrime`, `Matrix.gram`, `Finset.Nat.antidiagonalTuple`, `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `ArithmeticFunction.sum_Ioc_mul_eq_sum_sum`, `Nat.divisorsAntidiagonal_eq_prod_filter_of_le`, `MvPolynomial.schwartz_zippel_totalDegree`, `Nat.sum_divisors_filter_squarefree`, `Real.prod_one_add_le_exp_sum`, `Chebyshev.abs_psi_sub_theta_le_sqrt_mul_log`, `Nat.infinite_setOfPred_prime`, …): all exist at the pin. Tau Ceti: `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean` (`IdealArithmeticFunction.vonMangoldt`, `norm_vonMangoldt_le_log`), `Convolution.lean` (`convolution_one_one_apply`), `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean` (`fundamentalDiscriminantChar`). Boundaries noted by the README (no finiteness in `IsApproximateSubgroup`, `ArithmeticFunction` vanishing at zero only, `BoundingSieve.totalMass` unsigned) hold at the pin.

**Cross-roadmap citations resolved** (every one re-read at the current head or on main):

| Supplier | Where read | Resolved |
|---|---|---|
| AnalyticNumberTheoryPartI (#1126 head) | §§0.10, 0.11, 0.21, 0.26, 0.31, 0.32, 1.2a, 3.1, 3.3, 3.4, 3.22, 3.26, 3.34 (`smoothCount_dickman`), 3.35 | All exist and say what is consumed (PNT with savings and Siegel–Walfisz in §0.32, Mertens in §§0.11/0.21/0.26/0.31, divisor subpower in §§3.1/3.26, norm-fibre majorants in §§3.3–3.4, Dickman and Rankin in §§3.34–3.35). §1.2a is R02; its §1.5a is R01. Its line "no Bombieri–Vinogradov-type average is claimed (that is a downstream sieve roadmap's…)" confirms the ownership split. |
| AnalyticNumberTheoryPartII (#1167 head) | §5.29 | Odd-squarefree quadratic large sieve, primitive-real form and square-pair (Corollary 2) version, uniform in cutoffs and coefficients; its M=1,N=3 Check matches the README's contract Check (0 and 4, energy 2). |
| ArithmeticStatisticsPartV (#1175 head) | §3.30 "Conditional joint-spin prime bound" | Conjecture C_d, the sequence s_a, Type I uniformly in m, Type II exponents 1/(6n), and the prime saving `δ/(54|S|²n(12n+1))` (1/5994 at n=3,|S|=1,δ=1) exactly as the contract states. |
| GeometryOfNumbersAndQuadraticArithmetic (#851 head) | §4.1 "Lattice-point counting" | Henk's bound and Davenport's estimate; no curvature-uniform translated/scaled bound (owned in §0.11 here). |
| AdelicAlgebraicGroups (#792 head) | §4.2 "Strong approximation and arithmetic closures" | Rational-point strong approximation `Approximation.HasStrongApproximation`; no finitely generated subgroup reduction theorem (owned in §5.4). |
| InverseGaloisAndArithmeticFundamentalGroups (#850 head) | §IG.2.5 "The Lang–Weil estimate" | Fixed model over `O[1/m]`, geometrically irreducible generic fibre, `Nv^d+O(Nv^{d−1/2})`; the bounded-degree uniform version is a §5.4 target here. Its thin-set count consumes Serre's multidimensional box large sieve by locator and owns no large-sieve target. |
| IntegralLattices (main, active) | Layers 0 and 3, half-norm convention (README lines 220, 352–371), dyadic Jordan data | Half-norms and integral local classification supplied; §0.8 keeps only the rank-two conic adapter. |
| GlobalNumberFields (Completed) | Layer 11 "orders and Picard groups" (line 571), invertible proper ideals (lines 182–237), Layer 3 | Orders, invertible ideals, generators and class representatives; conductor-prime norm counts are §0.9's addition. |
| ArithmeticDirichletSeries (Completed) | Layers 1 (norm fibres, line 145), 2 (convolution, line 168), 5 (ideal and prime estimates, line 237) | As cited. |
| ClassFieldTheory (main) | Layer 14, `hilbertProductFormula` (lines 150, 591) | Hilbert reciprocity. |
| QuadraticFormInvariants (main) | Layer 6C, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` (lines 688–696, 1999–2002) | Comparison and product formula with finite support. |
| Chebotarev (Completed) | Layer 13 "ϑ_C and π_C" (line 593) | Principal-class prime count. |
| ThetaSeries (main) | 2H "The Kronecker symbol", `kroneckerSym`, `kroneckerChar` (lines 562–574) | Kronecker symbol and discriminant character. |
| ErdosProgressionPowers (#1336 head) | §3.1 "General effective analytic inputs", finite Gram inequality with row sums (lines 1343–1373) | Uniform-row Gram inequality; the x=1,y=(1,2) values 5 and 6 recomputed. |
| Isoperimetry (main) | I2 "Symmetrization, rearrangements, and convex geometry" (line 144) | Convex-body isoperimetry. |
| RiemannianGeometry (main) | R4.9.6a (line 856): signed turning input, tangent-angle lift, degree +1, signed total curvature 2π | As cited for the curvature-to-area comparison. |

**Declared gaps.** The twelve gaps of `design/plan.json` (analytic-divisor-moments, uniform-wirsing, maximal-small-conductor, extremely-smooth-tails, curvature-uniform-lattice, subgroup-strong-approximation, squarefree-ring-sum-product, sl2-noncommutative-flattening, quadratic-order-conductor-counts, bounded-degree-lang-weil, jutila-unweighted-mean-square, joint-spin-proof-strengths) are not restated as gap contracts in this README; each is instead owned as a target here (§§3.0, 1.1, 3.0, 1.4, 0.11, 5.4, 5.4, 5.4, 0.9, 5.4, 2.7) or consumed inside ArithmeticStatisticsPartV §3.30's stated theorem (joint-spin proof strengths), and Scope and ownership (lines 13–19) says so for every one. None of the twelve supplier sections named in the plan provides the item today (checked above), and no *Needs:* line cites a supplier for one of them as if supplied. This is the "own the instance" resolution and is not a finding; the plan's `gaps` list is for the intake to reconcile.

**Duplication by object** (`roadmaps grep` over main and 438 open heads, plus the pinned libraries): no other roadmap states Bombieri–Vinogradov, Barban–Davenport–Halberstam, Vaughan's identity, the additive or primitive-character large sieve, Brun or Selberg upper-bound theorems, Linnik's exceptional-prime bound, Maynard's clusters, admissible tuples, Chen's theorems or Jutila's lemmas as targets (ProbabilisticAndMetricNumberTheory's "Vaughan", "Maynard" and "Barban" hits are Pollington–Vaughan, Koukoulopoulos–Maynard and Kubilius–Barban references; AnalyticNumberTheoryPartI's "Jutila" is the 1977 density theorem). Mathlib has `BoundingSieve`/`SelbergSieve` (consumed), no large sieve, no Vaughan identity and no prime-level predicate; Tau Ceti has no sieve declarations. Ownership against the open pull requests whose files the brief lists was checked through `roadmaps grep` and the supplier heads above.

**Adversarial pass.** One row per statement checked, with the values computed on each side. Line numbers refer to `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md`.

| Statement (line) | Instance | Values computed | Result |
|---|---|---|---|
| 0.1 exact Legendre identity (178) | support {0,1,2,3,6}, P=6, unit weights | 5−3−3+2=1; only 1 survives | consistent |
| 0.1 absolute error (200) | P=1, A₁=10, X=7 | error 3 = \|R₁\| | consistent |
| 0.1 first Bonferroni (246) | support {6}, P=6 | A₁−A₂−A₃=1−1−1=−1 ≤ S=0 | consistent, negative allowed |
| 0.2 finite-family sieve (260) | labels 7,7 with weights 2,3; n(10−n), n=2..8 | weight 5 at 7; values 16,21,24,25 (4 distinct) carry mass 7 | consistent |
| 0.2 divisibility sums (287) | labels 0 (w=2), 2 (w=3), d=2 and d=0 | multSum(2)=5, multSum(0)=2 | consistent |
| 0.2 sifted sums (297) | Q={2}, bad {1}, samples 0 (w2), 1 (w3) | labels 1,2; sifted sum 2 (divisibility reading would give 3) | consistent |
| 0.3 residue sieve (347, 385) | Q={2,3}, Ω₂=∅, Ω₃={1}, samples −2..3 | P=3; survivors −1,0,2,3; sum 4 | consistent |
| 0.3 full obstruction (405) | Ω₃=ℤ/3 | survivor sum 0; factor 1−3/3=0 | consistent |
| 0.4 zero row (441) | y=(0,2) | rows 0,4 | consistent |
| 0.4 defect bound (461) | x=1, y=2 | r=4, c=1/2, defect 0; printed c=1/8 gives 9/16 | consistent |
| 0.4 weighted inner (473, headline) | x=1, y=(1,2) | 1/3+4/6=1 ≤ 1; empty family 0 ≤ 1 | consistent |
| 0.5 log dimension (487) | P=∅, κ=0, C=−1 | 0 ≤ −1 false | predicate not vacuous |
| 0.5 product dimension (514) | w=z | 1 ≤ K needs K ≥ 1 | consistent |
| 0.5 remainderMass (541) | P=6, all R_d=1 | D=1,2,3,6,7 → 0,1,2,3,4 | consistent, strict cutoff |
| 0.5 sieve level (568) | X=1, \|R₁\|=1 for all x | cutoff eventually >1, mass 1 vs C/(log x)^A | no positive level, as claimed |
| 0.5 tilted Euler (607) | P=6, ν=1/d, a=0 | 1+1/2+1/3+1/6=2=(3/2)(4/3) | consistent |
| 0.5 Rankin cutoff (619) | x=3, σ=1 | 3 ≤ 3·(3/2)(4/3)=6 | consistent |
| 0.5 Rankin tail (631) | x=3, a=1 | 1/6 ≤ (1/3)·2·2=4/3 | consistent |
| 0.5 tail (log z)^κ (667) | a=1/log z, p≤z | p^{1/log z}≤e, product ≤K(log z)^κ, x^{−a}=exp(−log x/log z) | improvement over source proved |
| 0.5 Eratosthenes (679) | P=1, X=A₁=x=M=1, c=0, σ=1/2 | 0 ≤ 1 | consistent |
| 0.6 discriminantValue (693) | D=5,n=2; D=8,n=2; D=1,n=0; D=−3,n=2 | −1; 0; 0 (native 1); −1 (−3 mod 8=5) | consistent |
| 0.7 densities (714) | Q=x₀², mod 4 | ρ=8, ρ̃=4 (smooth zeros none; (0,·),(2,·) lift? x≡0,2: 4·2=8 zeros, those with x≡2 mod 4 have no lift) | consistent |
| 0.7 growth class (765) | f=2^Ω, A=2,B=1,ε=1 | f(4)=4=min(4,4) | consistent |
| 0.7 correction factor (790) | Q=x₀, n=6 | θ=(1+2/4)(1+2/9)=(3/2)(11/9)=11/6? no: ρ_Q(p)=p, so 1+2/p: (2)(5/3)=10/3; λ sum 1+1+2/3+2/3=10/3 | consistent |
| 0.8 normal forms (818) | x²+xy+y² mod 2 | D=−3≡5 mod 8; values 0,1,1,1: unit fibre 3, zero fibre 1 | consistent with Lemma B.1 |
| 0.8 regular prime (828) | q=x²+y², D=−4, ω=1, p=3 | x²+y²≡2 mod 3: 4 solutions = 3−χ(3)=3−(−1) | consistent |
| 0.8 singular recursion (838) | p=3, q₀=x²−y², m=n=1 | x≡±y mod 3: 5 solutions (printed 1) | README correction confirmed |
| 0.8 uniform bound (850) | q=x²+y², ω=0, p=2, n=2 | 4 ≤ 16·8=128 | consistent |
| 0.8 genus sum (860) | p=3, u=u_A=ω=1, k=1, ε=−1 | direct count of x²+3y²+6≡0 mod 9: 18; printed 9[2+1−1]/2=9; corrected 9[2+1+1]/2=18 | README correction confirmed by script |
| 0.9 ideal counts (872) | ℤ[i] | r(1)=1,r(5)=2,r(25)=3,r(3)=0,r(9)=1 | consistent |
| 0.10 vector data (897) | labels 2,3, components T, T² | norm 2·9=18; equal Bernoulli bits: joint prob 1/2 ≠ 1/4 | consistent |
| 0.10 irreducibles (928) | F₂, j≤2 | counts 2,1; 2/2+1/4=5/4 ≤ 1+log 2 | consistent |
| 0.11 discrepancies (942) | unit disks, a=1 | counts 1 (open), 5 (closed); errors π−1, 5−π; a=2 area π/4<1 excluded | consistent |
| 1.1 uniform mean (993) | k=6, z=4 | Σ_{d<4,(d,6)=1}μ²/φ=1 ≥ c(1/3)log 4 | needs c ≤ 2.16; nonvacuous |
| 1.1 GGPY Lemma 3 (1023) | γ≡1 | g=1/φ, c_γ=1, main log z | consistent |
| 1.2 Brun coefficients (1055) | P=6,y=4,β=2 | λ⁻=(1,−1,−1,0) (6: 2<(4/6)^{1/2} fails), λ⁺=(1,0,0,0) (2<(4/2)^{1/2}=1.41 fails) | consistent |
| 1.2 strict support (1106) | P=2,β=2,y=8 | λ⁺(2)=0 since 2<(8/2)^{1/2}=2 fails strictly; λ⁻(2)=−1 | consistent |
| 1.2 main terms (1118) | P=1, κ=1,K=2,u=10 | δ=e⁰·2^{10}=1024; −1023 ≤ 1 ≤ 1025 | consistent |
| 1.2 fundamental estimate (1130, headline) | P=1, X=0, A₁=S=1, y>1 | R₁=1: −1 ≤ 1 ≤ 1; dropping R₁ gives 0 ≤ 1 ≤ 0 false | consistent, R₁ needed |
| 1.3 Selberg weights (1150) | P=6, ν=1/d, z=4 | terms 1,1,1/2: G=5/2; λ(2)=−(4/5)·1, λ(3)=−(6/5)(1/2)=−3/5, λ(6)=0; main 2/5 | consistent |
| 1.3 upper bound (1176, headline) | P=6, A=1..6, X=6 | S=2 ≤ 12/5 + 0 | consistent |
| 1.4 Euler denominator (1188) | g≡1, d=1, z=2 | 1+1/2=3/2 vs c₁·2 | consistent |
| 1.4 curvature–area (1198) | R=32, θ=1, z=2 | 32 ≤ 1024π=A; z²=4 ≤ 56.7; R=1: 32 ≤ π false | consistent |
| 1.4 finite-character Gram (1213) | samples (0,0),(1,0), coefficients 1,−1, moduli 1,2 | sums 0,2,0,2; squared sum 8; energy 2; θ=1/4: w^{13/2}=z⁵ at w=z^{10/13} | consistent |
| 1.4 cutoff comparison (1239) | z=1 | both products 1; s→0 right side 0 | s≥1 needed, as stated |
| 1.4 smooth saving (1305) | z=4, α=1/2, s=2 | eligible a∈{2,4} | consistent |
| 1.4 fixed divisor (1339) | Q=x₀², k₀=p, a=1 | Σ_r ρ̃_{Q_r}(1)=p vs ρ̃_Q(p)=0 | printed identity refuted, as recorded |
| 1.6 interval (1440, headline) | x=y=2 | π(4)−π(2)=1 ≤ 5.77+2.42C | consistent |
| 1.6 progression (1450, headline) | k=1,a=0,x=4 | 2 ≤ 2.885C | nonvacuous for C ≥ 0.70 |
| 1.6 twin/Goldbach (1460, headline) | N=4; N=10 | 1 ≤ 2.08C; 3 ≤ 2.52C | consistent |
| 1.6 parity (1490) | n=1,4,12 | Ω=0,2,3; even weight 1,1,0 | consistent |
| 2.1 multiplicity (1548) | M=3,n=−1; n=3 | 2; 0 | consistent |
| 2.1 triangular sum (1560) | M=2,t=1/4 | 2+2cos(π/2)=2=\|1+i\|² | consistent |
| 2.1 sine quotient (1570) | M=2,t=1/2; t=0,M=3 | 0=\|1+e(1/2)\|²; 9 (quotient undefined) | hypothesis needed |
| 2.1 taper weights (1582) | N=1,L=2 | n=0..3: 1,1,1/2,0 | consistent |
| 2.1 vector (1594) | N=L=1,x=1/4, freq −1 | e(1/4)=i | sign convention pinned |
| 2.1 signed Gram (1642) | N=L=1, x−y=1/2 | (0−1)/1=−1; modulus 1 ≤ 1/sin²(π/2)=1 | consistent |
| 2.1 norm (1652) | N=1,L=2 | (9−1)/2=4=2N+L | consistent |
| 2.2 sine bound (1700) | t=1/2; 1/4 | 1≤1; 1/4≤1/2 | consistent |
| 2.2 bins (1710) | δ=3/10, points 0,2/5 | m=⌊(2/5)/(3/10)⌋=1 with (m+1)δ=3/5>1/2 | printed bin rule omits it |
| 2.2 cosecant row (1720) | δ=1/2, antipodal pair | 1 ≤ π²/3 | consistent |
| 2.2 taper width (1730) | δ=1/2; 3/10 | L=2: 2+π²/6=3.64≤4; L=3: 3+3.05=6.05≤6.67 | consistent |
| 2.2 interval vector (1752) | H=2,L=1; H=3,L=1 | o=2: (0,0,a,b,0); o=1: (0,a,b,c,0) | consistent |
| 2.2 translation (1810) | H=2,M=−2,a=(1,i),x=1/4 | e(−1/4)+i·1=−i+i=0; flipped sign 2i | consistent |
| 2.2 additive sieve (1830, headline) | singleton point; δ=2 | \|Σa_j\|² ≤ HΣ\|a_j\|² ≤ (H+1)Σ | degenerate branch holds |
| 2.3 reduced fractions (1846) | 0/1, 3/4 | circle distance 1/4 ≥ 1/16 | consistent |
| 2.3 Gauss norm (1876) | q=1; principal mod 4 | 1; i+(−i)=0 | primitivity needed |
| 2.3 Parseval (1900) | q=4, F≡1 | 4+0=4=φ(4)·2 | consistent |
| 2.3 primitive sieve (1920, headline) | q=1 term | \|Σa\|² ≤ HΣ\|a\|² ≤ (H+2)Σ | consistent |
| 2.4 λ_V (1934) | λ₂(12); λ₄(4) | log 3+log 2; 0 | consistent |
| 2.4 Vaughan identity (2001, headline) | all n≤60, U,V<8 (script) | identity holds numerically to 1e−9; n=V=2,U=0 boundary log 2 | consistent |
| 2.4 bilinear support (2021) | V=2,N=12,ℓ=3,m=4 | 4 ≤ ⌊12/3⌋ | endpoint attained |
| 2.5 kernel sum (2091) | H=K=0,R=2,J=3 | 8(2+4+8)=112 ≤ 9·2·7=126 | consistent |
| 2.5 arbitrary cutoff (2115) | R=2,Q=5 | J=2: 5≤8≤10; J=1: 4<5 fails | consistent |
| 2.6 duality (2129) | A=(2i), C=4 | 4\|β\|² both ways | consistent |
| 2.7 HB bilinear (2141) | M=1, b≡1 | N ≤ C N^ε(√N+N) | consistent |
| 2.7 symbol₂ (2151) | (3,2),(6,2),(2,3),(9,3) | 1,0,−1,0 | consistent |
| 2.7 prime bilinear (2175, headline) | K=L=1; K=1,L=2 | 0; a₁b₂ ≤ CAB(2^{1+ε}+1) | consistent |
| 2.7 Jutila unweighted (2185, headline) | X=3,Y=1; X=3,Y=2; X=12,Y=1 | 1; 1−1=0; 9 (script) | consistent |
| 2.7 Jutila weighted (2200, headline) | X=8,N=2,a₂=1 | χ_D(2) for −8,−7,−4,−3,5,8 = 0,1,0,−1,−1,0: sum 3 | consistent |
| 2.7 Smith (2216, headline) | X₁={3},X₂={5} | 1 ≤ C(5·5^{3/4+ε}·2) | consistent |
| 2.7 KP (2226, headline) | normalization | t₂t₁^{3/4+ε}(log t₁)^{c₄}(log t₂)^{c₄}/(a²t₁t₂) ≤ t₁^{−1/4+c₂c₄+2ε}/a² | exponent sign confirmed |
| 2.8 coefficient (2240) | p=3,G=1,H=T+1; G=1,H=T² | (1,−1); (0,1) | consistent |
| 2.8 Farey sieve (2266, headline) | p=2,ℓ=1,m=2; ℓ=m=0 | words (1,0),(1,1): 2 ≤ 4; 1 ≤ 1 | consistent |
| 2.9 Hilbert (2294) | λ=(0,1), z=(1,i) | 2i; 2 ≤ π·2 | consistent |
| 2.9 sharp additive (2304, headline) | H=1, δ=1/2 | \|a\|² ≤ 2\|a\|² | consistent |
| 2.9 sharp primitive (2314, headline) | Q=H=1,a=2+i; Q=1,H=2,a=(1,1) | 5≤5; 4≤4 | consistent |
| 2.9 forbidden residues (2330) | P={2},Ω₂={0},a₁=a₂=1 | h(2)=1, S(0)=2, S(1/2)=0: 4 ≤ 0 false before masking | masking repair needed |
| 2.9 leastNonresidue (2340) | 3,7,2 | 2,3,0 | consistent |
| 2.9 Linnik (2365, headline) | N=16,ε=1/2; ε≥1 | 28 smooth ≤256 (script), 511; q(p)<p≤N | consistent |
| 3.0 divisor moments (2411) | Q=2: j=0,1,2; Q=3,j=1 | 2,3,5; 4 and 2 on (q,2)=1 | consistent |
| 3.0 small conductor (2425) | χ mod 3, x=3, s=1; s=2 | −log 2; 0 | consistent |
| 3.1 level (2441, def) | discrepancy(10,3); (5,3); q=0 | 1; 3/2; 0 | consistent |
| 3.1 θ≤0 and θ>1 (2464) | θ=0; θ=2 | only q=1 (0); ≫x² | consistent |
| 3.2 discrepancy (2480, def) | f=δ₁,x=1,q=3; q=1; x=−1 | 1/2,−1/2; 0; 0 | consistent |
| 3.2 transfer (2507) | χ mod 3, f=δ₁, s=1, Δ=1 | 1 ≤ 2·1·1·3·1 | consistent |
| 3.2 conductor reduction (2517) | χ mod 8 from mod 4 | r=4,s=2; values 1,−1,0 | consistent |
| 3.2 convolution log³ (2527) | f=g=δ₁,x=y=1,Q=3,Δ=1 | LHS 1/2 | consistent |
| 3.2 separate cofactors (2537) | same; Q=2 | small 0, large 1/2; both 0 | consistent |
| 3.2 separate cofactors, route | general | small: 2√xΔ³rτ(s)E_f·√yE_g, Σr≤R², Στ/φ≤L²: Δ√(xy)L²; large per s: Q/s+(√x+√y)L+√(xy)/R, Σ1/φ(s)≤L | sum (Δ√(xy)+√x+√y+Q)L² |
| 3.2 convolution log² (2553, headline) | δ₂*δ₃ at q=5 | h=δ₆, D=1_{a=1}−1/4, max 3/4; f=0 gives 0 | consistent |
| 3.2 maximal BV (2569, headline) | y=0; q=1 term | 0; \|ψ(y)−y\| via ANT-I §0.32 | consistent |
| 3.3 level <1/2 (2581, headline) | θ≤0; prime powers | trivial; x^{θ+1/2}log x=o(x/log^A x) | consistent |
| 3.4 π transfer (2595) | y=2,q=2,a=1; q=1 | 0−0; 1−0 | consistent |
| 3.4 variance log⁵ (2613) | f=δ₁,x=1,Q=3 | 1/4+1/4=1/2 | consistent |
| 3.4 squared conductor sums (2623) | same; r=4,s=2; R=1 vs 3 | 1/2 = variance; 1/4 ≤ 1/2; large vs small range | consistent |
| 3.4 squared conductor route | general | large: Σ_P (x+8P²)/P ≤ 2x/R+16Q/s, j=0 moment: (x/R+Q)L; small: 4xΔ⁶r²τ(s)², Σr²≤R³, j=2 moment L⁴ | as stated |
| 3.4 variance log² (2644, headline) | L=10, Δ=1/100; Δ=1/2 | Δ³L⁴=0.01 ≤ ΔL²=1; L=10 ≤ 50 | split closes |
| 3.4 BDH (2660, headline) | q=1 term | (ψ(x)−x)² ≤ Cx²/log^A | consistent |
| 3.4 correlation log⁴/log² (2670, 2680, headline) | f=g=δ₁,Q=3,a=b=1; a=−1; g=iδ₁; a=3; Δ=1/16,x=16,y=1,Q=2 | 1/2; −1/2; i/2; 0; √3√3=3 vs √18√(33/16)≈6.093 | consistent, Δ on x |
| 4.1 admissible (2721, def) | {0,2},{0,2,4},{0,2,6,8,12},∅,{0,1} | yes, no (mod 3), yes (script), yes, no | consistent |
| 4.1 primeTranslates (2748, def) | {0,1}; {0,2,4}; ∅ | {2}; {3}; ℕ | consistent |
| 4.2 W-trick (2776) | D₀=3, H={0,2} | W=6, v₀=5 | consistent |
| 4.2 weights (2803) | k=1,W=1,F≡1,R=4,N=2 | λ=(5/2,−2,−3/2); w₂=1/4,w₃=1; S₁=S₂=5/4; y^{(1)}₁=5/2 | consistent |
| 4.2 g (2803) | g(25) | 9 (squarefree-only would give 0) | consistent |
| 4.3 M_k (2842, def) | M₁; triangle; F=x | 1; I=1/2,J=1/3, ratio 4/3; I=1/12,J=1/20,1/30 | consistent |
| 4.3 smooth approximation (2886) | k=4,η=1/10,r=1/30 vs 1/80 | sum 31/30>1 vs 19/20,17/20 | r<η/k needed |
| 4.5 positivity (2990) | ρ=θM_k/2−ε | ⌊ρ+1⌋=⌈θM_k/2⌉ for small ε | consistent |
| 4.5 clusters→gaps (3002) | r=2, diameter 600 | p_{j+1}−p_j ≤ 600 | consistent |
| 4.5 Prop 4.2 (3014, headline) | k=0; k=1 | ⌈0⌉=0; M₁=1, ⌈θ/2⌉=1 | degenerate cases hold |
| 4.6 M₅ (3064, headline) | exact simplex integration (script) | I₅=29509/1222452000, J^{(1)}=40493/4191264000, 5J/I=1417255/708216≈2.00116>2 | recomputed exactly |
| 4.6 Lemma 8.1 (3040) | k=5,a=2,b=0; k=1,a=0,b=1,j=1 | 2!/7!=1/2520 (printed 0); 1/2 | correction confirmed |
| 4.6 M₁₀₅ (3076, headline) | README's exact I, ΣJ, ratio | ratio = ΣJ/I exactly; ratio=4.000543795842…>4 | consistent (I, ΣJ themselves not recomputed here) |
| 4.6 large k (3028, headline) | k=C₀m²e^{4m} | (1/4−1/(2k))(log k−2 log log k−2)>m needs C₀>e^5 | consistent with Theorem 1.1 route |
| 4.7 Engelsma (3145) | 105 listed values (script) | 105 distinct, min 0, max 600, no prime ≤103 covered | admissible |
| 4.7 first k primes (3157) | k=5 | {7,11,13,17,19} misses 0 mod 5 | p=k case covered |
| 4.7 Theorem 1.3 (3169, headline) | θ=1/2−ε | θM₁₀₅/2>1 for ε<0.00007 | r=2 |
| 4.7 Theorem 1.4 (3181, headline) | θ=1−ε | θM₁₀₅/2>2 for ε<0.000136; θM₅/2>1 for θ>0.99942 | consistent |
| 4.7 Theorem 1.2 (3205, headline) | arbitrary A | thinned A₂ has ≥r∏_{p≤k}(1−1/p) elements, all k-subsets admissible | matches source hypotheses |
| 4.8 conjectures (3219) | X²+X+2; (X,X+1) | always even; fails at 2 | consistent |
| 5.1 roughness (3285) | n=8,z=2,k=2; n=1 | 8<8 false, Ω=3; Ω=0 | consistent |
| 5.2 sieve functions (3299) | F(1),F(2),F(3),f(2),f(3),f(4) | 2e^γ,e^γ,2e^γ/3,0,2e^γlog2/3,e^γlog3/2 | consistent with sf=∫F(t−1) |
| 5.2 Rosser weights (3329) | d=2,D=8; d=D=2 | upper 0 (8<8 fails), lower −1; 0 | consistent |
| 5.2 lower bound at s=1 (3356) | g=1/p on [D^{1/4},D) | M⁻→1−log 4<0, f(1)=0 | range D≥z² needed |
| 5.2 upper below s=1 (3374) | s=1/2 | F=4e^γ vs F(1)=2e^γ | consistent |
| 5.2 lower sieve >9t (3400) | t=1,s=9.5; K=2,u=10 | u≥10 excluded; δ=1024 | separate proof needed, as stated |
| 5.2 Richert (3428) | N=8,α=1/4,β=1,r=1,n=8 | one weighted prime, Ω=3 | square exception needed |
| 5.2 threshold (3470) | r=2; r=3 | 1/Λ₂=0.545>1/2; 1/Λ₃=0.361<1/2 | P₃ yes, P₂ no |
| 5.3 C_m (3482) | χ mod 3, (0,2],(1,3]; q=15,k=3,15 | 0,−1; 5,1 | consistent |
| 5.4 reductions (3500) | SL₂(F₂),SL₂(F₃) | 6·24=144 | consistent |
| 5.4 point counts (3510) | line/F₂; xy=0/F₃ | 2; 5 | consistent |
| 5.4 sum-product (3520) | A={0,1}⊂F₇ | 3+2=5 | consistent |
| 5.4 flattening (3530) | uniform on S₃; A₃ | 1/6; 1/3 | consistent |
| 5.4 primitivity (3540) | {2,3}; 2T+2 | fail at 6; not primitive | consistent |
| 5.4 saturation (3566) | −6, 8, 0 | O₂ yes, no (Ω=3), never | consistent |
| 5.4 walk data (3596) | m=2,L=1; S₃ transpositions | identity mass 2; P spectrum 1,0,−1, T: 1,1/2,0 | consistent |
| 5.4 local densities (3621) | f=a²+b² at 3,5; f=a at 3 | 0; 40/120=1/3; 6/24=1/4 | consistent |
| 5.4 conditioning (3642) | m=2,ρ=1/2,L=2 | X=16, τ=1/2, X^τ=4 | consistent |
| 5.4 level (3679) | dim 3, τ=1/2, δ=1/12; 1/6 | −1/4; 0 | strict margin needed |
| 5.4 escape (3693) | ρ=1/2, L=12 | scale 16, Bertrand p=17; 1/17, 289/4096 | consistent |
| 5.4 explicit bound (3717) | t=2,dim 3,d=2,τ=1/2,C=r=3 | 216; 2·18.01/0.1665=216.34<217 | consistent |
| 5.5 Chen weight (3745) | N=1000: n=11,286,3,27 | 1,0,1/2,1/2 | consistent |
| 5.5 local factor (3770) | C₆,C₁₀,C₁₈ | 2C₂,(4/3)C₂,C₆ | consistent |
| 5.5 constants (3795–3833) | V=1/2+(3/4)log(9/8)−(3/2)log(4/3)−(1/4)log 2 | −0.016473 (printed lower endpoint −0.0164725 is above it); 8(log 4−(1/2)log 8+V)=2.6408; 2.6408−1.9702=0.6706 | consistent |
| 5.5 chen_goldbach, chen_prime_shift (headlines) | Ω filter | 1≤Ω≤2 excludes units, includes p² | consistent with Theorems 1–2 |
| 5.6 ideal symbol (3839) | ℚ: 0/𝒪, 2/(5), 4/(5), 15/(5); degree 2: 2/(5𝒪_K) | 1,−1,1,0; 1 (inert: square in F₂₅; split: (−1)²; ramified: square) | consistent |
| 5.6 reciprocity (3871) | 3,7; −1,−1 | (−1)(1)=−1 with (3,7)₂=−1,(3,7)_∞=1; 1=(−1)(−1) | consistent |
| 5.6 divisor bounds (3887) | τ(4), X=4,k=2 | 3; 18 | consistent |
| 5.6 FIMR conversion (3905) | exponent | 1−ϑθ/(2+θ) | matches Prop. 5.2 |
| Supplier ANT-II §5.29 (75) | M=1,N=3,a=(1,0,−1); (1,0,1) | 0 and 4, energy 2 | matches supplier Check |
| Supplier ASP-V §3.30 (79) | n=3,\|S\|=1,δ=1 | 54·3·37=5994 | consistent |
| Supplier EPP §3.1 (132) | x=1,y=(1,2) | 5; max row 6 | consistent |

**Shape.** The README has the house shape (Summary, Scope and ownership, Conventions, Exact supplier contracts by supplier, How to read the build, Layers 0–5 with k.n subsections, Examples and Dependencies per layer, Downstream consumers, Source-sensitive conventions, References). Definitions carry API bullets and at least three Checks; theorems carry hypotheses, locators and *Needs:* lines; no process words, pull-request numbers, LaTeX delimiters or machine paths (gate scanners all 0).

## Not verifiable

- BGS-10, DFI-1997 and FIMR-ERRATUM-2015 are settled uncertified; CHEN-73-CN, HR-SIEVE, RICHERT-1969, KM-16RANK-published and KM-KERNEL-PUBLISHED are waived: their locators (§§5.4, 5.5, 5.6, 1.1 and the erratum-corrected progression reduction of §5.3) were checked for internal consistency with the README only.
- Maynard's 42-coefficient M₁₀₅ certificate: I checked that the displayed ratio equals the displayed ΣJ/I exactly and exceeds 4; the values of I and ΣJ from the coefficient table were reproduced by the previous review, not recomputed here.
- The Jutila OCR text drops superscripts; Lemma 2's exponent 8 and Lemma 3's (12) were read from a ghostscript rendering of printed p.194.

## Source issues

- **Error** in KED-ANT-18 at Corollary 18.6, §18.3: the source attaches the Δ saving to the support length y of g although hypothesis (18.1.1) is imposed on f; it should be `(Δx+Q)^{1/2}(y+Q)^{1/2}`; affects a stated result.
- **Misprint** in KED-ANT-18 at Theorem 18.5, §18.3: the summand evaluates the discrepancy at a free residue m while the sum binds a; it should be `|D_f(x;N,a)|²`; affects nothing.
- **Misprint** in KED-ANT-12 at Theorem 12.2, §12.4: the lower main-term bound is printed as `V⁻(z) > (1+e^{β−s}K^{10})V(z)`; it should be `1−e^{β−s}K^{10}`, as the consequence display has; affects nothing.
- **Error** in KHAYUTIN-19 at Proposition B.8, (69)–(72), printed pp.270–271: the k=1 sum is printed with the factor `(ωu/p)`; it should be `(−ωu/p)`, since at p=3, u=u_A=ω=1, ε=−1 the direct count is 18 and the printed formula gives 9; affects a stated result.
- **Error** in KHAYUTIN-19 at Lemma B.4, printed pp.266–267: the smooth contribution at level n for m≥1 is printed as 1−χ-type; it should be `(p−1)(1+χ)p^{n−1}`, since p=3, q₀=x²−y², m=n=1 has 5 zeros, not 1; affects a stated result.
- **Error** in MAYNARD-2015 at Lemma 8.1, definition of `G_{b,j}`, printed p.409: the sum over r starts at 1, making `G_{0,j}=0`; it should start at r=0 so that `G_{0,j}=1`, since the integral at k=5, a=2, b=0 is 1/2520; affects the proof (the numerical results (8.15)–(8.17) are unaffected).
- **Misprint** in MAYNARD-2015 at proof of Theorem 1.1, printed p.391: "less than k" should be "at most k", since the case p=k occurs when k is prime; affects nothing.
- **Gap** in HB-SIEVES at (3.6), printed p.18: the Brun–Titchmarsh bound is stated for `x≥4φ(k)` while the derivation assumes `x≥4k`; the stated range is wider than the one proved; affects a stated result's range only.
- **Gap** in BOMBIERI-1971 at p.404, definition of the bins I_m: bins with `(m+1)δ>1/2` are excluded although off-diagonal points can lie in them (δ=3/10, points 0 and 2/5); the packing argument should intersect each bin with [0,1/2]; affects the proof.
