# Review of MathematicalStatisticsNonparametric (pull request #2368 at e7f4031)

**Verdict:** needs changes

Incremental re-review of the 24 lines changed since `af2f0d7`. That change joins seven orphaned punctuation marks in Checks and is correct; it repairs none of the four findings of the previous review, which are carried below with the line numbers of this head.

## R01 (P2) — 5.3: the bias limit is attributed to a pinned lemma that does not state it

**Location:** `README.md` lines 1686–1688: "for integrable `K` with `∫ K = 1` and every density `f`, `∫ |K_h * f - f| → 0` as `h → 0`, Tau Ceti's `tendsto_eLpNorm_normed_convolution_sub` for `p = 1`"; also lines 280–281, 378–379, 1698, 2025.
**Claim:** The `L¹` approximate identity for an arbitrary integrable kernel of integral `1` is the pinned Tau Ceti lemma at `p = 1`, so 5.3 has that lemma as its single nonelementary input.
**Witness:** Tau Ceti `MeasureTheory/Function/Lp/ApproximateIdentity.lean` line 165: the lemma takes `phi : I → ContDiffBump (0 : E)` with `(phi i).rOut → 0` and concludes for `(phi i).normed mu`. `K = ½ 1_{[-1,1]}` is no `ContDiffBump`.
**Repair:** Lines 1687–1688: "… as `h → 0`. Proof: since `∫ K = 1`, `K_h * f - f = ∫ K(u) (f(· - h u) - f) du`, so `∫ |K_h * f - f| ≤ ∫ |K(u)| ‖f(· - h u) - f‖₁ du`, which tends to `0` by the continuity of translation in `L¹` (Tau Ceti `MeasureTheory.Measure.continuous_translateLp`, `MeasureTheory/Function/Lp/Translation.lean`) and dominated convergence with the bound `2 |K(u)|`." Replace the lemma by `MeasureTheory.Measure.continuous_translateLp` in the Tau Ceti contract (lines 280–281) and in the `*Needs:*` line 1698; in lines 378–379 and 2025 write "the continuity of translation in `L¹` of Tau Ceti". On the witness: `‖f(· - h u) - f‖₁ → 0` for each `u ∈ [-1, 1]`, bounded by `2`, and `∫ ½ 1_{[-1,1]} · 2 = 2 < ∞`.

## R02 (P3) — 8.6: the eigenvector rate rests on a perturbation bound that main owns and the roadmap does not cite

**Location:** `README.md` lines 2770–2780: "(`fpca_eigenvector`, Hsing–Eubank, Thm 5.1.8, p. 138, and Thm 9.1.3, p. 255) … `‖φ̂_j - φ_j‖ = O_P(n^{-1/2})`"; "*Needs:* 8.1–8.5; Foundations 8.2–8.4; Tau Ceti `…abs_singularValue_sub_singularValue_le` …".
**Claim:** Every deterministic input of the route is a target, a supplier section or a pinned declaration. The bound of `‖φ̂_j - φ_j‖` by `‖Ĉ_n - C‖` over the spectral gap is none of them here: it is cited to a book theorem only.
**Witness:** Main, `OperatorTheory/SpectralSubspacePerturbation/README.md` lines 329–336, SSP-C15 and SSP-C16: for bounded symmetric `A`, `B` on arbitrary Hilbert spaces with form separation `g`, `‖P_U - P_V‖ ≤ ‖B - A‖/g`.
**Repair:** In 8.6, Eigenfunctions, add: "The rate is the dimension-free projector bound of OperatorTheory/SpectralSubspacePerturbation (SSP-C16), applied to the spans of the first `j + 1` and of the first `j` eigenvectors of `C` and `Ĉ_n`: with `g = min_{k ≠ j} |λ_j - λ_k|` and `‖Ĉ_n - C‖ ≤ g/4`, each projector moves by at most `2 ‖Ĉ_n - C‖/g`, so the rank-one projector moves by at most `4 ‖Ĉ_n - C‖/g` and `‖φ̂_j - φ_j‖ ≤ √2 · 4 ‖Ĉ_n - C‖/g`; the first-order term is proved here." Add "OperatorTheory/SpectralSubspacePerturbation SSP-C16" to the `*Needs:*` line of 8.6, to the Layer 8 Dependencies and, with one line, to "Not owned here". Tested: the eigenvalues of `Ĉ_n` move by at most `g/4` (the pinned Lipschitz bound), so each form separation is at least `3g/4` and `‖Ĉ_n - C‖/(3g/4) ≤ 2 ‖Ĉ_n - C‖/g`; for unit vectors with `⟪φ̂, φ⟫ = cos θ ≥ 0`, `‖φ̂ - φ‖² = 2 - 2 cos θ ≤ 2 sin² θ`.

## R03 (P3) — `limsup_power_le_envelope` is already the name of a different headline of the supplier

**Location:** `README.md` line 1279: "**Power envelope** (`limsup_power_le_envelope`, van der Vaart, Cor 15.14, p. 224)"; `Suggested.lean` lines 1202 and 1218.
**Claim:** The name identifies the two-sample shift envelope in the implementation namespace `TauCeti` (Conventions).
**Witness:** MathematicalStatisticsAsymptotic 8.2 (open head `fb780f9`), `README.md` line 2069 and `Suggested.lean` line 1372: `limsup_power_le_envelope` is the envelope for a locally asymptotically normal sequence, in the same implementation namespace; this roadmap's 4.3 cites that section as its supplier.
**Repair:** Rename the declaration here to `limsup_power_twoSample_le_envelope` in `Suggested.lean` line 1202, in the docstring of `tendsto_power_rankTest` (line 1218) and in `README.md` line 1279. The new name occurs in no open statistics roadmap.

## R04 (P3) — Padding in `Suggested.lean`: two unfoldings of `rank`

**Location:** `Suggested.lean` lines 810–812 (`rank_comp_strictMono`) and 815–817 (`rank_comp_perm`); `README.md` lines 782–784.
**Claim:** The file states headlines only, with no declaration that follows in one tactic from the library or restates a definition.
**Witness:** On a copy of this head, `simp [funext_iff, rank, hf.le_iff_le]` closes `rank_comp_strictMono` (exit `0`, 203 `sorry` warnings left); `rank_comp_perm` closes by `funext i; simp [rank]` and one `Finset.card_bij` (previous review, file unchanged).
**Repair:** Delete the two declarations from `Suggested.lean`. In `README.md` lines 782–784 keep the two sentences and remove the backticked names `rank_comp_strictMono` and `rank_comp_perm`.

## Previous findings

- R01 — not repaired: line 1688 still reads "Tau Ceti's `tendsto_eLpNorm_normed_convolution_sub` for `p = 1`"; lines 280, 1698 unchanged.
- R02 — not repaired: the `*Needs:*` line of 8.6 (lines 2778–2780) names no perturbation bound; "SpectralSubspacePerturbation" occurs nowhere in the README.
- R03 — not repaired: `limsup_power_le_envelope` at `README.md` line 1279 and `Suggested.lean` lines 1202, 1218.
- R04 — not repaired: `rank_comp_strictMono` and `rank_comp_perm` at `Suggested.lean` lines 810 and 815, named at `README.md` lines 783–784.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Check, Bernoulli (line 441, rejoined) | `Ber ½`, `Ber ¼` | `(0.70711 - 0.5)² + (0.70711 - 0.86603)² = 0.068148` | holds | none |
| 3.3 Check, `kendallTau` variance (lines 951–952) | `n = 3, 4, 5` in `2(2n+5)/(9n(n-1))` | `22/54 = 11/27`, `26/108 = 13/54`, `30/180 = 1/6` | holds | none |
| 3.3 Check, `spearmanRho` (lines 959–960) | ranks `(1,2,3)`, `(1,3,2)` | differences `(0,-1,1)`, sum of squares `2`, `1 - 12/24 = ½` | holds | none |
| 4.2 Check, independence tests (lines 1268–1270) | `ρ = ½` | `(2/π) arcsin ½ = 0.33333`; `(6/π) arcsin ¼ = 0.482584` | holds | none |
| 4.6 Check, lattice (lines 1479–1481) | `n = 20000`, `20001`, `x = 1` | `⌈√40000⌉ = 200`, `⌈√40002⌉ = 201`; alternating binomial sums `0.7299956`, `0.7352904`; Kolmogorov series `0.7300003` | holds | none |
| 5.2 Check, `isMinOn_amise` (lines 1677–1678) | `A = 0.7`, `B = 0.3`, `n = 100` | `(B/(An))^{1/5} = 0.3360506`; grid minimum at `0.336051`, value `0.0111590` both ways | holds | none |
| 6.5 Check, orthant (lines 2209–2210) | `c = 2.706` | `½ erfc(√1.353) + ¼ e^{-1.353} = 0.114602` | holds | none |
| 5.3 `tendsto_integral_abs_conv_sub` | binder of the pinned lemma; `K = ½ 1_{[-1,1]}` | `ContDiffBump (0 : E)` only; dominated bound `∫ 2K = 2` | statement holds, attribution false | R01 |
| 8.6 `fpca_eigenvector` | gap bound through SSP-C16 | separation `≥ 3g/4`; `‖φ̂ - φ‖ ≤ 4√2 ‖Ĉ_n - C‖/g` | holds | R02 |
| 4.3 `limsup_power_le_envelope` | the name at the supplier's head | Asymptotic `Suggested.lean` line 1372: a different statement under the same name | holds | R03 (name) |
| 3.1 `rank_comp_strictMono` | one `simp` on a copy | closes; 203 `sorry` warnings remain | holds | R04 |

The rows for the untouched statements stand as in the previous review, of `af2f0d7`.

- The diff: seven rejoined punctuation marks (lines 441, 951–952, 960, 1269–1270, 1479, 1678, 2210); no statement, name, locator or number changes; no line of the README now begins with an orphaned mark. `Suggested.lean` and `metadata.toml` are unchanged; nothing outside the folder changes.
- Library declarations opened at the pin: Tau Ceti `MeasureTheory/Function/Lp/ApproximateIdentity.lean` line 165 (`ContDiffBump` binder), `MeasureTheory.Measure.continuous_translateLp` (used at lines 100 and 107 of the same file).
- Cross-roadmap citations resolved again: main `OperatorTheory/SpectralSubspacePerturbation/README.md` lines 329–336 (SSP-C15, SSP-C16); MathematicalStatisticsAsymptotic `README.md` line 2069 and `Suggested.lean` line 1372 at its open head.
- Dependency check: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate (the worker's, at this head): every check passed, build included. Elaboration: exit `0`, 204 `sorry` warnings and nothing else.
- Source locators: the diff adds or changes none; the sampled sections are untouched and stand as in the previous review.
- Pull request text: adds a roadmap, 204 theorems, six headlines named as not stated, suppliers and sections agree with the head. Remark: "drafted but not yet submitted" is dated by the repository, not by this head; MathematicalStatisticsHighDimensional is now an open pull request.
- MathematicalStatisticsHighDimensional (open head `5eade19`) cites 1.3, 2.2, 2.4–2.6 and 6.4 of this roadmap as owner; its `softThreshold` and `softThresholdRisk` are marked local copies, in its own namespace, with the same bodies as `Suggested.lean` lines 2322 and 2325.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalStatisticsHighDimensional (StandardDistributions, RandomMatrices, OptimalTransport as in the previous review; ClassicalErgodicTheory searched by object only then); the soft-threshold map, its risk and the lower-bound toolkit of Layer 2 are owned here and cited by HighDimensional; the sparse Varshamov–Gilbert packing is owned by HighDimensional 1.5, the full hypercube here (2.3); the other shared objects have the owners recorded in the previous review.

Source independence: changed passages only; the diff adds no prose (punctuation only), so 0 passages compared with 0 sources; largest share van der Vaart, 51 of 198 locators (Tsybakov 49); contents not compared again (no layer added, removed or reordered), and neither van der Vaart's nor Tsybakov's text or table of contents could be read.

## Not verifiable

- Nothing new: the diff adds no locator. The items of the previous review stand (Tsybakov, van der Vaart, Samworth–Shah, Wainwright, Wand–Jones, Fan–Gijbels, Green–Silverman, Wahba, Robertson–Wright–Dykstra, Groeneboom–Jongbloed, Hsing–Eubank, Devroye–Györfi–Lugosi: no legal copy read).
- Ownership against the board's packages was not checked again.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart (51 of 198 locators) and Tsybakov (49) could not be read, nor their tables of contents: wording and arrangement were not checked against them; 13 of the 15 sampled sections rest on unread books.
- **Licence.** `README.md` lines 2856–2886 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2888–2894 say Layers 1 and 2 may port proofs with attribution from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017, `README.md` line 2933) read from the author's page; 8 locators point into it.
- **Scope.** `README.md` lines 2909–2911 hand the Kolmogorov distance to MathematicalStatisticsHigherOrderAndResampling, which is neither on main nor in an open pull request; MathematicalStatisticsHighDimensional (lines 125–126) is now an open pull request.
