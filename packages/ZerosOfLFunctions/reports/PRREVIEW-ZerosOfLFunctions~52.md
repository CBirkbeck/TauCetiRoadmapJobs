# Review of ZerosOfLFunctions (pull request #3012 at 8cc0030)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The layers that the two revised `*Needs:*` lines (3.1 and 6.5) now attribute to the L-functions roadmap are the layers holding the cited declarations, both on main and at the open L-functions revision, and the description states the change correctly. The previous review raised no findings. There is one small correction (two further `*Needs:*` lines have the same bare-layer wording) and no format notes. Two slips in sources are recorded below, and two points are left to the human reviewers: the licence of the PrimeNumberTheoremAnd provenance, and the unread text of Davenport.

## C01 — Two more `*Needs:*` lines keep a bare layer number after an L-functions citation, the ambiguity this change removes from 3.1 and 6.5

In 1.6 (line 488) the list that opens with "L-functions Layer 0 `HasDirichletAgreement`" ends "Layers 3 and 5 for the family comparisons". In 5.6 (line 1164) it reads "L-functions Layers 3 and 5, and Layer 7 `heckeLFunction_ne_zero_of_one_le_re`". Both mean the supplier's layers, as the dependency lists of Layers 1 and 5 say (lines 522 and 1226). This roadmap's own Layers 3, 5 and 7, however, are convexity, Hadamard and Riemann–von Mangoldt. Read as this roadmap's own, 1.6 would need Layer 3, and 3.4 needs 1.6. Here a comma comes before the bare number, not a semicolon, so these are milder than the two lines the change repairs. Writing "L-functions Layers 3 and 5" in 1.6 and "L-functions Layer 7" in 5.6 would leave only one reading.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2 Stirling on `S_δ` (DLMF 5.11.1, §5.11(ii)) | `s = 2` | *logGamma* `= 0`; main terms `−0.041341`; gap `0.041341 ≤ 1/24 = 0.041667`, the first neglected term | true | none |
| 1.4 digamma values | `ψ(1/2)`, `ψ(3/2)`, `logDeriv Gammaℝ 2` | series `−1.963510`, `0.036490`; closed forms `−γ−2log2`, `2−γ−2log2` equal; `−0.860973` | true; DLMF 5.4.13/15, 5.5.2 match | none |
| 2.2 two-sided comparison | `ζ` record, `[−5,5]` | `t=0`: factor in `[3,8]`, `(8/3)·3 = 8`; `t=10`: `[13,18] ⊆ [13, 34.67]` | true, `C₁=1`, `C₂=8/3` | none |
| 3.4 convexity exponent | `σ = −δ, 1+δ, 1/2` (`δ=0.1`) | `0.6 = 1/2+δ`; `0`; `0.30 = 1/4+δ/2`; character mod 4 at `2`: orders `0` and `1` | true | none |
| 3.1 (diff) Mellin tail and citations | `R=0, c=α=1` | tail `0.2194 < e⁻¹ = 0.3679 < Γ(1) = 1`; cited names at L-functions Layer 3 and Layers 5–6 sections | true; layers as now written | none |
| 4.3 Jensen bound | `f = z/10, r=1, R=2, M=1` | scaled form `log5/log2 = 2.32`, trailing form `3.32`, true count `1`; hypotheses match `AnalyticOnNhd.sum_divisor_le` | true | none |
| 4.5 counting functions | `T = 0`, ordinates | `(T+7/2)/(T+3) = 7/6` at `0`; `N(14)=0`, `N(15)=1`; `N±(100) = 58 = 2·29` | true | none |
| 4.6 Nevanlinna comparison | `z²(z−3)`; `1/z` | `r=2,R=4`: `1.386 ≤ 1.674`; `r=3,R=5`: both `1.5325`; signed carrier for `1/z`: `0 ≤ −log(R/r)` false | true; positive part needed | none |
| 5.2 *E₁* | `z = −1/2`, `z = 1` | `‖E₁−1‖ = 0.0902 ≤ 0.125`; `deriv E₁ 1 = −e`; `logDeriv E₁(s/ρ) = 1/(s−ρ)+1/ρ` | true | none |
| 5.5 Hadamard, order ≤ 1 | `1 − s`; `ζ` | `exp(−s)E₁(s) = 1−s`, `b=−1`; `b_ζ = −0.0230957` | true | none |
| 6.2 Dedekind region (Kadiri Thm 1.1) | cap at `n=1`; principal mod 2 | `(log3/2)/log3 = 1/2`; region edge `0.6934`; Kadiri (1.7)–(1.8) for `d_K` large | true; locator supports | none |
| 6.4 Hecke region (LMO via Kadiri (1.5)–(1.6)) | factors at `iγ` | each in `[|γ|+3, |γ|+4]`; nesting factor `1+log(4/3)/log3 = 1.2619 < 1.27` | true (see source issues) | none |
| 6.5 (diff) edges | `χ₋₄` at `1`; `ζ_K` at `1`, `1+it` | completion `2·(1/π)·(π/4) = 0.5`; cited orders `−1`, `0` (L-functions Suggested lines 977, 2688) | true; layers as now written | none |
| 7.6 corollaries | fixed `K`, averaged count | `N±/(T log T) → n/π`, one-sided `n/(2π)`; `∫₀ᵀ(N(t+1)−N(t)) = ∫_T^{T+1}N − ∫₀¹N` | true | none |
| 8.6 Hecke instance | `χ₋₄`; quartic mod 5; `ℚ(√3)` | `logDeriv Gammaℝ 3 = −0.554120` vs `−0.860973`; prime side `−(i log2)/2`; `log12 = log4+log3 = 2.4849` | true | none |
| 8.7 ray class | thresholds `q = 1, 3, 10⁶`; `x = 9` | `log x = 0.6957, 2.4958, 190.868`; class of 3: `log21 = 3.0445` vs base-selected `log63 = 4.1431` | true | none |
| 1.6, 5.6 (C01) | own-layer reading | 1.6 → 3.4 → 1.6 loop; dependency lists (lines 522, 1226) name L-functions Layers 0, 3, 5, 7 | wording only | C01 |
| `riemannZeta_zeroFreeRegion` | `s ∈ (0,1)`, `−2`, `1` | `ζ(s) < 0`; `−2` in region only if `c ≥ 3log3 = 3.296`; `s = 1` excluded | true | none |
| `dedekindZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion` | trivial zero at `0`, pole, `n = 0` | `0` in region only if `c ≥ n log3`; order at `1` is `−1`; `finrank ≥ 1` | true | none |
| `dirichletLFunction_zeroFreeRegion` | principal mod 6 | double zero at `0` enters at `c ≥ log18 = 2.890 > log3/2 = 0.549` | true; cap needed | none |
| `riemannVonMangoldt` | `T = 100` | count `29`; main term `28.127`, plus `7/8` gives `29.002` | true | none |
| `riemannVonMangoldt_dedekindZeta` | HSW Thm 1.1, `T ≥ 2` | `0.22737 + 27.79482/log2 = 40.327 < 41` | true | none |
| `riemannVonMangoldt_heckeLFunction` | shift `1` at a real place | Stirling shift changes the main term by `O(1)` per factor, absorbed since `log(A Tⁿ) ≥ n log2` | true | none |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100` | count `58`; main term `56.255 = 2·28.127` | true | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | `ρ = 0`; `s = ρ`; values | factor `E₁(0)^0 = 1`; product `0` still a `HasProd` (InfiniteSum/Defs.lean:107); `1, 1, π/3, 1.147880` at `0, 1, 2, 3` | true | none |
| `riemannZeta_zeros_summable_ordinate` | first pair; trivial zeros | `0.0099606`; trivial zeros of `riemannZeta` would add `1` each | true | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ = 2|t|`, `t → 0` | left `1/(4|t|)`, `log|t| → −∞`; hence `t₀ > 1` | true | none |
| `chebyshevPsi_explicitFormula` | `K = ℚ`, `x = 2` | `c_ℚ = −log2π = −1.8379`; `−½log(1−1/4) = 0.1438` | true | none |
| Weil formulas (`riemannZeta_`, `dedekindZeta_`, `heckeLFunction_weilExplicitFormula`) | `φ̌`; `ℚ(i)` | `mellin φ̌ s = φ̃(1−s)`; discriminant term `2·½log4·φ(1) = 1.3863 φ(1)` | true | none |
| `primeIdealCount_effective` | `K = ℚ`, `x = 10` | `ψ−ϑ = log12 = 2.4849 ≤ 12.094`; `Li 10 = 5.1204`, `π(10) = 4` | true | none |
| `rayClassPrimeCount_effective`, `primeCounting_progression_effective` | `q=4`, `a=3, 2`, `x=20` | `4` vs `Li20/2 = 4.4301`; at `a=2` count stays `1` | true; coprimality needed | none |
| `frobeniusPrimeCount_effective_abelian` | `K = L = ℚ`; quadratic | `π(x) = Li x + O(…)`; exceptional terms `±x^β/(2β)` sum to `0` | true | none |
| `finite_zero_sum_le_logDeriv`, `gammaLogDerivBound` | `σ+κ ∈ [1,3]` | `C_Γ = 1.572365`; `‖logDeriv Gammaℝ 1‖ = 1.554120`; MV (10.37) rearranged agrees | true | none |
| `dirichletLFunction_convexity`, `completed_orderLE_one` | `q = 1`; `s = 2m` | `LFunction = riemannZeta`; `m log m` growth fits `exp(C‖s‖log‖s‖)` | true | none |

- Source locators checked against the text, 20 in all: DLMF 5.11.1, 5.11.2, 5.11.9, §5.11(ii), 5.4.13, 5.4.15, 5.5.2, 5.5.3, 5.15.1; kadiri2012 Thm 1.1, (1.5)–(1.6), §2.1.2; hasanalizade2022 Thm 1.1 and §1; bennett2021 Cor 1.2 and §1; trudgian2015 Thm 2; montgomery-vaughan2006 Thm 10.16 (p. 351) and Cor 10.18 (pp. 352–353).
- Library declarations opened at the pins: `AnalyticOnNhd.sum_divisor_le` (Analysis/Complex/JensenFormula.lean:389), `ValueDistribution.logCounting` and `log_counting_zero_sub_logCounting_top` (ValueDistribution/LogCounting/Basic.lean:351, 403), `Complex.borelCaratheodory` (BorelCaratheodory.lean:109), `Complex.digamma_one_half` and `digamma_apply_add_one` (Gamma/Digamma.lean:59, 64), `Real.convexOn_log_Gamma` (BohrMollerup.lean:111), `HasProd` (Topology/Algebra/InfiniteSum/Defs.lean:107); in Tau Ceti, the record predicates and `HasFunctionalEquation.eventuallyEq` (NumberTheory/LFunctions/Data/Basic.lean:174–196, 269), `primeCount` (ArithmeticDirichletSeries/Counting.lean:630) and `rayClassArtinMap` (ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:128).
- Name resolution: all 230 dotted backticked names were `#check`ed against Mathlib and the Tau Ceti modules that hold them, and 219 resolve. Of the other 11, six are structure fields written short (they exist), `TauCeti.perronFormula` is in the source with no compiled module (Perron/Ideal.lean:161), three are expressions, and `riemannZeta.N` belongs to PrimeNumberTheoremAnd.
- Cross-roadmap citations: the L-functions names of the diff are in L-functions `Suggested.lean` on main (lines 977, 1670, 2425–2550, 2680, 2688) and at the open L-functions revision in the same layers (315, 925, 1812, 1956, 2029). No open pull request drops an id this roadmap cites, and none changes this roadmap.
- Provenance: two PrimeNumberTheoremAnd declarations were read at commit `127b50e` (`Complex.Hadamard.hadamard_factorization_of_order`, `Complex.weierstrassFactor`); both are as the README describes, with no `sorry` in their files.
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The diff outside the folder is empty.
- Elaboration: `lake env lean` exits 0 with 23 ``declaration uses `sorry` `` warnings and nothing else. The file has no `variable`, `include` or `set_option`, so every binder is explicit; the elaborated signatures were compared with the README statements and nothing was lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `decide`): 0 of 23 close.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitZetaBounds, AnalyticNumberTheoryPartI and LFunctions (main), and SpecialFunctionsGamma and LiCoefficientsArithmeticFormula (open). Nothing is shared: each cites this roadmap's layers as a supplier (Stirling 1.2–1.3, counts, regions, the explicit formulas, Layer 9's *GRH*), and the Layer 9 predicate and the order-based predicate of RiemannHypothesisStatementsAndConsequences 9.3 are bridged there, with this roadmap the owner of its own.

Source independence: 23 passages compared with 6 sources (DLMF, kadiri2012, hasanalizade2022, bennett2021, trudgian2015, montgomery-vaughan2006). No wording is shared beyond formulae and standard names; the longest shared run is two words. Largest share: davenport2000, 18 of 69 source mentions. Contents compared with davenport2000's section titles: Layers 5–8 follow the order of its §§11–20, but the `*Needs:*` lines force that order (6.4 needs 5.6, 7.4–7.5 need 6.5, 8.2 needs 7.1), and each layer's scope is the roadmap's own (number fields, Hecke characters, Weil's formula, abelian Chebotarev; Layers 0–4 and 9 have no counterpart): independent.

Research link: 6.4 is the Lagarias–Montgomery–Odlyzko (1979) region behind their bound for the least prime ideal in the Chebotarev density theorem (kadiri2012 line 65–76). 7.5 is the count made explicit by Hasanalizade–Shen–Wong (2022) and Bennett–Martin–O'Bryant–Rechnitzer (2021). Rests on the README and those sources.

## Not verifiable

- davenport2000 §§11–20 (5.5, 8.6, 8.7 and others): settled as uncertified, cited by locator; the mathematics was computed instead.
- Titchmarsh §5.1 and Theorems 9.2–9.4 (3.4, 4.5, 7.4, 7.6): not in the roadmap's manifest, and no legal copy is recorded.
- Iwaniec–Kowalski §§5.1–5.2 (2.1, 3.3, 3.4): not in the manifest; the publisher's copy is paywalled.
- lagarias1979 Lemma 2.3 (6.4): uncertified; Kadiri's report of it (§1) was read instead.
- lang1994 XVII §3, Theorem 3.1 (8.4): uncertified.
- Lagarias–Odlyzko 1977 (8.8): cited as attribution, with no theorem number.

## Source issues

- **Error** in kadiri2012 at §1, (1.6), printed p. 2: the source says Lagarias–Montgomery–Odlyzko show that the Hecke L-function has no zero at all in region (1.6), which would rule out the exceptional zero that (1.5) allows and no known result excludes; it should say no zero other than the possible exceptional zero of (1.5); affects nothing.
- **Error** in montgomery-vaughan2006 at Corollary 10.18, proof of (10.38), printed pp. 352–353: the source says `ρ ↦ 1 − ρ` permutes the zeros of `ξ(s, χ)`, but for non-real `χ` it carries them to the zeros of `ξ(s, χ̄)`; it should be `ρ ↦ 1 − ρ̄`, which with `Re(1/ρ̄) = Re(1/ρ)` gives the same equality of sums; affects the proof.

## For the human reviewers

- **Licence.** The README's Provenance section (lines 2528–2552) maps nine sections to declarations of PrimeNumberTheoremAnd (Apache-2.0, commit `127b50e`) and asks that its authors be consulted before porting. Two of those declarations were compared with `Suggested.lean` this round: their names, binders and forms differ. The others were not compared.
- **Not tested.** davenport2000 has the largest share of locators (18 mentions) and is uncertified. Its text was not read, and its contents were compared only through its section titles (README References, line 3035).
