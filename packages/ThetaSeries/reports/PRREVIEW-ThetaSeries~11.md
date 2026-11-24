# Review of ThetaSeries (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 98 changed lines since `b8f3652`. The change adds Layer 9 (the Hermitian theta series of degree `s` and its inversion law) and the sentences that announce it; Layers 1–8 keep every id and statement. No finding: the inversion law of §9.2 with its exponent and constant, the comparison with the normalisation attributed to Cohen–Resnikoff, the route and both Examples were rederived by hand and confirmed numerically at general points of the Hermitian half-space. There are two small corrections (the Setting names Lean objects without saying which type carries the form `2 Re h`; the description does not mention this layer) and two format notes, none blocking. For the humans: neither source of the layer could be read.

## C01 — The Setting names `ZLattice.covolume L` and the dual lattice for the form `2 Re h`, but does not say which type carries that form; on the obvious carrier they are the objects of `Re h`

An implementer who takes `W` to be a complex inner product space with inner product `h` gets a different dual, covolume and theta series from the ones the layer states. The Setting says "`L^∨` and `ZLattice.covolume L` are the dual lattice and the covolume for this real inner product" (Setting of Layer 9, line 1654). `ZLattice.dual` is taken for the real inner product instance of the ambient type (TauCeti/Algebra/Module/ZLattice/Dual.lean, line 78), and on `ℂ` Mathlib's instance is `Re(x̄y)` (`Inner.rclikeToReal` and `instance : InnerProductSpace ℝ ℂ`, Mathlib/Analysis/InnerProductSpace/Basic.lean, lines 944 and 987). So for `ℤ[i] : Submodule ℤ ℂ` the library's dual is `ℤ[i]` and its covolume `1`, while the second Example, correctly for `2 Re h`, has `½ℤ[i]` and `2`; and `ZLattice.thetaSeries` there is `(∑ exp(πi m² z))²`, not `(∑ e(m² z))²`.

One sentence naming the carrier settles it. Either: `W` is a complex inner product space whose inner product is `2h`, with the real structure `InnerProductSpace.rclikeToReal`. Or: `W` is a real inner product space with a complex structure acting by isometries, and `h(x, y) = ½(⟪x, y⟫ − i⟪x, iy⟫)`. The Example would then say that its `ℂ` carries the doubled form.

## C02 — The description does not say that ThetaSeries gains Layer 9

The description never names ThetaSeries: the roadmap is covered only by the count "49 existing roadmaps receive 196 sections". A reader cannot tell from it that a roadmap on `main` gains a layer. Text that would be right, with the listed additions: "ThetaSeries gains Layer 9 (§§9.1–9.2): the Hermitian theta series of degree `s` of a lattice in a positive definite complex Hermitian space, its convergence on the Hermitian half-space and its inversion law under `Z ↦ −Z^{-1}`; HermitianFormsAndLattices 7.1 cites it as the general theorem. No section of ThetaSeries is removed or renumbered and it gains no supplier."

## N01 — The two targets of the Setting have no section id, and `L^s` is not related to the binary orthogonal sum

`(L^s)^∨ = (L^∨)^s` and `covolume (L^s) = (covolume L)^s` are asked for in the Setting (line 1661), outside any `### 9.n`, so they cannot be cited by id. The Dependencies line sends the reader to Convention 17, whose orthogonal sum is binary (`ZLattice.orthSum` in `WithLp 2 (E × F)`, with `dual_orthSum` and `covolume_orthSum`, TauCeti/Algebra/Module/ZLattice/OrthSum.lean, lines 83, 187, 355), while the Setting uses `PiLp 2` over `Fin s`. A numbered item, or a clause saying that the `PiLp` product lattice is a new construction, would help.

## N02 — The *Needs:* line of §9.2 omits two inputs of its route

The route diagonalises `Y` by a unitary matrix and then takes the transform of a product of `s` Gaussians with different coefficients `d_k` on `W^s`. The first is Mathlib's `Matrix.IsHermitian.spectral_theorem` (Mathlib/Analysis/Matrix/Spectrum.lean, line 143); the second is not §1.6 as it stands (one coefficient for the whole space) and needs either a product formula for the transform on `PiLp 2` or `GaussianFourier.integral_cexp_neg_sum_mul_add` (Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean, line 277). Naming both would complete the line.

## Previous findings

- The earlier review of this folder (at `f3b4ab1`, same text) had no finding. Its two small corrections and two format notes are not repaired (the folder's text is unchanged); they are rechecked and stated again above as C01, C02, N01, N02.

## Verified sound

| Statement | Instances tried | Values computed (one side / other) | Result | Change |
|---|---|---|---|---|
| Setting: `‖x‖² = 2h(x,x)`; `s = 1` is Layer 3's series | `s = 1`, any `x` | `e(h(x,x)z) = exp(πi‖x‖²z)`; with `Re h` it would be `exp(2πi‖x‖²z)` | true | C01 |
| Setting: dual and covolume of `L^s` | `ℤ[i]`, `s = 2`; `r = 0`; `s = 0` | dual `(½ℤ[i])²`, covolume `4 = 2²`; `r = 0` or `s = 0`: both sides of 9.2 equal `1` | true | N01 |
| Setting: an `O_K`-lattice is a full lattice in `W` | `K = ℚ(i)`, `V = K` | rank of `ℤ[i]` is `2 = dim_ℝ ℂ`; discrete | true | none |
| 9.1: modulus `exp(−2π tr(T_X Y))`, positive definite in `X` | `Z = A + iY`, `Y = U D U^*`, `X' = XU` | `tr(T_X A)` real; `tr(T_X Y) = ∑ d_k h(x'_k, x'_k) ≥ λ_min(Y)‖X‖²/2`; `s = 1`: `exp(−π‖x‖² Im z)`, the §3.1 bound | true | none |
| 9.2: inversion law | `r = 1`, `h = 1.3·x̄y`, skew lattice; `s = 1`, `z = 0.37 + 0.9i`; `s = 2`, general `Z` | `s = 1`: `0.9992984453 + 0.0002501314i` both sides; `s = 2`: `0.9991214772 − 0.0005391846i` both sides | true | none |
| 9.2 against wrong variants | same data | `det(Z/i)^{−r}`: `0.74999 + 0.74246i` (`s = 1`), `1.00931 − 0.08204i` (`s = 2`); `covol^{+s}`: `7.30649` | excluded | none |
| 9.2 route: transform at `Z = iY`, then substitution | `Y = U diag(d_k) U^*` | `𝓕f_Z = ∏ d_k^{−r} f_{iY^{−1}} = det(Z/i)^{−r} f_{−Z^{−1}}`; `det(−Z^{−1}/i)^{−r} = det(Z/i)^r` | true | N02 |
| 9.2: the formula attributed to Cohen–Resnikoff, and its reduction to the displayed law | general (real Gaussian on `ℝ^{2rs}`); `r = s = 1`, `ℤ[i]`, `Z = iy` | real determinant `(det Y^r det H^s)²`; gives `Θ_𝔏 = det(Z/i)^{−r} det H^{−s} Θ_𝔏̂`; `θ(1/(yh))² = yh·θ(yh)²`; `N^*HN = 2T_X`; `covol = det(H)^s vol` | internally true; source text unread | none |
| Example `s = 1`: §9.2 is §4.2 with `k = r` | rank `2r` | `det(z/i)^r = (−i)^r z^r`, the factor of §4.2 | true | none |
| Example `ℤ[i]` | `z = i` | `(∑ e^{−2πm²})² = 1.0074837203`; `½(∑ e^{−πm²/2})² = 1.0074837203` | true | C01 |
| Seeded §3.1 (its bounds are used by 9.1) | pin | `ZLattice.thetaSeries` (ThetaSeries/Basic.lean 102), `summable_thetaSeries` (190), `norm_exp_pi_mul_I_mul_ofReal_mul` (82) | present | none |
| Seeded §4.2 (cited by the Examples) | `ℤ[i]` with doubled form, `k = 1` | `ZLattice.thetaSeries_S_smul` (ThetaSeries/Inversion.lean 104); value as in the row above | true | none |
| Headline (unchanged file): Milgram's formula | `A₂`, `k = 1` | `1 + 2e(1/3) = i√3`; `√3 · i` | true | none |

- Merge base against head, by headings and items: 54 layer and section headings at the base, all kept with their titles; 3 added (Layer 9, 9.1 (9A), 9.2 (9B)). The other changed lines (overview guide, build order, Convention 19, scope, exclusions, references) agree with Layer 9. The seeded sample falls in changed or affected text only at §3.1 and §4.2.
- Source locators checked against the text: 0 of 3 (Cohen–Resnikoff formulas (2)–(4) and (3), p. 330; Resnikoff Theorem 2.2): see Not verifiable.
- Library declarations opened at the pin: Mathlib 4 (`Inner.rclikeToReal`, the instance `InnerProductSpace ℝ ℂ`, `Matrix.IsHermitian.spectral_theorem`, `GaussianFourier.integral_cexp_neg_sum_mul_add`); Tau Ceti 12 (`ZLattice.dual`, its two instances, `dual_dual`, `orthSum`, `dual_orthSum`, `covolume_orthSum`, `thetaSeries`, `summable_thetaSeries`, `thetaSeries_S_smul`, `SchwartzMap.tsum_eq_tsum_dual_fourier_of_even`, `TauCeti.fourier_cexp_pi_mul_I_mul_norm_sq_mul`).
- Cross-roadmap citations resolved: 1. HermitianFormsAndLattices 7.1 (its *Corollary of:* line, README line 4107 at this head) quotes 9A and 9B as Layer 9 states them, with the same factor and constant. Layer 9 itself cites no other roadmap.
- Overlap check: read SiegelModularForms, HalfIntegralWeightModularForms, IntegralLattices, LatticePackingsAndPerfectForms, Rank24LatticeConstructions, OrthogonalTamagawaAndLatticeMass; nothing shared. SiegelModularForms lists Hermitian modular forms among what it does not state (its README line 3315); a search of all open heads and `main` for Hermitian theta series and the Hermitian half-space finds, outside this pull request's family, only AutomorphicCongruences §1.1 (p-adic Hermitian modular forms on GU(2,2), no theta series).
- Dependency check: `depcheck: 129 roadmaps, 1440 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds no supplier.
- Automatic checks: all passed. `Suggested.lean` is unchanged by the pull request and elaborates with 10 `sorry` warnings and nothing else. Layer 9 is not among the overview's headline theorems and adds no declaration; its statement in Lean would first need the carrier of C01.
- Description read against the head: ThetaSeries is not named (C02); nothing in it contradicts this folder.

Source independence: changed passages only; 0 passages compared with 0 sources, since neither work the change cites (Cohen–Resnikoff 1978, Resnikoff 1975) could be read; largest share of the README's locators: Ebeling, 6 of the body's citations, all in untouched text; contents not compared with Ebeling (not read). The added layer cites one page of one article, and the order of its two sections is forced by the *Needs:* of §9.2 on §9.1.

Research link: Layer 9 states the functional equation of the Hermitian theta function of Cohen and Resnikoff (1978), the analytic input to Hermitian modular forms of degree `s`; HermitianFormsAndLattices 7.1 uses it. Layers 6–7 are the Hecke–Schoeneberg theory (Schoeneberg 1974; Ebeling 2013). Rests on the README's references and overview.

## Not verifiable

- Cohen–Resnikoff 1978, formulas (2)–(4) and (3), p. 330 (§9.2, References): the publisher's page is on a host the sources service places in no licence class; the Project Euclid page for the article returned no text. Not searched further. The formula attributed to it is true as written (table above), but whether it is the source's formula (3) is unchecked.
- Resnikoff 1975, Theorem 2.2 (§9.2, References): resolves only to a paywalled page.
- Ebeling, *Lattices and Codes*: table of contents not read.

## Source issues

- none

## For the human reviewers

- Not tested: neither source of Layer 9 was readable (Cohen–Resnikoff 1978 on an unclassified publisher host, Resnikoff 1975 paywalled), so the wording of §9.2 and its three locators were checked by computation only, not against the texts.
- The two recorded decisions for this pull request do not bear on this folder: nothing leaves ThetaSeries, and HermitianFormsAndLattices 7.1 keeps its statement while citing Layer 9.
