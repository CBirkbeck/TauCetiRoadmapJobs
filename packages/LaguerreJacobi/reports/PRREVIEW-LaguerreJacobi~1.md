# Review of LaguerreJacobi (pull request #117 at 5aad605)

**Verdict:** needs changes

The roadmap folder holds `README.md` and `metadata.toml` only. The gate fails on `missing-files` (`TauCetiRoadmap/LaguerreJacobi/Suggested.lean`), so nothing could be elaborated, `#check`ed or probed; every Lean-side check below is therefore "not possible", and the review is of the README against the pins and the sources. The mathematics of the two families, their constants and the Chebyshev edge case is sound (one exception, R02); the blocking defects are the missing acceptance test, one false hypothesis in F2, and one target that restates a Mathlib lemma.

## R01 (P1) — `Suggested.lean` is absent; the gate fails and the statable headlines are unstated

- Location: the folder `TauCetiRoadmap/LaguerreJacobi/` (no `Suggested.lean`); `gate.md`: `missing-files (1)`.
- Claim: the pull request description says the Lean file "will follow as a separate PR", and `OneParameterSemigroups` and `RepresentationTheory` are precedent for a README-only roadmap.
- Witness: the gate rule `missing-files` fails at this head; the brief's contract is that `Suggested.lean` is the roadmap's acceptance test. The headline theorems are statable at the pins: B3 and D3 need only the two explicit-sum definitions (whose bodies are in A1 and C2) and the two `withDensity` measures (B1, D1), all on native carriers; B4 and D4 need only the Tau Ceti declarations `TauCeti.hilbertBasisOfWeightedMeasure` and `TauCeti.hilbertBasisOfOrthogonalSystem` (WeightedOrthogonalBasis.lean lines 169 and 193 at `a91d3aa`); F1 needs `Polynomial.shiftedLegendre`; F3 needs `Polynomial.Chebyshev.measureT`. Independently of the gate, 26 backticked names of this roadmap's own in the README (`citations.md`) are claims that `Suggested.lean` declares them, and none is declared.
- Repair: add `TauCetiRoadmap/LaguerreJacobi/Suggested.lean` with `import Mathlib` and the `TauCeti.*` modules used, the definitions `laguerre`, `jacobi`, `laguerreMeasure`, `jacobiMeasure` (real bodies, explicit sums, over `[CommRing R] [Algebra ℚ R]` or over `ℝ`), and the sorried headlines: B3, D3 (with `jacobiNormSq` and its `n = 0`, `α + β = −1` branch), B4, D4, F1's Legendre orthogonality `∫ x in (0:ℝ)..1, (shiftedLegendre m).eval x * (shiftedLegendre n).eval x = if m = n then 1/(2n+1) else 0`, F3's measure identification and the two Chebyshev values. Elaborate it with `lake env lean` and `#check @name` for every declaration, and strip from the README every backticked name the file does not declare.

## R02 (P1) — the degree hypothesis for `gegenbauer` is false

- Location: `README.md` lines 502–506: "The leading coefficient of the sum carries the factor `(2λ)ₙ` … Carry the algebraic hypothesis `(ascPochhammer R n).smeval (2*lam) ≠ 0`".
- Claim: `(2λ)ₙ ≠ 0` implies `degree (gegenbauer lam n) = n`.
- Witness: the leading coefficient of the F2 sum is its `k = 0` term, `2ⁿ (λ)ₙ / n!` (DLMF Table 18.3.1, dlmf18_3 line 153 gives `kₙ = 2ⁿ(λ)ₙ/n!`), not `(2λ)ₙ`. Over `ℚ` with `λ = −1`, `n = 2`: `(2λ)₂ = (−2)(−1) = 2 ≠ 0`, but `(λ)₂ = (−1)(0) = 0`, and the README's own value `gegenbauer lam 2 = C (2λ(λ+1)) X² − C λ` is `0·X² + 1 = 1`, of degree `0 ≠ 2`. Computed exactly over `ℚ`; the Gegenbauer–Jacobi identity `(λ+½)ₙ • Cₙ = (2λ)ₙ • Pₙ^{(λ−½,λ−½)}` still holds there (both sides `2 · P₂^{(−3/2,−3/2)}`), so the error is only in the degree statement.
- Repair: hypothesis `(ascPochhammer R n).smeval lam ≠ 0` (over `ℝ` this is implied by `0 < lam`, so the real specialization stands); rewrite the sentence to "carries the factor `(λ)ₙ`, with leading coefficient `((2ⁿ : ℚ)/n!) • (λ)ₙ`"; add the negative control `gegenbauer (−1) 2 = 1` as a Check. With `λ = 0` the two conditions agree, so the `λ = 0` discussion is unaffected.

## R03 (P2) — C1 restates a Mathlib lemma and overclaims a gap

- Location: `README.md` lines 330–337: "What is genuinely missing is the real interval integral itself … nothing in Mathlib identifies that with the real-variable, `Real.rpow` integrand".
- Claim: the real Beta interval integral is absent from Mathlib at the pin.
- Witness: `Mathlib/Probability/Distributions/Beta.lean` at `6b7abb3`: `lintegral_betaPDF` (line 78) rewrites `∫⁻ betaPDF` as `∫⁻ x in Ioo 0 1, ENNReal.ofReal (1/beta α β * x ^ (α-1) * (1-x) ^ (β-1))` with `Real.rpow`, and `lintegral_betaPDF_eq_one` (line 108, hypotheses `0 < α`, `0 < β`) proves it equals `1`, its proof passing through `beta_eq_betaIntegralReal` and `Complex.ofReal_cpow` — exactly the identification the README says is missing. `betaMeasure` (line 132) and `isProbabilityMeasureBeta` (line 135) also exist. The interval-integral form `∫ x in (0:ℝ)..1, x^(u-1) * (1-x)^(v-1) = beta u v` is a few-line corollary (`integral_eq_lintegral_of_nonneg_ae`, `integral_Ioc_eq_integral_Ioo`, cancel the positive constant).
- Repair: in "What Mathlib already has", cite `ProbabilityTheory.lintegral_betaPDF`, `ProbabilityTheory.lintegral_betaPDF_eq_one`, `ProbabilityTheory.betaMeasure`, `ProbabilityTheory.isProbabilityMeasureBeta`; restate C1 as the one-line corollary in Bochner interval-integral form with those as its `*Needs:*`, and D1's `IsFiniteMeasure` as the pushforward of `betaMeasure (β+1) (α+1)` under `t ↦ 2t − 1` scaled by `2^(α+β+1)`, citing `isProbabilityMeasureBeta`. Drop the sentences quoted above.

## R04 (P3) — wrong namespace for the bounded-support exponential-moment lemma

- Location: `README.md` lines 206 and 414: `TauCeti.Integrable.exp_abs_smul_of_ae_abs_le`.
- Witness: `TauCeti/MeasureTheory/Function/BoundedSupportExponential.lean` line 56 at `a91d3aa` declares it `protected theorem _root_.MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le`, so its name is `MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le`; `TauCeti.Integrable.exp_abs_smul_of_ae_abs_le` does not exist.
- Repair: rename at both places. Its statement (`Integrable g μ`, `∀ᵐ x ∂μ, |x| ≤ R` ⟹ `Integrable (fun x => (exp (a*|x|) : 𝕜) • g x) μ`) does give D2 with `g = 1` on `jacobiMeasure`, once `IsFiniteMeasure` (D1) is in hand; say so in D2's `*Needs:*`.

## R05 (P3) — misquoted hypothesis of `integrableOn_rpow_mul_exp_neg_mul_rpow`

- Location: `README.md` lines 154–155: "`-1 < s → 1 ≤ p → 0 < b → …`. Note `1 ≤ p`, so `p = 1` is the boundary case".
- Witness: `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` line 74 at the pin: `(hs : -1 < s) (hp : 0 < p) (hb : 0 < b)`. The lemma is stronger than quoted; B2's use at `p = 1` is unaffected.
- Repair: quote `0 < p` and delete the "boundary case" sentence.

## R06 (P3) — a foreign revision pin, a GitHub URL and process narrative in the README

- Location: lines 179–193 (`0a9009b`, the URL, "deliberately not done in this pull request, whose scope is…", "`OrthogonalL2Bases/Suggested.lean` still advertises an earlier shape"); lines 562–580 ("mathlib4 #41840", "Tau Ceti #1474", "merged 2026-07-30", usernames, "should be introduced to each other on Zulip").
- Witness: `lake-manifest.json` pins Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, not `0a9009b…`; all eight cited Tau Ceti names resolve at the manifest pin (see Verified sound), so the foreign pin is unnecessary and contradicts the roadmap's actual contract. Pull-request numbers, dates and handles are process narrative that the house style excludes.
- Repair: replace lines 179–193 by an `## Exact supplier contracts` subsection `From Tau Ceti` listing the eight declarations with their files; delete the `0a9009b` sentence and the URL; delete "Coordination and what is already in motion" or reduce it to the mathematical fact it carries (Hermite is owned by `OrthogonalL2Bases` Part A).

## R07 (P3) — the quoted sibling passage is not on main, and its link is broken

- Location: lines 15–21, the block quote attributed to `OrthogonalL2Bases`.
- Witness: `Completed/OrthogonalL2Bases/README.md` on main (`44f5967`) lines 387–389 contain only the first two sentences; the sentences "That roadmap is [LaguerreJacobi]… consumes this area's completeness toolkit (B1) and bridge (B2)… (The source roadmap has since been completed and archived…)" are not there (this pull request's hunk to that file was dropped at `53ac3da`). The link `../Completed/OrthogonalL2Bases/README.md` resolves from `TauCetiRoadmap/LaguerreJacobi/` to `TauCetiRoadmap/Completed/…`, which does not exist; the folder is `Completed/OrthogonalL2Bases/` at the repository root.
- Repair: quote nothing; write in your own words that `OrthogonalL2Bases` (Completed) defers the two families, and link `../../Completed/OrthogonalL2Bases/README.md`.

## R08 (P3) — five targets named without a statement, one with a sign to pin

- Location: line 250 `laguerre_add_one_sub` ("relating …"), line 389 `jacobi_one`, line 393 `jacobi_succ_succ` ("the three-term recurrence"), line 471 `shiftedLegendre_eq_jacobi_comp` ("relating them"), line 472 `integral_shiftedLegendre_mul_shiftedLegendre` (no constant).
- Witness: DLMF 18.9.13 (dlmf18_9 lines 878–879): `Lₙ^{(α)} = Lₙ^{(α+1)} − Lₙ₋₁^{(α+1)}`, verified over `ℚ` for `n ≤ 4`, three parameters, in `n+1` form. DLMF 18.9.2 (lines 151–158) gives the Jacobi recurrence coefficients `Aₙ, Bₙ, Cₙ`, verified over `ℚ` for `n ≤ 4` and five parameter pairs; its denominators `(n+1)(n+α+β+1)(2n+α+β)` are not units of a general `ℚ`-algebra, so the target must be stated multiplied out: `2(n+1)(n+α+β+1)(2n+α+β) • Pₙ₊₁ = …`. `jacobi_one = C (α+1) + ((1:ℚ)/2) • (C (α+β+2) * (X − 1))`. Mathlib's `shiftedLegendre n = ∑ (-1)^k C(n,k) C(n+k,n) X^k` (ShiftedLegendre.lean line 40) is `Pₙ(1 − 2X)`, not `Pₙ(2X − 1)`: at `n = 1` it is `1 − 2X` while `(jacobi 0 0 1).comp (2X − 1) = 2X − 1`. Shifted-Legendre norm `1/(2n+1)` (DLMF Table 18.3.1, dlmf18_3 line 239); Legendre orthogonality `∫₋₁¹ Pₘ Pₙ = 2/(2n+1) δₘₙ` verified exactly for `m, n ≤ 3`.
- Repair: state each: `laguerre_add_one_sub : laguerre α (n+1) = laguerre (α+1) (n+1) − laguerre (α+1) n`; the multiplied-out Jacobi recurrence; `jacobi_one` as above; `(shiftedLegendre n).map (Int.castRingHom R) = (jacobi 0 0 n).comp (1 − 2 • X)`; the Legendre integral with its constant `1/(2n+1)` on `(0,1)` (and `2/(2n+1)` on `(−1,1)` for `jacobi 0 0`).

## R09 (P3) — ring division inside `C` contradicts the ℚ-scalar convention

- Location: line 394 `C ((n + α + β + 2)/2)`; line 366 "`(2^n)⁻¹ • ∑ …`".
- Witness: lines 229–233 fix that every rational constant enters through `Algebra ℚ R`; `[CommRing R]` has no `/` and no `⁻¹`, so the two displays do not typecheck at the stated generality (they do over `ℝ`, which is the silent specialization the Generality bar forbids).
- Repair: `derivative (jacobi α β (n+1)) = ((1:ℚ)/2) • (C (n + α + β + 2) * jacobi (α+1) (β+1) n)` and `((1:ℚ)/2^n) • ∑ …`. The identity itself is DLMF 18.9.15 (dlmf18_9 line 1001) and was verified over `ℚ` for `n ≤ 4`, five parameter pairs.

## R10 (P3) — README shape, locators, Checks and `sources.toml`

- Location: whole file. Headings are `## Overview`, `## Scope boundary`, `## Generality bar`, `## What Mathlib already has`, `## Part A` … `## Part F`, `## Anti-vacuity`, `## Dependency ordering`, `## Coordination`.
- Witness: the required shape (`**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n`, `*Needs:*` per target, `**Checks.**` per definition, `### Examples`, `### Dependencies`, `## Downstream consumers`) is absent; no target carries a locator (the only locator in the file is "Szegő §4.3" in the reference list); `laguerre`, `laguerreMeasure`, `jacobiMeasure` and `jacobiNormSq` have no Checks list (`jacobi` and `gegenbauer` have three each, in prose); the folder has no `sources.toml`. The depcheck passes only because there is no `*Needs:*` line to check.
- Repair: restructure into layers (A→1, B→2, C→3, D→4, E/F→5), one `*Needs:*` line per target, a `**Checks.**` list per definition (the Laguerre controls already in A4 and the Anti-vacuity section are the material), and a locator per target. DLMF chapter 18 is open and carries every formula used here: Table 18.3.1 (weights, `hₙ`, `kₙ`, `𝒜₀`), 18.5.5 with Table 18.5.1 (Rodrigues), 18.5.8, 18.5.10, 18.5.12 (sums), 18.6.1 and Table 18.6.1 (special values, reflection), 18.7.1, 18.7.3, 18.7.9 (Gegenbauer, Chebyshev, Legendre), 18.9.2, 18.9.13, 18.9.15, 18.9.23 (recurrences and derivatives); record it, Szegő and Abramowitz–Stegun in `sources.toml` with these locators.

## R11 (P3) — the bridge's measure is `withDensity` of a restriction; the roadmap's is a restriction of `withDensity`

- Location: lines 279–281 (`laguerreMeasure := (volume.withDensity …).restrict (Set.Ioi 0)`), 310 (`HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (laguerreMeasure α))` "via `TauCeti.hilbertBasisOfWeightedMeasure`"), 453 ("instantiations, not proofs").
- Witness: `TauCeti.hilbertBasisOfWeightedMeasure` (WeightedOrthogonalBasis.lean line 169) has type `HilbertBasis ℕ 𝕜 (Lp 𝕜 2 (μ.withDensity (fun x => ENNReal.ofReal (w x))))`; with `μ = volume.restrict (Ioi 0)` that measure equals `laguerreMeasure α` only through `MeasureTheory.restrict_withDensity` (WithDensity.lean line 215), a propositional equality, so the stated type is reached by a transport of `Lp` along a measure equality, not by instantiation.
- Repair: either define `laguerreMeasure α := (volume.restrict (Set.Ioi 0)).withDensity …` (and likewise `jacobiMeasure`) so B4/D4 are literal instantiations, or keep the `measureT` shape and add the transport as a named step in B4 and D4. The same choice decides whether F3's `jacobiMeasure_neg_half_neg_half_eq_measureT` is one rewrite or two.

## Verified sound

**Gate and tooling.** Gate at `5aad605`: `missing-files=1 FAIL` (R01); no other rule fails. Depcheck (`--movable`): `depcheck: 156 roadmaps, 1061 edges, 0 problem(s)`, no UPWARD or CYCLE line; `LaguerreJacobi` is line 353 of the merge order; its only supplier, `OrthogonalL2Bases`, is Completed on main (`Completed/OrthogonalL2Bases/`, sections B1 line 250, B2 line 275, B3 line 318 exist). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LaguerreJacobi'` is empty. Elaboration, `#check` comparison and the one-tactic probe: not possible, no Lean file.

**Pinned declarations opened (Mathlib `6b7abb3`).** `Real.Gamma_eq_integral` (Gamma/Basic.lean 405, `0 < s → Gamma s = ∫ x in Ioi 0, exp (-x) * x ^ (s - 1)`, as quoted); `Real.Gamma_zero` (433); `integral_rpow_mul_exp_neg_mul_rpow` (MeasureTheory/Integral/Gamma.lean 43, hypotheses `0 < p`, `-1 < q`, `0 < b`, value `b ^ (-(q+1)/p) * (1/p) * Gamma ((q+1)/p)`, as quoted); `integrableOn_rpow_mul_exp_neg_mul_rpow` (GaussianIntegral.lean 74, R05); `MeasureTheory.integral_Ioi_mul_deriv_eq_deriv_mul` (IntegralEqImproper.lean 1406, `HasDerivAt` on `Ioi a`, limits at `a⁺` and `∞`); `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDeriv_right` (IntegrationByParts.lean 97, `ContinuousOn` on `[[a,b]]`, `HasDerivWithinAt` on the open interval, as the README describes); `Polynomial.Chebyshev.measureT` (Chebyshev/Orthogonality.lean, `(volume.withDensity (ofNNReal ⟨√(1-x²)⁻¹,_⟩)).restrict (Set.Ioc (-1) 1)`, as the README says); `integral_eval_T_real_mul_eval_T_real_measureT_of_ne` (131), `integral_eval_T_real_mul_self_measureT_zero` (138, `= π`), `integral_T_real_mul_self_measureT_of_ne_zero` (143, `= π/2`); `integral_measureT` (53), `integrable_measureT` (67); `Polynomial.shiftedLegendre` (ShiftedLegendre.lean 40), `factorial_mul_shiftedLegendre_eq` (46), `neg_one_pow_mul_shiftedLegendre_comp_one_sub_X_eq` (102); `Polynomial.iterate_derivative_eq_zero_of_degree_lt` (Derivative.lean 699), `iterate_derivative_mul` (306); `Polynomial.Sequence` with `degree_eq'` (Sequence.lean 43–47); `ProbabilityTheory.beta` (Beta.lean 33, `Gamma α * Gamma β / Gamma (α+β)`), `beta_eq_betaIntegralReal` (41); `Complex.betaIntegral_eq_Gamma_mul_div` (Gamma/Beta.lean 536), `Complex.Gamma_mul_Gamma_eq_betaIntegral` (123); `Real.rpow_def_of_neg` (Pow/Real.lean 94, `exp (log x * y) * cos (y * π)`, as the README says); the anonymous `BinomialRing` instance for `[Module ℚ≥0 R]` (RingTheory/Binomial.lean 276, so the README's reason for `ascPochhammer` over `Ring.choose` holds); `MeasureTheory.restrict_withDensity` (WithDensity.lean 215). No `Laguerre`, `Gegenbauer`, or Jacobi-polynomial declaration exists in Mathlib or Tau Ceti at the pins (grep).

**Tau Ceti `a91d3aa`.** `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` (Probability/Moments/Determinacy.lean 243, `∃ a, 0 < a ∧ Integrable (exp (a*|x|)) μ` on both sides, finite measures); `TauCeti.orthogonal_span_range_bareNormalizedLp_eq_bot` (PolynomialCompleteness.lean 165: `p : ℕ → ℝ[X]`, `hdeg : ∀ n, (p n).degree = n`, `hc : 0 < c n`, `hexp` on `μ.withDensity (ofReal ∘ w)`, exactly as the README describes); `TauCeti.bareNormalizedLp` (WeightedOrthogonalBasis.lean 69), `hilbertBasisOfWeightedMeasure` (169), `coe_hilbertBasisOfWeightedMeasure` (180), `hilbertBasisOfOrthogonalSystem` (193, needs `∀ᵐ x ∂μ, 0 < w x`), `coe_hilbertBasisOfOrthogonalSystem` (205); `TauCeti.weightL2Isometry` (WeightL2Isometry.lean 114); `MeasureTheory.Integrable.exp_abs_smul_of_ae_abs_le` (BoundedSupportExponential.lean 56, R04). `OrthogonalL2Bases/Suggested.lean` on main does carry the older `∀ a, 0 ≤ a →` shape (line 149) and `barePolyLp_ortho_eq_bot` (186), as the README says.

**Seeded sample.** "Deliberately out of scope": consistent with `Completed/OrthogonalL2Bases` lines 66–84, which place Gram–Schmidt/Favard out of scope the same way. "Gamma and Beta": all seven names resolve (above). "The existing precedent to follow": the five `measureT` names resolve. "Pinned revision": R06. "ℚ-scalars, not ring division": consistent in A1, C2, F2, F3; violated at lines 366 and 394 (R09). "A3. Rodrigues": DLMF 18.5.5 with Table 18.5.1 Laguerre row gives `Lₙ^{(α)} = (x^{-α}eˣ/n!) Dⁿ(e^{-x}x^{n+α})`, as stated. "A4": DLMF 18.6.1 (dlmf18_6 line 83) `Lₙ^{(α)}(0) = (α+1)ₙ/n!`, as stated. "B1": `∫₀^∞ x^α e^{-x} = Γ(α+1)` is `Real.Gamma_eq_integral` at `s = α+1`, needs `-1 < α`, as stated. "B2": substitution computed below. "B3": DLMF Table 18.3.1 Laguerre row (dlmf18_3 lines 243–252) `hₙ = Γ(n+α+1)/n!`, `kₙ = (−1)ⁿ/n!`, `α > −1`: as stated. "Both coefficient factors … orientation": DLMF 18.5.8 (dlmf18_5 line 600) pairs `(n+α choose ℓ)` with `(x+1)^ℓ` and `(n+β choose n−ℓ)` with `(x−1)^{n−ℓ}`: as stated. "D3 … genuine edge case": DLMF Table 18.3.1 (dlmf18_3 lines 121–122) gives `𝒜ₙ` as in D3 and the separate `𝒜₀ = 2^{α+β+1}Γ(α+1)Γ(β+1)/Γ(α+β+2)`: as stated, including the edge. "The excluded case is real": with `-1 < α, β`, `2n+α+β+1 > 2n−1 ≥ 1` for `n ≥ 1`, and `= 0` iff `n = 0 ∧ α+β = −1`: as stated. "D3 also needs a uniform diagonal norm": the bridge's `hc : ∀ n, 0 < c n` and `horth` with `if m = n then c n else 0` (WeightedOrthogonalBasis.lean 171–172) confirm the interface the README describes. "D4": instantiation modulo R11.

**Adversarial table** (exact arithmetic over `ℚ` unless noted; "quad" is midpoint quadrature with the substitution `x = sin u`, 2·10⁵ nodes; Laguerre quadrature on `(0,60)`, 4·10⁵ nodes).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| A1 degree, leading coeff | α ∈ {0, ½, −⅓, 3}, n ≤ 4 | `deg = n`, `lc = (−1)ⁿ/n!` every case; `L₁ = (α+1) − X` | holds | — |
| A2 recurrence | same α, n ≤ 3 | `(n+2)Lₙ₊₂ = (2n+α+3−X)Lₙ₊₁ − (n+α+1)Lₙ` as polynomials | holds (DLMF Table 18.9.1 Laguerre row) | — |
| A2 derivative | same | `L'ₙ₊₁^{(α)} = −Lₙ^{(α+1)}`; at `n`-form, `n = 0`: `0 ≠ −1` | holds in `n+1` form; README's junk-value remark correct | — |
| A2 `laguerre_add_one_sub` | same | `Lₙ₊₁^{(α)} = Lₙ₊₁^{(α+1)} − Lₙ^{(α+1)}` | holds; statement missing in README | R08 |
| A4 | same | `Lₙ(0) = (α+1)ₙ/n!` | holds | — |
| B2 substitution | `a ∈ (0,1)` | `x^α e^{-x} e^{a x} = x^α e^{-(1−a)x}`, `b = 1−a > 0`, `p = 1` | holds; lemma needs only `0 < p` | R05 |
| B3 norm | α ∈ {0, ½, −½}, n ≤ 2 | quad vs `Γ(n+α+1)/n!`: 1.0000/1.0000, 0.8862/0.8862, 1.3293/1.3293, 1.6617/1.6617; α = −½: 1.7650/1.7725 (endpoint quadrature error) | holds | — |
| B4 necessity of `-1 < α` | `α = −1`, `n = 0` | `∫₀¹ x^{-1}e^{-x} = ∞` | holds | — |
| C2 orientation | α = 0, β = 1, n = 1 | `P₁ = (3X−1)/2`; `∫₋₁¹ P₁(1+x) = 0`; swapped `(3X+1)/2` gives `2` | holds | — |
| C2 degree, leading coeff | 5 parameter pairs incl. (−½,−½), n ≤ 4 | `lc = (n+α+β+1)ₙ/(2ⁿ n!)`, `P(1) = (α+1)ₙ/n!` | holds (DLMF Table 18.3.1, Table 18.6.1) | — |
| C2 degeneracy | `z = n+α+β+1` | `(z)ₙ = 0 ⇔ z ∈ {0,…,−(n−1)}`; `(z)₀ = 1`; Chebyshev `z = n` | holds | — |
| C3 reflection | 5 pairs, n ≤ 4 | `Pₙ^{(α,β)}(−X) = (−1)ⁿPₙ^{(β,α)}(X)` | holds (DLMF Table 18.6.1) | — |
| C3 derivative | 5 pairs, n ≤ 4 | `P'ₙ₊₁ = ((n+α+β+2)/2) Pₙ^{(α+1,β+1)}`; `n`-form at 0: `0` vs `(α+β+1)/2` | holds; `/2` must be a ℚ-scalar | R09 |
| C3 recurrence | 5 pairs, 1 ≤ n ≤ 4 | DLMF 18.9.2 coefficients reproduce `Pₙ₊₁` | holds; statement missing | R08 |
| C4 Rodrigues | DLMF Table 18.5.1 | `κₙ = (−2)ⁿ n!`, `F = 1−x²` ⇒ `(−1)ⁿ/(2ⁿ n!)(1−x)^{−α}(1+x)^{−β}Dⁿ[(1−x)^{n+α}(1+x)^{n+β}]` | holds | — |
| D1 finiteness | `x = 2t−1` | `∫₋₁¹(1−x)^α(1+x)^β = 2^{α+β+1}B(α+1,β+1)` | holds; already a Mathlib probability measure | R03 |
| D3 norm | (−½,−½), (0,1), (0.3,−0.7), (2,½); n ≤ 3 | quad/formula: 3.14159/3.14159, 0.39270/0.39270, 0.22089/0.22089, 0.15340/0.15340; 2/2, 1/1, 0.66667/0.66667, 0.5/0.5; 4.55349/4.55444, …; 1.72399/1.72399, … | holds, including `n = 0, α+β = −1` giving `π` | — |
| D3 edge consistency | n = 0, α+β ≠ −1 | general formula `= 2^{α+β+1}Γ(α+1)Γ(β+1)/Γ(α+β+2)` by `Γ(α+β+2) = (α+β+1)Γ(α+β+1)` | the split formulas agree | — |
| D3 boundary target | j < n | zero order `n+α−j ≥ 1+α > 0` | holds | — |
| F1 Legendre | m, n ≤ 3 | `∫₋₁¹ PₘPₙ = 2/(2n+1)δ`; Mathlib `shiftedLegendre 1 = 1 − 2X` | holds; sign of the transport must be pinned | R08 |
| F2 values | λ ∈ {½,1,−1,−½,0,3}, n ≤ 2 | `C₀ = 1`, `C₁ = 2λX`, `C₂ = 2λ(λ+1)X² − λ` | holds | — |
| F2 relation | same λ, n ≤ 4 | `(λ+½)ₙ • Cₙ = (2λ)ₙ • Pₙ^{(λ−½,λ−½)}` | holds (DLMF 18.7.1) | — |
| F2 degree hypothesis | λ = −1, n = 2 | `(2λ)₂ = 2 ≠ 0`, `(λ)₂ = 0`, `C₂^{(−1)} = 1`, degree 0 | **false** | R02 |
| F2 leading coeff | λ = 3, n ≤ 5 | `lc = 6, 24, 80, 240, 672 = 2ⁿ(λ)ₙ/n!` | README's "(2λ)ₙ" wrong | R02 |
| F2 λ = 0 | n ≥ 1 | `(0)ₙ = 0` ⇒ `Cₙ^{(0)} = 0`; relation reads `0 = 0` | holds | — |
| F3 scaling | n ≤ 5 | `Pₙ^{(−½,−½)} = ((½)ₙ/n!) Tₙ`; `n = 1`: `X/2` vs `X` | holds (DLMF 18.7.3) | — |
| F3 Chebyshev values from D3 | n = 0; n ≥ 1 | `𝒜₀ = Γ(½)² = π`; `hₙ/((½)ₙ/n!)² = n!π/(2nΓ(n)) = π/2` | matches Mathlib's `π`, `π/2` | — |
| Measure conventions | `Ioo` vs `Ioc` | `{1}` is `volume`-null, `withDensity` is absolutely continuous | README's claim holds | — |

**Ownership.** By object, against main and the 365 indexed open pull requests (`roadmaps grep` for Laguerre, Gegenbauer, ultraspherical, Jacobi polynomial, shiftedLegendre, Legendre, betaIntegral, Beta function/integral): no roadmap other than this one builds Laguerre, Jacobi, Gegenbauer or Legendre orthogonality; `StandardDistributions` (main) consumes `ProbabilityTheory.beta` and defines the regularized incomplete Beta but does not state the complete Beta integral; `PDE` (main) is named only as a consumer. The real Beta integral is owned by Mathlib (R03). Hermite is `OrthogonalL2Bases` Part A and is not touched here.

## Not verifiable

- Szegő, *Orthogonal Polynomials* §4.3 (AMS Colloquium 23): paywalled at the AMS landing page; cited for D3's constant and the `α+β+1 = 0` remark. The same constant and the separate `𝒜₀` were checked in DLMF Table 18.3.1 instead.
- Abramowitz–Stegun ch. 22: the DOI resolves to JSTOR (paywalled); the public-domain copy at the UBC author page fetched but is page images only, and OCR is not available on this worker. Every formula attributed to it (22.3.x, 22.5.x, 22.7.x) was checked in the DLMF equations that cite those A&S numbers.
- Thangavelu, Temme, Askey: paywalled (Princeton, Wiley 403, SIAM 403); cited as background only, no statement depends on them.
- Ownership against open pull requests whose files the brief does not give: not checked beyond the `roadmaps grep` index.

## Source issues

- none
