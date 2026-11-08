<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7428#issuecomment-6699116113 -->
Review (claude) of 1442fdc

Verdict: needs_changes

1. **F01** (P1) §8.2 and §8.4 multiply by an unbounded outer function and assert `H²` membership that nothing provides

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 1494–1496 ("the outer `G` with `|G|² = w` (§2.8, §6.8) … a counterexample sequence `fₙ ∈ PW_1` gives `e^{iz}fₙ Gₙ` bounded in `H²(ℂ₊)`") and line 1531–1532 ("`F(t, ·) = e^{itz} G(z)(K(t, λ_t, ·) − Sinc(t, λ_t, ·)/w(s))` has `H²` norm `o(√t)`"); plan.json targets 8.2 and 8.4.

   Claim: for `H ∈ H²(ℂ₊)` (here `e^{itz}Δ` with `Δ ∈ PW_t`) and the outer `G = O_{(1/2) log w}`, the product `HG` lies in `H²(ℂ₊)` with `‖HG‖² = ∫ |H*|² w dx`.

   Witness: `G` is not bounded (`w ∈ L¹(Π)` only, and `sup |O_h| = e^{ess sup h}` by §2.8's own bullet), so §2.6's bullet "bounded multipliers: `GF ∈ H²(ℂ₊)` … for bounded holomorphic `G`" (line 664) does not apply, and no other bullet of §2.5, §2.6 or §2.8 gives the product's membership; the source simply asserts it (poltoratski2024 line 685–687: since `Gₙ` is outer and `fₙGₙ` satisfies the `L²` bound, `gₙ` are `H²` functions of norm at most `1`). The Poisson tools of Layer 2 do not reach it: `|H(z)| ≤ P[|H*|](z)` and `|G(z)| ≤ P[√w](z)` give a product of two Poisson integrals, which is not controlled by `P[|H*|² w]`. The Smirnov-class lemma, or the `H²` logarithmic bound `log|H(z)| ≤ P[log|H*|](z)`, is the missing input; §2.5 states that bound for bounded functions only (line 625).

   Repair (tested on the instance that refuted the original, `H = e^{itz}Δ`, `G = O_{(1/2)log w}`):

   1. §2.6, new API bullet: "Logarithmic bound: for `F ∈ H²(ℂ₊)`, `F ≢ 0`, `log|F*| ∈ L¹(Π)` and `log|F(z)| ≤ P[log|F*|](z)` on `ℂ₊`. Route: `F(· + iε)` is bounded on `ℂ₊` by the point bound `‖F‖/√(4πε)`, so §2.5 gives the bound for it; as `ε → 0`, `log⁺|F(· + iε)| → log⁺|F*|` in `L¹(P(z, ·)dx)` because `|log⁺a − log⁺b| ≤ |a − b|`, and Fatou's lemma on `log⁻|F(· + iε)|` along a sequence converging almost everywhere gives the inequality in the limit." (garnett2007, Ch. II §4, uncertified.)
   2. §2.8, new API bullet: "Outer multipliers: if `F ∈ H²(ℂ₊)` and `G = cO_h` is outer with `F* e^h ∈ L²(ℝ)`, then `FG ∈ H²(ℂ₊)`, `(FG)* = F*G*` and `‖FG‖ = ‖F* e^h‖_{L²}`. Route: `log|FG| ≤ P[log|F*| + h]` by the logarithmic bound of §2.6 and `|O_h| = e^{P[h]}`, and Jensen's inequality `exp(P[k]) ≤ P[e^k]` gives `|FG(x + iy)|² ≤ P[|F*|² e^{2h}](x + iy)`, whose integral in `x` is `‖F* e^h‖²`." Checks: `F = 1/(z + i)²`, `h = log|x + i|` (`G = −i(z + i)`): `FG = −i/(z + i) ∈ H²` with `‖FG‖² = π = ∫ dx/(1 + x²) = ‖F* e^h‖²`; `F = 1/(z + i)`, same `G`: `F* e^h = 1 ∉ L²` and `FG = −i ∉ H²`, so the boundary condition is needed; `h = 0`: the bullet is the identity.
   3. §8.2 and §8.4: name the new bullet in the route ("`e^{itz}Δ ∈ H²(ℂ₊)` by §2.7 and `∫ |Δ|² w dx ≤ ∫ |Δ|² dμ = o(t)` by §8.3, so `e^{itz}GΔ ∈ H²(ℂ₊)` with norm `o(√t)` by the outer-multiplier bullet of §2.8"; in §8.2 with `fₙ`, `Gₙ` and the bound `1`), and keep §2.8 in both *Needs:* lines; plan.json 2.6 and 2.8 `api`, 8.2 and 8.4 route text accordingly.

   With the bullet, the refuting instance closes: `e^{itz}Δ ∈ H²` (§2.7), `log w ∈ L¹(Π)` (§6.8) makes `G` an outer function, and `∫ |Δ|² w ≤ ∫ |Δ|² dμ` since `μ ≥ w dx`; so `‖F(t, ·)‖²_{H²} ≤ ‖K_t(λ_t, ·) − Sinc_t(λ_t, ·)/w(s)‖²_{L²(μ)} = o(t)` as §8.4 states.

2. **F02** (P2) §3.1's norm bounds hold for the Euclidean operator norm only, and the README names the `L∞` one

   Location: `design/README.md` line 759 ("`‖−Ω(z − Q_q(t))‖ ≤ |z| + |q(t)|`"), line 770 ("`‖M(t, z)‖ ≤ exp(t|z| + ∫₀ᵗ |q|)`"), line 453 (§1.6 Check, "`m_K(t) = sup_K |z| + |q(t)|`"); plan.json 3.1 `api`, 1.6 `tests`.

   Claim: the Dirac coefficient has operator norm at most `|z| + |q(t)|` and the fundamental matrix norm at most `exp(t|z| + ∫|q|)`, for the norm the roadmap puts on `ℂ²` and on `2 × 2` matrices.

   Witness: the Conventions fix no norm on `ℂ²`; the only matrix norm the README names is Mathlib's `L∞` operator norm (`open scoped Matrix.Norms.Operator`, Tau Ceti contract for `Matrix.hasFDerivAt_det`), which is the operator norm of `Fin 2 → ℂ` with its sup norm (`Matrix.linfty_opNNNorm_eq_opNNNorm`, `Analysis/Matrix/Normed.lean` line 461). Under it, for `q = 1 + i` (`f = g = 1`): `‖ΩQ_q‖ = |f| + |g| = 2 > √2 = |q|`, and at `z = 0`, `t = 1`, `M(1, 0) = exp([[1, −1], [−1, −1]]) = [[3.5465, −1.3683], [−1.3683, 0.8099]]` has `L∞` operator norm `4.9148 > 4.1133 = e^{√2} = e^{∫|q|}`. Under the Euclidean operator norm both bounds hold (`Q_q` is Hermitian with eigenvalues `±|q|`, `‖Ω‖ = 1`; `‖M(1, 0)‖ = 4.1133`, equality). The roadmap already uses the Euclidean norm of vectors elsewhere (`|Θ(s, z)|² = |A|² + |C|²` in §3.3, §6.4, §6.2), so the carrier is implicitly Euclidean, but the stated inequalities are false for the carrier `Fin 2 → ℂ` that §1.4 and the matrix contract use.

   Repair (tested on the witness): in Conventions, "Scalars and carriers", add: "`ℂ²` is `EuclideanSpace ℂ (Fin 2)` with the Euclidean norm, and `2 × 2` matrices act on it with the Euclidean operator norm, under which `‖Ω‖ = 1`, `‖Q_q(t)‖ = |q(t)|` (`Q_q` is Hermitian with eigenvalues `±|q|`) and `|Θ|² = |A|² + |C|²`; §1.4 is applied to the Dirac system through the identification of `EuclideanSpace ℂ (Fin 2)` with `Fin 2 → ℂ`, under which determinant, trace and invertibility are unchanged and the derivative transfers along the continuous linear equivalence." In §3.1 say the propagator is taken in `E = EuclideanSpace ℂ (Fin 2)`, and add the Check: "Norm convention: for `q = 1 + i` at `z = 0`, `t = 1`, `‖M(1, 0)‖ = e^{√2} ≈ 4.113` with equality in the Euclidean operator norm, while the maximum-row-sum norm gives `≈ 4.915`, so the bound `exp(t|z| + ∫|q|)` needs the Euclidean norm." Adjust §1.6's Check (line 453) and the Layer 1 Example on the Dirac coefficient to the same norm. (The alternative, keeping `Fin 2 → ℂ` and stating the bounds with `√2 ∫|q|`, is also consistent but breaks the sharpness recorded in §3.2's Check.) With the Euclidean norm: `‖−zΩ + ΩQ_q‖ ≤ |z| + |q|` and Grönwall (§1.3) give `‖M(t, z)‖ ≤ exp(t|z| + ∫₀ᵗ|q|)`, with equality for constant `q` at `z = 0`.

3. **F03** (P3) §1.4's *Needs:* omits the lemma that makes the matrix entries absolutely continuous

   Location: `design/README.md` line 391–392 ("The function `det N_P(·, s)` is absolutely continuous, being a finite sum of products of the absolutely continuous entries"), *Needs:* line 396–400; plan.json 1.4 `prerequisites`.

   Claim: the entries of `N_P(·, s)` are absolutely continuous, so `AbsolutelyContinuousOnInterval.add` and `.smul` give the determinant.

   Witness: §1.2 gives absolute continuity of the curve `N_P(·, s)` into `E →L[𝕜] E`; passing to an entry needs the composition with the Lipschitz entry map, which is Mathlib `LipschitzWith.comp_absolutelyContinuousOnInterval` (`MeasureTheory/Function/AbsolutelyContinuous.lean` line 344, for any pseudo-metric target) and is not listed. Repair: add "entries are absolutely continuous as Lipschitz images of the curve `N_P(·, s)` (Mathlib `LipschitzWith.comp_absolutelyContinuousOnInterval`)" to the route and the name to *Needs:* and to plan.json 1.4 and the Mathlib contracts. Tested: the entry map `N ↦ N i j` is `1`-Lipschitz for the `L∞` operator norm (`Matrix.norm_apply_le_linfty_opNorm`, `Analysis/Matrix/Normed.lean` line 301), so the lemma applies as stated.

Three findings, two of them blocking (one P1, one P2), one P3. Both findings of round 2 are repaired, and the repair's own pattern sweep (§2.5, §5.1) is sound at the pins. The findings below come from the adversarial pass over the sampled targets and the sections round 2 had summarised without values.

## Verified sound

**Repairs of round 2, finding by finding.**

- **F01 (P3), `fourier_real_eq` line — repaired.** Contracts now read "`fourier_real_eq` (`Analysis/Fourier/FourierTransform.lean` line 483, the kernel `e^{−2πi v w}`)". Opened at the pin: the theorem begins at line 483 with `𝓕 f w = ∫ v : ℝ, 𝐞 (-(v * w)) • f v`.
- **F02 (P3), Liouville's formula — repaired differently, correctly.** §1.4 now routes through "the chain rule and Jacobi's formula at an invertible matrix (Tau Ceti `Matrix.hasFDerivAt_det`, restricted to real scalars when `𝕜 = ℂ`) … `∂ₜ det N_P(t, s) = det N · tr(N⁻¹P(t)N) = det N · tr P(t)` … By the uniqueness clause of §1.2 it equals `exp(∫_s^t tr P)`". The round-2 repair would indeed have restated a pinned theorem. Opened at the pin: `Matrix.hasFDerivAt_det` (`TauCeti/Analysis/Calculus/FDeriv/Det.lean` line 110, `hA : IsUnit A.det`, derivative `A.det • trace ∘ mul A⁻¹`, variables `[Fintype n] [DecidableEq n] [NontriviallyNormedField 𝕜]`, `open scoped Matrix.Norms.Operator` at line 46), `Matrix.fderiv_det_apply_adjugate` (line 75), `Matrix.fderiv_det_apply` (line 92), `Matrix.det_exp` (`TauCeti/Analysis/Normed/Algebra/MatrixExponential.lean` line 75, `[RCLike 𝕂]`); Mathlib `Matrix.det_apply` (`LinearAlgebra/Matrix/Determinant/Basic.lean` 66), `Matrix.trace_mul_comm` (`LinearAlgebra/Matrix/Trace.lean` 156), `Matrix.mul_nonsing_inv` (`LinearAlgebra/Matrix/NonsingularInverse.lean` 209, `IsUnit A.det`), `HasFDerivAt.comp_hasDerivAt` (`Analysis/Calculus/Deriv/Comp.lean` 375), `HasFDerivAt.restrictScalars` (`Analysis/Calculus/FDeriv/RestrictScalars.lean` 54), `AbsolutelyContinuousOnInterval.add` and `.smul` (`MeasureTheory/Function/AbsolutelyContinuous.lean` 206, 273; `.smul` needs `[SeminormedRing M] [Module M F] [NormSMulClass M F]`, satisfied by `M = F = 𝕜`). The contract bullets state these hypotheses. The new Check (`det exp(tA) = e^{2t}` for `A = [[1, 1], [0, 1]]`, wrong models `e^{3t}`, `e^t`) recomputed: `exp(tA) = e^t[[1, t], [0, 1]]`, determinant `e^{2t}`, `tr A = 2`. The only residue is R03.
- **Pattern sweep of the repair (§2.5, §5.1) — sound.** `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean` 270, `[ProperSpace 𝕜]`, `E` seminormed over a nontrivially normed field) and `MeasureTheory.Lp.dualOneEquiv` (`TauCeti/MeasureTheory/Function/L1Space/Dual.lean` 102, `[RCLike 𝕜] [IsFiniteMeasure μ]`, `Lp 𝕜 ∞ μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ)`); the §2.5 route pairs `F(· + iε) ∈ L^∞(Π)` with `(1 + x²)P(z, ·) ∈ L¹(Π)` (bounded: suprema `3.3117`, `0.3183`, `31.86` at `z = 2 + 0.5i`, `i`, `−3 + 0.1i`, below `C(z) = 6.366`, `0.637`, `63.66`), and `Π` and Lebesgue measure share null sets since `dΠ/dx = 1/(1 + x²) > 0`. `TauCeti.norm_convolutionLp_le` and `TauCeti.convolutionLp_ae_eq_convolution` (`TauCeti/MeasureTheory/Function/Lp/Convolution.lean` 117, 197; variables `[FiniteDimensional ℝ E] [BorelSpace E] [μ.IsAddHaarMeasure] [Fact (1 ≤ p)]`, `hp : p ≠ ∞`, real kernel, `[CompleteSpace F]`, `Integrable k μ`, `MemLp f p μ`): the §5.1 kernel `e^{−2ys}1_{s ≥ 0}` has `L¹` norm `1/(2y)`, so `‖r(·, z)‖₂ ≤ 2 · (1/(2y)) · ‖q‖ = ‖q‖/y` and `|log a| ≤ ‖q‖₂‖r‖₂ ≤ ‖q‖²/y`.

**Principles.** No route-specific shortcut (complex potentials in Layers 1–6, real in 7–9 as the source, stated in Scope). No roadmap re-planned (duplication below). Supply downward only (gate below). Own words with locators: the sampled passages were compared with the OCR texts, nothing copied. No algorithms. No `Suggested.lean` at the design stage, so no sorry'd data or `set_option`. Grepped: no LaTeX delimiters, no pull-request numbers, no machine paths, no process words. Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, AnalyticNumberTheoryPartI), How to read the build, Layers 1–9 each ending with Examples and Dependencies, Downstream consumers, References; plan.json: 9 layers, 57 targets, 188 tests, every definition with an API list and at least three Checks, every target with a locator, `gaps: []`, one supplier; all twelve cited works are in `sources.toml` and in References.

**Gate.** Output of the dependency check on the candidate README:

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AnalyticNumberTheoryPartI (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2351 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The one supplier citation (AnalyticNumberTheoryPartI §0.23) was resolved in round 2 at the supplier's head and is unchanged. Declared gaps: none, none needed. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id dropped, no id only an open revision defines.

**Sources, seeded sample** (each locator read at the cited line; garnett2007 uncertified and coddingtonlevinson1955, debranges1968, remling2018, krein1955 waived, cited by locator):

- §2.1: poltoratski2024 line 250–254 (`Π`, Poisson-finite), 610–614 (`Pμ`); mauth2022 line 378–392 (kernel, Poisson-finite, Lemma 3): as cited.
- §2.2: mauth2022 Lemma 3 line 390–392 (harmonicity): as cited; the representation is Tau Ceti's Nevanlinna theorem at the pin.
- §2.4: mauth2022 Lemma 4 line 404–410 (continuity point), Lemma 7 line 434–436 (singular measure, nontangential limit `0`): as cited.
- §2.6: mauth2022 line 337–358 (definition of `H^p(ℂ₊)`, `1 < p < ∞`), Lemma 1 line 359–369, Lemma 2 line 370–377 (constant `(2/(πy))^{1/p}`, weaker than the README's `1/(4πy)` for `p = 2`, as the README says), Lemma 6 line 430–433, Lemma 9 line 469–471 (one direction stated; the isometry onto is the standard Paley–Wiener theorem, garnett2007 p. 84), Lemma 11 line 487–489: as cited.
- §2.7: poltoratski2024 line 236–244 and (2.3)–(2.4) line 241–249; mauth2022 Lemma 10 line 472–484 (with `t = 1`): as cited.
- §3.1: poltoratski2024 line 136–166 (system, Neumann and Dirichlet solutions, fundamental matrix), (2.1) line 204; mauth2022 (5)–(6) line 546–563, Lemma 14 line 565; romanov2014 line 223–224 (chain rule), (12) line 758 (Christoffel–Darboux with `H = 1`): as cited.
- §5.3: poltoratski2024 line 518–548 (normal convergence, Parseval), 569–577 (`a` outer, `|a| = (1 − |f⌃|²)^{−1/2}`, `b = a f⌃`): as cited.
- §5.6: poltoratski2024 line 561–567 (modulation, shift, rescaling); taothiele2012 line 687–688 (lowest order gives Plancherel): as cited.
- §6.2: poltoratski2024 line 269–285; mauth2022 Lemma 18 line 659–691 (upper bound `e^{∫|f|}`, lower bound from `det = 1`); romanov2014 Theorem 5 (16) line 812–813: as cited.
- §6.5: poltoratski2024 line 255–264; mauth2022 line 692–701; romanov2014 line 2275–2281: as cited.
- §6.8: poltoratski2024 line 263–268; mauth2022 Theorem 3 line 702–707; denisov2006 Theorem 11.1 line 3246–3255 (Szegő condition, constant `π` in (194)): as cited.
- §8.1: poltoratski2024 line 846–849 (`T₀`, `γ`), 997–1001 (`T₁`, complement of `T₀` inside `T₁`); mauth2022 line 1245–1257: as cited.
- §8.3: poltoratski2024 Lemma 3 line 729–751 (expansion of the square, `Sinc(t, z_t, z_t) ≍ t`); mauth2022 Corollary 3 line 1104–1110: as cited.
- §8.4: poltoratski2024 Lemma 4 line 756–792 (`F = e^{itz}GΔ`, `‖F‖² = o(t)`, two points, rhombus, real entire `Δ`); mauth2022 Lemma 22 line 1129–1135: as cited; the `H²` membership asserted at line 766 is R01.
- §8.7: poltoratski2024 line 918–996 (rotation of `(A, C)`, zero crossings, Lemma 1 forcing `t(x₂ − x₀) = o(1) mod 2π`, passage to the exponential) and Corollary 3 line 1002–1012; mauth2022 Corollary 6 line 1397–1408 (with the remark on `ty(t) > 1`): as cited.
- Also read for R01: poltoratski2024 Lemma 2 proof line 660–727 (the `H²` assertion at 685–687, the Cauchy-integral argument on squares, the lower bound by the approximate identity).

**Pinned declarations opened this round** (file and line at the pins): Mathlib `fourier_real_eq` (483), `WeakDual.isCompact_closedBall` (270), `Matrix.det_apply` (66), `Matrix.trace_mul_comm` (156), `Matrix.mul_nonsing_inv` (209), `HasFDerivAt.comp_hasDerivAt` (375), `HasFDerivAt.restrictScalars` (54), `AbsolutelyContinuousOnInterval.add` (206), `.smul` (273), `LipschitzWith.comp_absolutelyContinuousOnInterval` (344), `Matrix.linfty_opNNNorm_eq_opNNNorm` (`Analysis/Matrix/Normed.lean` 461), `Matrix.norm_apply_le_linfty_opNorm` (301), `Pi.norm_def'` (`Analysis/Normed/Group/Constructions.lean` 310), `EuclideanSpace.norm_eq` (`Analysis/InnerProductSpace/PiL2.lean` 159); Tau Ceti `Matrix.hasFDerivAt_det` (110), `Matrix.fderiv_det_apply_adjugate` (75), `Matrix.fderiv_det_apply` (92), `Matrix.det_exp` (75), `TauCeti.norm_convolutionLp_le` (117), `TauCeti.convolutionLp_ae_eq_convolution` (197), `MeasureTheory.Lp.dualOneEquiv` (102). The declarations of rounds 1–2 were not re-opened; the pins of `lake-manifest.json` are unchanged.

**Adversarial table** (values computed this round: closed forms, a fourth-order Runge–Kutta integration with 5000 steps for §1.4, Riemann sums for the integrals).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.4 Liouville (F02), singular integrable coefficient | `P(t) = [[t^{−1/2}/2, 1], [0.2it, 1]]` on `(0, 1]`, substitution `t = u²` | `det N(1, 0) = 7.389056 + 5.6e−16 i`; `exp(∫₀¹ tr P) = exp(2) = 7.389056` | holds | none |
| §1.4 Check `det exp(tA)` | `A = [[1, 1], [0, 1]]`, `t = 0.5, 1` | `e^{2t} = 2.71828, 7.38906`; wrong models `e^{3t} = 4.4817, 20.086`, `e^t = 1.6487, 2.7183` | holds, wrong models excluded | none |
| §1.4 `\|tr P\| ≤ n‖P‖` | `L∞` operator norm; Euclidean | `\|P_ii\| ≤ Σ_j \|P_ij\| ≤ ‖P‖`; `\|P_ii\| = \|⟨e_i, Pe_i⟩\| ≤ ‖P‖₂` | holds in both norms | none |
| §1.4 entries absolutely continuous | entry map | `1`-Lipschitz for the `L∞` operator norm; lemma at the pin, not in *Needs* | holds; omission | R03 |
| §1.1 Checks | `β = −1`, `u ≡ 1/2`, `α = 1`; equality case | `1/2 ≤ 1 − t/2` on `[0, 1]` but `1/2 > e^{−1} = 0.3679`; `u(t) = 2 + ∫₀^{min(t,1)} 2e^s = 2e^{min(t,1)}` | holds | none |
| §1.2 Check | `P = t^{−1/2}`, `P = 1/t` | `Y = y₀e^{2√t}`; `Y = ct` all solve from `0` | holds | none |
| §1.3 time ordering | `A = [[0,1],[0,0]]`, `B = [[0,0],[1,0]]` | `exp(B)exp(A) = [[1,1],[1,2]]`, `exp(A)exp(B) = [[2,1],[1,1]]`, `exp(A+B) = [[cosh 1, sinh 1],[sinh 1, cosh 1]]`, `det[[1,1],[1,2]] = 1` | holds | none |
| §1.5 Check | `p = 0`, `p′ = 1` on `[0,1]` | `e − 1 = 1.71828 ≤ 1 · e = 2.71828` | holds | none |
| §1.6 Check `m_K` for the Dirac coefficient | `q = 1 + i`, sup norm | `‖ΩQ_q‖_∞ = \|f\| + \|g\| = 2 > \|q\| = 1.4142`; Euclidean `‖ΩQ_q‖₂ = 1.4142` | holds for the Euclidean norm only | R02 |
| §1.7 Checks | `F = 2√\|x\|`; `F = x²`, `x₀ = 1`, `r = 1`, `τ = 0.1` | solutions `0`, `t²`; `L = 4`, `m = 1`, `0.1e^{0.4} = 0.1492 ≤ 1`, `1/0.9 = 1.111 ≤ 1.12` | holds | none |
| §2.1 `P ≤ C(z)/(1+x²)` and Check | `z = 2 + 0.5i`, `i`, `−3 + 0.1i`; `h = 1/(1+x²)` at `2i` | suprema of `(1+x²)P`: `3.3117`, `0.3183`, `31.86` against `C(z) = 6.366`, `0.637`, `63.66`; `(2/π)∫dx/((x²+4)(x²+1)) = (2/π)(π/6) = 1/3 = Re(i/(3i))`; `S[h] = i/(z+i)` by residues at `i` and `z`: `∫h/(x−z) = −π/(z+i)` | holds | none |
| §2.2 | `u = P[δ₀]`; `u ≡ 1`; `u = Re z` | `πy·y/(πy²) = 1 = ν(ℝ)`; `πy → ∞`; `Re(−1+i) = −1` | holds | none |
| §2.3 Check | `h = 1_{[0,1]}`, `x = 2` | `P[h](2+i) = (arctan 2 − π/4)/π = 0.10242`; maximal function `1/4` at `r = 2`; `0.102 ≤ 0.75` | holds | none |
| §2.4 Check (jump) | `h = 1_{[0,1]}`, `x = 0` | `P[h](iy) → 1/2`; `P[h](−y/2 + iy) → 1/2 − arctan(1/2)/π = 0.35242`; `−y/2 + iy ∈ Γ_∞(0)` | holds, no nontangential limit | none |
| §2.5 (repair) weak-* pairing | `(1+x²)P(z,·)` | bounded (values above), so in `L¹(Π)`, `Π(ℝ) = π`; null sets of `Π` and `dx` coincide | holds | none |
| §2.6 point bound and Fourier witness | `F = 1/(z+i)`; `g = 1/(x+i)` | `‖F‖² = sup_y π/(y+1) = π`, `\|F(i)\|² = 1/4 = π/(4π)` attained; Mauth's constant gives `2/π · π = 2 > 1/4`; `𝓕g(w) = −2πi e^{−2πw}` for `w > 0` (pole at `−i`, lower half-plane), `0` for `w < 0`; `F = −i∫₀^∞e^{−s}e^{isz}ds = −i/(1 − iz) = 1/(z+i)` | holds | none |
| §2.6 Cauchy bound | general | `\|F(z)\| ≤ (1/2π)‖F‖(π/y)^{1/2}`, squared `‖F‖²/(4πy)` | holds | none |
| §2.6 logarithmic bound for `H²` | needed by §8.2, §8.4 | absent from §2.5 (bounded only, line 625), §2.6, §2.8 | unowned | R01 |
| §2.7 Checks | `φ = 1_{[−t,t]}`, `t = 1.5`; kernel | `F = 2 sin(tz)/z`; `∫4sin²(1.5x)/x²` on `[−4000, 4000]` `= 18.8486`, `4πt = 18.8496`; `k_t(λ,λ) = sin(2it Im λ)/(2πi Im λ) = sinh(2t Im λ)/(2π Im λ)`, `t/π` at real `λ`; `\|F\| ≤ ‖φ‖(2te^{2t\|Im z\|})^{1/2}` | holds | none |
| §2.7 `zF ∈ PW_t` | integration by parts | `zF = −i[φe^{isz}]_{−t}^{t} + i∫φ′e^{isz}`; boundary term vanishes iff `φ(±t) = 0` | holds | none |
| §3.1 free and constant cases | `q = 0`; `f = c`, `z = 0`; `q = ic`, `z = 0` | `exp(t[[0,−z],[z,0]]) = [[cos tz, −sin tz],[sin tz, cos tz]]`; `ΩQ = [[f,−g],[−g,−f]]`: `diag(e^{ct}, e^{−ct})`; `[[cosh ct, −sinh ct],[−sinh ct, cosh ct]]`, `det = 1` | holds | none |
| §3.1 norm bounds | `q = 1 + i`, `z = 0`, `t = 1` | `M(1,0) = [[3.5465, −1.3683],[−1.3683, 0.8099]]`; `L∞` operator norm `4.9148`, Euclidean `4.1133`, `e^{∫\|q\|} = e^{√2} = 4.1133` | false for the `L∞` norm, equality for the Euclidean | R02 |
| §3.1 symmetries | real `q`, `z ↦ −z`; complex `q`, `z ↦ conj z` | `S = diag(1,−1)`: `S(−zΩ + ΩQ)S = zΩ + ΩQ` since `ΩQ = diag(f, −f)`, so `A, D` even, `B, C` odd; `Ω, Q` real so `M(t, conj z) = conj M(t,z)` | holds | none |
| §3.1 Christoffel–Darboux | derivative | `∂ₜ(M(λ)*ΩM(z)) = M(λ)*((conj λ − Q)Ω·Ω − Ω·Ω(z − Q))M(z) = (z − conj λ)M(λ)*M(z)` using `Ω* = −Ω`, `Ω² = −1`, `Q* = Q` | holds | none |
| §3.2 equation and phase | general | `E′ = A′ − iC′ = −izE + (f + ig)(A + iC) = −izE + qE#`; on `ℝ`: `∂ₜlog\|E\| = Re(qe^{−2iφ}) = f cos 2φ + g sin 2φ`, `\|·\| ≤ \|q\|` | holds (norm-free) | none |
| §3.3 | free; `z − i`; `t = 0` | `\|E\|² − \|E#\|² = 4Im(conj A·C) = 4 Im z ∫\|Θ\|²`; `e^{2ty} − e^{−2ty} = 2 sinh 2ty = 4y∫₀ᵗcosh 2sy`; `\|z+i\| > \|z−i\|` on `ℂ₊`; `E = 1` fails | holds | none |
| §4.1 Check | `c = 0.7 + 0.4i`, `T = 1.3` | `\|c\| = 0.80623`, `a = cosh(1.04810) = 1.60141`, `b = (c/\|c\|) sinh = 1.08600 + 0.62057i` | holds | none |
| §4.2, §4.3 Checks | `q = 1` on `[0,1]`, `z = ±5i` (closed form `G = diag(e^{−izt}, e^{izt}) exp(tN)`) | `\|a(1,5i)\| = 1.09337 ≤ cosh 1 = 1.54308`, `\|b\| = 0.10826 ≤ sinh 1 = 1.17520`; `\|a(1,−5i)\| = 237.03 < \|b\| = 2384.6` | holds | none |
| §5.3 boundary concatenation | algebra; `ρ₁ = ρ₂ = 1/2`, `u = 1` | `b/a = (uρ₂ + ρ₁)/(1 + uρ₂ conj ρ₁)` with `u = e^{2ixT}conj(a₁)/a₁`; `\|a\|² − \|b\|² = (\|a₂\|² − \|b₂\|²)(\|a₁\|² − \|b₁\|²) = \|a₂\|² − \|b₂\|²`; `q⌃* = 4/5`, both sides of the pseudo-hyperbolic identity `9/25`; `1 + δ ≤ \|a₂\|²`, `∫log(1+δ) ≤ π‖q_{>T}‖² → 0` | holds | none |
| §5.6 first-order bound | `q = 0.4cos 5s + 0.3i` on `[0,1]` | `L = 0.400569`, `sinh L − L = 0.010799`, `L(cosh L − 1) = 0.032569`, bound `0.043367` (README `≈ 0.0434`); route `\|(b − ∫qe)/a\| + \|∫qe\|\|1/a − 1\| ≤ (sinh L − L) + L(cosh L − 1)` with `\|∫qe^{2izs}\| ≤ L` | holds | none |
| §5.6 rules and Fourier convention | modulation, dilation; `x = 0.7`, `s = 1.3` | coefficient of `qe^{2iξ·}` is that of `q` at `z + ξ`; `s = r/λ` turns `λq(λ·)` at `(t, z)` into `q` at `(λt, z/λ)`; `e^{2ixs} = −0.24663 + 0.96911i = e^{−2πis(−x/π)}` | holds | none |
| §6.1 kernel formula | `E = A − iC` | `E(z)conj E(w) − E#(z)conj E#(w) = 2i(A(z)conj C(w) − C(z)conj A(w))` | holds | none |
| §6.2 | `e^{itz}E = a + b`; free; constant `f = c` | `\|a + b\| ≥ (\|a\| − \|b\|) ≥ 1/(\|a\| + \|b\|) ≥ 1/(2cosh L)`; `K_t(x,x) = (1/π)∫₀ᵗ(cos² + sin²) = t/π`; weight `e^{−2ct}` at `x = 0` within `e^{∓2ct}`; kernel `(1/π)∫Θ(w)*Θ(z)` from the `(1,1)` entry of Christoffel–Darboux | holds | none |
| §6.3 weight derivative | on `ℝ` | `∂ₜ\|E\|^{−2} = −2\|E\|^{−2}Re(q conj E/E) = −2Re(q/E²)`; `\|F\|²/E² = (F/E)(F#/E)` | holds | none |
| §6.5 Checks | `f = c = 0.4` on `[0, 1.3]`, `x = 0` | `m(0) = ie^{−1.04} = 0.353455i`, `w = e^{−1.04}`, `w̃ = e^{1.04}`, `ww̃ = 1`; `w̃ = w/\|m\|²`, `ww̃ = (Im m)²/\|m\|² ≤ 1`, strict iff `Re m ≠ 0`; compact support `Im(−Ẽ/E) = (AD − BC)/\|E\|² = 1/\|E\|²` | holds | none |
| §6.7 transport | `σ = Π/π`, `ν` from `μ` | `dσ/dν = 1/w`, `S = ∫log w dσ = (1/π)∫log w dΠ`; `w = 0` on positive measure gives `σ ⋠ ν` and `−∞` | holds | none |
| §6.8 | truncation | `\|E(T,x)\| = \|a + b\| ≤ 2\|a\|`; `∫log w_T dΠ ≥ −2πlog 2 − 2∫log\|a\|dx = −2πlog 2 − π‖q_T‖²`; `f = c` on `[0,T]`: `log w(0) = −2cT`, `e^{cT} ≤ 2cosh cT` | holds | none |
| §7.2 Check | `θ = b_{10i}`, `ε = 1/2` | `\|θ′(x)\| = 20/(x² + 100)`: `0.2`, `0.16`, `0.1` at `x = 0, 5, 10`; ratios `1.25`, `2`; radius `3·10/(1/2) = 60 ≥ 10` | holds | none |
| §8.1 | `γ(1)`; `\|γ sin(a + ip)\|²`; zeros | `√2/√(sinh 2) = 0.742591`; `2(sin²a + sinh²p)/sinh 2p ∈ [tanh p, coth p]`; `s − i/(2t)`: `1/(2t) ≤ 1/t` so `t ∈ T₀(s,1)`, `−1/(2t) > −1/t` so `t ∉ T₁(s,1)`; `s − 2i/t`: in `T₀(s,3) ∩ T₁(s,3)` | holds | none |
| §8.2 route | `fₙGₙ` | `H²` membership of `e^{iz}fₙGₙ` with `Gₙ` unbounded outer: not provided by Layer 2 | unowned | R01 |
| §8.3 expansion | reproducing property | `‖K − S/w‖²_μ = K(λ,λ) − 2S(λ,λ)/w + ‖S‖²_μ/w²`, `‖S‖²_μ = wS(λ,λ)(1 + o(1))`, total `K(λ,λ) − S(λ,λ)/w + o(t) = o(t)` by §8.2 since `S(λ,λ) ≍ t` on `Q(s, C/t)`; with `S/√w` the leading term is `S(λ,λ)(1/√w − 1)²` | holds | none |
| §8.4 route | `F = e^{itz}GΔ` | `e^{itz}Δ ∈ H²` (§2.7), `∫\|Δ\|²w ≤ ∫\|Δ\|²dμ = o(t)`; membership of the product not provided | unowned | R01 |
| §8.5 | box diameter | `π\|λ − z\| ≤ 2√2πC/t`, `o(t)·O(1/t) = o(1)`; free `D = sin(t(λ − z))` | holds | none |
| §8.7 | free; `γ(p)sin(A + ip)` at `A = 0.3 + 0.2i`, `p = 2, 4` | `e^{−itz}(1 + i·i) = 0`; relative error against `ie^{−iA}`: `0.01214`, `0.000225`, below `e^{2\|Im A\| − 2p} = 0.02732`, `0.000500`; new constant `−αe^{itx(t)}`, unimodular | holds | none |
| §8.7 (1) ⇒ (2) | `t ∉ T₀` | `z(t)` has `Im < −C(t)/t`, so `ty(t) > C(t) → ∞` | holds | none |
| §9.1 subinterval data | `M_{t₁→t₂} = M(t₂)M(t₁)^{−1}`, `det = 1` | `(E′ + iẼ′)/2` expanded entrywise equals `(E(t₂)Ẽ#(t₁) − Ẽ(t₂)E#(t₁))/(2i)` (all eight terms match); `t₁ = 0`: `(E + iẼ)/2`, `(E − iẼ)/2`; `t₁ = t₂`: `a = 2i/(2i) = 1`, `b = 0` | holds | none |
| §9.4 | zero interval | `E′ = −izE` on it, so `E*(t₁ + β) = e^{−iβz}E(t₁)` | holds | none |

**Duplication audit (by object).** `roadmaps grep` over main and the open roadmap pull requests (index of 2026-11-06): "de Branges", "Hermite–Biehler", "non-linear Fourier", "Dirac system" occur in no other roadmap; "outer function" only as a substring elsewhere; "Weyl function" only in bibliographic lines (AutomorphicSpectralTheory, FunctionFieldArithmetic); "Hardy space" in NoncommutativeIntegration (martingale Hardy spaces), StochasticCalculus S6.5.3 and ToeplitzOperators Layer 1 (the unit disc), the last two named in Scope as not consumed; "Paley–Wiener" in AutomorphicSpectralTheory §1.6, whose target `euclidean_paley_wiener` is the smooth compactly supported Paley–Wiener theorem on a finite-dimensional real vector space (rapid decay on the imaginary axis), not §2.7's `L²` theorem (its own Check notes that `1_{[−1,1]}` is excluded), and Layer 6 (real reductive groups); "Liouville's formula" in IncompressibleFlows (draft, continuous coefficient, not in the merge order). Mathlib and Tau Ceti at the pins have none of the roadmap's carriers; what they have is cited in the contracts (list above) and generalised with the pinned case as a Check. The roadmap is the owner of everything it states. Ownership against open pull requests was checked through the `roadmaps grep`/`show` index; the board's three packages under review (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated.

**Headline theorems for the package stage** (no Lean file at the design stage): the non-linear Carleson theorem (§9.8), the non-linear Plancherel identities (§4.4, §5.4), the Szegő condition (§6.8) and the Carathéodory theorems with holomorphic parameter (§1.2, §1.6). All are statable at the pins with real-bodied definitions (the fundamental matrix as the continuous matrix-valued solution of its Volterra equation, `a`, `b` through the dictionary, the transform as the limit of `b/a`); R02's carrier choice (`EuclideanSpace ℂ (Fin 2)`) should be settled before the Lean file fixes the carrier.

## Not verifiable

- garnett2007 (paywalled, `uncertified`): Ch. I §§3–5 and Ch. II §§1–4, cited by locator through mauth2022's page references; the README's routes in Layer 2 are self-contained except for the step of R01, whose standard proof is the one the repair states.
- coddingtonlevinson1955, debranges1968, remling2018, krein1955 (waived): cited by locator only.
- The §9 argument of poltoratski2024 arXiv v14 (the route after the error mnatsakanyan2022 reports in the published Lemma 11): not re-examined this round beyond §9.1 and §9.4 (table); round 2's position stands, the design states it as targets with the source's route.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` exists at the design stage).

## Source issues

- **Error** in poltoratski2024 at (5.5), line 545–548, printed p. 14: the source says the `L¹(ℝ)` norm of `log|a(t,·)|` equals the squared `L²(0,t)` norm of `f` with constant `1`; it should be `π/2` times that norm in the normalisations of (1.1) and (5.2) (re-read this round; the value `π/2` was recomputed in round 2 and is the roadmap's convention); affects a stated result (used only qualitatively in the source). Already recorded by the round-2 review; the same constant is printed in mauth2022 (4), line 206–207.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1442fdcf0b611fa42550f0baa839d336ef9d9b3e", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~3", "model": "fable", "worker": "chris-x9"} -->
