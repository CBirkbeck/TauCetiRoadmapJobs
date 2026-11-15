<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6899321907 -->
Review (claude) of 2595071

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §9.6: the three modulus relations do not follow from §9.2 and cannot contradict §9.5

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 2250–2253 (§9.6), and
   the mirrored statement of `design/plan.json` target 9.6: "comparing moduli on `(t₁, t₂)`, `(t₂, t₃)` and
   `(t₁, t₃)` gives the three relations of §9.5, whose conclusion contradicts the third relation".

   Claim: for vertical increments, the moduli of the subinterval transforms of `f` and of the modified
   potential satisfy the two hypotheses of §9.5 and the negation of its conclusion.

   Witness (computed from §9.1–§9.2, plain Python, `w = 0.7`, `w̃ = 0.9`, `υ = 1`, `Δ = 0.01`). By §9.2,
   `|(f 1_{(t_j,t_k)})⌃(s)| = |sin(θ_k − θ_j)/sin(θ_k − conj θ_j)|`, the pseudo-hyperbolic distance of
   `e^{2iθ_j}`, `e^{2iθ_k}`. Heights `1, 0.99, 0.98`: `0.00278601`, `0.00284450`, `0.00563047`. §9.5's second
   relation needs `sinh Δ/sinh(2υ − 2Δ) = 0.00281510`; the true value is `sinh Δ/sinh(2υ − 3Δ)`. Modified heights
   `1, 1 + Δ₁, 1 + Δ₁ + Δ₂` with `Δ₁ = 0.0102119`, `Δ₂ = 0.0106540` reproduce all three moduli, the third to
   `2·10⁻¹⁶`.

   Why no rearrangement helps: for collinear points the pseudo-hyperbolic distance adds,
   `d₁₃ = (d₁₂ + d₂₃)/(1 + d₁₂ d₂₃)` (`0.0056304720` both sides above), so equality on `(t₁, t₂)` and `(t₂, t₃)`
   forces equality on `(t₁, t₃)`. By §9.4, inserting a zero interval after `t₁` multiplies every
   `(f 1_{(t₁,t_k)})⌃(s)` by the same `e^{2iβs}`: it rotates the points `e^{2iθ_k}` about `e^{2iθ₁}` by a
   hyperbolic isometry. The moduli at `s` therefore cannot exclude a resonance, in the special or the general
   case. The step is taken from poltoratski2024 line 1500–1511, which prints the second relation with
   `sinh(υ + Δ₁ + Δ₂)` and `sinh(υ − 2Δ)` (see Source issues); the other proof the README knows is the one in
   which mnatsakanyan2022 (line 9–13, 135–137) reports an error (README line 2341–2343). mauth2022 Theorem 5
   (line 3820) follows that earlier argument. So §9.6, and with it the unconditional §9.7 and §9.8, has no owner.

   Two further slips in the same passage, which the repair removes: the increments `e = τ = iΔ`,
   `e* = −iΔ₁` are the source's `ε = ε₁ − iε₂ = −e`, not the `e = ε₁ + iε₂` of §9.2; and §9.6 is stated for `E`
   only, while §9.7 applies it to `Ẽ`.

   Repair (README and the mirrored entries of plan.json; no supplier changes):

   1. Replace §9.6 by a definition, "### 9.6 Resonance-free points": define `R(f)` as the set of `s ∈ ℝ` such
      that for every `C > 0` there is `T(s, C)` with `Q(s, C/t)` free of zeros of `E(t, ·)` and of `Ẽ(t, ·)` for
      `t > T(s, C)`. API: for `s ∈ R(f)` there is `C(t) → ∞` with `Q(s, C(t)/t)` free of zeros of both for large
      `t`; `Ẽ_f = −i E_{−f}` (conjugation of the system by `Ω`), so the condition on `Ẽ` is the condition on `E`
      for `−f`; `R(f) = ℝ` for compactly supported `f`. Checks: the free case; compact support; `f ≡ c`,
      `s ∈ (−c, c)` (not square-integrable); and the computed instance above, recorded as "the moduli of the
      subinterval transforms at `s` do not exclude a resonance: heights `1, 0.99, 0.98` and
      `1, 1.0102119, 1.0208659` give the same three moduli". *Needs:* §3.3, §8.1.
   2. §9.7 and §9.8: replace "for almost every `s`" by "for almost every `s ∈ R(f)`" (outside a null set),
      retitle §9.8 "Pointwise convergence at resonance-free points", and cite for it poltoratski2024 (9.9)–(9.10)
      line 1538–1582 and mauth2022 line 3851–3862 (the reduction). The routes and Checks of §9.7–§9.8 stand; in
      §9.8 the Check on integrable `f` and the Example `f(s) = (1 + s)^{−1}` are restated for `s ∈ R(f)`.
   3. Delete §9.4 and §9.5, whose only consumer was the deleted route, with the Mathlib contract bullet "For the
      expansion in §9.5" and the two plan.json targets; §9.3 stays with its *Needs:* line. Remove §9.4 and §9.5
      from the dependency lists.
   4. Summary, Scope (Layer 9 bullet and the paragraph on the headline of Layer 9), "How to read the build",
      Downstream consumers and the poltoratski2024 entry of the References: state the conditional theorem; say
      in the Scope that the statement `|ℝ ∖ R(f)| = 0` for every real `f ∈ L²` (poltoratski2024 Theorem 1) is not
      claimed by this roadmap, and drop the sentence that version 14 proves the absence of resonances.

   Tested on the instance: with `R(f)` as a hypothesis, the configuration above (a resonance moving at heights
   `1, 0.99, 0.98`) contradicts no statement of the repaired Layer 9.

2. **F02** (P3) §8.6 route: the arguments of `D` are exchanged

   Location: `design/README.md` line 2003–2005 (and the mirrored statement of plan.json target 8.6): "so
   `D(t, z(t), ·) = iβE(t, ·)`, and §8.5 makes `iβE` close to `sin(t(· − z(t)))/w(s)`".

   Claim: with `D(t, λ, z) = A(t, z)C(t, λ) − C(t, z)A(t, λ)` (Layer 8 preamble, line 1879–1880).

   Witness: `A(z(t)) = β`, `C(z(t)) = −iβ` give `D(t, z(t), z) = −iβA(z) − βC(z) = −iβE(t, z)`, and §8.5 gives
   `D(t, z(t), z) ≈ sin(t(z(t) − z))/w(s)`. The source has the same slip (poltoratski2024 line 872).

   Repair: "so `D(t, ·, z(t)) = iβE(t, ·)`, since `D(t, λ, z(t)) = βC(t, λ) + iβA(t, λ)`, and §8.5 makes `iβE`
   close to `sin(t(· − z(t)))/w(s)`". Tested: `βC(λ) + iβA(λ) = iβ(A − iC)(λ)`, and §8.5 at `z = z(t)` reads
   `D(t, λ, z(t)) ≈ sin(t(λ − z(t)))/w(s)`. The conclusion `2|β|²w(s) = (1 + o(1)) sinh(2t y(t))` is unchanged.

Two findings: R01 (P1, blocking) and R02 (P3). Round 10's single finding is repaired. R01 is new: the proof
route of §9.6, on which the headline theorem of §9.8 rests, uses three relations that the roadmap's own
exact formulas of §9.2 do not give, and the relations that §9.2 does give can never contradict each other.
No cited source supplies another proof of §9.6. The dependency check shows no UPWARD or CYCLE line. Declared
supplier gaps: none. Elaboration: not available (this lane does not elaborate; say so in the report); the
design stage has no `Suggested.lean`, so the padding probe and the `#check` comparison do not apply.

## Verified sound

**Repair of round 10, finding by finding.**

- **F01 (P3), §5.4 third Check — repaired.** Line 1410–1416: "which is `1` exactly when `I` is an integer
  multiple of `2π²`. For real `q`, `I = 0` … `I ≈ 12.54` at `ξ = −0.25`, where the factor `e^{−3.992i}` is not
  `1` … it equals `2π² ≈ 19.74` for some `ξ` in between". Recomputed: `e^{−(i/π)I} = 1` iff `I/π ∈ 2πℤ`;
  `12.54/π = 3.992`; `12.54 < 19.739 < 21.71`. The same string is in plan.json target 5.4.
- **Adversarial pass on the changed passage.** `O⁰_h = e^{−(i/π)I} O_h` agrees with §2.1 line 725–726 and §2.8
  line 994; `h(x) = h₀(x + ξ)` is the modulation rule of §4.1 (`G_{q e^{2iξ·}}(t, z) = G_q(t, z + ξ)`).
- **The repaired pattern elsewhere** ("exactly when" in a Check): §6.5 line 1660 (`w w̃ < 1` exactly where
  `Re m ≠ 0`: `w w̃ = w²/|m|²`, holds), §6.7 line 1719 (`σ ≪ ν` exactly when `w > 0` a.e., holds), §9.2 line 2168
  (holds, §8.8 third Check), §2.1 line 731 (holds). None overstated.

**Principles.** No route-specific shortcut; three suppliers, all on main or earlier in the order; own words
with locators; no algorithm; no `Suggested.lean` at this stage. LaTeX delimiters, pull-request numbers,
round labels, machine paths: none (grep). plan.json: `gaps: []`, nine layers, 57 targets; README: 57 numbered
sections, 57 `**Checks.**` blocks, none with fewer than three bullets; every layer ends with `### Examples`
and `### Dependencies`.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

**Supplier citations resolved this round.** OperatorTheory/UnboundedOperators §4.8 on main (README line 836,
`Ju′+V(r)u` line 861, the alternative line 876). AnalyticNumberTheoryPartI §0.23 on main (line 644).
AutomorphicSpectralTheory §0.5 at its open head (a new roadmap folder, in the merge order; its line 88 names
the Tau Ceti Nevanlinna theorem and the subtracted-kernel conversion of §0.5). PDE §6.2 (main, line 2252),
StochasticCalculus S6.5 (main, line 2249) and OperatorTheory/ToeplitzOperators Layers 1–5 (main, line 146–713)
exist as named. No supplier is on the never-cite list.

**Pinned declarations.** All 120 backticked library identifiers of the README were resolved by script at the
pinned Mathlib and Tau Ceti (a declaration of that name exists; `Matrix.Norms.L2Operator` is the scope of
`Analysis/CStarAlgebra/Matrix.lean` line 183). Opened at the stated file and line this round:
`TauCeti.le_mul_exp_of_le_add_mul_integral` (59), `exists_continuousOn_eq_forall_mem_Icc_eq_picard` (196),
`I_mul_herglotzTransform_cayley_eq` (404), `Measure.herglotzTransform` (138),
`hasFDerivAt_integral_of_dominated_of_fderiv_le` (222), `Real.tendsto_integral_exp_smul_cocompact` (205),
`ConvexOn.map_integral_le` (196), `hasDerivAt_wedgeIntegral_upperHalfPlane` (118),
`taylor_mean_remainder_lagrange` (330), `measure_limsup_atTop_eq_zero` (62),
`lowerSemicontinuous_klDiv_finiteMeasure` (499), `HardySpace` (43), `upperHalfPlaneSet` (253). The other line
numbers rest on round 10's list.

**Sources, the seeded sample** (each read at the cited line; the author flags no locator as unverified).

- §1.1, §1.5: the only locator is coddingtonlevinson1955 (waived); the pinned constant-kernel lemma was opened.
- §1.6: romanov2014 line 220–222 (entire in `z`, with values in `C[0, x]`): as cited.
- §2.8: mauth2022 line 454–468 (definition, Lemma 8 line 463); poltoratski2024 line 685–687, 766 and
  mauth2022 line 945, 1137 use the multiplier step without proof, as the README says.
- §3.2: poltoratski2024 line 186–190, (2.2) line 205–208, (2.5) line 293, line 273–275, (2.6)–(2.7) line
  295–306; mauth2022 line 182–183, Corollary 2 line 596, Lemma 15 line 612, Lemma 17 line 646: as cited.
- §3.3: poltoratski2024 line 175–180; mauth2022 line 491–493, Lemma 13 line 531; romanov2014 Proposition 4
  line 780: as cited.
- §4.1: poltoratski2024 (5.2) line 484–488, (5.3) line 492–501, (5.4) line 508–517, the remark on Tao and
  Thiele's `a` line 490–491; mauth2022 line 187–189: as cited.
- §4.3: poltoratski2024 line 503–507; taothiele2012 Lemma 3 line 296: as cited.
- §4.4: poltoratski2024 (5.5) line 545–548 (constant `1`); denisov2006 (194) line 3250–3255 (constant `π`);
  taothiele2012 Lemma 6 line 680–683: as cited.
- §6.4: romanov2014 Theorem 15 line 2217, Lemma 23 line 2370: as cited; remling2018 waived.
- §6.5: poltoratski2024 line 255–264; mauth2022 line 692–701; romanov2014 line 2275–2281: as cited.
- §7.3: poltoratski2024 §4 from line 361, (4.1) line 403, initial values line 409, (4.2)–(4.3) line 425–439,
  simplicity of the zeros line 442–444: as cited.
- §8.2: poltoratski2024 Lemma 2 line 630–636, proof from line 637 (the outer `G`, the Lebesgue point of
  `√(M P log w)`); mauth2022 Lemma 21 line 794: as cited.
- §9.6: poltoratski2024 line 1173–1179, 1380–1396, 1482–1539: the README reports the source's route
  faithfully; the route fails (R01).
- §9.7: poltoratski2024 (9.9)–(9.10) line 1538–1570: as cited. The README's `Im β = −√(w w̃)`, `|β| = 1` is the
  correct form; the source's `β = e^{−iφ}`, `φ = arcsin`, would force `Re β ≥ 0` (Source issues).

Pages 30–45 of poltoratski2024 were also read in the text layer of the same arXiv version 14 file, because the
cached text is an OCR and garbles the displays of line 1484–1509.

**Adversarial table** (hand algebra and plain Python in the scratch directory; values computed this round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 | `α < 0`; `β = 0`; the equality and negative-kernel Checks | `v′ ≤ β(α + v)` gives `u ≤ αe^B` for any real `α`; `2 + ∫₀^{min(t,1)} 2eˢ = 2e^{min(t,1)}`; `1 − t/2 ≥ 1/2`, `e^{−1} = 0.368 < 0.5` | holds | none |
| §1.5 | `p = 0`, `p′ = 1`; derivation | `D = ∫(P′ − P)N′ + ∫PD`, so `‖D‖ ≤ ‖P′ − P‖e^{‖P′‖}e^{‖P‖}`; `1.718 ≤ 2.718` | holds | none |
| §1.6 | `P = 1/(z − t)`; Dirac coefficient | `N(t, 0) = z/(z − t)`; `∂_zN = −t/(z − t)²` from both sides of the derivative formula; `−Ω(z − Q_q) = [[f, −z − g], [z − g, −f]]`, trace `0`; `q = 1 + i`: norms `√2`, `2` | holds | none |
| §2.2 | `u = Im z`; `P[δ₀]`; mass | `i(∂ₓu − i∂ᵧu) = 1 = F′`; `F = −1/(πz)`, `F′ = 1/(πz²)`; `πy P[ν](iy) = ∫ y²/(x² + y²) dν` | holds | none |
| §2.5 | `e^{−i/z}`; `(z − i)/(z + i)` | `Re(−i/z) = −Im z/|z|²`; `log|F(i)| = −∞ ≤ 0` | holds | none |
| §2.6–§2.7 | `1/(z + i)`; `φ = 1_{[−t,t]}`; kernel | `−i/(1 − iz) = 1/(z + i)`, `‖F‖² = 2π·½ = π`, `|F(i)|² = 1/4`; `𝓕g(w) = −2πie^{−2πw}`; `4πt`; `sin(2ity)/(2πiy) = sinh(2ty)/(2πy)`; `zF = i∫φ′e^{isz}` | holds | none |
| §2.8 (headline) | `h = log|x + i|`; even `h`; the three multiplier Checks | `S[h](i) = log 2`, `O_h = −i(z + i)`; `S[h](iy) = (y/π)∫h/(x² + y²)` real; `‖−i/(z + i)‖² = π`; `πe^{2y}/(y + 1)` unbounded | holds | none |
| §3.2 | equation, determinant, modulus and argument | `E′ = (f − iz + ig)A + (−z − g + if)C = −izE + qE#`; `EẼ# − ẼE# = 2i(AD − BC)`; `Re(qe^{−2iφ})`, `−x + Im(qe^{−2iφ})`; kernel identity from the (1,1) entry | holds | none |
| §3.3 | Christoffel–Darboux; free case | `(M_λ*ΩM_z)′ = (z − conj λ)M_λ*M_z` using `Q_q* = Q_q`, `Ω² = −1`; `|u − iv|² − |u + iv|² = 4 Im(conj u · v)`; `2 sinh 2ty` both sides | holds | none |
| §4.1 | dictionary; concatenation; `c = 0.7 + 0.4i`, `T = 1.3`; the kicks Example | `a′ = e^{2izt}qb#`, `a(0) = 1`, `b(0) = 0`; conjugation by `diag(e^{−izs}, e^{izs})`; `|c|T = 1.04810`, `a = 1.6014`, `b = 1.0860 + 0.6206i`; `cosh²c₂ − |e^{2izs}|² sinh²c₂` | holds | none |
| §4.3 | route | `h(c) = |c₁|² − |c₂|²`; `u − iv = 2e^{−itz}(c₁a + c₂b)`; `min_{c₂}(|a + c₂b|² + |c₂|²) = |a|²/(1 + |b|²) ≥ 1` | holds | none |
| §4.4 (headline) | first order; outer normalisation | `∫|∫q e^{2ixs}|² = π‖q‖²`, so `∫ log|a| ≈ (π/2)‖q‖²`; `Re S⁰[h] = P[h]`, `S⁰[h](iy) → 0`; `y e^{−2yu}` has mass `½` | holds | none |
| §5.4 (headline) | the repaired Check | `I ∈ 2π²ℤ`; `3.992`; `12.54 < 19.74 < 21.71` | holds | none |
| §6.4 | radius; boundary points; `f = 1_{[0,1]}`, `z = i`; limit point | Apollonius radius `2/(|E|² − |E#|²)`; `m(i) = i/(1 + √2 tanh √2) = 0.443190i`; `−D/C = 0.59189i`, `−B/A = 0.38582i`, difference `0.20607`; `1 ≤ |Θ||Φ|` at `z = 0` | holds | none |
| §6.5 | `f ≡ 1`; compact support; Herglotz identity | eigenvector `(z, 1 − iκ)`, `m = (1 + iκ)/z`, `Im m(i) = √2 − 1`; `|E(T, 2)|² = 4/3 + (2/3)cos(2√3T + c)`, density in `[1/2, 3/2]`, mean `√3/2`; `Im(−Ẽ conj E) = AD − BC = 1`; `(1 + xz)/(x − z) = (1 + x²)((x − z)⁻¹ − x/(1 + x²))` | holds | none |
| §6.6, §6.8 (headlines) | routes | `|E| = |a + b| ≤ 2|a|` on `ℝ`; `−2π log 2 − π‖q‖²` from §4.4; round 10's barrier values relied on | hold | none |
| §7.1–§7.2 | `E = z + i`; Apollonius step | `ψ′ = 1/(1 + x²) = π(1/π)/(1 + x²)`; `√(1 + ε) − 1 ≥ ε/(1 + √2) ≥ ε/3` | holds | none |
| §7.3 | Riccati; motion; initial values | `θ′ = (E#′E − E#E′)/E² = 2izθ + conj q − qθ²`; at a zero `∂ₜθ = f`, so `ζ′ = −f/∂_zθ`; `θ̃(0) = i/(−i) = −1` | holds | none |
| §8.1 | `γ`; boxes | `2 sinh²p/sinh 2p = tanh p`, `2 cosh²p/sinh 2p = coth p`; `γ(1) = 0.7426` | holds | none |
| §8.2 | free case; `t = 2`, `λ = 0.3 + 0.25i` and real `λ`; `w(s) = 0` | ratio `1`; `sinh 1/(0.5π) = 0.7482`, `2/π = 0.6366`; `−1` when `w(s) = 0` | holds | none |
| §8.3 | expansion | `K − 2 Sinc/w + (w Sinc + o(t))/w² = K − Sinc/w + o(t)`; with `√w`: `Sinc(1/√w − 1)²` | holds | none |
| §8.4–§8.5 | scale; free case | interval `≍ 1/t`, `‖M F‖²₂ = o(t)` gives a point with `M F = o(t)`; `|λ − z| ≤ 2√2C/t`; `cos tz sin tλ − sin tz cos tλ` | holds | none |
| §8.6 | the route's identity; derivative relation | `D(t, z(t), z) = −iβE(z)`, `D(t, λ, z(t)) = iβE(λ)`; `conj(α)² t/sin(2ity)` | statement holds; route slip | R02 |
| §9.2 with §9.1 | `θ = 0.3 + ih`, three heights | determinant `2i`; `|a|² − |b|² = 1.0000000`; moduli `0.00278601`, `0.00284450`, `0.00563047` equal to `sinh/sinh` of §9.2 | holds | none |
| §9.5 | `V = 2`, `Δ = 0.01` | `Δ₁ = 0.0102119`, `Δ₂ = 0.0104306`, gap/`Δ²` `= 0.590` (limit `0.572`) | holds as stated | none |
| §9.6 | the same data in the route | second relation: `0.00284450` against `0.00281510`; true `Δ₂ = 0.0106540`; third relation then holds to `2·10⁻¹⁶` | route false | R01 |
| §9.7 | (2.2) on `ℝ`; free case; `f = 1_{[0,T]}` at `x = 2` | `(conj β − β)/√(w w̃) = 2i` iff `Im β = −√(w w̃)`; `α = i`, `β = −i`; `β = −m/|m|` with `Re m_T(2) = 4 sin²(√3T)/(3|E|²) > 0`, so `Re β < 0` occurs | holds (conditional on §9.6) | R01 |
| §9.8 (headline) | route | `(E − iẼ)/(E + iẼ) → (1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`, denominator of modulus² `1/w + 1/w̃ + 2 > 0` | holds given §9.6 | R01 |

**Duplication audit.** `roadmaps grep` over main and the open heads, by object: "Hermite–Biehler", "non-linear
Fourier", "Fatou's theorem": no match. "de Branges": a reference in SpecialFunctionsGamma. "Paley–Wiener":
AutomorphicSpectralTheory and its Part II (the Euclidean theorem on `𝔞_P`, another object),
StochasticCalculus (Paley–Wiener–Zygmund). "Weyl function": UnboundedOperators (cited), a reference elsewhere.
"Carathéodory solutions": AsymptoticExpansions names the Tau Ceti module, as this roadmap does. "outer
function": other senses. "Dirac operator": spin-geometric operators on main and in CompactQuantumMetricSpaces,
RelativisticQuantumFieldTheory; none is the half-line system. `scratch/overlaps.md`: no open pull request
changes this roadmap, no cited id is dropped, none is defined only by an open revision, no second copy. The
board packages index (AnalyticNumberTheory, LawrenceVenkateshMethod) has no related package.

Overlap check: read PDE, StochasticCalculus, OptimalTransport, OperatorTheory/UnboundedOperators (main), MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, RelativisticQuantumFieldTheory, AutomorphicSpectralTheory (open); Weyl's limit-point/limit-circle alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; the half-space Poisson kernel and integral, the maximal function, the relative entropy: owner Mathlib and Tau Ceti, cited; nothing else shared.

**Shape.** Layers are named by their mathematics; no sentence says the roadmap follows a source. Every numbered
section has a locator and a *Needs:* line. The order of Layers 7–9 is forced (§8.6 needs §7.3, §8.7 needs §7.2,
§9.3 needs §8.8–§8.9); Layers 4–5 precede Layer 6 and do not use it.

**Headline theorems for the package stage:** after R01, pointwise convergence at resonance-free points (§9.8)
with §9.3; the non-linear Plancherel identities (§4.4, §5.4); the Szegő condition (§6.8); the isometric
embedding and uniqueness of the spectral measure (§6.6); the linear Carathéodory theorem with holomorphic
dependence on a parameter (§1.2, §1.6); the outer-multiplier theorem (§2.8).

**Copyright, licences and scope.** Wording: the README was set beside the source at 21 passages: the locators
of the 15 sampled targets, and the Conventions' Dirac system (poltoratski2024 line 136–166), §8.6 (line
850–917), §9.4 (line 1380–1388), §8.5 (line 814–842), §6.6 (line 255–262) and §9.2 (line 1303–1347). The
longest shared run is four words ("inserting a zero interval", a description the mathematics fixes). The
proof of §8.5 uses `|λ − z| ≤ 2√2C/t` where the source writes `1/t`; §9.7 states `β` differently from the
source. Arrangement: poltoratski2024 §1 (line 136), §2 (170), §4 (361), §5 (469), §6 (588), §7 (793), §8
(1016), §9 (1173), appendix (1583). Layers 1–2 ↔ none; Layers 3 and 6 ↔ parts of §2; Layers 4–5 ↔ §5, placed
before Layer 6; Layer 7 ↔ §3–§4; Layer 8 ↔ §6–§8; Layer 9 ↔ §9 and the appendix: not one to one, not in the
source's order. Reuse: no table, figure or list is taken over.

Source independence: 21 passages compared with 5 sources, none shared; largest share poltoratski2024, 72 of 183 citations; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §1.1, §1.5 and §2.2 have no other locator.
- The published version of poltoratski2024 (Ann. of Math. 199) was not read; what its proof of the absence of
  resonances contains is known here only through the README's References and mnatsakanyan2022.
- poltoratski2024 "General case" (line 1512–1533): not re-derived; by the isometry argument of R01 it cannot
  succeed through moduli at `s` either.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Error** in poltoratski2024 at §9, "Special case of resonance motion", printed p. 39 (line 1500–1511): the source says the moduli on the second interval give a relation with `sinh(υ + Δ₁ + Δ₂)` and `sinh(υ − 2Δ)`; it should be, by (9.2) and (9.4), heights `2υ + 2Δ₁ + Δ₂` and `2υ − 3Δ`, and then the three relations are consistent; affects the proof.
- **Misprint** in poltoratski2024 at §9, "Special case", printed p. 38 (line 1485–1487): the source says the second increment has `τ₂ = Δ` and also `τ = τ₁ − iτ₂ = iΔ`; it should be `τ₂ = −Δ`; affects nothing.
- **Misprint** in poltoratski2024 at the proof of Lemma 6, printed p. 23 (line 872): the source says the kernel numerator with the zero in its second slot equals `iβE`; it should be the numerator with the zero in its third slot; affects nothing.
- **Error** in poltoratski2024 at the text after (9.10), printed p. 40 (line 1555–1556), repeated in mauth2022 at line 3863: the source says the constant is `e^{−iφ}` with `φ` the arcsine of `√(w w̃)`; it should allow `φ ∈ (0, π)` with that sine, since the real part can be negative; affects nothing.
- **Error** in poltoratski2024 at (5.5), printed p. 14 (line 545–548), repeated in mauth2022 at (4), p. 5 (line 206–207): the source says the `L¹` norm of `log|a(t, ·)|` equals the squared `L²` norm of the potential; it should be `π/2` times it in that normalisation; affects nothing.
- **Misprint** in poltoratski2024 at Lemma 8, (8.5) and its proof, printed p. 29–30 (line 1134–1138): the source says the matched forms keep the factor at the old height; it should be the factor at the new height, as (2.2) forces; affects a stated result.

## For the human reviewers

- **Scope.** The headline (§9.8) rests on §9.6. The README (line 2341–2343) says the published proof has a reported error (mnatsakanyan2022 line 9–13, 135–137); the replacement in arXiv version 14 (December 2025, not refereed) fails the computation of R01.
- **Scope.** R01's repair makes Layer 9 conditional on the set of resonance-free points. Whether the roadmap proceeds with that conditional headline, or waits for a proof of the absence of resonances, is not decided here.
- **Licence.** Pages 30–45 of poltoratski2024 were read from the text layer of the arXiv version 14 file fetched directly from arxiv.org, not through the sources service, because the cached text is an OCR; nothing was copied.
- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 861–863) asks for an analogous endpoint classification for `Ju′+V(r)u` without writing the alternative out; this roadmap's contract (design README line 443–450) spells it out and §6.4 relies on it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "259507178810c6ac9e82f27fa07f5f7b3386d89f", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~11", "model": "fable", "worker": "chris-x83"} -->
