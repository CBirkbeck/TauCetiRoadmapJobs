# Review of RandomMatrices (pull request #1971 at afc9d39)

**Verdict:** needs changes

Two findings: one blocking (R01, P2) and one locator (R02, P3). All nine findings of the previous review are repaired; the gate passes and the three new headlines are sound.

## R01 (P2) — Several README targets are theorems the pinned Tau Ceti and Mathlib already prove

Location: `TauCetiRoadmap/RandomMatrices/README.md`, §§0.1, 1.1, 1.2, 1.3, 2.1 and 3.2. For example lines 410–412: "Prove `m_{L_A}(z) = trₙ R_A(z)` from the trace formula, `∫ x^k dL_A = trₙ(A^k)`, … equality of the nonzero spectra of `XX*` and `X*X`, the exact zero-mass correction". Scope, line 59: "No second copy of any of them is introduced."

Claim: each statement below is asked for as a target ("Prove", "Develop", "Complete"), but it is a proved declaration at the pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4). None of them is in the supplier contracts. The description's sentence "moves to consumption everything the pinned Tau Ceti already carries" is therefore not yet true.

| README target | Pinned declaration | File and line |
| --- | --- | --- |
| §1.3 `m_{L_A}(z) = trₙ R_A(z)` | `Matrix.resolventTransform_spectralMeasure` | `TauCeti/Analysis/Matrix/SpectralMeasure.lean` 343 |
| §1.3 `∫ x^k dL_A = trₙ(A^k)` | `Matrix.integral_pow_spectralMeasure` | same file, 316 |
| §1.3 zero-mass correction between `L_{X*X}` and `L_{XX*}` | `Matrix.spectralMeasure_conjTranspose_mul_self` | same file, 407 |
| §1.3 equal nonzero spectra of `XX*` and `X*X` | `Matrix.filter_map_eigenvalues_conjTranspose_mul_self` | `TauCeti/Analysis/Matrix/Spectrum.lean` 223 |
| §1.3 Schur complements, determinant lemma, Sherman–Morrison–Woodbury | `Matrix.invOf_fromBlocks₁₁_eq`, `Matrix.det_fromBlocks₁₁`, `Matrix.det_one_add_mul_comm`; `Matrix.add_mul_mul_inv_eq_sub` | `Mathlib/LinearAlgebra/Matrix/SchurComplement.lean` 285, 369, 400; `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` 614 |
| §1.1 `eigenvalueMeasure A` is the pushforward of `spectralMeasure A hA` | `Matrix.map_spectralMeasure_ofReal` | `TauCeti/Analysis/Matrix/SpectralMeasure.lean` 297 |
| §1.2 max–min formula, eigenvalue monotonicity | `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, `LinearMap.IsSymmetric.eigenvalue_mono` | `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` 251, 363 |
| §1.2 singular-value form of the operator-norm bound | `LinearMap.abs_singularValues_sub_singularValues_le` | `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean` 106 |
| §2.1 two-sided Bernstein bound `2 exp(-t²/(2(v+bt/3)))` | `ProbabilityTheory.iIndepFun.measureReal_abs_sum_ge_le_of_abs_le` | `TauCeti/Probability/Moments/Bernstein.lean` 173 |
| §2.1 McDiarmid, for a product of identical coordinate laws | `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences` (proxy `∑ cᵢ²/4`) | `TauCeti/Probability/McDiarmid.lean` 351 |
| §3.2 moment convergence implies weak convergence, compactly supported limit | `MeasureTheory.ProbabilityMeasure.tendsto_of_tendsto_integral_pow` | `TauCeti/Probability/Moments/WeakConvergence.lean` 139 |
| §0.1 law of `(X ∘ fst, snd)` on `Ω × E` | `ProbabilityTheory.HasLaw.prod_extension` | `TauCeti/Probability/HasLaw.lean` 135 |

Witness: `Bernstein.lean` line 173 has hypotheses independence, mean zero, `|Xᵢ| ≤ b` a.s., `0 ≤ ε`, and conclusion `2 * exp (-ε ^ 2 / (2 * (v + b * ε / 3)))`, which is §2.1's sentence word for word.

Repair:
- **Contracts.** Add the Tau Ceti rows above to From Tau Ceti and the four Mathlib names to From Mathlib, each with its file.
- **§0.1.** Take the pair law from `HasLaw.prod_extension`. Keep as targets the countable families, repeated extensions and reassociation.
- **§1.1.** Cite `Matrix.map_spectralMeasure_ofReal` in the paragraph that names Tau Ceti's measures, and delete the fourth bullet.
- **§1.2.** Write "The max–min formula and Loewner monotonicity are Tau Ceti's (`…eigenvalues_eq_iSup_iInf_re_inner`, `…eigenvalue_mono`, the completed PD-A51–PD-A52), and the singular-value operator-norm bound is `LinearMap.abs_singularValues_sub_singularValues_le`." Keep the min–max form, Cauchy interlacing and the corollaries of the rank bound as targets. Drop SSP-D13 and SSP-D14 from this paragraph's *Needs:* line if nothing else there uses them.
- **§1.3.** Move the four spectral-measure identities and the Mathlib block identities to the opening "are Tau Ceti's / Mathlib's" sentence. Keep as targets the resolvent identity, positivity and support, and the uniform-integrability estimates.
- **§2.1.** Cite the pinned Bernstein inequality. For McDiarmid, cite the pinned theorem for identical coordinate laws and keep the case of independent coordinates with different laws as the target.
- **§3.2.** Cite the pinned theorem for a compactly supported limit, and keep the Carleman-determinate case as the target.
- **Description.** The sentence quoted above becomes true once these are done.

After the repair each name in the table resolves at the pin (checked by grep in the files and lines listed), and no "Prove" sentence in §§0.1–3.2 has a pinned counterpart among the 34 object searches listed under Verified sound.

## R02 (P3) — Weyl's formula on `U(n)` is on printed page 194 of AGZ, not 192

Location: `README.md` lines 815–816: "(AGZ Proposition 4.1.6, (4.1.6), p. 192)".

Claim: page 192 carries Proposition 4.1.3. Proposition 4.1.6 and equation (4.1.6) are on page 194.

Witness: AGZ line 9685 (header "192", Proposition 4.1.3 at line 9686); AGZ line 9778 (header "194"), Proposition 4.1.6 at line 9800.

Repair: write "p. 194". The formula itself is right: at `n = 2` it gives `(1/2) · 2(2π)²/(2π)² = 1`.

## Previous findings (review of 80b4a22)

- **R01 (Haar-conjugated freeness absent): repaired.** `haar_conj_asymptotically_free` is at `Suggested.lean` lines 258–280, and §6.5 names it (lines 966–971).
- **R02 (`F₁` and the speed-`n²` principle called unstatable): repaired.** `goe_largest_eigenvalue_tracyWidom` (lines 360–373), `gaussianLogEnergy` and `gaussianEnsemble_spectralMeasure_ldp` (lines 416–433) are stated. The docstring's "Not statable" list now has only `ν ⊞ SC_t` and `ν ⊠ MP_y`. §§8.5 and 9.3 name the declarations.
- **R03 (Wigner freeness only for one entry law): repaired.** The hypotheses are per entry (`hint`, `hbound`, `hmean`, `hvar`, lines 245–250). §6.5 says correctly that AGZ's Wigner matrices are i.i.d. and that the proof uses only independence, centring, unit second moments and (5.4.1).
- **R04 (Weyl's formula on `U(n)` unowned): repaired.** Scope lines 64–67 read "its `weyl_integration_formula` is the `SU(2)` case", §5.4 has the target (lines 814–817), and CompactGroups is cited for Layer 0 only. The page number is R02.
- **R05 (§7.2 locator and hypotheses): repaired.** Lines 1008–1016 cite Bai's Theorem 3.4, (3.9) and Remark 3.2, and keep the norm bound and fourth moment only for the deterministic equivalent.
- **R06 (§9.4 quasi-everywhere form): repaired.** Lines 1342–1344 read "equals the equilibrium constant `C` for `μ`-almost every `x` and exceeds `C` at every `x` outside the support".
- **R07 (locators in §§1.2, 3.2, 5.1): repaired.** Line 390 cites Lemma 2.3.1; lines 584–585 cite Bai's moment convergence theorem; lines 759–760 cite AGZ (2.5.1).
- **R08 (Hadamard bound and `identDistrib_wignerMatrix`): repaired.** Both are in From Tau Ceti (lines 200–206), and §8.3 takes the bound from `Matrix.det_gram_le_prod_norm_sq`.
- **R09 (Check on `B = ℝ`; build overview): repaired.** The Check uses `B = [-R, R]` (lines 1194–1196), and the overview reads "1, 3, 4, 5 + combinatorics → 6".

## Verified sound

**Scope of the review.** Full review of `README.md` (1495 lines) and `Suggested.lean` (470 lines) at afc9d39. The three-dot diff against `origin/main` touches only these two files.

**Gate.** Rerun at this head: every counter is 0 and the line ends in "OK". The dependency check printed:

```text
depcheck: 234 roadmaps, 2270 edges, 0 problem(s)
```

Every supplier is on main (641eaf3): StandardDistributions, Completed/OrthogonalL2Bases, RepresentationTheory/CompactGroups, OptimalTransport, SpecialFunctionsAiry, and OperatorTheory's PolarDecomposition, SpectralSubspacePerturbation and OperatorIdeals.

**Build, signatures and padding.**
- **Build.** `lake env lean` on `Suggested.lean` gives 18 `sorry` warnings and nothing else.
- **Signatures.** `#check @name` on all 30 declarations in one scratch file; each elaborated type matches its README sentence and none lost a binder. I changed nothing.
- **One-tactic probe.** Each `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity | trivial | (aesop; done)`: all 18 fail (lines 60, 74, 107, 126, 159, 179, 227, 256, 280, 307, 325, 358, 373, 386, 414, 433, 452, 468). No headline is padding. The three proved `…_isHermitian` theorems are needed to state headlines.
- **Headlines.** Every end theorem of the Summary is stated, except the two free-convolution limits, which the docstring names with the missing carrier.

**Library declarations opened at the pins.**
- **Contract names.** All 104 backticked names and 21 file paths in From Mathlib and From Tau Ceti resolve at the pins.
- **Free probability.** `IsFreelyIndependentElements` (`Variables.lean` 43, freeness of the generated unital subalgebras), `IsFreelyIndependent` (`Independence.lean` 93), `TendstoInMoments` (`Distribution/Convergence.lean` 50, every word including the empty one), `jointDistribution_eq_of_forall_pow` (`Distribution/Free.lean` 82), and the weak free central limit theorem (`Law/CentralLimit.lean` 64, hypotheses as §6.4 states them).
- **Measurable structure for the `n²` principle.** Mathlib's `MeasurableSpace (ProbabilityMeasure Ω)` (`ProbabilityMeasure.lean` 268) is the Giry structure; on `ℝ` it is the Borel structure of the weak topology, though the pin has no `BorelSpace` instance. `Matrix.measurable_spectralMeasure` (`SpectralMeasure.lean` 140) makes the pushforward in `gaussianEnsemble_spectralMeasure_ldp` a law and not the zero measure.
- **`TendstoInDistribution`** (`ConvergenceInDistribution.lean` 64): the limit argument of the linear-statistic theorem is the measure `gaussianReal 0 σ²` with `Z = id`.
- **Object searches.** 34 searches of the pins by object. The hits are R01's table. No hit for Hanson–Wright, matrix Bernstein, Efron–Stein, logarithmic Sobolev, Golden–Thompson, Lieb, Mercer, a Fredholm series, Pfaffians, a large deviation principle, sample covariance, the circular law, Weingarten, free convolution of measures, Christoffel–Darboux, Lindeberg, nets, Carleman, tridiagonal models, HCIZ, the sine kernel, Littlewood–Offord, logarithmic potentials, the quarter-circle law, Schur triangularization, GOE or GUE.

**Cross-roadmap citations resolved on main.**
- SpecialFunctionsAiry 1.1 (line 347), 1.2 (370), Layer 2 (481), 3.2 (585), 3.4 (620), 3.6 (708), 8.5 (1382).
- CompactGroups `weyl_integration_formula` is `(f : C(SU2, ℂ))` (its `Suggested.lean` line 475).
- StandardDistributions 12.1 and `wishartGramMeasure` (line 886).
- FreeProbability's table (lines 113–118) assigns the bounded scalar core and the almost-sure matrix conclusions to this roadmap, as lines 80–84 here say.

**Ownership and overlaps.** `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap. `roadmaps grep` over main and the 448 open heads finds no second owner of Hanson–Wright, Tracy–Widom, Mercer's theorem, large deviation principles, Efron–Stein or matrix Bernstein. DysonBrownianMotion (#2118) cites §§1.1–1.2, 3.1–3.3, 5.1–5.3, 6.3 and 7.1, Conventions 4 and 5; all exist at this head.

**Description.** "18 headlines" is right. The one inaccurate sentence is quoted in R01.

**Seeded sample, checked against the text.**
- **0.1, 0.2:** T lines 183–239 and 350–352 (extensions; notions preserved under extension).
- **2.1:** the Bernstein and McDiarmid constants agree with the pinned proofs (R01). BLM and V not verifiable.
- **2.2:** AGZ §2.3; the Herbst constant matches Theorem 2.3.5's exponent (below).
- **2.3:** AGZ lines 2139–2146 (Theorem 2.3.5: logarithmic Sobolev constant `c/N`, exponent `N²δ²/(4c|f|_L²)`). RV2013 lines 47–53 (Theorem 1.1, with `K⁴‖A‖²_HS` and `K²‖A‖` for the `ψ₂` bound `K`).
- **2.6:** Tropp2012 lines 571–573 (Theorem 3.2), 273–286 (Theorem 1.4) and 172–190 (Theorem 1.1).
- **3.4:** the pinned `marchenkoPastur` API named in the contract.
- **4.3:** Bai1999 lines 122–136 (Theorem 2.1, diagonal with no moment requirement) and 330–344 (Theorem 2.4).
- **6.2:** AGZ lines 16917 (Definition 5.3.1) and 17218 (Theorem 5.3.15).
- **6.3:** AGZ lines 17353–17373 (Definitions 5.3.20 and 5.3.22, Lemma 5.3.21) and 17632–17644 (Definitions 5.3.28–5.3.29, the S-transform).
- **7.2:** Bai1999 lines 1659–1677 (Theorem 3.4 and (3.9); with `A = 0` it is the README's companion equation) and 1687–1693 (Remark 3.2).
- **8.1:** AGZ lines 10880–10919 (Definition 4.2.3, Remark 4.2.4, Lemma 4.2.5(b)).
- **8.3:** AGZ lines 11124–11129 (Lemma 4.2.13, quoting Simon's Theorem 2.12), 11274, 11362, 11452, 11480 (Propositions 4.2.19–4.2.20, Corollaries 4.2.21–4.2.22) and 11496–11505 (Corollary 4.2.24, Theorem 4.2.25).
- **8.6:** AGZ lines 13749–13786 (Theorem 4.3.20) and 1540 (Theorem 2.1.31). Johansson not verifiable.
- **9.5:** AGZ lines 4121–4141 (Assumption 2.6.5 with `α = −β/2`, Theorem 2.6.6); see Source issues.
- **Also read:** AGZ lines 17996–18007 (Theorem 5.4.2) and 18550–18567 (Theorem 5.4.10, Corollary 5.4.11), AGZ lines 1986–1993 (Lemma 2.3.1, p. 39).

**Adversarial table.** Values computed this round.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 extensions | `ν = (δ₀+δ₁)/2` | `P(snd=0, snd=0) = 1/2 ≠ 1/4` | Check right; pair law is pinned | R01 |
| 1.3 trace identities | `A = diag(1,-1)`, `z = i`; `X = (1, i)` | `m = i/2 = tr₂(A-iI)⁻¹`; `L_{X*X} = ½L_{XX*} + ½δ₀` | true; pinned | R01 |
| 2.1 Bernstein, McDiarmid | Rademacher, `b = v = t = 1`; proxy `∑cᵢ²/4` | `1 ≤ 2e^{-3/8} = 1.375`; `exp(-t²/(2∑cᵢ²/4)) = exp(-2t²/∑cᵢ²)` | true; pinned | R01 |
| 2.2 Gaussian inequalities | `f = e^{ax/2}` | `Ent(f²) = a²e^{a²/2} - (a²/2)e^{a²/2} = 2∫f'²` | `C = 1` sharp | none |
| `hanson_wright` | `A = E₁₂+E₂₁`, Rademacher; `K = 0`; `A = 0` | `1 ≤ 2e^{-c/2}` so `c ≤ 2 log 2`; Lean `t²/0 = 0`, bound `2` | true | none |
| `matrix_bernstein` | `d = 0`; `m = 0`; `L = 0` | `0 ≤ 0`; `P(t ≤ 0) = 0`; exponent `-(t²/2)/0 = 0`, bound `2d` | true | none |
| 3.1, 3.3, 3.4 Checks | `δ₁`, `z = i`; `z = i`; `y = 1`, `z = 2` | `|(1-i)/2| = 0.707 ≤ 1`; `m = i(√5-1)/2`; `m = -½ + i/2`, and `Im m/π = 1/(2π)` is the density at `2` | true | none |
| `wigner_semicircle_ae`, 4.3 | imaginary mean `ic`, `n = 2, 3`; count bound | `±c/√2`; `0, ±c`; at most `4|c|n^{3/4}/π` exceed `n^{-1/4}` | true | none |
| `marchenkoPastur_ae`, extremes | `y = 2`; `y = 1/4`; `n = 0` | atom `1/2`; edges `1/4`, `9/4`; `0⁻¹ • 0 = 0`, only the tail matters | true | none |
| `gaussianEnsemble_eigenvalue_density` | `n = 1`; `n = 2`, `β = 2`; `n = 2`, `β = 1`; `n = 0` | `√(2π)`, `2√π`; `¼ · 2π · 2 = π`; `2π/Γ(3/2) = 4√π`; both sides Dirac | true | none |
| 5.4 Weyl, CUE, HCIZ | `n = 2` | `(1/2) · 2(2π)²/(2π)² = 1`; HCIZ limit `(a₂-a₁)(b₂-b₁)/((a₂-a₁)(b₂-b₁)) = 1` | true; page | R02 |
| 6.3, 6.4 | `MP_y` cumulants; free Poisson `λ` | `R = ∑ yⁿwⁿ = 1/(1-yw)`; `λⁿ · (1/λ)^{n-1} = λ` | true | none |
| `wigner_asymptotically_free` | Rademacher matrix with complex Gaussian matrix; `k = 0` | per-entry hypotheses hold; empty family, only `ψ 1 = 1` | matches AGZ 5.4.2 | none |
| `haar_conj_asymptotically_free` | one unitary from Corollary 5.4.11(i) with `p = 2`; `D < 0`; word of length 0 | conjugate by `U₁*`: `(a, U₁*U₂ b U₂*U₁)`, `U₁*U₂` Haar; vacuous; `1 → ψ 1 = 1` | true | none |
| 7.2 | `A = 0` in Bai (3.9); `ν = δ₁` | `z = -1/m̲ + y∫τ/(1+τm̲)dH`; `z = -1/m̲ + y/(1+m̲)` | true | none |
| `gaussianEnsemble_spike_ae`, 7.3 | `θ = 1`, `2`; `ℓ = 1+√y` | `2`; `5/2`, overlap `3/4`; `(1+√y)²`, overlap `0` | true | none |
| 8.1 | generating function; `x ↦ 2x` | `z^N = ∑ C(N,k)(z-1)^k`; `ρ'₁ = 1/2` | true | none |
| 8.3 count laws | `λφ⊗φ`; one set | `1 - λ∫_Bφ²`; `∏(1-λₖ+λₖz)` | true | none |
| `fredholmDet`, `gue_bulk_gap` | `k = 0`; `A = ∅` | term `1`; probability `1 = fredholmDet sineKernel ∅` | true | none |
| `gue_largest_eigenvalue_tracyWidom` | `Ai(0)` | `3^{-2/3}/Γ(2/3) = 0.4807/1.3541 = 0.3550` | true | none |
| `goe_largest_eigenvalue_tracyWidom` | AGZ (3.1.13); `s → ∞` | `F₁ = √F₂ · e^{-½∫q}`; both factors tend to `1` | true | none |
| 8.6 linear statistics | `f = x`; `f = x²`; `f = 0` | `(2β)⁻¹ · 4 = 2/β`; `(2β)⁻¹ · 2 · 4 = 4/β`; empty sum, `gaussianReal 0 0` | true | none |
| `LargeDeviationPrinciple` | `F = ∅`; `μₙ(F) = 0` | `⊥ ≤ -⊤`; `a⁻¹ · ⊥ = ⊥` | determines | none |
| 9.2 growth condition | `β = 2`, `V = c log(1+|x|)` | `c > 2β'/2 = β' ≥ 2` | true | none |
| `gaussianLogEnergy`, `n²` principle | integrand minimum; `semicircleReal 0 1`; `δ₀` | `r²/8 - log r + 1 ≥ 3/2 - log 2 = 0.807`; `(β/2)(7/4 - 7/4) = 0`; `⊤` | true | none |
| `gaussianEnsemble_largest_eigenvalue_ldp`, 9.4 | `x = 3`, `β = 2` | effective potential `1 + 3√5/2 - 2 log((3+√5)/2) = 2.429`; `∫₂³√(t²-4) = 1.429 = 2.429 - 1` | README right | Source issues |
| `least_singular_value` | `N = 1` Gaussian; Rademacher `2 × 2` | `0.798ε`; singular with probability `1/2` | true | none |
| `circular_law_ae`, `circularLaw` | mass; `∫|z|^{2k}` | `π/π = 1`; `1/(k+1)` | true | none |

**Counts.** 28 table rows; 30 signatures checked; 18 headlines probed; 104 names and 21 files resolved at the pins; 21 pinned declarations opened and read; 34 object searches; about 45 source passages read in AGZ, Bai1999, T, Tropp2012 and RV2013.

## Not verifiable

- **BLM** (Oxford University Press, 2013): no open copy. The §2.1 page locators (pp. 37–38, 54, 171) are unchecked; the Bernstein statement itself agrees with the pinned proof, which cites BLM §2.8.
- **V** (Vershynin, *High-Dimensional Probability*): the author's page timed out again. Proposition 2.7.1(v), Theorem 2.8.1, Theorems 4.4.5 and 4.6.1 are unchecked.
- **Johansson 1998** (Duke Math. J.): no open copy; Theorem 2.4 (§8.6) is unchecked.
- **Not fetched:** Silverstein 1995 (cited through Bai's Remark 3.2), Simon 2005 (quoted through AGZ), PB (layer-level only), RV2008, TVK2010 and Benaych-Georges–Nadakuditi (checked in the previous round, not re-read).

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82: the source says the rate for `x ≥ x*` is `β∫log|x−y|σ(dy) − V(x) − α`, negative to the right of `x*`; it should be `V(x) − β∫log|x−y|σ(dy) + α`, zero at `x*` and increasing; affects a stated result.
- **Misprint** in AGZ at the free Poisson exercise of §5.3.3, printed page 368: the source says the limit for `λ < 1` is `(1−λ)δ₀ + λp̃`, of total mass `1 − λ + λ²`; it should be `(1−λ)δ₀ + p̃`, since `p̃` already has mass `λ`; affects nothing.
