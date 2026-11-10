# Review of RandomMatrices (pull request #1971 at 1259170)

**Verdict:** needs changes

Three findings: one blocking (R01, P2) and two P3. Both findings of the previous review are repaired, the gate passes and the file elaborates with `sorry` as the only warning.

## R01 (P2) — Three more targets are already in the pinned Tau Ceti

Location: `TauCetiRoadmap/RandomMatrices/README.md` line 535 ("Prove epsilon-net cardinality estimates for Euclidean spheres"), lines 701–702 ("Define `sampleCovariance X = XX*/n` and prove `sampleCovariance_isHermitian`"), lines 403–404 ("rectangular Gram corollaries of the rank bound"); `Suggested.lean` lines 133–139.

Claim: each is asked for as a target or defined afresh, but the pinned Tau Ceti (2fd255d) has it, and none is in From Tau Ceti. The description's sentence "moves to consumption everything the pinned Tau Ceti already carries" is therefore still not true.

| README target | Pinned declaration | File and line |
| --- | --- | --- |
| §2.4 net cardinality for spheres | `TauCeti.exists_finset_isCover_sphere` (an `η`-net of the unit sphere with at most `(1 + 2/η)^dim` points), `TauCeti.card_le_of_isSeparated_of_subset_closedBall`, `TauCeti.coveringNumber_le_of_subset_closedBall` | `TauCeti/Analysis/Normed/Module/CoveringNumber.lean` 168, 85, 143 |
| §4.1 `sampleCovariance`, `sampleCovariance_isHermitian` | `TauCeti.sampleSecondMoment v = r⁻¹ ∑ᵢ vᵢvᵢᴴ`, `TauCeti.isHermitian_sampleSecondMoment`, `TauCeti.posSemidef_sampleSecondMoment` | `TauCeti/Analysis/Matrix/SampleSecondMoment.lean` 50, 66, 71 |
| §1.2 Gram corollary of the rank bound | `Matrix.abs_spectralMeasure_mul_conjTranspose_self_Iic_sub_le_two_mul_rank_div_card` (bound `2 rank(X−Y)/m` for `XXᴴ`, `YYᴴ`) | `TauCeti/Analysis/Matrix/SpectralMeasure/RankPerturbation.lean` 65 |

Witness: at the pin, `sampleCovariance X = TauCeti.sampleSecondMoment (fun j i ↦ X i j)` is proved by `ext k l; simp [sampleCovariance, TauCeti.finiteMean_eq_inv_smul_sum, Matrix.mul_apply, Matrix.smul_apply]` (elaborated in a scratch file).

Repair:
- **Contract.** Add the three rows to From Tau Ceti, each with its file, and add the three objects to the Scope sentence that lists what Tau Ceti already has.
- **§2.4.** Write "The cardinality bound `(1 + 2/η)^n` for an `η`-net of the unit sphere is Tau Ceti's `TauCeti.exists_finset_isCover_sphere`." Keep the bilinear and quadratic net reductions as targets.
- **§4.1 and `Suggested.lean`.** Say that the sample covariance of `X` is Tau Ceti's `TauCeti.sampleSecondMoment` of the columns of `X`. In `Suggested.lean` import `TauCeti.Analysis.Matrix.SampleSecondMoment` and either state the two covariance headlines directly on `TauCeti.sampleSecondMoment (fun j i ↦ x (i, j) ω)` with `TauCeti.isHermitian_sampleSecondMoment _`, or keep the name with the body `TauCeti.sampleSecondMoment fun j i ↦ X i j` and take `sampleCovariance_isHermitian` from `TauCeti.isHermitian_sampleSecondMoment`. Both forms elaborate at the pin once that module is built. The Check `X = (1, i)` still gives `1`.
- **§1.2.** Cite the pinned Gram bound. If the sharp constant `rank(X−Y)/p` is wanted (Bai 1999, Lemma 2.6), state that as the target with its locator.
- **Description.** The quoted sentence becomes true once these are done.

## R02 (P3) — §7.4 has no locator for the shrinkage limit and is narrower than its source

Location: `README.md` lines 1081–1086: "Prove the integrated bulk nonlinear-shrinkage formula: for Gaussian `X`, `0 < y < 1`, `cI ≤ T_p ≤ CI` …".

Claim: the limit has no claim-level locator. The layer cites only PB §§19.1–19.3, which the Scope says supplies formulas, not proofs. The theorem is Ledoit–Péché, and it holds for i.i.d. entries, not only Gaussian ones, and for every `y ≠ 1`.

Witness: Ledoit–Péché, arXiv:0911.3010v1, Theorem 1.4 and (13) (source lines 438–451), under (H1)–(H4) (lines 41–51): i.i.d. real or complex entries, mean zero, variance one, bounded twelfth absolute moment. With their `γ⁻¹ = y` the weight is `λ/|1 − y − yλ m̆(λ)|²`, the README's formula.

Repair:
- Cite "(Ledoit–Péché 2011, Theorem 1.4 and (13), arXiv:0911.3010 numbering)" at the formula and add the paper to References.
- State the theorem under the source's hypotheses: i.i.d. entries of mean zero, variance 1 and bounded twelfth absolute moment, `y ≠ 1`, limiting law `ν` supported in a compact subinterval of `(0,∞)`. The conclusion is almost-sure convergence of `p⁻¹ ∑_{λᵢ ≤ x} uᵢ*T_puᵢ` to `∫_{-∞}^x δ dμ` for every `x ≠ 0`, with `δ` as in (13).
- Keep the Gaussian case and the `ν = δ₁` computation as Checks. That Check is unchanged: `|w|² = x` gives weight `1`.

## R03 (P3) — `K` in the operator-norm bound of §2.4 is not defined

Location: `README.md` lines 536–537: "For a `p × n` matrix with independent centred sub-Gaussian coordinates prove `P(‖X‖ > CK(√p+√n+t)) ≤ 2exp(-ct²)`".

Claim: the sentence does not say what `K` is. With §2.3's meaning (variance proxy `K`) the bound is false; it is right when the proxy is `K²`, the meaning the next sentence uses.

Witness: `p = n = 1`, `X = σg` with `g` standard Gaussian, proxy `σ²`. Read with `K = σ²`, the bound says `P(|g| > Cσ(2+t)) ≤ 2e^{-ct²}`. Fix `t` with `2e^{-ct²} < 1/2`; as `σ → 0` the left side tends to `1`.

Repair: write "with independent centred coordinates, each sub-Gaussian with variance proxy at most `K²`". On the witness the bound becomes `P(|g| > C(2+t)) ≤ 2e^{-ct²}`, independent of `σ`.

## Previous findings (review of afc9d39)

- **R01 (targets already proved at the pins): repaired.** All thirteen rows are now consumed by name:
  - From Tau Ceti (lines 160–199) and From Mathlib (lines 149–153) carry the declarations with their files.
  - §0.1 takes the pair law from `HasLaw.prod_extension` (lines 311–312); §1.1 cites `Matrix.map_spectralMeasure_ofReal` (line 370) and the fourth bullet is gone.
  - §1.2 reads "The max–min formula and Loewner monotonicity are Tau Ceti's" (lines 400–402); SSP-D14 is no longer cited.
  - §1.3 moves the four spectral-measure identities and the block identities to the "are Tau Ceti's / Mathlib's" sentences (lines 429–435).
  - §2.1 cites the pinned Bernstein bound and keeps McDiarmid for different coordinate laws (lines 467–474); §3.2 keeps only the determinate case as a target (lines 609–613).
  - What R01 above lists is new: it was not in that table.
- **R02 (page of AGZ Proposition 4.1.6): repaired.** Line 845 now reads "(AGZ Proposition 4.1.6, (4.1.6))" with no page; the proposition is at AGZ line 9800.

## Verified sound

**Scope of the review.** Full review of `README.md` (1524 lines) and `Suggested.lean` (470 lines, unchanged since the previous head). The three-dot diff against `origin/main` touches only these two files.

**Gate.** Rerun at this head: every counter is 0 and the line ends in "OK". The dependency check printed:

```text
depcheck: 234 roadmaps, 2270 edges, 0 problem(s)
```

**Build, signatures and padding.**
- **Build.** `lake env lean` on `Suggested.lean`: 18 `sorry` warnings, nothing else.
- **Signatures.** `#check @name` on all 30 declarations in one scratch file, no error; each elaborated type matches its README sentence and none lost a binder. I changed nothing.
- **One-tactic probe.** Each `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity | trivial | (aesop; done)`: all 18 fail. No headline is padding.
- **Headlines.** Every end theorem of the Summary is stated, except the two free-convolution limits, which the docstring names with the missing carrier (no free convolution of measures at the pins; confirmed by search).

**Library declarations opened at the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4).**
- **New contract names, all present.**
  - `SpectralMeasure.lean` 297, 316, 343, 407; `Spectrum.lean` 223.
  - `CourantFischer.lean` 251 (a sup–inf over subspaces of dimension `k+1`, so "max–min" is right) and 363.
  - `EckartYoung.lean` 106 (`|σₙ(A) − σₙ(B)| ≤ ‖A − B‖`).
  - `Bernstein.lean` 173 (mean zero, `|Xᵢ| ≤ b` a.s., `0 ≤ ε`).
  - `McDiarmid.lean` 351 (one law `ν` for every coordinate, proxy `∑ cᵢ²/4`).
  - `WeakConvergence.lean` 139 (limit concentrated on a compact set); `HasLaw.lean` 135.
  - Mathlib `SchurComplement.lean` 285, 369, 400 and `NonsingularInverse.lean` 614.
- **Object searches that found no pinned counterpart.**
  - `Probability/Moments/MatrixConcentration.lean` is an entrywise Chebyshev bound, not matrix Bernstein.
  - `Analysis/Matrix/UnitaryGroup/Weyl.lean` is the Weyl group `N(T)/T ≅ Sₙ`, not the integration formula.
  - `Gaussian/MixedMoments.lean` has only the fourth-order Isserlis identity, a special case of §2.5.
  - `Analysis/Matrix/Eigenvalues/Basic.lean` 252 is rank interlacing, not Cauchy interlacing of minors.
  - No Pfaffian (`Determinant/Skew.lean` line 28 says so), Fredholm determinant on Hilbert space, Hanson–Wright, Efron–Stein, logarithmic Sobolev inequality, Lindeberg replacement, Weingarten, Mercer, large deviation principle, logarithmic potential, quarter-circle law or Schur triangularization.

**Cross-roadmap citations resolved on main (641eaf3).**
- SpecialFunctionsAiry 1.1 (line 347), 1.2 (370), Layer 2 (481), 3.2 (585), 3.4 (620), 3.6 (708), 8.5 (1382, with the bound `C² e^{−x−y}`); its Names paragraph (line 142) gives `TauCeti.airyAi`, `TauCeti.Real.airyAi`.
- OperatorTheory: PolarDecomposition PD-A51, PD-A52 (lines 254, 257); SpectralSubspacePerturbation SSP-D06, SSP-D13 (lines 428, 444); OperatorIdeals OI-B01–OI-B19, OI-B23, OI-B29, OI-B30.
- StandardDistributions Layers 0, 3–6, target 12.1 (line 2143) and `wishartGramMeasure` (line 886); OptimalTransport Layers 0–3 (lines 346–504); CompactGroups Layer 0 (line 205) and its `SU(2)`-only `weyl_integration_formula`; SuccessiveMinima 0.1.2 (line 188).
- CompactOperators' Fredholm determinants are nonarchimedean ("No Hilbert-space singular-value or Schatten theory", line 78), so §8.3 is not a second owner.

**Ownership and overlaps.** `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap. `roadmaps grep` over main and the open heads finds no second owner of Hanson–Wright, matrix Bernstein, Efron–Stein, Mercer, large deviation principles, Tracy–Widom, logarithmic Sobolev, Marchenko–Pastur, Christoffel–Darboux or Littlewood–Offord.

**Seeded sample, checked against the text.**
- **0.3:** T lines 4578–4612 (§2.3.2, (2.59), (2.60), for the operator norm, as the README says).
- **1.1, 1.3:** the pinned declarations above; no source claim.
- **2.4:** the net bound is pinned (R01); V not readable (below); `K` is R03.
- **2.5:** AGZ line 2297 (Lemma 2.4.5); T line 3854 (§2.2.4).
- **2.6:** Tropp lines 172–192 (Theorem 1.1), 273–290 (Theorem 1.4, `λ_max ≤ R`, `t ≥ 0`, factor `d`), 571–573 (Theorem 3.2).
- **4.2:** AGZ line 638 (Lemma 2.1.6).
- **4.3:** Bai lines 122–136 (Theorem 2.1: variance `σ²`, diagonal with no moment requirement, printed p. 614), 197–205 (the `cot` eigenvalues and the count `4n^{3/4}|E Im w₁₂|`), 334–342 (Theorem 2.4); T line 5615 (Theorem 2.4.2).
- **4.4:** Bai lines 433–452 (i.i.d. double array, mean zero; Theorem 2.5) and 531–535 ("with probability 1").
- **5.1:** AGZ line 2570, (2.5.1), on printed p. 52 (page header at line 2538).
- **7.4:** Ledoit–Péché lines 41–51 and 438–451 (R02); the Check recomputed in the table.
- **8.2:** AGZ lines 4796 (Lemma 3.2.2) and 4851 (Lemma 3.2.3).
- **8.3:** AGZ lines 11124–11129 (Lemma 4.2.13, quoting Simon's Theorem 2.12) and 11496–11505 (Corollary 4.2.24, Theorem 4.2.25).
- **9.5:** AGZ lines 4121–4141 (Assumption 2.6.5 with `α = −β/2`, Theorem 2.6.6); see Source issues.
- **10.3:** T line 9278 (Theorem 2.8.1, in probability and almost surely); TVK lines 339–342 (Theorem 1.13) and 603–616 (Theorem 2.1, hypotheses (i) and (ii)).
- **Also read:** Rudelson–Vershynin 2008 line 117 (Theorem 1.2: rows i.i.d. copies of a vector with independent centred coordinates of variance at least 1); Rudelson–Vershynin 2013 lines 47–50 (Theorem 1.1, `K⁴‖A‖²_HS` and `K²‖A‖` for the `ψ₂` bound `K`).

**Adversarial table.** Values computed this round.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3 symmetrization | one Rademacher, `Φ = x²` | `1 ≤ 2 = 2` | true | none |
| 1.1 measures | `(0,0,1)`; `[[0,1],[0,0]]` | mass `2/3` at `0`; `δ₀` | true | none |
| 1.2 Gram rank bound | pin: `2 rank/m`; Bai Lemma 2.6: `rank/p` | pinned constant `2` | target partly pinned | R01 |
| 1.3 trace identities | `A = diag(1,-1)`, `z = i` | `½((1+i)/2 + (−1+i)/2) = i/2` | true; pinned | none |
| 2.2 Gaussian LSI | `f = e^{ax/2}` | `Ent = a²e^{a²/2} − (a²/2)e^{a²/2} = 2∫f'²` | `C = 1` sharp | none |
| `hanson_wright` | scaling `X → λX`; `K = 0` | `t²/(K²‖A‖_F²)` and `t/(K‖A‖)` invariant; `X = 0`, left side `0` | true | none |
| 2.4 operator norm | `p = n = 1`, `X = σg`, `σ → 0` | proxy `K`: left side `→ 1 > 1/2`; proxy `K²`: `σ`-free | `K` undefined | R03 |
| `matrix_bernstein` | `d = 0`; `m = 0`; `L = 0`; `L < 0` | `0 ≤ 0`; `P(t ≤ 0) = 0`; `X = 0`, bound `2d`; `m = 0` forced | true | none |
| 3.1, 3.3, 3.4 Checks | `δ₁`, `z = i`; `z = i`; `y = 1`, `z = 2` | `|(1−i)/2| = 0.707 ≤ 1`; `m = i(√5−1)/2`; `m = (−2 ± 2i)/4` | true | none |
| `wigner_semicircle_ae`, 4.3 | Bai's count of large eigenvalues | fewer than `4|c|n^{3/4}` exceed `n^{−1/4}` | matches Bai | none |
| `sampleCovariance`, `marchenkoPastur_ae` | `X = (1, i)`; `n = 0`; pin comparison | `(1+1)/2 = 1`; `0⁻¹ • 0 = 0`; equals `sampleSecondMoment` of the columns | true; pinned | R01 |
| `gaussianEnsemble_eigenvalue_density` | `n = 1`, `β = 2, 1`; `n = 2`, `β = 2, 1`; `n = 0` | `√(2π)`, `√2·√(2π) = 2√π`; `¼·2π·2 = π`, `2π·2/√π = 4√π`; both sides Dirac | true | none |
| 5.1 Checks | GUE, GOE `E trₙH²`; `n = 2` gap | `1`, `1 + 1/n`; `s²e^{−s²/2}` | true | none |
| 5.4 Weyl, CUE, HCIZ | `n = 2` | `(1/2)·2(2π)²/(2π)² = 1`; `det ≈ t(a₂−a₁)(b₂−b₁)`, limit `1` | true | none |
| 6.2, 6.4 | centred `κ₄`; free Poisson `λ` | `m₄ − 2m₂²`: `2 − 2 = 0`, `3 − 2 = 1`; `λⁿ(1/λ)^{n−1} = λ` | true | none |
| 7.1, 7.2 | `ν = δ₀`; `ν = δ₁`, `y = 1` | `tm² + zm + 1 = 0`; `zm² + zm + 1 = 0` | true | none |
| `gaussianEnsemble_spike_ae`, 7.3 | `θ = 1`, `2`; `ℓ = 1+√y` | `2`; `5/2`, overlap `3/4`; `(1+√y)²`, overlap `0` | true | none |
| 7.4 shrinkage | `ν = δ₁`; Ledoit–Péché `γ⁻¹ = y` | `w² − (1−y+z)w + z = 0`, `|w|² = x`, weight `1`; same `δ(λ)` | true; locator | R02 |
| 8.2 Checks | Laguerre `n = 1`; CUE `n = 2` | `c₀ = Γ(a+1)`; `K(θ,θ) = 1/π`, integral `2` | true | none |
| `fredholmDet`, `gue_bulk_gap` | `A = ∅` | term `k = 0` is `1`, others `0`; probability `1` | true | none |
| `goe_largest_eigenvalue_tracyWidom` | `s → ∞` | `√F₂ → 1`, `e^{−½∫q} → 1` | true | none |
| 8.6 linear statistics | `f = x`; `f = x²` | `(2β)⁻¹·4 = 2/β`; `(2β)⁻¹·2·4 = 4/β`, direct `(2n + 2n(n−1))/n² → 2` | true | none |
| `LargeDeviationPrinciple` | `μₙ(F) = 0` | `a⁻¹·⊥ = ⊥ ≤` anything | determines | none |
| `gaussianLogEnergy`, `n²` principle | integrand minimum; semicircle | `r²/8 − log r + 1 ≥ 3/2 − log 2 = 0.807`; `1/2 + 1/4 + 1 = 7/4` | true | none |
| `gaussianEnsemble_largest_eigenvalue_ldp`, 9.4 | `x = 3`, `β = 2` | effective potential `2.429`; `∫₂³√(t²−4) = 3.354 − 1.925 = 1.429 = 2.429 − 1`; AGZ's printed formula gives `−1.429` | README right | Source issues |
| `least_singular_value` | Rudelson–Vershynin 1.2 hypotheses | rows i.i.d., column variances `≥ 1`, centred by `HasSubgaussianMGF` | matches | none |
| `circular_law_ae`, 10.2 | disc potential | `Δ((|z|²−1)/2) = 2 = 2π·π⁻¹` | true | none |

**Counts.** 27 table rows; 30 signatures checked; 18 headlines probed; 16 newly cited pinned declarations opened, plus 7 pinned files read for duplicates; 20 cross-roadmap citations resolved; about 30 source passages read in AGZ, Bai, T, Tropp, TVK, Rudelson–Vershynin and Ledoit–Péché.

## Not verifiable

- **V** (Vershynin, *High-Dimensional Probability*): the author's page timed out again. Proposition 2.7.1(v), Theorem 2.8.1, Theorems 4.4.5 and 4.6.1 (§§2.1, 2.4) are unchecked against the text.
- **BLM** (Oxford University Press, 2013): no open copy; the §2.1 page locators are unchecked.
- **PB** (Cambridge University Press, 2020): no open copy; cited at layer level only.
- **Johansson 1998** and **Simon 2005**: no open copy; Simon's Theorem 2.12 is checked only through AGZ's quotation.
- **Not re-read this round:** Soshnikov 2000, Benaych-Georges–Nadakuditi 2011, Tao–Vu 2008.

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82: the source says the rate for `x ≥ x*` is `β∫log|x−y|σ(dy) − V(x) − α`, which is negative to the right of `x*`; it should be `V(x) − β∫log|x−y|σ(dy) + α`, zero at `x*` and increasing; affects a stated result.
