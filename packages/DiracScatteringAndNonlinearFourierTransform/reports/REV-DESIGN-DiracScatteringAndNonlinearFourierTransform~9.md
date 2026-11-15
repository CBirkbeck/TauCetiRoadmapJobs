<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6897489863 -->
Review (claude) of 4a4f79f

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Weyl's alternative for `Ju′ + Vu` is owned by UnboundedOperators on main, and is neither cited nor deferred to it

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 94–96 ("the
   self-adjoint Dirac operator in `L²(ℝ₊; ℂ²)`, its domain and its spectral theorem to a later
   operator-theoretic roadmap"); §6.4 line 1524–1526 ("if `Θ(·, z₀) ∈ L²` for some `z₀ ∈ ℂ₊`, every solution is
   square-integrable at `z₀` and then, by variation of constants and §1.1, at every `z`"); line 2259–2260
   (Downstream consumers: UnboundedOperators consumes §1.2 and §1.6 "used in Weyl's alternative"); plan.json
   `consumers`, first entry.

   Claim: no roadmap owns the operator-side theory of the Dirac expression yet, UnboundedOperators will consume
   this roadmap for Weyl's alternative, and §6.4 proves the independence of the spectral parameter itself.

   Witness: on main, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` §4.8 (UO-D07), line 845–847
   and 861–867: Weyl's limit-point/limit-circle alternative with spectral-parameter independence, and "the
   analogous maximal/minimal, Green-boundary and endpoint classification API" for `Ju′ + V(r)u` with locally
   integrable Hermitian `V`; its *Needs:* (line 886) says "local integral-equation construction stated here".
   The Dirac system here is that expression: `J = [[0, −1], [1, 0]] = −Ω`, `V = −Q_q`, `λ = −z`
   (`Ju′ + Vu = λu` reads `u′ = Ω(λ − V)u = −Ω(z − Q_q)u`). So the roadmap on main owns the alternative that
   §6.4's route re-derives, the Scope names "a later" roadmap for what main already has, and the two texts hand
   the integral-equation step to each other. The triage (`packages/DiracScatteringAndNonlinearFourierTransform/target.md`,
   Layer A) asked for the fixed-parameter case of §1.2 as a Check against UO-D07; no such Check exists.

   Repair (a roadmap on main is earlier: cite it, keep only what it does not state):

   1. Scope, replace the bullet at line 94–96 by: "the minimal and maximal operators of the Dirac expression in
      `L²(ℝ₊; ℂ²)`, Green's formula, Weyl's limit-point/limit-circle alternative with its independence of the
      spectral parameter, and the self-adjoint boundary conditions to OperatorTheory/UnboundedOperators §4.8,
      whose expression `Ju′ + Vu = λu` is the Dirac system here with `J = −Ω`, `V = −Q_q`, `λ = −z`; §6.4 consumes
      the alternative and adds that `∞` is a limit-point endpoint for every potential, the Weyl discs and the Weyl
      function; §1.2 is the Banach-space integral-equation theorem, whose case `E = ℂ²` at a fixed parameter is
      the local existence and uniqueness stated there".
   2. §6.4 route, replace "and then, by variation of constants and §1.1, at every `z`" by "and then at every `z`,
      by the independence of the spectral parameter in the alternative of UnboundedOperators §4.8"; add
      "OperatorTheory/UnboundedOperators §4.8" to the *Needs:* line (§1.1 and §1.3 leave it if nothing else uses
      them), to Layer 6's Dependencies, to a new `### From TauCetiRoadmap.OperatorTheory/UnboundedOperators`
      contract (the alternative as stated at its line 876, with the dictionary above), and to plan.json
      (`suppliers`, prerequisites of 6.4).
   3. §1.2, add the Check: "Fixed parameter on `ℂ²`: for `P = Ω(λ − V)` with `V` locally integrable Hermitian the
      theorem is the local integral-equation existence and uniqueness of UnboundedOperators §4.8; for `V = 0`,
      `λ = −z` it gives `M = [[cos tz, −sin tz], [sin tz, cos tz]]`".
   4. Downstream consumers and plan.json `consumers`: delete UnboundedOperators (it is on main and builds its
      own integral-equation step); keep "later operator-theoretic roadmaps on Dirac operators" unnamed, or name
      none.

   Tested on the free case: `Ju′ = λu` with `λ = −z` is `u′ = −zΩu`, the system of §3.1 at `q = 0`; for
   `z ∈ ℂ₊` its square-integrable solutions are the multiples of `Φ + iΘ = (i e^{itz}, e^{itz})`, one line, so
   the endpoint is limit point in both texts and `m = i`. Run the dependency check after the edit: the new
   supplier is on main, so no UPWARD line is expected.

2. **F02** (P3) §6.3 names a Mathlib lemma whose hypothesis fails there

   Location: `design/README.md` line 1481–1485 ("differentiation under the integral is dominated because …";
   "*Needs:* … Mathlib `hasFDerivAt_integral_of_dominated_of_fderiv_le` (in its almost-everywhere-in-time
   absolutely continuous form via §1.2)"); plan.json 6.3 (`prerequisites`).

   Claim: the pinned lemma differentiates `t ↦ ∫ |F|² |E(t, ·)|^{−2}`.

   Witness: at the pin (`Mathlib/Analysis/Calculus/ParametricIntegral.lean` line 222) the hypothesis `h_diff`
   asks, for almost every `x`, a derivative at every `t` of a neighbourhood. For `q = 1_{[0,1]}`, `x = 0`:
   `|E(t, 0)|^{−2} = e^{−2t}` for `t ≤ 1` and `e^{−2}` after, with one-sided derivatives `−2e^{−2}` and `0` at
   `t = 1`. No "absolutely continuous form" of the lemma exists at the pin.

   Repair: route "for every `x`, `|E(t, x)|^{−2} − |E(s, x)|^{−2} = −2∫_s^t Re(q(r)/E(r, x)²) dr` (§3.2);
   multiply by `|F(x)|²`, integrate in `x` and exchange the integrals (Mathlib
   `MeasureTheory.integral_integral_swap`, `MeasureTheory/Integral/Prod.lean` line 481; the integrand is bounded
   by `2|F(x)|²|q(r)|e^{2∫₀ʳ|q|}`); for each `r ≥ s` the inner integral `∫ (F/E(r, ·))(F#/E(r, ·)) dx` vanishes
   by the product law of §2.6". *Needs:* §2.6, §3.2, §6.2; Mathlib `MeasureTheory.integral_integral_swap`; the
   same in `### From Mathlib`, Layer 6's Dependencies and plan.json 6.3. Tested on the instance:
   `e^{−2t} − e^{−2s} = −2∫_s^t e^{−2r} dr` for `s ≤ t ≤ 1`, and the difference is constant after `t = 1`, where
   `q = 0`.

3. **F03** (P3) §1.7 re-derives the measurability of a Carathéodory composition, which the pinned Tau Ceti has

   Location: `design/README.md` line 621–625 ("The composite `s ↦ F(s, Y(s))` is strongly measurable … because
   `Y` is a uniform limit of step functions"; "*Needs:* … Mathlib `StronglyMeasurable` limits"); plan.json 1.7
   (`prerequisites`: `mathlib:StronglyMeasurable`).

   Claim: the step has no pinned owner, and the *Needs:* line names its input.

   Witness: `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`
   (`TauCeti/MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean` line 41, at the pin): if `t ↦ g t x` is
   almost everywhere strongly measurable for each `x` and each `g t` is continuous, then `t ↦ g t (u t)` is
   almost everywhere strongly measurable for such `u`. The *Needs:* line names no declaration (the pattern of
   round 8's F05).

   Repair: replace the sentence by "The composite `s ↦ F(s, Y(s))` is almost everywhere strongly measurable for
   continuous `Y` by Tau Ceti `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`, applied on the
   ball `B` in the local form, after changing `F(t, ·)` on the null set of `t` where the Lipschitz bound fails";
   *Needs:* "§1.1, §1.2's Picard scheme; Tau Ceti `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`";
   add the declaration to `### From Tau Ceti` and to Layer 1's Dependencies, and mirror in plan.json 1.7. Tested on
   the Check `F(t, x) = P(t)x + G(t)`: each `F(t, ·)` is continuous and each section measurable, so the lemma gives
   the measurability of `P(s)Y(s) + G(s)`.

Three findings: one P2 (ownership against a roadmap on main) and two P3. All five findings of round 8 are
repaired. The dependency check shows no UPWARD or CYCLE line. Declared supplier gaps: none. Elaboration: not
available (this lane does not elaborate); the design stage has no `Suggested.lean`.

## Verified sound

**Repairs of round 8, finding by finding.**

- **F01 (P3), §9.3 integral bound — repaired.** Line 2113–2115: "so `∫_{J(s)} log|a_{t₁→t₂}| ≥ c_{m,C} |J(s)|`
  with `c_{m,C} > 0`, although the integrand vanishes where `e(p) = 0`"; fourth Check line 2126–2129; §4.3 in
  the *Needs:* line. Recomputed (table). poltoratski2024 line 1359–1369 read again: the bound is for the
  integral over `J(s)`.
- **F02 (P3), §6.6 at `t = 0` — repaired.** Line 1608–1610: "for every `t > 0` and `F ∈ PW_t` … for all
  `t > 0`"; Check line 1627–1628. No other statement about `B(E(t, ·))` is quantified over `t ≥ 0` (§6.2, §6.3
  read).
- **F03 (P3), compact-support form of `m` — repaired.** Line 1510–1515: "Compact support: if `q = 0` almost
  everywhere on `(T, ∞)` for some `T ≥ 0`, then `m = −Ẽ(T, ·)/E(T, ·)` on `ℂ₊`"; computed Check line
  1544–1549. Recomputed (table).
- **F04 (P3), Dependencies lines — repaired.** All nine lines read against the *Needs:* lines of their layer:
  each *Needs:* item is covered (Layer 9 also lists §6.5, used by a Check of §9.7; a superset). "How to read
  the build", line 430–431, agrees with the *Needs:* of Layer 6.
- **F05 (P3), unnamed Mathlib results — repaired** (differently, and correctly: the qualitative
  `HasStrictFDerivAt.toOpenPartialHomeomorph` gives no radius). Line 225–240 and the *Needs:* of §4.2, §8.9,
  §9.5. All six declarations opened at the pin (below); each description matches the statement.

**Repaired patterns in the rest of the design.** A pointwise bound where only an integral bound holds: none
found in §8.2–§8.5, §9.6. A statement at a parameter value where its object is undefined: none (§6.1–§6.3,
§7.3 read at `t = 0`). An input that is only a Check: none further (§6.5's compact-support bullet rests on
(2.2) of §3.2 and the new §6.4 bullet). A *Needs:* item without a declaration: one, R03; a named declaration
that does not apply: one, R02.

**Principles.** No route-specific shortcut; two suppliers, both earlier (R01 adds a third, on main); own
words with locators; no algorithm; no `Suggested.lean` at this stage. Process words, pull-request numbers,
machine paths, LaTeX delimiters: none (grep). plan.json: `gaps: []`, nine layers, 57 targets, 57 `**Checks.**`
blocks, 18 `### Examples`/`### Dependencies` headings; the statements of 1.7, 4.2, 6.3, 6.4, 6.6, 8.9, 9.3,
9.5 occur verbatim in the README.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

AutomorphicSpectralTheory §0.5 read at the head of its open pull request (README line 182–198: `Im F ≥ 0`,
kernel `(t − z)⁻¹ − t/(1 + t²)`, unique triple, `a = Re F(i)`, `dν = (1 + t²) dρ`): as cited.
AnalyticNumberTheoryPartI §0.23 is on main (README line 644). OperatorTheory/ToeplitzOperators Layers 2–5
(main, line 273–713), StochasticCalculus S6.5 (main, line 2249–2435) and PDE §6.2 (main, line 2252) exist as
named. `roadmaps resolve`: nothing found nowhere.

**Pinned declarations opened this round** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the manifest's revisions).
Mathlib: `Real.tendsto_integral_exp_smul_cocompact` (`Analysis/Fourier/RiemannLebesgueLemma.lean` line 205,
any `f : ℝ → E`); `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse`
(`…/ApproximatesLinearOn.lean` line 143, radius `(N⁻¹ − c)ε`, `closedBall b ε ⊆ s`);
`ContinuousLinearEquiv.toNonlinearRightInverse` (`Analysis/Normed/Operator/Banach.lean` line 66);
`Convex.norm_image_sub_le_of_norm_fderiv_le'` (`Analysis/Calculus/MeanValue.lean` line 550);
`taylor_mean_remainder_lagrange` (`Analysis/Calculus/Taylor.lean` line 330, `ContDiffOn ℝ n` on `uIcc`);
`Real.contDiff_sinh` (`DerivHyp.lean` line 317); `Measure.ext_of_charFun` (line 257);
`MeasureTheory.measure_limsup_atTop_eq_zero` (line 62); `Matrix.det_fin_two` (line 815);
`VitaliFamily.ae_tendsto_rnDeriv`, `ae_tendsto_lintegral_enorm_sub_div`, `ae_tendsto_average` (lines 658, 819,
856); `WeakDual.isCompact_closedBall` (line 270); `hasFDerivAt_integral_of_dominated_of_fderiv_le` (line 222);
`PhragmenLindelof.right_half_plane_of_bounded_on_real` (line 717);
`LipschitzWith.comp_absolutelyContinuousOnInterval` (line 344);
`IntervalIntegrable.absolutelyContinuousOnInterval_intervalIntegral` (line 451, real-valued); `ContractingWith`
(line 42); `Matrix.toEuclideanCLM`, `Matrix.l2_opNorm_toEuclideanCLM` (lines 101, 240);
`InformationTheory.klDiv`, `klDiv_of_not_ac`, `klDiv_self` (lines 56, 66, 74). Tau Ceti: `Matrix.hasFDerivAt_det`
(line 110, `IsUnit A.det`), `Matrix.fderiv_det_apply_adjugate` (line 75), `Matrix.det_exp` (line 75);
`TauCeti.halfSpacePoissonKernel`, `_pos`, `_le_mul` (lines 122, 147, 198: hypothesis `‖y − x₁‖ ≤ A‖y − x‖`,
factor `Aⁿ`, as §2.3 uses it); `integral_halfSpacePoissonKernel`, `halfSpacePoissonIntegral`,
`tendsto_halfSpacePoissonIntegral`, `harmonicOnNhd_halfSpacePoissonIntegral` (lines 135, 179, 297, 419);
`DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane` (line 118);
`TauCeti.lowerSemicontinuous_klDiv_finiteMeasure` (line 499); the two Carathéodory theorems (lines 196, 219)
and `TauCeti.le_mul_exp_of_le_add_mul_integral` (line 59). The other pinned ODE modules were read by header:
none states Liouville's formula, a propagator or a parameter-holomorphy theorem for integrable coefficients.

**Sources, the seeded sample** (each read at the cited line; the author flags no locator as unverified).

- §1.4, §1.6: romanov2014 line 218–219 (`det M ≡ 1`), line 220–222 (entire, with values in `C[0, x]`), line
  223–224 (chain rule): as cited. coddingtonlevinson1955 is waived.
- §2.1: poltoratski2024 line 250–254, 610–614; mauth2022 line 378–392 (Lemma 3 at line 390): as cited.
- §2.4: mauth2022 Lemma 4 line 404, Lemma 7 line 434: as cited; garnett2007 uncertified.
- §2.6: relied on round 8's reading (mauth2022 line 337–377, 430, 469, 487); constants recomputed (table).
- §3.1: poltoratski2024 line 136–166, (2.1) line 204, free case line 192–195; romanov2014 line 223–224: as
  cited.
- §4.1: poltoratski2024 (5.2) line 484–488, the note on Tao–Thiele's `a` line 490–491, (5.3) line 492–501,
  line 501–503, (5.4) line 508–517: as cited.
- §4.4: poltoratski2024 (5.5) line 545–548 (constant `1`), line 503–507; denisov2006 (194) line 3250–3255
  (constant `π`); taothiele2012 Lemma 6 line 680–683: as cited.
- §4.5: denisov2006 Lemma 9.1 (157)–(158) line 2510–2521, Lemma 9.2 line 2544–2556: as cited.
- §5.5: poltoratski2024 line 518–544; mauth2022 Lemma 19 line 711: as cited.
- §5.6: poltoratski2024 line 561–567; taothiele2012 line 210–220, Lemma 1 (5), (7) line 225–240: as cited.
- §8.2: poltoratski2024 Lemma 2 line 630 (proof from line 637); mauth2022 Lemma 21 line 794: as cited.
- §9.2: poltoratski2024 (9.2) line 1306, (9.4) line 1339, quotient line 1345–1347: as cited; the source's
  `ε₁` has the opposite sign convention and the two forms agree (table).
- §9.5: poltoratski2024 Lemma 10 line 1584–1663: as cited.
- §9.8: poltoratski2024 Theorem 1 line 578–586, line 54–57; mauth2022 Theorem 2 line 216, Theorem 5 line
  3820, proof line 3851–3862: as cited.

**Adversarial table** (hand algebra and plain Python; values computed this round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.4 Liouville | `A = [[1,1],[0,1]]`; time-ordered pair | `det e^{tA} = e^{2t}`; `e^B e^A = [[1,1],[1,2]]`, `det = 1`; `|tr P| ≤ n‖P‖` | holds | none |
| §1.6 derivative formula | `P = zA`; `P = 1/(z − t)` | `∫ e^{(t−r)zA} A e^{(r−s)zA} dr = (t − s)A e^{(t−s)zA}`; `∂ₜ(z/(z − t)) = z/(z − t)²` | holds | none |
| §1.7 measurability | `F = P(t)x + G(t)` | sections measurable, `F(t, ·)` continuous: the pinned lemma applies | holds; pinned | R03 |
| §2.1 kernel bound | `1 + x² ≤ 2(1 + a²)(1 + (x − a)²)`; `y(1 + u²)/(u² + y²) ≤ max(y, 1/y)` | both by cases `y ≥ 1`, `y < 1` | holds | none |
| §2.1 Schwarz integral | `z = i` | `(1/(πi))∫ i/(1 + x²) dν`, real; `S⁰ − S = −(i/π)∫ xh/(1 + x²)` | holds | none |
| §2.1 Cayley comparison | `z = 2i`, `x = 1` | `ζ − w = 2i(x − z)/((x + i)(z + i))`; `(8/9)/(10/9) = 4/5`; `(4/5)/(2π) = 2/(5π)` | holds | none |
| §2.1 Checks | `h = (x² − 1)/(x² + 1)`; pinned kernel at `1 + i`, `3` | partial fractions `−2/3`, `5/3`: `(2/π)(π/6) = 1/3`; `2/(2π · 5) = 1/(5π)` | hold | none |
| §2.1 covariance | dilation `λ` | `λ² Im z/(π|x − λz|²) = λ P(λz, x)` | holds | none |
| §2.3 constants | `h = 1_{[0,1]}`; ratio | `0.10242`; `2.4751`; `2.6180` | hold | none |
| §2.4 Check | `h = 1_{[0,1]}` along `−y/2 + iy` | `1/2 − arctan(1/2)/π = 0.3524 ≠ 1/2` | holds | none |
| §2.6 | `F = 1/(z + i)` | `−i/(1 − iz) = 1/(z + i)`; `‖F‖² = π`; `|F(i)|² = 1/4`; `∫P² = 1/(2π Im z)`; `𝓕g(w) = −2πi e^{−2πw}`, `w > 0` | holds | none |
| §3.1 | free; `q = ic`; `q = 1 + i` | coefficient `[[f, −z − g], [z − g, −f]]`; `(ΩQ)² = 2`; entries `3.5465, −1.3683, 0.8099`; norms `4.1133`, `4.9148` | holds | none |
| §3.1 Christoffel–Darboux | derivative | `M_λ*[(z − Q) − (conj λ − Q)]M_z = (z − conj λ)M_λ*M_z` | holds | none |
| §3.2 | equation for `E` | `(f − iz + ig)A + (−z − g + if)C` on both sides | holds | none |
| §4.1 | dictionary, concatenation, rules | `a′ = qe^{2izt}b#`, `b′ = qe^{2izt}a#`; `Λ = diag(e^{2izs}, 1)`; `c = 0.7 + 0.4i`: `1.60141`, `1.08600 + 0.62057i` | holds | none |
| §4.2, §4.3 | `q = 1_{[0,1]}` at `±5i` | `1.09337`, `0.10826`; `237.03`, `2384.6` | hold | none |
| §4.4 | `q = 1_{[0,1]}`; `q = 0.5 + 1.2i` on `[0, 0.7]` | `1.57067` on `[−4000, 4000]` vs `1.57080`; `1.85804` vs `1.85825`; `y(a − 1) = 0.48532`, `0.49873` | holds | none |
| §4.5 | algebra; real `f`, `z = 0` | `β′ = 2izβ + conj q a`; `∂ₜ(|a|² − |β|²) = 4 Im z|β|²`; `ρ′ = qe^{2izt}/a²`; `r = tanh F` | holds | none |
| §5.5 | `g = 1/a₂` | `|q⌃* − ρ₁| = |ρ₂|(1 − |ρ₁|²)/|1 + uρ₂ conj ρ₁| ≤ 2|ρ₂|`; `∫|1 − g|² dΠ ≤ 2π(1 − Re g(i))` | holds | none |
| §5.6 first order | `L = 0.4006` | `(b − ℓ)/a + ℓ(1/a − 1)`: bound `0.043377`; `w = −x/π` | holds | none |
| §6.3 | `q = 1_{[0,1]}`, `x = 0` | one-sided derivatives `−2e^{−2}`, `0` at `t = 1`; integral form exact | statement holds; cited lemma does not apply | R02 |
| §6.4 compact support | `f = 1_{[0,1]}`, `z = i` | `E = cosh √2 + √2 sinh √2`, `Ẽ = −i cosh √2`; `m = 0.443190i`; `−D/C = 0.591892i`, `−B/A = 0.385819i`; radius `1/(2 · 4.8527) = 0.10304` | holds | none |
| §6.4 limit point | free case under `J = −Ω`, `V = −Q_q`, `λ = −z` | `u′ = −zΩu`; `L²` solutions: multiples of `(ie^{itz}, e^{itz})` | holds; alternative owned on main | R01 |
| §6.5 masses, densities | `f ≡ 1` | `0.537329, 0.443190, 0.415910, 0.414219`; density at `2`: min `0.5000`, max `1.5000`, mean `0.866025` | hold | none |
| §6.6 | `t = 0` | `E(0, ·) = 1`, `PW_0 = {0}` | excluded | none |
| §6.7 Check | `f = 0.7` on `[0, 1.3]` | `0.537539` (quadrature `0.537539`); `−0.918466` (`−0.918466`); `klDiv = 0.456005`; bound `0.158293` | holds | none |
| §8.2 | `w(s) = 0` | left side `|0 − 1| = 1` | excluded by "almost every" | none |
| §8.9 route | `ty > 1`, disc of radius `c/t` | `g′ = t cos Φ/cos²`; `|γ cos|² ≥ tanh 1`; image radius `(N⁻¹ − c)ε = |g′(s)|r/2`; `|κ|² sinh 2ty′ = 2` | holds | none |
| §8.9 Check | `ty = 1.5` | `2.08202i`, `2.44481i` | holds | none |
| §9.2 | the Check's data, `α₁ = e^{0.4i}`, `α₂ = e^{−1.1i}` | determinant `2i`; closed forms off by `2·10⁻¹⁶`, `1·10⁻¹⁶`; `|a|² − |b|² = 1.0000000000000002` | holds | none |
| §9.3 | `υ = 1`, `Im e = 0` | `0` at `p = s`; `0.0003787` at `0.1`; mean `0.0001265`; sweep `2ⁿ/(3m) · C/2ⁿ = C/(3m)` | holds | none |
| §9.4 increment | translation rule | `α₁*² = e^{−2iβs}α₁²` gives `sin e*/sin(e* + 2iυ) = e^{2iβs} sin e/sin(e + 2iυ)` | holds | none |
| §9.5 | `υ = 1, 0.5, 2`; `Δ = 0.02, 0.01, 0.005` | `2.4204, 2.3250, 2.2792`; `9.497, 8.872, 8.582`; `0.6090, 0.5902, 0.5810`; limits `2.2346, 8.305, 0.572`; `Δ₁ = 0.0102697` | holds | none |
| §9.7 | (2.2) on `ℝ` | `(conj β − β)/√(w w̃) = 2i`; `β = α̃/α` unimodular | holds | none |
| §9.8 headline | route | `|1/√w + iβ/√w̃|² = 1/w + 1/w̃ + 2 > 0`; `b/a = (E − iẼ)/(E + iẼ)` | holds | none |

The rows of round 8's table for the text no repair touched and outside this round's sample (§2.2, §5.1, §5.3,
§6.1, §7.1–§7.3, §8.6–§8.8, §9.1) carry computed values and are relied on; §6.2, §6.8, §7.2, §7.3 and §9.4
were recomputed by hand this round and agree.

**Duplication audit.** `roadmaps grep` over main and the open heads, by object: "Hermite–Biehler": no match.
"de Branges": a reference in SpecialFunctionsGamma only. "outer function", "Paley–Wiener", "nontangential",
"Liouville's formula", "Dirac system": other objects or statements (as in round 8). "Grönwall": the
constant-rate form of StochasticCalculus (main, line 2958); §1.1 has an integrable kernel. "Weyl",
"limit point": UnboundedOperators §4.8 on main, R01. "Carathéodory": the pinned Tau Ceti modules; the
composition lemma is R03. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is
dropped, none is defined only by an open revision, no second copy. The board packages index was read: no
related package.

Overlap check: read PDE, StochasticCalculus, OptimalTransport, OperatorTheory/UnboundedOperators (main), MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, AnalyticNumberTheoryPartIII, AutomorphicSpectralTheory (open); Weyl's limit-point/limit-circle alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, not cited here (R01); the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; the half-space Poisson kernel and integral of bounded data, and the weak lower semicontinuity of `klDiv`: owner Tau Ceti, cited; nothing else shared.

**Shape.** Every layer ends with `### Examples` and `### Dependencies`; every definition has its API and at
least three Checks; every theorem has a locator; layers are named by their mathematics. The order of Layers
7–9 is forced (§8.6 needs §7.3, §8.7 needs §7.2 and §8.6, §9.3 needs §8.8–§8.9).

**Headline theorems for the package stage:** the non-linear Carleson theorem with its strong form (§9.8), the
non-linear Plancherel identities (§4.4, §5.4), the Szegő condition (§6.8), the Carathéodory theorems with a
holomorphic parameter (§1.2, §1.6), the outer-multiplier theorem (§2.8). The padding probe and the `#check`
comparison do not apply at the design stage.

**Copyright, licences and scope.** Wording: the README was set beside the source at 21 passages (the 15
sampled targets, and the Conventions' Dirac system, §9.1's definition, §9.3's statement and route, §2.3's
definition, §8.2's route, §9.4's definition). The longest shared run is nine words, in the hypothesis of §9.3
(poltoratski2024 line 1350–1352), a statement the mathematics fixes; no sentence of prose or proof plan is
shared. Arrangement: poltoratski2024 has ten sections (line 136, 170, 307, 361, 469, 588, 793, 1016, 1173,
1583). Layers 1–2 have no counterpart; Layers 4–5 (its §5) precede Layer 6 (the rest of its §2); Layer 8
merges its §6–§8; the order of Layers 7–9 is forced as above. Reuse: no table, figure or list is taken over.

Source independence: 21 passages compared with 5 sources, none shared; largest share poltoratski2024, 72 of 183 locators; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §2.2's only locator is garnett2007.
- poltoratski2024 §9, the "General case" continuity argument (line 1482–1533), was not re-derived; §9.6 states
  its conclusion and names the route.
- Whether the dependency check accepts the citation R01 adds was not run: this review edits no file.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- none

## For the human reviewers

- **Scope.** UnboundedOperators merged to main after the triage (`target.md`) treated it as an open pull request outside the merge order; R01 follows from that change. Whether §6.4 cites it or keeps its own derivation is a maintainer's ownership decision.
- **Scope.** Layer 9's locators are to arXiv version 14 of poltoratski2024; the README's References say mnatsakanyan2022 reports an error in the published proof, which version 14 replaces. Neither that passage nor the published text was read this round.
- **Licence.** poltoratski2024 was read as an OCR text of arXiv version 14; formulas garbled by OCR were recomputed, not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4a4f79f305710d30ff92d48cc469786b98f58241", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~9", "model": "fable", "worker": "chris-x52"} -->
