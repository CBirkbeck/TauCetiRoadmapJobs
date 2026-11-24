# Review of AsymptoticExpansions (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 113 changed lines since `592bdb1`. It covers the two new targets: 4.1a (holomorphy of the Laplace integral, with the formula for its derivatives) and 13.6a (coefficient asymptotics of meromorphic functions). It also covers the edit to 4.4, the dependency lines of Layers 4 and 13, scope items 4 and 13, the supplier contracts and the references. These were read against DLMF §1.14(iii), Flajolet–Sedgewick Theorem IV.10 and the pinned Mathlib and Tau Ceti. Both new statements, their proof routes and all five of their Checks are correct. There are no findings. Three small corrections and one format note do not block acceptance:

- Mathlib already proves 4.1a for nonnegative kernels through its complex moment-generating function, and the README does not cite it.
- The one-sentence scope boundary no longer covers the two new targets.
- The two new locators can name the exact statements.

Nothing is left for a human to decide.

## C01 — Mathlib already proves 4.1a for nonnegative kernels, and the route of 4.1a repeats Mathlib's proof without citing it

An implementer who follows 4.1a (README lines 399–427) would prove differentiation under the integral sign for the Laplace integral again, although Mathlib already has it. At the pinned Mathlib, `ProbabilityTheory.complexMGF X μ z = ∫ cexp (z * X ω) ∂μ` (`Mathlib/Probability/Moments/ComplexMGF.lean`, line 73) is holomorphic on `{z | z.re ∈ interior (integrableExpSet X μ)}` for every measure `μ` (`differentiableOn_complexMGF`, line 178). Its `k`-th derivative there is `μ[X ^ k * cexp (z * X)]` (`iteratedDeriv_complexMGF`, line 224). The dominated-differentiation step is `hasDerivAt_integral_pow_mul_exp` (line 124).

Take `q ≥ 0`, `X t = −t` and `μ` the measure `q(t) dt` on `(0, ∞)`. Then the hypothesis of 4.1a says that `(c, ∞) ⊆ integrableExpSet X μ`, and Mathlib's derivative is `∫ (−t)^k e^{−zt} q(t) dt = (−1)^k ∫ t^k e^{−zt} q(t) dt`, which is the formula of 4.1a. A complex `q` is a combination of four such kernels: the positive and negative parts of `Re q` and of `Im q`, each bounded by `|q|`.

The smallest change is to name `ProbabilityTheory.differentiableOn_complexMGF` and `ProbabilityTheory.iteratedDeriv_complexMGF` in the *Needs:* line of 4.1a and under `### From Mathlib`. Then either make the route the reduction to them, or keep the present route and say that Mathlib proves `complexMGF` the same way. The statement of 4.1a stays as it is, since Mathlib has no form of it for complex densities.

## C02 — The one-sentence scope boundary still says that everything the roadmap owns lies within DLMF §§2.1–2.10, which is no longer true of 4.1a and 13.6a

The sentence under "The boundary in one sentence" (lines 1592–1596) still says that the roadmap owns "the general asymptotic methods of the DLMF subsections listed at the top (all within §§2.1–2.10)". Items 4 and 13 of that list now include results taken from Widder and Flajolet–Sedgewick, outside DLMF Chapter 2. A reader who decides scope from this sentence would therefore place them in no roadmap. A possible wording: "… listed at the top (all within §§2.1–2.10), with the holomorphy of the Laplace integral (4.1a) and the meromorphic case of Darboux's method (13.6a)".

## C03 — The locators of 13.6a and 4.1a can name the exact statements they cite

13.6a (line 1392), item 13 of the scope and the reference entry all cite Flajolet and Sedgewick, "Chapter IV, §IV.5". The statement is their Theorem IV.10 (§IV.5.2, p. 258). It is stated for `f` meromorphic on a closed disc `|z| ≤ R` and analytic on `|z| = R`, with error `O(R^{−n})`; this is 13.6a with `R = r′`. The DLMF case of 4.1a (line 401) is DLMF 1.14.18–1.14.19 for the analyticity and 1.14.23 for the derivatives. "Flajolet and Sedgewick (2009), Theorem IV.10, p. 258" and "DLMF 1.14.18–1.14.19 and 1.14.23" would let a reader go straight to each.

## N01 — The dependency line of Layer 4 (lines 519–523) still lists Tau Ceti's `TauCeti/Analysis/Complex/LaplaceTransform.lean`, which no target of the layer now uses

4.4 dropped that file from its *Needs:* line, and 4.1a does not cite it. The relation to the bounded case is already stated in the prose of 4.1a, so this entry could be removed.

## Questions for the author

- Which statement of Widder (1941), Chapter II, does 4.1a cite, and on which page? No legal copy of the book could be read, so the chapter locator was not checked against the text.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1a, derivative formula | `q = 1`, `c = 0`, `z = 2 + i`, `k = 3` | `(−1)³∫t³e^{−zt}dt = 0.0672 + 0.2304i`; `(−1)³·3!·z^{−4} = 0.0672 + 0.2304i` | holds | none |
| 4.1a, sign `(−1)^k` | `q = 1`, `k = 1` | `Q′(z) = −z^{−2}`; `∫ t e^{−zt} dt = z^{−2}`; without the sign the two sides differ | sign needed | none |
| 4.1a, conjugation | `q = e^{it}`, `z = 1 + 2i` | `Q(z̄) = 1/(z̄ − i) = 0.1 + 0.3i`; `conj Q(z) = 1/(z̄ + i) = 0.5 + 0.5i` | real `q` needed, as stated | none |
| 4.1a, route bound | disc of radius `r = (Re z₀ − c)/2` | `Re z ≥ c + r`; `t^{k+1}e^{−(c+r)t} ≤ C_k e^{−(c+r/2)t}`, `C_k = (2(k+1)/(e r))^{k+1}` | dominating function integrable | none |
| 4.1a against Tau Ceti | bounded measurable `f`, `c = 0` | `e^{−σt}f` integrable for every `σ > 0`; Tau Ceti gives holomorphy on `Re z > 0` | special case, as the contract says | none |
| 4.1a against Mathlib `complexMGF` | `q ≥ 0`, `X t = −t`, `μ = q dt` on `(0, ∞)` | `(c, ∞) ⊆ integrableExpSet`; `iteratedDeriv k = (−1)^k ∫ t^k e^{−zt} q dt` | same statement for nonnegative `q` | C01 |
| 4.1a against DLMF | piecewise continuous `f`, `|f| ≤ M e^{αt}` | analytic for `Re s > α` (dlmf114 lines 899–938); `(−1)ⁿ dⁿ/dsⁿ ℒf = ℒ(tⁿf)` (line 1133) | DLMF case is `c = α` | C03 |
| 4.4, edited bullet | `e^{−ct}q` integrable | `|e^{−σt}q| ≤ |e^{−ct}q|` for `σ > c`, `t > 0`, so 4.1a applies with the same `c` | holomorphy on `Re z > c` | none |
| 13.6a, main term | one term `(z − w)^{−j}` | `[zⁿ] = (−1)^j C(n+j−1, j−1) w^{−n−j}`, a polynomial of degree `j − 1` in `n` | `Π_i` has degree `m_i − 1`, leading coefficient nonzero | none |
| 13.6a, first Check | `w = 0.5 + 0.3i`, `n = 7` | Cauchy coefficient `28.383 − 69.240i`; `−w^{−8} = 28.383 − 69.240i` | `M = 0` | none |
| 13.6a, second Check | same `w`, `n` | `154.83 + 1014.94i`; `8w^{−9} = 154.83 + 1014.94i` | degree 1 in `n` | none |
| 13.6a, pole of order 3 | same `w`, `n` | `−5054.5 − 6101.7i`; `−C(9,2) w^{−10} = −5054.5 − 6101.7i` | degree 2 in `n` | none |
| 13.6a, third Check | `1/(1 − z) + 1/(2 − z)`, `n = 7` | coefficient `1.00390625`; `1 + 2^{−8} = 1.00390625` | `M = 0` | none |
| 13.6a against F&S | `R = r′ ∈ (max|z_i|, r)` | Theorem IV.10: `O(R^{−n})` with `Π_j` of degree pole order − 1; `r′ ≤ max|z_i|` follows from a larger `R` | the same theorem | C03 |
| 13.6a, error term | `f − g` holomorphic on `|z| < r` | `norm_cauchyPowerSeries_le`: coefficient ≤ (average of `|f − g|` on `|z| = r′`) · `r′^{−n}` | `M` is that average | none |
| 13.6a against 13.6 | third Check, `d = 1` | 13.6 gives `f_n − 1 = 2^{−n−1} = o(1)`; 13.6a gives error 0 | consistent | none |
| 13.6a, no poles | `K = 0` | `g = 0`; the bound is Cauchy's estimate | holds | none |
| Scope boundary sentence (affected) | items 4 and 13 | sources Widder, DLMF §1.14(iii), F&S IV.10, all outside DLMF §§2.1–2.10 | sentence out of date | C02 |
| 4.1, sampled (not in the change) | `s = 1`, `z = 1 + i` | `∫e^{−(1+i)t}dt = 0.5 − 0.5i`; `(1+i)^{−1} = 0.5 − 0.5i` | holds | none |
| 13.5, sampled (not in the change) | `x = 1000` | `∑ x^j/(j!)³` divided by `e^{30}/(2π√3·10)` is `1.0114` | consistent with `∼` | none |

- **Change compared with the README at `592bdb1`, hunk by hunk.** It adds two subsections, 4.1a and 13.6a. No layer, item, id or heading anchor is removed or retitled. The only text removed is route commentary and dependency entries in 4.4 and in the Layer 4 dependencies; the statements of 4.4 are kept.
- **Sources.** Two read against the text:
  - DLMF §1.14(iii): dlmf114 lines 899–938 and 1129–1164.
  - Flajolet–Sedgewick Theorem IV.10 and its proof: flajoletSedgewick2009 lines 13482–13518, pp. 258–259.

  Widder could not be read. No sampled target falls in the changed passages.
- **Library declarations opened at the pins (12).**
  - Tau Ceti: `TauCeti.differentiableOn_integral_mul_cexp_neg_mul`, `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul` and `TauCeti.integrableOn_mul_cexp_neg_mul` (`TauCeti/Analysis/Complex/LaplaceTransform.lean` lines 168, 46, 119); `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (`TauCeti/Analysis/Contour/MeromorphicLaurent.lean` line 223); `TauCeti.circleLaurentCoeff` and `circleLaurentCoeff_natCast` (`TauCeti/Analysis/Complex/Laurent/Basic.lean` lines 49, 59).
  - Mathlib: `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Mathlib/Analysis/Calculus/ParametricIntegral.lean` line 569); `norm_cauchyPowerSeries_le` (`Mathlib/MeasureTheory/Integral/CircleIntegral.lean` line 653); `deriv_zpow` (`Mathlib/Analysis/Calculus/Deriv/ZPow.lean` line 82); `ProbabilityTheory.complexMGF`, `hasDerivAt_integral_pow_mul_exp`, `differentiableOn_complexMGF` and `iteratedDeriv_complexMGF` (`Mathlib/Probability/Moments/ComplexMGF.lean` lines 73, 124, 178, 224).
- **Cross-roadmap citations resolved.**
  - ContourIntegration (completed) owns the meromorphic principal-part case (`Completed/ContourIntegration/README.md` line 210), which fits the new contract sentence.
  - PositivityOfDirichletSeriesWithKernels cites 4.1a and 13.6a exactly as they are stated here.
  - SpecialFunctionsHeun cites 13.6, which is unchanged.
- **Automatic checks.** The worker's checks all passed. In my own run every text, scope and dependency check passed; the only failure listed files of the other roadmap folders that this pull request names as its own. Nothing outside them changed.
- **Dependency check output:** `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `Suggested.lean` is unchanged since `592bdb1`. `lake env lean` exits 0 with exactly 39 `sorry` warnings and nothing else. The `#check` sweep of all 52 declarations exits 0, and no binder is lost. 4.1a and 13.6a are not among the README's headline theorems, so `Suggested.lean` is not expected to state them.

Overlap check: searched for the two new objects (holomorphy of the Laplace integral, coefficient asymptotics of meromorphic functions) in SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsBessel (main), and in SpecialFunctionsGamma, SpecialFunctionsConfluent, SpecialFunctionsStruve and SpecialFunctionsEiLiErfIncompleteGamma (open), as well as in ArithmeticDirichletSeriesPartII and SpecialFunctionsHeun. None states either object. ArithmeticDirichletSeriesPartII §0.1 owns the predicate `HasLaplace` and states no holomorphy target. Nothing is shared.

Source independence: changed passages only. Seven passages compared with two sources (dlmf114, flajoletSedgewick2009): the statements, routes and Checks of 4.1a and 13.6a, and scope items 4 and 13. Nothing is shared beyond the hypothesis named in the DLMF locator ("piecewise continuous … of exponential growth"). The largest share is DLMF, about 120 of 149 source mentions. The arrangement was not compared, since no layer was added, removed or reordered.

Research link: Watson's lemma, Laplace's method and Darboux's method (Olver 1974; Wong 1989; Bleistein–Handelsman 1975; DLMF Chapter 2) are the expansion methods the special-function roadmaps consume. The new 4.1a (Widder 1941) and 13.6a (Flajolet–Sedgewick 2009, Theorem IV.10) are used by PositivityOfDirichletSeriesWithKernels 6.1 and 6.6. This rests on the README's references and downstream consumers, and on flajoletSedgewick2009.

## Not verifiable

- Widder (1941), Chapter II, cited by 4.1a and scope item 4: the sources service found no legal copy. The statement was checked by computation and against DLMF §1.14(iii), which states a special case of it.

Automatic checks set aside as false positives: in my own run of the checks, the check for changes outside the roadmap folder listed the 112 files of the other roadmap folders that this pull request names as its own. Nothing else outside this folder changed.

## Source issues

- none

## For the human reviewers

- none
