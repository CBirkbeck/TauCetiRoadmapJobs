# Review of GaussianTailsAndOrthantProbabilities (pull request #3194 at 1c5d845)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of both layers was recomputed by hand and numerically (the comparison lemma and its three applications, the Mills-ratio and hazard theorems, Owen's line formula, Plackett's identity, the Fréchet endpoints, Sheppard's formula, the trivariate formula at a singular matrix, the equicorrelated orthant), and every source locator that could be read supports the statement as written. There is one small correction (a locator into Gasull–Utzet) and two format notes, none blocking. One point about the sources is left for the human reviewers.

## C01 — "Section 5" of Gasull–Utzet is item 5 of Subsection 3.4 in the version on arXiv

The Chernoff-type Example of Layer 1 (README line 143) and the References entry (line 451) cite "Gasull and Utzet, Section 5" for the bound `1 − Φ(x) < e^(−x²/2)/2` and its optimality. In arXiv:1307.3433v1, the only copy that could be read here, the paper has three sections; the Chernoff-type bounds are the fifth numbered item of Subsection 3.4 (more bounds with rational or exponential functions; its text, lines 805–823), and that is where the bound is derived from the decrease of the Mills ratio and called optimal with a reference to Chang et al. A reader who looks for a Section 5 finds none. Corollary 2(i) (line 85) and Theorem 9 (line 396, in Subsection 3.2) are as cited.

Would you cite "Subsection 3.4, item 5" and give arXiv:1307.3433 as the preprint? The README's preprint address is a university repository, which the project's source rules do not treat as an open repository, while the arXiv copy is one.

## N01 — Tau Ceti already has the derivative of `log(1 − cdf)` used in the route of 1.2

The log-concavity step of 1.2 (README line 122) differentiates `log Q` by hand. The pinned Tau Ceti has `TauCeti.Probability.hasDerivAt_neg_log_one_sub_cdf` (`TauCeti/Probability/Hazard.lean`, line 59): where the distribution function has derivative `d` and survival is positive, `−log(1 − cdf)` has derivative `d/(1 − cdf)`. It could be named on the *Needs* line of 1.2.

## N02 — The Layer 2 section comment in the Lean file drops "and trivariate"

`Suggested.lean` line 48 reads "Layer 2: bivariate normal probabilities"; the README's layer title is "bivariate and trivariate normal probabilities", and 2.5 and 2.6 stand under it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.0 `R′ = xR − 1`, `R″ = (1 + x²)R − x`; comparison lemma | quotient rule; `g′` expanded; `x = 0` | `R(0) = 1.2533 = √(π/2)`, `R′(0) = −1`, `R″(0) = 1.2533`; `R` terms cancel in `g′` | holds | none |
| 1.0 (a), (b), (c) | `x = −8, −3, −1, 0, 0.5, 1, 3, 8, 20` | `x = 1`: `1/x − R = 0.3443`, `R − x/(1+x²) = 0.1557`, `R − (√(x²+4) − x)/2 = 0.0376`; all positive at every point | holds | none |
| 1.1 strict decrease and convexity on `ℝ` | same nine points | `R′`: `−677.0` (−3), `−1` (0), `−0.0862` (3); `R″`: `2256.3`, `1.2533`, `0.0459` | holds | none |
| 1.2 `λ′ = λ(λ − x) ∈ (0, 1)`; strict log-concavity | same points; `x = ±5` | `λ′`: `4.0e−14` (−8), `0.6366 = 2/π` (0), `0.9975` (20); `(log Q)″(5) = −0.967`, `(log Φ)″(5) = −7.4e−6` | holds | none |
| 2.0 representation; `corrMatrix2`; density | `L Lᵀ` for `L = !![1,0;ρ,s]`; `ρ = 2` | `L Lᵀ = !![1,ρ;ρ,1]`; `det = 1 − ρ² = −3 < 0`, law is the point mass at `0` | holds | none |
| 2.1 Owen on `k = 0` | `(h, ρ) = (0, ½), (1.3, −0.7), (−0.4, 0.9), (2, 0.3)`; `ρ = 1` | quadrature left `0.408183`, right `0.408183` at `(1.3, −0.7)`; sign variant gives `0.4950`; `ρ = 1`, `h = 0`: `½` against `¼` | holds; hypothesis needed | none |
| 2.2 Plackett | `(h, k, ρ) = (0,0,0.3), (1,−0.5,0.6), (−1.2,0.8,−0.4), (0.3,2,0.95)` | central difference `0.0468855`, density `0.0468855` at `(1,−0.5,0.6)`; `0.166840` both sides at `(0,0,0.3)` | holds | none |
| 2.3 endpoints and strict increase | `(h, k) = (0,0), (−1,0), (0.5,1.2), (1,−0.3)` at `ρ = ±0.999999` | `ρ → 1`: `0.691462` against `Φ(0.5) = 0.691462`; `ρ → −1`: `0.576393` against `0.576393`; `(−1, 0)`: `0` against `0` | holds | none |
| 2.4 Sheppard | `ρ = 0, ±½, 0.9, ±1, 2` | `ρ = 0.9`: `0.428217` both sides; `ρ = −1`: `0 = ¼ − ¼`; `ρ = 2`: left `0`, right `½` | holds; hypothesis needed | none |
| 2.5 trivariate orthant | `I`; all ones; singular `(½, ½, −½)`; generic; non-unit diagonal | singular: simulation `0.1659`, formula `1/6`; generic: `0.1692` against `0.1696`; `!![4,1,0;1,1,0;0,0,1]`: `0.168` against formula `¼` | holds; unit diagonal needed | none |
| 2.6 equicorrelated orthant | `n = 0, 1, 2, 3, 4` | `n = 0`: event is the whole space, `1`; `n = 3`: 2.5 gives `⅛ + ⅛ = ¼`; `n = 4`: simulation `0.1990` against `0.2` | holds | none |
| Scope: DLMF 7.8.2 implies Gordon and Birnbaum–Komatu | substitution `R(x) = √2·M(x/√2)` | lower bound becomes `2/(x + √(x²+4))`; upper `2/(x + √(x²+8/π)) < 1/x`; `x = 1`: `0.618 > 0.5` | holds | none |
| C01 locator | arXiv:1307.3433v1 section list | sections 1–3 only; Chernoff item at its text lines 805–823, in 3.4 | locator differs | C01 |

- Source locators checked against the text: 14 (Dümbgen (2), (3), (9) and attributions; Gasull–Utzet Corollary 2(i), Theorem 9, the Chernoff item; Koch–Lapidoth Propositions 2 and 3 with their hypotheses and references [10], [14]; Meyer (2.2)–(2.3), (2.5), the ordering, (2.10), (3.10)–(3.11), (3.14); DLMF 7.8.2–7.8.5).
- Library declarations opened at the pins: 23, all present with the hypotheses the README states (for example `multivariateGaussian_of_not_posSemidef`, `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean` line 170; `map_affine_multivariateGaussian`, `TauCeti/Probability/Distributions/Gaussian/Affine.lean` line 73, rectangular `L`; `continuous_multivariateGaussian`, `.../Continuity.lean` line 51; `integral_Iic_two_mul_gaussianPDFReal_mul_cdf_gaussianReal`, `.../OwensT.lean` line 126; `IsGaussian.map_neg_eq_self`, `.../Symmetry.lean` line 33; `LogConcave.lintegral_prod_right`, `TauCeti/MeasureTheory/Integral/PrekopaLeindler.lean` line 397).
- Duplication by object: no Mills ratio, Gaussian hazard, bivariate normal distribution function, Plackett, Sheppard or orthant statement in the pinned Mathlib or Tau Ceti; `TauCeti/Probability/Hazard.lean` has general hazard identities only (N01).
- Cross-roadmap citations resolved on main: 6 (SpecialFunctionsEiLiErfIncompleteGamma §12.2; GaussianIsoperimetryAndClusters §1.2; SteinsMethodForNormalApproximation §2.1; MathematicalStatisticsFoundations §4.4; MathematicalStatisticsNonparametric §4.2, the Check with `τ = (2/π) arcsin ρ`; StandardDistributions §8.2).
- Overlap check: read GaussianComparisonInequalities (open; owns Slepian's lemma and the interpolation formula, which this roadmap excludes), StochasticOrders (open; hazard rate order of general laws), StandardDistributions, SteinsMethodForNormalApproximation, GaussianIsoperimetryAndClusters (main); nothing shared: Owen's `T` and the tail bounds on `x ≥ 0` are cited to their owners.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (8 warnings); the 13 elaborated signatures agree with the README; one-tactic probe (`simp` with the definitions unfolded, `exact?`) closes none of the 8 theorems. All 8 headline theorems are stated; none is unstatable.
- Automatic checks: all passed.

Source independence: 19 passages compared with 5 sources, none shared; largest share Meyer (arXiv:0912.2816v1), 6 of 14 locators; contents compared with Meyer (sections 1–7): independent, Layer 2 takes its 2.1 from Meyer's Section 3 and 2.2–2.4 from Section 2, and 2.5–2.6 are not in it.

Research link: Layer 1 sharpens to the whole line the Mills-ratio results surveyed by Dümbgen (2010) and Gasull–Utzet (2014); Layer 2's orthant values are the base points of the expansions Koch–Lapidoth (2010) use, and the normal-copula facts of Meyer (2009). Rests on the README's sources, read here.

## Not verifiable

- Gasull–Utzet at the README's preprint address: the host is a university repository the sources service does not class as legal; arXiv:1307.3433v1 was read instead, and the published article was not.
- Sheppard (1900), Stieltjes (1889), Plackett (1954), Owen (1956), David (1953), Birnbaum, Komatu, Sampford, Shenton: not read; the README names them only as its secondary sources attribute them, without locators, and those attributions were confirmed in the secondary sources.

## Source issues

- none

## For the human reviewers

- **Scope.** The six theorems of Layer 2 are classical (1889–1956); the README gives no locator into a primary or textbook source for them, only into two arXiv preprints (Meyer 2009; Koch–Lapidoth 2010) and its own proofs.
- **Licence.** The README's address for the Gasull–Utzet preprint is a university repository (`ddd.uab.cat`), which the sources service refuses as unclassified; the same paper is arXiv:1307.3433.
