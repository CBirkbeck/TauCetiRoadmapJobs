# FIX-PKG-GaussianIsoperimetryAndClusters~3

Repair round for the five findings of the review `REV-PKG-GaussianIsoperimetryAndClusters~2` (all P3). I checked each one on the mathematics before applying it, and all five hold. The review's section "For the human reviewers" lists no findings, and nothing was changed because of it.

## F01 (P3) — applied

`packages/GaussianIsoperimetryAndClusters/README.md` §2.3, last Check: `0.136176` → `0.136177`. Recomputed: `φ(0)(Φ(1) − 1/2) = 0.398942280 × 0.341344746 = 0.136176851`. Simpson quadrature of `(2π)^{−1} e^{−t²/2}` on `[0, 1]` with 10000 panels gives `0.1361768514`. No other occurrence of the value appears in the README or the Lean file.

## F02 (P3) — applied

`Suggested.lean` `gaussianPerimeter_gaussianSymmetral_le`: deleted `(hP : gaussianPerimeter U < ⊤)`, and the docstring now reads "a Lebesgue-measurable `U` … trivially when `P_γ(U) = ∞`". README §6.6: the localized inequality keeps `P_γ(U) < ∞`, and the global form now reads "which holds for every Lebesgue-measurable `U`, trivially when `P_γ(U) = ∞`". A new Check covers infinite perimeter (`⋃ (1/(2k+1), 1/(2k))`, symmetral perimeter `0.195467 ≤ ∞`). `hU` is kept.

Pattern: I looked for other `< ⊤` finiteness hypotheses in `Suggested.lean`. The only other one is the field `Cluster.weightedPerimeter_lt_top`, which is part of the definition of a cluster (MilmanNeeman2022 line 701–702), not a redundant hypothesis. The Layer 2 `hfin` hypotheses are needed: without them the variation measure takes its junk value `0`.

## F03 (P3) — applied

The README §8.2 statement went from "for every Borel `A ⊆ E`" to "for every set `A ⊆ E`, its Gaussian measure being the outer measure when `A` is not measurable". The route is now written out: the closed form of §8.1 with `Φ(a) = γ(A)`, so `γ(cthickening r A) − γ(A) ≥ Φ(a + r) − Φ(a)`. *Needs:* gains §1.1. Lean: `{A} (hA : MeasurableSet A)` → `(A : Set E)`, and the docstring was updated to match. A new Check uses a non-measurable Bernstein set.

## F04 (P3) — applied

README §3.5 locator: "for `q ≥ 2`" → "for `q ≥ 2` and `W ∈ C^∞` …; the route below uses smoothness of `W` only through the lower semicontinuity and compactness of §2.4, which hold for `C¹` weights". Conventions: added a sentence saying Milman–Neeman assume a `C^∞` density and Borel cells in their Sections 3–4 (line 697–701), and that Layers 2–3 are stated for `C¹` weights and Lebesgue-measurable sets. Same pattern: the docstrings of `exists_cluster_perimeter_eq_isoperimetricProfile` and of the three Layer 2 theorems now say "for `C^∞` weights".

## F05 (P3) — applied

README §4.5 route: "some such difference stays bounded" → "stays bounded above". I also added "the same `l` for every `m` after passing to a further subsequence", because the minimizing index can otherwise change with `m`. This matches MilmanNeeman2022 line 606–608, which uses only the upper bound `x_{m,j} − x_{m,i} ≤ C`.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.3 Check, segment `[0,1] × {0}` | closed form; quadrature | `0.398942280 × 0.341344746 = 0.136176851`; Simpson (N = 10⁴) `0.1361768514` | rounds to `0.136177`; fixed |
| §6.6 / `gaussianPerimeter_gaussianSymmetral_le` without `hP` | `n = 1`, `U = ⋃_{k≥1}(1/(2k+1), 1/(2k))`; disc in `ℝ²`; `n = 1`, `(−1, 1)`; `n = 0`; non-measurable `U` | `P_γ(U) = ∞`, `γ(U) = 0.116140`, symmetral `(−∞, −1.194508)` with `I(0.116140) = 0.195467 ≤ ∞`; `0.517483 ≤ 0.606531`; `0.356343 ≤ 0.483941`; no unit vector, so vacuous; the integral of a non-measurable integrand is junk `0`, so `hU` stays | true for every measurable `U`; hypothesis removed |
| §6.6 localized form | `B ⊆ e^⊥` Borel | `P_γ(U; B ⊕ ℝe)` is defined through the Borel extension of §2.2, which needs local finiteness; the routes of §§6.3–6.5 assume `P_γ(U) < ∞` | `P_γ(U) < ∞` kept |
| §8.2 / `gaussian_minkowskiContent_ge` for every set | Bernstein `A ⊆ (−∞, 0) ⊂ ℝ`; `A = ∅`; `ℚ²`; `{x_1 < a}`; outer measure `1`; `n = 0` | `γ*(A) = 1/2`, closure `(−∞, 0]`, quotient `0.398278` at `r = 0.1` and `0.398936` at `r = 0.01`, limit `0.398942 = I(1/2)`; `0 ≥ I(0) = 0`; `1/r → ∞ ≥ 0`; `φ(a)`; `I(1) = 0`; `γ = δ_0`, `γ(A) ∈ {0, 1}`, right side `0`. In `ℝ≥0∞`, `ofReal Φ(a+r) − ofReal Φ(a) = ofReal(Φ(a+r) − Φ(a))` since `Φ` is increasing | true; hypothesis removed; Check added |
| §8.2 with inner measure (wrong reading) | Bernstein `A` | right side `I(0) = 0`, quotient `Φ(r)/r → ∞` | weaker statement; recorded as a Check |
| §3.5 for `C¹` weights | `W(x) = |x|^{3/2} + log Z` on `ℝ`, `C¹` but not `C²` | `Z = 2Γ(5/3) = 1.805491`; the half-line `(−∞, 0)` has measure `1/2` and weighted perimeter `e^{−W(0)} = 1/Z = 0.553866`, so the profile at `(1/2, 1/2)` is finite; the §2.4 functionals `u ↦ ∫ u div_μ X dμ` need only a continuous `∇W` | outside MilmanNeeman2022 Theorem 4.1 as stated (line 920), covered by the README route; locator qualified |
| §4.5 route, "bounded above" | `q = 3`, `J = {1, 2}`, `x_{m,3} − x_{m,1} = −m`; `C = 0`; `k = 1` | does not tend to `+∞`, with no bounded subsequence; with the upper bound, `x_m + Ω^m_3 ⊇ {z_3 > z_1, z_3 > z_2}`, of `γ`-measure `1/3 > 0`, contradicting `v_{m,3} → 0`; for `k = 1` the coordinate bound in `J` is empty | the step is now correct in every case |
| Conventions `C^∞` sentence | locators into MilmanNeeman2022 Sections 3–4 cited by Layers 2–3 (§2.2, §2.4, §2.5, §3.1–§3.5) | each Layer 2–3 route uses `W` only through `e^{−W}` continuous and positive and `∇W` continuous (Gauss–Green for the `C¹` field `e^{−W}X`) | consistent |

## Checks run

- **Elaboration.** `lake env lean packages/GaussianIsoperimetryAndClusters/Suggested.lean`, run from the content checkout, exits 0 with 19 warnings, all "declaration uses `sorry`", at lines 100, 113, 130, 145, 192, 257, 271, 306, 318, 330, 340, 353, 362, 375, 384, 394, 403, 423 and 431. There are no errors and no other warnings.
- **Signatures.** I elaborated a scratch copy with `#check @name` for all 36 declarations and compared it with the earlier listing.
  - `gaussianPerimeter_gaussianSymmetral_le` now has the binders `FiniteDimensional`, `MeasurableSpace`, `BorelSpace`, `{e} (‖e‖ = 1) {U} (NullMeasurableSet U volume)`, and conclusion `gaussianPerimeter (gaussianSymmetral (ℝ ∙ e) e U) ≤ gaussianPerimeter U`.
  - `gaussian_minkowskiContent_ge` now has `FiniteDimensional`, `MeasurableSpace`, `BorelSpace` and an explicit `(A : Set E)`.
  - Both match the README. The other 34 types are unchanged. The three definitions that look as if they lost binders (`gaussianWeight`, `gaussianSymmetral`, `closedGaussianSymmetral`) only lose instances their bodies do not use.
- **Dependency check.** Output: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **No gate failures** were listed for this round. `design/plan.json` is unchanged (`gaps: []`, and none is needed).

## For the maintainer

- No Lean name changed, was added or was deleted. Other roadmaps cite none of the changed names, and no section numbering moved.
- Both theorem changes make the statements more general, so nothing downstream breaks. `gaussian_minkowskiContent_ge` now takes `A` explicitly; it used to be implicit and recovered from `hA`.
- No new constructions were introduced, so ownership is unchanged from the earlier rounds. I did not re-check ownership against open pull requests this round, beyond the citation resolver and the overlap report, which lists nothing.
- No source was fetched and none is missing; `sources.toml` is unchanged. Nothing in the review text read as an instruction outside the job.
