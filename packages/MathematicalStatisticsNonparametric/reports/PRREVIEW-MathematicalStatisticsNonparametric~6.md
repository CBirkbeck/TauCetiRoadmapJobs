# Review of MathematicalStatisticsNonparametric (pull request #2368 at b6eaa8b)

**Verdict:** needs changes

Incremental re-review of the 77 lines changed since `e7f4031`. The four findings of the previous review are repaired and the repairs are mathematically correct; one of them leaves the new supplier without its contract.

## R01 (P3) — The new supplier has no contract subsection, and "form separation" is used undefined

**Location:** `README.md` lines 2782–2786: "the dimension-free projector bound of OperatorTheory/SpectralSubspacePerturbation (SSP-C16) … each form separation is at least `3g/4`"; `## Exact supplier contracts` (lines 208–362) ends with `### From StochasticCalculus`.
**Claim:** Every supplier a `*Needs:*` line consumes has its subsection under `## Exact supplier contracts`, saying what is consumed and what is assumed of it; every term is standard or defined here.
**Witness:** The `*Needs:*` line of 8.6 (lines 2793–2794) consumes SSP-C16; the contracts have five subsections (lines 210, 253, 305, 327, 356), none for it. "Form separation" is the supplier's term (main, `OperatorTheory/SpectralSubspacePerturbation/README.md` lines 329–336) and is defined nowhere in this README.
**Repair:** After line 362 add:

    ### From OperatorTheory/SpectralSubspacePerturbation

    The spectral subspace perturbation roadmap owns the dimension-free projector bound SSP-C16,
    which rests on the directed bound SSP-C15. For bounded symmetric `A`, `B` on a Hilbert space,
    closed subspaces `U` reducing `A` and `V` reducing `B`, and `g > 0`: if there are `c`, `c'`
    with `(c + g) ‖u‖² ≤ Re ⟪A u, u⟫` on `U` and `Re ⟪B w, w⟫ ≤ c ‖w‖²` on `Vᗮ`, and
    `(c' + g) ‖v‖² ≤ Re ⟪B v, v⟫` on `V` and `Re ⟪A w, w⟫ ≤ c' ‖w‖²` on `Uᗮ` (the two form
    separations, of size `g`), then `‖P_U - P_V‖ ≤ ‖B - A‖/g`. This roadmap consumes it in 8.6,
    with `A = C`, `B = Ĉ_n` and the spans of the leading eigenvectors.

Tested on 8.6 with `U`, `V` the spans of the first `j + 1` eigenvectors and `‖Ĉ_n - C‖ ≤ g/4`: `c + 3g/4 = λ_j` and `c = λ_j - 3g/4 ≥ λ̂_{j+1}`; `c' + 3g/4 = λ_j - g/4 ≤ λ̂_j` and `c' = λ_j - g ≥ λ_{j+1}`.

## Previous findings

- R01 — repaired: lines 1688–1692 prove the bias limit from `MeasureTheory.Measure.continuous_translateLp` and dominated convergence with the bound `2 |K(u)|`; lines 282–283, 380–381, 1702 and 2029 name the same lemma; the import and the `#check` follow.
- R02 — repaired: lines 2781–2789 derive the rate from SSP-C16 with `‖φ̂_j - φ_j‖ ≤ 4√2 ‖Ĉ_n - C‖/g`; SSP-C16 is in the `*Needs:*` line (2793–2794), the Layer 8 Dependencies (2840) and "Not owned here" (123–124). The contract subsection is R01 above.
- R03 — repaired: `limsup_power_twoSample_le_envelope` at `README.md` line 1280 and `Suggested.lean` lines 1192 and 1209; the old name remains only in MathematicalStatisticsAsymptotic.
- R04 — repaired: `rank_comp_strictMono` and `rank_comp_perm` are gone from `Suggested.lean`; `README.md` lines 784–785 keep the two facts as prose without names.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 `tendsto_integral_abs_conv_sub`, new proof (lines 1688–1692) | `K = ½ 1_{[-1,1]}`; the pinned lemma's binders | `K_h * f(x) = ∫ K(u) f(x - h u) du`; integrand `≤ 2 |K(u)|`, `∫ 2K = 2`; lemma needs `p ≠ ∞`, right-invariant, locally finite, inner regular `mu`: Lebesgue | holds | none |
| 8.6 `fpca_eigenvector`, new rate (lines 2781–2789) | `C = diag(3, 1)`, `Ĉ = C + ½ (e₁e₂ᵀ + e₂e₁ᵀ)`, `j = 0`: `g = 2`, `‖Ĉ - C‖ = ½ = g/4` | eigenvalues `3.118`, `0.882` (move `0.118`); `θ = 0.2318`, `‖φ̂ - φ‖ = 0.2313 ≤ √2 sin θ = 0.3249 ≤ 4√2·½/2 = 1.414` | holds | none |
| 8.6, the separations claimed | general `j`, `‖Ĉ_n - C‖ ≤ g/4` | on `U`: `≥ λ_j`; on `Vᗮ`: `≤ λ_j - 3g/4`; on `V`: `≥ λ_j - g/4`; on `Uᗮ`: `≤ λ_j - g`; both `3g/4`; `(4/3)‖·‖/g ≤ 2‖·‖/g` | holds | R01 (contract) |
| 8.6, vector from projector | `θ = π/3` | `2 - 2 cos θ = 1 ≤ 2 sin² θ = 1.5`; needs `cos θ ∈ [0, 1]`, which the sign convention of line 2775 gives | holds | none |
| 4.3 `limsup_power_twoSample_le_envelope` | `λ = ½`, `I_f = 1` | `(1/(½) + 1/(½))⁻¹ = ¼ = λ (1 - λ) I_f`; statement unchanged but for its name | holds | none |
| 3.1 `rank` (lines 782–785) | `x = (2, 5, 3)`, `f = exp`, `σ = (0 1)` | `rank x = (1, 3, 2) = rank (f ∘ x)`; `rank (x ∘ σ) = (3, 1, 2) = rank x ∘ σ` | holds | none |

The rows for the untouched statements stand as in the previous review, of `e7f4031`.

- The diff: 53 lines of `README.md`, 24 of `Suggested.lean`; two declarations deleted, one renamed, one import and one `#check` replaced; no locator added or changed; nothing outside the folder changes.
- Library declarations opened at the pin: Tau Ceti `MeasureTheory/Function/Lp/Translation.lean` line 161 (`MeasureTheory.Measure.continuous_translateLp`), and its elaborated type from the `#check` of `Suggested.lean` line 2957.
- Cross-roadmap citations resolved: main `OperatorTheory/SpectralSubspacePerturbation/README.md` lines 329–336 (SSP-C15, SSP-C16); MathematicalStatisticsAsymptotic `README.md` line 2069 and `Suggested.lean` line 1372 at its open head (`limsup_power_le_envelope`, now without a second owner); `limsup_power_twoSample_le_envelope` occurs in no other roadmap, open or on main.
- Dependency check: `depcheck: 246 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate (the worker's, at this head): every check passed, build included. Elaboration: exit `0`, 202 `sorry` warnings and no other warning.
- Source locators: the diff adds or changes none; of the seeded sample, 3.1 and 4.3 fall in changed passages, with their locators (van der Vaart, Lemma 13.1, p. 174; Cor 15.14, p. 224) untouched and unread as before.
- Pull request text, read against this head: adds a roadmap; 202 theorems (202 `theorem` lines); six headlines named as not stated; the Dependencies list names OperatorTheory/SpectralSubspacePerturbation SSP-C16 and "the continuity of translation in `L¹`"; nothing contradicted or left out.
- Remark on untouched text: the scan of `README.md` line 2633 for `IsEigenExpansion.sum_inner_le` is a tool lead on a name outside the diff; not examined again.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalStatisticsHighDimensional (StandardDistributions, RandomMatrices, OptimalTransport as in the earlier reviews), and OperatorTheory/SpectralSubspacePerturbation for the changed passages; the projector perturbation bound is owned by SpectralSubspacePerturbation and cited here; the LAN power envelope is owned by MathematicalStatisticsAsymptotic 8.2, the two-sample shift envelope here (4.3), now under its own name; the other shared objects have the owners recorded in the previous reviews.

Source independence: changed passages only; 2 passages compared (the proof of the bias limit in 5.3, the rate argument in 8.6) with 1 source readable for them (the SpectralSubspacePerturbation roadmap on main, no sentence shared); Devroye–Lugosi and Hsing–Eubank could not be read; largest share van der Vaart, 51 of 198 locators (Tsybakov 49); contents not compared again (no layer added, removed or reordered), and neither van der Vaart's nor Tsybakov's text or table of contents could be read.

## Not verifiable

- Nothing new: the diff adds no locator. The items of the earlier reviews stand (Tsybakov, van der Vaart, Samworth–Shah, Wainwright, Wand–Jones, Fan–Gijbels, Green–Silverman, Wahba, Robertson–Wright–Dykstra, Groeneboom–Jongbloed, Hsing–Eubank, Devroye–Györfi–Lugosi: no legal copy read).
- Ownership against the board's packages was not checked again.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart (51 of 198 locators) and Tsybakov (49) could not be read, nor their tables of contents: wording and arrangement were not checked against them; 13 of the 15 sampled sections rest on unread books.
- **Licence.** `README.md` lines 2870–2901 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2903–2909 say Layers 1 and 2 may port proofs with attribution from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017, `README.md` line 2948) read from the author's page; 8 locators point into it.
- **Scope.** `README.md` lines 2924–2926 hand the Kolmogorov distance to MathematicalStatisticsHigherOrderAndResampling, which is neither on main nor in an open pull request.
