# Review of AsymptoticExpansions (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 113 changed lines since `aecb53a`. The two new targets, 4.1a (holomorphy of the Laplace integral, with the formula for its derivatives) and 13.6a (coefficient asymptotics of meromorphic functions), were checked with the edited bullet of 4.4, the dependency lines of Layers 4 and 13, scope items 4 and 13, the supplier contracts and the references, against DLMF §1.14(iii), Flajolet–Sedgewick Theorem IV.10 and the pinned Mathlib and Tau Ceti. Both statements, their routes and their five Checks are correct, and there are no findings. The folder is unchanged since the previous review, so its three small corrections still stand and are repeated below; none blocks. Nothing is left for a human to decide.

## C01 — Mathlib already proves 4.1a for nonnegative kernels, and the route of 4.1a repeats that proof without citing it

An implementer following the route of 4.1a (README lines 399–427) would prove differentiation under the integral sign for the Laplace integral a second time. At the pinned Mathlib, `ProbabilityTheory.complexMGF X μ z = ∫ cexp (z * X ω) ∂μ` (`Mathlib/Probability/Moments/ComplexMGF.lean`, line 73) is holomorphic on `{z | z.re ∈ interior (integrableExpSet X μ)}` for every measure `μ` (`differentiableOn_complexMGF`, line 178), with `iteratedDeriv n (complexMGF X μ) z = μ[X ^ n * cexp (z * X)]` (`iteratedDeriv_complexMGF`, line 224); the dominated step is `hasDerivAt_integral_pow_mul_exp` (line 124). For `q ≥ 0`, take `X t = −t` and `μ` the measure of density `q` on `(0, ∞)`: the hypothesis of 4.1a puts `(c, ∞)` inside `integrableExpSet X μ`, `complexMGF X μ = Q`, and the derivative is `∫ (−t)^k e^{−zt} q(t) dt`, the formula of 4.1a. A complex `q` is a combination of four such kernels (the positive and negative parts of `Re q` and `Im q`, each bounded by `|q|`).

The smallest change: name these two declarations on the *Needs:* line of 4.1a and under `### From Mathlib`, and either make the route the reduction to them or say that Mathlib proves the nonnegative case the same way. The statement of 4.1a stays, since Mathlib has no form of it for complex densities.

## C02 — The one-sentence scope boundary says everything owned lies within DLMF §§2.1–2.10, which is no longer true of 4.1a and 13.6a

The sentence under "The boundary in one sentence" (lines 1592–1596) reads "the general asymptotic methods of the DLMF subsections listed at the top (all within §§2.1–2.10)". Items 4 and 13 of the scope list now include results from Widder and from Flajolet–Sedgewick, outside DLMF Chapter 2, so a reader who settles ownership from this sentence places them in no roadmap. A wording that would be right: "… (all within §§2.1–2.10), with the holomorphy of the Laplace integral (4.1a) and the meromorphic case of Darboux's method (13.6a)".

## C03 — The locators of 13.6a and of the DLMF case of 4.1a can name the statements they cite

13.6a (line 1392), scope item 13 and the reference entry cite Flajolet and Sedgewick, "Chapter IV, §IV.5", a section of some ten pages. The statement is their Theorem IV.10 (§IV.5.2, p. 258; flajoletSedgewick2009 lines 13485–13493), given for `f` meromorphic on the closed disc `|z| ≤ R` and analytic on `|z| = R` and at `0`, with error `O(R^{−n})`: this is 13.6a with `R = r′`. The DLMF case of 4.1a (line 401) is DLMF 1.14.18–1.14.19 for the analyticity (dlmf114 lines 899–938) and 1.14.23 for the derivatives (line 1133). "Flajolet and Sedgewick (2009), Theorem IV.10, p. 258" and "DLMF 1.14.18–1.14.19 and 1.14.23" would take a reader straight to each.

## Questions for the author

- Which statement of Widder (1941), Chapter II, does 4.1a cite, and on which page? No legal copy of the book could be read, so the chapter locator was not compared with the text.

## Verified sound

Previous review (accepted, no findings): its corrections C01–C03 are not repaired, the folder being unchanged since the head it read; they are C01–C03 above. Its format note on the Layer 4 dependency line is dropped: the line says what the Tau Ceti file is listed for ("the bounded case that 4.1a extends").

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1a, derivative formula | `q = 1`, `c = 0`, `z = 1.5 − 0.7i`, `k = 0, 1, 2, 5` | `k = 5`: `(−1)⁵∫t⁵e^{−zt}dt = 5.05712 − 2.90781i`; `(−1)⁵·5!·z^{−6} = 5.05712 − 2.90781i`; other `k` agree likewise | holds | none |
| 4.1a, `c ≠ 0`, unbounded kernel | `q = e^{2t}`, `c = 2`, `z = 2.3 + 1.1i`, `k = 1` | `−∫ t e^{−(z−2)t} dt = 0.66272 + 0.39053i`; `d/dz (z−2)^{−1} = 0.66272 + 0.39053i` | holds; `Q` has a pole at `c`, so `Re z > c` is sharp | none |
| 4.1a, sign `(−1)^k` | `q = 1`, `k = 1`, same `z` | `Q′ = −z^{−2} = −0.23443 − 0.27972i`; `∫ t e^{−zt} dt` is its negative | sign needed, as the Check says | none |
| 4.1a, conjugation Check | `q = e^{it}`, `z = 1 + 2i` | `Q(z̄) = 1/(z̄ − i) = 0.1 + 0.3i`; `conj Q(z) = 0.5 + 0.5i` | differ; real `q` needed, as stated | none |
| 4.1a, route bound | disc of radius `r = (Re z₀ − c)/2`, `r = 0.8`, `k = 0, 3` | `Re z > c + r` on the disc; `sup t^{k+1}e^{−rt/2} = (2(k+1)/(er))^{k+1}` = `0.9197`, `183.156` (grid maximum the same) | dominating function `C_k e^{−(c+r/2)t}|q|` integrable | none |
| 4.1a against Tau Ceti | bounded measurable `f`, `c = 0` | `e^{−σt}f` integrable for all `σ > 0`; library gives `DifferentiableOn` on `{0 < re z}` over `Ici 0` | special case, as the contract says | none |
| 4.1a against Mathlib `complexMGF` | `q ≥ 0`, `X t = −t`, `μ = q dt` | `(c, ∞) ⊆ integrableExpSet`; `iteratedDeriv k = ∫(−t)^k e^{−zt} q dt` | same statement for `q ≥ 0` | C01 |
| 4.1a against DLMF | piecewise continuous `f`, `|f| ≤ Me^{αt}` | DLMF: analytic on `Re s > α`; `(−1)ⁿ dⁿ/dsⁿ ℒf = ℒ(tⁿ f)`; 4.1a with `c = α` gives both | DLMF is the case stated | C03 |
| 4.4, edited bullet | `e^{−ct}q` integrable, `σ > c` | `|e^{−σt}q| ≤ |e^{−ct}q|` on `t > 0`, so the hypothesis of 4.1a holds with the same `c` | holomorphy on `Re z > c` follows | none |
| 13.6a, main term | one term `(z − w)^{−j}` | `[zⁿ] = (−1)^j C(n+j−1, j−1) w^{−n−j}`: degree `j − 1` in `n`; top coefficient `c_{i,m_i} ≠ 0` | `Π_i` has degree exactly `m_i − 1` | none |
| 13.6a, first Check | `w = 0.6 − 0.4i`, `n = 6` | circle coefficient `5.53922 + 8.16005i`; `−w^{−7} = 5.53922 + 8.16005i` | `M = 0` | none |
| 13.6a, second Check | same | `−0.80114 − 95.73472i`; `7w^{−8}` the same | degree 1 in `n` | none |
| 13.6a, pole of order 3 | same | `−290.8708 + 444.3176i`; `−C(8,2) w^{−9}` the same | degree 2 in `n` | none |
| 13.6a, third Check | `1/(1−z) + 1/(2−z)`, `n = 6` | coefficient `1.0078125`; `1 + 2^{−7} = 1.0078125` | `M = 0`; 13.6 at `r = 1` gives only `o(1)` | none |
| 13.6a, non-rational `f` | `e^z/(z−w)²`, `r′ = 3`, `n = 5, 10` | `|f_n − e^w((n+1)w^{−n−2} − w^{−n−1})|·3ⁿ = 0.056`, `0.00014`; with a constant in place of `Π` : `1.9·10⁴`, `5.1·10⁷` | bounded with the polynomial, unbounded without | none |
| 13.6a against Flajolet–Sedgewick | `R = r′` | Theorem IV.10: `f_n = ∑Π_j(n)α_j^{−n} + O(R^{−n})`, degree = pole order − 1 | the same theorem | C03 |
| 13.6a, error term | `f − g` holomorphic on `|z| < r` | `norm_cauchyPowerSeries_le`: coefficient ≤ (mean of `|f − g|` on `|z| = r′`)·`r′^{−n}` | `M` is that mean, independent of `n` | none |
| 13.6a, no poles | `K = 0` | `g = 0`; the bound is Cauchy's estimate | holds | none |
| Scope boundary sentence (affected) | items 4, 13 | sources of 4.1a and 13.6a lie outside DLMF §§2.1–2.10 | sentence out of date | C02 |

- Record: the head adds two subsections (4.1a, 13.6a) and removes no layer, item, id or heading; the text removed is route commentary and dependency entries of 4.4, whose statements are kept.
- Source locators checked against the text: 2 (DLMF 1.14.18–1.14.19 and 1.14.23 at dlmf114 lines 899–938, 1129–1164; Flajolet–Sedgewick Theorem IV.10 and its proof at flajoletSedgewick2009 lines 13482–13518, pp. 258–259). No target of the seeded sample falls in the changed or affected passages, and the README flags no locator as unverified.
- Library declarations opened at the pins: 13. Mathlib: `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`Mathlib/Analysis/Calculus/ParametricIntegral.lean` line 569), `norm_cauchyPowerSeries_le` (`Mathlib/MeasureTheory/Integral/CircleIntegral.lean` line 653), `deriv_zpow` (`Mathlib/Analysis/Calculus/Deriv/ZPow.lean` line 82), `ProbabilityTheory.complexMGF`, `hasDerivAt_integral_pow_mul_exp`, `differentiableOn_complexMGF`, `iteratedDeriv_complexMGF` (`Mathlib/Probability/Moments/ComplexMGF.lean` lines 73, 124, 178, 224). Tau Ceti: `TauCeti.differentiable_intervalIntegral_mul_cexp_neg_mul`, `TauCeti.integrableOn_mul_cexp_neg_mul`, `TauCeti.differentiableOn_integral_mul_cexp_neg_mul` (`TauCeti/Analysis/Complex/LaplaceTransform.lean` lines 46, 119, 168), `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (`TauCeti/Analysis/Contour/MeromorphicLaurent.lean` line 223), `TauCeti.circleLaurentCoeff`, `circleLaurentCoeff_natCast` (`TauCeti/Analysis/Complex/Laurent/Basic.lean` lines 49, 59).
- Cross-roadmap citations resolved: 3. PositivityOfDirichletSeriesWithKernels (this pull request) cites §4.1a and §13.6a for what they state; SpecialFunctionsHeun cites §13.6, unchanged; the ContourIntegration contract names a declaration that exists at the pin.
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean` exits 0 with 39 `sorry` warnings and nothing else. The file is unchanged by the pull request, so no declaration was probed for padding; the elaborated types of its 52 declarations show no lost binder. 4.1a and 13.6a are not headline theorems of the README, so the file is not expected to state them.
- Pull request text: its description covers this folder's change in general terms (published theorems added as sections to existing roadmaps, none removed or renumbered); nothing in it is contradicted by this folder at the head.

Overlap check: read SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder, SpecialFunctionsBessel (main) and SpecialFunctionsStruve, SpecialFunctionsGamma, SpecialFunctionsConfluent, SpecialFunctionsEiLiErfIncompleteGamma (open), and searched every roadmap on main and at the open heads for the two new objects; nothing shared. ArithmeticDirichletSeriesPartII §0.1 owns the predicate `HasLaplace` and states no holomorphy of the transform; SpecialFunctionsHeun consumes §13.6 and states no coefficient asymptotics of its own.

Source independence: changed passages only; 7 passages (the statements, routes and Checks of 4.1a and 13.6a, and scope items 4 and 13) compared with 2 sources (dlmf114, flajoletSedgewick2009), none shared beyond the hypothesis named in the DLMF locator; largest share DLMF Chapter 2, named on 117 lines of the README, more than every other source together; arrangement not compared, since no layer is added, removed or reordered. Widder (1941) could not be read.

Research link: Watson's lemma, Laplace's method and Darboux's method (Olver 1974; Wong 1989; DLMF Chapter 2) are the methods the special-function roadmaps consume; 4.1a (Widder 1941) and 13.6a (Flajolet–Sedgewick 2009, Theorem IV.10) are used by PositivityOfDirichletSeriesWithKernels 6.1 and 6.6. Rests on the README's references and consumers and on flajoletSedgewick2009.

## Not verifiable

- Widder (1941), Chapter II, cited by 4.1a and scope item 4: the sources service found no legal copy. The statement was checked by computation, against DLMF §1.14(iii) (a special case) and against Mathlib's proof for nonnegative kernels.

## Source issues

- none

## For the human reviewers

- none
