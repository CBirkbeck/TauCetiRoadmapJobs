<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/578#issuecomment-6321283086 -->
Red team round 1 pass b (claude) of c04d6b7

Verdict: needs_changes

1. **F01** (P3) Layer 6 targets use the ξ operator defined in Layer 8 without naming it as a need

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md:772` (`unaryCorrection_xi`: "ξ_(1/2) C(a,b)=−√2 g(a,b), and ξ_(1/2)[C(a,b;dτ)]=−√(2d)g(a,b;dτ)") and `README.md:803` (`torsionLerchCompletion_xi`: "The xi-image is obtained by the explicit derivative of R").

   Claim: the operator ξ_k is "the explicit differential expression specified in §8.2" (README line 774) and §8.2 is not in the `*Needs:*` of §6.1 (line 776) or §6.3 (line 807).

   Witness: ξ_k is first defined at `README.md:935` (§8.2, "Put ξ_k F=2iy^k conj(∂barτ F)") and in Lean only at `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean:518` (`maassXi`, under the Layer 8 header). A Layer 6 statement therefore mentions a carrier introduced two layers later (defect class 11).

   Repair: move the two light definitions `wirtingerBar` and `maassXi` (and the sentence "Put ∂barτ=(∂x+i∂y)/2 and ξ_k F=2iy^k conj(∂barτ F)") into §5.3, immediately after E and β, as "the holomorphic-weight xi expression"; keep every modular statement about ξ in §8.2. Then write `*Needs:* §5.1; §5.3; `gap:classical-metaplectic-model`; TauCetiRoadmap.ThetaSeries Layer 1.` unchanged in §6.1 (ξ is now supplied by §5.3) and in §8.2 replace "Put ξ_k F=2iy^k conj(∂barτ F)" by "ξ_k is the expression of §5.3". In Suggested.lean move the two `noncomputable def` blocks and their four proved examples above the Layer 8 header, under a `/-! ## Layer 5: … -/` section. (The mathematics of both laws was verified: see the table.)

2. **F02** (P3) Two Check theorems carry `sorry` although their proofs are one line

   Location: `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean:58` (`zeroRing`) and `Suggested.lean:581` (`xiConstant`).

   Claim: both are README Checks ("`zeroRing`: The empty product is 1=0 in the zero ring", line 119; "`xiConstant`: ξ_k(1)=0", line 947) stated as sorry'd theorems, while the brief admits a sorry'd Check only when it "cannot be proved yet".

   Witness: `zeroRing` is `qPochhammerFin a q 0 = 0` under `[Subsingleton K]`, closed by `Subsingleton.elim`; `xiConstant` is the composite of the proved example at `Suggested.lean:530` (`wirtingerBar (fun _ => c) τ = 0 := by simp [wirtingerBar]`) with `star_zero` and `mul_zero`.

   Repair: replace the two `sorry` bodies by
   ```lean
   theorem zeroRing {K : Type*} [CommRing K] [Subsingleton K] (a q : K) :
       qPochhammerFin a q 0 = 0 :=
     Subsingleton.elim _ _

   theorem xiConstant (k : ℝ) (c τ : ℂ) : maassXi k (fun _ => c) τ = 0 := by
     simp [maassXi, wirtingerBar]
   ```
   (Elaboration was not run here; if `simp` leaves a goal, finish with `simp [maassXi, wirtingerBar, fderiv_const]`.)

3. **F03** (P3) The finite Schur polynomial identities of §3.2 have no locator into a text that states them

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md:360` ("Σ_(j≥0)Q^(j²)G(n−j,j)=Σ_(h∈ℤ)(−1)^h Q^(h(5h+1)/2)G(n,⌊(n−5h)/2⌋) … (Gasper1995, (4.2.11)–(4.2.12), p. 29, line 1672; finite identities are the author's Pascal derivation of these endpoints)").

   Claim: the two finite polynomial identities `schur_finite_first`, `schur_finite_second` and the recurrences `schur_finite_recurrences` are targets whose only locator is to the infinite Rogers–Ramanujan identities.

   Witness: Gasper1995 line 1672 through line 1680 displays the infinite series Σ q^{n²}/(q;q)_n and its product; no Gaussian-polynomial identity appears in Gasper1995 (grep for a finite or polynomial form returns nothing), nor in Pak2002. The identities are true (checked by hand for n=0,…,4: D₂=1+Q, D₃=1+Q+Q², D₄=1+Q+Q²+Q³+Q⁴, E₂=1+Q², E₃=1+Q²+Q³, and the recurrences D_n=D_(n−1)+Q^(n−1)D_(n−2), E_n=E_(n−1)+QⁿE_(n−2)), but a target without a locator is a policy defect (class 12).

   Repair: add a legal locator for the finite identities, for example G. E. Andrews, *The Rogers–Ramanujan identities without Jacobi's triple product*, Rocky Mountain J. Math. 17 (1987), the finite identities (1.3)–(1.4) and their recurrences (Project Euclid, open), fetched through the sources service and recorded in `sources.toml` with `cited_for = ["3.2"]`; if the service finds only a paywalled copy, record it `uncertified` and keep the author's derivation sentence.

4. **F04** (P3) Index letter reused inside the negative-index quotient definition of §1.3

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md:139` ("for j=−n<0 it is ∏_(j=1)^n∏_(b∈B)(1−bq^(−j))/∏_(a∈A)(1−aq^(−j))").

   Claim: the defining formula of Qⱼ for negative j binds the same letter j both as the coefficient index (j=−n) and as the product index (j=1,…,n).

   Witness: with j read as the outer index the product is empty or ill-formed; the two Checks at lines 149–150 (Q₋₁([3];[1];2)=−1, Q₋₁([3];[2];2)=0) only make sense with an inner index running over 1,…,n. The same clash does not occur in §1.2 (line 123), which uses j only as the inner index.

   Repair: replace "∏_(j=1)^n∏_(b∈B)(1−bq^(−j))/∏_(a∈A)(1−aq^(−j))" by "∏_(i=1)^n∏_(b∈B)(1−bq^(−i))/∏_(a∈A)(1−aq^(−i))".

No P1 or P2 finding survived verification. The four findings below are P3 (build order, a sorry on provable Checks, a missing locator, a notation clash). The dependency check reports no UPWARD or CYCLE line.

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `qPochhammerFin`, `_succ`, `qPochhammer_concat`, `qPochhammer_invert_base` | n=0,1,2; a=0 (invert needs unit: excluded by `Kˣ`); zero ring | n=2 expansion 1−a−aq+a²q; inversion n=1,2 verified; `n*(n-1)/2` natural subtraction correct at n=0 | none |
| `zeroBase`, `zeroRing` | q=0 with 0⁰=1; Subsingleton K | P_(n+1)(a;0)=1−a; 1=0 | R02 (provable) |
| `formalQPochhammerTail`, `_coeff_stable`, `formalFirstCoefficients`, `formalModTwo`, tail at a=0, full at a=1 | d=0,1,2; a=0,1; 𝔽₂ | coefficient d of the first d+1 positive factors is stable for N≥d; coeff₂ = −a(1−a); over 𝔽₂: 1+X+X² | none |
| `qPochhammerFin_tendsto(_pointwise)` | q=0; a unbounded | locally uniform on {‖q‖<1} (a locally bounded) | none |
| `baileyPair`, `baileyFirstRelation`, both examples | a=q=0; zero pair; n=1 | denominators (1−q)(1−aq), (1−aq)(1−aq²); unit pair at a=q=0 gives βₙ=1 | none |
| `qBinomial`, `qBinomial_largeBase`, `euler_qExponential` | q=0; a=0 at ‖q‖>1; z arbitrary in Euler | large base: Pₙ(q;q)=(−1)ⁿq^{n(n+1)/2}Pₙ(q⁻¹;q⁻¹); a=0 reduces to Euler, consistent with ‖0‖<1 | none |
| `ramanujanOnePsiOneTerm`, `_hasSum` | j=0,−1; b=0; b=q; a=b (empty annulus) | term −2/3 at (2,0,1/2,1/2,−1); every infinite denominator nonzero under hpos/hneg/annulus | none |
| §2.3 convergence table, q=0 formulas, negative-tail exponent d(n+1) | A=[],B=[0]; q=2,a=∓1/2; e=0,1 | ratios derived from Gasper (3.1.13); t₋₁=−q/z, t₋₂/t₋₁=−q²/z | none |
| §2.7 Bailey lemma and both limits | unit pair; ρ₂→∞ | one-parameter limit derived from the finite transform | none |
| `gaussianPolynomial` laws, §3.2 finite Schur identities and recurrences | n=0,…,4; k=n+1 | all polynomial identities hold; see R03 for the locator | R03 |
| `IsGapTwo`, `IsPlusMinusOneMod5`, `rogersRamanujan_count(_two)`, `_hasSum` | (4), (3,1), (2,2); n=0 | counts 1,1,1,1,2 and 1,0,1,1,1 | none |
| `quintupleProduct_hasSum` | q→0 to order q; z=1 | 1+z−(z³+z⁻²)q matches both sides; 2−2q−2q² at z=1 | none |
| `partitionRank`, `partitionCrank`, `rankCrankEmpty`, `partitionRank_conjugate` | (1), (3,2,1,1), (3,3), (2,2,2), empty | rank 0,−1,1,−1; crank −1,−1,3; empty 0 | none |
| `partitionResidueCount`, `_sum`, `filterOne`, `filterTwo`, `_filter_complex` | t=1; n=1; constant-zero statistic | orthogonality Σ_j ζ^{(s−r)j}=t·[s≡r] | none |
| §4.2 V, §4.3 C=V+(1−z)X, §4.4a five- and seven-dissections | n=0,…,6 by hand; mod 5 and mod 7 coefficients | V₁=ζ+ζ⁻¹−1=−(ζ+ζ⁻¹)²; V₄=0; seven-dissection coefficients 1,c₁−1,c₂,c₃+1,−c₁,0,−(c₂+1) match the crank counts of 0..6 | none |
| §4.4a eleven-dissection (corrected A₉) | q⁵,q¹⁶,q⁴⁹ (r=5), q¹²,q²³ (r=1), q⁶,q¹⁷ (r=6), computed numerically | V₅=−(c₂+c₄), V₁₆=0, V₄₉: all eleven crank counts 15775; V₁₂=0, V₂₃=c₁−1; V₆=V₁₇=0; Garvan (6.24) line 748 prints A₉ | none |
| `rank_equidistribution_five_seven`, `crank_equidistribution…`, `rankElevenFails`, `dissectionCrankFortyNine` | n=4,5,6 and 49 computed | equidistribution at 4,5,6; rank class 1 mod 11 at size 6 has 2; p(49)/11=15775 | none |
| `IsPartitionCongruenceOffset` and examples; `partitionCongruenceOffset_mod` | M=0,1,2,3,5,7,11,13,25,65,343 | 24·243=17·343+1; 24·19=7·65+1; reduction along N∣M | none |
| `partition_primePowerCongruences`, `sevenExponent` | r=1,2,3,4; ℓ=7 | p(243) mod 343 = 245 (computed; Watson1938 line 108), divisible by 49 not 343 | none |
| §4.8 alternating decimation offsets | ℓ=5,7,11; r=1,2,3,4 | shift exactly X at each step; δ(25)=24, δ(49)=47, δ(125)=99, δ(343)=243, δ(121)=116, δ(1331)=721 | none |
| §4.8a Ω₅(B⁻¹)=5b₅, Ω₇(B⁻¹)=7b₃+49b₇, transport L_r(x²⁴) | x-exponents 24k+19, 24k+17, 24k+13 | consistent with Ramanujan's identities and the eta weights | none |
| `qSeriesDecimation`, `_comp`, `_pullout`, `decimationNotMultiplicative` | t=0 (needs ht), t=1 | pullout fails at t=0, hypothesis present | none |
| §5.1 odd theta, `zwegersOddTheta_deriv_zero`, `oddThetaPair` | ν=±1/2 | ϑ=i e^{πiτ/4+πiz}jacobiTheta₂(z+(τ+1)/2,τ); pair i e^{πiτ/4}(e^{πiz}−e^{−πiz}); ϑ=−iq^{1/8}ζ^{−1/2}j(ζ;q) agrees with Zwegers (8) line 352 | none |
| §5.2 eta multiplier values | T, S, −I, τ=i | ν(S)=e^{−πi/4} with √τ; ν(−I)=−i; μ̂ factor under −I is 1 | none |
| §5.3 E, β; §5.4 h | x=0; z=±1/2 at τ=i | β(0)=1; h(1/2;i)=1 | none |
| §5.5 R: ∂bar_u R, elliptic, T, S | u=0 pair; u purely imaginary | ∂bar_u R=√(2/y)e^{−2πa²y}conj(ϑ(u;τ)) by direct differentiation (Zwegers (1.4) prints ϑ(u;−τ̄); the README's conjugate form is the one that is correct for Im u≠0) | none |
| §5.6 μ, `zwegersMu_eq_appellLerch`, residue, Mordell defect | q→0 leading term; u→0 | μ=−i e^{−πiτ/4+πi(u−v)}m(e(u−v),q,e(v)) verified to leading order and by the triple product; defect h/(2i) derived from μ̂'s S-law | none |
| §5.7 μ̂ laws, Zagier comparison | Zagier §2 lines 287–302, Thm 2.1 line 335 | θ_Z=−iϑ, μ_Z=iμ, μ̂_Z=μ_Z−R/2=iμ̂; same R | none |
| §6.1 g, C; `unaryCorrection_dbar`, `_xi`, `_period` | d>0 scaling | ∂barτ C=−i g(a,−b;−τ̄)/√(2y); ξ_{1/2}C=−√2 g; ξ_{1/2}C(dτ)=−√(2d)g(dτ); period form is Zwegers Prop 4.2(2) | R01 (ordering only) |
| §6.2 period integrals | a=1/2 boundary | Zwegers Thm 1.16 lines 835–849 | none |
| §6.3 stabilizer phase C_g and matrix entry | expanded from the modular and elliptic laws | both exponents reproduced | none |
| §7.1–7.3 cones, kernel, Q_c, Q⁺ | hyperbolic plane, boundary data (1,0),(0,−1); A=diag(1,−1) with c₁=(0,1), c₂=(1,2) | kernel 2 at (1/2,1/2), 0 at (1/2,−1/2); Q⁺ positive definite in the example; Q⁺≡0 for the boundary pair | none |
| §7.4 T and S laws | odd A=diag(1,−1): v=(1,1); hyperbolic: prefactor τ | T-law derived from nᵀAn≡diag·n mod 2 | none |
| §7.5 factorization | A=[−2], c=1 and c=2; a=1/4 | −C(1/4,0;2τ); two cosets −C(1/8,0;8τ)−C(5/8,0;8τ) | none |
| §8.2 operators, factorizations, zero modes, `maassLaplacian_eq_neg_xi_xi`, unitary constant | y^s, log y, iy, conj(q⁻¹) | Δ_k=−R_(k−2)L_k=−L_(k+2)R_k−k=−ξ_(2−k)ξ_k; Δ_k y^s=−s(s+k−1)y^s; ξ₀(conj q⁻¹)=4πq⁻¹; y^{k/2}Δ_k y^{−k/2}+(k/2)(1−k/2) at k=1/2 is 3/16 (MetaplecticAutomorphicForms §7.49) | none |
| §8.4, §8.4a kernel and modes | k=0,1; β<0, β>0, β=0 | H₀=e^w; ODE verified; H_k(2πβy)=−(−4πβ)^{1−k}K+δ_{β>0}H_k(2πβ)e^{−2πβ(y−1)}; y^{1−k}=(1−k)K_{k,0}+1 | none |
| §8.5 ξ-image coefficients, central action, parity | L=⟨2⟩, rank 0, k=1/2 and 0 | −conj(a⁻)conj((−4πn)^{1−k}); F_h=e^{πi(k−σ/2)}F_{−h}; 2k≡σ mod 2 | none |
| §8.7 Eichler integral, zero-frequency corrections | k=0,1; g₀=1 | ∂bar F⁻=(i/2)y^{−k}conj g; corrections y, y−1, log y | none |
| §9.1–9.5 | m=1 components; f=1+v+conj v, g=v⁻²; S-law weight | θ components, residue 1, weight k−1/2 with 1/(√(−iτ)√(2m)) | none |
| §10.1–10.2 | q=0; first coefficients 1,1,−2,3 | φ,ψ are Zagier's (q→−q) definitions, line 131; φ=f+2ψ; Q₃=q^{−1/24}θ₄/(−q;q)_∞; first correction −2C(1/6,0;3τ), shadow 2√6 g(1/6,0;3τ); ξH₃=−2√6 conj(g(−τ̄)) | none |
| §10.3–10.4 | constants at q=0; χ₀ to q³ | χ₀=2F₀−φ₀(−q) checked to q³; cone data (5,−2),(±2,5) and (5,−3),(±3,5) match Zwegers lines 4247, 4683; seventh-order A, c₁, c₂, e match line 3743 | none |
| §10.5–10.8 | M₅², M₇² | ((2/√5)M₅)²=I since sin²(π/5)+sin²(2π/5)=5/4; M₇²=I; matrices match Zwegers lines 3789–3804, 4423–4451 | none |
| §11.1–11.3 | α=1/2; q→0 | F_{1/2}=q^{−1/24}f−2C(1/6,0;3τ); shadow √(2/3)Σ_{n≡1(6)}nq^{n²/24} agrees with D/(2√6)Σχ₁₂(n)n e^{πinα}q^{n²/24}; the corrected Lerch expression (signs, q^{−1/6}) derived from Gordon–McIntosh line 938 with Zagier's θ, μ | none |
| `thirdOrderF`, `thirdRankSigns`, `thirdOrderF_rank` | q=0; derivatives | coefficients 1,1,−2,3 → f′(0)=1, f″(0)=−4, f‴(0)=18 (computed) | none |

## Dependency check

```
depcheck: 7 roadmaps, 45 edges, 0 problem(s)
```

## Verified sound

- Declarations read: all 16 definitions, 55 sorry'd theorems and 28 proved examples of Suggested.lean; every Lean name appears in the README; no `lemma`, no `set_option`, no `#eval`/`#print`, no sorry'd data, single `import Mathlib` plus one pinned `TauCeti.*` module, no pull-request numbers or process words in README or docstrings. Every sorry'd statement carries its hypotheses in its own signature (no section `variable`s).
- Targets read: all 101 README subsections (Layers 1–11), the conventions, the supplier contracts, the gaps and the downstream paragraph.
- Gaps: the three slugs of `design/plan.json` (`classical-metaplectic-model`, `analytic-elliptic-regularity`, `vector-bundle-dolbeault`) appear in the README with the identical `needs` sentence and named suppliers; each is precise and asks for nothing MetaplecticAutomorphicForms §§2.4b–2.6, PDE Lane E or ModularForms 10B already states (checked against the sibling texts).
- Pinned Mathlib declarations verified at `6b7abb3c…`: `Nat.Partition.ofSums`, `restricted`, `genFun`, `coeff_genFun`, `hasProd_genFun`, `hasProd_powerSeriesMk_card_restricted`, `card_restricted_eq_card_countRestricted`, `card_odds_eq_card_distincts`, `PowerSeries.expand`, `PowerSeries.coeff_expand` (exact `if p ∣ n then … else 0` form), `isUnit_iff_constantCoeff`, `invOfUnit`, `mul_invOfUnit`, `pentagonalSeries`, `WithPiTopology.hasProd_one_sub_X_pow` (CommRing, no NoZeroDivisors), `jacobiTheta₂`, `jacobiTheta₂_term`, `hasSum_jacobiTheta₂_term`, `jacobiTheta₂_functional_equation`, `hasDerivAt_jacobiTheta₂_fst`, `ModularForm.eta` (defined on ℂ), `eta_ne_zero`, `multipliableLocallyUniformlyOn_one_sub_pow`, `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable`, `ZMod.coe_mul_inv_eq_one`, `ZMod.val_lt`, `ZMod.natCast_zmod_val`, `HasFDerivAt.log`, `Real.hasDerivAt_log`, `Multiset.sort` (29 declarations).
- Pinned Tau Ceti declarations verified at `a91d3aaf…`: `TauCeti.conjugate`, `conjugate_parts`, `conjugate_conjugate`, `conjugate_parts_sort`, `CuspFormClass.eichlerIntegral_slash_apply` (integral weight k=n+2, arithmetic Γ, positive strict periods, as the README says), `TauCeti.Contour.residue`, `classicalResidueTheorem_circle`, `homologyCauchyTheorem` (8 declarations, files as cited).
- Sibling citations checked (24): MetaplecticAutomorphicForms §§2.4b, 2.5, 2.6, 4.7 (`finiteWeil_conjugate`, ρ_L = conj ω_L, T e_μ=e(q(μ)) in ρ_L), 6.18, 6.20, 7.1, 7.2, 7.49 (3/16 constant) at its current head; GeometryOfNumbersAndQuadraticArithmetic §4.3 (`qPochhammer`, `jacobiProduct`, `kronecker_single_identity`, `appell_lerch_difference_identity` with m(x,q,z)=j(z;q)⁻¹Σ(−1)^k q^{k(k−1)/2}z^k/(1−q^{k−1}xz)) at its current head; ClassicalArithmeticCompletion §§2.31, 4.20, 4.40, 4.60, 4.61; ModularForms Layer 0 and 10B; ContourIntegration Layers 2–3; PDE Lane E (smooth/Schauder only, so the analytic gap is real); IntegralLattices 0G, 1G, 1H; ThetaSeries Layers 1–3 (Fourier phase e(−⟪x,y⟫) as the README states). The downstream paragraph's `CB.1/nilpotent-matrix-count`, "q-binomial/Heine" and "gap G2" exist in the CountingBundlesAndHallAlgebrasOfCurves design README (lines 410–429).
- Locators verified against the cached texts (46): Zwegers2002 lines 217, 336–360 (Prop 1.3 incl. (8), (10)), 362–371, 485, 506–531, 640–643, 680–682, 734–745, 818–834, 835–849, 1275–1312, 1351–1356, 1409, 2308–2317, 2660–2668, 2673, 2745–2768, 2880–2915, 3082, 3101–3131, 3531–3552, 3603–3646, 3694–3743, 3759–3778, 3781–3808, 4081–4124, 4126, 4243–4248, 4329, 4415–4456, 4564, 4679–4684, 4770, 4857, 5029, 5104–5121; Zagier2009 lines 125–152, 163–243, 287–302, 327–339, 636–677, 898–965; BringmannOno2006 lines 270–337; BruinierFunke2003 lines 190, 366–383, 384–438, 461–470, 487–515, 626–699; Gasper1995 lines 81, 127, 135, 267–285, 294–323, 328–330, 437, 478–508, 605, 717, 761, 805–854, 1672; AndrewsGarvan1988 lines 10–23, 24–64, 69–88, 97–125; Andrews1986 lines 85–110, 241, 266, 450, 698; Garvan1988 lines 154–163, 419–443, 609–627, 668–684, 687–729, 747–749; Pak2002 lines 442–455, 3703–3755; BevilacquaChandranChoi2019 lines 39–44; Watson1938 lines 76, 108, 123–126, 409, 1081; Atkin1967 lines 28, 57–64, 95–106, 375–410, 481–484; KnoppMason2009 lines 188–241. Each supports the claim as stated; the README's deliberate corrections of Zagier's displayed Lerch expression (signs, q^{−1/6}) and of Garvan's printed A₈ were re-derived and hold.
- Checks tested: 63 README Checks instantiated (table above), including the five numerical ones recomputed by machine (p(243) mod 343, p(49)/11, rank classes at 6, crank classes at 4, 5, 6, 12, 23, 49, the signed rank counts of f). None is false, vacuous or a restatement; every definition has at least three discriminating Checks.
- Lean versus README: binders, instances and generality agree for all 55 sorry'd statements (commutative rings where the README says so, `CommSemiring` for decimation and the partition adapter, explicit `0 < τ.im`, `‖q‖ < 1`, `q ≠ 0`, `z ≠ 0`, annulus and pole-freeness hypotheses, `ContDiffOn ℝ 2` for the Laplacian factorization, `[Subsingleton K]`, `[NeZero t]`, `Nat.Coprime 24 M`). No hypothesis contains its conclusion; no `True` placeholder.
- Headlines: the easy headlines on existing carriers are present (q-binomial, Euler, Ramanujan 1ψ1, both Rogers–Ramanujan counting theorems and series, quintuple product, rank and crank equidistribution, prime-power congruences, odd-theta derivative, ξ/Laplacian identities, theta components, third-order f and its rank identification); none is forced through a stand-in.
- Build order: every `*Needs:*` points to an earlier subsection, a named supplier section that exists at its current head, a pinned declaration, or a declared gap, except the ξ-carrier noted in R01; no cycle; depcheck clean.

## Not verifiable

- Elaboration of Suggested.lean: the brief gives no Lean command and no round so far has compiled the file (PKG report, line 140). The 28 example proofs, in particular the `decide` proofs on `Nat.Partition.ofSums` values and the three `HasFDerivAt`-based xi examples, were checked by hand only.
- The integral eta-decimation modules of §4.8a (Watson's weighted spans O₅, E₅, E₇, O₇ and Atkin's level-11 basis with its exponents θ(n), ξ(n), ε(n)): the base identities Ω₅(B⁻¹)=5b₅ and Ω₇(B⁻¹)=7b₃+49b₇, the transport to L_r and the exponent bookkeeping were verified; the valuation inclusions themselves were not recomputed (they are Watson1938 §§3, 5 and Atkin1967 Lemmas 3, 7, 8, 13, 14, read at the cited lines).
- AtkinSwinnertonDyer1954 (rank dissections of §4.4a) and Hickerson1988 (seventh-order identities of §10.3a) are `uncertified` in `sources.toml` and were not read; the seventh-order identities were checked against Zwegers2002 lines 3697–3720 instead.
- The eleven-dissection of §4.4a was checked numerically only for the residues r=1, 5, 6 at sizes up to 49; the other eight components and the full rank dissections rest on Garvan1988 Theorem (6.7) and the uncertified rank source.
- Whether the sibling consumer CountingBundlesAndHallAlgebrasOfCurves' label `QSeriesPartitionsAndMockModularForms:QM.0` (its design README lines 254, 416) will resolve to a section of this README is the consumer's concern; this README has no section labelled QM.0.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c04d6b7f3db4c7b74b9f5650f572e2b98c2521f0", "job": "RT-QSeriesPartitionsAndMockModularForms~1b", "model": "fable", "worker": "chris-f"} -->
