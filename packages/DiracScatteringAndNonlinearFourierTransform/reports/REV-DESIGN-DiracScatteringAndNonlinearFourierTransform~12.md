<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6900524555 -->
Review (claude) of cdd0ce5

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §9.5 takes from §8.7 a box function that §8.7 does not provide

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 2271–2274 (§9.5 route),
   and the mirrored statement of `design/plan.json` target 9.5: "take the function `C(t)` of §8.7(1) at most the
   function of §9.4 (the route of §8.7 works on every smaller box size tending to infinity, as §8.5 does)".

   Claim: §8.7(1) may be applied with `C′ = min(C, C_R)`, `C_R` the function of §9.4, so that §8.7(2) applies.

   Witness. §8.7(1) (line 2038–2040) gives one `C(t)` and convergence only along `T₁(s, C)`; `T₁` decreases in
   `C` (§8.1), so `T₁(s, C′) ⊇ T₁(s, C)` and nothing is stated on the larger set. Instance: zeros of `E(t, ·)` at
   `s + (log t)/t − i/(2t)`, with `C(t) = √t`. For every `K`, `(log t)/t > K/t` once `t > e^K`, so the `E`-condition
   of §9.4 holds; yet `log t ≤ √t` and `−1/(2t) ≥ −1/t`, so `t ∈ T₀(s, C) ∖ T₁(s, C)` for all large `t`: (1) asserts
   nothing and the hypothesis of (2) fails. The source takes the same step (poltoratski2024 line 1538–1540).

   Why the statement of §9.5 survives: the part of the route of §8.7 that treats `t ∉ T₀` (poltoratski2024 line
   924–970) uses §8.5 on `Q(s, K/t)` and §7.2 only for a constant `K = 4π + 24π/ε`, so it needs exactly that
   every `T₀(s, K)` be bounded. That is a statement, not a property of a route, and §9.5 must cite it as one.

   Repair (README and the mirrored entries of plan.json; no supplier changes).

   1. §8.7, add after (2): "(3) for almost every `s`: if `T₀(s, K)` is bounded for every `K > 0`, then for every
      `D > 0` there are unimodular `α(s, t)` with `sup_{z ∈ Q(s, D/t)} |E(t, z) + iα(s, t) e^{−itz}/√w(s)| → 0` as
      `t → ∞`. Route: at an `s` where §8.5 holds and `w(s) > 0`, fix `ε > 0` and `K ≥ max(D, 4π + 24π/ε)`; for
      large `t` the box `Q(s, K/t)` has no zero, §8.5 on it gives the two-term form of the route above, and a phase
      derivative varying by the factor `1 + ε` on `(s − 4π/t, s + 4π/t)` would give, by §7.2, a zero within
      `24π/(εt)` of that interval, hence in `Q(s, K/t)`." Add the Check: "(3) does not follow from (1) and (2):
      zeros at `s + (log t)/t − i/(2t)` leave every `Q(s, K/t)` for `t > e^K`, but lie in `Q(s, √t/t)` above the
      height `−1/t`, so for `C(t) = √t` (1) says nothing and (2) does not apply."
   2. §9.5 route: replace the sentence quoted above, through "then §8.7(2) gives the approximation of `E`", by
      "`N_f` is the union of the exceptional null sets of §8.7(3) for `f` and for `−f` and of `{w w̃ = 0}` (§6.8).
      At `s ∈ R(f) ∖ N_f` the sets `T₀(s, K)` are bounded (§9.4), so §8.7(3) gives the approximation of `E`", and
      keep the rest ("and §8.7 for `−f` …", now §8.7(3)).

   Tested on the instance: with (3), the configuration above satisfies the hypothesis (every `T₀(s, K)` bounded,
   `T(s, K) = e^K`), and the route's contradiction is reached inside `Q(s, K/t)` with `K` constant, whatever
   `C(t)` of (1) is. The free case still gives `α = i` (`e^{−itz} + i·i·e^{−itz} = 0`).

2. **F02** (P3) two statements about sources go beyond the texts cited

   Location: `design/README.md` line 118–119 ("Its published proof has an error, reported in mnatsakanyan2022
   (line 9–13, 135–137)"), line 2348–2349 ("Lemma 11 of the published version"), line 123–124 ("as an open
   question"), and `sources.toml`, `version_note` of `poltoratski2024`.

   Witness: mnatsakanyan2022 line 11–12 and 135–136 name `[Pol21]`, which its bibliography (line 1812–1813) gives
   as the arXiv e-print 2103.13349 of 2021, Lemma 11 on its p. 48; the Annals text was not compared by anyone
   (round 11, Not verifiable). denisov2026 line 204–212 poses two questions for `q ∈ L²(ℝ)` truncated to
   `|x| < T`; the word "open" is not there, and it does not mention poltoratski2024.

   Repair: line 118–119 → "An error in the proof of the arXiv versions of 2021–2022 (their Lemma 11) is reported
   in mnatsakanyan2022 (line 9–13, 135–137)"; line 2348 and the `version_note` → "Lemma 11 of the earlier arXiv
   versions"; line 123–124 → "denisov2026 poses the almost-everywhere convergence of `b/a` for square-integrable
   potentials on `ℝ`, truncated to `(−T, T)`, as a question (Q2R, line 211–212)". Tested against the three
   passages: each repaired sentence says what its lines say.

3. **F03** (P3) §9.4, compact support: finiteness is claimed in a strip, not in the box

   Location: `design/README.md` line 2232–2233 (and plan.json target 9.4): "the finitely many with
   `|Re ζ − s| ≤ C/T₀` lie at a distance `δ > 0` from `ℝ`".

   Witness: no target bounds the number of zeros of `E(T₀, ·)` in a vertical strip; only compact sets have
   finitely many. The argument needs the zeros in `Q(s, C/T₀)`, which contains `Q(s, C/t)` for `t ≥ T₀`.

   Repair: "the finitely many in the compact box `Q(s, C/T₀)`, which contains `Q(s, C/t)` for `t ≥ T₀`, lie at a
   distance `δ > 0` from `ℝ`". Tested on `f = c 1_{[0,T₀]}`: infinitely many zeros in all, finitely many in each
   box, and `Q(s, C/t)` has `|Im z| ≤ C/t < δ` for `t > max(T₀, C/δ)`.

Three findings: R01 (P2, blocking), R02 and R03 (P3). Both findings of round 11 are repaired. R01 is in the
text the repair added: the route of the new §9.5, the only input of the headline §9.6, uses §8.7 in a form
that §8.7 does not state. The statement of §9.5 itself is correct; the repair is one added clause in §8.7 and
two sentences in §9.5. The dependency check shows no UPWARD or CYCLE line. Declared supplier gaps: none.
Elaboration: not available (this lane does not elaborate); the design stage has no `Suggested.lean`, so the
one-tactic probe and the `#check` comparison do not apply.

## Verified sound

**Repair of round 11, finding by finding.**

- **F01 (P1), §9.6 route — repaired.** Old §9.4–§9.6 are gone; line 2217–2219: "Call `s ∈ ℝ` a resonance-free
  point … when, for every `C > 0`, the sets of times `T₀(s, C)` and `T̃₀(s, C)` of §8.1 are bounded"; line
  2265–2266 and 2291–2292 state §9.5 and §9.6 "for every `s ∈ R(f) ∖ N_f`" and "`R(f) ∖ N′_f`"; line 117–118:
  "is not claimed by this roadmap". Summary, Scope, build paragraph, §5.5 Check, §8.9, Dependencies, consumers
  and References agree; `grep` finds no "§9.7", "§9.8" or unconditional "almost every `s`" for the headline;
  plan.json has 55 targets with the same ids, `gaps: []`.
- **F02 (P3), §8.6 route — repaired.** Line 2018–2019: "so `D(t, ·, z(t)) = iβE(t, ·)`, since
  `D(t, λ, z(t)) = βC(t, λ) + iβA(t, λ)`". Recomputed: `A(z₀) = β`, `C(z₀) = −iβ` in
  `A(z)C(λ) − C(z)A(λ)` give `βC(λ) + iβA(λ) = iβ(A − iC)(λ)`.
- **Repaired patterns elsewhere.** Conditional wording: every place that names the Layer 9 conclusion carries
  "resonance-free" (lines 7, 24, 59–61, 115, 475, 1450–1451, 2318–2319, 2340–2341). Argument order of `D`: the
  preamble (line 1893–1894), §8.5 and its Checks use `D(t, λ, z)` consistently.

**Principles.** No route-specific shortcut; nothing re-planned (three suppliers, cited by section); supply in
one direction (gate below); own words; no algorithm; no `Suggested.lean`, so no sorried data or `set_option`.
LaTeX delimiters, pull-request numbers, round labels, machine paths: none (grep).

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
```

**Supplier citations resolved this round.** AnalyticNumberTheoryPartI §0.23 (main, README line 644).
OperatorTheory/UnboundedOperators §4.8 (main, line 836; `Ju′+V(r)u` at line 861–863; the alternative in its
API). AutomorphicSpectralTheory §0.5 (open head, a new roadmap folder, in the merge order; "### 0.5 Herglotz
representation", line 182–198). PDE §6.2 (main, line 2252), StochasticCalculus S6.5 (main, line 2249),
OperatorTheory/ToeplitzOperators Layers 2–5 (main, line 273–713). None is on the never-cite list.

**Pinned declarations.** A script opened every declaration that the supplier contracts cite with a file and a
line, and looked for the name within three lines of that line: Mathlib 60 of 60 (three through
`InformationTheory/KullbackLeibler/Basic.lean` lines 56, 147, 355, opened by hand), Tau Ceti 35 of 35. The
repair removed two Mathlib bullets and added none. By object, the pins have no Hermite–Biehler, de Branges,
Paley–Wiener, nontangential-limit, outer-function or scattering declarations (grep, 0 files); Tau Ceti
`Analysis/ODE/` (`Caratheodory.lean`, `Gronwall.lean`, `ScalarLinear.lean`, `Wronskian.lean`, `Linear.lean`,
`Inhomogeneous.lean`, `SmoothParameter.lean`, `GlobalSolution.lean`, read at their headers) has the bounded,
constant-kernel, scalar and autonomous cases only, as the README says.

**Sources, the seeded sample** (each locator read at its line; the author flags none as unverified).

- §1.2: romanov2014 line 212–224 (fundamental solution, `det ≡ 1`, entire, chain rule): as cited.
- §2.1: poltoratski2024 line 250–254, 610–614; mauth2022 line 378–392, Lemma 3 line 390: as cited.
- §2.2: garnett2007 only (uncertified); AutomorphicSpectralTheory §0.5 resolved.
- §2.4: mauth2022 Lemma 4 line 404, Lemma 7 line 434: as cited (the almost-everywhere statement rests on
  garnett2007).
- §2.6: mauth2022 line 337–358, Lemma 1 line 359, Lemma 2 line 370 (constant `(2/(πy))^{1/p}`, weaker than
  `1/(4πy)`, as the README says), Lemma 6 line 430, Lemma 9 line 469, Lemma 11 line 487: as cited.
- §3.2: poltoratski2024 line 186–190, (2.2) line 205–208, (2.5) line 293, line 273–275, (2.6)–(2.7) line
  295–306; mauth2022 line 182–183, Corollary 2 line 596, Lemma 15 line 612, Lemma 17 line 646: as cited.
- §4.5: denisov2006 Lemma 9.1, (157)–(158), line 2510–2521; Lemma 9.2 line 2544–2556: as cited.
- §5.1: denisov2006 Theorem 11.1 line 3246–3255, §13 (245)–(248) line 4219–4258; poltoratski2024 line
  518–529: as cited.
- §6.2: poltoratski2024 line 269–285; mauth2022 Lemma 18 line 659–691; romanov2014 Theorem 5 (16) line 812.
- §6.3, §6.6: poltoratski2024 line 255–262; romanov2014 Theorem 16 line 2283: as cited.
- §6.5: poltoratski2024 line 255–264; mauth2022 line 692–701; romanov2014 line 2275–2281: as cited.
- §8.1: poltoratski2024 line 846–849, 997–1001; mauth2022 line 1245–1257: as cited.
- §8.7: poltoratski2024 Corollary 3 line 1002–1012, argument line 918–996; mauth2022 Corollary 6 line
  1397–1408: as cited (R01 concerns how §9.5 uses it).
- §8.8: poltoratski2024 Lemma 7 line 1028–1040, (8.1); mauth2022 Lemma 43 line 3140: as cited.
- New locators of Layer 9: poltoratski2024 line 97–101, 1173–1176, Lemma 9 line 1350–1377, (9.9)–(9.10) line
  1538–1582, Theorem 1 line 578–586, line 54–57; mauth2022 line 1893–1894, 3851–3875; denisov2026 line
  204–216: as cited, except the wording of R02.

**Adversarial table** (hand algebra; values computed this round).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 | `P = t^{−1/2}`; `P = 1/t`; Picard bound | `Y = y₀e^{2√t}`, `Y′ = t^{−1/2}Y`; `Y = ct` solves `Y′ = Y/t` for every `c`; `n`-th iterate factor `(∫‖P‖)ⁿ/n!` | holds | none |
| §2.1 | bound `C(z)`; Cayley at `z = 2i`, `x = 1`; `h = 1/(1+x²)`; dilation | `1 + x² ≤ 2(1+a²)(1+(x−a)²)`; `w = 1/3`, `ζ = −i`, `(8/9)/(10/9) = 4/5`, `(4/5)/(2π) = 2/(5π) = P(2i, 1)`; `(2/π)(π/6) = 1/3 = i/(3i)`; `(2/π)(−2π/3 + 5π/6) = 1/3`; `λ²y/(π|x−λz|²) = λP[ν](λz)` | holds | none |
| §2.2 | `u = P[δ₀]`; mass | `F = −1/(πz)`, `Im F = y/(π|z|²)`, `Re F(i) = 0`, `F′ = 1/(πz²)`; `πy·y/(π(x²+y²))` | holds | none |
| §2.4 | `h = 1_{[0,1]}` along `−y/2 + iy` | `(1/π)(π/2 − arctan ½) = 0.352`; `y/2 < y`, in the cone | holds | none |
| §2.6 | `F = 1/(z+i)`; kernel norms; Mathlib `𝓕` | `−i·i/(z+i)`; `2π·½ = π`; `|F(i)|² = ¼ = π/(4π)`; `∫ dx/(4π²|x−z|²) = 1/(4πy)`; `∫P² = 1/(2πy)`; residue at `−i`: `−2πie^{−2πw}` | holds | none |
| §3.2 | equation; determinant; kernel identity | `E′ = (f−iz+ig)A + (−z−g+if)C = −izE + qE#`; `2i(AD−BC)`; (1,1) entry of Christoffel–Darboux: `conj A(λ)C(z) − conj C(λ)A(z) = (z − conj λ)∫Θ*Θ` | holds | none |
| §4.5 | Riccati; modulus; `ρ′`; real `f`, `z = 0` | `r′ = 2izr + conj q − qr²`; `∂ₜ(|a|²−|β|²) = 4 Im z|β|²`; `b′a − ba′ = e^{2izt}q`; `r = tanh F`, `exp∫f tanh F = cosh F` | holds | none |
| §5.1 | bounds; `q = 1_{[0,1]}`, `z = 5i`; limit at `i∞` | `‖r‖₂ ≤ 2·(1/2y)‖q‖`; `e^{−2yt}/(2√y)`; `e^{−5}(81.93 + 80.34) = 1.0934`, `log = 0.0893 ≤ 0.2`; error `y·‖q‖⁴/(2y²) → 0` | holds | none |
| §6.2 | lower bound; converse | `|a| − |b| ≥ 1/(|a|+|b|) ≥ e^{−L} ≥ 1/(2 cosh L)`; `(e^{−itz}F)# = (a+b)F#/E` | holds | none |
| §6.3 | derivative of the weight | `∂ᵣ|E|^{−2} = −2 Re(q conj E/E)/|E|² = −2 Re(q/E²)`; `∫(F/E)(F#/E) = 0` | holds | none |
| §6.5, §6.6 | compact support at `0`; normalisation | `m(0) = ie^{−2cT}`, `w w̃ = 1`; `2dx` gives `2‖F‖²` | holds | none |
| §8.1 | `γ`; `T₁` monotone | `γ(1) = 1.4142/1.9044 = 0.7426`; larger box, more zeros to test: `T₁` decreases | holds | none |
| §8.6 (repaired route) | zero `z₀` | `βC(λ) + iβA(λ) = iβE(λ)` | holds | none |
| §8.7 | free case; (1)⇒(2) under its hypothesis; use in §9.5 | `α = i`; the approximant is `π/t`-periodic, so `ty(t)` bounded would put a zero in `Q(s, C(t)/t)` (Rouché), hence `ty → ∞`; with `C(t) = √t` and zeros at `s + (log t)/t − i/(2t)` neither (1) nor (2) applies | statement holds; interface short | R01 |
| §8.8 | determinant of the two approximants | `2i cos Φ/√(w w̃)`; `0.63`: `2.52i` | holds | none |
| §9.1 | `t₁ = 0`; `t₁ = t₂` | `(iE − Ẽ)/(2i) = (E + iẼ)/2`; `(Ẽ + iE)/(2i) = (E − iẼ)/2`; `1`, `0` | holds | none |
| §9.2 | identity; `a`, `b` | `cos Φ(sin A cos B − cos A sin B)`; `γγ′ = 2/N`; `θ₂ − conj θ₁ = e + 2iυ`; `−α₁² sin e/sin(e+2iυ)` | holds | none |
| §9.3 | Check 4 | `sin² 0.1/sinh² 2 = 0.00997/13.154`, `½ log(1.000758) = 0.000379`; mean `0.000126` | holds | none |
| §9.4 definition | API 1; free case; compact support | `t > T_k ≥ T(s, k)` and `C(t) ≥ k`; no zeros; box compact, `C/t < δ` | holds | R03 (wording) |
| §9.4 API 2 | `ΩQ_fΩ⁻¹`; entries | `ΩQ = diag(f, −f)`, `(ΩQ)Ω = Q`, so `ΩQΩ⁻¹ = −Q`; `ΩMΩ⁻¹ = [[D, −C], [−B, A]]`; `E_{−f} = D + iB = iẼ_f`; `m_{−f} = E_f/Ẽ_f = −1/m_f` | holds | none |
| §9.4 Check 3 | `f ≡ c`; `s = 0`; `s = ½` | `E = cosh κt + (c−iz) sinh κt/κ`; zero equations as stated; `c + iz − κ ≈ iz`, zero at `−2ice^{−2ct}`, `2e^{−10} = 9.08·10⁻⁵`; `2884.6·|2.1547 − 0.5774i| = 6435` | holds | none |
| §9.4 Check 4 | heights `1, 0.99, 0.98`; `1, 1.0102119, …` | `|ζ_k − ζ_j|/|1 − conj ζ_j ζ_k| = |sin(θ_k−θ_j)/sin(θ_k − conj θ_j)|`; `0.0100002/3.5894 = 0.002786`, `/3.5156 = 0.0028445`, `0.0200013/3.5523 = 0.0056305`; `0.0102121/3.6655 = 0.002786` | holds | none |
| §9.5 | (2.2) on `ℝ`; limits; free case | `(conj β − β)/√(w w̃) = 2i`; two roots `±√(1−w w̃) − i√(w w̃)`, separated unless `w w̃ = 1`, so continuity fixes one; `|a|² → (1/w + 1/w̃ − 2 Im β/√(w w̃))/4`; `α = i`, `β = −i` | holds | route: R01 |
| §9.6 (headline) | quotient; bounded `M`; integrable `f` | common factor `−iαe^{−itz}` cancels, `e^{∓D}` bounds on the box; denominator² `1/w + 1/w̃ + 2`; `|A|, |C| ≤ |E|` on `ℝ` | holds given §9.5 | none |
| §4.4, §5.4, §6.8, §2.8, §1.6 (headlines) | round 11's rows, which carry values | relied on (`π/2`; `I ∈ 2π²ℤ`; `−2π log 2 − π‖q‖²`; `‖FG‖² = π`; `z/(z−t)`) | hold | none |

**Duplication audit.** `roadmaps grep` over main and the open heads: "resonance-free", "non-linear Fourier",
"Hermite–Biehler", "Paley–Wiener space", "`H²(ℂ₊)`": no match. "de Branges": the de Branges–Wilson integral of
SpecialFunctionsGamma, another object. "Weyl function": other senses, and UnboundedOperators §4.8, cited.
"Carathéodory", "outer function": other senses. This roadmap owns `R(f)`. `scratch/overlaps.md`: no other pull
request changes this roadmap, no cited id is dropped or defined only by an open revision, no second copy. The
board packages index (AnalyticNumberTheory, LawrenceVenkateshMethod) has no related package.

Overlap check: read PDE, StochasticCalculus, OptimalTransport (main), OperatorTheory/UnboundedOperators (main), AutomorphicSpectralTheory, MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, AnalyticNumberTheoryPartIII (open); Weyl's alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; nothing else shared.

**Shape.** 55 numbered sections, 55 `**Checks.**` blocks (none under three bullets), 55 `*Needs:*` lines, nine
`### Examples` and nine `### Dependencies`. Layers are named by their mathematics; no sentence says the roadmap
follows a source. After the repair §9.1–§9.3 have no consumer inside the roadmap; the README names one
(Downstream consumers, last bullet), so this is no finding.

**Headline theorems for the package stage:** pointwise convergence at resonance-free points (§9.6) with §9.5;
the non-linear Plancherel identities (§4.4, §5.4); the Szegő condition (§6.8); the isometric embedding and
uniqueness of the spectral measure (§6.6); the linear Carathéodory theorem with holomorphic dependence (§1.2,
§1.6); the outer-multiplier theorem (§2.8).

**Copyright, licences and scope.** Wording: the README was set beside the source at 24 passages (the locators
of the 15 sampled targets, and §8.7 against poltoratski2024 line 918–1012, §9.3 against line 1350–1377, §9.4
against line 97–101 and 1173–1176, §9.5–§9.6 against line 1538–1582 and mauth2022 line 3851–3875, the Scope
against denisov2026 line 204–216 and mnatsakanyan2022 line 9–13, §4.5 against denisov2006 line 2510–2556, §2.6
against mauth2022 line 337–377). No run of more than four words is shared outside formulas. Arrangement:
poltoratski2024 §1–§9 and appendix against Layers 1–9: Layers 1–2 ↔ none; Layers 3 and 6 ↔ parts of §2; Layers
4–5 ↔ §5, placed before Layer 6; Layer 7 ↔ §3–§4; Layer 8 ↔ §6–§8; Layer 9 ↔ part of §9: not one to one, not
in the source's order. Reuse: no table, figure or list is taken over.

Source independence: 24 passages compared with 6 sources, none shared; largest share poltoratski2024, 69 of 170 locators; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §1.1, §1.5 and §2.2 have no other locator.
- The published version of poltoratski2024 (Ann. of Math. 199): not read; see R02.
- poltoratski2024 line 1482–1533 (the argument the Scope says cannot exclude a resonance): the cached text is
  an OCR whose displays are garbled there; the Scope's claim rests on round 11's computation and on §9.4's
  fourth Check, which was recomputed here.
- Whether `R(f)` has positive measure for any square-integrable, non-integrable `f`: no source read here says.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Gap** in poltoratski2024 at §9, the text before (9.9), printed p. 40 (line 1538–1540): the source says Corollary 3(2) applies to any box function along which no zeros occur; it should first re-derive (7.9) for that function, since part 1) supplies one function only; affects the proof.
- **Error** in poltoratski2024 at §9, "Special case of resonance motion", printed p. 39 (line 1500–1511): the source says the three modulus relations are incompatible; it should note that they are pseudo-hyperbolic distances preserved by the inserted zero interval, hence consistent; affects the proof.
- **Error** in poltoratski2024 at the text after (9.10), printed p. 40 (line 1555–1556), repeated in mauth2022 at line 3863: the source says the constant is `e^{−iφ}` with `φ` an arcsine; it should allow both roots with that imaginary part, fixed by continuity; affects nothing.
- **Error** in poltoratski2024 at (5.5), printed p. 14 (line 545–548): the source says the `L¹` norm of `log|a|` equals the squared `L²` norm of the potential; it should be `π/2` times it in that normalisation; affects nothing.

## For the human reviewers

- **Scope.** The headline §9.6 is conditional on the set `R(f)` (README line 114–118). For compactly supported and for integrable `f` its conclusion is already §5.2; no source read here shows `R(f)` non-null for another `f`.
- **Scope.** README line 119–123 states that the argument of §9 of arXiv version 14 of poltoratski2024 cannot exclude a resonance. That is this project's computation (§9.4, fourth Check), not a published statement.
- **Scope.** denisov2026 (arXiv, 2026, line 204–212) poses almost-everywhere convergence of `b/a` for `L²` potentials as a question and does not cite poltoratski2024.
- **Licence.** mnatsakanyan2022 reports the mistake in the arXiv e-print (its line 1812–1813); whether the Annals text has the same Lemma 11 was not checked (R02).
- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 861–863) asks for an "analogous" endpoint classification for `Ju′+V(r)u` without writing the alternative out; §6.4 here relies on it as spelled out in the contracts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cdd0ce59810edc188004d3cec766ce1d455ab94a", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~12", "model": "fable", "worker": "chris-x90"} -->
