<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/578#issuecomment-6323125323 -->
Red team round 2 pass b (claude) of 80d1354

Verdict: needs_changes

1. **F01** (P3) §3.2 proof sentence misdescribes Warnaar's d_n

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md:369`, "d_n counts gap-at-least-two partitions with largest part at most n−1; E_n counts such partitions with smallest part at least 2 and largest part at most n."

   Claim: the lowercase d_n is Warnaar's symbol, which the same subsection identifies with E_(n−2); it counts gap-two partitions with smallest part at least 2 and largest part at most n−2, not "largest part at most n−1". The intended object is the roadmap's D_n = e_(n+1).

   Witness: Warnaar2001 line 41 prints d₆ = 1+q²+q³+q⁴+q⁶ (parts ≥2, largest ≤4), while e₆ = D₅ = 1+q+q²+q³+2q⁴+q⁵+q⁶ (line 40) counts largest part ≤4 = n−1 for D₅. With "d_n" read as Warnaar's d_n the recurrence derivation that follows is for the wrong family.

   Repair: replace "d_n counts gap-at-least-two partitions with largest part at most n−1" by "D_n counts gap-at-least-two partitions with largest part at most n−1".

2. **F02** (P3) Suggested.lean admits one-line API laws that are neither end theorems nor milestones

   Location: `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean:24` (`qPochhammerFin_zero`), `:29` (`qPochhammerFin_succ`), `:34` (`qPochhammerFin_map`), `:40` (`qPochhammer_concat`), `:280` (`partitionSeries_coeff`), `:404` (`partitionResidueCounts_sum`), `:521` (`qSeriesDecimation_comp`), `:527` (`qSeriesDecimation_add_smul`); each ends "by sorry".

   Claim: the file may hold real-bodied definitions, sorry'd end theorems and milestones, and proved examples. These eight statements are unfolding lemmas closed by a pinned rewrite; leaving them admitted is the same defect round 1 repaired for the Checks (a-F02, b-F02).

   Witness: pinned `Finset.prod_range_zero`, `Finset.prod_range_succ`, `map_prod`, `Finset.prod_range_add` (`Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:556`), `Nat.Partition.coeff_genFun` (`Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean:60`, a simp lemma), `Finset.card_eq_sum_card_fiberwise` (`…/Finset/Basic.lean:993`), `PowerSeries.coeff_mk`.

   Repair: replace the eight `sorry` bodies by
   ```lean
   theorem qPochhammerFin_zero … := by simp [qPochhammerFin]
   theorem qPochhammerFin_succ … := by simp [qPochhammerFin, Finset.prod_range_succ]
   theorem qPochhammerFin_map … := by simp [qPochhammerFin, map_prod]
   theorem qPochhammer_concat … := by
     simp [qPochhammerFin, Finset.prod_range_add, pow_add, mul_assoc]
   theorem partitionSeries_coeff … := by simp [Nat.Partition.coeff_genFun]
   theorem partitionResidueCounts_sum … := by
     simp only [partitionResidueCount]
     rw [← Finset.card_univ]
     exact (Finset.card_eq_sum_card_fiberwise
       (f := fun p : Nat.Partition n => (s n p : ZMod t)) (fun _ _ => Finset.mem_univ _)).symm
   theorem qSeriesDecimation_comp … := by ext n; simp [qSeriesDecimation, mul_assoc, mul_left_comm]
   theorem qSeriesDecimation_add_smul … := by ext n; simp [qSeriesDecimation]
   ```
   (or delete them from the file and keep them as README laws). If a script leaves a goal, keep the statement sorry'd only after recording it as a named boundary target in the README, as the file rules require.

Two new findings, both P3. No P1 or P2 finding survived verification. Every round-1 finding is repaired at this head, and no repair introduced an error that I could detect without elaboration.

## Round-1 findings at this head

| Finding | Status | Witness at 80d1354 |
| --- | --- | --- |
| a-F01 (P2) missing finite Bailey headline | repaired | `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean:203` `baileyLemma_transform`: Bailey pair, units ρ₁ ρ₂, `hden` for both transformed denominators, conclusion `baileyPair a q α' β'`; α′, β′ match README §2.7 (line 322) and Andrews1986 line 93–102. |
| a-F02 (P3) admitted Checks | repaired | `zeroBase`, `zeroRing` (:62, `Subsingleton.elim`), `rankCrankEmpty`, `filterOne`, `filterTwo`, `decimationNotMultiplicative`, `xiConstant` (:672), `formalFirstCoefficients`, `formalModTwo`, `baileyFirstRelation` all carry explicit proofs; the Bailey example now rejects α=β=δ₁ at a=1,q=1/2 (β₁ would be 8/3), the formal examples inspect coefficients 1 and 2. |
| a-F03 (P2) Cartier owner | repaired | README line 13 and §4.7 line 578 `qSeriesDecimation_eq_cartier`, `cartier_ofPowerSeries` for 0≤a<t, §4.8a `etaDecimationOmega_eq_cartier`; matches `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:2962–2967` (coefficient at tn+a, r<q for the power-series comparison, cartier 0 r f = 0). Negative controls a=t and t=0 agree with that README's own checks (lines 2993–2994). |
| a-F04 (P1) unowned modular equations | repaired | `Suggested.lean:575` and `:584`; README §4.8a names both before the module targets and in the Needs line. Polynomials agree with Watson1938 line 417 ((3.2)) and line 1127–1128 ((5.2)); X=η(τ)/η(τ/ℓ), Y=η(ℓτ)/η(τ) is Watson's X=B/A, Y=C/B at 24τ. Independently recomputed: both residuals vanish through degree 129 in t=e(τ/ℓ); first terms 5t and 7t cancel as the Checks say. |
| a-F05 (P2) pinned erf API | repaired | README §5.3 line 695 `errorFunction_eq_erf`, `errorFunction_beta_eq_erfc`; supplier contract names `TauCeti.Real.erf`, `erfc`, `erf_zero`, `erfc_zero`, `erf_neg`, `hasDerivAt_erf`, `erf_pos`, `erf_lt_one`, `abs_erf_lt_one`, all present at the pin (`TauCeti/Analysis/SpecialFunctions/Erf.lean:51,54,64,68,72,92,140,186,196`), convention 2/√π·∫₀ˣ e^(−t²) as stated. E(x)=erf(√π x) and β(t)=erfc(√(πt)) verified by substitution. |
| a-F06 (P2) eta transformation owner | repaired | README §5.2 line 679–685 imports "ModularForms, Worked examples, target η²⁴=Δ"; `TauCetiRoadmap/ModularForms/README.md:1328` (Worked examples) and :1381 (η²⁴=Δ with eta's SL₂(ℤ) transformation). |
| a-F07 (P1) bilateral bridges | repaired | README §10.1a (line 1199) before §10.2; `Suggested.lean:777` `rankSeries_bilateral_hasSum` and `:790` `thirdOrderOmega_bilateral`. Zagier2009 line 937–945 gives the rank identity verbatim; BringmannOno2006 line 270–276 gives only ω's definition, as the README states. Both identities recomputed through degree 59 (see table). |
| b-F01 (P3) ξ defined in Layer 8, used in Layer 6 | repaired | `wirtingerBar` (:614) and `maassXi` (:618) now sit under the Layer 5 header; README §5.3 defines them and §6.1's Needs cites §5.3; §8.2 says "using ∂barτ and ξ_k from §5.3". |
| b-F02 (P3) `zeroRing`, `xiConstant` sorried | repaired | `:62` `exact Subsingleton.elim _ _`; `:672` `simp [maassXi, wirtingerBar]`. |
| b-F03 (P3) finite Schur locator | repaired | README §3.2 cites Warnaar2001 (1.4a)–(1.4b) line 49–65, (1.6) line 92–108, (1.3) line 45–48; the dictionary D_n=e_(n+1), E_n=d_(n+2) is right (checked against Warnaar's [n−1; ⌊(n−5j−1)/2⌋] and [n−r−1; r]); `sources.toml` records Warnaar2001 as certified open-repository. One misprint remains in the proof sentence: S01. |
| b-F04 (P3) index clash in §1.3 | repaired | README line 139 now reads ∏_(i=1)^n ∏_(b∈B)(1−bq^(−i))/∏_(a∈A)(1−aq^(−i)). |

No repair introduced a mathematical error: the moved definitions keep their bodies, the new signatures carry their hypotheses explicitly, and the new proofs use pinned names that exist (`Subsingleton.elim`, `Finset.prod_range_succ'`, `Finset.filter_true_of_mem`, `Ring.inverse_eq_inv`, `Finset.Nat.antidiagonal_eq_map`, `Complex.ofRealCLM`, `Complex.imCLM`, `HasFDerivAt.log`). Whether every new proof script closes is not verifiable here (see below).

## Adversarial mathematics pass

Rows are independent of the round-1 tables; "recomputed" means an exact integer computation done in this pass, "hand" a direct substitution.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `qPochhammerFin`, `qPochhammer_invert_base`, `zeroBase`, `zeroRing` | n=0,1,2; a=q=0; q=0 with 0⁰=1; `ZMod 1` | n=2 expansion 1−a−aq+a²q; inversion at n=1,2 by hand; P_(n+1)(a;0)=1−a; 1=0 in the zero ring | none |
| `formalQPochhammerTail(_coeff_stable)`, `formalFirstCoefficients`, `formalModTwo` | d=0,1,2; N=d and N=d+1; a=1 over 𝔽₂ | factor j≥d+1 has degree ≥d+2, so N≥d suffices; (1−a)(1−aX−aX²+…); 1+X+X² mod 2 | none |
| `baileyPair`, `baileyFirstRelation`, `baileyLemma_transform` | zero pair; unit pair at a=q=0; δ₁ at a=1,q=1/2; q=0,a=0 transformed pair | β₁=α₀/((1−q)(1−aq))+α₁/((1−aq)(1−aq²)); δ₁ gives 8/3≠1 (and 1 with n−r); transformed unit pair stays α=δ₀, β=1; Andrews1986 line 93–102 | none |
| `qBinomial`, `qBinomial_largeBase`, `euler_qExponential` | q=0; a=0 at ‖q‖>1; inversion (a;q)_n/(q;q)_n=(a/q)ⁿ(a⁻¹;p)_n/(p;p)_n with p=q⁻¹ | (1−az)/(1−z); large-base product (z/q;p)_∞/(az/q;p)_∞ including a=0; Euler coefficients 2, 8/3 at q=1/2 | none |
| `ramanujanOnePsiOneTerm`, `_hasSum` | j=0,−1; (a,b,q,z)=(2,0,1/2,1/2) and b=q; a=b | 1; (b−q)/((a−q)z); −2/3 and 0; every infinite denominator nonzero under `hpos`,`hneg`, annulus | none |
| §2.3 ratio tables, q=0 formulas | q=2,a=∓1/2; A=[],B=[0]; e=0,1 | d=s−r+r₀−s₀ rederived for both tails at both base sizes; radius 4; t₋₁=−q/z, t₋₂/t₋₁=−q²/z | none |
| `quintupleProduct_hasSum`, `quintupleProduct_thetaAddition` | n=0,±1 to order q; theta addition via triple product | 1+z−q(z³+z⁻²) on both sides; addition identity exact after reindexing | none |
| §3.1–3.2 Gaussian laws, finite Schur identities, recurrences, Warnaar dictionary | n=0,1,2; D₅,E₄ against Warnaar line 40–41 | q-Pascal at (1,1); 1+Q, 1+Q²; D_n=e_(n+1), E_n=d_(n+2) and both recurrences match (1.3) | S01 |
| `IsGapTwo`, `IsPlusMinusOneMod5`, `rogersRamanujan_count(_two)` | n=0,…,7 recomputed; (4),(3,1),(2,2) | counts (1,1,1,1,2,2,3,3) and (1,0,1,1,1,1,2,2) agree on both sides | none |
| `partitionRank`, `partitionCrank`, `partitionRank_conjugate`, `rankElevenFails`, `dissectionCrankFortyNine`, `crank_equidistribution_five_seven_eleven` | (1),(3,2,1,1),(3,3),(2,2,2); sizes 4,5,6,49; rank 1 mod 11 at 6 | (0,−1),(−1,−1),(1,3),(−1); one partition per crank class; all eleven classes 15775; rank class count 2 | none |
| `partitionResidueCount(s)_filter_complex`, `filterOne`, `filterTwo` | t=1; t=2 at size 1; constant-zero statistic | orthogonality Σ_j ζ^(j(s−r))=t·[s≡r]; classes 0 and 1 | none |
| `IsPartitionCongruenceOffset`, `_mod`, `partition_primePowerCongruences`, `sevenExponent` | M=0,1,2,3,5,7,11,13,25,65,343; p(243) | 24·243=17·343+1, 24·19=7·65+1; p(243)≡245 mod 343 and ≡0 mod 49 (recomputed); p(24)≡0 (25), p(99)≡0 (125), p(47)≡0 (49), p(116)≡0 (121) | none |
| §4.8 offsets and parity transport, §4.8a L_r(x²⁴)=CΩʳ(B⁻¹)/BΩʳ(B⁻¹) | r=1,2 for ℓ=5,7,11; odd→even and even→odd steps | δ₁=ℓ−m, δ₂=ℓ²−ℓ+δ₁ (4,24; 5,47; 6,116); pullout with C(x)=B(xˡ) reproduces both recurrence steps and the m=(ℓ²−1)/24 shift | none |
| `etaDecimation_modularEquation_five/_seven` | t-expansions through degree 129 | residuals identically zero; A⁵−B=5t+20t²+…, A⁷−B=7t+35t²+… | none |
| `qSeriesDecimation`, `_comp`, `_pullout`, Cartier comparisons | t=0,1,2; a=t; X,X² | U₀1 has every coefficient 1 whereas cartier 0 0 1=0; E_(t,t)(1)=0 vs cartier t t 1=X⁻¹ | none |
| `zwegersOddTheta_deriv_zero`, `oddThetaPair`, §5.1 laws | ν=±1/2; z=0 | reindexing of `jacobiTheta₂` gives Σ_(ν∈1/2+ℤ) i(−1)ⁿe^(πiν²τ+2πiνz); derivative −2πq^(1/8)+… agrees with −2πη³ | none |
| §5.2 `etaMultiplier` | T, S at τ=i, −I | e^(πi/12); e^(−πi/4)√τ with factor 1 at i; root i gives −i | none |
| §5.3 E, β, `errorFunction_tail_bound`, `wirtingerBar`, `maassXi` | x=0; t=0; u=√πt; constants, y, log y, iy | E=erf(√π·), β=erfc(√(π·)); β(x)≤e^(−πx)/(π√x); ∂̄y=i/2, ξ₀y=1, ξ₁log y=1, ξ₀(iy)=−i | none |
| §5.4–5.7 h, R, μ, μ̂ | z=±1/2 at τ=i; u=0 pair; residue at u=0; S-defects | h(1/2;i)=1; 2[1−E(√(y/2))]e^(−πiτ/4); −1/(2πiϑ(v)); Zwegers2002 line 471 gives the μ-defect h/(2i) and line 682 the R-defect h, so h/(2i)+(i/2)h=0 | none |
| §6.1 g, C and `unaryCorrection_dbar/_xi/_period` | ∂̄ of β(2ν²y)e^(−πiν²τ); scaling dτ | ∂̄C=−ig(a,−b;−τ̄)/√(2y), ξ_(1/2)C=−√2g, ξ_(1/2)C(dτ)=−√(2d)g(dτ); C is Zwegers2002 line 3531 R_(a,b), period form line 3545–3550; R(aτ−b)=−ie^(πia²τ−2πia(b+1/2))C(a+1/2,−b−1/2) | none |
| §7.1–7.5 cone data, kernel, Q_c, Q⁺, T-law, factorization | hyperbolic plane with (1,0),(0,−1); A=diag(1,−1); A=[−2], c=1,2 | kernel 2 and 0; Q_c(c)=−Q(c)>0; Q⁺≡0 for the boundary pair; T-phase e^(−2πiQ(a)−πiB(v,a)) with v=A⁻¹diag(A); −C(1/4,0;2τ) and the two cosets at scale 8 | none |
| §8.2 operators, `maassLaplacian_eq_neg_xi_xi`, zero modes, `fourierPolarShadow` | yˢ, y, y², log y, conj(q⁻¹); k=0,1,1/2 | Δ_k=−ξ_(2−k)ξ_k expanded; −s(s+k−1)yˢ; Δ₁log y=0; ξ₀conj(q⁻¹)=4πq⁻¹; unitary constant 3/16 | none |
| §8.4 H_k and ODE, §8.4a K-normalizations | k=0; β<0, β>0 (value and derivative at y=1), β=0 | H₀=e^w; b″−b+(k/w)(b′+b)=0 verified from Γ(1−k,−2w); both displayed K formulas hold | none |
| §8.5 ξ-coefficients, central action | n≠0 both signs; Z=(−I,i); (I,−1) | −conj(a⁻)conj((−4πn)^(1−k)); e^(πi(k−σ/2)); 2k≡σ mod 2 | none |
| §8.7 Eichler integral and zero-frequency corrections | ∂̄ at the moving endpoint; k≠1, k=1 | ∂̄F⁻=(i/2)y^(−k)conj g, ξF⁻=g; y^(1−k)/(1−k) and log y have ξ-image g₀ | none |
| §9.1–9.5 theta components, residues, polar kernel | m=1,l=0,1; f=1+v+v̄, v̄; R_(m,0)(0), R_(m,m)(0) | completing the square gives the displayed `jacobiTheta₂` argument; residues 1,0; 1 and 0 by ν↔−ν pairing | none |
| §10.1–10.3 third/fifth/seventh definitions and relations | q→0; coefficients to q⁴ | 2φ−f=f+4ψ=θ₄/(−q;q)_∞ to q⁴; f=1+q−2q²+3q³−3q⁴; ω=1+2q+3q²+4q³+6q⁴; χ₀,χ₁ constants 1; Q₃=q^(−1/24)(f+4ψ) | none |
| §10.1a bridges | degree ≤59 recomputed | (q²;q²)_∞ω = Σ_(n≥0)(−1)ⁿq^(3n(n+1))(1+q^(2n+1))/(1−q^(2n+1)) exactly; (q;q)_∞f = 1−4q²+4q³−… equals 2Σ_ℤ(−1)ⁿq^(n(3n+1)/2)/(1+qⁿ) | none |
| §10.2, §10.5–10.8 matrices and leading terms | T₃ on 2q^(1/3)ω(±q^(1/2)); T₅ entries; F₇ exponents | ζ₃ exchange; ζ₂₄₀^(−1), ζ₂₄₀^(71) exchanges; 143/168≡−25/168 | none |
| §11.2–11.3 shadow and residue filters | α=1/2; t=2 | D/(2√6)Σχ₁₂(n)n e^(πinα)q^(n²/24) reduces to √(2/3)Σ_(n≡1(6))nq^(n²/24) = 2√6g(1/6,0;3τ); deviations ±(1/2)q^(−1/24)f | none |

## Dependency check

```text
depcheck: 7 roadmaps, 45 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers cited are ClassicalArithmeticCompletion, GeometryOfNumbersAndQuadraticArithmetic, ThetaSeries, MetaplecticAutomorphicForms, ModularForms, ContourIntegration (Completed), PDE and IntegralLattices; the first, second and fourth are earlier in `merge-order/ORDER.txt` (lines 61, 112 for the two open ones), the rest are on main.

## Verified sound

- Declarations read: all 104 blocks of `Suggested.lean` (16 real-bodied definitions, 60 theorems, 28 proved examples). Every `def`/`theorem` name occurs in the README. No `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder, sorry'd data or admitted example; one `import Mathlib` plus the pinned conjugation module; no ambient `variable` block, so no hypothesis silently drops. At most two examples per kept definition.
- Targets read: all 69 numbered subsections, 74 Prove/Define/Construct paragraphs, 265 Check bullets, the conventions, supplier contracts, gaps, downstream paragraph and references. No pull-request number, process word, machine path or `sorry` in the README; the diff touches only the package folder (8 files).
- Lean versus README: every sorry'd signature carries its hypotheses explicitly and at the README's generality (`CommRing`/`CommSemiring` where stated, `‖q‖<1`, `q≠0`, `z≠0`, pole conditions, `0<τ.im`, `ContDiffOn ℝ 2`, `[NeZero t]`, `Nat.Coprime 24 M`). ℤ-exponents n(3n±1)/2 and 3n(n+1) are exact divisions; ℕ-exponent n(n−1)/2 is exact at n=0.
- Gaps: the three slugs in `design/plan.json` and the README agree; each `needs` sentence is specific; none asks for what the pins or main supply (checked PDE Lane E at line 322 is smooth/Schauder only; ModularForms 10B at line 1068 is line-bundle only).
- Supplier sections verified on main: ClassicalArithmeticCompletion §2.10 (line 2954, the five cited `cartier` names at 2962–2967), §2.31, §4.20, §4.40, §4.60, §4.61; ModularForms Layer 0 (line 259), 10B (1068), Worked examples (1328, η²⁴=Δ at 1381); ThetaSeries Layers 1–3 (423, 484, 587); IntegralLattices 0G (568), 1G (2131), 1H (667); PDE Lane E (322); ContourIntegration Layers 2–3 (158, 184).
- Pinned Tau Ceti names verified at a91d3aaf: `TauCeti.Real.erf`, `erfc`, `erf_zero`, `erfc_zero`, `erf_neg`, `hasDerivAt_erf`, `erf_pos`, `erf_lt_one`, `abs_erf_lt_one`; `TauCeti.conjugate`, `conjugate_parts`, `conjugate_conjugate`, `conjugate_parts_sort`; `TauCeti.Contour.residue`, `classicalResidueTheorem_circle`, `homologyCauchyTheorem` (in the cited file); `CuspFormClass.eichlerIntegral_slash_apply` (17 names).
- Pinned Mathlib names verified at 6b7abb3c: `PowerSeries.coeff` and `constantCoeff` with implicit ring (as the file uses them), `coeff_expand`, `ModularForm.eta` on ℂ, `eta_ne_zero`, `multipliableLocallyUniformlyOn_one_sub_pow`, `jacobiTheta₂_term`, `hasSum_jacobiTheta₂_term`, `hasDerivAt_jacobiTheta₂_fst`, `jacobiTheta₂_functional_equation`, `Nat.Partition.ofSums`, `genFun`, `coeff_genFun`, `hasProd_genFun`, `hasProd_powerSeriesMk_card_restricted`, `card_restricted_eq_card_countRestricted`, `card_odds_eq_card_distincts`, `UniquePartitionZero/One`, `pentagonalSeries`, `hasProd_one_sub_X_pow`, `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable`, `ZMod.coe_mul_inv_eq_one`, `val_lt`, `natCast_zmod_val`, `HasFDerivAt.log`, `Ring.inverse_eq_inv`, `Finset.filter_true_of_mem`, `Finset.Nat.antidiagonal_eq_map`, `Finset.prod_range_succ'`, `Complex.ofRealCLM`, `imCLM` (34 names).
- Locators verified against the cached texts (this pass): Zwegers2002 lines 430–483, 680–700, 3531–3554; Watson1938 lines 405–425, 1115–1135; Warnaar2001 lines 40–110; BringmannOno2006 lines 268–282; Zagier2009 lines 935–946; Andrews1986 lines 85–110. Each supports the claim cited, with S01 the only misstatement found. `sources.toml` parses, records Warnaar2001 with sha256, licence class and status, and contains no local path.
- Checks tested: 41 Check bullets instantiated (table above), eleven of them by exact recomputation (Watson 5 and 7 through degree 129, p(243), the four prime-power progressions, Rogers–Ramanujan counts n≤7, crank classes at 4, 5, 6 and 49, rank class at 6, both bilateral bridges through degree 59). None is false, vacuous or a restatement; every definition has at least three discriminating Checks.
- Headlines: present and unforced (q-binomial and both large-base forms, Euler, 1ψ1, Rogers–Ramanujan counts and series, quintuple product, equidistributions, prime-power congruences, Watson's two modular equations, finite Bailey transformation, odd-theta derivative, ξ-factorization, theta components, third-order f with its rank identification, both bilateral bridges).
- Build order: every `*Needs:*` points to an earlier subsection, a verified supplier section, a pinned declaration or a declared gap; §10.1a precedes §10.2 and §11.2; §5.3 precedes §6.1 and §8.2.

## Not verifiable

- Elaboration of `Suggested.lean`: the brief permits no Lean command, so the 28 example proofs and the ten repaired Check proofs (in particular `filterTwo` by `norm_num` over `Finset.univ` of `Nat.Partition 1`, `baileyFirstRelation` by `simpa`, and the `decide` proofs on `Nat.Partition.ofSums`) were checked by hand only; no round so far has compiled the file.
- MetaplecticAutomorphicForms and GeometryOfNumbersAndQuadraticArithmetic are open pull requests not among the six checkouts supplied to this pass; their cited sections (§§2.4b–2.6, 4.7, 6.18, 6.20, 7.1, 7.49; §4.3) are unchanged since round 1, where both passes verified them at heads 297a40c9 and 01c64f0c.
- Watson's integral modules O₅, E₅, E₇, O₇ (the weights 5^(5n), 5^(5n+2), 7^(7n+k)) and Atkin's level-11 basis exponents θ, ξ, ε: the OCR of Watson1938 §§3, 5 and Atkin1967 Lemmas 3–14 does not let me recompute the valuation inclusions; only the base identities Ω₅(B⁻¹)=5b₅ and Ω₇(B⁻¹)=7b₃+49b₇ and the transport were checked.
- AtkinSwinnertonDyer1954 and Hickerson1988 are uncertified in `sources.toml` and were not read; the eleven-dissection components other than those recomputed in round 1 rest on Garvan1988 (6.7).
- The full §10.5 and §10.7 correction vectors beyond their leading exponents and the §6.3 matrix-entry phase were compared with the sources only in round 1.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "80d1354683d92fdc5a7ac5190e107f80706c669e", "job": "RT-QSeriesPartitionsAndMockModularForms~2b", "model": "fable", "worker": "chris-f"} -->
