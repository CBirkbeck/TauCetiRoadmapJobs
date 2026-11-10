# Review of RandomMatrices (pull request #1971 at 42067c4)

**Verdict:** accepted

Incremental re-review of the 100 lines changed since 1259170. No finding: the three findings of the previous review are repaired, the repairs introduce no new problem, the gate passes and `Suggested.lean` elaborates with `sorry` as the only warning. The folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: README lines 196–211 add the Gram rank bound, `TauCeti.sampleSecondMoment` and the covering-number declarations to From Tau Ceti; §§1.2, 2.4, 4.1 cite them; `sampleCovariance` now has the body `TauCeti.sampleSecondMoment fun j i ↦ X i j`.
- R02 — repaired: §7.4 (lines 1099–1110) cites "Ledoit–Péché 2011, Theorem 1.4 and (13), arXiv:0911.3010 numbering" and states i.i.d. entries, twelfth-moment bound, `y ≠ 1`, `ν` compactly supported in `(0,∞)`; the paper is in References.
- R03 — repaired: §2.4 (lines 551–552) now reads "independent centred coordinates, each sub-Gaussian with variance proxy at most `K²`".

## Verified sound

**Scope.** The diff of `scratch/changes.md` (README 89 lines, `Suggested.lean` 11 lines), and what cites or depends on it: the Scope sentence, the From Tau Ceti contract, §§1.2, 2.4, 4.1, 7.4, the two covariance headlines that use `sampleCovariance`, and the description's sentence on consumption. No file outside the folder changes (`git diff --stat origin/main...HEAD` outside the folder is empty).

**Gate.** Rerun at this head: every counter 0, line ends "OK". Dependency check:

```text
depcheck: 235 roadmaps, 2272 edges, 0 problem(s)
```

**Build, signatures, padding.**
- `lake env lean` on `Suggested.lean`: 18 `sorry` warnings, nothing else. The new import `TauCeti.Analysis.Matrix.SampleSecondMoment` exists at the pin.
- Signatures: the elaborated types of the 30 declarations (`scratch/signatures.md`) are unchanged except that `sampleCovariance` unfolds to the pinned definition; `sampleCovariance : {p n : ℕ} → Matrix (Fin p) (Fin n) ℂ → Matrix (Fin p) (Fin p) ℂ` and `sampleCovariance_isHermitian` keep their binders. I changed nothing.
- One-tactic probe (`first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity | trivial | (aesop; done)` in place of each `sorry`, on a scratch copy): all 18 fail. `sampleCovariance_isHermitian` is the Hermitian proof the two covariance headlines take as an argument, not a headline.
- Headlines: unchanged since the previous report (all stated except the two free-convolution limits, named in the docstring).

**Pinned declarations opened (Tau Ceti 2fd255d), 7.**
- `TauCeti/Analysis/Matrix/SampleSecondMoment.lean` 50 (`sampleSecondMoment v = finiteMean 𝕜 fun i ↦ vecMulVec (v i) (star (v i))`, value `0` on the empty sample), 66 (`isHermitian_sampleSecondMoment`), 71 (`posSemidef_sampleSecondMoment`, needs `[Finite n]`).
- `TauCeti/Analysis/Matrix/SpectralMeasure/RankPerturbation.lean` 65: `Matrix.abs_spectralMeasure_mul_conjTranspose_self_Iic_sub_le_two_mul_rank_div_card`, for `X Y : Matrix m n 𝕜`, `[Nonempty m]`, bound `2 * rank (X − Y) / card m`. The README's "`2 rank(X-Y)/p` for `p × n` matrices" has the row count in the denominator, as the pin does.
- `TauCeti/Analysis/Normed/Module/CoveringNumber.lean` 85, 143, 168: the three names of the contract; `exists_finset_isCover_sphere` gives a net inside the sphere with at most `(1 + 2/η)^(finrank ℝ E)` points for `η ≠ 0` in `ℝ≥0`. It is stated for any finite-dimensional real normed space, so the README's "`(1 + 2/η)^n`" is its Euclidean case.

**Sources read for the changed passages.**
- Ledoit–Péché, arXiv:0911.3010v1: lines 41–51 ((H1)–(H4): i.i.d. real or complex, mean zero, variance one, twelfth absolute central moment bounded independently of the dimensions; population matrix random Hermitian positive definite, independent; `p/N → γ > 0`; limit law supported in `[h₁,h₂]`, `0 < h₁`); lines 104–119 (boundary values of the Stieltjes transform); lines 167–178 (Theorem 1.2, the limit of `N⁻¹ Tr (S − z)⁻¹ g(Σ)`); lines 423–436 ((10)–(12)); lines 438–452 (Theorem 1.4 and (13): convergence for every `x ≠ 0`, the formula for `γ ≠ 1`, a value at `λ = 0` only when `γ < 1`). Their `N` is the README's `p`, their sample size `p` is the README's `n`, so `γ = 1/y` and `γ < 1` is `y > 1`, as the README has it.
- Vershynin, *High-Dimensional Probability*, first edition as posted by the author (read this round; it was not readable before): Theorem 4.4.5 (independent mean-zero sub-Gaussian entries, `‖A‖ ≤ CK(√m + √n + t)` with probability at least `1 − 2exp(−t²)`, `K` the largest `ψ₂` norm); Theorem 4.6.1 (independent mean-zero sub-Gaussian isotropic rows, `√m − CK²(√n+t) ≤ sₙ ≤ s₁ ≤ √m + CK²(√n+t)`, `t ≥ 0`); Corollary 4.2.13; Theorem 2.8.1 (Bernstein for sub-exponential variables). §2.4 matches both theorems; a variance proxy `K²` and a `ψ₂` norm `K` agree up to an absolute constant, absorbed in `C` and `c`.

**Seeded sample.** The targets that fall in changed passages (1.2, 2.4, and 7.4 next to 7.2) are checked above. The others (3.3, 3.5, 4.3, 4.5, 5.1, 6.2, 6.3, 7.1, 7.2, 8.3, 9.1, 9.3, 10.1) are untouched since the previous head; the previous report and its predecessors read them, and they were not re-read.

**Duplication, ownership, suppliers.** `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id in either direction. The change adds no cross-roadmap citation and no new target, only pinned citations. The three names `scratch/citations.md` lists (`TauCeti.airyAi`, `TauCeti.Real.airyAi`, `TauCeti.airyKernel`) are SpecialFunctionsAiry's planned names, resolved by the previous report on main (its Names paragraph); untouched here. Ownership against DysonBrownianMotion and the other closest open roadmaps was settled in earlier rounds and the diff adds no object.

**Description.** "moves to consumption everything the pinned Tau Ceti already carries": the three objects the previous report found unconsumed are now consumed; no further one was found in the changed passages.

**Adversarial table.** New rows computed this round; carried rows cite the previous report.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `sampleCovariance` (new body) | general `X`; `X = (1, i)`; `n = 0` | `sampleCovariance X = n⁻¹ • (X * Xᴴ)` proved by `ext; simp` in a scratch file; entry `2⁻¹(1·1 + i·(−i)) = 2⁻¹·2 = 1`; empty sample gives `0` | same object as before, on the pinned carrier | none |
| `sampleCovariance_isHermitian` | term `TauCeti.isHermitian_sampleSecondMoment _` | elaborates; the plausible wrong model (rows instead of columns, `XᴴX/p`) would be `n × n`, a type error for `p ≠ n` | true | none |
| `marchenkoPastur_ae`, `sampleCovariance_extreme_eigenvalues_ae` | statement text unchanged; definition equal to the old one | `E tr_p S = 1` for unit variance (`p⁻¹·p·n·n⁻¹`) | unchanged meaning | none |
| 1.2 Gram rank bound | `p = n = 1`, `X = 1`, `Y = 0`, `t = 1/2`; `X = Y` | left `|0 − 1| = 1 ≤ 2·1/1 = 2`; `0 ≤ 0` | true; pinned | none |
| 2.4 net cardinality | `n = 1`, `η = 1`; `η = 2` | sphere `{±1}`, net of 2 points `≤ (1+2)¹ = 3`; one point `≤ 2` | true; pinned | none |
| 2.4 operator norm | `p = n = 1`, `X = σg`, proxy `σ² = K²` | `P(|g| > C(2+t)) ≤ 2e^{−ct²}`, free of `σ`; `σ = 0`: left side `0` | true | none |
| 2.4 singular values | `p = 1`, Rademacher row in `ℝ¹` | `s_min = s_max = 1`, inside `[1 − CK²(1+t), 1 + CK²(1+t)]` | true | none |
| 7.4 shrinkage, `λ > 0` | `ν = δ₁`; Ledoit–Péché `γ = 1/y` | `1 − γ⁻¹ − γ⁻¹λm̆ = 1 − y − yλm`; `|w|² = x` on the support, weight `1` | true | none |
| 7.4 shrinkage, `λ = 0`, `y > 1` | `ν = δ₁` | companion `m̲(0)` solves `1/m̲ = y/(1+m̲)`, `m̲ = 1/(y−1)`; (13) gives `γ/((1−γ)m̲(0)) = 1/((y−1)m̲(0)) = 1`; atom of `μ` at `0` is `1 − 1/y`, so `Δ(0) = 1 − 1/y`, the fraction of null eigenvectors, each of weight `1` | true | none |
| 7.4, `y < 1`, `x < 0` | any `ν` | no eigenvalue `≤ x`, sum `0`; `δ = 0` there | true | none |
| 0.3; 1.1; 1.3; 2.2; `hanson_wright`; `matrix_bernstein`; 3.1, 3.3, 3.4; `wigner_semicircle_ae`, 4.3; `gaussianEnsemble_eigenvalue_density`; 5.1; 5.4; 6.2, 6.4; 7.1, 7.2; `gaussianEnsemble_spike_ae`, 7.3; 8.2; `fredholmDet`, `gue_bulk_gap`; `goe_largest_eigenvalue_tracyWidom`; 8.6; `LargeDeviationPrinciple`; `gaussianLogEnergy`; `gaussianEnsemble_largest_eigenvalue_ldp`, 9.4; `least_singular_value`; `circular_law_ae`, 10.2 | untouched by the diff | values as in the table of the previous report (review at 1259170), rows of the same names | carried | none |

**Counts.** 10 new table rows and 22 carried; 7 pinned declarations opened; 30 signatures compared; 18 headlines probed; 2 sources read (Ledoit–Péché, Vershynin).

**Remarks on untouched text (no change asked).**
- §2.1 cites "V Proposition 2.7.1(v)"; in the author's posted first edition the five properties are lettered (a)–(e) and the cited one is (e). The printed page was not compared.
- The docstring of `hanson_wright` says "variance proxy `K`" where §2.4 now says `K²`; the two statements are separate and each is consistent with its own formula.

## Not verifiable

- **BLM** (Oxford University Press, 2013), **PB** (Cambridge University Press, 2020), **Johansson 1998**, **Simon 2005**: no open copy; none is cited in a changed passage.
- The published version of Ledoit–Péché (Probab. Theory Related Fields 151) was not compared with the arXiv numbering; the README cites the arXiv numbering explicitly.

## Source issues

- none
