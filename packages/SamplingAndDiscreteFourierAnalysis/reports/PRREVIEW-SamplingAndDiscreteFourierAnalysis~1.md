# Review of SamplingAndDiscreteFourierAnalysis (pull request #2571 at 7f19503)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example was recomputed (values in the table kept on the board) and none is false; the fifteen sampled targets were read against Tao's paper, the textbook of Vetterli, Kovačević and Goyal and Unser's survey at their locators, and the theorem numbers, pages and hypotheses agree. `Suggested.lean` elaborates with `sorry` as its only warning, no declaration closes with one tactic, and the dependency check is clean. There are no small corrections and one format note, not blocking; three points are left for the human reviewers (scope, the hosts of two sources, and formulas of one source that could not be read).

## N01 — An open roadmap also names the diagonalization of circulant matrices; a sentence in the scope section would settle the owner

The open roadmap StructuredBlockOperators lists, in its Layer 6, "circulant matrices on `ZMod n`, convolution form and character diagonalization" as an API to build, with no statement or hypotheses. This roadmap states the result (2.1 to 2.4) and is the one placed in the merge order, so it is the owner and nothing here has to change. The scope section would be complete with one sentence saying that 2.1 to 2.4 own these statements and that StructuredBlockOperators Layer 6 treats only the cost of applying such operators.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Parseval | `N = 1`; `N = 3`, `δ₀`; `N = 4`, `(1,2,0,0)` | `N=3`: `3 = 3·1`. `N=4`: `Φ̂ = (3, 1−2i, −1, 1+2i)`, `9+5+1+5 = 20 = 4·5` | true | none |
| 1.2 convolution theorem | `N = 2`, `(1,1)`; `N = 3`, `δ₁⋆δ₁`; `N = 4`, `(1,2,0,0)` | `(2,2)^ = (4,0) = (2,0)²`; `δ₂^ = e(−2k/3)`; `(1,4,4,0)^ = (9, −3−4i, 1, −3+4i)` = squares | true | none |
| 2.1 diagonalization | `N = 2`, `v = (a,b)`; general entry `(k,j)`; `N = 3`, `δ₁` | both sides rows `(a+b, a+b)`, `(a−b, b−a)`; general: `e(−jk/N) v̂(k)` both sides; eigenvalue `e(−1/3)` | true | none |
| `dftMatrix` definition | `dftMatrix N *ᵥ Φ = ZMod.dft Φ` | proved in a probe by `ext; simp` with `ZMod.dft_apply` | the intended matrix, not its transpose-conjugate | none |
| 2.2 charpoly, determinant | `N=2` `(a,b)`; `N=3` `δ₁`; `N=2` `δ₁`; `(1,1,1)`; `N=4` `(1,2,0,0)` | `a²−b²`; `e(−1) = 1`, even 3-cycle; `−1`; `X²(X−3)`; `3·5·(−1) = −15` | true | none |
| 2.3 commutant of the shift | `N = 1` (`1 = 0`, shift = identity); `N = 2`, `M = E₁₁`; entrywise | `MP = [[0,1],[0,0]]`, `PM = [[0,0],[1,0]]`; `(MP)(i,j) = M(i,j+1)`, `(PM)(i,j) = M(i−1,j)` | iff true both ways | none |
| 2.4 group algebra | `single a 1 · single b 1`; `single 0 1`; `N ≥ 2` | `circulant δ_a · circulant δ_b = circulant δ_{a+b}`; `circulant δ₀ = 1`; range commutative, proper | true | none |
| 3.1 Donoho–Stark | `δ₀`; `N=4` `1_{0,2}`; `N=6` `1_{0,3}`; `f = 0`; `(1,1,0,0)` on `ℤ/4` | `1·N`; `2·2 = 4`; `f̂ = (2,0,2,0,2,0)`, `2·3 = 6`; `0 < N` excluded by `f ≠ 0`; `2·3 = 6 ≥ 4` | true | none |
| 3.2 Tao | `p=2`: `δ₀`, `(1,1)`; composite `N=4, 6, 8` | `1+2 = 3`, `2+1 = 3`; `2+2 = 4 < 5`, `2+3 = 5 < 7`, `2+4 = 6 < 9`: primality needed | true | none |
| 3.3 converse | `A = ℤ/p`, `B = ∅` at bound `p`; `p=2`, `A={0}`; `p=5`, `δ₀−δ₁` | pair excluded since `p+0 < p+1`; `δ₀`; `f̂(0)=0`, `f̂(k)=1−e(−k/5)≠0`, `2+4 = 6` | true; `|Ã∖B| = |A|−1 = p−|B|` fits | none |
| 4.1 stability | `h ≡ 1`; `h = δ₀`; converse input `x(m) = conj h(−m)/|h(−m)|` | `h≡1`: value `∑x` or junk `0`, bounded, so existence clause needed; family at `0` is `|h(a)|` | iff true; `LinearMap.mul ℕ ℂ` is the form of `⋆ᵣ₊` by `rfl` | none |
| 4.2 gain | `h = δ₀−δ₁`, `x = (−1)^m`; `h = 0`; `(δ₀+δ₁)/2`; `2^(−n)`, `n ≥ 0` | `2(−1)^n`, modulus `2`; set `{0}`, sum `0`; gain `1`; gain `2` | greatest element attained at `n = 0` | none |
| 5.1 aliasing | shifted Gaussian `T=1`, `ξ=1/4`; `sinc²` at `ξ=0.3`, `T=1/2` and `1`; direct Poisson on `f(xT)e^{−2πixTξ}` | `0.4559−0.0009 = 0.4551`, times `(1−i)`; `0.7`; `0.7+0.3 = 1.0`; `ĝ(k) = T⁻¹𝓕f(ξ+k/T)` | true, sign of phase fixed | none |
| 6.1 `IsBandLimited` | `sinc²`; `sin(2πBt)/(πt)`; `sin(2πBt)`; `B < 0`; `B = 0` | `G` = triangle; `G = 1_[−B,B]`; not `L²`, excluded; `G ≡ 0`; `G` supported in `{0}`, `f = 0` | determines the class; `PW_(2πB)` density `G(s/2π)/2π` gives `‖F‖² = ∫|G|²` | none |
| 6.2 energy identity | `sinc²`, `B=1`; `sin(2πBt)/(πt)`; `B ≤ 0` (`n/0 = 0`) | `1 + (32/π⁴)(π⁴/96) = 4/3 = 2·(2/3)`; `4B² = 2B·2B`; `0 = 0` | true | none |
| 6.3 sampling theorem (uniform, `L²`) | sample point `m/2B`; `Real.sinc(2πt)` with `B=1/2`; `B ≤ 0`; error bound | `f(m/2B)`; `2√2/π ≈ 0.9003` vs `2/π ≈ 0.6366`; `0 → 0`; `(2B)^(1/2)·(2B)^(−1/2)(∑_{n∉S}|f(n/2B)|²)^(1/2)` | true; `∫ sinc²(2Bt) = 1/2B` | none |
| 6.4 interpolation | `c = δ₀`; constant `c = 1`; `B ≤ 0` with `δ₀`; sign of the exponent | `sinc(2Bt)`, `G = (2B)⁻¹1_[−B,B]`; not square-summable; only `f = 0`; `c(m)` vs `c(−m)` | exists and unique for `B > 0` | none |
| 6.5 oversampling | `B<0`; `B ≥ 0`, `2BT ≥ 1` at `ξ = B`; `B=1`, `T=0.4` | `f = 0`, `φ = 0` allowed; `𝓕φ(B) = 1` and `= 0`, vacuous; cut-off `1/T − B = 1.5`, copies vanish for `|ξ| < 1.5` | true; `∑ = T⁻¹∫𝓕φ·G_per e^{2πiξt}` | none |
| Conventions | `ZMod.dft_dft`; shift `circulant (Pi.single 1 1)`; `ANT III §7.4` example | `N·Φ(−j)` at the pin; `(Cx)(i) = x(i−1)`; coefficients `1/log(|n|+2)` not square-summable | consistent across Layers 1–3 and 6 | none |

- Source locators checked against the text: 20 (tao2003 lines 38–52, 64–68, 85–101, 158–179; vkg2014 lines 11596, 14719, 14800, 14837–14839, 25720, 26059–26092, 26156–26201, 26257, 36218; unser2000 lines 43, 219–229, 1354–1361); printed pages agree in all 20.
- Library declarations opened at the pins: 43 (for example `Mathlib/Analysis/Fourier/ZMod.lean:176`, `Mathlib/LinearAlgebra/Matrix/Circulant.lean:115, 129, 156`, `Mathlib/Analysis/Fourier/PoissonSummation.lean:201`, `Mathlib/Analysis/Fourier/AddCircle.lean:432, 458`, `TauCeti/Analysis/Normed/Lp/DiscreteConvolution.lean:76, 198`, `TauCeti/Analysis/Fourier/Continuous.lean:36`, `TauCeti/Analysis/Fourier/PoissonSummation.lean:309`); 18 of them also by `#check`.
- No Parseval identity or convolution theorem for `ZMod.dft`, no circulant spectrum, no band-limited class in the pinned Mathlib or Tau Ceti (all `dft` lemmas listed; `Mathlib/Analysis/Fourier/LpSpace.lean:88–109` links the `L²` transform to the integral for Schwartz functions only, so the route through the Paley–Wiener Plancherel identity is not a duplicate).
- Cross-roadmap citations resolved on main: 4 (DiracScatteringAndNonlinearFourierTransform §2.7, README line 1057; AnalyticNumberTheoryPartIII §7.4, line 575; FourierDeligneTransform §0.2, lines 140 and 147; AutomorphicSpectralTheory §1.6, line 959).
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; all three roadmap suppliers and deferrals are on main.
- Elaboration: `Suggested.lean` elaborates, 17 `sorry` warnings and nothing else; elaborated types of the 20 declarations compared with the README, no binder lost, no change.
- One-tactic probe on a copy: none of the 17 theorems closes with `rfl`, `simp`, `infer_instance`, `simp` with the three definitions unfolded, or `aesop`. Headlines of the README (circulant, uncertainty, stability, sampling) are all stated.
- Automatic checks: all passed at this head; the pull request changes nothing outside the folder.

Overlap check: read ArithmeticDirichletSeriesPartII (open and on main; the third list is empty); nothing shared. Beyond the lists: StructuredBlockOperators Layer 6 (open, not in the merge order) names circulant diagonalization without a statement; owner: this roadmap (N01). AnalyticNumberTheoryPartIII §7.4 owns Brown's pointwise bound, FourierDeligneTransform §0.2 the finite-field transform, DiracScatteringAndNonlinearFourierTransform §2.7 the Paley–Wiener spaces; none is restated.

Source independence: 18 passages compared with 3 sources, none shared beyond formulas; largest share vkg2014, 10 of 20 locators; contents compared with vkg2014 (Layers 1–2 ↔ §3.6, Layer 3 ↔ §7.3, Layer 4 ↔ §3.3, Layers 5–6 ↔ §5.4, not in the source's order): independent. The displayed formulas of unser2000 could not be read; its prose was compared.

Research link: Layer 3 states Tao's uncertainty principle for cyclic groups of prime order with its converse (Tao, 2003) and the Donoho–Stark inequality (1989); Layer 6 is the Shannon sampling theory from which Unser's survey (2000) starts. Rests on the README's references and on tao2003 and unser2000.

## Not verifiable

- unser2000, equations (4) to (6) and (A.6), (A.7): the text extraction drops the displayed formulas; the surrounding prose (orthonormal basis and projection at lines 217–232, Poisson summation applied to a modulated function at lines 1351–1366) and the page numbers agree with the README.
- The numerical Checks stated to a tolerance (6.3 with 40001 terms, 6.5 with 601 terms, the exhaustive searches of 3.1 and 3.2, the rank computation of 2.3) were not rerun; the exact Checks beside them were recomputed.
- Donoho and Stark (1989) was not read; the README attributes without a locator and cites the inequality from the two texts that were read.

## Source issues

- none

## For the human reviewers

- Scope: 10 of the 20 locators point to a signal-processing textbook (vkg2014); Layers 1, 2, 4 and 5 state textbook results. The research article among the sources is tao2003 (Layer 3); unser2000 is a survey.
- Licence: vkg2014 was read from the authors' site (free version 1.1, each page carrying the publisher's copyright line) and unser2000 from the author's group page at EPFL; both hosts were classed as author pages by this review.
- Not tested: the displayed formulas of unser2000 (3 of 20 locators) were unreadable in the extraction; only its prose was compared.
