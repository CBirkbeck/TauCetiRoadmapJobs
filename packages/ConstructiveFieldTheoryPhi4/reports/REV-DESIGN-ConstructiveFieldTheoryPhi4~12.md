<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6899937935 -->
Review (claude) of 415ca06

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) positive definiteness of the two-point function is stated for a `[0, ∞]`-valued function

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:462` (4.3, first API bullet): "S(x) ≤ S(0) = ⟨φ_0²⟩_{J,ρ} when finite (Cauchy–Schwarz), and S is positive definite: `Σ_{x,y} c_xc_y S(x − y) ≥ 0` for finitely supported real c." The plan entry 4.3, API `basic`, has the same wording.

   **Claim.** The quadratic form is nonnegative for every even admissible ρ and every coupling of Layer 4.

   **Witness.** `README.md:458` defines `S ∈ [0, ∞]` and 4.1 proves finiteness only under a uniform moment bound. With c = δ₀ − δ_x the sum is `2S(0) − 2S(x)`, which is `∞ − ∞` when both are infinite.

   **Exact repair.** Write "…, and, when S(0) < ∞, S is positive definite: …" in the README bullet and "S positive definite when S(0) is finite" in the plan entry. Tested on the instance: with S(0) < ∞ every S(x) ≤ S(0) is finite, `Σ c_xc_y S(x − y) = lim_R ⟨(Σ_x c_xφ_x)²⟩_{V_R} ≥ 0` by translation invariance (4.1), and for c = δ₀ − δ_x it reads `2(S(0) − S(x)) ≥ 0`; for the Ising chain, `2(1 − tanh^{|x|} J) ≥ 0`.

2. **F02** (P3) the manifest's `cited_for` omits one section that cites the main source

   **Location.** `packages/ConstructiveFieldTheoryPhi4/sources.toml`, entry `aizenman-duminilcopin-2021`, `cited_for`.

   **Claim.** The list names every section that cites the work.

   **Witness.** `README.md:280` (2.3) cites "Aizenman–Duminil-Copin, (2.3)–(2.4) and the paragraph around them, p. 9", and the plan entry 2.3 names the same lines; `"2.3"` is not in the list (24 entries, from "0.1" to "8.2").

   **Exact repair.** Add `"2.3"` to that `cited_for`. Tested: a section-by-section comparison of all 14 entries with the README then shows no section missing from any list. (Two lists carry a section whose own text does not name the work, `sokal-1982` "4.4" and `simon-2020-twelve-tales` "0.2"; both works are cited for that material in 3.6 and in the Conventions, so nothing needs to change there.)

Both round-11 findings are repaired. No P1 or P2 finding was found. Two P3 findings (R01, R02) each carry a repair, so the verdict asks for changes; neither is blocking, and neither changes a supplier or the merge order. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No supplier gap is declared. No maintainer notes exist for this roadmap.

## Previous findings, checked first

| Round-11 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) claim that Mathlib has no existence theorem for projective limits | `README.md:48`: "Mathlib has no Kolmogorov extension theorem for a general projective family … it proves a projective limit to exist only for product families … for Ionescu-Tulcea trajectories … and for the finite-dimensional laws of a process already constructed" | **Repaired** |
| F02 (P3) 3.6 route omitted the couplings inside the fixed set | `README.md:379`: "…`J_{xz}` on `s_x φ_z` for x ∈ V₊ and z ∈ V₀, and `J_{zz′}` on `φ_z φ_{z′}` for unordered pairs {z, z′} of distinct sites of V₀, all nonnegative, and with no mixed `s_x t_y` term" | **Repaired** |

Adversarial pass on the changed text (values computed this round):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| F01, "only" | search of the pinned Mathlib for `IsProjectiveLimit` | 4 files; `Mathlib/Probability/ProductMeasure.lean:362` (`isProjectiveLimit_infinitePi`, namespace `MeasureTheory.Measure`), `Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean:484` (`isProjectiveLimit_trajFun`, namespace `ProbabilityTheory.Kernel`), `Mathlib/Probability/Process/FiniteDimensionalLaws.lean:53` (`isProjectiveLimit_map`, hypothesis: an a.e. measurable process); `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24–26` says the extension theorem is not in Mathlib | holds; the names carry the right namespaces |
| F01, "of none of these kinds" | white noise on {f, g}, ∫fg ≠ 0 | covariance `[[∫f², ∫fg], [∫fg, ∫g²]]` not diagonal, so not a product family; no process given in advance | StochasticCalculus §1.1 is still needed |
| F02, pair terms | x ≠ y ∈ V₊ | `φ_xφ_y + φ_{Rx}φ_{Ry} = ½(s_xs_y + t_xt_y)`; `φ_xφ_{Ry} + φ_{Rx}φ_y = ½(s_xs_y − t_xt_y)` | coefficients `½(J_{xy} ± J_{x,Ry}) ≥ 0` |
| F02, completeness | V = {−1, 0, 1} × {0, 1}, reflection in x₁ = 0 | 7 bonds: 4 of type `s φ`, 2 in one `s s + t t` pair, 1 of type `φ_z φ_{z′}`; crossing terms 0 | 7 of 7 covered |
| F02, sign | Conventions: `H = −Σ J_{xy}φ_xφ_y` | the listed nonnegative coefficients are those of `−H` minus the crossing terms, as the repaired sentence says | consistent |
| F02, closing step | A = B = 1_x | `φ_x(φ_x − φ_{Rx}) = ½(s_xt_x + t_x²)`; `∫ s^a t^b` vanishes unless a, b are even | route closes |

Pattern sweep: no other sentence of the README or the plan says what Mathlib lacks without a file and line; no other route expands a Hamiltonian over a partition of the sites (4.4, 5.2 and 5.3 cite 3.6 or the reflection-positivity propositions).

## Verified sound

**Coverage.** All 776 lines of the README were read; `design/plan.json` was parsed (8 layers, 36 targets, 4 suppliers, 1 consumer, 2 downstream goals, `gaps: []`, no prerequisite pointing to a later target) and the entries of the fifteen sampled targets were compared with the README (they agree); the 14-entry manifest; the round-11 review and its repair report. The author flagged no locator as unverified.

**Principles.** No route-specific shortcut (Lee–Yang for site-dependent complex fields and every ferromagnetic coupling; FKG without evenness; Gaussian processes on an arbitrary index type; the moment bound of 3.7 for every coupling). No re-planned roadmap, one direction of supply, no algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file).

**Adversarial table: sampled targets, headlines and the targets of the findings.** Every value was computed this round; `t = tanh J`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, Hamiltonian | two Ising sites, `J = (log 3)/2` | `Z = 2/√3`, `⟨σσ⟩ = ½`; doubled: `tanh(log 3) = 4/5`; halved: `2 − √3` | sound |
| 0.2 scaling, moments | ψ = sφ; k = 1, 2 | density `exp(−λs⁻⁴ψ⁴ + bs⁻²ψ²)`; `Γ(3/4)/Γ(1/4) = 0.33799`; `Γ(5/4)/Γ(1/4) = 0.25` | sound |
| 0.2 hard limit, double well | λ = 1, b = 2 | `−φ⁴ + 2φ² = −(φ² − 1)² + 1`; critical points 0, ±1 | sound |
| 0.2 Gaussian member | b = −½ | density `e^{−φ²/2}`, variance `1/(2·½) = 1` | sound |
| 1.1 stability, three sites | all pairs J, Ising | `−H ≤ ½‖J‖Σφ_x²`; `Z = (2e^{3J} + 6e^{−J})/8`; numerator of `⟨σ₁σ₂⟩`: `2e^{3J} + 2e^{−J} − 4e^{−J}` | sound |
| 1.1 instability | N(0,1), J = 1 | `½(x² + y²) − xy = ½(x − y)²`, degenerate, Z = ∞ | sound |
| 1.3 derivative | two Ising sites; diagonal direction | `1 − t² = ⟨(σσ)²⟩ − ⟨σσ⟩²`; ordered-sum convention with diagonal gives `½⟨F ; φ_x²⟩` | sound |
| 2.1 Lee–Yang (headline) | pair polynomial; two sites, `J = −(ln 2)/2` | `|1 + az|² − |a + z|² = (1 − a²)(1 − |z|²)`; `Z = ½(e^J cosh 2h + e^{−J})`, zeros at `±0.6585 + iπ/2` | sound; ferromagnetism needed |
| 2.1 product formula | ρ_I; uniform on {−1, 0, 1}; q = (1, −1), `K = (ln 3)/2` | `Σ((k + ½)π)⁻⁴ = 1/6`, cumulant `−2`; `(2π)⁻²π²/sin²(π/3) = 1/3`; ε = ¼, zeros `±0.8814 + iπ/2`, cumulant `4 − 3 = 1` | sound; negative control fails as stated |
| 2.2 tail control | steps (a), (d), (e), (f) | Paley–Zygmund `(σ²/2)²/(3σ⁴) = 1/12`; `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`; at most `S/(2θ)` large terms; `e^{2c g² s}` with s < 1/(8c) is below `e^{g²/4}` | sound |
| 2.2 Check, log-N blocks | c = 1, N = 1000 | `(1 − 2/47.717)^{−1/2} = 1.0216`; lower bound `2^{1−N} exp(N^{α/2}/log^α N)` | sound |
| 2.3 exponent | `m = φN^{−1/4}/c` | `−N m⁴/12 + bc²√N m² = −φ⁴/(12c⁴) + bφ² = −λφ⁴ + bφ²`; `I(m)` coefficients ½, 1/12; `g_N > 0` iff `N > 4b²c⁴` for b < 0 | sound |
| 2.3 tail remainder | |m| ≥ ½ | `N m⁴/12 ≥ N/192`, linear term `O(√N)` | sound |
| 3.1 Ginibre | parity cases; duplication | n odd: odd under x ↔ y; m + n odd: odd under the joint flip; else m, n even; `H(φ) + H(φ′) = −¼Σ_{x≠y}J(ss + tt)` | sound |
| 3.2 volume, non-even control | `(2δ₋₁ + δ₁)/3`, one added site | `⟨φ₀⟩ = −3e^J/(5e^J + 4e^{−J})`, −1/3 at J = 0, decreasing | sound |
| 3.4 representation, switching | two sites; A = B = {x, y}, F ≡ 1 | `Σ_{n even} Jⁿ/n! = cosh J = Z` with normalised `ρ_I`; `sinh² = cosh² − 1` | sound; the corollary is the source's (3.7) with `σ_Aσ_B = σ_{A∆B}` |
| 3.5 (i) route | lemma with the roles of the two source sets exchanged | left side symmetric in the two currents, so the indicator may be of either set | sound |
| 3.5 (ii), repeats | (x, x, y, y) | `1 ≤ 1 + 2t²`; pairings of the reduced list are among those of the full list, all terms ≥ 0 | sound |
| 3.5 (iii), block transfer | chain, Λ = {0}; blocks | `t² ≤ J t`; multiplying by `q_aq_b` and summing gives `Σ J_{uv}⟨φ₀φ_u⟩_Λ⟨φ_vφ_y⟩` | sound |
| 3.5 corollary | `ρ_{λ,0}`; ε = ¼ non-member | `0.25/λ ≤ 0.3427/λ`; `¼ > 3/16` | sound; t ≥ 0 needed and stated |
| 3.6 hypotheses | integer diagonal plane; half-integer coordinate plane | a neighbour step changes `x_i ± x_j` by 1, so no bond joins the open sides; across `x_i = a + ½` only x, Rx | sound |
| 3.7 identity, bound | F = φ_x; b = J = 0 | `1 = 4λ⟨φ⁴⟩ − 2b⟨φ²⟩ − ΣJ⟨φ_xφ_y⟩`; `4λm² − (2b₊ + ‖J‖)m − 1 ≤ 0`; `M = 1/(2√λ) ≥ 0.338/√λ` | sound |
| 3.7 Checks | diagonal; growth; Newman | `1 − 0.338 = 0.662`; `4φ³dφ = dt/t`; `1.6905 > 1.6487`; `1.3293`, `1.2692`, `5.8217` | sound |
| 4.1 limits | open chain; δ₀ | `tanh^{|x|} J` for R ≥ |x|; 0 and 1 | sound |
| 4.2 Markov chain, route | d = 1 Ising | `e^J/(e^J + e^{−J}) = (1 + t)/2`; Hölder gives exponential moments of projections | sound |
| 4.3 susceptibility | d = 1; Λ = {0} | `(1 + t)/(1 − t) = e^{2J}`, 1.649 ≤ 2 at J = ¼; `χ ≤ 1 + 2dJχ` | sound; R01 on the positive-definiteness bullet |
| 5.2 reflection positivity | L = 1 (edge and vertex); L = 2 vertex | matrix `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]`, PSD iff J ≥ 0; for L = 1 a vertex reflection is the identity and the form is `⟨|f|²⟩`; form 1 against `|E f|² = 0` | sound |
| 5.2 chessboard | L = 1, d = 1 | `|⟨f₀f₁⟩|² ≤ ⟨f₀f₀⟩⟨f₁f₁⟩`, Cauchy–Schwarz for the edge form | sound |
| 5.3, 5.4 (headlines) | L = 1 Ising; Gaussian torus | `Z″(0) ∝ −4J + e^{−4J}(32J² − 4J)`, `max e^{−4J}(8J − 1) = 0.446`; `max 2x(1 − tanh x) = 0.557` at x = 0.639; symbol `2(|b| − dJ) + JE(p)`; printed constant: `1.459 > 0.667` | sound |
| 5.5 (headline) | d = 3 | Watson integral by a 60³ midpoint sum 0.503 (limit 0.5055), `I₃ = W/2` | sound |
| 6.2 Checks | h Gaussian; white noise | `|x − y|² ≤ 2|x|² + 2|y|²`; S₂ = 0 off the diagonal contradicts `∫f² > 0` | sound |
| 6.3 | `[[1, 2], [2, 1]]` | eigenvalues 3, −1; variance of `X₁ − X₂` is −2 | sound |
| 7.3 | `(δ₀ + δ₁)/2`; diluted ρ_n | `Σ_L = N/4 + N²/4`, mean `→ 2^{−d}∫f`; site variance `2 − p`, limit variance `2^{−d−1}∫f²`, union bound `CN·N⁻² → 0` | sound |
| 7.4 (headline) | scaling; d = 1 | `L^{2d}·L^{−d}·L² = L^{d+2}`; `C_m(1_Q, 1_Q) = 2/m² − (1 − e^{−2m})/m³`, 1.1353 at m = 1; `(d − 2)|S^{d−1}| = 4π^{d/2}/Γ(d/2 − 1)` | sound; agrees with RelativisticQuantumFieldTheory §7.1 |

For the targets outside the sample that no repair touched (1.2, 1.4, 1.5, 3.3, 4.4, 5.1, 6.1, 6.4, 7.1, 7.2, 8.1, 8.2) the round-11 table carries computed values; I recomputed one value in each (for example the two-site Gaussian inverse, the lattice-gas covariance `(e^J − 1)/(3 + e^J)²`, the 4-cycle `(t + t³)/(1 + t⁴)`, the tent sum `(2L² + 1)/(3L)`, the three-site block second moment `3 + 4t + 2t²`) and they agree.

**Seeded source sample.** All fifteen targets were checked at their locators in the cached texts.

| Target | Read | Outcome |
|---|---|---|
| 0.2 | `aizenman-duminilcopin-2021 lines 142–147` (p. 4), `220–230` (p. 5), `253–259` (p. 6) | (1.12) with the sign of b as in the README; (1.16)–(1.17); (1.20) |
| 1.1 | `aizenman-duminilcopin-2021 lines 137–147` (pp. 3–4); `sokal-1982 lines 392–396` (p. 326) | (1.11)–(1.12), sum over unordered pairs; (2.17) and footnote 2 |
| 1.3 | `peled-spinka-2017 lines 519–526` (p. 13) | the derivative formula after Theorem 2.3 |
| 2.3 | `aizenman-duminilcopin-2021 lines 392–406` (p. 9); `simon-2020-twelve-tales lines 1019–1022` (p. 25) | (2.3)–(2.4), `g_N → 1`; the weight written with the opposite sign of b |
| 3.1 | `peled-spinka-2017 lines 334`, `515–518`, `533–536` (pp. 11, 13); `sokal-1982 line 414` (p. 327); `simon-2020-twelve-tales lines 977–984` (p. 24) | Theorems 2.1, 2.3 and Lemma 2.4 for Ising and O(2) spins; property (d); the continuous-spin extension |
| 3.2 | `peled-spinka-2017 lines 519–532`; `sokal-1982 lines 400–405` | p. 13; p. 327 |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–448` (p. 10), `464–507` (p. 11) | Definitions 3.1–3.2, (3.1)–(3.5), Lemma 3.3 with (3.6), (3.7)–(3.9) |
| 3.5 | `aizenman-duminilcopin-2021 lines 276` (p. 6), `520` (p. 12), `1314–1322`, `1342–1344` (p. 30), `1996–1999` (p. 45); `sokal-1982 lines 419–422` (p. 327); `frohlich-1982 line 109` (p. 5) | (1.21); (3.11); Lemma 5.7 with (5.38) and footnote 5; site splitting; properties (f)–(g); the Lebowitz inequality after (12) |
| 3.7 | `sokal-1982 lines 434–435` (p. 328), `846–853` (p. 342) | property (j), complex coefficients; (3.4)–(3.5) read on the rendered page: the identity under the integral and the field equation for general F |
| 4.1 | `sokal-1982 lines 400–405` (p. 327); `peled-spinka-2017 lines 527–532` (p. 13); `aizenman-duminilcopin-2021 lines 231–233` (p. 5) | monotone limits by Griffiths' inequalities |
| 4.2 | `sokal-1982 lines 406–409` (p. 327); `duminilcopin-2017-lectures lines 549–551` (p. 14) | properties (a)–(b); Corollary 1.9 (free measures as limits, Potts, so Ising at q = 2) |
| 5.2 | `peled-spinka-2017 lines 1328–1332` (p. 28), `1385–1391` (p. 29), `1486–1493` (p. 30), `1547` (p. 32) | Propositions 2.14–2.16 and Corollary 2.17; the edge case assumes a positive-definite representation, the Gaussian one is theirs |
| 6.2 | `aizenman-duminilcopin-2021 lines 55–76` (p. 2), `124–126` (p. 3) | (1.4)–(1.6); (1.10) |
| 6.3 | `aizenman-duminilcopin-2021 lines 77–89` (p. 2) | the paragraph of (1.7) |
| 7.3 | `aizenman-duminilcopin-2021 lines 172–179` (p. 4); `sokal-1982 lines 710–721` (p. 337) | the paragraph after Definition 1.1; Lemma 2.2 |

Also confirmed: `aizenman-duminilcopin-2021` Definition 2.1 (pp. 8–9, real coefficients), (5.7)–(5.10) on p. 24 with the printed constant, Theorem 7.1 and Proposition 7.2 on p. 45 for β ≤ β_c and L ≤ ξ; `frohlich-1982` p. 13, the free lattice field after (33); `simon-2020-twelve-tales` pp. 24–25, the display (3.8) and Griffiths' trick (`H = −(log 2)t²`, which is `K₁₂ = (ln 2)/2`).

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, as `lake-manifest.json` records. Every file-and-line citation of the supplier contracts (43, including the three added by the repair) was opened; each line carries the named declaration. Signatures relied on:

- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`: `multivariateGaussian` is a measure on `EuclideanSpace ℝ ι` and is a Dirac measure when S is not positive semidefinite; `:233` and `:241` assume `S.PosSemidef`. The README says "transported to ℝ^V" and assumes positive semidefiniteness.
- `Mathlib/Probability/Process/FiniteDimensionalLaws.lean:53`: assumes the process, as the repaired sentence says.
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`: nonnegative monotone f, g on a finite distributive lattice; nothing about ℝ^V.
- `Mathlib/Analysis/MeanInequalities.lean:547`, `Mathlib/Analysis/Complex/AbsMax.lean:404`, `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530` and `:636`, `Mathlib/Probability/Distributions/Gaussian/Real.lean:503`: as described in the contracts.
- `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165` (`[Countable ι]`), `TauCeti/Probability/Moments/Determinacy.lean:246`, `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`.

By object, a word search of the pinned Mathlib and Tau Ceti for Ising, Lee–Yang, Griffiths and Gibbs finds no lattice measure, no Lee–Yang theorem and no correlation inequality (the hits are Gibbs' inequality for the Kullback–Leibler divergence and unrelated files).

**Duplication and ownership.** `roadmaps grep` over main and the open heads of the index:

- "Lee–Yang", "Griffiths–Simon / Griffiths inequalities", "switching lemma / random current", "Simon–Lieb / Lebowitz inequality", "Messager / chessboard", "Gaussian free field / white noise", "ConstructiveFieldTheory": no match.
- "Ising" as a word: ExactPenalties (a reference title), OperatorAlgebraDynamics (quantum chain), TemperleyLiebOperatorAlgebras and TypeAHeckeAlgebras (fusion rules, a trace). "Gibbs measure": ClassicalErgodicTheory (shift spaces), PDE (a deferral).
- "infrared bound / Gaussian domination", "reflection positivity", "Schwinger function": RelativisticQuantumFieldTheory (continuum) and one unrelated line; none is the torus statement.
- "Gaussian process", "covariance kernel": StochasticCalculus Layer 1 (Brownian motion; its §1.1 is the extension theorem, not a process for an arbitrary kernel) and the statistics roadmaps (limit processes).
- "Wick–Isserlis": StandardDistributions §5.3 (cited).

This roadmap is the owner of the lattice objects, the Lee–Yang theorem and the kernel-indexed Gaussian process. `ConstructiveFieldTheoryPhi4PartII` is on neither main, the open-pull-request list nor the board's package index (2 entries read); it is named only as a consumer. Ownership against the open pull requests was checked through the roadmaps tool. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy; main has no `ConstructiveFieldTheoryPhi4` folder.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations resolved now:

- StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`, the closing sentences of the section, before 1.2 at `:893`): the unique law on the product σ-algebra for any indexed family of standard Borel spaces with consistent finite-dimensional laws. Line 213 of the merge order.
- StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean:73` `OrderLE` and `:110` `hadamard_of_orderLE_one`): entire f, `f 0 ≠ 0`, `OrderLE f 1`, a multipliable product with exponent `a + b s`, as the contract says. Line 47.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder; line 214): multiplier `(4π²‖ξ‖² + m²)⁻¹`, the heat integral for x ≠ 0, exterior decay for 0 < c < m, the massless kernel `|x|^{2−n}/((n − 2)|S^{n−1}|)` with the harmonic ambiguity classified. Its text does not name this roadmap, so there is no cycle.
- Scope deferrals: PDE, Scope and ownership (`TauCetiRoadmap/PDE/README.md:104–108`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`) exist as cited.

Every `*Needs:*` line was read against the statement and route above it; none names a later target, and each agrees with the plan's prerequisite list.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API and at least three Checks (0.1: 5; 0.2: 4; 1.1: 3; 2.1: 8; 2.2: 6; 3.4: 4; 4.1: 3; 4.3: 4; 5.1: 3; 6.1: 3; 6.2: 3; 7.1: 5; 7.2: 4; 7.4: 3). The layer order is forced where it matters (1 needs 0; 2 needs 1; 3 needs 2 through 3.5 and 3.7; 4 needs 3; 7 needs 1, 3.2 and 6), and Layers 5 and 6 are declared independent. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. A search found no process words, pull-request numbers, machine paths or LaTeX delimiters.

**Headlines.** The Lee–Yang theorem and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Copyright.** Wording was compared at every locator of the sample: 13 passages of `aizenman-duminilcopin-2021`, 6 of `peled-spinka-2017`, 3 of `sokal-1982`, 3 of `simon-2020-twelve-tales`, 2 of `frohlich-1982`, 1 of `duminilcopin-2017-lectures`. Among them are the definitions of 3.4 (against `aizenman-duminilcopin-2021 lines 421–428` and `464–471`), of 7.2 (`lines 167–171`), of 2.1–2.2 (`lines 363–386`), the remark on the hard limit in 0.2 (`lines 253–259`, five words shared, a standard name), the Griffiths-trick Check (`simon-2020-twelve-tales lines 1011–1018`) and the route of 3.2 (`peled-spinka-2017 lines 519–532`). No shared run beyond formulas and standard names. Arrangement: the most cited source has sections 1 (fields and main result), 2 (the class), 3 (random currents), 4 (intersection clusters), 5 (two-point function), 6 (unconditional proofs), 7 (extension to the class), read from its headings. The roadmap puts that source's §1 material last (Layers 6–7), builds Layer 3 from its §3, §5.1 and §7 with two other sources, takes Layers 4 and 5 mostly from other sources and has no counterpart of §4 and §6. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 28 passages compared with 6 sources, none shared; largest share aizenman-duminilcopin-2021, 42 of 108 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.17)–(2.30) and (2.33), and `frohlich-1982` displays (7), (12), (13), (33): the extractions drop them. I rendered only printed pp. 342–343 of `sokal-1982` (for 3.7); for the others I read the surrounding sentences, which name each property, and recomputed the statements independently.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The Riemann-sum limit of 5.4 for `1/E(p)` in d ≥ 3 and the limit of 7.4 were checked for constants, for the bound `L²E(q/L) ≥ (4/π²)|q|²` and for a uniform tail estimate, not written out in full.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the symbol of (5.7); affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Section 7.1, the paragraph after Proposition 7.2, preprint p. 45: the source says uniform constants pass the bound from Ising blocks to their weak limits; it should supply tail control of the approximants; affects the proof.
- **Misprint** in simon-2020-twelve-tales at (3.8), p. 24: the source says the single-site factor has exponent minus mass squared times the spin squared; it should carry the factor matching the covariance stated just before; affects nothing.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), a scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:737–759` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "415ca06a2d53f3a9d453696a124e773995c32d57", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~12", "model": "fable", "worker": "chris-x29"} -->
