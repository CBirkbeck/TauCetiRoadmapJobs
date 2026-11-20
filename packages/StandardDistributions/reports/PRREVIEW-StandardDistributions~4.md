# Review of StandardDistributions (pull request #2682 at 4450807)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 125 lines changed since b0d099d, all in the README: chapter and section numbers added to the book citations, the §10.17 locator corrected, and the Pareto natural moments of §1.11 restated as a corollary of the pinned real-power row; no statement of mathematics changed, and the repaired passages were recomputed and are true. The pull request's description was read against this head and agrees with it. One small correction (some thirty-four book citations still name a whole book) and one format note remain, neither blocking; the questions for the human reviewers are those of the previous review.

## C01 — Thirty-four book citations still name a volume or a whole book

A reader who wants to check a formula against its source still cannot find it at these places, although most citations now carry a chapter or section. Remaining without one: Johnson, Kotz and Balakrishnan at fifteen places (§3.6 line 1305, §6.8 line 3032, §7.1 line 3112, §7.3 line 3351, §7.7 line 3728, §7.9 line 3831, §7.12 line 4062, §10.7 line 6158, §10.11 line 6581, §10.16 line 7034 and §13.1 line 8604 give a volume only; §10.13 line 6791, §10.15 line 6984, §10.18 line 7247 and §10.19 line 7380 give no volume); Johnson, Kemp and Kotz at seven (the introduction of Layer 9 at line 4499, §9.2 line 4638, §9.4 line 4874, §9.5 line 4939, §9.6 line 5006, §9.7 line 5085, §9.8 line 5189); Billingsley at four (§0.4 line 352, §4.6 line 1727, §7.3 line 3332, §7.4 line 3418); Mardia and Jupp 2000 at six (§12.1 line 8136, §12.2 lines 8270 and 8341, §12.3 line 8370, §12.4 line 8437, §13.4 line 8897, the last together with Fisher 1993); Azzalini and Capitanio 2014 in §8.2 (line 4261). No stated result is left unsupported, since each of these statements names the pinned declaration that proves it or is an open target with its own derivation.

A chapter or section at each of these places, as was done for the others, would finish the repair.

## N01 — In §5.7 the sentence on sources stands before the section's opening sentence

At line 2349 "No source is cited for this section: its statements are the pinned declarations named." comes first, so "named" refers forward to a list the reader has not met; in §7.8 and §14.4 the same sentence closes the section. Moving it after the list would match. Lines 219, 775 and 797 also run past the 100-column wrap the file otherwise keeps.

## Previous findings

The previous review, of b0d099d, raised no finding; its three small corrections are accounted for here.

- C01 (whole-book locators; §5.7, §7.8, §14.4 uncited) — partly repaired: "(Billingsley, §32)" (line 219), "(Eaton, §3.5)", "(Anderson 2003, §2.5)", and a sentence on sources in §5.7, §7.8 and §14.4; thirty-four places remain. C01 above.
- C02 (§10.17 locator) — repaired: "R noncentral Beta documentation, Details for the ratio and Source for the Poisson mixture" (line 7115), which is where RNoncentralBetaDoc lines 85–88 and 122–123 have them.
- C03 (Pareto natural moments of §1.11) — repaired: "the Pareto row at `q = n` gives, through `Real.rpow_natCast`, that for every natural `n`, `Xⁿ` is integrable exactly when `n < r`" (line 797); the scope list no longer counts it as open (line 9779).

## Verified sound

| Statement | Instances tried | Values computed, each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.11 Pareto natural moments (changed) | `t = 2, r = 4`, `n = 1, 2, 3, 4`; pinned hypotheses | `8/3`, `8` (variance `8 − 64/9 = 8/9`), `4·8/1 = 32`; `n = 4`: integrand `~ x⁻¹`, divergent; pin has `0 < t`, `0 < r`, every real `q` | true; instance of the pinned row | none |
| 10.17 locator (changed) | R documentation, Details against Source | ratio `X/(X+Y)` at lines 85–88 with p. 502; Poisson mixture at lines 122–123 with pp. 502–3 | agrees | none |
| 14.4 "consequences of §14.3" (changed) | leading `q × q` block, `p = 3, q = 2, η = 1` | `β_c = η + (p−c−2)/2 = (η + (p−q)/2) + (q−c−2)/2`; block shape `3/2`, entry Beta`(3/2, 3/2)` = entry marginal `η + (p−2)/2` | true | none |
| 5.7 "statements are the pinned declarations named" (changed) | the four items of the section | each names one declaration: Gaussian, multinomial, Dirichlet, conditional kernel; all resolve at the pin | true | N01 |
| 7.8 same sentence (changed; tilting) | `N(m, v)` tilted by `t`; Poisson `λ`; `e^(tX)` not integrable | `(m + vt, v)`; `λeᵗ`; both sides `0`; every statement of the section carries a declaration name | true | none |
| 1.7 Beta (sample; ch. 25 added) | `Beta(2, 3)`; `q = 1` in the §1.11 row | mean `B(3, 3)/B(2, 3) = 2/5 = a/(a + b)` | true | none |
| 1.10 real Gaussian (sample; ch. 13 added) | `v = 1`, `n = 2`; absolute moment `n = 1`; `n = 0` | `E X⁴ = 3 = 3!!`; `√2·Γ(1)/√π = √(2/π)`; `(−1)!! = 1` | true | none |
| 3.8 Fisher's F (sample; ch. 27 added) | `m = 2, n = 6`; `n = 2` | mean `6/4 = 3/2`; `n = 2`: not integrable, `n > 2` needed | true | none |
| 3.10 / 9.3 hypergeometric rows (sample; ch. 6 added) | negative hypergeometric `K = N`; `r = 0` | support `{0}` since `N − K = 0`; mass only at `k = 0`, as "`k = 0` or `r > 0`" says | true | none |
| 10.5 folded normal (sample; ch. 13 added) | `m = 0, s = 1`, `x = 1` | `Φ(1) − Φ(−1) = 0.6827`; noncentral chi `k = 1, δ = 0` is half-normal, same cdf | true | none |
| 10.9 truncated and skew normal (sample; ch. 13 and ch. 2 added) | half-normal; `SN` with `α = 1` | mean `√(2v/π)`; `F(m) = 1/2 − arctan(1)/π = 1/4` | true | none |
| 13.3 quantile adjunction (sample; §14 added) | Bernoulli `1/2`, `u = 1/2`, `u = 0.6`, `x = 0` | `Q(1/2) = 0 ≤ 0` and `1/2 ≤ F(0) = 1/2`; `Q(0.6) = 1 > 0` and `0.6 > 1/2` | true both ways | none |
| 13.5 affine coverage (sample; chapters added) | `b = 0`; GEV and generalized Pareto under `x ↦ a + bx`, `b > 0` | Dirac at `a`; location `a + bμ`, scale `bσ`, shape unchanged | true | none |

The rows of the previous review, of b0d099d, for the untouched statements (the thirteen headline theorems, the LKJ definition, the stable conventions and the other sampled sections) stand as they are there: the diff changes no statement and `Suggested.lean` is unchanged.

- Source locators checked against the text: 2 in RNoncentralBetaDoc (lines 85–88, 122–123). The README flags no locator as unverified. The chapter and section numbers the change adds are into books that could not be read (below).
- Library declarations opened at the pins: `TauCeti.Probability.integrable_rpow_paretoMeasure_iff` and `integral_rpow_paretoMeasure` (Tau Ceti `Probability/Distributions/Pareto/Basic.lean`, lines 117 and 139) and Mathlib `Real.rpow_natCast` (`Analysis/SpecialFunctions/Pow/Real.lean`, line 61).
- Cross-roadmap citations: the change adds none; the citation resolver finds every citation and every Lean name of the README on main, at an open head or at the pins.
- Automatic checks: all passed on this head and none was set aside. The dependency check, rerun, prints `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- Elaboration of `Suggested.lean` at this head: 13 "declaration uses `sorry`" warnings and nothing else; no `set_option`; `import Mathlib` and seven `TauCeti.*` modules; the file is identical to the one the previous review probed, so its elaborated signatures and one-tactic probe stand.
- The pull request's description against this head: 359 Checks under 124 Checks headings (counted); 127 numbered sections, each with a *Needs:* line; 16 layers each ending with Examples and Dependencies; §13.5 and §13.6 present; seven Tau Ceti imports; the supplier contracts list 3,671 names from Tau Ceti files and 229 from Mathlib ("about 3,670" and "235"); the six added and the kept Lean statements compared with main's file (same statements on the pinned carriers); the list of open targets agrees with the scope section, which no longer lists the Pareto moments, as the description never did. No sentence is contradicted and no change a reader must know is left out.

Overlap check: read GaussianLinearModels, RandomProjectionsAndSketching, PoissonApproximation, MathematicalStatisticsHigherOrderAndResampling (open), MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic and RandomMatrices (main), as in the previous review; the change touches no ownership sentence, and the one shared object remains the real Wick–Isserlis formula, owned here (§5.3) and listed also in RandomMatrices §2.5 on main.

Source independence: changed passages only; 2 passages compared with 1 source (RNoncentralBetaDoc), none shared; the other changed passages are bare chapter and section numbers and three sentences of the roadmap's own; largest share Johnson–Kotz–Balakrishnan, 52 of about 150 citations, whose text and contents could not be read; the diff adds, removes or reorders no layer, so the arrangement was not compared again (previous result: contents compared with Nolan2020, independent).

Research link: Layers 6, 14 and 15 state the Wishart theory (Muirhead 1982; the branch issue of Mayerhofer 2019), the LKJ partial-correlation construction (Lewandowski, Kurowicka and Joe 2009) and the stable laws (Nolan 2020) that RandomMatrices and the statistics roadmaps build on; rests on the README's References and Downstream consumers and on Nolan2020 ch. 1.

## Not verifiable

- The chapter and section numbers added at this head (Johnson–Kotz–Balakrishnan chs. 13–31, Johnson–Kemp–Kotz chs. 1 and 5–7, Billingsley §14, §25, §26, §29, §32, Eaton ch. 2, §3.1, §3.5, Anderson 2003 §2.5, Coles 2001 chs. 3–4, Azzalini–Capitanio 2014 ch. 2): none of these books is in the sources manifest or cache, so the numbers were not checked against the texts.
- Mardia–Jupp 2000 (sampled §12.3), Muirhead 1982 (sampled §6.4), Heyde 1963 (sampled §3.3), Lewandowski–Kurowicka–Joe 2009 and the software documentation other than R's: not in the manifest or cache, as in the previous review; the mathematics of those sections stands as recomputed there.

## Source issues

- **Gap** in Nolan2020 at §1.5, p. 15, with Problem 1.11, p. 23: the source says Problem 1.11 yields the moment threshold for every stable law with index below two; it should be noted that for totally skewed laws one tail is not a power law, so one heavy tail must suffice; affects nothing.
- **Misprint** in RNoncentralBetaDoc at Details, line 86: the source cites a single page as "pp. 502"; it should be "p. 502" (the Source section gives pp. 502–3); affects nothing.

## For the human reviewers

- Scope: the located sources are handbooks (Johnson–Kotz–Balakrishnan, Johnson–Kemp–Kotz, Muirhead) and several conventions rest on software documentation (SciPy, R, PyMC, Stan; README References). The README lists twelve consuming roadmaps under Downstream consumers.
- Pin: `TauCetiRoadmap/StandardDistributions/STATUS.md` reports that Tau Ceti at aa6e43e (2026-11-13) proves the LKJ independence and stable support and moment results; at the pin 2fd255d (2026-11-04) they are absent. After a pin bump several `Suggested.lean` headlines would restate library declarations.
- Not tested: Johnson–Kotz–Balakrishnan, the source with the most citations, could not be read, so neither wording nor arrangement nor the chapter numbers now cited were compared with it.
- Ownership: RandomMatrices §2.5 on main (line 560) still lists the real Wick–Isserlis formula that §5.3 here owns; the change needed is in RandomMatrices, not in this pull request.
