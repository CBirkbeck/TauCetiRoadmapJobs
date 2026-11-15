<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6898656150 -->
Review (claude) of 89d5132

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a locator cited for a formula it does not contain

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:208` (1.5): "converges … to `G_μ(x − y) = (2π)^{−d} ∫ … / (E(p) + μ²) dp` (Fröhlich, the paragraph after (33), p. 13; Simon, Twelve Tales (3.8), Section 3, p. 24)"; the same citation at `:713` (7.4).

   **Claim.** (3.8) of `simon-2020-twelve-tales` supports the limit covariance.

   **Witness.** `simon-2020-twelve-tales lines 960–974`: (3.8) is a formal product measure on ℤ² with single-site factor `e^{−m²s²}`, no Green function and no limit. Its mass term gives `(−Δ + 2m²)⁻¹` or `½(−Δ + m²)⁻¹`, not the README's kernel.

   **Exact repair.** In 1.5 and 7.4 replace "Simon, Twelve Tales (3.8), Section 3, p. 24" by "Simon, Twelve Tales, Section 3, pp. 23–24, for the free lattice field as a nearest-neighbour ferromagnet with Gaussian single-site measure, written there formally and with another normalisation of the mass term". The statement and the manifest entry (which records Section 3, pp. 24–25) need no change. Tested on the instance: d = 1, the README's own formula gives `G_μ(0) = 1/(μ√(4 + μ²))` (0.4472 at μ = 1), which is what `(μ² − Δ)⁻¹` gives; the Fröhlich locator (`frohlich-1982 lines 266–269`, the two-point function as the inverse of the mass plus the finite-difference Laplacian) continues to support it.

The three round-9 findings are repaired. No P1 or P2 finding was found this round. One P3 finding (R01, a locator) carries a repair, and a repair of any priority asks for changes: the verdict is needs changes on R01 alone. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No supplier gap is declared.

## Previous findings, checked first

| Round-9 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) locators that were only extraction line numbers | `packages/ConstructiveFieldTheoryPhi4/design/README.md:172`: "Sokal, Section 2.2, properties (a)–(b), p. 327"; `:196`: "the first paragraph of Section 7, p. 44, and the paragraph after Proposition 7.2, p. 45". A search of the README for "line N" finds nothing. | **Repaired** |
| F02 (P3) one letter for the mass and the volume index | `:677`: "R_{n,k} ≥ L_n with R_{n,k} → ∞ as k → ∞ for each n"; `:713`: "`b_n = −(d + m²/(2L_n²))`, and arbitrary L_n → ∞ and R_{n,k} → ∞ as k → ∞"; `:720` "for every n and k". No `_{n,m}` is left in the README or in `design/plan.json`. | **Repaired** |
| F03 (P3) Newman's bound for nonnegative real coefficients only | `:393`: "for … complex coefficients z ∈ ℂ^V, `|⟨exp(Σ_x z_xφ_x)⟩| ≤ exp(½⟨(Σ_x |Re z_x| φ_x)²⟩)`", with a route and the new Check at `:404`; plan target 3.7 part (c) agrees. | **Repaired** (in the source's sharper form) |

The repair of F03 differs from the round-9 suggestion (`|Re z_x|` instead of `|z_x|`). I read the display on the printed page 328 of `sokal-1982` (rendered from the cached file, since the extraction drops it at `sokal-1982 lines 434–435`): (2.27) has `|Re z_i| |Re z_j|` on the right, "for any complex" coefficients. The repair states the source's form.

Adversarial pass on the changed text (values computed by me):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.7 Newman, complex form | two Ising sites, J = 1, z = (1, −1) | left `(e + e⁻¹cosh 2)/(e + e⁻¹) = (2.71828 + 1.38404)/3.08616 = 1.3293`; signed right side `e^{1 − tanh 1} = e^{0.2384} = 1.2692` (false); stated right side `e^{1.76159} = 5.8217` | holds; the Check is correct |
| same | ρ_I one site, z = iy, y = 2 | `|cos 2| = 0.416 ≤ 1`; a `|z|` form would give `e² = 7.389` | holds, sharper |
| same, route | step 1 `|e^w| = e^{Re w}`; step 2 Griffiths I termwise on an absolutely convergent series (1.2); step 3 `(2n − 1)!!/(2n)! = 1/(2ⁿn!)`, e.g. n = 2: `3/24 = 1/8` | each step uses a target of this roadmap (1.2, 3.1, 3.5) | no circularity: 3.5 does not use 3.7 |
| same, non-member | `¾δ₀ + ⅛(δ₁ + δ₋₁)`, a = 2 | `0.75 + 0.25·3.7622 = 1.6905 > e^{1/2} = 1.6487`; a⁴ coefficients `ε/24 > ε²/8` iff ε < 1/3 | class hypothesis needed |
| consequence `⟨e^{a|φ_x|}⟩ ≤ 2e^{a²⟨φ_x²⟩/2}` | ρ_I, a = 1; a = −1 | `e = 2.718 ≤ 2e^{1/2} = 3.297`; `e⁻¹ ≤ 3.297` | holds |
| 3.7 identity and bound | one site λ = 1, b = 0 | `⟨φ⁴⟩ = Γ(5/4)/Γ(1/4) = ¼`; `4λm² − (2b₊ + ‖J‖)m − 1 ≤ 0` gives M; `M(λ,0,0) = 1/(2√λ) ≥ 0.338/√λ`; diagonal variant `1 − 0.33799 = 0.662` | sound |
| 7.2–7.4 after renaming | 7.4 at m = 0, d = 3 | `b_n = −3`, matrix `6·I − A_R` is the Dirichlet Laplacian, positive definite on every box; limit variable k | no free index |
| 7.4 Checks | d = 1, m = 1; m → 0 | `C_1(1_Q,1_Q) = 2 − (1 − e⁻²) = 1.1353`; `2/m² − (2m − 2m² + (4/3)m³)/m³ = 2/m − 4/3` | unchanged and correct |

Pattern sweep. (a) Extraction line numbers: none left in the README; the plan's `where` fields keep them, as allowed. (b) A letter with two meanings in one statement: m is an exponent in 1.4 and 2.2, a block index in 2.1 and a subcurrent in 3.4, never beside a mass; none found. (c) A statement narrower than its cited source: the correlation inequalities of 3.1–3.5 are at or above the generality of `sokal-1982` (d)–(h); none found.

## Verified sound

**Coverage.** All 776 README lines read; `design/plan.json` parsed (8 layers, 36 owned targets, 2 downstream goals, `gaps: []`, four suppliers); the 14-entry manifest; the round-9 review, its repair report and the diff of the two heads (README, plan, manifest). No maintainer notes exist. The author flagged no locator as unverified. No gap is declared.

**Principles.** No route-specific shortcut (Lee–Yang for site-dependent complex fields and every ferromagnetic coupling; FKG without evenness; Gaussian processes on an arbitrary index type). No re-planned roadmap. One direction of supply. No algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file).

**Adversarial table: sampled targets and headlines.** Values computed this round; `t = tanh J`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 admissibility | `exp(−φ² log(1+φ²))`; N(0,1) on two sites, J ≥ 1; Vitali indicator; scaling by s = 0 | `cφ² − φ² log(1+φ²) → −∞`, `|φ|^α − φ² log(1+φ²) → +∞` for α > 2; form `½(x²+y²) − Jxy` has eigenvalues `½(1 ∓ J)`, one ≤ 0; not a.e. measurable; image is δ₀ | sound |
| 0.2 measures | k = 2 moment; scaling; hard limit; `ρ_{1,2}` | `u = λφ⁴` gives `λ^{−k/2}Γ((2k+1)/4)/Γ(1/4)`, `Γ(5/4)/Γ(1/4) = ¼`; density at sφ is `exp(−λs⁻⁴ψ⁴ + bs⁻²ψ²)`; `−λφ⁴ + 2λφ² = −λ(φ²−1)² + λ`; `−φ⁴ + 2φ² = −(φ²−1)² + 1` | sound |
| Conventions, 1.1 Gibbs measure | two sites; `J = (log 3)/2`; three sites; stability bound | `Z = (2e^J + 2e^{−J})/4 = cosh J`; `tanh J = ½`, `Z = 2/√3`, `tanh 2J = 4/5`, `tanh(J/2) = 2 − √3`; `Z = (2e^{3J} + 6e^{−J})/8`, numerator `2e^{3J} − 2e^{−J}`; `−H ≤ ½‖J‖Σφ²` | sound |
| 1.5 Gaussian lattice fields | two sites; d = 1; μ = 0 on a box | exponent `−½φᵀ(2|b|I − J⁰)φ`; inverse `[[2|b|, J],[J, 2|b|]]/(4b² − J²)`; `J = −3|b|` gives determinant `−5b² < 0`; `(2π)⁻¹∫dp/(2 − 2cos p + μ²) = 1/√((2+μ²)² − 4) = 1/(μ√(4+μ²))`; spectral radius of A_R below 2d, so the Neumann series converges | sound; R01 on a locator |
| 2.1 Lee–Yang and blocks | pair polynomial; contraction; Griffiths' trick; mixed signs; uniform on {−1,0,1}; `q = (1,−1)`, `K = (ln 3)/2` | `|1+az|² − |a+z|² = (1−a²)(1−|z|²)`; contracted coefficient is 1 inside or outside A and a across; `¼e^K = ½e^{−K}` iff `e^{2K} = 2`; `ε = 1/(1+e^{2K})`, `16ε > 48ε²` iff ε < 1/3; `(2π)⁻²π²/sin²(π/3) = 1/3`; `cosh 2h = −3` at `±0.881 + 1.571i`, fourth cumulant `4 − 3 = 1`; `Σ((k+½)π)⁻⁴ = 1/6`, `−12/6 = 1 − 3`; `(1 − s/ia)(1 + s/ia) = 1 + s²/a²` | sound |
| 2.2 class and tail control | steps (a), (d), (e), (f); log-N blocks; mixtures | `(σ²/2)² ≤ 3σ⁴·P` gives `P ≥ 1/12`; `log(1+u) ≥ u log 2` on (0,1] gives `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`; at most `S/(2θ)` large terms; `e^{2cg²s}` with `s < 1/(8c)` is `e^{g²/4}`; `(1 − 2/47.717)^{−1/2} = 1.0216`; `1 − 1/k + (2n−1)!!/k ≤ (2n−1)!!` | sound |
| 2.3 φ⁴ membership | exponent; tails; `g_N > 0` | `Nm²(g_N − 1)/2 − Nm⁴/12` at `m = φN^{−1/4}/c` is `bφ² − φ⁴/(12c⁴) = bφ² − λφ⁴`; `(½)⁴/12 = 1/192`; `|φ|^α ≤ c^αN^{α/4} = o(N)` for α < 4; `N > 4b²c⁴` | sound |
| 3.1 Griffiths | duplication; parity cases of Ginibre's lemma; non-even ρ | `φφ + φ′φ′ = (ss + tt)/2`; `Π(s+t)/2 − Π(s−t)/2` is the odd-t part; integrand odd under swap for n odd, under negation for m + n odd; `⟨φ⟩ = −1/3` | sound |
| 3.2 monotonicity | chain; non-even ρ with one added site | `t₀₁t₁₂`; `⟨φ₀⟩ = −3e^J/(5e^J + 4e^{−J})`: −0.333 at J = 0, −0.541 at J = 1 | sound |
| 3.3 FKG | lattice gas; reversed monotonicity | `[e^J(3+e^J) − (1+e^J)²]/(3+e^J)² = (e^J − 1)/(3+e^J)²`; `−tanh J ≤ 0` | sound |
| 3.4, 3.5 currents and inequalities | two sites; chain; block transfer | `2^{|V|}` cancels, `Z = cosh J`; `cosh²J − 1 = sinh²J`; `t² ≤ Jt`; `1 ≤ 1 + 2t²`; multiplying the Ising Simon–Lieb bound on V × Fin N by `q_aq_b` gives the φ form | sound |
| 3.6, 4.4 reflection and axis monotonicity | lattice planes; chain of inequalities | a step changes `x_i ± x_j` by 1, so no bond crosses an integer diagonal plane; a half-integer coordinate plane is crossed only by x ↔ Rx; `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞` gives `S(x) ≥ S((‖x‖₁,0)) ≥ S((‖y‖∞,0)) ≥ S(y)`; d = 2: `t ≥ 2t² ≥ t²` for t ≤ ½ | sound |
| 4.3 critical point | d = 1; Λ = {0} | `χ = (1+t)/(1−t) = e^{2J}`, 1.649 ≤ 2 at J = ¼; `M_R ≤ 1 + 2dJ·M_R` | sound |
| 5.3–5.5 torus | expansion; L = 1; Gaussian torus; d = 3 | `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}`; `2x(1 − tanh x)` has maximum 0.557 near x = 0.64; covariance symbol `2(|b| − dJ) + JE(p)`; printed constant: `4(1 − tanh 0.75) = 1.46 > 0.667`; `I_3 = W/2 = 0.2527 = G(0)/6` | sound |
| 6.1 random fields | `T_f = |∫f|`; realisation | `T_{−f} = T_f ≠ −T_f`; a law carried by `{v_h = av_f + bv_g}` makes the coordinate family linear almost surely | sound |
| 6.3, 6.4 Gaussian fields | `[[1,2],[2,1]]`; random-sign field | `1 − 4 + 1 = −2 < 0`; `M_4 = (∫fh)⁴ ≠ 3(∫fh)⁴` | sound |
| 7.1 rescaled field | zero block moment; tent; quarter-turn; chain | a sum of n ≥ 1 independent copies vanishes a.s. only for δ₀; `1 + 2Σ_{i<L}(i/L)² = (2L²+1)/(3L)`, limit ⅓ = `½∫f²`; `g⁻¹e₁ = −e₂`, `T_{f∘g}(φ) = φ_{−e₂} = T_f(φ∘g⁻¹)`, while `T_f(φ∘g) = φ_{e₂}`; `3 + 4t + 2t²` | sound |
| 7.2, 7.3 reachability | telegraph; non-even class; diluted ρ_n | `t^{|x−y|} = e^{−c|x−y|/L}`, `Σ_L ≈ L²κ`, `|T_f| ≤ κ^{−1/2}∫|f|`; `Σ ≈ N²/4`, mean `2^{−d}∫f`, variance → 0; site variance `2 − p`, exceptional sites with probability O(1/N), limit variance `2^{−d−1}∫f²` | sound |
| 7.4 free field | scaling; domination; massless constant | `L^{2d}·L^{−d}·L² = L^{d+2}`; `2(1 − cos θ) ≥ 4θ²/π²` on [−π, π]; `(d−2)|S^{d−1}| = 4π^{d/2}/Γ(d/2 − 1)`, at d = 4: `1/(4π²|x|²)` | sound |
| 8.1, 8.2 downstream goals | Gaussian check | row sum `1/(2|b_n| − 2dβ)`, equal to `L_n²/m²` at β = 1 | sound (statements unchanged since round 9) |

**Seeded source sample.** All fifteen targets, and every locator the round-10 repair wrote, were checked against the cached texts; the Sokal displays were read on rendered pages 326–329 and 342.

| Target | Read | Outcome |
|---|---|---|
| 0.1 | `aizenman-duminilcopin-2021 line 384` (p. 9) | (2.2): growth for some α > 2 |
| 0.2 | `lines 145`, `226–230`, `257` (pp. 4–6) | (1.12), (1.16)–(1.17), (1.20) with the sign of b as stated |
| 1.1 | `lines 139–145`; `sokal-1982` p. 326 | (1.11)–(1.12); (2.17) with footnote 2; Sokal's ½ on ordered pairs agrees with the convention |
| 1.5 | `frohlich-1982 lines 266–269` (p. 13); `simon-2020-twelve-tales lines 960–974` | Fröhlich supports it; Simon (3.8) does not (R01) |
| 2.1 | `aizenman-duminilcopin-2021 lines 363–373`, `2023–2031`; `lebowitz-ruelle-speer-2012 lines 62–68`, `217–222`; `simon-2020-twelve-tales lines 1011–1018` | Definition 2.1(1), (2.1), p. 8; sampling weights on p. 45; (1.2); Lemma 2.4; Griffiths' trick with coupling `(log 2)/2` |
| 2.2 | `aizenman-duminilcopin-2021 lines 374–386`, `1982–1985`, `2019–2022` | Definition 2.1(2), (2.2); continuity asserted on pp. 44–45 |
| 2.3 | `lines 392–402`; `simon-2020-twelve-tales lines 1019–1022` | (2.3)–(2.4), Figure 1, p. 9; Griffiths–Simon 1973 not read |
| 3.1 | `peled-spinka-2017 lines 334`, `515`, `535`; `sokal-1982` p. 327 | Theorems 2.1, 2.3, Lemma 2.4 on pp. 11, 13; (2.19)–(2.20) |
| 3.2 | `peled-spinka-2017 lines 519–532`; `sokal-1982 lines 400–405` | p. 13; p. 327 |
| 3.3 | `sokal-1982` p. 327 | (2.25), for increasing functions |
| 3.7 | `sokal-1982` pp. 328, 342 | (2.27) with `|Re z_i||Re z_j|`; (3.4)–(3.5) |
| 4.4 | `aizenman-duminilcopin-2021 lines 1023–1050` | (5.2), Proposition 5.1, (5.3)–(5.4), pp. 23–24 |
| 6.1 | `lines 56`, `183–187` | (1.4), p. 2; footnote 2, p. 4 |
| 7.1 | `lines 159–166` | (1.14)–(1.15), p. 4 |
| 7.4 | `sokal-1982 lines 620–721` | Section 2.3 from p. 334, Lemma 2.2 on p. 337 |

Further locators confirmed with their pages: `aizenman-duminilcopin-2021` Definition 1.1 (p. 4), Theorem 1.2 (p. 5), Proposition 1.4 (p. 7), (1.5)–(1.7) (p. 2), (1.10) (p. 3), (1.19) (p. 6), Definitions 3.1–3.2 and (3.1)–(3.9) (pp. 10–11), Lemma 3.3 (p. 11), (3.11) (p. 12), (5.1) (p. 23), (5.5)–(5.10) (p. 24), (5.23), Lemma 5.7 and footnote 5 (p. 30), Section 7.1, Theorem 7.1 and Proposition 7.2 (pp. 44–45); `sokal-1982` (2.18), (2.23)–(2.24), (2.26), (2.29)–(2.30) and the Remark (pp. 327–329), (2.33) (p. 329), Proposition 2.1 (p. 333); `peled-spinka-2017` Theorem 2.13 (p. 26), Section 2.7.1 (p. 27), Propositions 2.14–2.16 (pp. 28–30), Corollary 2.17 (p. 32), (43)–(48) (pp. 32–33), (49)–(53) (pp. 34–36); `simon-2020-twelve-tales` (5.15)–(5.22) (pp. 36–37); `duminilcopin-2017-lectures` Corollary 1.9 (p. 14); `frohlich-1982` (7), (12), (13) (pp. 4–5). 4.3 cites Sokal's Proposition 2.1 only as a locator for the critical point; nothing in the roadmap uses its proof (see Source issues).

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, as `lake-manifest.json` records. All 41 file-and-line citations of the supplier contracts were opened again this round; each line carries the named declaration. Signatures relied on:

- `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`: `[Countable ι]`, standard Borel coordinates, probability measures; namespace `TauCeti.Measure`.
- `TauCeti/Probability/Moments/Determinacy.lean:246`: each measure needs `∫e^{a|x|} < ∞` for some a > 0; equal moments for every n.
- `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`: `vⁿ(2n − 1)‼`, namespace `TauCeti.Probability`.
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:233` and `:241`: both need `S.PosSemidef`.
- `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:104`: `Integrable.mono'` asks for `AEStronglyMeasurable`, as the README says.
- `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530` (root namespace) and `:636`.
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`: `fkg` on a finite distributive lattice only.
- `Mathlib/Probability/Distributions/Gaussian/Basic.lean:112`: Dirac measures are Gaussian.

By object, the pinned Mathlib and Tau Ceti contain no Ising or Gibbs lattice measure, no Lee–Yang theorem, no Griffiths inequality and no existence theorem for a Gaussian process with a given kernel (the only `IsGaussianProcess` theorem found is `Mathlib/Probability/BrownianMotion/Basic.lean:131`, a characterisation).

**Duplication and ownership.** `roadmaps grep` over main and the open heads of the index:

- "Lee–Yang", "Griffiths inequalities / Griffiths–Simon", "switching lemma / random current", "Gaussian free field", "Ising model / spin / measure", "Simon–Lieb / Lebowitz inequality", "white noise", "ConstructiveFieldTheory": no match anywhere.
- "Gibbs measure": ClassicalErgodicTheory (shift spaces) and one line on main.
- "infrared bound / Gaussian domination": RelativisticQuantumFieldTheory (dominated convergence of Gaussian integrals, infrared behaviour of graph integrals) and one unrelated line; none is the torus bound.
- "Schwinger function": RelativisticQuantumFieldTheory §7.1 only (continuum free fields).
- "Gaussian process": StochasticCalculus Layer 1 (Brownian motion) and two statistics roadmaps (limit processes); none builds a process from an arbitrary positive semidefinite kernel.
- "FKG": ArithmeticStatisticsPartIV and one line on main, neither about measures on ℝ^V.
- "Wick / Isserlis": StandardDistributions §5.3 (cited here) and RandomMatrices on main; this roadmap restates neither.

This roadmap is the owner of the lattice objects, of the Lee–Yang theorem and of the kernel-indexed Gaussian process. `ConstructiveFieldTheoryPhi4PartII` is on neither main, the open-pull-request list nor the board's package index (8 entries read); it is named only as a consumer. Ownership against the open pull requests was checked through the roadmaps tool. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, RandomMatrices, StandardDistributions, StochasticCalculus (PointProcesses has no text at the index); shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Citations resolved now:

- StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`, the last sentences of the section): the arbitrary-index extension for standard Borel state spaces with law uniqueness. Line 213 of the merge order.
- StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `Suggested.lean:110` `hadamard_of_orderLE_one`, `:73` `OrderLE`): a multipliable product with exponent `a + bs`, as the contract says. Line 47.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder; line 214): multiplier `(4π²‖ξ‖² + m²)⁻¹`, the heat integral for x ≠ 0, exterior decay for 0 < c < m, the massless kernel `|x|^{2−n}/((n−2)|S^{n−1}|)` with the harmonic ambiguity classified. That roadmap does not cite this one.
- Scope deferrals: PDE, Scope and ownership (`TauCetiRoadmap/PDE/README.md:104–106`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`) exist as cited.

The `*Needs:*` lines of 3.7, 7.2, 7.3 and 7.4 (changed this round) agree with the plan's prerequisite lists; 3.7 now names 3.1, which its route uses. No target needs a later one.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API and at least three Checks (0.1: 5; 0.2: 4; 1.1: 3; 2.1: 8; 2.2: 6; 3.4: 4; 4.1: 3; 4.3: 4; 5.1: 3; 6.1: 3; 6.2: 3; 7.1: 5; 7.2: 4; 7.4: 3). The layer order is forced where it matters: 1 needs 0; 2 needs 1; 3 needs 2 (3.5, 3.7); 4 needs 3; 7 needs 1, 3.2 and 6. Layers 5 and 6 are declared independent of their predecessors. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. No process words, pull-request numbers, machine paths or LaTeX delimiters.

**Headlines.** The Lee–Yang theorem and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Copyright.** Wording was compared at every locator of the sample and at eight further passages:

- the definition of 7.2 against `aizenman-duminilcopin-2021 lines 167–179`;
- the Simon–Lieb route of 3.5 against footnote 5, `lines 1342–1344`;
- the class transfer of 3.5 against `lines 1996–2002` and `2019–2027`;
- 2.1 and 2.2 against Definition 2.1, `lines 363–386`;
- the Asano route of 2.1 against `lebowitz-ruelle-speer-2012 lines 217–222`;
- the Griffiths-trick Check against `simon-2020-twelve-tales lines 1011–1018`;
- 1.2 and 4.2 against `sokal-1982 lines 400–411`;
- 3.6 against `aizenman-duminilcopin-2021 lines 1023–1027`.

No shared run beyond formulas and standard names. Arrangement: the most cited source has sections 1 (fields, reachability, main result), 2 (the class), 3 (random currents), 4 (conditional proof), 5 (two-point function), 6 (unconditional proofs), 7 (extension to the class). The roadmap puts that source's §1 material last (Layers 6–7), draws Layer 3 from its §3, §5.1, §5.5 and §7 with two other sources, takes Layers 4 and 5 mostly from other sources, and has no counterpart of §4 and §6. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 23 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 40 of 99 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `frohlich-1982` displays (7), (12), (13) and the display after (33): the scan's extraction drops them; the surrounding sentences were read.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The Riemann-sum limit of 5.4 for `1/E(p)` in d ≥ 3 was checked for constants and domination, not written out in full.

## Source issues

- **Misprint** in sokal-1982 at Section 2.2, property (l), printed p. 328: the source says the infrared bound carries the number (2.23), already used for the Lebowitz inequality; it should be (2.32); affects nothing.
- **Gap** in sokal-1982 at Proposition 2.1, printed p. 333: the source says the proof given suffices once a formal identity is justified; it should use another argument, as the author states; affects the proof; corrected in print at the Note Added in Proof before the references.
- **Misprint** in simon-2020-twelve-tales at (3.8), p. 24: the source says the single-site factor has exponent minus mass squared times the spin squared; it should carry one half of that for the covariance stated just before; affects nothing.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the displayed symbol; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Section 7, opening paragraph and the paragraph after Proposition 7.2, preprint pp. 44–45: the source says Ising-block results pass to weak limits by continuity; it should supply tail control of the approximants; affects the proof.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), a scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:737–759` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "89d513286d90a537c8304cd9521ca6f8ca567003", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~10", "model": "fable", "worker": "chris-x83"} -->
