# Review of ZerosOfLFunctions (pull request #3012 at 8cc0030)

**Verdict:** accepted

**Summary.** Accepted, with no findings: every statement, Check and worked value that was recomputed holds, the readable sources support the statements at their locators, and the two revised `*Needs:*` lines (3.1 and 6.5) name the layers of the L-functions roadmap that hold the cited declarations. The head is the one the previous review read; that review had no findings, and its one small correction (two more `*Needs:*` lines with a bare layer number after an L-functions citation) still stands and is repeated as C01. There are no format notes and one question about a lemma number. Two points are left to the human reviewers: the licence of the PrimeNumberTheoremAnd provenance, and the unread text of Davenport.

## C01 — Two more `*Needs:*` lines keep a bare layer number after an L-functions citation, the ambiguity this change removes from 3.1 and 6.5

In 1.6 (line 488) the list that begins "L-functions Layer 0 `HasDirichletAgreement`" ends "Layers 3 and 5 for the family comparisons", and in 5.6 (line 1164) it reads "L-functions Layers 3 and 5, and Layer 7 `heckeLFunction_ne_zero_of_one_le_re`". The supplier's layers are meant: the dependency lists of Layers 1 and 5 (lines 522 and 1226) say "L-functions Layers 0, 3, 5" and "L-functions Layers 0, 3, 5 and 7", and `heckeLFunction_ne_zero_of_one_le_re` is in Layer 7 of the L-functions roadmap. But this roadmap's own Layers 3, 5 and 7 are convexity, Hadamard and Riemann–von Mangoldt, so a reader who takes the bare numbers as its own finds 1.6 needing Layer 3 while 3.4 needs 1.6, and 5.6 needing Layer 7. Writing "L-functions Layers 3 and 5" in 1.6 and "L-functions Layer 7" in 5.6 leaves one reading.

## Questions for the author

- In 6.4 (line 1341) and in the References (line 3076) the whole-strip region `Re s > 1 − 1/(R₄ (log A(χ) + n log (|Im s| + 2)))` is located at Lagarias–Montgomery–Odlyzko, Lemma 2.3. Kadiri's report (kadiri2012 lines 65–73) attaches Lemma 2.3 to the box `|Im s| < 1/(R₄ log A(χ))` of (1.5) and then says that the authors "also extend the region to the whole critical strip", (1.6), with no lemma number. Is the extension part of Lemma 2.3, or does it have its own number in that paper? The paper is paywalled and cited by locator, so it could not be opened.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 order predicate | `exp z²` at `r = 4`; `1/Γ(−5/2)`; `A < 0` | ratio `e^{16−8} = e⁸`; `Γ(7/2)/π = 1.0579 = 15/(8√π)`; `exp(r^{A'}) → 1`, so bounded | true; DLMF 5.5.3, 5.11.1 read | none |
| 1.3 vertical strips | `σ = 1/2`, `t = 5` and `t = 1` | exact `½ log(π/cosh 5π) = −6.93504`; formula `−7.85398 + 0.91894 = −6.93504`; at `t = 1`: `−0.6528` vs `−0.6519` | true; DLMF 5.11.9 read | none |
| 1.4 digamma, gamma log-derivatives | `ψ(1/2)`, `ψ(3/2)`, `Gammaℝ` at `2`, `Gammaℂ` at `1` | `−1.96351`, `0.03649 = ψ(1/2) + 2`; `−0.28861 − 0.57236 = −0.86097`; `−γ − log 2π = −2.41509` | true; DLMF 5.4.13, 5.4.15, 5.5.2, 5.11.2, 5.15.1 read | none |
| 1.4a symmetric form | `s = 2`; `s = −2` | left `−0.56996 + 1.98505 = 1.41509`, right `1.14473 + 0.28861 − 0.01825 = 1.41509`; junk case `−0.1648` vs `0.5541` | true; hypothesis needed | none |
| 1.5 gamma factor of a record | `gammaR = {0}`; `{0, 1}`; a `Gammaℂ` shift | exponents `(σ−1)/2`; `(σ−1)/2 + σ/2 = σ − 1/2`, the `Gammaℂ` exponent; rates `π/4`, `π/2` | true, consistent with duplication | none |
| 1.6 reciprocal and *continuedL* | `ζ` at `0`, `−1`, `−2`; record `1/((s−2)(s+1))` | `ζ(0) = −1/2` vs raw quotient `0`; `‖1/Gammaℝ(−1)‖ = π^{−3/2}Γ(3/2) = 0.15915`; `F(2) = 1`, `F(−1) = 0` | true | C01 (wording of *Needs:*) |
| 2.3–2.4 newform specialization | weight `12`, level `1` | analytic centre `(6+3)(7+3) = 90` = library value at `6`; same point `3.5 · 4.5 = 15.75` | true; `analyticConductorAt_eq` opened | none |
| 3.1 Mellin tail | `R = 0, c = α = 1`; `s = 2m` | `E₁(1) = 0.2194 < e⁻¹ < Γ(1) = 1`; substitution gives `c^{−(R+1)/α}Γ((R+1)/α)/α`; value `(2m)(2m−1)π^{−m}(m−1)!ζ(2m)` | true | none |
| 3.3–3.4 strip bound and convexity | `σ = −δ, 1+δ, 1/2`; gamma quotient | exponent `1/2+δ`, `0`, `1/4+δ/2`; per factor `(1+2δ)/2` real, `1+2δ` complex, total `(n/2)(1+2δ)` | true | none |
| 3.5 checks | `m = 10, 20` at height `2` | `π^{−10}·9!·0.9488 ≈ 3.677`; `π^{−20}·19!·0.9747 ≈ 1.352·10⁷` | true | none |
| 4.3 Jensen, trailing form | `z`; `z/10`; `1 − z/2` | `1 + log2/log2 = 2`; `1 + (log10 − log2)/log2 = 3.32`; `log2/log1.5 = 1.71`; hypotheses of `AnalyticOnNhd.sum_divisor_le` include `1 ≤ M` | true | none |
| 4.4 local count | discs; `T = 0`, `√15`; values | `3/2 + 1 ≤ 3`; sphere real parts `[−2, 6]`; `‖1 − (2+i√15)‖ = 4`; `6Λ(3) = 1.14788`; `30π⁻³·2·ζ(6) = 1.96866`; Jensen `2.19` | true | none |
| 4.5 counting functions | shift by `1/2`; `T = 100` | `(T+7/2)/(T+3) ≤ 7/6`; `⌈T⌉ ≤ 2T` for `T ≥ 1`; `N±(100) = 58 = 2·29` | true | none |
| 4.6 Nevanlinna comparison | `z²(z−3)` | `r=2,R=4`: `1.386 ≤ 1.674`; `r=3,R=5`: both `3 log(5/3) = 1.532` | true | none |
| 5.2–5.3 canonical product | `E₁(−1/2)`; `cos`; `1 − z` | `1 − 1.5e^{−1/2} = 0.0902 ≤ 0.125`; `∑‖ρ‖⁻² = 1`, paired product at `1` ≈ `0.540 = cos 1`; `1 − z = e^{−z}E₁(z)` | true; three Mathlib names opened | none |
| 5.5–5.6 Hadamard and corollaries | `logDeriv E₁(s/ρ)`; `ζ`; `χ₋₄`; `e^s ξ` | `s/(ρ(s−ρ)) = 1/(s−ρ) + 1/ρ`; `b = −0.28861 − 1 + 1.26551 = −0.02310`; `Λ(0) = Λ(1) = 1/2`; `f(1)/f(0) = e` | true; identity re-derived | C01 (wording of *Needs:*) |
| 5.6a ordinate summability | strip; first zeros | `‖ρ−2‖² ≤ 4 + γ² ≤ 4(1+γ²)`; `2/(1+199.79) = 0.00996` | true | none |
| 6.2–6.3 Dedekind region, cap | `n = 1`; principal mod 2 | `(log3/2)/log3 = 1/2`; `0` enters only at `c ≥ log 6`; Kadiri (1.7)–(1.8) need `d_K` large | true | none |
| 6.4 Hecke region | factors at `iγ`; containment in (1.5)–(1.6) | each in `[|γ|+3, |γ|+4]`; `1 + log(4/3)/log3 = 1.2619 < 1.27`; `log q(iγ) ≥ log A + n log(|γ|+2)` | true; lemma number is a question | none |
| 6.4 Checks, (4b), (4d) | mod 2, 6; `σ = 1.1`; `B = 10` | `0.6934`; `log 18 = 2.890`; `log 45.19 = 3.811`; `(log2)/3 = 0.2310`; `2·9.4410 − 10 = 8.882`; `3361` prime, `1681 = 41²` | true | none |
| 6.4a gamma constant, retained zeros | ends of `[1, 3]`; `S = ∅` | `C_Γ = 1.57236`; values `−1.55412`, `−0.55412`; `1.5/198.25 = 0.00757`; right side `≥ 1.807` | true; MV 10.16, 10.18 read | none |
| 7.1–7.3 rectangle, argument principle | `z`, `z − 2`, `1/z` on `[−1,1]²` | integrals `1`, `0`, `−1`; lift from `−3π/4` to `5π/4`; `2 − ζ(2) = 0.355 > 0` | true; `argumentPrinciple_nullHomologous` opened | none |
| 7.4 `riemannVonMangoldt` | `T = 100`; `T = 2` | main term `15.9155 · 1.76730 = 28.127`, count `29`; at `2`: `0` vs `−0.683` | true | none |
| 7.5 `riemannVonMangoldt_dedekindZeta` | HSW Thm 1.1, `T ≥ 2` | `23.02528 + 4.51954 + 0.25 = 27.79482`; `0.22737 + 27.79482/log 2 = 40.33 < 41` | true; source read | none |
| 7.5 `riemannVonMangoldt_heckeLFunction`, `_dirichlet` | imaginary quadratic; `q = 1` | `(T/π)log(T/2πe) + (T/π)log(|D|T/2πe) = (T/π)log(|D|(T/2πe)²)`; `58 = 2·29`; BMOR `0.298 log qT + 4.358` | true | none |
| 7.5 generic-record example | `1 + 5u + 2u²`, `u = 2^{−s}` | roots `−0.2192`, `−2.2808`; `Re s = 2.19`, `−1.19`, sum `1` | true | none |
| 8.1 truncated Perron | kernel at ratio `1` | `π⁻¹ arctan(T/c)`: `1/4` at `T = c`, `→ 1/2`; `truncatedPerronKernel_one` opened | true | none |
| 8.2–8.3 contour shift, `chebyshevPsi_explicitFormula` | `ℚ`, `ℚ(√5)`, `ℚ(i)` | residues `x`, `−m x^ρ/ρ`, `c_K − k log x`, `ord·x^{−m}/m`; `c_ℚ = −1.8379`; `−log(1/2) = log 2`; `Λ(x)/2 ≤ x log²x/T` | true | none |
| 8.4 Weil formulas (three) | `φ` supported near large `X` | shifting `A(φ)` left gives `−φ̃(0) − ∑_{k≥1} φ̃(−2k)`, matching the derivative of the `ψ` formula; `½ log 4` twice `= 1.3863` | true, signs agree | none |
| 8.5 `primeIdealCount_effective` | `x = 10`, `10⁶`; `ℚ(i)` | `log 12 = 2.4849 ≤ 12.094`; `16/3` vs `4`; `∑_{k≥2} π(x^{1/k})/k = 99.11`; `2 log 2 = 1.3863` | true | none |
| 8.6 `heckeLFunction_weilExplicitFormula` | quartic mod 5; `ℚ(√3)` | prime side `−(i log 2)/2`; `log 12 = log 4 + log 3`; `−1 = 0 + (−1)`; `L(0, ψ) = 1/6` | true | none |
| 8.7 `rayClassPrimeCount_effective`, `primeCounting_progression_effective` | thresholds; `(4)∞`, `x = 9`, `20` | `0.6957`, `2.4958`, `190.868`; `log 21` vs `log 63`; `4` vs `Li 20/2 = 4.4301`; `u = t^β` gives `Li(x^β) − Li(2^β) + 2^β/(β log 2)` | true | none |
| 8.8 `frobeniusPrimeCount_effective_abelian` | fibre sum; `(8)∞` | `#ker Φ/#Cl_𝔪 = 1/#G`; `(2/5) = (−2/5) = −1` | true | none |
| 8.9 logarithmic integral | `x = 10`, `10⁴` | `5.1204 − 4.3429 + 2.8854 = 3.6629`; `159.36` vs `117.88` | true | none |
| `hadamard_of_orderLE_one`, `zetaEntireCompletion_hadamard` | `ρ = 0`; constant `f` | `s/0 = 0`, factor `1`, exponent `0`; empty product `1` | true | none |
| `riemannZeta_zeros_summable_ordinate` | trivial zeros | `Λ(−2) = Λ(3) ≠ 0`, divisor `0`; over `riemannZeta` each would add `1` | true | none |
| `dedekindZeta_`, `heckeLFunction_`, `riemannZeta_`, `dirichletLFunction_zeroFreeRegion` | `n = 0`; trivial zero at `0`; principal mod 6 | no field of degree `0`; `0` in region only if `c ≥ n log 3`; double zero enters at `log 18 > log 3/2` | true | none |
| `completed_orderLE_one`, `finite_zero_sum_le_logDeriv`, `gammaLogDerivBound` | `Re s ≥ 1/2`; `S = ∅` | `‖L‖ ≤ 2q‖s‖`; identity gives `0 ≤` right side since gamma term `≤ C_Γ` | true | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ = 2|t|`, `t → 0`; `δ ≥ 1` | `2|t|/(8t²) = 1/(4|t|)`; left `≤ 0.570`, `−1/(1+δ−β) ≥ −1` | true; `t₀ > 1` needed | none |
| `dirichletLFunction_convexity` | `q = 1` | `LFunction = ζ`, exponent `1/4 + ε` on `|t| + 3` | true | none |

- Source locators read against the text, 19: DLMF 5.4.13, 5.4.15, 5.5.2, 5.5.3, 5.11.1, 5.11.2, 5.11.9, §5.11(ii), 5.15.1; kadiri2012 Thm 1.1 (lines 79–85), (1.5)–(1.6) (lines 65–73), §2.1.2 (lines 230–237); hasanalizade2022 Thm 1.1 (lines 52–54) and §1 (lines 37–50); bennett2021 Cor 1.2 (lines 83–84) and §1 (lines 73–78); trudgian2015 Thm 2 (lines 25–27); montgomery-vaughan2006 Thm 10.16 (line 1262, p. 351) and Cor 10.18 (lines 1315–1348, pp. 352–353).
- Library declarations opened at the pins, 45 located and 9 read in full: Mathlib `AnalyticOnNhd.sum_divisor_le` (Analysis/Complex/JensenFormula.lean:389), `PhragmenLindelof.vertical_strip` (PhragmenLindelof.lean:275), `Complex.digamma_one_half` (Gamma/Digamma.lean:59), `Complex.borelCaratheodory` (BorelCaratheodory.lean:109); Tau Ceti `argumentPrinciple_nullHomologous` (Analysis/Contour/Argument/Cycle.lean:110), `analyticConductorAt_eq` (ModularForms/Newforms/AnalyticInvariants.lean:133), `truncatedPerronKernel_one` (Perron/Basic.lean:204), `truncatedPerron_LSeries` and `norm_truncatedPerron_LSeries_sub_sum_le` (Perron/Formula.lean:130, 229), `HasFunctionalEquation` and `eventuallyEq` (LFunctions/Data/Basic.lean:193, 269).
- The pinned Tau Ceti has none of this roadmap's own objects (no `OrderLE`, `zeroCount`, `entireCompletion`, `hadamard_of_orderLE_one`, `gammaLogDerivBound`), so no item needs an `*In Tau Ceti:*` line at this pin, and nothing in `Suggested.lean` restates a pinned declaration.
- Cross-roadmap citations resolved: the seven L-functions names of the two revised lines, on main (L-functions `Suggested.lean` lines 977, 1245, 1670, 2432, 2680, 2688) and at the open L-functions revision in the same layers (lines 315, 599, 925, 1812, 1956, 2029, 2035); Arithmetic Dirichlet Series 2.3, 5.2, 6.1–6.4, 10.1–10.2; Chebotarev Layers 2, 11–14; Class Field Theory Layer 12; AnalyticNumberTheoryPartI §§0.30, 0.34b; the anchors of 1.2 and 1.3 that SpecialFunctionsEiLiErfIncompleteGamma links to are unchanged.
- Comparison with the README at the merge base: the change is 9 lines in two `*Needs:*` lines; no layer, item, heading or Lean declaration is removed, renamed or renumbered. Nothing outside the folder changes.
- Automatic checks: all passed. Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 23 ``declaration uses `sorry` `` warnings and nothing else. The file has no `variable`, `include` or `set_option`; every binder is in its declaration, and each signature was read against its README statement. One-tactic probe (`rfl`, `simp`, `norm_num`, `infer_instance`, `decide`, `trivial`, and the witnesses `0` and `1` for the existentials) on a copy of the file: 0 of 23 close.
- Pull request text: the title and the description state the change as the diff shows it (two lines, 3.1 and 6.5, three layer numbers); nothing to correct.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitZetaBounds, AnalyticNumberTheoryPartI and LFunctions (main), and LFunctions (open revision), SpecialFunctionsGamma and LiCoefficientsArithmeticFormula (open); nothing shared. Each cites this roadmap's sections as a supplier (1.2–1.4, 3.4, 4.3, 6.4–6.5, 7.1–7.4, 8.2–8.7, Layer 9), and the order-based predicate of RiemannHypothesisStatementsAndConsequences 9.3 is stated there for the L-functions of this roadmap, which keeps its own Layer 9 predicate.

Source independence: 24 passages compared with 6 sources (DLMF, kadiri2012, hasanalizade2022, bennett2021, trudgian2015, montgomery-vaughan2006), none shared beyond formulae and standard phrases (longest shared run four words, "at most one zero"); largest share davenport2000, 18 of 69 source mentions; contents compared with davenport2000 through its section titles only (its text is not readable): Layers 5–8 come in the order of its §§11–20, which the `*Needs:*` lines force (6.4 needs 5.6, 7.4 needs 6.5, 8.2 needs 7.1 and 5.6), and each layer's scope is the roadmap's own (number fields, ray-class characters, Weil's formula, abelian Chebotarev; Layers 0–4 and 9 have no counterpart): independent.

Research link: 6.4 is the Lagarias–Montgomery–Odlyzko (1979) region used for their bound for the least prime ideal in the Chebotarev density theorem (kadiri2012 lines 65–76); 7.5 is the count made explicit by Hasanalizade–Shen–Wong (2022) and Bennett–Martin–O'Bryant–Rechnitzer (2021). Rests on the README and those sources.

## Not verifiable

- davenport2000 §§11–20 (4.4, 5.3, 5.5, 5.6, 8.2 and others): uncertified, cited by locator; the mathematics was recomputed instead.
- Titchmarsh §5.1, §§9.2–9.4, Theorems 9.2 and 9.4 (3.4, 4.5, 7.4, 7.6): no legal copy in the sources cache; the statements are the classical ones and were recomputed.
- Iwaniec–Kowalski §§5.1–5.2 (2.1, 3.3, 3.4): no legal copy in the sources cache.
- lagarias1979 Lemma 2.3 (6.4): uncertified; Kadiri's report of it was read instead (see the question).
- DLMF 5.6.6 (1.3a): not among the cached DLMF pages; the bound follows from Euler's integral as the route of 1.3a says.
- lang1994 XVII §3, Theorem 3.1 (8.4): uncertified; the formula was re-derived and its signs tested.
- Lagarias–Odlyzko 1977 (8.8): attribution only, no theorem number.
- The proof of montgomery-vaughan2006 (10.38): the extraction has lost the conjugation bars (line 1339 reads as an identity between two equal expressions), so whether the print writes `ρ ↦ 1 − ρ̄` cannot be told from it. The source issue the previous review recorded on this point is not carried forward.
- The nine PrimeNumberTheoremAnd declarations of the Provenance table: only that project's README is in the sources cache, so they were not compared with `Suggested.lean` this round.

## Source issues

- **Error** in kadiri2012 at §1, (1.6), printed p. 2: the source says Lagarias–Montgomery–Odlyzko prove that a Hecke L-function has no zero in the whole-strip region (1.6), which near the real axis lies inside the box (1.5); it should be no zero other than the possible exceptional zero that (1.5) allows; affects nothing.

## For the human reviewers

- **Licence.** The README's Provenance section (lines 2528–2552) maps nine sections to declarations of PrimeNumberTheoremAnd (Apache-2.0, commit `127b50e`) and asks that its authors be consulted before porting. Those declarations were not compared with `Suggested.lean` in this round.
- **Not tested.** davenport2000 has the largest share of locators (18 of 69 mentions) and is uncertified: its text was not read, and its contents were compared only through the section titles in the README's References (line 3035).
