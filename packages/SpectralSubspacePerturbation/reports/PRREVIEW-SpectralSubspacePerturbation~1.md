# Review of SpectralSubspacePerturbation (pull request #2622 at 1875d20)
Folder: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/`
**Verdict:** needs changes

**Summary.** Needs changes, for two findings about the sources. First, the sharp constant `π/2` in the headline unbounded theorem (§2.16), and in §2.12 and §4.15, is credited to Bhatia, Davis and McIntosh, who by two open sources proved the bound only with a constant between `√3/2` and `2`. Second, no target has a theorem or page locator, and the Haagerup–Zsidó reference names no publication. No statement was found false: every Check and worked example gives the stated value when recomputed, the five Lean statements elaborate with `sorry` as the only warning and match the README, and the `tan Θ` theorems pass random numerical tests. There are three small corrections and two format notes, none blocking. The human reviewers have a licence question and three sources that could not be read.

## R01 (P2) — The sharp constant `π/2` is credited to Bhatia, Davis and McIntosh, whose paper proves the pairwise bound only with a constant between `√3/2` and `2`

A reader who follows the citation of the headline unbounded bound (§2.16), or of §2.12 and §4.15, to Bhatia–Davis–McIntosh 1983 will not find `π/2` there. The unbounded theorem the roadmap targets has a different source that can be cited. Two open texts say the same thing:

- Albeverio–Makarov–Motovilov, *Graph subspaces and the spectral shift function* (Canad. J. Math. 55 (2003); arXiv math/0105142v3), Remark 2.8, p. 9 (AMM2003 lines 397–414). Bhatia, Davis and McIntosh proved the theorem with a best constant `c` that they only bounded by `√3/2 ≤ c ≤ 2`. The value `π/2` of the extremal `L¹` problem goes back to Sz.-Nagy and Strausz (Math. Nachr. 9 (1953)), and the sharpness of `π/2` is McEachin's.
- Seelmann, *Notes on the sin 2Θ theorem* (arXiv 1310.2036), Theorem 3.1 and its proof, pp. 9–10 (Seelmann2013 lines 516–547), gives the same attribution. It states exactly §2.16 for strong (domain-aware) solutions with unbounded self-adjoint `B₀`, `B₁`, combining AMM Theorem 2.7 (lines 374–396 of AMM2003, for weak solutions) with a lemma of Albeverio–Motovilov.

The attribution appears in five places:

- the Summary, line 9: "spectra only `δ` apart pairwise give the sharp `δ N(X) ≤ (π/2) N(C)` (Bhatia, Davis and McIntosh)";
- §2.12, line 212;
- §2.16, lines 240–241;
- §4.15, lines 445–446;
- the docstring of `mul_norm_le_pi_div_two_mul_norm_of_sylvesterEquation` (Suggested.lean, line 47).

The smallest repair has three parts:

- Credit Bhatia, Davis and McIntosh with the bound for some universal constant.
- Credit the value `π/2` to Sz.-Nagy (1953) and its sharpness to McEachin (Proc. Amer. Math. Soc. 115 (1992), as Seelmann cites it).
- Cite §2.16 to AMM 2003, Theorem 2.7 (weak solutions), and Seelmann, Theorem 3.1 (strong solutions), with those locators. Add the works to References.

## R02 (P2) — No target carries a locator, and the Haagerup–Zsidó entry in References names no work

All thirteen kept targets cite only an author and a year, such as "(Davis and Kahan 1970)" or "(Rosenblum 1956)", with no theorem, section or page. Neither a reader nor this review can check that a source proves a statement at the generality stated here, and R01 shows what such a check finds.

The References entry "U. Haagerup and L. Zsidó — the extremal kernel attaining `π/2`, followed through the Albeverio–Makarov–Motovilov reconstruction" (line 903) has no title, venue or year. The Albeverio–Makarov–Motovilov paper I read (arXiv math/0105142v3) mentions neither author. So the attribution of Layer 1's kernel has no source that can be checked (Summary line 10, §1.16 line 148, §2.12 line 212).

The repair is to add locators. These are the ones I verified in Yu–Wang–Samworth, arXiv 1405.0680v2:

- §4.17 is Theorem 2, inequality (3), p. 4 (YuWangSamworth2015 lines 87–96).
- §4.18 is Corollary 3, p. 5 (lines 146–153), whose `v̂ᵀv ≥ 0` is the phase `c`.
- §4.19 is the remark after Theorem 4, p. 7 (lines 201–204), together with steps (10)–(11) of its proof, p. 10 (lines 288–294).

Check this numbering against the Biometrika version, which the References cite. For §2.16, see R01. For Davis–Kahan 1970 (§3.28, §3.29, §3.31), Rosenblum 1956 (§2.17, §2.19) and Bhatia–Davis–McIntosh 1983, give the theorem and page. For the kernel, give the Haagerup–Zsidó publication, or cite the text where the `tanh`-weighted kernel actually appears.

## C01 — `yuWangSamworth_eigenvector_le` is the `d = 1` case of `yuWangSamworth_alignedBasis_le`, so as an acceptance test it asks nothing beyond §4.17

The README's own route for §4.18 is "§4.17 with `d = 1`". The steps from there are bookkeeping: the minimum becomes the operator norm, a unit vector of the line of `v` is `c v`, and the hypothesis `hgap` gives `PointInternalGap`. If the declaration is kept as the statisticians' form (Yu, Wang and Samworth state it as a corollary), its docstring could say that it is the `d = 1` corollary of `yuWangSamworth_alignedBasis_le`, kept as a check of that signature.

## C02 — In `yuWangSamworth_eigenvector_le` the hypothesis `hBv` and the scalar `μ` are not needed

Tau Ceti's `CorrespondingEigenblocks` (Spectral/Eigenframe.lean, line 161) makes `𝕜 ∙ v` the span of a unit eigenvector of `B` at index `e 0`, so `B v = λ_{e 0}(B) v` already follows from `hcorr`. The scalar `μ` occurs nowhere else (Suggested.lean, lines 134–138). Drop both, or say in the docstring that they only name the eigenvalue.

## C03 — The description does not say that three supplier roadmaps were dropped

On main the README "assembles" the angle geometry from PrincipalAngles, the norm-transfer machinery from Majorization and the polar geometry from PolarDecomposition, and the old `Suggested.lean` imported their files. At the head none of the three has a supplier contract: their material is consumed from the pinned Tau Ceti, and Scope and ownership names them only as owners. Add a sentence such as: "PrincipalAngles, Majorization and PolarDecomposition are no longer suppliers: what this roadmap used from them is consumed from the pinned Tau Ceti, and SelfAdjointSpectralTheory is the only roadmap supplier."

## N01 — The Provenance section records code history in a README meant to be timeless

Lines 557–562 give an upstream commit hash and "a recorded compatibility patch", and say that material "was adapted" without saying into what. One option is to keep the first sentence (an Apache-2.0 implementation exists) and drop or clarify the rest.

## N02 — Convention 3 names the intertwined operators in the reverse of Tau Ceti's order

Convention 3 says `X : F → E` "intertwines `A` and `B`" when `AX = XB` on the domain of `B`. The supplier contract (line 761) writes Tau Ceti's `LinearPMap.Intertwines A B X` for `X : E → F` with `XA ⊆ BX`. In Tau Ceti's order the hypothesis of §2.17 is `B.Intertwines A X`. Saying so in Convention 3 would remove the clash. The §2.17 statement in `Suggested.lean` could also use that predicate in place of `hmaps` and `hint`.

## Questions for the author

- Does Rosenblum's 1956 paper treat unbounded self-adjoint operators, as the attribution of §2.17 says? I could not read it: Project Euclid offers no open copy. If it treats bounded operators only, the unbounded form needs another source, or the route through the spectral measure stated as the argument.
- Does Davis–Kahan 1970 state the lower-rank `tan Θ` theorem of §3.29 (`dim Z < dim U`)? I could not read the paper (SIAM, no open copy). The statement itself holds: by hand for `dim Z = 1`, and in 1,613 random lower-rank cases the largest ratio `δ N(T)/N(R)` was 0.9999995.
- The family's PROGRESS.md (line 46) reports that Tau Ceti has gained, after the pinned commit, Rosenblum's theorem (`LinearPMap.Intertwines.eq_zero_of_disjoint_spectrum`), its bounded case, and the dilation pairwise-gap bound. None is at the pin, so keeping §2.17, §2.19 and §4.15 is right today. When the pin moves they, and `eq_zero_of_intertwines_of_disjoint_spectrum`, become restatements. Is that move planned?

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| §1.16 two-sided decay | `a = 1`, `s = 2`, `x = ±10` | `e^{−10}/10² ≈ 4.5·10⁻⁷` at both signs | tends to 0 on both sides; Mathlib's lemma covers only `x → +∞` | holds |
| §2.5 inverse bound | `T = [[1,1],[−1,1]]` on `ℝ²`, `c = 1` | `‖T⁻¹‖ = 1/√2 ≈ 0.707` | `c⁻¹ = 1` | holds; shift: `⟪Se₀, e₀⟫ = 0`, form not coercive |
| §2.12 scalar | `A = ¼`, `B = 0`, `δ = ¼` | `m_δ` is the identity, mass 1 | `≤ π/2`; unnormalised multiplier has norm `4 > π/2` | Check correct |
| §2.12 mass 1 fails | `A = diag(0,2)`, `B = diag(1,−1)`, `C = H/√2` | `‖m_δ(C)‖ = (2+√10)/(3√2) = 1.2168` | `‖C‖ = 1`, `π/2 = 1.5708` | Check correct |
| §2.16 headline | same pair, `δ = 1` | `δ‖X‖ = 1.2168` | `(π/2)‖C‖ = 1.5708` | holds |
| §2.16 gap needed | `ℓ²`, `aₙ = n`, `bₙ = n + 1/(n+2)`, `C = e_k ⊗ e_k` | `‖X_k‖ = k + 2` | distance of spectra 0; no constant works | Check correct |
| §2.16 degenerate | `E = 0` | `X = 0`, left side 0 | right side `≥ 0` | holds |
| §2.17 headline | `A = B` = multiplication by `x` on `L²(0,1)` | point spectra empty, `X = 1 ≠ 0` intertwines | spectra `[0,1]` meet | point-spectrum variant false, as the Check says |
| §2.17 | diagonal `n` against `n + 1/(n+2)` | `(m − n − 1/(n+2)) X_mn = 0` | coefficient never 0, so `X = 0` | holds |
| §2.19 | `A = diag(0,1)`, `B = diag(2,3)` | `(aᵢ − bⱼ)Xᵢⱼ = 0` | `X = 0`; for `A = B = 1`, `X = 1` intertwines | holds |
| §3.28 headline | `ℝ²`, `A = diag(0,1)`, `U = span e₁`, `φ = π/4` | `δ tan φ = 1/2` | `‖R‖ = 1/2`; `δ sin φ = 0.354` | equality, constant sharp |
| §3.28 random | 2,597 equal-rank cases, `n ≤ 6`; operator, Frobenius, nuclear norms | largest `δ N(T)/N(R)` | `1.000000000004` (rounding) | holds |
| §3.29 | `dim Z = 1` by hand | `‖R‖ ≥ cos θ sin θ (b − a)` | `δ tan θ ≤ ‖R‖` since `b − M ≥ δ`; 1,613 random cases, ratio ≤ 0.9999995 | holds; source: question |
| §3.31 | `A = diag(1,0)`, `H = [[0,h],[h,0]]` | `‖P_U − P_V‖ = 0.6154` (`h = 2`), `0.7053` (`h = 100`) | `√2/2 = 0.7071` | holds; diagonal `H` gives 1 |
| §4.15 | `A = 1`, `Â = −1` on `ℂ`, `Ω = (0,∞)` | `δ‖P P‖ = 2·1 = 2` | `(π/2)‖Â − A‖ = π` | holds; same-side variant has gap 0 |
| §4.17 headline | `B = A`, `U = V` of dimension 2 | `(e₁,e₂)` against `(e₂,e₁)`: discrepancy 2 | bound 0; `d = 0` gives `0 ≤ 0` | the existential is needed |
| §4.17 index sets | `e` not contiguous | Weyl and Hoffman–Wielandt bound the residual by `2 min(√d‖·‖, ‖·‖_F)` | gap from `PointInternalGap` | holds beyond the source's run `r..s` |
| §4.18 | `A = diag(1,0)`, `B = [[1,2/3],[2/3,0]]`, `Δ = 1` | `‖v − u‖ = 0.4595`; `‖−v − u‖ = 1.9465` | `2√2·(2/3) = 1.8856` | holds; phase needed |
| §4.19 | `A : ℂ → ℂ²`, `x ↦ (x,0)` | `AA† = diag(1,0)`, basis `(e₁, e₂)` | `σ⁻¹Av` gives only `e₁` | Check correct; `E = 0`: both sides 0 |
| Layer 1 mass | `y = 0.7` | `tanh(πy/2)/2 · 2coth(πy/2)/(1+y²) = 0.67114` | `1/(1+y²) = 0.67114`; integral `π/2` | holds |
| Layer 3 example | `ε = 2/3` | `δ sin θ = (4/3)/√5 = 0.596` | `‖B − A‖ = 0.667` | holds |
| Layer 4 example | same | `‖P_U − P_V‖ = 1/√5 = 0.447` | `(2/3)/(4/3) = 0.5`; population-gap bound `4/3` | holds |
| R01 attribution | Bhatia–Davis–McIntosh constant (AMM2003, Remark 2.8) | `√3/2 ≤ c ≤ 2` | README: sharp `π/2` credited to them | R01 |

- Source locators: the README has none. Checked: YuWangSamworth2015 Theorem 2, Corollary 3, Theorem 4 and the remark after it, and the proof (lines 87–96, 146–153, 193–204, 288–302); AMM2003 Theorem 2.7 and Remark 2.8 (lines 374–414); Seelmann2013 Theorem 3.1 (lines 516–547).
- Library declarations opened at the pins, Tau Ceti:
  - LinearPMap/Sylvester.lean:37 and SpectralSeparation.lean:37, 49;
  - Resolvent/Basic.lean:129, 140 and LinearPMap/Intertwining.lean:39;
  - Projection/TanTheta.lean:58, 94 and PointSpectrum.lean:125, 173, 574, 749;
  - Spectral/Eigenframe.lean:161 and RayleighRitz.lean:83;
  - Coercive.lean:43, 52 and Normed/Operator/Basic.lean:134;
  - CFC Intertwining.lean:57 and InnerProductSpace/LinearPMap/Cayley.lean:97;
  - YuWangSamworth/SinTheta.lean:59, SingularVectors.lean:60 and Orthonormal/Procrustes.lean:116;
  - UnitarilyInvariantSeminorm/Basic.lean:157, 428 and Sylvester/Pairwise.lean:247;
  - Poisson/CauchyLattice.lean:45–72.
- Library declarations opened at the pins, Mathlib: Pow/Asymptotics.lean:338, PoissonSummation.lean:201, Fuglede.lean:174, LaxMilgram.lean:66, 105 and Positive.lean:444. All 230 backticked library names of the README were found at the pins.
- Cross-roadmap citations resolved:
  - SelfAdjointSpectralTheory SA-E01, E02, E05–E08, E31, E37, SA-C66 and SA-D31–D34 exist on main; its open revision maps them in its former-numbering table.
  - The downstream citations resolve through the Scope table: SSP-C16 (MathematicalStatisticsNonparametric §8.6), SSP-C17 (MathematicalStatisticsHighDimensional §8.1), and SSP-D06 and SSP-D13 (RandomMatrices §1.3, §2.6).
- The worker's automatic checks all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gives five `declaration uses 'sorry'` warnings and nothing else. I compared each elaborated signature with its README statement: no binder is lost, and no change is needed.
- Probing for statements already proved: no pinned declaration proves any of the five statements. Tau Ceti's `SylvesterEquation` has no consumer, nothing is proved about `tanThetaMap` beyond its singular values, and the `sin Θ` theorem and the Procrustes bound are separate.
- Ownership against open pull requests was checked by searching all 420 open heads for the Sylvester, Rosenblum, Davis–Kahan, Haagerup and Yu–Wang–Samworth objects.

Overlap check: read OperatorTheory (family index), PrincipalAngles, SelfAdjointSpectralTheory (main and its open revision), Majorization, OperatorIdeals, SchrodingerOperatorsAndSpectralTypes; nothing shared. The open SelfAdjointSpectralTheory revision names this roadmap as owner of the Sylvester estimates and Rosenblum's theorem. SchrodingerOperatorsAndSpectralTypes §1.8 is Rosenblum's 1957 trace-class lemma, a different theorem.

Source independence: 9 passages compared with 3 sources (YuWangSamworth2015, AMM2003, Seelmann2013), with no wording shared beyond forced phrases. The README has no exact locators; by author–year attribution BhatiaDavisMcIntosh1983 is cited most (5 of about 19). Its table of contents could not be read (paywalled). The four layers draw on four different sources, so no single table of contents is followed.

Research link: §2.16 is Theorem 2.7 of Albeverio–Makarov–Motovilov (2003) and Theorem 3.1 of Seelmann (2013), the input to the off-diagonal subspace-perturbation results of Kostrykin–Makarov–Motovilov (2007). Layer 4 is Yu–Wang–Samworth (2015), used for high-dimensional principal components (README, Downstream consumers). Rests on these sources, read.

## Not verifiable

- DavisKahan1970 (doi 10.1137/0707001): the SIAM landing page returns HTTP 403 and there is no open copy; this affects §3.28, §3.29 and §3.31.
- Rosenblum1956 (doi 10.1215/S0012-7094-56-02324-9): the Project Euclid page has no PDF; this affects §2.17 and §2.19.
- BhatiaDavisMcIntosh1983 (doi 10.1016/0024-3795(83)80007-x): it resolves only to a paywalled page through the legal-sources service; I checked its content only through AMM2003 Remark 2.8 and Seelmann2013's citations.
- Haagerup–Zsidó: there is no title or year to look up. A web search and AMM2003 found nothing.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc.". The README's Provenance section (lines 557–562) says that an Apache-2.0 implementation of all four layers exists in the AIQ DKPS formalization, and that material was adapted from the Spectra Formalization Project. I did not compare the five declarations with those repositories.
- Not tested: Davis–Kahan 1970 (the README's "principal worked source"), Bhatia–Davis–McIntosh 1983 and Rosenblum 1956 could not be read legally, so the wording and the arrangement were not checked against them.
