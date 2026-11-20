# Review of DifferentialEntropyAndEntropyPower (pull request #2735 at a540a82)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement survived the degenerate cases (`d = 0`, `h = ±∞`, `λ ∈ {0, 1}`, Dirac and singular laws), every number printed in a Check was recomputed and agrees, every library declaration and cross-roadmap section cited exists where it is cited, and the locators into Rioul, Madiman–Barron and Madiman–Melbourne–Xu match the texts. There are three small corrections and two format notes, none blocking. The eleven locators into Polyanskiy–Wu could not be checked against the text, which is left to the human reviewers together with the status of that copy.

## C01 — Rioul credits (17c), not (17a), to Stam

In 3.3 (line 413) the locator reads "Rioul, Proposition 3, (17a), p. 8, attributed there to Stam". At that place the source credits the weighted form (17c) to Stam and says that its equivalence with the reciprocal form (17a) was pointed out to Stam by de Bruijn (Rioul2011 line 392–393). A reader who looks up the attribution finds it attached to the inequality of 3.2, not of 3.3.

The smallest change: "(Rioul, Proposition 3, (17a), p. 8; the weighted form (17c) is credited there to Stam and its equivalence with (17a) to de Bruijn)".

## C02 — The trace identity used in 1.3 is already in Tau Ceti and is not cited

The route of 1.3 (line 176) uses "the trace identity `∫ ⟪x − m, Σ⁻¹(x − m)⟫ dμ = d` for the mean `m`" as if it were to be proved here. The pinned Tau Ceti has it: `TauCeti.integral_inner_toEuclideanLin_sub_integral_eq_trace_mul_covMatrix` (`TauCeti/Probability/Moments/Covariance.lean`, line 131) gives, for a probability measure with `MemLp id 2 μ` and any matrix `B`, that the mean of the quadratic form of `B` on the centred variable is `trace (B * covMatrix μ)`; with `B = Σ⁻¹` the value is `trace 1 = d`. An implementer who does not know of it will prove it again.

The smallest change: name the declaration in the route and the `*Needs:*` line of 1.3 and in the Tau Ceti supplier contract, beside `TauCeti.covMatrix`.

## C03 — The restriction `λ ∈ [0, 1]` in 3.2 is not used

In 3.2 (line 391) and in `fisherInformation_conv_le` the weight is restricted to `[0, 1]`, but neither the truth of the inequality nor the route needs it. The score identity of 3.1 holds for `λ = 1` and for `λ = 0`, hence for every real `λ` by linearity of the conditional expectation; the contraction and the vanishing cross term do not see the sign of `λ` or `1 − λ`. Instance: `μ = ν = δ₀`, `d = 1`, `λ = 2` gives `1/(s + u) ≤ 4/s + 1/u`. The consumers 3.3 and 4.1 only use weights in `(0, 1)`, and the cited sources state the range `[0, 1]`, so the statement as written is correct and nothing downstream changes.

If the wider statement is wanted, the two hypotheses `hl₀`, `hl₁` would be dropped and 3.1 and 3.2 would say "for every real `λ`"; if the sources' range is preferred, a clause in 3.2 saying that the restriction is the sources' and is not needed would do.

## N01 — The Check "A Dirac mass has `h = −∞`" in 1.1 (line 109) is for `d ≥ 1`

The next bullet gives the value `0` for `d = 0`; adding "for `d ≥ 1`" to the bullet makes the two agree at sight. The same applies to "`μ = δ_a`" in the Checks of 1.4 and "`δ₀` and any `ν`" in 4.2, where 4.2 already assumes `d ≥ 1`.

## N02 — Six README lines exceed 100 characters (126, 228, 354, 371, 436, 568); line 126 runs to 141.

## Questions for the author

- In 2.2 (line 279) the README says "Barron's justification of the exchange of derivative and integral is one-dimensional". The pull request's description says Barron (1986) was not opened, and I could not read it either. Is the sentence taken from a text you read? If it rests on memory, "Barron treats `d = 1`" would be better attributed to Rioul's account (Rioul2011 line 1139–1142, which does not state the dimension) or dropped; the route for every `d` stands without it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `differentialEntropy` | uniform `[0,2]`; Dirac; `d = 0`; both parts of `p log p` infinite | `log 2` vs Tau Ceti `−log 2`; `Ent = ⊤`, `h = ⊥`; `Ent = 0`; `Ent = ⊤`, `h = ⊥` | holds | none |
| 1.1 `h < +∞` under second moment | `f = −‖x‖²` in `boltzmannEntropy_ne_bot_of_integrable_exp` | `exp f` Lebesgue-integrable, `f` `μ`-integrable; `Ent ≠ ⊥` | holds | none |
| 1.2 affine change | Laplace, `a = ±2`; `diag(2,3)` on standard Gaussian; `h = ±∞`; `d = 0`; mass `M ≠ 1` | `1.6931 + log 2 = 2.3863`; `2.8379 + log 6 = 4.6296`; `⊥ + r = ⊥`, `⊤ + r = ⊤`; `log 1 = 0`; shift `M log|det A|` | holds | none |
| 1.3 `klDiv_multivariateGaussian` | Laplace vs `N(−1,3)` and `N(0,2)`; `h = ⊥`; `d = 0` | integral `0.27510` vs `−1.6931 + 1.4682 + 0.5`; `0.07236` vs `1.7655 − 1.6931`; `r − ⊥ = ⊤ = klDiv`; `0 = 0` | holds | none |
| 1.3 Gaussian maximum | Laplace; uniform `[0,1]`; `S = [[2,.6],[.6,1]]`; `δ₀` with `Σ = 0`; factor `2π` for `2πe` | `1.6931 ≤ 1.7655`; `0 ≤ 0.17649`; `3.08523`; `h = ⊥ ≠ (1/2) log 0 = 0` though `μ = N(0,0)`; `1.4189 > 0.9189` | holds | none |
| 1.3 moment consequence | `S = (a/d)•1`, `m = 0` | `h ≤ (d/2) log(2πa/d) + (d/(2a)) ∫‖x‖² ≤ (d/2) log(2πe a/d)` | holds | none |
| 1.4 `max(h(μ), h(ν)) ≤ h(μ ∗ ν)` | uniform + uniform; `μ = δ_a`; `h(μ) = ⊥` | triangular law `h = 1/2 ≥ 0`; `h(ν) ≥ ⊥`; trivial | holds | none |
| 2.1 Fisher information, three lemmas | `N(0,1)`, `t = 1`; two-point law at `t = 1/4, 1`; uniform at `t = 2`; indicator of `[0,1]`; scaling by `a` | `1/2`; `2.90244 < 4`, `0.55040 < 1`; `0.480000`; junk value `0`; `a⁻² J` from `|a|^(−d) p_t(y/a)` | holds | none |
| 2.2 de Bruijn | `δ₀`; two-point law and uniform at `t = 0.1, 0.5, 2`; `X + tZ` normalisation; `d = 0` | `d/(2u)` both; `4.8796, 0.53796, 0.16876` vs `4.8794, 0.53796, 0.16876`; `2.7696, 0.85723, 0.24000` both; `1.4512 ≠ 0.5380`; `0 = 0` | holds | none |
| 2.3 small times | uniform `t = .01, .001`; two-point law; `h(μ) = ⊥` with density | `0.18064, 0.05712`; `−0.19050, −1.34179` = `(1/2)log(2πe t) + log 2`; `liminf klDiv = ⊤`, so `h_t → ⊥` | holds | none |
| 2.3 large times | uniform at `t = 10`; `d = 0` | `0.004149 ≤ (1/2) log(1 + 1/120) = 0.004149…`; both terms `0` | holds | none |
| 3.1 score of a sum | `μ = ν = δ₀`, any `λ` | `−y/(s+u)` vs `−λ y/(s+u) − (1−λ) y/(s+u)` | holds | none |
| 3.2 weighted inequality | two-point (`s = .1`), uniform (`u = .2`); `λ = 0, .3, .5, 1`; `λ = 2` on Diracs | `J(r) = 1.51732`; right sides `3.53712, 2.61149, 3.32400, 9.75887`; `1/(s+u) ≤ 4/s + 1/u` | holds; holds for all real `λ` | C03 |
| 3.3 Stam | same example; `s = u = 1`; Diracs; `d = 0`; optimal `λ = J(q)/(J(p)+J(q))` | `0.65906 ≥ 0.38519`; `3.04942 ≥ 2.90018`; `s + u = s + u`; `⊤ + ⊤ ≤ ⊤`; right side `J(p)J(q)/(J(p)+J(q))` | holds | C01 |
| 4.1 `entropyPower` | `h = ⊥`; `h = ⊤`; `d = 0`; scaling by `a` | `exp ⊥ = 0`; `⊤`; `(2/0 : ℝ) = 0`, value `1/(2πe)`; `a² N` | holds | none |
| 4.1 Lieb's form | uniforms, `λ = 1/2`; `λ = 0, 1`; `h(μ) = ⊥`; equal Gaussians; route derivative | `0.15343 ≥ 0`; `0·h(μ) + h(ν) = h(δ₀ ∗ ν)`; left `⊥`; equality; `J(r_t) ≤ λJ(p_t) + (1−λ)J(q_t)`, `f′ ≤ 0` | holds | none |
| 4.2 EPI | uniforms; Laplace + uniform; `diag(1,2)`, `diag(2,1)`, `diag(2,4)`; `d = 0`; `δ₀` | `0.15915 ≥ 0.11709`; `1.85307 ≥ 1.78906`; `3 ≥ 2.8284`, `√18 = √2 + √8`; `2/(2πe) > 1/(2πe)`; equality | holds | none |
| 4.2 reduction to 4.1 | `λ = N(μ)/(N(μ)+N(ν))` | `N(λ^(−1/2) X) = N(μ)/λ = N(μ)+N(ν)`, same for `Y` | holds | none |
| Supplier: heat equation | ScoreBasedDiffusion 1.2 with `s = √t` | `∂_s p = s Δp`, `ds/dt = 1/(2√t)`, so `∂_t p_t = (1/2) Δ p_t` | agrees | none |
| Supplier: heat kernel | `φ_v` vs `TauCeti.heatKernel` | `(4π·v/2)^(−d/2) exp(−‖x‖²/(4·v/2)) = (2πv)^(−d/2) exp(−‖x‖²/(2v))` | agrees | none |
| Supplier: Gibbs change of reference | `f = −⟪x−m, S⁻¹(x−m)⟫/2`, `μ` a probability | `klDiv = Ent + (1/2)∫Q + (1/2) log((2π)^d det S)` | agrees | none |

- Source locators checked against the text: 27 of 38 (Rioul2011 21 of 21, MadimanBarron2007 2 of 2, MadimanMelbourneXu2017 4 of 4); the 11 into Polyanskiy–Wu not checked.
- Library declarations opened at the pins: 31 (17 in Tau Ceti, 14 in Mathlib), each at its file and line; all exist with the hypotheses the README states. `ProbabilityTheory.IndepFun.map_add_eq_map_conv_map` is generated by `to_additive` from `IndepFun.map_mul_eq_map_mconv_map` (`Mathlib/Probability/Independence/Basic.lean`, line 1122) and elaborates under `#check`.
- Cross-roadmap citations resolved: DenoisingDiffusion 1.1, 3.1, 3.3 (main), OptimalTransport 11.2 and 11.7–11.9 (main), MathematicalStatisticsFoundations 4.3 (main), MathematicalStatisticsNonparametric 1.3 (main), RandomMatrices 2.2 (main), ScoreBasedDiffusion 1.2 and 2.1 (open head). `smoothedDensity` has the same body as DenoisingDiffusion's, in a different namespace.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. ScoreBasedDiffusion is an open pull request that adds a new roadmap folder and is named in the description as a dependency.
- Elaboration of `TauCetiRoadmap/DifferentialEntropyAndEntropyPower/Suggested.lean`: 11 `sorry` warnings, nothing else. `#check @name` on all 15 declarations: every type carries `d` and its own binders; each agrees with its README statement. No `set_option`, no sorry'd data; imports are `Mathlib` and three existing Tau Ceti modules.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on the 11 theorems: none closes. No padding. Headlines (Gaussian maximum, de Bruijn, Stam, the entropy power inequality) are all stated.
- Duplication by object: no differential entropy, entropy power, location Fisher information, de Bruijn or Stam statement in the pinned Mathlib or Tau Ceti, nor in any other roadmap on main or open; EntropyAndSourceCoding lists differential entropy as outside its scope. Ownership against the open pull requests was checked through the roadmap search at their heads.
- The pull request's title and description agree with the head (eleven theorems, four definitions, three Tau Ceti imports, one open supplier); the automatic checks all passed; no change outside the folder.

Overlap check: read ScoreBasedDiffusion, DenoisingDiffusion, RenyiDivergenceAndPrivacy, EntropyAndSourceCoding, FlowMatching, MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations; the smoothed density, its score and the bound `d/s²` are owned by DenoisingDiffusion and its time derivatives by ScoreBasedDiffusion, both cited; the parametric Fisher information is owned by MathematicalStatisticsFoundations and is a different object; nothing else shared.

Source independence: 19 passages compared with 3 sources, none shared; largest share Rioul2011, 21 of 38 locators; contents compared with Rioul2011: independent (Layer 1 ↔ I-B, I-C and two other sources; Layer 2 ↔ II-A, II-D; Layer 3 ↔ II-C; Layer 4 ↔ I-C, II-E; the source puts II-C before II-D, the roadmap de Bruijn before Stam, and the order 2, 3, 4 is forced by the `*Needs:*` line of 4.1). Polyanskiy–Wu (11 locators) could not be read.

Research link: The entropy power inequality in Lieb's form and Stam's Fisher information inequality are the starting point of Madiman–Barron (2007) on monotonicity of entropy and of the Rényi and reverse inequalities surveyed by Madiman–Melbourne–Xu (2017); rests on the README's references and on those two texts as read.

## Not verifiable

- The eleven locators into Polyanskiy–Wu (Definition 2.6 and (2.16), Theorem 2.7 (b) and (c), Theorem 2.8 with its proof and (2.18)–(2.20), §3.8, (3.36), Theorem 3.16): the prepublication copy on an author's page was not accepted by the sources service as an author's page, and the publisher's page is not open. Each statement they support was checked by computation, and all but the general-`S` divergence identity of 1.3, the determinant form of 1.2 and the bound (2.20) also have a verified locator in another source.
- Stam (1959), Blachman (1965), Lieb (1978), Barron (1986): attributed in prose only; not opened.
- Rioul2011 page images could not be rendered here; its locators were read in the extracted text.

## Source issues

- **Misprint** in Rioul2011 at (55a), p. 22: the source says, in the extracted text, that the difference of divergences ends with plus the entropy of the Gaussian comparison vector; it should be plus the entropy of `X` itself; affects nothing.

## For the human reviewers

- **Licence.** Polyanskiy–Wu is cited in its prepublication version of 16 August 2024, which the README says the authors offer on their pages; the sources service could not classify that host, so the copy's status is unsettled.
- **Not tested.** 11 of the 38 locators point into Polyanskiy–Wu and were not checked against the text; wording and arrangement were not compared with it. The largest share (Rioul2011, 21 locators) was read.
