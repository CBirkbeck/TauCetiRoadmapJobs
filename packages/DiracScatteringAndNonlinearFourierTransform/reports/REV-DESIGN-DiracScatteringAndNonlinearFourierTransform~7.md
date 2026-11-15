<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6894953740 -->
Review (claude) of 1e2ca25

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §8.9: the exact forms carry `γ(ty)` where (2.2) forces `γ(ty′)`

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 1892–1893
   ("exactly `E(t, s) = α′ γ(ty) sin(t(s − (x′ − iy′)))/√w(s)` and
   `Ẽ(t, s) = α′ γ(ty) cos(t(s − (x̃′ − iy′)))/√w̃(s)`"), the Check at line 1905–1906 ("(2.2) at the real
   point `s` fixes the common factor `γ(ty)`"), and plan.json target 8.9 (`statement` and its third test).

   Claim: the values at `s` have the two forms with the old factor `γ(ty)` and the new height `y′`.

   Witness: for the two forms with factor `γ(c)` and `cos(t(x̃′ − x′)) = √(w w̃)`,
   `E conj Ẽ − Ẽ conj E = 2i sinh(2ty′)/sinh(2c)`. With `c = ty` this is `2i` only when `y′ = y`. Computed
   at `w = 0.7`, `w̃ = 0.9`, `t = 1`, `y = 1.5`: `y′ = 1.52` gives `2.0820i`, `y′ = 1.6` gives `2.4448i`;
   with `c = ty′` both give `2i`.

   Why it matters: (2.2) holds exactly at `s`, so the statement as written forces `y′ = y`, and then only
   `x′` and `arg α′` remain to match the three real parameters of `(E(t, s), Ẽ(t, s))`. Instance: the values
   `E₀, Ẽ₀` of the forms at `x = 0.3`, height `1.52`, factor `γ(1.52)` satisfy (2.2) and lie within `0.0022`
   and `0.0020` of the forms at `(x, y) = (0.3, 1.5)`; with factor `γ(1.5)` and `y′ = 1.5` the least
   mismatch of the two moduli over real `x′` is `0.0021 > 0`. §9.2 takes its input with `γ(t_k y_k)` and
   the same `y_k` inside `θ_k`, which is the corrected form. The slip is in both sources (Source issues).

   Repair (tested on the instance: `x′ = 0.3`, `y′ = 1.52`, `α′ = 1` is exact with `γ(ty′)`):

   - In §8.9 write `E(t, s) = α′ γ(ty′) sin(t(s − (x′ − iy′)))/√w(s)` and
     `Ẽ(t, s) = α′ γ(ty′) cos(t(s − (x̃′ − iy′)))/√w̃(s)`.
   - Replace the third Check by: "Moduli: two forms with common factor `γ(c)` have determinant
     `2i sinh(2ty′)/sinh(2c)` on `ℝ`, so (2.2) at `s` fixes the factor as `γ(ty′)`. With the factor `γ(ty)`
     of the sources and `y′ ≠ y` the determinant is not `2i`: `2.0820i` for `ty = 1.5`, `ty′ = 1.52`."
   - Mirror both in plan.json 8.9.

2. **F02** (P2) the subtracted-kernel Herglotz representation has an earlier owner

   Location: `design/README.md` line 679–687 (§2.2: "a nonnegative harmonic `u` on `ℂ₊` is
   `u(z) = c Im z + P[ν](z)` for a unique `c ≥ 0` and a unique Poisson-finite `ν`", route "with
   `ν = π(1 + x²)ρ`"); line 147–151 (Conventions, `m(z) = c + βz + (1/π)∫ (1/(x − z) − x/(1 + x²)) dμ(x)`);
   line 1480–1483 (§6.5).

   Claim: the conversion of the finite Nevanlinna measure `ρ` to the Poisson-finite measure and the
   uniqueness of the representation are this roadmap's to state.

   Witness: AutomorphicSpectralTheory §0.5 "Herglotz representation" (open pull request adding the roadmap,
   merge order line 98; its README line 182–198): `F(z) = a + bz + ∫[(t − z)⁻¹ − t/(1 + t²)] dν` with a unique
   triple, "the density conversion `dν = (1 + t²)dρ`" from the same Tau Ceti theorem.

   Repair (tested: `u = P[δ₀] = Im(−1/(πz))` has triple `(0, 0, δ₀/π)` there, so `ν = π · δ₀/π = δ₀`, `c = 0`;
   `u = Im z` has `(0, 1, 0)`, so `c = 1`, `ν = 0`, as §2.2's Checks say):

   - §2.2: cite AutomorphicSpectralTheory §0.5 for the holomorphic statement and keep as this roadmap's
     target only what differs, said in one clause: the passage from a nonnegative harmonic `u` to a
     holomorphic `F` with `Im F = u`, the dictionary `c = b`, `ν = π ν_F`, the mass formula
     `πy u(iy) − πc y² ↑ ν(ℝ)` and the vague-limit description of `ν`.
   - §6.5 and the Conventions: say that `μ_q/π`, `β`, `Re m(i)` is the triple of §0.5 for `m`.
   - Add `### From TauCetiRoadmap.AutomorphicSpectralTheory` with §0.5 to the supplier contracts, a
     deferral line in Scope, the item to the *Needs:* lines of §2.2 and §6.5, and the supplier to
     plan.json (`suppliers`, prerequisites of 2.2 and 6.5). Rerun the dependency check.

3. **F03** (P2) the README says that Layers 7–9 follow sections of a source

   Location: `design/README.md` line 54 ("(Poltoratski §§6–8)"), line 56–57 ("(Poltoratski §9)"), line 1617
   ("as in poltoratski2024 §§3–9"), line 1920–1922 ("The route of this layer is the argument of
   poltoratski2024 §9 of arXiv version 14, whose subinterval calculus and resonance lemmas are stated here
   as targets"); also line 96–98 ("as in the source", "where the source's argument is written").

   Claim: the organisation of Layers 7–9 is the roadmap's own.

   Witness: the sentences above name a source's sections as the scope of Layer 8 and Layer 9 and as the
   route of Layer 9. The order itself is forced and is no finding: §8.6 needs §7.3, §8.7 needs §7.2 and
   §8.6, §9.3 needs §8.8–§8.9, §9.6 needs §8.6–§8.9.

   Repair (the locators at the claims stay; no layer moves):

   - Line 53–57: delete the two parentheses.
   - Line 96–98: "The headline theorem of Layer 9 is stated for real potentials, the generality of
     poltoratski2024 Theorem 1 (line 579–581). Layers 1–6 are stated for complex potentials `q = f + ig`
     (the system with `Q_q = [[g, f], [f, −g]]`), and Layers 7–9 for real `f`."
   - Line 1617: "From here on the potential is real, `q = f`."
   - Line 1920–1922: "The potential is real and square-integrable. Locators in this layer are to arXiv
     version 14 of poltoratski2024 (References)."

4. **F04** (P3) §8.9 is stated for almost every `s`; the source's statement is pointwise

   Location: `design/README.md` line 1888 ("for almost every `s` and every `C > 1` there are `ε₀ > 0` and
   `D = D(C, s)`"); plan.json 8.9.

   Claim: the matching statement holds off an unspecified null set.

   Witness: poltoratski2024 line 1116–1117: Lemma 8 is for every `s ∈ ℝ` with `w(s) w̃(s) ≠ 0`. The proof
   (line 1141–1172) uses only the two positive numbers and (2.2); §9.2 is already stated that way.

   Repair: "Let `s ∈ ℝ`, `w, w̃ > 0` and `C > 1`. There are `ε₀ > 0` and `D`, depending only on `C`, `w`, `w̃`,
   such that if for some `t > 0` entire `E`, `Ẽ` with `E Ẽ# − Ẽ E# = 2i` at `s` satisfy the two approximations
   on `Q(s, 3C/t)` …", with `√w`, `√w̃` in place of `√w(s)`, `√w̃(s)`; §9.3 and §9.6 apply it at the points
   where `w(s) w̃(s) ≠ 0`, almost every `s` by §6.8.

5. **F05** (P3) §6.8 takes the weak convergence `ν_T → ν` from inside §6.6's route

   Location: `design/README.md` line 1590 ("The measures `ν_T` converge weakly to `ν` (§6.6)").

   Claim: §6.6 states this convergence.

   Witness: §6.6 (line 1505–1507) states the isometric embedding and uniqueness only; the convergence
   appears in its route (line 1508–1511).

   Repair: add an API bullet to §6.5: "Truncations: with `μ_T = dx/|E(T, ·)|²`, the measures `ν_{μ_T,0}` of
   §6.7's form converge weakly on the circle to `ν_{μ_q,β}` as `T → ∞`, and their masses `Im m_T(i)` to
   `Im m(i)`" (route: `m_T → m` locally uniformly, §6.4, so the Herglotz transforms on the disc converge and
   the masses are bounded), with *Needs:* Tau Ceti `TauCeti.boundaryCayley`. Cite it from §6.6 and §6.8;
   mirror in plan.json 6.5, 6.6, 6.8. Tested on the free case: `μ_T = dx`, `ν_T = σ` for every `T`.

6. **F06** (P3) §2.2's route names the wrong derivative

   Location: `design/README.md` line 681–682 ("`u = Im F` with `F` holomorphic on `ℂ₊`, `F′` being the
   conjugate complex partial of `u`").

   Claim: `F′ = ∂ₓu + i∂ᵧu`.

   Witness: `u = Im z`, `F = z`: `F′ = 1`, while `∂ₓu + i∂ᵧu = i` and `∂ₓu − i∂ᵧu = −i`.

   Repair: write "`F′ = i(∂ₓu − i∂ᵧu)`, `i` times the complex partial of `u`, which is holomorphic by
   Mathlib's `HarmonicAt.differentiableAt_complex_partial`"; on the instance `i · (−i) = 1`.

Six findings: three P2 (blocking) and three P3. All five findings of round 6 are repaired. The
dependency check shows no UPWARD or CYCLE line. The blocking findings are new this round:

- §8.9 copies a normalising factor from the sources that the determinant identity (2.2) contradicts.
- §2.2, §6.5 and the Conventions own the subtracted-kernel Herglotz representation that
  AutomorphicSpectralTheory §0.5 (open, earlier in the merge order) already owns.
- Four sentences say that Layers 7–9 follow sections of one source.

Elaboration: not available (this lane does not elaborate); the design stage has no `Suggested.lean`.

## Verified sound

**Repairs of round 6, finding by finding.**

- **R01 (P2), relative entropy — repaired.** Line 1533–1535: "is, in Mathlib's terms,
  `S(σ | ν) = ν(X) − σ(X) − klDiv σ ν`, read as `−∞` when `klDiv σ ν = ∞`". §6.7's one target is the
  transport identity. Opened at the pin: `InformationTheory.klDiv`
  (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean` line 56, body
  `if μ ≪ ν ∧ Integrable (llr μ ν) μ then ENNReal.ofReal (∫ llr + ν.real univ − μ.real univ) else ∞`),
  `klDiv_of_not_ac` 66, `klDiv_self` 74, `integral_llr_add_sub_measure_univ_nonneg` 147,
  `mul_log_le_klDiv` 355 (finite measures, left side through `ENNReal.ofReal`), `MeasureTheory.llr`
  (`LogLikelihoodRatio.lean` 37); Tau Ceti `InformationTheory/KullbackLeibler/Variational.lean` 457
  (finite measures, `(μ + ν).WeaklyRegular`) and 499 (pseudometrizable Borel space); `Circle` instances at
  `MeasureTheory/Group/Circle.lean` 32, 34. killipsimon2003 line 1812–1819 defines `S` as the README says.
- **R02 (P3), §9.8 locator — repaired.** Line 2080–2081: "Theorem 5 line 3820 with the proof at line
  3851–3862 for the reduction to the absence of resonances"; mauth2022 line 3820 is Theorem 5 and line
  3855 combines it with Corollary 6.
- **R03 (P3), §5.6 locator — repaired.** Line 1336: "taothiele2012 Lecture 1 Lemma 1 (5), (7) line 225–240
  and line 210–220"; read there: the shift rule (5), the unimodular rule (7), the linearisation.
- **R04 (P3), §2.2 locator — repaired.** Line 681 cites garnett2007 only; line 635 carries "mauth2022 Lemma 3
  line 390–392", which states harmonicity of the Poisson extension.
- **R05 (P3), disc Hardy space — repaired.** Line 83–88 names `TauCeti.HardySpace`
  (`Analysis/Fourier/Hardy/Basic.lean` line 43; the folder has `Toeplitz.lean`, `ReproducingKernel.lean`,
  `BoundaryUniqueness.lean`, `DiskFunction.lean`) and "OperatorTheory/ToeplitzOperators, Layers 2–5",
  which are headings of that README on main (line 273, 400, 567, 713).

**Repaired patterns in the rest of the design.** Duplication of a pinned or planned object: searched by
object (below); one hit, R02. Locator into a text that does not state the claim: 31 passages read this
round, none found beyond the copied slip of R01.

**Principles.** No route-specific shortcut; no roadmap re-planned; one supplier, earlier in the order;
own words with locators; no algorithm; no `Suggested.lean` at this stage, so no sorry'd data and no
`set_option`. Process words, pull-request numbers, machine paths, LaTeX delimiters, `lemma`: none (grep).
plan.json: `gaps: []`, nine layers with 7, 8, 3, 5, 6, 8, 3, 9, 8 targets.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AnalyticNumberTheoryPartI §0.23 is on main (README line 644, merge order line
50). PDE §6.2 (line 2252) and StochasticCalculus S6.5.1 (line 2310), named in Scope and Downstream
consumers, exist on main. Declared gaps: none.

**Pinned declarations opened this round** (file and line as the contracts give them, each declares the
name): the ten of R01 above and `TauCeti.HardySpace` 43; `TauCeti.halfSpacePoissonKernel_le_mul` 198 (hypothesis
`‖y − x₁‖ ≤ A‖y − x‖`, bound with `Aⁿ`, as §2.3 uses it); `TauCeti.integral_halfSpacePoissonKernel` 135;
`TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` 436;
`TauCeti.integral_circle_eq_atom_add_integral_cayleyPushforward` 188; `Measure.cayleyPushforward` 176;
`TauCeti.maximalFunction` 125; `DifferentiableOn.hasDerivAt_wedgeIntegral_upperHalfPlane` 118;
`TauCeti.norm_convolutionLp_le` 117; Mathlib `HarmonicAt.differentiableAt_complex_partial` 35,
`hasFDerivAt_integral_of_dominated_of_fderiv_le` 222, `TendstoLocallyUniformlyOn.differentiableOn` 136,
`MeasureTheory.measure_limsup_atTop_eq_zero` 62, `Measure.ext_of_charFun` 257. The other locators of the
contracts were opened by script in round 6 and the pins have not moved.

**Sources, seeded sample** (each read at the cited line unless marked):

- §1.6: romanov2014 line 220–222 (the fundamental solution is entire with values in `C[0, x]`): as cited.
- §2.2: garnett2007 only, uncertified; checked by its route (R02, R06) and its Checks.
- §2.3: poltoratski2024 line 615–622 (sector `|Re(z − x)| < Im z < 1`, maximal function); mauth2022 line
  411–420, Lemma 5 and Corollary 1 line 421–427, Lemma 6 line 430: as cited.
- §4.1: poltoratski2024 (5.2) line 484–488, (5.3) line 492–501, line 501–503, (5.4) line 508–517;
  mauth2022 line 187–189: as cited.
- §4.3: poltoratski2024 line 503–507; taothiele2012 Lemma 3 line 296: as cited.
- §4.4: poltoratski2024 (5.5) line 545–548 (printed with constant `1`); denisov2006 (194) line 3250–3255;
  taothiele2012 Lemma 6 line 680–683: as cited.
- §5.1: denisov2006 Theorem 11.1 line 3246–3255 (uniform in `Im λ > ε`), (245) and `a(r) = 2 Re A(2r)` line
  4229–4230; poltoratski2024 line 518–529: as cited.
- §5.3 and §5.5: poltoratski2024 line 518–548 and 567–577; mauth2022 Lemma 19 line 711: as cited.
- §6.1: poltoratski2024 line 209–235 and (2.4) line 245–249; mauth2022 line 490–512 (Lemma 12 at 509),
  Lemma 20 line 735; romanov2014 Theorem 5, (16), (18) line 812–821: as cited.
- §6.4: romanov2014 Theorem 15 line 2217, Lemma 23 line 2370: as cited.
- §6.5: poltoratski2024 line 255–264; mauth2022 line 692–701; romanov2014 line 2275–2281: as cited.
- §8.2: poltoratski2024 Lemma 2 line 630 (proof from 637); mauth2022 Lemma 21 line 794: as cited.
- §8.7: poltoratski2024 Corollary 3 line 1002–1012 with `T₁` at line 997–1001; mauth2022 Corollary 6 line
  1397–1408: as cited. Part (2) is in Mauth's form ("no `t` in `T₀` for large `t`").
- §8.9: poltoratski2024 Lemma 8 line 1116–1172; mauth2022 Lemma 45 line 3251: R01, R04.
- No locator is flagged unverified by the author.

**Adversarial table** (plain Python; scattering system by fourth-order Runge–Kutta; values computed this
round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.6 parameter dependence | `P = 1/(z − t)` on `[0, 1]` | `N(t, 0) = exp(log z − log(z − t)) = z/(z − t)`, pole at `z = t` | Check holds | none |
| §1.6 Dirac coefficient | `−Ω(z − Q_q)` | `[[f, −z − g], [z − g, −f]]`, trace `0`, norm `≤ |z| + |q|` | holds | none |
| §2.2 representation | Nevanlinna kernel | `Im = β Im z + ∫ P(z, x) π(1 + x²) dρ`; `πy P[ν](iy) = ∫ y²/(x² + y²) dν ↑ ν(ℝ)` | holds | R02 |
| §2.2 route | `u = Im z` | `F′ = 1`, `∂ₓu + i∂ᵧu = i`, `i(∂ₓu − i∂ᵧu) = 1` | wording wrong | R06 |
| §2.3 cone comparison | `(d + αy)² + y² ≤ max(2, 1 + 2α²)(d² + y²)` | `α = 1`: sup `2.618 ≤ 3`; `α = 0.9`: `2.392 ≤ 2.62`; `α = 1/√2`: `2.000 = 2`; `α = 0.7`: `1.987 ≤ 2` | holds | none |
| §2.3 Checks | `h = 1_{[0,1]}`, `x = 2`; `s = 2` | `P[h](2 + i) = 0.10242`; maximal function `1/4`; ratio `5/2.0201 = 2.4751`; `((1 + √5)/2)² = 2.6180` | hold | none |
| §2.6 constants | `F = 1/(z + i)` | `‖F‖² = π`, `|F(i)|² = 1/4 = π/(4π)`; `∫ P(z, x)² dx = 1/(2π Im z)`; `𝓕g(w) = −2πi e^{−2πw}` for `w > 0` | hold | none |
| §2.8 outer | `h = log|x + i|` | `(1/π)∫ ½ log(1 + x²)/(1 + x²) = log 2`, `O_h(i) = 2 = −i · 2i` | holds | none |
| §3.2 equation | algebra | `E′ = −iz(A − iC) + q(A + iC) = −izE + qE#` | holds | none |
| §4.1 dictionary | algebra; free case | `a′ = e^{itz} q (E# + iẼ#)/2 = e^{2izt} q b#`; `a = 1`, `b = 0` | holds | none |
| §4.1 concatenation | `D = diag(e^{−izs}, e^{izs})` | row 2 of `D G₂ D⁻¹ G₁`: `(e^{2izs} b₂ a₁# + a₂ b₁, e^{2izs} b₂ b₁# + a₂ a₁)` | holds | none |
| §4.1 Checks | `c = 0.7 + 0.4i`, `T = 1.3`; translation `t₀ = 0.6` | `a = 1.6014069`, `b = 1.0859997 + 0.6205712i`; differences `2·10⁻⁶`, `8·10⁻⁶` | hold | none |
| §4.3 inequality | `q ∈ {1, 0.3 + 2i, 3}`, grid in the closed half-plane | `min(|a|² − |b|²) = 1.000000`; `min |a| = 1.0018, 1.0158, 1.1230` on this grid | holds | none |
| §4.3 route | `c = c₁(1, i) + c₂(1, −i)` | `h(c) = |c₁|² − |c₂|²`; `∂ₜh = Im z |X|²`; optimum `r = |a||b|/(|b|² + 1)` gives `|a|² ≥ 1 + |b|²` | holds | none |
| §4.3 lower half-plane | `q = 1`, `z = −5i` | `|a| = 237.03`, `|b| = 2384.6` | Check holds | none |
| §4.4 Plancherel | `q = 1` on `[0, 1]` | `∫_{−400}^{400} = 1.569545`, with tail `1/800`: `1.570795`; `π/2 = 1.570796`; `y(a − 1) = 0.48532` at `y = 10` | holds | none |
| §4.5 Riccati | algebra | `∂ₜ(|a|² − |β|²) = 4 Im z |β|²`; `r′ = 2izr + conj q − q r²`; `ρ′ = q e^{2izt}/a²` | holds | none |
| §5.1 bound | `q = 1_{[0,1]}`, `z = 5i` | `a = 1.0933679`, `log a = 0.0892628 ≤ 0.2`; tail `e^{−2yt}/(2√y)` | holds | none |
| §5.3 boundary law | `ρ₁ = ρ₂ = 1/2`, `u = 1` | `q⌃* = 0.8`; `1 − 0.64 = 0.36 = 0.5625/1.5625` | holds | none |
| §5.5 bound | algebra | `|q⌃* − ρ₁| = |ρ₂|(1 − |ρ₁|²)/|1 + uρ₂ conj ρ₁| ≤ |ρ₂|(1 + |ρ₁|)`; `∫|1 − g|² dΠ ≤ 2π − 2π Re g(i)` | holds | none |
| §6.1 kernel | `E = z + i` | `E(z) conj E(w) − E#(z) conj E#(w) = 2i(conj w − z)`, `K = 1/π`, `‖1/π‖² = 1/π` | holds | none |
| §6.4 disc | free, `t = 1.7`, `z = 0.6 + 0.25i` | `1 − e^{−0.85} = 0.57259 < 1`; centre `1.44703i`, radius `1.04590 = 1/sinh(2t Im z)` | holds | none |
| §6.4 boundary data | `X(0) = (w, 1)` | `h(0) = −Im w`; `u − iv = Ẽ + wE`, `u + iv = Ẽ# + wE#`; `Im(−Ẽ conj E) = 1` on `ℝ` | holds | none |
| §6.5 densities | `f = 0.7` on `[0, 1.3]`, `x = 0` | `m(0) = 0.1620258 i`, `w w̃ = 1`; `w̃ = w/|m|²` | holds | R02 |
| §6.7 transport | `μ = 2dx`; definition at the pin | `log(1/2) + 2 − 1 = 0.306853`; `∫ llr dσ = −(1/π)∫ log w dΠ` | holds | none |
| §6.8 route | inequalities | `log w_T ≥ −2 log 2 − 2 log|a|`, `dΠ ≤ dx`; `klDiv σ ν ≤ lim inf klDiv σ ν_T` | holds | R05 |
| §8.1 | `γ(1)`; `γ² sin²` range | `0.7425908`; `[tanh p, coth p]` | holds | none |
| §8.7 (1) → (2) | `γ(p) sin(A + ip)` | `= γ e^{p}(i/2) e^{−iA}(1 + O(e^{2|Im A| − 2p}))`, `γ e^p → 2`; free case `e^{−itz} + i·i·e^{−itz} = 0` | holds | none |
| §8.8 determinant | two approximants, `t(ũ − u) = Φ` | `Im(sin θ conj cos(θ − Φ)) = ½ cos Φ sinh 2p`; `2i cos Φ/√(w w̃)`; `2/0.7937 = 2.52` | holds | none |
| §8.9 exact forms | `w = 0.7`, `w̃ = 0.9`, `ty = 1.5` | factor `γ(ty)`: `2i`, `2.0820i`, `2.4448i` at `ty′ = 1.5, 1.52, 1.6`; factor `γ(ty′)`: `2i` each | false as written | R01 |
| §9.2 identities | algebra | `A − B = e + 2iυ`; `|a|² − |b|² = sinh 2υ sinh 2(υ + ε₂)/N² = 1`; quotient `−e^{2ist₁} α₁² sin e/sin(e + 2iυ)` | holds | none |
| §9.5 expansion | algebra | `Δ₁ = Δ + 2CΔ²/S`, `Δ₂ = Δ + 4CΔ²/S`, difference `2CΔ²/S²`; `2 cosh 1/sinh² 1 = 2.2346` | holds | none |
| §9.7 limits | algebra; free case | `|E + iẼ|² → 1/w + 1/w̃ + 2 Re(iβ)/√(w w̃)` with `Re(iβ) = √(w w̃)`; `α = i`, `β = −i` give `E = e^{−itz}`, `Ẽ = −ie^{−itz}` | holds | none |
| §9.8 headline | route | limit `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`, denominator of modulus² `1/w + 1/w̃ + 2 > 0` | holds | none |

**Duplication audit.** `roadmaps grep` over main and the 475 open heads: "Hermite–Biehler", "non-linear
Fourier", "Paley–Wiener space", "Dirac system", "Poisson-finite", `H²(ℂ₊)`: no match. "de Branges":
SpecialFunctionsGamma §6.4, an integral, unrelated. "nontangential": StochasticCalculus S6.5 (circle,
finite measures), named in Scope. "Weyl function": a reference title in UnboundedOperators only.
"Carathéodory": AsymptoticExpansions cites the pinned `TauCeti/Analysis/ODE/`. "Liouville's formula":
IncompressibleFlows, for flows of vector fields. "Herglotz": AutomorphicSpectralTheory §0.5 (R02).
`scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, none is defined
only by an open revision. The board packages index was read; no related package.

Overlap check: read PDE, OptimalTransport, StochasticCalculus (main), MathematicalStatisticsAsymptotic,
AutomorphicSpectralTheory (open); the subtracted-kernel Herglotz representation is shared with
AutomorphicSpectralTheory §0.5, its owner (R02); `klDiv` is Mathlib's for all; nothing else shared.

**Shape.** Every layer ends with Examples and Dependencies; every definition read has its API and at
least three Checks; every theorem a locator. Layers are named by their mathematics.

**Headline theorems for the package stage:** the non-linear Carleson theorem with its strong form
(§9.8), the non-linear Plancherel identities (§4.4, §5.4), the Szegő condition (§6.8), the Carathéodory
theorems with a holomorphic parameter (§1.2, §1.6), the outer-multiplier theorem (§2.8). The padding
probe and the `#check` comparison do not apply at the design stage.

**Copyright, licences and scope.** Wording: the README was set beside the source at 31 passages (the
sample above, and the routes of §7.2, §8.2, §8.6, §9.4, §9.6 against poltoratski2024 line 332–348,
646–653, 850–866, 1380–1390, 1534–1540). The longest shared run is five words, in a step the mathematics
forces. Arrangement: poltoratski2024 has ten sections. Layers 1–2 have no counterpart; Layer 3 ↔ §1 and
part of §2; Layers 4–5 ↔ §5; Layer 6 ↔ the rest of §2; Layer 7 ↔ §§3–4; Layer 8 ↔ §§6–8; Layer 9 ↔
§§9–10. The map is not one to one and not in the source's order (§5 precedes §2 here); the order of
Layers 7–9 is forced by the *Needs:* lines named in R03. The sentences that tie layers to sections are
R03. Reuse: no table, figure or list is taken over.

Source independence: 31 passages compared with 6 sources, none shared; largest share poltoratski2024, 72 of 183 locators; contents compared with poltoratski2024: independent in arrangement, four sentences naming its sections (R03).

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018,
  krein1955 (waived): cited by locator only. §2.2's only locator is garnett2007.
- poltoratski2024 §9 between the sampled statements: the "General case" continuity argument (line
  1482–1533) was not re-derived.
- Whether §8.7 (2) holds when `t y(t)` stays bounded: the README states Mauth's form and both sources
  state it without that case; not settled here.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Error** in poltoratski2024 at Lemma 8, (8.5), printed p. 29–30 (line 1134–1138, 1160–1165): the source says the exact forms at `s` carry the factor `γ(ty)` with the new height `y′` inside the sine and cosine; it should be `γ(ty′)`, which is what (2.2) gives; affects a stated result.
- **Error** in mauth2022 at Lemma 45, (58), printed p. 62–63 (line 3264–3268, 3292–3298): the source says the determinant of the two forms with factor `γ(ty)` and height `y′` is `2i`; it should be `2i sinh(2ty′)/sinh(2ty)`, so the factor must be `γ(ty′)`; affects a stated result.
- **Misprint** in mauth2022 at Corollary 6, (20), printed p. 29 (line 1404–1406), and in the proof of the main theorem, printed p. 74 (line 3857–3862): the source says the approximant of `E(t, z)` is a multiple of `e^{itz}`; it should be `e^{−itz}`, as the free case shows; affects a stated result.

## For the human reviewers

- **Scope.** R02 makes this analysis roadmap cite AutomorphicSpectralTheory §0.5, an open pull request, for a function-theoretic fact; the merge-order rule gives that owner. Whether the Herglotz section should move to a common supplier is a maintainer's decision.
- **Licence.** poltoratski2024 was read as an OCR text of arXiv version 14 (`sources.toml` `version_note`); its §9 differs from the published Annals version, which was not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1e2ca2535e6c6daea56e611b8194560304e372b6", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~7", "model": "fable", "worker": "chris-x55"} -->
