<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6898089119 -->
Review (claude) of e478704

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) locators that are only line numbers of the worker's text extraction

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md`, about 30 citation segments at lines 28, 172, 184, 196, 208, 230, 239, 240, 246, 265, 280, 302, 319, 363, 419, 501, 538, 614, 694, 712, 740, 746. Example, `:172`: "Sokal, lines 405–409".

   **Claim.** Each cited passage has an exact locator.

   **Witness.** The numbers are positions in the cached extraction, not in the published text. A reader holding the article cannot find "line 405". Of 89 line-carrying citation segments, about 30 have no equation, theorem, section or page beside the line number.

   **Exact repair.** Give every citation a printed locator and drop the extraction line numbers from the README (the plan's `where` fields may keep them). The pages, computed from the page markers of the cached texts:

   | README line | Line-only citation | Printed locator |
   |---|---|---|
   | 28, 246, 280 | Simon, Twelve Tales, 1011–1030 | Section 3, p. 25 |
   | 302, 712 | Simon, Twelve Tales, 960–984 | Section 3, p. 24 ((3.8) for the free covariance) |
   | 172, 319, 419 | Sokal, 400–411 | Section 2.2, p. 327, properties (a)–(c) and the sentence before them |
   | 184, 319, 419 | Peled–Spinka, 519–532 | the paragraph after Theorem 2.3, p. 13 |
   | 501 | Peled–Spinka, 1283–1284 | Section 2.7, p. 27 |
   | 538 | Peled–Spinka, 1633–1648 | Section 2.7.2, p. 33 |
   | 196, 265 | Aizenman–Duminil-Copin, 1982–1985 and 2019–2022 | Section 7, first paragraph, p. 44; the paragraph after Proposition 7.2, p. 45 |
   | 230, 239, 363 | Aizenman–Duminil-Copin, 1996–2002, 2023–2031 | Section 7.1, p. 45 |
   | 239, 240, 280 | Aizenman–Duminil-Copin, 387–410 | Section 2, the paragraphs after Definition 2.1, p. 9 |
   | 419 | Aizenman–Duminil-Copin, 231–233 | the sentence after (1.17), p. 5 |
   | 614 | Aizenman–Duminil-Copin, 77–89 | the paragraph of (1.7), p. 2 |
   | 694 | Aizenman–Duminil-Copin, 172–179 | the paragraph after Definition 1.1, p. 4 |
   | 740 | Aizenman–Duminil-Copin, 122–128 | the sentence of (1.10), p. 3 |
   | 746 | Aizenman–Duminil-Copin, 250–252, 259–260 | after (1.19) and after (1.20), p. 6 |
   | 208, 712 | Fröhlich, 266–269 | preprint p. 13 |
   | 363, 740 | Fröhlich, 84–85, 109, 112–115 | preprint p. 4 (after (7)) and p. 5 ((12)–(13)) |

   Tested on the instance: `sokal-1982 line 399` carries the printed page 327, and lines 405–409 lie on it; "Sokal, Section 2.2, properties (a)–(b), p. 327" finds the passage in the Numdam file.

2. **F02** (P3) one letter for the mass and for the volume index in 7.4

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:712`: "for d ≥ 1 and m > 0, and for d ≥ 3 and m = 0 … `b_n = −(d + m²/(2L_n²))`, and arbitrary L_n → ∞ and R_{n,m} → ∞"; `:719` "for every n and m".

   **Claim.** The sentence fixes the scheme of 7.2 for a given mass.

   **Witness.** In 7.2 (`:676`) m is the volume index of `R_{n,m}`, `μ_{n,m}`, `Σ_{n,m}`, `T^{n,m}`. In 7.4 the same letter is the mass, inside one formula. Read literally, "R_{n,m} → ∞" at fixed mass m = 0 has no limit variable.

   **Exact repair.** Rename the volume index of 7.2–7.4 and of the plan entries 7.2, 7.3, 7.4, 7.4.1 to k (`R_{n,k}`, `μ_{n,k}`, `Σ_{n,k}`, `T^{n,k}`), keeping m for the mass. Tested on the instance: the sentence becomes "`b_n = −(d + m²/(2L_n²))`, and arbitrary L_n → ∞ and R_{n,k} → ∞ as k → ∞", with no clash.

3. **F03** (P3) Newman's exponential bound is stated for nonnegative real coefficients only

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:393`: "for ρ in the Griffiths–Simon class, a ferromagnetic J and t ∈ [0, ∞)^V, `⟨exp(Σ_x t_xφ_x)⟩ ≤ exp(½⟨(Σ_x t_xφ_x)²⟩)`"; plan target 3.7, part (c).

   **Claim.** This is item (j) of the cited source.

   **Witness.** `sokal-1982 lines 434–435`: item (j) is stated for complex coefficients (the display is missing from the extraction, the words "for any complex" are there). The README statement is true but narrower.

   **Exact repair.** State: for `z ∈ ℂ^V`, `|⟨exp(Σ_x z_xφ_x)⟩| ≤ exp(½⟨(Σ_x |z_x|φ_x)²⟩)`. Route: expand the exponential; each monomial moment is nonnegative by Griffiths I (3.1), so the modulus is at most `⟨exp(Σ_x |z_x|φ_x)⟩`, and the stated case applies. Add the negative control as a Check: the absolute values on the right cannot be dropped. Tested on two Ising sites, J = 1, t = (1, −1): the left side is `(e + e⁻¹cosh 2)/(e + e⁻¹) = 1.329`. The signed right side `exp(½⟨(σ₁ − σ₂)²⟩) = e^{1 − tanh 1} = 1.269` is smaller, so the signed form is false. The repaired right side `e^{1 + tanh 1} = 5.82` holds.

The round-8 finding is repaired. No P1 or P2 finding was found this round. Three P3 findings (R01–R03) each carry a repair, so the verdict asks for changes; none is blocking and none changes a statement's truth. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No supplier gap is declared.

## Previous finding, checked first

| Round-8 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P2) goals 8.1 and 8.2 quantified over every scheme, the cited proofs over `β ≤ β_c` | `packages/ConstructiveFieldTheoryPhi4/design/README.md:740`: "Every random field reachable from 𝒞 by a convergent scheme of 7.2 with `J_n ≤ β_c(ρ_n, J^{nn})` for every n, where β_c is the critical point of 4.3"; `:751` the same for the Griffiths–Simon class; `:736` "Layers 0, 2, 4, 6 and 7"; `design/plan.json` goals 8.1 and 8.2 carry the hypothesis and `target:4.3`; the manifest locator of `aizenman-duminilcopin-2021` now names Proposition 1.4 | **Repaired** |

Adversarial pass on the changed text (values recomputed by me):

- Source range. `aizenman-duminilcopin-2021 lines 323–324` (Proposition 1.4) and `lines 2007`, `2015` (Theorem 7.1, Proposition 7.2) assume `β ≤ β_c` and `L ≤ ξ`; `lines 127–128` restrict the d > 4 results to `β ≤ β_c`; `frohlich-1982 lines 110` and `115` assume vanishing long-range order. The new hypothesis matches.
- Direction of the threshold. 4.3 defines β_c by `χ < ∞`. Finite χ gives a summable two-point function, hence no long-range order, so 4.3's β_c is at most the transition point of the source. The README hypothesis is therefore the stronger one.
- Telegraph Check (d = 1): `χ = (1 + t)/(1 − t) = e^{2J}`, which is 7.389 at J = 1 and finite for every J, so `β_c = ∞` and the counterexample still satisfies the hypothesis.
- Gaussian Check of 8.1: the row sum of `(2|b| I − βA)⁻¹` in infinite volume is `1/(2|b| − 2dβ)`. With `|b_n| = d + m²/(2L_n²)` and β = 1 this is `L_n²/m²`; it is finite exactly for `β < 1 + m²/(2dL_n²)`. The Check is correct.
- δ₀ Check of 8.2: Σ = 0, the field is zero, `S_2 ≡ 0` satisfies (1.10), and Dirac laws are Gaussian at the pin (`Mathlib/Probability/Distributions/Gaussian/Basic.lean:112`).
- "8.2 implies 8.1" still holds: the coupling condition depends only on `(ρ_n, J_n)`.

Pattern sweep ("statement wider than the cited proof") over the rest of the design. Each place where a statement exceeds its source has its own route in the README, which I recomputed:

- 2.1 (site-dependent complex fields; the source has a uniform field): the Asano route, rows below.
- 3.6 and 4.4 (even admissible ρ; `aizenman-duminilcopin-2021 line 1041` assumes (2.2)): the (s, t) expansion, row below.
- 5.2–5.4 (admissible real spins; the source has sphere spins): `peled-spinka-2017 lines 1261` and `1604–1611` need only a finite a-priori measure and a bounded interaction. Here `ρ̃ = e^{dJφ²}ρ` is finite by admissibility and the interaction `e^{−(J/2)(a−b)²}` is bounded.
- 4.2 cites `duminilcopin-2017-lectures line 549` for Ising only, and says so.

No further instance of the pattern was found.

## Verified sound

**Coverage.** All 775 README lines read. `plan.json` parsed: 8 layers, 36 owned targets, 2 downstream goals, `gaps: []`, four suppliers. The 14-entry manifest, the round-8 review, its repair report and the diff of the two heads were read. No maintainer notes exist. No gap is declared. The author flagged no locator as unverified. The 34 README section ids match the plan (its ids 0.2.1 and 7.4.1 are sub-targets of 0.2 and 7.4). Every owned section has a `*Needs:*` line and at least three Checks.

**Principles.** No route-specific shortcut (Lee–Yang for site-dependent complex fields and any ferromagnetic coupling; FKG without evenness; Gaussian processes on an arbitrary index type). No re-planned roadmap. One direction of supply. No algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file).

**Adversarial table.** Values computed this round; `t = tanh J`. Rows cover the fifteen sampled targets, the headline theorems and the targets of R01–R03. The round-8 table had no rows for 1.2, 3.2, 4.2, 4.4, 6.1, 6.2 and 7.2; they are reviewed in full here. For the other unsampled sections I relied on the round-8 rows, which carry values.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 admissibility | `exp(−φ² log(1+φ²))`; N(0,1), two sites, J ≥ 1; `(2δ₋₁+δ₁)/3`; density bound `Ce^{−ψ}` | `|φ|^α − φ² log(1+φ²) → +∞` for α > 2 and `cφ² − φ² log(1+φ²) → −∞`; form `½(x²+y²) − Jxy` has determinant `(1−J²)/4 ≤ 0`; mean −1/3; where `ψ ≥ (c+1)φ²` the integrand is at most `Ce^{−φ²}` | sound |
| 1.2 symmetries, spin flip | chain {0,1,2}; `(δ₀+δ₁)/2`; bound on −H | `⟨σ₀σ₁⟩ = t`, `⟨σ₀σ₂⟩ = t²`; unequal couplings give `tanh J₀₁ ≠ tanh J₁₂`; mean ½; `−H ≤ ½‖J‖Σφ²`, so `e^{hφ + cφ²}e^{−H}` is dominated by a product of admissible integrands | sound |
| 2.1 Lee–Yang, blocks | pair polynomial; contraction; two sites; cosh | `|1+az|² − |a+z|² = (1−a²)(1−|z|²)`; contracted product keeps 1 inside or outside A and a on crossing pairs, which is P; `−K₁K₂ = {|z| ≥ 1}`; `Z = ½(e^J cosh 2h + e^{−J})`, zero needs `cosh 2h = −e^{−2J}`; `Σ((k+½)π)⁻⁴ = 1/6`, `−12/6 = −2 = 1 − 3` | sound |
| 2.2 class, tail control | steps (a)–(f); CLT blocks; `1/(√N log N)` blocks; mixtures | Paley–Zygmund `¼σ⁴/(3σ⁴) = 1/12`; `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`, limsup `≤ θ log C + θ^{1−α′/2}`, α′ < 2; at most S/(2θ) terms above θ; `h²S/2 = cSg²` at `h = √(2c)g`; `E[poly(g)e^{g²/4}] < ∞`; `x_{N,j} ≤ 4/(π²N)`; `(1 − 2/47.717)^{−1/2} = 1.0216`; mixture moments `1 − 1/k + (2n−1)!!/k ≤ (2n−1)!!` | sound |
| 3.1 Griffiths | duplication; non-even ρ | `φφ + φ′φ′ = (ss + tt)/2`; `⟨φ⟩ = −1/3 < 0` | sound |
| 3.2 monotonicity | chain; V = {0,2} ⊂ {0,1,2}; `(2δ₋₁+δ₁)/3` with one added site | `t₀₁t₁₂` increasing; `0 ≤ t²`; `⟨φ₀⟩ = −3e^J/(5e^J + 4e^{−J})`, which is −1/3 at J = 0 and −0.541 at J = 1: decreasing, so evenness is needed | sound |
| 3.4 currents, switching | two sites, A = B = {x,y}; J = 0; normalisation | `Σ_even = cosh J = Z` (the `2^{−|V|}` of ρ_I cancels); left `sinh²J`, right `cosh²J − 1`; `Z_D = sinh 0 = 0`; corollary: both sides equal `Σ/Z²` | sound |
| 3.5 Lebowitz, Gaussian, Simon–Lieb | (i) by switching; repeated sites; chain; blocks | `Σ_j 1[x₁ ↔ x_j] ≥ 1`; `1 ≤ 1 + 2t²`; `t² ≤ Jt`; with `J̃ = J_{uv}q_cq_e`, multiplying by `q_aq_b` and summing gives the φ form with `⟨φ₀φ_u⟩_Λ`; `1/(4λ) ≤ 3·0.33799²/λ = 0.3427/λ`; ε = ¼ gives `¼ > 3/16` | sound |
| 3.6 reflection monotonicity | coefficients; lattice planes | `s_xs_y`: `½(J_{xy} + J_{x,Ry})`; `t_xt_y`: `½(J_{xy} − J_{x,Ry})`; `s_xφ_z`: `J_{xz}`; `Π(s+t)^b − Π(s−t)^b` is twice the odd-t part; half-integer plane forces y = x, other planes put x and Ry at distance ≥ 2 | sound |
| 3.7 moment bounds | F = φ_x; maximal site; Newman; non-member; signed t | `4λm² − (2b₊+‖J‖)m − 1 ≤ 0` gives M; `M(λ,0,0) = 1/(2√λ) > 0.338/√λ`; `(2n−1)!!/(2n)! = 1/(2ⁿn!)`; `0.75 + 0.25·3.7622 = 1.6905 > 1.6487`; t = (1,−1): 1.329 against 1.269 | sound; R03 |
| 4.1 monotone limits | open chain; W_n = {−n,…,2n}; δ₀ | `t^{|x|}` for R ≥ |x|; each W_n lies in a box and each box in some W_n; degree-0 correlation 1, positive degree 0 | sound |
| 4.2 infinite-volume law | d = 1 Ising; φ⁴; signed projections | `e^J/(e^J + e^{−J}) = (1+t)/2`; `⟨e^{a|φ_x|}⟩ ≤ 2e^{a²M/2}` uniformly in R (3.7 with 2.3); `(Σc_xφ_x)^k` is a finite signed sum of converging `⟨φ_A⟩`; Hölder gives an exponential moment at rate `a/Σ|c_x|` | sound |
| 4.3 susceptibility, β_c | d = 1; Λ = {0} | `1 + 2t/(1−t) = e^{2J}`: 1.649 ≤ 2 at J = ¼; `M_R ≤ 1 + 2dJ M_R` | sound |
| 4.4 axis monotonicity | chain; d = 2 small t; (5.4) | `tⁿ` decreasing; `t ≥ 2t² ≥ t²` for t ≤ ½; `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞` gives `S(x) ≥ S((‖x‖₁,0)) ≥ S((‖y‖∞,0)) ≥ S(y)` | sound |
| 5.2 reflection positivity | L = 1 edge; J = 0, L = 2, f = φ₀; generality | eigenvalues `e^{2J} ± e^{−2J}`, both ≥ 0 iff J ≥ 0; form 1 against `|Ef|² = 0`; `e^{Jab} = e^{J(a²+b²)/2}e^{−J(a−b)²/2}` | sound |
| 5.3 Gaussian domination | expansion; L = 1 Ising; unbounded spins | `−(J/2)ΣΣ(∇φ)² = JΣΣφφ − dJΣφ²`; `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}`; `Z″(0) ∝ −4J + e^{−4J}(32J² − 4J)`, max of `e^{−4J}(8J−1)` is `2e^{−3/2} = 0.446` at J = 3/8; ρ̃ finite | sound |
| 5.4, 5.5 infrared bound, order | h = e^{ip·x}; d = 3 | `JE²|T|Ŝ ≤ E|T|`; printed constant `1/(4dJ)` fails: at d = 1, J = 0.375, `4(1 − tanh 0.75) = 1.46 > 0.667`; `I₃ = W/2 = 0.2527` | sound |
| 6.1 random fields | `T_f = |∫f|`; linear family | `T_{−f} = T_f ≠ −T_f`; a law carried by `{v_h = av_f + bv_g}` gives almost sure linearity | sound |
| 6.2 Schwinger functions | deterministic field; (1.10) | `|x−y|² ≤ 2|x|² + 2|y|²`; redefining S_2 as 0 on `∪_k{|x−y| ≥ r_k, |S_2| > 1/k}` gives a uniformly decaying representative | sound |
| 6.3 Gaussian processes | `[[1,2],[2,1]]`; bilinear K | `Var(X₁ − X₂) = 1 − 4 + 1 = −2`; `Var(X_{af+bg} − aX_f − bX_g) = K(0,0) = 0` | sound |
| 6.4 Wick's law | Y a finite combination | `M_{2n}(Y,…,Y) = (2n−1)!! M_2(Y,Y)ⁿ`; `E cosh(aY) = e^{a²E[Y²]/2}`; `∫e^{a|x|} ≤ 2E cosh(aY)` | sound |
| 7.1 rescaled field | Σ = 0 | a sum of at least 3 independent copies vanishes almost surely only for δ₀ | sound |
| 7.2 reachability | J = 0 Ising; telegraph; γ_b at b = −dJ | `Σf(x/L)g(x/L)/(2L+1)^d → 2^{−d}∫fg`; `Σ_L ≈ L²κ`; `2dJ·I − J·A_R` positive definite on every box | sound; R02 |
| 7.3 structure | diluted ρ_n | site variance `(1−p) + pa² = 2 − p`; no ±a_n in the support with probability `≥ 1 − C|Λ|⁻¹`; limit variance `2^{−d−1}∫f²` | sound |
| 7.4 free field | d = 1; scaling; massless constant | `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`: `1 + e⁻²` at m = 1, `2/m − 4/3 + …` as m → 0; `L^{2d}·L^{−d}·L² = L^{d+2}`; tail `∫_{|q|>M} ≤ M⁻²(2π)^dL^{−d}Σf(x/L)²`; `(d−2)|S^{d−1}| = 4π^{d/2}/Γ(d/2−1)` | sound; R02 |
| 8.1, 8.2 downstream goals | telegraph; Gaussian; δ₀ | rows of the first section | sound |

**Seeded source sample.** All fifteen targets were checked against the cached texts.

| Target | Lines read | Outcome |
|---|---|---|
| 0.1 | `aizenman-duminilcopin-2021 line 384` | (2.2), growth for some α > 2 |
| 1.2 | `aizenman-duminilcopin-2021 lines 227–230`; `sokal-1982 lines 405–409` | (1.17); items (a)–(b): lattice symmetries and φ ↦ −φ |
| 2.2 | `aizenman-duminilcopin-2021 lines 363–386`, `1982–1985`, `2019–2022` | Definition 2.1 and (2.2); the growth condition is on the limit; continuity asserted, as the README says |
| 3.2 | `peled-spinka-2017 lines 519–532`; `sokal-1982 lines 400–405` | derivative in a coupling is a covariance; monotone volume limit |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–448`, `466–476`, `500–507` | Definitions 3.1–3.2, (3.2)–(3.5), Lemma 3.3, (3.7)–(3.9) |
| 3.5 | `aizenman-duminilcopin-2021 lines 520`, `1314–1318`, `1342–1344`, `1996–2002`; `sokal-1982 lines 419–422`; `frohlich-1982 line 109` | (3.11); Lemma 5.7; footnote 5 (finite-volume factor); items (f)–(g) |
| 3.7 | `sokal-1982 lines 846–853`, `434–435` | field equations by integration by parts; item (j) (see R03) |
| 4.1 | `sokal-1982 lines 400–411`; `peled-spinka-2017 lines 527–532`; `aizenman-duminilcopin-2021 lines 231–233` | monotone infinite-volume limit |
| 4.2 | `sokal-1982 lines 405–409`; `duminilcopin-2017-lectures lines 549–551` | invariant limit measure; Corollary 1.9 (Potts, hence Ising) |
| 4.4 | `aizenman-duminilcopin-2021 lines 1023–1050` | (5.2), Proposition 5.1, (5.3)–(5.4), as restated |
| 5.2 | `peled-spinka-2017 lines 1283–1284`, `1302–1335`, `1385–1391`, `1490–1493`, `1547–1560` | torus of side 2L; Propositions 2.14–2.16 and Corollary 2.17 |
| 5.3 | `peled-spinka-2017 lines 1258–1281`, `1561–1648`; `simon-2020-twelve-tales lines 1529–1546` | (43)–(48); (5.19)–(5.21) |
| 6.1 | `aizenman-duminilcopin-2021 lines 56–57`, `183–187` | (1.4); footnote 2 |
| 6.3 | `aizenman-duminilcopin-2021 lines 77–89` | Gaussian fields and (1.7); Glimm–Jaffe and Simon 1974 not read |
| 7.2 | `aizenman-duminilcopin-2021 lines 157–187` | (1.14)–(1.15), Definition 1.1: volume limit first, then scale; subsequences allowed |

Also read: `aizenman-duminilcopin-2021 lines 118–130`, `139–147`, `190–192`, `219–262`, `320–326`, `1014–1020`, `1056–1091`, `1436–1443`, `2003–2032`; `lebowitz-ruelle-speer-2012 lines 62–69`, `217–222`; `simon-2020-twelve-tales lines 1009–1030`; `frohlich-1982 lines 80–116`; `peled-spinka-2017 lines 334`, `513–537`, `1207–1212`, `1736–1742`, `1762–1767`.

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, as `lake-manifest.json` records. All 39 file-and-line citations of the supplier contracts were opened; each line carries the named declaration. Signatures relied on:

- `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`: `[Countable ι]`, standard Borel coordinates, probability measures; namespace `TauCeti.Measure`.
- `TauCeti/Probability/Moments/Determinacy.lean:246`: both measures need `∫e^{a|x|} < ∞`; it does not ask for probability measures.
- `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`: namespace `TauCeti.Probability`.
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:233` and `:241`: both need `S.PosSemidef`.
- `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530`: root namespace; `:636`: namespace `MeasureTheory`. The README writes both that way.
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`: `fkg` is for a finite distributive lattice only.

**Duplication and ownership.** `roadmaps grep` over main and the open heads, by object:

- "Lee–Yang", "switching lemma / random current", "Griffiths–Simon / Griffiths' inequalities", "Gaussian free field", "white noise", "ConstructiveFieldTheory": no match anywhere.
- "Ising" as a word: OperatorAlgebraDynamics (quantum chain interactions), TemperleyLiebOperatorAlgebras and TypeAHeckeAlgebras (fusion rules), ExactPenalties (a reference title). None is the classical lattice model.
- "Gibbs measure": ClassicalErgodicTheory (shift spaces) and the PDE scope sentence.
- "infrared bound / Gaussian domination", "Schwinger function", "reflection positivity": RelativisticQuantumFieldTheory only, for continuum free fields.
- "Gaussian process": StochasticCalculus Layer 1 (Brownian motion) and two statistics roadmaps (limit processes). None constructs a process from an arbitrary positive semidefinite kernel.
- "FKG": ArithmeticStatisticsPartIV and one line on main, neither about measures on ℝ^V.

This roadmap is the owner of the lattice objects, of the Lee–Yang theorem and of the kernel-indexed Gaussian process. `ConstructiveFieldTheoryPhi4PartII` is on neither main, the open-pull-request list nor the board's package index; it is named only as a consumer. Ownership against the open pull requests was checked through the roadmaps tool at the heads of the index. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations resolved now:

- StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`): the arbitrary-index extension for standard Borel state spaces, with law uniqueness, is stated there. Line 213 of the merge order.
- StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, mixed moments at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `Suggested.lean:110` `hadamard_of_orderLE_one`, `:73` `OrderLE`): the multipliable product with exponent `a + bs`, as the contract says. Line 47 of the merge order.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder; line 214 of the merge order): Mathlib-normalised multiplier `(4π²‖ξ‖²+m²)⁻¹`, the heat integral, exterior decay for 0 < c < m, the massless kernel `|x|^{2−n}/((n−2)|S^{n−1}|)` with the harmonic ambiguity classified. Its §7.3 states the massless Fourier domination for n ≥ 3. That roadmap does not cite this one.
- Scope deferrals: PDE, Scope and ownership (`TauCetiRoadmap/PDE/README.md:104–107`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`) exist as cited.

The `*Needs:*` lines of the twelve plan entries printed this round (0.2.1, 1.2, 3.2, 3.4, 3.5, 3.7, 4.2, 4.4, 5.2, 6.3, 7.2, 7.4.1) agree with their prerequisite lists. No target needs a later one.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. The layer order is forced where it matters: 1 needs 0; 2 needs 1; 3 needs 2 (3.5, 3.7); 4 needs 3; 7 needs 1, 3.2 and 6. Layers 5 and 6 are declared independent of their predecessors. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. A search for process words and LaTeX delimiters finds nothing ("current" occurs only as the random-current object, "lemma" only in names of results).

**Headlines.** The Lee–Yang theorem and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Copyright.** Wording was compared at every locator of the sample and at seven further passages:

- the definition of 7.2 against `aizenman-duminilcopin-2021 lines 167–179`;
- the event 𝓕_B of 3.4 against `lines 470–471`;
- the Asano route of 2.1 against `lebowitz-ruelle-speer-2012 lines 217–222`;
- the Griffiths-trick Check against `simon-2020-twelve-tales lines 1011–1018`;
- the proof route of 5.3 against `peled-spinka-2017 lines 1602–1632`;
- the vertex-reflection remark of 5.2 against `peled-spinka-2017 lines 1331–1332`;
- the exhaustion route of 4.4 against `sokal-1982 lines 455–466`.

No shared run beyond formulas and standard names. Arrangement: the most cited source has sections 1 (introduction and main result), 2 (the class), 3 (random currents), 4 (conditional proof), 5 (regularity of the two-point function), 6 (unconditional proofs), 7 (extension to the class). The roadmap places that source's §1 material last (Layers 6–7), draws Layer 3 from its §3, §5.1, §5.5 and §7 together with two other sources, takes Layer 4 and Layer 5 mostly from other sources, and has no counterpart of §4 and §6. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 22 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 39 of 99 parenthetical locators by my count; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.19)–(2.30) and the display of item (j): the extraction drops displayed formulas. The surrounding sentences were read and the formulas recomputed. R03 rests on the words "for any complex" and on my own derivation.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The Riemann-sum limit of 5.4 for `1/E(p)` in d ≥ 3 was checked for constants and domination, not written out in full.

## Source issues

- **Gap** in aizenman-duminilcopin-2021 at Section 7, opening paragraph and the paragraph after Proposition 7.2, preprint pp. 44–45: the source says Ising-block results pass to weak limits with the growth condition by continuity; it should supply tail control of the approximants, for instance from the Lee–Yang property; affects the proof.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the displayed symbol; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Theorem 1.2, preprint p. 5: the source says every reachable field with decaying two-point function is Gaussian; it should restrict to, or treat, parameters beyond β ≤ β_c and L ≤ ξ(β), the range of its Proposition 1.4; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at Section 5.1, first bullet after (5.2), preprint p. 23: the source says a coordinate goes to L minus itself with L a half-integer; it should take L an integer, so that the mirror is a half-integer; affects nothing.
- **Misprint** in simon-2020-twelve-tales at (5.19), p. 36: the source says the two shifts enter with the same sign and an index not bound by the sum; it should be the difference of the shifts at the two neighbouring sites; affects nothing.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators, and each statement citing them also has a locator in a text that was read or the roadmap's own route.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), an OCR scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:736–758` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e478704f751952353d9fe1a5de67641b4c4b5aeb", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~9", "model": "fable", "worker": "chris-x52"} -->
