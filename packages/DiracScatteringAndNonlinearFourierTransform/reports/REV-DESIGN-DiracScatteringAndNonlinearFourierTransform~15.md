<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6903185392 -->
Review (claude) of 3ba83c3

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §9.3: the null set must not depend on `C`

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 2284 and 2312–2314
   (and target 9.3 of `design/plan.json`): "Prove that for almost every `s` and every `C > 0` …" and "so
   `lim sup ℓₙ(s)/2ⁿ ≤ 1/m` at almost every `s`, for every `m`".

   Claim: one null set of `s` serves every `C > 0`.

   Witness. The route fixes `C` (the sets `G_N`, the threshold `ε₁(s)` and the constant `c_{m,C}` depend on it)
   and gives a null set for that `C`; the `m` are countably many, the `C > 0` are not. The statement is true:
   `ℓₙ(s)` is nondecreasing in `C`, because `Q(s, C/t) ⊆ Q(s, C′/t)` for `C ≤ C′` while `K`, `T₁(s, K)` and
   `T̃₁(s, K)` do not involve `C`.

   Repair. Add at the end of the route: "The length `ℓₙ(s)` is nondecreasing in `C`, since `Q(s, C/t)` grows with
   `C` and `K` does not depend on `C`; so the statement for `C = 1, 2, 3, …`, with the union of the corresponding
   null sets, gives it for every `C > 0`." Tested on the instance: for `C = 2.5` the intervals counted are among
   those counted for `C = 3`, so `ℓₙ^{2.5}(s) ≤ ℓₙ^{3}(s) → 0`.

The three findings of round 14 (all P3, on the routes of §8.7, §8.8 and §9.3) are repaired, and the repaired
routes were rederived step by step and hold. One finding (P3) remains, R01, on the order of the
quantifiers in §9.3; it carries a repair, so the verdict asks for changes. No statement, hypothesis, id or supplier is in question.
The dependency check shows no UPWARD or CYCLE line. Declared supplier gaps: none. Elaboration: not available
(this lane does not elaborate); the design stage has no `Suggested.lean`, so the one-tactic probe and the
`#check` comparison do not apply. Maintainer notes for this round: none.

## Verified sound

**Repair of round 14, finding by finding.**

- **F01 (P3), §8.8, common height on a growing box — repaired** (with a stronger condition than suggested,
  correctly). Line 2135–2155: "take `C(t)` no larger than a common function of §8.7(1) for `E` and `Ẽ` and with
  `e^{3C(t)}(η_{C(t)}(t) + η̃_{C(t)}(t)) → 0` … Its mean against `e^{2itx}` over a period is
  `(a conj b̃ − conj(b) ã)/(2i)`, hence `conj(b̃)/ã = conj(b)/a + o(e^{−2C})`". `D` no longer occurs.
  Rederived: the sine form has `a = −αγe^{itu}e^{tp}/(2i√w)`, `b = αγe^{−itu}e^{−tp}/(2i√w)`, so
  `conj(b)/a = conj(α)²e^{−2tp}` and `|a|² − |b|² = γ² sinh(2tp)/(2w) = 1/w`; the cosine form has the same ratio
  for every `ũ` and `|ã|² − |b̃|² = 1/w̃`; the constant part is `Im(a conj ã + b conj b̃) = cos(t(ũ − u))/√(w w̃)`.
  With `r = conj(b)/a`, `|r| < e^{−2}`, and `conj(b̃)/ã = r + δ`, `δ = o(e^{−2C})`: `|ã|²` differs from the
  cosine form's by the relative amount `O(η̃ + |δ|)`, and `conj(b̃) − conj(b̃′) = (ã − ã′)r + ãδ`, so the
  coefficients agree to `o(e^{−2C})` and the forms to `o(e^{−C})` on the box. The §8.6 form has error
  `O(e^Cη_C)` because `2|β|²w = sinh(2tp) + O(η)` (from `D(t, conj z₀, z₀) = 2i|β|²`) and `γ(tp)e^{tp} ≤ 2.0186`
  for `tp > 1`. The final move of `tũ` is `O(√(e^C(η + η̃) + e^{2−4C})) = o(e^{−C})`, which is why `e^{3C}` is
  asked. The repair report's objection to the reviewer's `|ã|²w̃ = 1 + o(1)` is right (`1/(1 − e^{−4})` at
  `tp̃ = 1`).
- **F02 (P3), §9.3, three implicit steps — repaired.** (a) Line 2300–2305: "The two times share one `Φ` of
  §9.2. If `w w̃ = 1`, then `Φ = 0`. … this mean is continuous in `t` …, so the sign in `±Φ₀` is constant on
  `Iₙ(s)`". The mean of `cot(a + ip)` over a period is `−i`, so the mean of the quotient of the forms is
  `−i w ± √(w/w̃) sin Φ₀`; the true quotient has `|E| ≥ √(tanh 1)/√w − ε₁` on the period, so the comparison is
  `O(ε₁(s))`; the mean does not depend on the chosen zero. (b) Line 2294–2297 and 2311–2314: the sets `G_N`,
  outer measure and Borel–Cantelli for each `N`. The pigeonhole (`≲ 6m + 1` grid times), `t₂ = t₁ + 2ⁿ/(3m)`
  inside `Iₙ(s)`, `Q(p, 3C/t) ⊆ Q(s, 4C/t)`, the cover of index two and
  `Σ∫_{J} log|a_{t₁→t₂}| ≤ 2 · (π/2)‖f‖²_{L²(2ⁿ,2ⁿ⁺¹)}` were each checked. Quantifying over every `K` as in
  §8.8 is sound because the argument uses outer measure: choosing a bad `K` at each bad `s` still gives a null
  set. (c) Line 2284: "with `K(t)` a function `C(t)` as in §8.8 at `s`". The remaining gap in the order of
  quantifiers is R01.
- **F03 (P3), §8.7, box width — repaired.** Line 2073–2075: "On such a box with `C ≥ 4π`, … makes more than a
  full turn on `ℝ ∩ Q(s, C/t)`, of length `2C/t ≥ 8π/t`, while one turn takes `2π/t`"; the free-case Check
  (line 2105–2108) now fixes `s = 0`, `C ≥ 4π`. `8π > 2π + π/2`.
- **Repaired patterns elsewhere.** "A function as in" replaces "the function of" in §8.7(1) (line 2080) and
  §9.3; no other target names "the" object of an existence statement. No other route combines two `o(1)`
  approximants through (2.2): §9.5 works on constant boxes. `plan.json` targets 8.7, 8.8, 9.3 carry the new
  prerequisites (8.8: 3.2, 6.5, 8.5, 8.6, 8.7; 9.3: 3.1, 3.2, 4.3, 6.8, 8.8, 8.9, 9.1, 9.2 and the Mathlib
  Borel–Cantelli), all in earlier layers or sections.

**Principles.** No route-specific shortcut (Layers 1–2 are stated at full generality: Banach-space values,
Poisson-finite measures); nothing re-planned (three suppliers cited by section; `roadmaps grep` below);
one direction of supply (gate below); own words; no algorithm; no `Suggested.lean`, so no sorry'd data and no
`set_option`. The README was read in full this round (2496 lines).

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Supplier citations resolved this round.** AnalyticNumberTheoryPartI §0.23 (main, README line 644, "Finite-order
Hadamard factorization", with `n = floor ρ`, `Σ|α|^(−n−1) < ∞`, `h` of degree `≤ n`, as the contract says; merge
order line 50). OperatorTheory/UnboundedOperators §4.8 (main, README line 836, "(UO-D07)"; its paragraph on
`Ju′ + V(r)u` with `J = [[0,−1],[1,0]]` and locally integrable Hermitian `V` asks for the analogous endpoint
classification by the first-order integral system, as the contract says). AutomorphicSpectralTheory §0.5 (open
head, a new roadmap folder, "### 0.5 Herglotz representation", line 182: unique triple, `a = Re F(i)`, `b ≥ 0`,
`dν = (1 + t²)dρ`; merge order line 98). Non-supplier mentions: OperatorTheory/ToeplitzOperators Layers 2–5
(main, headings at line 273–713), StochasticCalculus S6.5 (main, line 2246–2310), PDE §6.2 (main, line 2252).
None is on the never-cite list. `scratch/citations.md`: nothing unresolved. Every `*Needs:*` line (55) was read:
each names earlier sections, pinned declarations or one of the three suppliers.

**Pinned declarations opened this round** (38, each found at the cited file and line): Mathlib
`MeasureTheory.measure_limsup_atTop_eq_zero` (`MeasureTheory/OuterMeasure/BorelCantelli.lean` line 62; single
hypothesis `∑' i, μ (s i) ≠ ∞`, no measurability), `MeasureTheory.intervalIntegral_integral_swap`
(`MeasureTheory/Integral/Prod.lean` 486), `AbsolutelyContinuousOnInterval` (155),
`LipschitzWith.comp_absolutelyContinuousOnInterval` (344),
`IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral` (451), `…const_of_ae_hasDerivAt_zero` (171),
`…integral_deriv_eq_sub` (227), `VitaliFamily.ae_tendsto_average` (856),
`hasFDerivAt_integral_of_dominated_of_fderiv_le` (222), `TendstoLocallyUniformlyOn.differentiableOn` (136),
`Real.tendsto_integral_exp_smul_cocompact` (205), `MeasureTheory.Lp.fourierTransformₗᵢ` (51), `fourier_real_eq`
(483), `InformationTheory.klDiv` (56), `InformationTheory.mul_log_le_klDiv` (355), `Measure.ext_of_charFun` (257),
`poissonKernel` (54), `Matrix.toEuclideanCLM` (101),
`ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse` (143), `Complex.orthonormalBasisOneI` (853),
`InnerProductSpace.HarmonicOnNhd.circleAverage_poissonKernel_smul` (92); Tau Ceti
`TauCeti.rouche_exists_eq_zero_iff` (359), `TauCeti.exists_continuousOn_eq_forall_mem_Icc_eq_picard` (196),
`TauCeti.le_mul_exp_of_le_add_mul_integral` (59), `TauCeti.halfSpacePoissonKernel` (122; body
`2⟪v,x⟫ · (n · vol(ball 0 1))⁻¹ · …`, as the README reads it), `TauCeti.halfSpacePoissonKernel_le_mul` (198;
hypothesis `‖y − x₁‖ ≤ A‖y − x‖`, conclusion with `Aⁿ`, the direction §2.3 uses),
`TauCeti.integral_halfSpacePoissonKernel` (135), `TauCeti.tendsto_halfSpacePoissonIntegral` (297),
`TauCeti.maximalFunction` (125), `TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` (499),
`TauCeti.I_mul_herglotzTransform_cayley_eq` (404),
`TauCeti.integral_circle_eq_atom_add_integral_cayleyPushforward` (188),
`TauCeti.PhragmenLindelof.upper_half_plane_of_isBounded` (33), `TauCeti.HardySpace` (43),
`Matrix.hasFDerivAt_det` (110), `TauCeti.eqOn_const_ball_of_tendsto_circleMap` (198),
`DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane` (118), `MeasureTheory.Lp.dualOneEquiv` (102). The
remaining pinned names were paired with file and line in round 13 and no repair touched them.

**Sources, the seeded sample** (each locator read at its line; the author flags none as unverified).

- §1.1: coddingtonlevinson1955 only (waived); the statement was recomputed (table).
- §1.6: romanov2014 line 220–222 (fundamental solution real entire, entire with values in `C[0, x]`): as cited.
- §2.1: poltoratski2024 line 250–254 (Poisson measure, Poisson-finite) and 610–614 (Poisson extension);
  mauth2022 line 378–392 (kernel, Poisson-finite, Lemma 3 harmonicity): as cited.
- §2.6: mauth2022 line 337–358 (definition, `1 < p < ∞`), Lemma 1 line 359–369, Lemma 2 line 370–377 (constant
  `(2/(πy))^{1/p}`, weaker than the README's `1/(4πy)` at `p = 2`, as the README says), Lemma 6 line 430, Lemma 9
  line 469 (one direction only; the README's "onto" rests on garnett2007 p. 84), Lemma 11 line 487: as cited.
- §3.1: poltoratski2024 line 136–166 and (2.1) line 204; mauth2022 (5)–(6) line 546–563, Lemma 14 line 565;
  romanov2014 chain rule line 223–224, identity (12) line 758: as cited.
- §3.2: poltoratski2024 line 186–190, free case line 192–195, (2.2) line 205–208: as cited (mauth2022 locators of
  §3.2 were read in round 14).
- §4.2: taothiele2012 Lemma 5 line 430–433 and the `arccosh` bound line 460–465: as cited, for the discrete model.
- §4.3: poltoratski2024 line 501–507 (`|a|² − |b|² = 1` on `ℝ`, `a` outer, `|b/a| < 1`); taothiele2012 Lemma 3
  line 296: as cited; the closed-half-plane inequality itself is the README's route, recomputed (table).
- §6.3, §6.6: poltoratski2024 line 255–262 (unique Poisson-finite measure with isometric embeddings);
  romanov2014 Theorem 16 line 2283–2286: as cited.
- §6.4: romanov2014 Theorem 15 line 2217–2219 (convergence `m_X → m` on compacts), Lemma 23 line 2370: as cited.
- §6.7: killipsimon2003 (5.9) line 1812–1819, (5.10) line 1831–1834, Lemma 5.1 line 1836–1837, Theorem 5.2 line
  1864, Corollary 5.3 line 1960: as cited.
- §8.4: poltoratski2024 Lemma 4 (6.6) line 756–770; mauth2022 Lemma 22 line 1129–1133: as cited.
- §8.7: poltoratski2024 line 998–1012 (definition of `T₁`, Corollary 3); mauth2022 Corollary 6 line 1397–1408: as
  cited.
- §9.2: poltoratski2024 (9.3) line 1318–1320, (9.4) line 1338–1340, quotient line 1345–1347 read; line 1253–1317
  is garbled by OCR (Not verifiable), and the identities were recomputed exactly (table).

**Adversarial table** (values computed this round, by hand or in plain Python).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 | `α = 2`, `β = 1_{[0,1]}`, `u = 2e^{min(t,1)}`; `β = −1`, `u = ½`, `α = 1`; `α < 0` | `2 + ∫₀^{min(t,1)} 2e^s = 2e^{min(t,1)}`; `½ > e^{−1} = 0.36788`; route `(ve^{−B})′ ≤ αβe^{−B}` gives `u ≤ αe^{B}` for either sign of `α` | holds; negative kernel excluded | none |
| §1.6 | `P = 1/(z − t)`, `z = 3 + i`, `t = ½`; `∂_z N` for scalar `P` | `\|z/(z − t) − exp∫₀^{t} dr/(z − r)\| = 1.2·10⁻¹⁰`; `∫_s^t e^{∫_r^t}∂_zP e^{∫_s^r} = ∂_z e^{∫_s^t P}` | holds | none |
| §2.1 | `C(z)` bound; Cayley identity; `z = 2i`, `x = 1`; `h = Re ζ`; `h = 1/(1+x²)`; dilation | `(1+x²)/((x−a)²+y²) ≤ 2(1+a²)max(1, y⁻²)`; `ζ − w = 2i(x − z)/((x+i)(z+i))`, `1 − \|w\|² = 4y/\|z+i\|²`; `(4/5)/(2π) = 2/(5π)`; `0.3333333333` both; `λP[ν](λz)` | holds | none |
| §2.1 pinned kernel | `n = 2`, `z = 1 + i`, `x = 3` | `2·1/(2π·5) = 1/(5π)`; pole on `ℝ` gives `0` | agrees with the pin | none |
| §2.3 | `\|x′ − x\| < y` | `(s−x)² + y² ≤ 2(s−x′)² + 3y² ≤ 3((s−x′)² + y²)`; `P[1_{[0,1]}](2+i) = 0.10242`; `((1+√5)/2)² = 2.61803` | holds | none |
| §2.6 | `F = 1/(z+i)`; point bound; `∫P(z,x)²dx`; `𝓕(1/(x+i))`; `e^{iz}/(z+i)` at `i` | `‖F‖² = π = 2π·½`; `¼ = π/(4π)`; `1/(2πy)`; residue `−2πi e^{−2πw}` for `w > 0`, `0` for `w < 0`; `−1 − log 2` | holds | none |
| §2.8 | `h = log\|x+i\|` | `(1/π)∫ log(1+x²)/(1+x²) = 1.38614 ≈ 2 log 2`, `O_h(i) = 2 = \|−i·2i\|` | holds | none |
| §3.1 | free; `f = c`; `q = ic`; `q = 1+i`; Christoffel–Darboux | coefficient `[[f, −z−g],[z−g, −f]]`, trace `0`; `(ΩQ)² = \|q\|²·1`; `M(1,0) = [[3.54648, −1.36830],[−1.36830, 0.80988]]`, `det = 1.000000`, norm `e^{√2} = 4.11325`, row sum `4.91478`; `∂ₜ(M*ΩM) = (z − conj λ)M*M` using `Ω* = −Ω`, `Q* = Q` | holds | none |
| §3.2 | `2i(AD − BC)`; equation for `E`; `q = ic`; phase equations; kernel identity | `EẼ# − ẼE# = 2i`; `E′ = −izE + (f + ig)E#`; `c sinh ct + ic cosh ct = ic(cosh ct − i sinh ct)`; `E′/E = −ix + qe^{−2iφ}`; `(Θ(w)*ΩΘ(z))₁₁ = conj A(w)C(z) − conj C(w)A(z)` | holds | none |
| §3.3 | free case | `e^{2ty} − e^{−2ty} = 4y∫₀ᵗ cosh 2sy ds` | holds | none |
| §4.2 | `q = 1_{[0,1]}`, `z = 5i`; exponents of the Dyson terms | `\|a\| = 1.09337 ≤ cosh 1 = 1.54308`, `\|b\| = 0.10826 ≤ sinh 1`; second-order exponent `s − r ≥ 0`, third-order `s − r + u ≥ 0` | holds | none |
| §4.3 | `z = 5i`, `0`, `−5i`; minimisation over `c₂` | `\|a\|² − \|b\|² = 1.18373`, `1.00000`; lower half-plane `237.03 < 2384.6`; `min_r (\|a\| − r\|b\|)² + r² = \|a\|²/(1 + \|b\|²) ≥ 1` | holds; fails below `ℝ` | none |
| §4.4 (headline) | `q = 1_{[0,1]}` | `∫_{−4000}^{4000} log\|a\| = 1.57067` against `π/2 = 1.57080` | holds | none |
| §5.1, §5.5 | tail bounds | `(∫_t^∞ e^{−4ys})^{½} = e^{−2yt}/(2√y)`; `2·(1/(2y)) = 1/y`; `\|ρ₂\|(1 − \|ρ₁\|²)/(1 − \|ρ₁\|) ≤ 2\|ρ₂\|`, so `4π` | hold | none |
| §6.3 | derivative of the weight; `q = 1_{[0,1]}`, `x = 0` | `∂_r\|E\|^{−2} = −2Re(q conj E/(E\|E\|²)) = −2Re(q/E²)`; `e^{−2t} − e^{−2s} = −2∫_s^t e^{−2r}` | holds | none |
| §6.4 | radius; free `t = 1.7`, `y = 0.25`; `f = 1_{[0,1]}`, `z = i` | `2/(\|E\|² − \|E#\|²) = 1/(2y∫\|Θ\|²)`; radius `1.04590`, centre `1.44703i`; `E = cosh√2 + √2 sinh√2`, `Ẽ = −i cosh√2`, `m(i) = 0.443190i`, `−D/C = 0.591892i`, `−B/A = 0.385819i` | interior point, as stated | none |
| §6.5 | `f ≡ 1` truncations; `x = 2` | masses `0.537329, 0.443190, 0.415910, 0.414219 → √2 − 1 = 0.414214`; `Im((1 + i√3)/2) = 0.866025` | holds | none |
| §6.6 (headline) | `F`, `zF ∈ PW_t`; `2dx` | `xF(x) → 0` (Riemann–Lebesgue), so `(1+x²)\|F\|²` extends by `0` at `1` and the atom `β` does not contribute; `2‖F‖² ≠ ‖F‖²` | holds | none |
| §6.7 | `μ = 2dx`; `f = 0.7` on `[0, 1.3]`; `νₙ` | `1 − log 2 = 0.306853`; `ν(X) = 0.537539`, `(1/π)∫log w dΠ = −0.918466`, `klDiv = 0.456005 ≥ 0.158293`; `0.693146` at `n = 3` against `log 2` | holds | none |
| §6.8 (headline) | free; `f = c` at `x = 0` | `0 ≥ −2π log 2`; `e^{cT} ≤ 2 cosh cT` | holds | none |
| §7.2 | Apollonius radius | `1/(√(1+ε) − 1) = (√(1+ε) + 1)/ε < 2.4143/ε < 3/ε` | holds | none |
| §8.4 | route | `‖F‖² = o(t)` gives maximal function `o(√t)` in `L²`; Chebyshev `\|{MF > λ}\| ≤ o(t)/λ² < 1/t` at `λ = o(t)` | holds | none |
| §8.7 two-term form | general `M`; `M = diag(2, ½)` | `a = (m₁₁ + m₂₂ + i(m₁₂ − m₂₁))/(2√w)`, `\|a\|² − \|b\|² = det M/w`; `P = 0.255413`, `min\|T\| = 0.928404 = 2 sin(½)·1.25·e^{−P}`, `\|T(ζ)\| = 1.2·10⁻¹⁶` | holds | none |
| §8.7 Rouché geometry | `C ≥ 3`; `C ≥ 4π` | `(2C − 1)/t ≥ π/t` iff `C ≥ 2.0708`; `8π = 25.133 > 2π + π/2 = 7.854`; at `C = 3`: `6 < 6.2832` | repaired statement holds | none |
| §8.7(1), zero-free case | `C = 3, 5` | `sup\|γ(2C) sin(τ + 2iC) − ie^{−iτ}\| = 1.2341·10⁻⁴, 3.0590·10⁻⁷ = e^{−3C}`; `α = −ie^{−itu}a/\|a\|` | holds | none |
| §8.7(3) | free case; two-term form at `t(x₂ − x₀) ∈ 2πℤ`, `c₁ = c₂` | `c²w = 1`, `E ≈ e^{itx₀}e^{−itz}/√w`, `α = ie^{itx₀}`; `24π/ε = 3·8π/ε` | holds | none |
| §8.8 | `α = e^{0.7i}`, `tp = 1.3`, `tu = 0.4`, `tũ = 1.1` and `2.9`, `w = 0.7`, `w̃ = 0.9` | forms against coefficients: `3.1·10⁻¹⁶`, `6.7·10⁻¹⁶`; ratios `0.0126241 − 0.0731929i` (three values equal); `1.428571 = 1/0.7`, `1.111111 = 1/0.9`; constant part `0.9636106 = cos(0.7)/√0.63`; oscillating mean `0` against `(a conj b̃ − conj(b)ã)/(2i) = 0` | holds | none |
| §8.8 new Checks | `C = 16`; `ε = 10⁻⁶` | `e⁸ = 2980.96`; `√(2ε) = 0.0014142`; `γ(1)e = 2.01857` | hold | none |
| §9.1 | `t₁ = 0`; `t₁ = t₂` | `(iE − Ẽ)/(2i) = (E + iẼ)/2`; `(EẼ# − ẼE#)/(2i) = 1` | holds | none |
| §9.2 | `w = 0.7`, `w̃ = 0.9`, `s = 0.3`, `(50, 0.31, 0.03)`, `(60, 0.305, 0.025)` | closed forms against direct: `2.2·10⁻¹⁶`, `9.6·10⁻¹⁷`; `\|a\|² − \|b\|² = 1.0000000`; (2.2) at one time `2.0000000i`; `\|a\|² = 1 + \|sin e\|²/N² = 1.000393288` | holds | none |
| §9.3 sign of `Φ` | `w = 0.7`, `w̃ = 0.9`, height `1.5`, `Φ = ±0.6538871` | mean of the quotient `±0.5364492 − 0.7i` (quadrature equals `−iw ± √(w/w̃) sin Φ₀`) | holds | none |
| §9.3 sweep and Checks | `t₂ − t₁ = 2ⁿ/(3m)`, `\|J\| = C/2ⁿ`; `υ = 1` | `C/(3m)`; mean of `sin²` over an interval of length `L` is at least `½(1 − sin L/L) > 0`; `0.00037870` at shift `0.1`, mean `0.00012642` | holds | none |
| §9.3 quantifiers | `C = 2.5` against `C = 3` | `ℓₙ^{2.5} ≤ ℓₙ^{3}`; the route's null set depends on `C` | true; one sentence missing | R01 |
| §9.4 | `Ω`-conjugation | `ΩMΩ⁻¹ = [[D, −C],[−B, A]]`, `E_{−f} = D + iB = iẼ_f` | holds | none |
| §9.5, §9.6 (headline) | (2.2) on `ℝ`; free case | `(conj β − β)/√(w w̃) = 2i` gives `Im β = −√(w w̃)`; `\|1/√w + iβ/√w̃\|²/4 = (1/w + 1/w̃ + 2)/4`; `α = i`, `β = −i` | hold | none |

**Duplication audit.** `roadmaps grep` over main and the open heads, by object, this round: "Hermite–Biehler",
"non-linear Fourier", "Paley–Wiener space", "de Branges space", "Hardy space … half-plane", "Fatou's theorem",
"Carathéodory … integrable": no match. "Weyl function": only Weyl functional equations and Weyl elements
(AutomorphicSpectralTheory, FunctionFieldArithmetic and others), another object. "Liouville's formula":
IncompressibleFlows (open, line 259), the Jacobian of a smooth flow, not the determinant of a Carathéodory
propagator; it is not cited. "outer function": ConvexLifting and DiophantineApproximationAndTranscendencePartII,
another sense. At the pins: no `PaleyWiener`, `HermiteBiehler`, `deBranges`, outer-function or nontangential
declaration in Mathlib or Tau Ceti; Tau Ceti `Analysis/ODE` has the essentially bounded Carathéodory theorem
(`Caratheodory.lean`), the constant-kernel Grönwall inequality, a scalar constant-coefficient uniqueness
(`ScalarLinear.lean`) and the Wronskian of `f″ = qf` (`Wronskian.lean`), none of which is the
integrable-coefficient propagator or its Liouville formula; `TauCeti.HardySpace` is the disc space, which the
scope paragraph hands to Tau Ceti. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id
is dropped or defined only by an open revision, no second copy. The board packages index (AnalyticNumberTheory,
LawrenceVenkateshMethod) has no related package. This roadmap owns the half-plane Hardy and Paley–Wiener theory,
the integrable-coefficient linear theory and the Dirac scattering objects because no roadmap on main or open
states them.

Overlap check: read PDE, OptimalTransport, StochasticCalculus (main), MathematicalStatisticsAsymptotic, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory, AnalyticNumberTheoryPartIII (open) and OperatorTheory/UnboundedOperators (main); Weyl's alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; nothing else shared.

**Shape.** 55 numbered sections, 55 `**Checks.**` blocks (none with fewer than three bullets, by script), 55
`*Needs:*` lines, nine `### Examples`, nine `### Dependencies`. `design/plan.json`: nine layers, 55 targets,
`gaps: []`, three suppliers; every target statement occurs in the README (script, whitespace normalised). Layers
are named by their mathematics and no sentence says the roadmap follows a source. `grep` over the README: no
LaTeX delimiter, pull-request number, round label, machine path, HTML anchor, "deferred", "optional", "removed";
"lemma" occurs only in prose names. `sources.toml`: 13 entries, unchanged; every work in References has one.

**Headline theorems for the package stage:** pointwise convergence at resonance-free points (§9.6) with §9.5;
the non-linear Plancherel identities (§4.4, §5.4); the Szegő condition (§6.8); the isometric embedding and
uniqueness of the spectral measure (§6.6); the linear Carathéodory theorem with holomorphic dependence (§1.2,
§1.6); the outer-multiplier theorem (§2.8).

**Copyright, licences and scope.** Wording: 17 passages set beside the sources at the locators listed above
(§2.1, §2.6, §3.1, §3.2, §4.2, §4.3, §6.3, §6.4, §6.6, §6.7, §8.1, §8.4, §8.7, §9.2, and the rewritten routes of
§8.8 against poltoratski2024 line 1028–1040 and of §9.3 against line 1350–1352). No run of more than six words is
shared; what coincides is formulas and the definition of a Poisson-finite measure, which can be written one way.
Arrangement: poltoratski2024 §1–§9 (contents at line 102–125) against Layers 1–9: Layers 1–2 ↔ none; Layer 3 ↔
§1 and part of §2; Layers 4–5 ↔ §5, placed before Layer 6 ↔ the rest of §2; Layer 7 ↔ §3–§4; Layer 8 ↔ §6–§8;
Layer 9 ↔ part of §9. Not one to one, and the order of Layers 7–9 is forced (the Dependencies lines of Layer 8
name Layer 7, those of Layer 9 name Layer 8). Reuse: no table, figure or list is taken over.

Source independence: 17 passages compared with 6 sources, none shared; largest share poltoratski2024, 57 of 151 citations in the layers; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §1.1 of the sample has no other locator; its statement was recomputed.
- poltoratski2024 line 1253–1317: the displays are garbled by OCR; (9.2) is checked through the exact identities
  of §9.2, not by reading it.
- The published version of poltoratski2024 (Ann. of Math. 199): not read; locators are to arXiv version 14.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the indexed
  heads; AutomorphicSpectralTheory is not among the checkouts listed with files, and was read through
  `roadmaps show`.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Gap** in poltoratski2024 at Corollary 3, part 1), printed p. 26 (line 931–934, 966–970): the source says the two-term form has modulus bounded below and gives the exponential on some smaller box; it should bound the form through the absence of zeros (Rouché); affects the proof.
- **Gap** in poltoratski2024 at Lemma 9, printed p. 35 (line 1350–1359): the source says the bound holds for any zero in the box; it should restrict to zeros below height `−1/t`, as formula (9.2) rests on Lemma 8; affects a stated result.
- **Gap** in poltoratski2024 at Lemma 7, (8.1), printed p. 27 (line 1038–1040): the source says only the cosine of the phase difference is fixed; it should also fix its sign across times, which the subinterval formulas of §9 use; affects the proof.
- **Gap** in mauth2022 at Lemma 9, printed p. 10 (line 469–470): the source says a square-integrable function is an `H²` boundary function if its transform vanishes on the negative half-line; it should state the equivalence; affects nothing.
- **Gap** in mauth2022 at Corollary 6, printed p. 29 (line 1397–1408): the source says the same modulus bound as the corollary it follows; it should derive it from a zero-free box likewise; affects the proof.

## For the human reviewers

- **Scope.** The headline §9.6 is conditional on the set `R(f)` (README line 114–118). For compactly supported and for integrable `f` its conclusion is already §5.2; no source read here shows `R(f)` non-null for another `f`.
- **Scope.** README line 121–123 states that §9 of arXiv version 14 of poltoratski2024 cannot exclude a resonance. That is this project's computation (§9.4, fourth Check), not a published statement.
- **Scope.** The routes of §8.7(1) (Rouché on the two-term form), §8.8 (oscillating part of (2.2)) and §9.3 (sign of `Φ`, sets `G_N`) are this project's arguments; poltoratski2024 line 931–934, 1028–1040, 1350–1377 argue differently.
- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 836) asks for an "analogous" endpoint classification for `Ju′ + Vu` without writing the alternative out; §6.4 here relies on it as spelled out in the contracts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3ba83c35b8f77069f3294bfe892efcc905a536c5", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~15", "model": "fable", "worker": "chris-x26"} -->
