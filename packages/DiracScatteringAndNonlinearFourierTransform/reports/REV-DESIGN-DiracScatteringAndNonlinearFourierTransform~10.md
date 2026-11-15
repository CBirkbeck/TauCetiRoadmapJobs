<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6898271974 -->
Review (claude) of a392d53

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.4 Check: the two outer functions agree on more than "the integral vanishes"

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 1410–1412, and the
   same string in `design/plan.json` (target 5.4, tests): "differs from it by `e^{−(i/π)∫ x h/(1+x²)}`, which is
   `1` exactly when that integral vanishes, as for real `q`".

   Claim: `O_h = O⁰_h` if and only if `∫ x h/(1 + x²) dx = 0`.

   Witness: `e^{−(i/π)I} = 1` if and only if `I ∈ 2π²ℤ`. For `q = 0.3 e^{2iξs} 1_{[0,400]}` (modulation rule of
   §4.1, `h(x) = h₀(x + ξ)`), `I(ξ)` is `12.5419` at `ξ = −0.25` and `21.7051` at `ξ = −0.5`; `2π² = 19.7392` lies
   between, so some `ξ` gives `I = 2π² ≠ 0` and factor `1`.

   Repair (README and the mirrored test of plan.json 5.4): replace the clause by "which is `1` exactly when that
   integral is an integer multiple of `2π²`. For real `q` the integral is `0`, because `log|a(∞, ·)|` is even;
   for `q = 0.3 e^{2iξs} 1_{[0,400]}` it is `≈ 12.54` at `ξ = −0.25` and `≈ 21.71` at `ξ = −0.5`, so it equals
   `2π² ≈ 19.74` for some `ξ` in between, where the two outer functions coincide although the integral does not
   vanish". Tested on the instance: `e^{−(i/π) · 2π²} = e^{−2πi} = 1`. The statement of §5.4 itself
   (`a(∞, ·) = O⁰_{log|a(∞, ·)|}`) is unaffected.

One finding, P3 (a Check whose "exactly when" fails in one direction), with a written repair, so the verdict
asks for changes. No P1 or P2. All three findings of round 9 are repaired. The dependency check shows no
UPWARD or CYCLE line. Declared supplier gaps: none. Elaboration: not available (this lane does not elaborate); the design stage
has no `Suggested.lean`, so the padding probe and the `#check` comparison do not apply.

## Verified sound

**Repairs of round 9, finding by finding.**

- **F01 (P2), Weyl's alternative owned by UnboundedOperators — repaired.** Scope, line 94–99: "the minimal and
  maximal operators of the Dirac expression … to OperatorTheory/UnboundedOperators §4.8 (UO-D07) … §6.4
  consumes the alternative and adds that `∞` is a limit-point endpoint". §6.4 route, line 1581–1586: "`∞` is a
  limit-circle endpoint by the alternative of OperatorTheory/UnboundedOperators §4.8". New contract, line
  441–450; §1.2 Check, line 522–526; *Needs:* line 1588–1589; Layer 1 and Layer 6 Dependencies; Downstream
  consumers no longer name UnboundedOperators; plan.json `suppliers` has the third entry and 6.4's
  prerequisites read `roadmap:OperatorTheory/UnboundedOperators §4.8`. The supplier was opened on main
  (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` line 836–886): the expression `Ju′+V(r)u` with
  `J=[[0,−1],[1,0]]` and locally integrable Hermitian `V` at line 861–863, the alternative with its
  independence of the parameter at line 876. Dictionary recomputed (table).
- **F02 (P3), §6.3 parametric lemma — repaired.** Line 1523–1535: the integrated route through
  `LipschitzWith.comp_absolutelyContinuousOnInterval`, `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`
  and `MeasureTheory.intervalIntegral_integral_swap`; *Needs:* line 1537–1538; first Check line 1542–1545.
  The three declarations were opened at the pin (below); `integral_deriv_eq_sub` is for `f : ℝ → ℝ`, and it is
  applied to the real function `r ↦ |E(r, x)|^{−2}`. Identity recomputed (table).
- **F03 (P3), §1.7 Carathéodory composition — repaired.** Line 661–666: "Tau Ceti
  `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous` applies with the parameter space `E` (the
  ball `B`)"; contract line 331–336; *Needs:* line 668. The pinned statement (hypotheses `hu`, `hg`,
  `hg_cont : ∀ t, Continuous (g t)`) is as described; the replacement on a null set is what `hg_cont` needs.

**Repaired patterns in the rest of the design.** An object owned on main and not cited: searched by object
(below), none further. A pinned lemma whose hypothesis fails where it is named: the two remaining uses of
`hasFDerivAt_integral_of_dominated_of_fderiv_le` (§1.6, §2.1) differentiate in a holomorphic parameter, where
the integrand is differentiable at every `z` of a neighbourhood for almost every integration point; the
real-valued-only lemmas `IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral` (§1.1, for
`v = ∫βu`) and `integral_deriv_eq_sub` (§6.3) are applied to real functions; `tendsto_halfSpacePoissonIntegral`
(§2.5) is applied to bounded continuous data. A *Needs:* item that names a step and no declaration: none.

**Principles.** No route-specific shortcut (Layers 1–6 for complex potentials, the headline at the generality
of its source); three suppliers, all earlier or on main; own words with locators; no algorithm; no
`Suggested.lean` at this stage. LaTeX delimiters, process words, pull-request numbers, machine paths: none
(grep). plan.json: `gaps: []`, nine layers, 57 targets; every target statement, API statement and test occurs
in the README up to line wrapping (script, 0 misses); 57 `**Checks.**` blocks, none with fewer than three
bullets; every numbered section has a locator and a *Needs:* line; every layer ends with `### Examples` and
`### Dependencies`.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

**Supplier citations resolved this round.** OperatorTheory/UnboundedOperators §4.8 on main (line 836, as
above). AutomorphicSpectralTheory §0.5 at the head of its open pull request (README line 181–197: `Im F≥0`,
kernel `(t−z)⁻¹−t/(1+t²)`, unique triple with `a=Re F(i)`, `b≥0`, `dν=(1+t²)dρ`): as cited.
AnalyticNumberTheoryPartI §0.23 on main (line 644–650: `n=floor ρ`, `Σ|α|^(−n−1)<∞`,
`f=z^m exp(h)∏E_n(z/α)`, `deg h ≤ n`): as cited. PDE §6.2 (main, line 2252), StochasticCalculus S6.5 and
OperatorTheory/ToeplitzOperators Layers 1–2 headings exist as named. `roadmaps resolve` (worker's run): nothing
found nowhere. No supplier is on the never-cite list.

**Pinned declarations opened this round** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`; file and line as the README
gives them, each found at that line). Mathlib: `MeasureTheory.intervalIntegral_integral_swap`
(`MeasureTheory/Integral/Prod.lean` 486, hypothesis integrability for `(volume.restrict (uIoc a b)).prod μ`),
`integral_integral_swap` (481); `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` (227, `f : ℝ → ℝ`),
`.const_of_ae_hasDerivAt_zero` (171); `AbsolutelyContinuousOnInterval` (155),
`LipschitzWith.comp_absolutelyContinuousOnInterval` (344),
`IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral` (451);
`hasFDerivAt_integral_of_dominated_of_fderiv_le` (222); `TendstoLocallyUniformlyOn.differentiableOn` (136);
`PhragmenLindelof.right_half_plane_of_bounded_on_real` (717); `Measure.ext_of_charFun` (257);
`ConvexOn.map_integral_le` (196); `lintegral_lintegral_swap` (1102); `lintegral_liminf_le` (237);
`HarmonicAt.differentiableAt_complex_partial` (35); `bounded_harmonic_on_complex_plane_is_constant` (52);
`WeakDual.isCompact_closedBall` (270); `ContractingWith` (42); `span_fourier_closure_eq_top` (244);
`FiniteMeasure.tendsto_iff_forall_integral_rclike_tendsto` (748); `poissonKernel` (54);
`HarmonicOnNhd.circleAverage_poissonKernel_smul` (92); `IsPicardLindelof` (80);
`ODE_solution_unique_of_mem_Ioo` (279); `VitaliFamily.ae_tendsto_rnDeriv` (658),
`ae_tendsto_lintegral_enorm_sub_div` (819), `ae_tendsto_average` (856); `TendstoInMeasure` (57),
`exists_seq_tendsto_ae` (266), `tendstoInMeasure_of_tendsto_eLpNorm` (445); `fourier_real_eq` (483);
`Lp.fourierTransformₗᵢ` (51); `klDiv` (56), `klDiv_of_not_ac` (66), `klDiv_self` (74),
`integral_llr_add_sub_measure_univ_nonneg` (147), `mul_log_le_klDiv` (355);
`measure_limsup_atTop_eq_zero` (62); `taylor_mean_remainder_lagrange` (330); `Real.contDiff_sinh` (317);
`Matrix.det_apply` (66), `trace_mul_comm` (156), `mul_nonsing_inv` (209); `HasFDerivAt.comp_hasDerivAt` (375);
`HasFDerivAt.restrictScalars` (54); `EuclideanSpace.equiv` (296). Tau Ceti:
`MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous` (41); `Matrix.hasFDerivAt_det` (110,
`IsUnit A.det`), `fderiv_det_apply_adjugate` (75), `Matrix.det_exp` (75); `halfSpacePoissonKernel` (122),
`_pos` (147), `harmonicOnNhd_halfSpacePoissonKernel_left` (177), `_le_mul` (198);
`integral_halfSpacePoissonKernel` (135), `halfSpacePoissonIntegral` (179), `tendsto_…` (297),
`harmonicOnNhd_…` (419); `maximalFunction` (125), `mul_measure_lt_maximalFunction_le` (353),
`lintegral_rpow_maximalFunction_le` (439); `norm_convolutionLp_le` (117), `convolutionLp_ae_eq_convolution`
(197); `herglotzTransform` (138), `herglotzTransform_zero` (150); `cayleyPushforward` (176),
`integral_circle_eq_atom_add_integral_cayleyPushforward` (188), `I_mul_herglotzTransform_cayley_eq` (404),
`exists_isFiniteMeasure_eq_nevanlinnaKernel_add` (436); `Lp.dualOneEquiv` (102);
`AnalyticOnNhd.le_circleAverage_log_norm` (76), `eqOn_const_ball_of_tendsto_circleMap` (198);
`harmonicOnNhd_of_setAverage_ball_eq` (69); `upper_half_plane_of_isBounded` (33);
`bijOn_sub_I_div_add_I_upperHalfPlaneSet` (171); `hasDerivAt_wedgeIntegral_upperHalfPlane` (118);
`klDiv_eq_iSup_…_integral_exp_sub_one` (457), `lowerSemicontinuous_klDiv_finiteMeasure` (499); the two
Carathéodory theorems (196, 219), `le_mul_exp_of_le_add_mul_integral` (59), `dysonSeriesLeft` (165),
`hasDerivAt_dysonSeriesLeft` (281); `HardySpace` (43). Every name exists at the pin, at the stated line.

**Sources, the seeded sample** (each read at the cited line; the author flags no locator as unverified).

- §1.4: romanov2014 line 218–219 (`det ≡ 1` for the fundamental solution): as cited; coddingtonlevinson1955
  waived.
- §2.3: poltoratski2024 line 615–622 (the sector `|Re(z − x)| < Im z < 1` and its maximal function);
  mauth2022 line 411–420, Lemma 5 and Corollary 1 line 421–427, Lemma 6 line 430: as cited.
- §2.4: mauth2022 Lemma 4 line 404, Lemma 7 line 434: as cited; garnett2007 uncertified.
- §2.6: mauth2022 line 337–358, Lemma 1 line 359–369, Lemma 2 line 370–377 (constant `(2/(πy))^{1/p}`, weaker
  than `1/(4πy)` at `p = 2`, as the README says), Lemma 9 line 469, Lemma 11 line 487: as cited.
- §4.4: poltoratski2024 (5.5) line 545–548 (constant `1`); denisov2006 (194) line 3250–3255 (constant `π`);
  taothiele2012 Lemma 6 line 680–683: as cited.
- §5.2: poltoratski2024 line 550–560; mauth2022 line 190–201: as cited.
- §5.4: poltoratski2024 line 567–577 (outerness, `|a| = (1 − |f⌃|²)^{−1/2}`, `b = a f⌃`); mauth2022 line
  206–210; denisov2006 Theorem 11.1 line 3246–3255: as cited.
- §6.1: poltoratski2024 line 209–235 and (2.4) line 245–249; mauth2022 line 490–524, Lemma 12 line 509,
  Lemma 20 line 735; romanov2014 Theorem 5, (16) and (18), line 812–821: as cited; debranges1968 waived.
- §6.8: poltoratski2024 line 263–268; mauth2022 Theorem 3 line 702–707; denisov2006 Theorem 11.1 line 3246:
  as cited.
- §8.7: poltoratski2024 Corollary 3 line 1002–1012, the argument from line 918, the definition of `T₁` line
  997–1001; mauth2022 Corollary 6 line 1397: as cited.
- §9.2: poltoratski2024 (9.2) line 1306, (9.3) line 1319, (9.4) line 1339, the quotient line 1345–1347: as
  cited.
- §9.3: poltoratski2024 Lemma 9 line 1350–1377: as cited (statement, the set `Zₙ`, the middle thirds, the
  cover of index two, the summation).
- §9.4: poltoratski2024 line 1380–1388, (9.8) line 1476–1481, line 1518–1520: as cited.
- §9.5: poltoratski2024 Lemma 10 line 1584–1600: as cited.
- §9.8: poltoratski2024 Theorem 1 line 578–586, line 54–57; mauth2022 Theorem 2 line 216, Theorem 5 line
  3820, proof line 3851–3862: as cited. Also read: Lemma 8 line 1116–1138, which prints the factor at `ty`
  in (8.5), as §8.9 says.

**Adversarial table** (hand algebra and plain Python in the scratch directory; values computed this round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions dictionary `J = −Ω`, `V = −Q_q`, `λ = −z` | `JΩ`; free case `t = 1.3`, `z = 0.6 + 0.25i` | `JΩ = 1`; `u′ = Ω(λ − V)u = −Ω(z − Q_q)u`; solution from `(1, 0)`: `(0.74879 − 0.23261i, 0.74075 + 0.23514i) = (cos tz, sin tz)`; `λ = z` gives `(cos tz, −sin tz)` | holds | none |
| §1.2 fixed-parameter Check | `V = 0`, `λ = −z` and `λ = z` | columns `[[cos, −sin], [sin, cos]]`; transpose under `λ = z` | holds | none |
| §1.1 | `α < 0`; `β = 0` | `v′ ≤ β(α + v)` gives `v ≤ α(e^B − 1)` for any real `α`; `u ≤ α` | holds | none |
| §1.4 Liouville (sample) | `A = [[1,1],[0,1]]`, `t = 0.8`; Dirac coefficient | `det e^{tA} = 4.953032 = e^{1.6}`; `tr(−Ω(z − Q_q)) = f − f = 0` | holds | none |
| §1.7 local form | the Check's `F` (`1` for `t < 1`, `2√(max(x − 1, 0))` after) | on `B = [−1, 1]`: `L = 0`, `∫m = 1 = r`; `(1 + (t − 1)²)′ = 2(t − 1) = 2√((t − 1)²)`; two solutions when the inequality is an equality | holds | none |
| §2.3 (sample) | cone comparison; `h = 1_{[0,1]}`, `x = 2`; ratio | `(s − x)² + y² ≤ 2(s − x′)² + 3y²`; `A² = max(2, 1 + 2α²)`; `0.102416`; maximal function `1/4`; `5/2.0201 = 2.47512`; `((1 + √5)/2)² = 2.61803` | holds | none |
| §2.4 (sample) | `h = 1_{[0,1]}` along `−y/2 + iy` | `1/2 − arctan(1/2)/π = 0.352416 ≠ 1/2` | holds | none |
| §2.6 (sample) | `F = 1/(z + i)`; kernel norms | `‖(x − z)⁻¹‖² = π/Im z`, so `|F(z)|² ≤ ‖F‖²/(4π Im z)`; `|F(i)|² = 1/4 = π/(4π)`; `∫ P² = 1/(2π Im z)`; `∫_{−3000}^{3000} Re (x + i)^{−2} = −0.000667 = −2/3000` (limit `0`) | holds | none |
| §2.8 | `h = log|x + i|` | `P[h](i) = log 2`, `O_h(i) = 2 = −i(2i)`; `π e^{2y}/(y + 1)` unbounded | holds | none |
| §3.1–§3.3 | free; `f = c`; `q = ic`; derivative of `M_λ*ΩM_z` | `−Ω(z − Q) = [[f, −z − g], [z − g, −f]]`; `(M_λ*ΩM_z)′ = (z − conj λ)M_λ*M_z`; `|E|² − |E#|² = 4 Im z ∫|Θ|²`; free: `2 sinh 2ty` both sides | holds | none |
| §4.1 | dictionary; concatenation; `c = 0.7 + 0.4i`, `T = 1.3` | `a′ = e^{2izt}q b#` from `E′ = −izE + qE#`; `Λ = diag(e^{2izs}, 1)`; `a = 1.601407`, `b = 1.086000 + 0.620571i`, `|a|² − |b|² = 1.0000000` | holds | none |
| §4.2–§4.3 | `q = 1_{[0,1]}` at `±5i`; grid for `q ∈ {1, 0.3 + 2i, 3}` | `1.093368`, `0.108261`; `237.0277`, `2384.600`; `min(|a|² − |b|²) = 0.99999999999997` | hold | none |
| §4.4 (sample, headline) | `q = 1_{[0,1]}`; `q = 0.5 + 1.2i` on `[0, 0.7]` | `∫_{−2000}^{2000} log|a| = 1.570546` (tail `≈ 0.00025`) vs `π/2 = 1.570796`; `1.857830` vs `1.858252`; `y(a − 1) = 0.485320`, `0.498727` | holds | none |
| §4.5 | algebra | `r′ = 2izr + conj q − qr²`; `∂ₜ(|a|² − |β|²) = 4 Im z|β|²`; `ρ′ = qe^{2izt}/a²` | holds | none |
| §5.1 | bounds | `‖r‖₂ ≤ 2 · (1/(2y))‖q‖`; tail `(∫_t^∞ e^{−4ys})^{1/2} = e^{−2yt}/(2√y)` | holds | none |
| §5.2 (sample) | `q = 1_{[0,1]}`; `c = 0.5 + 1.2i`, `T = 0.7`, `x = 1.9` | `ρ(0) = 0.761594 = tanh 1`; `sup_x |ρ| = 0.761594` at `x = 0`; both forms of `|q⌃*|²`: `0.374564` | holds | none |
| §5.3 | concatenation at the boundary; `ρ₁ = ρ₂ = 1/2`, `u = 1` | `conj b₁/a₁ = conj ρ₁ · conj a₁/a₁`; `4/5`, `9/25` | holds | none |
| §5.4 (sample, headline) | route; scaling; the third Check | `(1 − ab)² ≥ (1 − a²)(1 − b²)` and Cauchy–Schwarz bound the logarithmic term; `‖q_λ‖² = λ‖q‖²`; factor `1` iff `I ∈ 2π²ℤ`: `I = 12.5419`, `21.7051` at `ξ = −0.25`, `−0.5`, mass `56.5487 = (π/2)(0.09)(400)` | statement holds; Check overstates | R01 |
| §5.5 | algebra | `|q⌃* − ρ₁| = |ρ₂|(1 − |ρ₁|²)/|1 + uρ₂ conj ρ₁| ≤ 2|ρ₂|`; `∫|1 − g|² dΠ ≤ 2π(1 − Re g(i))` | holds | none |
| §6.1 (sample) | `E = z + i` at `w = 2 + i`, `z = −1 + 3i`; `E = e^{−itz}` | `K = 0.318310 = 1/π`; `sin(t(conj w − z))/(π(conj w − z))` | holds | none |
| §6.3 integrated identity | `q = 1_{[0,1]}`, `x = 0.7`, `s = 0.3`, `t = 1.6` | left `−0.3916705841`, right `−0.3916705841`; derivative `−2 Re(q/E²)` from `∂ₜ log|E| = Re(qE#/E)` | holds | none |
| §6.4 | radius; free disc; `f = 1_{[0,1]}` at `z = i`; limit-point route | Apollonius radius `2/(|E|² − |E#|²) = 1/(2 Im z ∫|Θ|²)`; `1/sinh 0.85 = 1.045898`, centre `1.447033i`; `m(i) = 0.443190i`; at `z = 0`, `1 = det[Θ, Φ] ≤ |Θ||Φ|` not integrable | holds | none |
| §6.5 | `f ≡ 1`; Herglotz coefficients | eigenvector `(z, 1 − iκ)`: `m = (1 + iκ)/z`, `Im m(i) = √2 − 1`; coefficient of `ξᵏ`: `2∫ ζ̄ᵏ dν`; `Im(−Ẽ conj E) = 1` on `ℝ` | holds | none |
| §6.7 | `μ = 2dx`; barrier `f = 0.7`, `T = 1.3` | `1 − log 2`; `(1/π)∫ log w dΠ = −0.918466` (quadrature) `= 2T − 2 log|E(T, i)| = −0.918466`; mass `0.537539` | holds | none |
| §6.8 (sample, headline) | route; the barrier | `|E| ≤ 2|a|` on `ℝ`, `dΠ ≤ dx`, `log|a| ≥ 0`; `−0.918466 ≥ −2 log 2 − 0.49 · 1.3 = −2.023294` | holds | none |
| §7.2 | Apollonius step; `b_{10i}` | `√(1 + ε) − 1 ≥ ε/(1 + √2) ≥ ε/3`; `0.2`, `0.16`, `0.1` | holds | none |
| §7.3 | Riccati, complex form | `θ′ = 2izθ + conj q − qθ²`; `θ̃(0) = i/(−i) = −1` | holds | none |
| §8.7 (sample) | `A = 0.4 + 0.3i`, `p = 3, 6` | `|γ(p) sin(A + ip) − ie^{−iA}| = 1.8·10⁻³`, `4.6·10⁻⁶`; free case `e^{−itz} + i·i·e^{−itz} = 0` | holds | none |
| §8.8–§8.9 | determinant of the two approximants; `g′` | `2i cos Φ/√(w w̃)`; `2/√0.63 = 2.5198`; `g′ = t cos(t(x̃ − x))/cos²`; `sinh 3.04/sinh 3.0 = 1.0410`, so `2.082i` | holds | none |
| §9.1 | `t₁ = 0`; `t₁ = t₂`; derivation from `M(t₁)⁻¹` | `(E + iẼ)/2`, `(E − iẼ)/2`; `1`, `0`; `D₁ − iB₁ = −iẼ₁#`, `iA₁ − C₁ = iE₁#` | holds | none |
| §9.2 (sample) | the Check's data, `α₁ = e^{0.4i}`, `α₂ = e^{−1.1i}` | determinant at one time `2i`; closed forms off by `2.3·10⁻¹⁶`, `1.1·10⁻¹⁶`; `|a|² − |b|² = 1.0000000000000002`; `sinh²A − sinh²B = sinh(A + B) sinh(A − B)` | holds | none |
| §9.3 (sample) | `υ = 1`, `Im e = 0` | `0` at `p = s`; `0.000378700` at shift `0.1`; mean `0.000126421`; sweep `(2ⁿ/(3m))(C/2ⁿ) = C/(3m)` | holds | none |
| §9.4 (sample) | translation rule | `α₁*² = e^{−2iβs}α₁²` gives `sin e*/sin(e* + 2iυ) = e^{2iβs} sin e/sin(e + 2iυ)`; period of `e^{2iβs}` in `β`: `π/|s|` | holds | none |
| §9.5 (sample) | `υ = 1, 0.5, 2`; `Δ = 0.02, 0.01, 0.005` | `2.4204, 2.3250, 2.2792` → `2 cosh 1/sinh² 1 = 2.234571`; `8.33` (at `Δ = 0.0005`, limit `8.305`), `0.5729` (limit `0.572`); `Δ₁ = 0.0102697`, `Δ₂ = 0.0105505` | holds | none |
| §9.7 | (2.2) on `ℝ`; `w = 0.7`, `w̃ = 0.9` | `(conj β − β)/√(w w̃) = 2i` iff `Im β = −√(w w̃)`; `|a|² = 1.134921 = (1/w + 1/w̃ + 2)/4`; `|b|² = 0.134921` | holds | none |
| §9.8 (sample, headline) | route; same `w`, `w̃` | `b/a = (E − iẼ)/(E + iẼ) → (1/√w − iβ/√w̃)/(1/√w + iβ/√w̃) = 0.069930 − 0.337625i`, of modulus² `0.1189 = 0.134921/1.134921` | holds | none |

For §2.2, §2.5, §2.7, §8.2–§8.6 and §9.6 the hand derivations made while reading (the mass formula
`πy P[ν](iy) = ∫ y²/(x² + y²) dν`, the odd reflection, `k_t(λ, λ) = sinh(2t Im λ)/(2π Im λ)`,
`2|β|²w = sinh 2ty`, the derivative relation `t/sin(2ity)`) agree with round 9's computed rows, which are
relied on for the rest.

**Duplication audit.** `roadmaps grep` over main and the open heads, by object. "Hermite–Biehler", "Fatou's
theorem", "Hardy space … half-plane": no match. "de Branges": a reference in SpecialFunctionsGamma. "outer
function": other senses (ConvexLifting, DiophantineApproximationAndTranscendencePartII). "nontangential":
StochasticCalculus S6.5 on the disc and ball with normalised arc length, named in the Scope and not consumed.
"Poisson integral": PDE and StochasticCalculus on balls and spheres; the half-space kernel and integral of
bounded data are Tau Ceti's, cited. "Carleson": the linear Carleson project as a reference in PDE; no
non-linear Fourier transform anywhere. "Liouville's formula": IncompressibleFlows, for flows of vector
fields (and on the never-cite list). "Grönwall": StochasticCalculus line 2958 read, a constant rate `c` with
integrable `f`, `g`; §1.1 has an integrable kernel. "Weyl function", "limit point": UnboundedOperators §4.8,
now cited. "Herglotz": AutomorphicSpectralTheory §0.5, cited. "Szegő": orthogonal-polynomial roadmaps, other
objects. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, none is
defined only by an open revision, no second copy. The board packages index was read (AnalyticNumberTheory,
LawrenceVenkateshMethod): no related package. Ownership against the open pull requests was checked with
`roadmaps grep` over the heads of the worker's index.

Overlap check: read PDE, StochasticCalculus, OptimalTransport, OperatorTheory/UnboundedOperators (main), MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, RelativisticQuantumFieldTheory, AutomorphicSpectralTheory (open); Weyl's limit-point/limit-circle alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; the half-space Poisson kernel and integral of bounded data, the maximal function and the weak lower semicontinuity of `klDiv`: owner Tau Ceti, cited; nothing else shared.

**Shape.** Layers named by their mathematics; no sentence says the roadmap follows a source. Layers 1–2 have no
counterpart in the most-cited source; the order of Layers 7–9 is forced (§8.6 needs §7.3, §8.7 needs §7.2 and
§8.6, §9.3 needs §8.8–§8.9), and "Layers 3–5 do not use Layer 6, and Layer 6 does not use Layer 5" was checked
against the *Needs:* lines.

**Headline theorems for the package stage:** the non-linear Carleson theorem with its strong form and the
boundedness of generalised eigenfunctions (§9.8); the non-linear Plancherel identities (§4.4, §5.4); the
Szegő condition (§6.8); the isometric embedding and uniqueness of the spectral measure (§6.6); the linear
Carathéodory theorem with holomorphic dependence on a parameter (§1.2, §1.6); the outer-multiplier theorem
(§2.8).

**Copyright, licences and scope.** Wording: the README was set beside the source at 22 passages: the
locators of the 15 sampled targets, and the Dirac system of the Conventions, the definitions of §9.1 and
§9.4, the statement of §8.9 (Lemma 8), the route of §9.3, the cone of §2.3 and the definition of `T₁` in
§8.1. The longest shared run is about nine words, in the hypothesis of §9.3 (poltoratski2024 line 1350–1352),
a statement the mathematics fixes; "cover of index two" (line 1370) is a term. No sentence of prose or proof
plan is shared; §8.9 and §9.5 are stated with quantifiers and constants of the README's own. Arrangement:
poltoratski2024 has ten sections (§2 from line 170, §3 from 307, §4 from 361, §5 from 469, §6 from 588, §7
from 793, §8 from 1016, §9 from 1173, appendix from 1583). Layers 1–2 ↔ none; Layers 3 and 6 ↔ parts of §2;
Layers 4–5 ↔ §5, placed before Layer 6; Layer 7 ↔ §3–§4; Layer 8 ↔ §6–§8; Layer 9 ↔ §9–§10: not one to one
and not in the source's order. Reuse: no table, figure or list is taken over.

Source independence: 22 passages compared with 5 sources, none shared; largest share poltoratski2024, 70 of 167 locators; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §2.2's only locator is garnett2007.
- poltoratski2024 §9, the "General case" continuity argument (line 1482–1535), was not re-derived; §9.6 states
  its conclusion and names the route. The hypothesis of Lemma 10 (line 1586–1591) is garbled by OCR; §9.5's
  own hypotheses were checked by expansion and numerically instead.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Error** in poltoratski2024 at (5.5), printed p. 14 (line 545–548), repeated in mauth2022 at (4), p. 5 (line 206–207): the source says the `L¹` norm of `log|a(t, ·)|` equals the squared `L²` norm of the potential; it should be `π/2` times it in that normalisation (`1.5705` for `f = 1_{[0,1]}`); affects nothing.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5), printed p. 29 (line 1134–1138), repeated in mauth2022 at Lemma 45, (58): the source says the matched forms keep the factor at the old height `ty`; it should be the factor at the new height `ty′`, as the determinant identity (2.2) forces; affects a stated result.

## For the human reviewers

- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 861–863) asks for "the analogous … endpoint classification API" for `Ju′+V(r)u` without writing the alternative out; this roadmap's contract (design README line 443–450) spells it out and §6.4 relies on it.
- **Scope.** Layer 9's locators are to arXiv version 14 of poltoratski2024; the README's References say mnatsakanyan2022 reports an error in the published proof, which version 14 replaces. The published text was not read.
- **Licence.** poltoratski2024 was read as an OCR text of arXiv version 14; formulas garbled by OCR were recomputed, not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a392d53fcc10e956a89e0e6826549dd93c151f8c", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~10", "model": "fable", "worker": "chris-x81"} -->
