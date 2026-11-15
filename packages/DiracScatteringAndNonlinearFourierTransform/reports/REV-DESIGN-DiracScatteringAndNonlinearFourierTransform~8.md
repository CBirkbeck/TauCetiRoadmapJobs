<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6896391387 -->
Review (claude) of 581cb41

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §9.3's route states a pointwise lower bound where only the integral bound holds

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 2063–2064 ("§9.2 and
   §8.8–§8.9 give `log|a_{t₁→t₂}| ≥ c_m > 0` on `ℝ ∩ Q(s, C/2ⁿ⁺¹)` for `s ∈ Sₙ`"); plan.json 9.3 (`statement`).

   Claim: `log|a_{t₁→t₂}|` is bounded below by a positive constant at every point of the interval.

   Witness: by §9.2, at `p` near `s` the increment is `e(p) = e(s) + (t₂ − t₁)(p − s)`. A zero
   `z(t) = s + c/t` stays in `Q(s, C/t)` and has `e(s) = 0`, so `|a(s)| = 1`. Computed at `υ = 1`, `ε₂ = 0`:
   `log|a| = 0` at `p = s` and `0.000379` at shift `0.1`. poltoratski2024 line 1361–1369 bounds the integral
   over the interval, not the integrand.

   Repair (tested on the instance: the mean of `log|a|` over shifts in `[−0.1, 0.1]` is `0.000126 > 0`):
   write "§9.2 and §8.8–§8.9 give `∫_{J(s)} log|a_{t₁→t₂}| ≥ c_{m,C} |J(s)|` for `J(s) = ℝ ∩ Q(s, C/2ⁿ⁺¹)`,
   `s ∈ Sₙ`, because `e(p) = e(s) + (t₂ − t₁)(p − s)` sweeps an interval of length `C/(3m)` as `p` runs over
   `J(s)`"; mirror in plan.json 9.3.

2. **F02** (P3) §6.6 is stated for `t ≥ 0`, but `B(E(0, ·))` is not defined

   Location: `design/README.md` line 1574 ("for every `t ≥ 0` and `F ∈ PW_t`,
   `∫ |F|² dμ_q = ‖F‖²_{B(E(t,·))}`"); plan.json 6.6 (`statement`, and the hypothesis "t ≥ 0, F ∈ PW_t").

   Claim: the identity is a statement at `t = 0`.

   Witness: `E(0, ·) = 1` has `|E#| = |E|` and is not Hermite–Biehler (§6.1 third Check, line 1428), and
   §6.1 defines `B(E)` for Hermite–Biehler `E` only; §6.2 (line 1448) and §6.3 are stated for `t > 0`.

   Repair: "for every `t > 0`" in §6.6 and in plan.json 6.6 (statement and hypothesis). At `t = 0` nothing is
   lost: `PW_0 = {0}`.

3. **F03** (P3) the compact-support form of the Weyl function is an input of §6.5 but only a Check of §6.4

   Location: `design/README.md` line 1514–1515 (§6.4 Check: "Compact support (`q = 0` on `(T, ∞)`):
   `m = −Ẽ(T, ·)/E(T, ·)` exactly"); used at line 1529 and line 1533 ("`m_T = −Ẽ(T, ·)/E(T, ·)` its Weyl
   function (§6.4)").

   Claim: §6.4 supplies the identity to §6.5, §6.6 and §6.8.

   Witness: the API list of §6.4 (line 1478–1488) has no such bullet; the only place it stands is the Checks,
   which are tests, not suppliers. §6.5's compact-support and truncation bullets and §6.8's `w_T = |E(T, ·)|^{−2}`
   all rest on it.

   Repair: add to §6.4's API "If `q = 0` almost everywhere on `(T, ∞)` then `m = −Ẽ(T, ·)/E(T, ·)` on `ℂ₊`:
   beyond `T` the solution is free, `u − iv` grows like `e^{(t − T) Im z}` and `u + iv` decays, so `Φ + wΘ` is
   square-integrable exactly when `Ẽ(T, z) + wE(T, z) = 0`", keep the Check as its free-case test (`m = i`),
   and mirror in plan.json 6.4 (`api`). Tested on the free case: `−Ẽ/E = i` for every `T`.

4. **F04** (P3) four `### Dependencies` lines are not the union of their layer's *Needs:* lines

   Location: `design/README.md` line 1238 (Layer 4), line 1400 (Layer 5), line 1767 (Layer 7), line 2006
   (Layer 8).

   Claim: each line lists what the layer depends on.

   Witness: §4.4 needs Tau Ceti `DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane` (line 1198);
   §5.1 needs Tau Ceti `TauCeti.norm_convolutionLp_le` (line 1260–1262); §7.3 needs §1.6 (line 1750); §8.2
   needs §2.1 (line 1819). None is in its layer's Dependencies line.

   Repair: Layer 4 "…; Tau Ceti (half-plane primitives); Mathlib (the Riemann–Lebesgue lemma)"; Layer 5 "…;
   Tau Ceti (Young's inequality); Mathlib (convergence in measure, the Fourier kernel)"; Layer 7 "Layer 1
   (§1.6), Layer 2 (§2.5), …"; Layer 8 "Layer 2 (§2.1, §2.3, §2.4, §2.6–§2.8), …; Mathlib (the inverse
   function theorem)".

5. **F05** (P3) three *Needs:* lines name a Mathlib result without its declaration

   Location: `design/README.md` line 1153 ("Mathlib Riemann–Lebesgue lemma"), line 1979 ("Mathlib inverse
   function theorem for holomorphic maps"), line 2109 ("Mathlib Taylor expansions of `Real.sinh`"); the
   supplier contracts list none of the three; plan.json 4.2, 8.9, 9.5 (`prerequisites`).

   Claim: the supplier contracts name every consumed declaration.

   Witness, at the pinned Mathlib: `Real.tendsto_integral_exp_smul_cocompact`
   (`Analysis/Fourier/RiemannLebesgueLemma.lean` line 205); `HasStrictFDerivAt.toOpenPartialHomeomorph`
   (`Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean` line 118) and
   `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse` (`…/ApproximatesLinearOn.lean` line 143,
   the quantitative form §8.9's `|a − s| ≤ D₂ε/t` uses); `taylor_mean_remainder_lagrange`
   (`Analysis/Calculus/Taylor.lean` line 330).

   Repair: name these in the three *Needs:* lines, add them to `### From Mathlib` with file and line, and
   mirror in plan.json. No holomorphic-specific inverse function theorem is needed: `g` is strictly
   differentiable with `g′(s) ≠ 0`.

Five findings, all P3 (no P1 or P2): each carries a repair, so the verdict asks for changes and a fix
round applies them. All six findings of round 7 are
repaired. The dependency check shows no UPWARD or CYCLE line. Declared supplier gaps: none. Elaboration: not available (this lane does not elaborate); the design
stage has no `Suggested.lean`.

## Verified sound

**Repairs of round 7, finding by finding.**

- **F01 (P2), factor in §8.9 — repaired.** Line 1968: "exactly `E(s) = α′ γ(ty′) sin(t(s − (x′ − iy′)))/√w`
  and `Ẽ(s) = α′ γ(ty′) cos(t(s − (x̃′ − iy′)))/√w̃`"; line 1986–1990 is the determinant Check; §8.6 line
  1907–1910 names the common height. Recomputed below.
- **F02 (P2), Herglotz ownership — repaired.** Line 709–711: "This is the harmonic form of the Herglotz
  representation of AutomorphicSpectralTheory §0.5: … `c = b` and `ν = πν_F`"; Scope line 83–87; contracts
  line 391–399; Conventions line 155–156; §6.5 line 1522–1523; plan.json `suppliers` and the prerequisites
  of 2.2 and 6.5. §0.5 read at the head of its open pull request (README line 182–198): `Im F ≥ 0`, kernel
  `(t − z)⁻¹ − t/(1 + t²)`, unique triple with `a = Re F(i)`, no factor `1/π`: as cited.
- **F03 (P2), layers tied to a source's sections — repaired.** Line 53–56 carry no parenthesis; line
  101–103: "the generality of poltoratski2024 Theorem 1 (line 579–581)"; line 1688: "From here on the
  potential is real, `q = f`."; line 2010–2011. Searched for "the source", "as in", "carry out
  Poltoratski", "Poltoratski §": no hit that ties a layer to a source section.
- **F04 (P3), §8.9 pointwise — repaired.** Line 1961–1963: "Let `s ∈ ℝ`, let `w, w̃ > 0` be numbers and let
  `C > 1`. … `ε₀ > 0` and `D`, depending only on `C`, `w` and `w̃`"; the application sentence at line
  1970–1972. poltoratski2024 line 1116–1117 read: the statement there is for every `s` with `w(s) w̃(s) ≠ 0`.
- **F05 (P3), weak convergence as a statement — repaired.** §6.5 "Truncations" bullet, line 1532–1547; §6.6
  line 1578–1579 and §6.8 line 1658 cite "truncation bullet of §6.5"; §6.8 no longer needs §6.6.
- **F06 (P3), the derivative in §2.2 — repaired.** Line 711–716: "`i(∂ₓu − i∂ᵧu)`, `i` times the complex
  partial of `u`"; first Check line 730–731.

**Repaired patterns in the rest of the design.** A factor paired with the wrong height: §8.6, §8.7, §8.8,
§9.2 all pair `γ(t y)` with the same `y`. A fact taken from inside another target's route: one more, R03.
A sentence tying a layer to a source section: none left. An earlier owner of a stated object: none found
(duplication audit below).

**Principles.** No route-specific shortcut; no roadmap re-planned; two suppliers, both earlier in the
order; own words with locators; no algorithm; no `Suggested.lean` at this stage. Process words,
pull-request numbers, machine paths, LaTeX delimiters, `lemma`: none (grep). plan.json: `gaps: []`, nine
layers, 57 targets; the statements and prerequisites of 2.2, 6.5, 6.6, 6.8, 8.6, 8.9, 9.6 agree with the
README.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AutomorphicSpectralTheory is merge order line 98, an open pull request that adds
the roadmap, and is not on the never-cite list; AnalyticNumberTheoryPartI §0.23 is on main (README line
644). StochasticCalculus S6.5 (main, line 2249–2435) and OperatorTheory/ToeplitzOperators Layers 2–5 (main,
line 273, 400) exist as Scope names them.

**Pinned declarations opened this round.** Tau Ceti: `MeasureTheory.Measure.herglotzTransform`
(`Analysis/Complex/Herglotz.lean` line 138, body `∫ (z + w)/(z − w) ∂μ`), `herglotzTransform_zero` (line
150, value `μ.real univ`); `TauCeti.I_mul_herglotzTransform_cayley_eq` (`Analysis/Complex/Pick/Nevanlinna.lean`
line 404: finite `mu`, `z ∈ upperHalfPlaneSet`, right side `mu.real {1} * z + ∫ nevanlinnaKernel z x`);
`exists_isFiniteMeasure_eq_nevanlinnaKernel_add` (line 436, hypothesis `0 ≤ (F z).im`);
`Measure.cayleyPushforward` (line 176, restriction to `{1}ᶜ` mapped by the inverse Cayley coordinate);
`integral_circle_eq_atom_add_integral_cayleyPushforward` (line 188, continuous `f`);
`TauCeti.boundaryCayley` (`UpperHalfPlane/Cayley.lean` line 316);
`DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane` (line 118);
`TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` (`Variational.lean` line 499, pseudometrizable Borel
space, pairs of `FiniteMeasure`). Mathlib: `span_fourier_closure_eq_top` (`AddCircle.lean` line 244),
`AddCircle.homeomorphCircle'` (line 421), `FiniteMeasure.tendsto_iff_forall_integral_rclike_tendsto` (line
748), `HarmonicAt.differentiableAt_complex_partial` (line 35), and the four of R05. The remaining locators
of the contracts were opened in rounds 6 and 7 and the pins (plan.json `baseline`) have not moved.

**Sources, the seeded sample** (each read at the cited line; no locator is flagged unverified by the author).

- §2.2: garnett2007 only, uncertified; checked through its route and Checks (table).
- §2.6: mauth2022 line 337–358 (definition), Lemma 1 line 359–369, Lemma 2 line 370–377 (constant
  `(2/(πy))^{1/p}`, weaker than the README's, as the README says), Lemma 6 line 430, Lemma 9 line 469,
  Lemma 11 line 487: as cited.
- §3.1: poltoratski2024 line 136–166, (2.1) line 204; mauth2022 (5)–(6) line 546–563, Lemma 14 line 565;
  romanov2014 line 223–224, (12) line 758: as cited.
- §4.4: poltoratski2024 (5.5) line 545–548 (constant `1`), line 503–507; denisov2006 (194) line 3250–3255;
  taothiele2012 Lemma 6 line 680–683: as cited.
- §5.5: poltoratski2024 line 518–544 (convergence in `Π`-measure; `L¹(Π)` for `log|a|`); mauth2022 Lemma 19
  line 711: as cited. The README's `L¹(ℝ)` statement is stronger than the source's and holds (table).
- §6.1: poltoratski2024 line 209–235, (2.4) line 245–249; mauth2022 line 490–512, Lemma 20 line 735;
  romanov2014 Theorem 5, (16), (18) line 812–821: as cited.
- §6.4: romanov2014 Theorem 15 line 2217, Lemma 23 line 2370: as cited.
- §6.6: poltoratski2024 line 255–262; romanov2014 Theorem 16 line 2283: as cited.
- §6.8: poltoratski2024 line 263–268; mauth2022 Theorem 3 line 702–707; denisov2006 Theorem 11.1 line
  3246: as cited.
- §7.1: poltoratski2024 line 307–331, 312–321, 337–346 (`c ≥ 0` at line 337); mauth2022 line 446–453: as
  cited.
- §8.7: poltoratski2024 Corollary 3 line 1002–1012, `T₁` at line 997–1001; mauth2022 Corollary 6 line
  1397–1408: as cited.
- §8.8: poltoratski2024 Lemma 7 line 1028–1040, (8.1); mauth2022 Lemma 43 line 3140–3150: as cited (one
  misprint in both, Source issues; the README has the corrected form).
- §9.1: poltoratski2024 line 1183–1210, (9.1) line 1236, the formula for `a` at line 1243–1252, (9.3) line
  1319: as cited.
- §9.2: poltoratski2024 (9.2) line 1306, (9.4) line 1339, quotient line 1345–1347: as cited.
- §9.7: poltoratski2024 (9.9) line 1542, (9.10) line 1551, limits line 1562–1570: as cited.
- Also read for R01 and the repairs: poltoratski2024 Lemma 8 line 1116–1138, Lemma 9 line 1350–1377.

**Adversarial table** (hand algebra and plain Python; values computed this round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.2 representation | Poisson kernel at `iy` | `πy P(iy, x) = y²/(x² + y²) ↑ 1`; `P[ν](iy)/y ≤ (1/π)∫ dν/(x² + y²) → 0` | holds | none |
| §2.2 dictionary | `Im (x − z)⁻¹` | `Im z/|x − z|² = π P(z, x)`, so `Im F = b Im z + P[πν_F]`; `Re (x − i)⁻¹ = x/(1 + x²)` cancels at `i` | holds | none |
| §2.2 Checks | `u = Im z`; `P[δ₀]`; `u ≡ 1` | `F′ = i·(−i) = 1`; triple `(0, 0, δ₀/π)`, `ν = δ₀`; `πy u(iy) = πy → ∞` | hold | none |
| §2.6 constants | `F = 1/(z + i)` | `−i∫₀^∞ e^{−s(1 − iz)} ds = 1/(z + i)`; `‖F‖² = 2π · ½ = π`; Cauchy kernel norm² `1/(4π Im z)`; `|F(i)|² = 1/4` | holds | none |
| §3.1, §7.3 Riccati | algebra | `θ′ = (izE# + conj q E)/E − E#(−izE + qE#)/E² = 2izθ + conj q − qθ²`; `θ̃(0) = i/(−i) = −1` | holds | none |
| §4.5 | algebra | `a′ = qβ`, `β′ = 2izβ + conj q a`; `∂ₜ(|a|² − |β|²) = 4 Im z |β|²`; `|r|′ ≤ −2y|r| + 2|q|` | holds | none |
| §5.1 | Young, Cauchy–Schwarz | `‖r‖₂ ≤ 2 · (1/2y)‖q‖ = ‖q‖/y`; `(∫_t^∞ e^{−4ys})^{1/2} = e^{−2yt}/(2√y)` | holds | none |
| §5.3 identity | `δ = |a|² − |b|² − 1` | `log(1 + δ) ≤ 2 log|a₂|`, `∫ ≤ π‖q‖²_{L²(T,∞)} → 0` | holds | none |
| §5.5 bound | `g = 1/a₂`, `|g| ≤ 1` | `∫|1 − g|² dΠ ≤ 2π − 2 Re ∫ g dΠ = 2π(1 − Re g(i))`; `‖q⌃* − ρ₁‖² ≤ 4‖ρ₂‖² ≤ 4π‖q‖²_{L²(T,∞)}` | holds | none |
| §5.5 `L¹(ℝ)` | nonnegative functions | convergence in measure and `∫ log|a_T| = (π/2)‖q‖²_{(0,T)} → ∫ log|a_∞|` give `L¹` convergence | holds | none |
| §6.4 disc | `X(0) = (w, 1)` | `Im(conj w · 1) = −Im w`; `u − iv = Ẽ + wE`; limit point: `1 = det ≤ |Θ||Φ|` not integrable | holds | none |
| §6.4 compact support | free tail, `z ∈ ℂ₊` | `|e^{−i(t−T)z}| = e^{(t−T) Im z}` grows: `L²` iff `Ẽ(T) + wE(T) = 0` | holds; only a Check | R03 |
| §6.5 Herglotz identity | kernel | `(1 + xz)/(x − z) = (1 + x²)((x − z)⁻¹ − x/(1 + x²))`; coefficient of `ξᵏ` in `(ζ + ξ)/(ζ − ξ)` is `2ζ̄ᵏ` | holds | none |
| §6.5 masses | `ν(X)` | `β + (1/π)∫ dμ/(1 + x²) = β + P[μ](i) = Im m(i)` | holds | none |
| §6.5 Check `f ≡ 1` | eigenvector of `[[1, −z], [z, −1]]` | `m = z/(1 − iκ) = (1 + iκ)/z`; `m(i) = i(√2 − 1)`; `|E(T, 2)|² = 4/3 − (1/3) cos 2√3T + (1/√3) sin 2√3T ∈ [2/3, 2]`; mean of the reciprocal `√3/2` | holds | none |
| §6.6 | `t = 0` | `E(0, ·) = 1`, `|E#| = |E|`, `B(E)` undefined; `PW_0 = {0}` | statement slips at `t = 0` | R02 |
| §6.7, §6.8 | definition of `klDiv` | `klDiv σ ν_T = ν_T(X) − 1 − (1/π)∫ log w_T dΠ ≤ ν_T(X) − 1 + 2 log 2 + ‖q‖²`; `dΠ ≤ dx`, `log|a| ≥ 0` | holds | none |
| §7.1 | `θ = E#/E` on `ℝ` | `θ′/θ = conj(E′/E) − E′/E = −2i Im(E′/E) = 2iψ′`; free: `ψ′ = t = π(t/π)` | holds | none |
| §7.2 | summand inequality | `|y − ζ| > √(1 + ε)|x − ζ|` gives `|x − ζ| < |y − x|/(√(1 + ε) − 1)`; `min (√(1 + ε) − 1)/ε = 0.4143 ≥ 1/3` on `(0, 1)`; `b_{10i}`: `0.2, 0.16, 0.1` | holds | none |
| §8.7 (2) | `ty` bounded along a sequence | approximant zeros `x + kπ/t − iy` lie in `Q(s, C(t)/t)` once `C(t) > ty + π`; on a circle of radius `δ/t`, `|γ(p) sin| ≥ γ(P)|sin δe^{iφ}| > 0`: Rouché gives a zero of `E`, so `ty → ∞` | holds | none |
| §8.7 (1) → (2) | `sin(A + ip)` | `≈ (i/2) e^{p} e^{−iA}`, `γ(p) e^{p}/2 → 1`; new `α = −α e^{itx}` | holds | none |
| §8.9 statement | general entire `E`, `Ẽ` | `g′ = t cos Φ/cos²(A − Φ)`, `|Im(A − Φ)| ≤ 3C + 2C`; `s − (x′ − iy′) = a − x + iy`; determinant `i|κ|² sinh(2ty′) cos Φ/√(w w̃) = i|κ|² sinh 2ty′` | holds | none |
| §8.9 factor | `ty = 1.5` | `2 sinh 3.04/sinh 3 = 2.0820`, `2 sinh 3.2/sinh 3 = 2.4448` with `γ(ty)`; `2` with `γ(ty′)` | new statement holds | none |
| §9.1 formulas | `(1, −i)M(t₂)M(t₁)⁻¹` | `E₁₂ = E₂D₁ − Ẽ₂C₁`, `Ẽ₁₂ = −E₂B₁ + Ẽ₂A₁`; `D₁ − iB₁ = −iẼ₁#`, `iA₁ − C₁ = iE₁#`; `a = e(E₂Ẽ₁# − Ẽ₂E₁#)/(2i)`, `b = e(Ẽ₂E₁ − E₂Ẽ₁)/(2i)`; `t₁ = 0`: `(E ± iẼ)/2` | holds | none |
| §9.2 identities | algebra | `sin A cos(B − Φ) − cos(A − Φ) sin B = cos Φ sin(A − B)`; `θ₂ − conj θ₁ = e + 2iυ`, `θ₂ − θ₁ = e`; `|a|² − |b|² = sinh(2υ + 2ε₂) sinh 2υ/N² = 1` | holds | none |
| §9.3 route | `υ = 1`, `ε₂ = 0`, `e(s) = 0` | `log|a| = 0` at `p = s`, `0.000379` at shift `0.1`; mean over `[−0.1, 0.1]`: `0.000126` | pointwise bound false, integral bound true | R01 |
| §9.7 | (2.2) on `ℝ` | `(conj β − β)/√(w w̃) = 2i`, `Im β = −√(w w̃)`; `|1/√w ± iβ/√w̃|² = 1/w + 1/w̃ ± 2`; free: `α = i`, `β = −i` | holds | none |
| §9.7 constant `β` | `Ẽ(t, s)/E(t, s)` continuous in `t` | cluster set within two points `(±√(1 − w w̃) − i√(w w̃))√(w/w̃)`; a continuous path converges to one | holds | none |
| §9.8 headline | route | limit `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`, denominator modulus² `1/w + 1/w̃ + 2 > 0`, `|e^{−itz}| ≥ e^{−D}` on `Q(s, D/t)` | holds | none |

The rows of round 7's table for the text no repair touched (§1.6, §2.3, §2.8, §3.2, §4.1–§4.4, §5.3,
§6.1, §8.1, §8.8, §9.5) carry computed values and are relied on.

**Duplication audit.** `roadmaps grep` over main and the open heads, by object: "Fatou's theorem", "Szegő
condition": no match. "outer function", "inner function", "limit point", "Weyl disc": unrelated uses only.
"Hardy space": OperatorTheory/ToeplitzOperators (unit disc, named in Scope), IndexTheory and
NoncommutativeIntegration (other objects). "Paley–Wiener": AutomorphicSpectralTheory §1.6, the theorem for
smooth compactly supported functions on a Euclidean space with rapid decay; §2.7 here is the `L²` form on
`ℝ`, a different statement. Integral Grönwall: StochasticCalculus (main, line 2958) states the form with a
constant rate `c` and a variable `g`; §1.1 has an integrable kernel and a constant `α`; neither contains
the other. "Carathéodory": AsymptoticExpansions cites the pinned `TauCeti/Analysis/ODE/`. "Herglotz":
AutomorphicSpectralTheory §0.5, now cited. `scratch/overlaps.md`: no open pull request changes this
roadmap, no cited id is dropped, none is defined only by an open revision, no second copy. The board
packages index was read: no related package.

Overlap check: read PDE, OptimalTransport, StochasticCalculus (main), MathematicalStatisticsAsymptotic, AutomorphicSpectralTheory (open); the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited here; the half-space Poisson kernel and the Poisson integral of bounded data: owner Tau Ceti (PDE §3.4 cites the same pins), §2.1 here is the Poisson-finite-measure form; `klDiv`: owner Mathlib for all three; nothing else shared.

**Shape.** Every layer ends with `### Examples` and `### Dependencies` (R04 for four of the lines); 57
`**Checks.**` blocks for 57 targets, each read with at least three Checks; every theorem has a locator;
layers are named by their mathematics. The order of Layers 7–9 is forced: §8.6 needs §7.3, §8.7 needs §7.2
and §8.6, §9.3 needs §8.8–§8.9, §9.6 needs §8.6–§8.9.

**Headline theorems for the package stage:** the non-linear Carleson theorem with its strong form (§9.8),
the non-linear Plancherel identities (§4.4, §5.4), the Szegő condition (§6.8), the Carathéodory theorems
with a holomorphic parameter (§1.2, §1.6), the outer-multiplier theorem (§2.8). The padding probe and the
`#check` comparison do not apply at the design stage.

**Copyright, licences and scope.** Wording: the README was set beside the source at 24 passages (the 15
sampled targets, and the Conventions' Dirac system, §8.9, §9.3, §9.4's definition, §9.6's "Final step",
§2.7, §6.2, §6.3, §7.2). The longest shared run is nine words, in the hypothesis of §9.3 (the definition
of `Iₙ(s)`, poltoratski2024 line 1350–1352), a statement the mathematics fixes; no sentence of prose or
proof plan is shared. Arrangement: poltoratski2024 has ten sections; Layers 1–2 have no counterpart, Layers
4–5 (its §5) precede Layer 6 (the rest of its §2), and the order of Layers 7–9 is forced by the *Needs:*
lines above. Reuse: no table, figure or list is taken over.

Source independence: 24 passages compared with 5 sources, none shared; largest share poltoratski2024, 72 of 183 locators; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §2.2's only locator is garnett2007.
- poltoratski2024 §9, the "General case" continuity argument (line 1482–1533), was not re-derived; §9.6
  states its conclusion and names the route.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Error** in poltoratski2024 at Lemma 8, (8.5), printed p. 29–30: the source says the exact forms at `s` carry the factor `γ(ty)` with the new height `y′`; it should be `γ(ty′)`, which (2.2) forces; affects a stated result.
- **Error** in mauth2022 at Lemma 45, (58), printed p. 62–63: the source says the two forms with factor `γ(ty)` and height `y′` have determinant `2i`; it should be `2i sinh(2ty′)/sinh(2ty)`, so the factor is `γ(ty′)`; affects a stated result.
- **Misprint** in poltoratski2024 at Lemma 7, printed p. 27 (line 1038), and in mauth2022 at Lemma 43, printed p. 60 (line 3150): the source says the depth satisfies `p(t) > C(t)` off `T₀` and `p(t) ≤ C(t)` on it; it should be `t p(t)` in both, the box being `Q(s, C(t)/t)`; affects a stated result.
- **Misprint** in mauth2022 at Corollary 6, (20), printed p. 29: the source says the approximant of `E(t, z)` is a multiple of `e^{itz}`; it should be `e^{−itz}`, as the free case shows; affects a stated result.
- **Gap** in poltoratski2024 at Lemma 9, printed p. 35 (line 1361–1369): the source says the integral of `log|a_{t₁→t₂}|` over the interval is bounded below after a pointwise estimate; it should say the bound holds for the integral only, the integrand vanishing where the increment is zero; affects the proof.

## For the human reviewers

- **Scope.** This analysis roadmap now cites AutomorphicSpectralTheory §0.5, an open pull request (merge order line 98), for the half-plane Herglotz representation (`design/README.md` line 391–399). Whether that section should move to a common supplier is a maintainer's decision.
- **Scope.** Layer 9's locators are to arXiv version 14 of poltoratski2024; mnatsakanyan2022 (abstract, line 135–137) reports an error in the published proof, and version 14 argues differently (`sources.toml`, `version_note`). The published text was not read.
- **Licence.** poltoratski2024 was read as an OCR text of arXiv version 14; formulas garbled by OCR were recomputed, not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "581cb41ac680f7f2d91bcf55d4f8d17c02ffce2b", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~8", "model": "fable", "worker": "chris-x52"} -->
