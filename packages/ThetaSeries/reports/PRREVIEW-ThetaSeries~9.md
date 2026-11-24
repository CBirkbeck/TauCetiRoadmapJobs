# Review of ThetaSeries (pull request #3027 at f3b4ab1)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 98 changed lines since `74a09b7`. The change adds Layer 9 (Hermitian theta series of degree `s` and their inversion law) and the sentences that announce it. No finding: the inversion law of §9.2, its sign and constant, the comparison with Cohen–Resnikoff's normalisation and both Examples are correct, computed by hand and numerically at general points of the Hermitian half-space. There are two small corrections: the Setting does not say which Lean type carries the real form `2 Re h`, and the description does not mention this layer. There are also two format notes. None of them blocks. For the humans: the two sources of the layer could not be read legally.

## C01 — The Setting does not say which Lean type carries the real form `2 Re h`, so the Lean objects it names compute the form `Re h` on the obvious carrier

An implementer who reads the Setting's Lean names on the natural type gets the wrong dual, the wrong covolume and the wrong theta series. The Setting fixes `⟪x, y⟫_ℝ = 2 Re h(x, y)` and then says "`L^∨` and `ZLattice.covolume L` are the dual lattice and the covolume for this real inner product" (Setting of Layer 9, line 1654). But `ZLattice.dual` is the dual for the real inner-product instance of the type (`innerₗ E`, TauCeti/Algebra/Module/ZLattice/Dual.lean line 78), and `ZLattice.covolume` uses `volume` (Mathlib/Algebra/Module/ZLattice/Covolume.lean line 73). On the type `ℂ` of the second Example, Mathlib's instance `InnerProductSpace ℝ ℂ` is `Re(x̄ y)` (Mathlib/Analysis/InnerProductSpace/Basic.lean line 987). So for `ℤ[i] : Submodule ℤ ℂ` these Lean objects are `ℤ[i]` and `1`, not the `½ℤ[i]` and `2` the Example states. Likewise `ZLattice.thetaSeries` there is `jacobiTheta(z)²`, not `(∑ e(m² z))² = jacobiTheta(2z)²`. One type cannot carry both the norm `h(x, x)^{1/2}` of a complex inner product space with inner product `h` and the norm `(2h(x, x))^{1/2}` that the Setting needs.

A sentence naming the carrier would settle it. One option: `W` is a complex inner product space whose inner product is `2h`, with the real structure `InnerProductSpace.rclikeToReal` (the real part, here `2 Re h`). The other: `W` is a real inner product space with a `ℂ`-module structure on which `i` acts isometrically, and `h(x, y) = ½(⟪x, y⟫ − i⟪x, i y⟫)`. The Example would then say that `ℂ` carries the doubled form, not Mathlib's.

## C02 — The description does not say that this pull request adds Layer 9 to ThetaSeries

The description never names ThetaSeries. A reader of the description cannot tell that this roadmap on `main` gains a new layer. The roadmap is covered only by the count "49 existing roadmaps receive 196 sections", and it is not among the "largest additions" listed. The text that would be right, placed with those additions: "ThetaSeries gains Layer 9 (§§9.1–9.2): the Hermitian theta series of degree `s` of a lattice in a positive definite Hermitian space, with its convergence on the Hermitian half-space and its inversion law under `Z ↦ −Z^{-1}` (Cohen–Resnikoff 1978). HermitianFormsAndLattices 7.1 is now a corollary of it. No section of ThetaSeries is removed or renumbered, and it gains no supplier."

## N01 — The Setting's two targets have no section id

The two targets are the dual `(L^s)^∨ = (L^∨)^s` and the covolume `(covol L)^s` of the product lattice in `PiLp 2`. Because they sit outside any `### 9.n`, other roadmaps and the status file cannot cite or track them. The Dependencies line also sends the reader to Convention 17, whose orthogonal sums are binary (`ZLattice.dual_orthSum`, `ZLattice.covolume_orthSum`, TauCeti/Algebra/Module/ZLattice/OrthSum.lean lines 187 and 355). A numbered item, or one clause saying whether `L^s` is the iterated binary sum, would fix both.

## N02 — The *Needs:* line of 9.2 leaves out two inputs that its route uses

The first is the unitary diagonalisation, `Matrix.IsHermitian.spectral_theorem` (Mathlib/Analysis/Matrix/Spectrum.lean line 143). The second is the Fourier transform of the product of `s` Gaussians with different coefficients, which §1.6 (scalar Gaussians only) does not give and which `GaussianFourier.integral_cexp_neg_sum_mul_add` (Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean line 277) does in coordinates. Naming both on the line would make it complete.

## Verified sound

| Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|
| Setting: real form `2 Re h`, `‖x‖² = 2h(x,x)`, `s = 1` gives Layer 3 | `x ∈ W`, `s = 1` | `e(h(x,x)z) = exp(2πi·‖x‖²z/2) = exp(πi‖x‖²z)`; with `Re h` it would be `exp(2πi‖x‖²z)` | true | C01 (carrier) |
| Setting: `(L^s)^∨ = (L^∨)^s`, `covol(L^s) = covol(L)^s` | `L = ℤ[i]`, `s = 2` | dual `(½ℤ[i])²` from `2Re(x̄y) ∈ ℤ` coordinatewise; covolume `4 = 2²` | true | N01 |
| Setting: `O_K`-lattice is a full lattice in `W` | `K = ℚ(i)`, `V = K`, `h = x̄y` | `V ⊗_ℚ ℝ = V ⊗_{K,σ} ℂ = ℂ`; `ℤ[i]` rank 2 = real dimension 2 | true | none |
| 9.1: `|e(tr(T_X Z))| = exp(−2π tr(T_X Y))`, positive definite | `Y = U diag(d) U^*`, `X' = XU` | `tr(T_X Y) = ∑ d_k h(x'_k,x'_k) ≥ λ_min ‖X‖²/2`; `s = 1`: `exp(−π‖x‖² Im z)` = §3.1 bound | true | none |
| 9.2: `Θ_L(−Z⁻¹) = covol^{−s} det(Z/i)^r Θ_{L^∨}(Z)` | random `G`, lattice, general `Z ∈ ℋ_s`; `(r,s)=(1,1),(1,2),(2,1),(2,2)` | `(1,2)`: both `1.00199838−0.06327763i`; `(2,2)`: `1.04747980−0.86877843i` / `1.04748137−0.86877778i` (truncation) | true | none |
| 9.2 against wrong variants | `(r,s) = (1,1)` | `det(Z/i)^{−r}`: `0.4626−0.3363i`; `det(iZ)^r`: `−0.99998`; true value `0.99998` | variants excluded | none |
| 9.2: Cohen–Resnikoff comparison | `H = 2G`, `𝔏 = L^s`; `r = s = 1`, `ℤ[i]`, `H = h`, `Z = iy` | `N^*HN = 2T_X`; covol `det(H)^s vol 𝔏`; gives `θ(1/(yh))² = yh θ(yh)²`, Jacobi | consistent; text unread | none |
| 9.2 route: transform at `Z = iY`; `−Z⁻¹ ∈ ℋ_s` | diagonal `Y = diag(d_k)` | `∏ d_k^{−r} = det(Z/i)^{−r}`; `Im(−Z⁻¹) = Z^{−*} Y Z^{−1} > 0` | true | N02 |
| Example `s = 1` equals §4.2 at `k = r` | rank `2r` | `det(z/i)^r = (−i)^r z^r` = §4.2 factor | true | none |
| Example `ℤ[i]`: `Θ_L(i) = Θ_{L^∨}(i)/2` | `z = i` | `1.0074837203` / `1.0074837203`; ratio of sums `0.7071067812 = 2^{−1/2}` | true | C01 (type) |
| Seeded §2.1 (affected: `L^∨` a full lattice) | pin | `IsZLattice ℝ (dual L)`, `DiscreteTopology (dual L)` instances (Dual.lean lines 160–170); `dual_dual` line 173 | true | none |
| Seeded §3.1 (affected: bound used by 9.1) | `τ = x + iy` | `|exp(πi‖v‖²τ)| = exp(−π‖v‖²y)`; `norm_exp_pi_mul_I_mul_ofReal_mul` (ThetaSeries/Basic.lean line 82) | true | none |
| Headline: Milgram (unchanged file) | `A₂`, `k = 1` | `1 + 2e(1/3) = i√3`; `√3 · e(2/8) = i√3` | true | none |

- Merge base against head, layer by layer: Layers 1–8 and every item and lettered id kept with their statements; one layer added (9, items 9A–9B). The other changed lines (overview guide, build order, Convention 19, scope, references) are consistent with Layer 9.
- Source locators checked against text: 0. The change cites two works, Cohen–Resnikoff formulas (2)–(4) and (3) p. 330, and Resnikoff Theorem 2.2; neither is readable.
- Library declarations opened at the pin: Mathlib `ZLattice.covolume` (Covolume.lean 73), `InnerProductSpace ℝ ℂ` (InnerProductSpace/Basic.lean 987), `InnerProductSpace.complexToReal` (983), `Matrix.IsHermitian.spectral_theorem` (Matrix/Spectrum.lean 143), `GaussianFourier.integral_cexp_neg_sum_mul_add` (Gaussian/FourierTransform.lean 277), `eqOn_of_preconnected_of_eventuallyEq` (Analytic/Uniqueness.lean 224).
- Tau Ceti declarations opened at the pin: `ZLattice.dual` (Dual.lean 78), `ZLattice.covolume_dual` (Covolume.lean 273), `ZLattice.dual_orthSum`, `ZLattice.covolume_orthSum` (OrthSum.lean 187, 355), `TauCeti.fourier_cexp_pi_mul_I_mul_norm_sq_mul(_of_finrank_eq)` (Gaussian/Schwartz.lean 132, 160), `SchwartzMap.tsum_eq_tsum_dual_fourier_of_even` (PoissonSummation.lean 356), `ZLattice.thetaSeries_S_smul` (Inversion.lean 104), `ZLattice.summable_thetaSeries` (ThetaSeries/Basic.lean 190).
- Cross-roadmap citations resolved: HermitianFormsAndLattices 7.1's *Corollary of* line (README lines 4104–4107 at this head) matches 9A–9B; its 7.1 (d) uses the same `Tr_{E/ℚ} ∘ h = 2 Re h` convention.
- Overlap check: read IntegralLattices, LatticePackingsAndPerfectForms, Rank24LatticeConstructions, OrthogonalTamagawaAndLatticeMass (main), SiegelModularForms, HalfIntegralWeightModularForms, LevelOneAutomorphicFormsForClassicalGroups (open heads). Nothing is shared with Layer 9: SiegelModularForms owns Siegel theta series in a symmetric variable and lists Hermitian modular forms as owned by no roadmap (its README line 3314). No other roadmap in this pull request states Hermitian theta series.
- Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`. Automatic checks: all passed. `Suggested.lean` is unchanged and elaborates with its 10 `sorry` warnings only. `SchwartzMap.poissonSummation_lattice` in the Provenance table (untouched) is a declaration of the external sphere-packing repository, not a pinned name.
- Description read in full: ThetaSeries is not named (C02). Its claim that the additions do not mention the family or the formal proof holds for this folder.

Source independence: changed passages only; 0 passages compared with 0 sources, because the two works the change cites (Cohen–Resnikoff 1978, Resnikoff 1975) could not be read. Largest share: Ebeling (6 citations in the body, untouched). The added layer has two sections, definition and convergence then inversion, an order that 9.2's *Needs:* on 9.1 forces. Contents were not compared, since no table of contents of Cohen–Resnikoff or Ebeling was readable.

Research link: Layer 9 states the inversion law of the Hermitian theta series of Cohen and Resnikoff (1978), the analytic input to Hermitian modular forms of degree `s`, of which HermitianFormsAndLattices 7.1 is a corollary. Layers 6–7 are the Hecke–Schoeneberg theory (Ebeling; Schoeneberg 1974), used by LatticePackingsAndPerfectForms and QuaternionArithmetic. This rests on the README's references and overview.

## Not verifiable

- Cohen–Resnikoff 1978, formula (3) and formulas (2)–(4), p. 330 (§9.2 and References): the publisher's page `msp.org/pjm/1978/76-2/p05.xhtml` is on a host that the sources service places in no licence class. No other copy was tried.
- Resnikoff 1975, Theorem 2.2 (§9.2): the README gives no link, and the Springer DOI resolves only to a paywalled page.
- Ebeling, *Lattices and Codes* (the most cited source): its table of contents was not read, so the arrangement was not compared with it.

## Source issues

- none

## For the human reviewers

- Neither source of Layer 9 could be read legally. Cohen–Resnikoff 1978 is on the publisher's site (msp.org), a host the sources service does not classify; Resnikoff 1975 is paywalled. The wording of §9.2 and its normalisation comparison were checked by computation only.
- The two decisions recorded for this pull request do not bear on this folder. Nothing leaves ThetaSeries. HermitianFormsAndLattices 7.1, which names ThetaSeries 9A–9B as its general theorem, stays in that roadmap, and 9A–9B state what its line says.
