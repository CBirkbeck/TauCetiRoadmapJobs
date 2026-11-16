<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17768#issuecomment-6904045578 -->
Review (claude) of 273ca98

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 1.2 gives one page for a two-page locator

   - **Location.** `packages/ConstructiveFieldTheoryPhi4/README.md` line 181 (section 1.2): "(Aizenman–Duminil-Copin (1.11)–(1.12), p. 4, for φ⁴ fields and (1.17), p. 5, for Ising spins)".
   - **Claim.** (1.11) and (1.12) are both on p. 4.
   - **Witness.** `aizenman-duminilcopin-2021` line 139 carries (1.11) and lies before the page-4 marker at line 141; (1.12) is line 145, on p. 4. Section 1.1 of the same README (line 160) already writes "pp. 3–4".
   - **Repair.** In 1.2 replace "(1.11)–(1.12), p. 4" by "(1.11)–(1.12), pp. 3–4". Tested: it then agrees with line 160 and with the source lines above.

2. **F02** (P3) the high-temperature bound of 4.3 has no locator

   - **Location.** `packages/ConstructiveFieldTheoryPhi4/README.md` line 470 (section 4.3): "Prove the high-temperature bound for the nearest-neighbour Ising model (`criticalPoint_ising_ge`): for 0 ≤ β with 2dβ < 1, `χ(ρ_I, βJ^{nn}) ≤ 1/(1 − 2dβ)`".
   - **Claim.** Every theorem carries a locator.
   - **Witness.** The paragraph cites only "the Simon–Lieb inequality of 3.5"; no source, theorem or page. It is the one "Prove" paragraph of the README with no locator (the others were checked, see Verified sound). The target was added at the package stage.
   - **Repair.** After "A proof route: the Simon–Lieb inequality of 3.5 with Λ = {v}" add "(in the finite-volume form of Aizenman–Duminil-Copin, Lemma 5.7 with footnote 5, p. 30)". Tested: `aizenman-duminilcopin-2021` lines 1314–1319 state (5.38) and lines 1342–1344 the finite-volume factor; at Λ = {v} for Ising spins the factor is `⟨σ_v²⟩ = 1`, which gives `χ_v ≤ 1 + β Σ_{w∼v} χ_w` as the route says. Mirror the locator in the docstring of `criticalPoint_ising_ge`.

3. **F03** (P3) docstring of `phi4_secondMoment_le` cites Sokal for a bound Sokal does not state

   - **Location.** `packages/ConstructiveFieldTheoryPhi4/Suggested.lean` lines 319–322: "every `⟨φ_x²⟩` under the φ⁴ Gibbs measure is at most `[(2b₊ + K) + √((2b₊ + K)² + 16λ)] / (8λ)`, independently of `V` (Sokal, Section 3.1, (3.4)–(3.5); README §3.7)".
   - **Claim.** Sokal (3.4)–(3.5) states the uniform second-moment bound.
   - **Witness.** `sokal-1982` lines 846–853 and 861–863: (3.4)–(3.5) are the integration-by-parts identity (the field equation), not a bound. README line 403 cites them for the identity only and derives the bound by Jensen and Cauchy–Schwarz.
   - **Repair.** Replace the parenthesis by "(derived from the integration-by-parts identity of Sokal, Section 3.1, (3.4)–(3.5), by Jensen's and the Cauchy–Schwarz inequalities; README §3.7)". Tested against README 3.7: identity `4λ⟨φ_x⁴⟩ = 1 + 2b⟨φ_x²⟩ + Σ_{y≠x} J_{xy}⟨φ_xφ_y⟩`, at a maximal site `4λm² ≤ 1 + (2b₊ + K)m`, whose positive root is the stated bound (value `1/(2√λ)` at b = K = 0).

Three findings, all P3 (locators); none blocking. No previous review of this package and no maintainer notes. The mathematics, the Lean statements, the suppliers, the pins, the padding probe and the source-independence check came out clean; the evidence is below.

## Verified sound

**Principles.** No route-specific shortcut; no roadmap re-planned; supply is one-directional (below); no copied passage; no algorithm; no sorry'd data; no `set_option`; one module docstring; `theorem` only; no `#eval`, `#print`, `#synth`, `True` placeholder or `#check`.

**Elaboration.** `lake env lean` on `packages/ConstructiveFieldTheoryPhi4/Suggested.lean` from the content checkout (Mathlib 1b1ccf4, Tau Ceti 2fd255d, both confirmed with `git rev-parse` in the pinned packages): 29 warnings `declaration uses 'sorry'`, one per theorem, and no other message. The file opens with the `module` keyword followed by `import Mathlib` and one `TauCeti.*` module that it uses (`TauCeti.PerfectMatching`); 44 other board packages have the same header.

**Binders.** `#check @name` for all 60 declarations (29 theorems, 30 definitions and one structure) in one scratch file: no error; each elaborated type compared with its README statement. No declaration lost a section variable (`[Fintype V] [DecidableEq V]` appear wherever `V` does); nothing changed. The two elaboration errors listed in the worker's `signatures.md` come from its own generated check lines, not from the package.

**Padding probe, all 29 theorems.** Each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | (intros; rfl) | (intros; simp; done) | sorry`: 29 `sorry` warnings remain, so none closes. Second pass with `exact?` and `intros; exact?`: no "Try this"; 27 fall through to `sorry`, and `randomCurrent_representation` and `switching_lemma` hit the heartbeat limit inside the search. No theorem restates a definition, mirrors a Check or computes a small value. `criticalPoint_ising_ge` was a Check in the design and is now a target with a proof route (Simon–Lieb in every box, then Fatou); it is a theorem about every dimension, not a boundary case.

**Headline theorems.** The 22 names of the README's second summary paragraph (`leeYang`, `isingBlock_tailControl`, `tendsto_gibbs_of_isingBlock`, `phi4Measure_mem_griffithsSimonClass`, `griffiths_first`, `griffiths_second`, `fkg_gibbs`, `switching_lemma`, `gaussian_inequality`, `simon_lieb`, `messager_miracleSole`, `newman_bound`, `exists_infiniteVolume_limit`, `reflectionPositive`, `chessboard`, `gaussian_domination`, `infrared_bound`, `ising_longRangeOrder`, `exists_unique_gaussianProcess`, `isGaussianProcess_iff_wick`, `exists_reachableField`, `gff_reachable`) are all declared; the module docstring says every headline is statable and that the marginal-triviality goals belong to Part II. Names: every backticked identifier the README presents as its own is declared (script over all backticked tokens: none missing), and every declaration is named in the README.

**Library names at the pins.** All 45 `file:line` declaration locators of the supplier contracts opened at the pin and matched (for example `fkg` at `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370` with `hf₀ : 0 ≤ f`, `hg₀ : 0 ≤ g`, as the README says; `tendstoInDistribution_iff_tendstoInDistribution_inner` at `Mathlib/Probability/CramerWold.lean:39` in the root namespace; `TauCeti.PerfectMatching` at `TauCeti/Combinatorics/Enumerative/PerfectMatching.lean:129`, `card_perfectMatching` at :619; `exists_isProjectiveLimit_of_countable` at `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`). A scratch file of 47 `#check @…` lines with the README's fully qualified names: no error. The claim "Mathlib has no Kolmogorov extension theorem" matches `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean` lines 24–26.

**Sampled sources (step 2), read at the locator.**

| Target | Locator | Read at | Result |
|---|---|---|---|
| 0.2 | ADC (1.12) p. 4; (1.16)–(1.17) p. 5; (1.20) p. 6; Simon p. 25 | `aizenman-duminilcopin-2021` lines 145, 222–230, 257; `simon-2020-twelve-tales` line 1021 | agree; sign of b opposite in Simon, as stated |
| 1.3 | Peled–Spinka, paragraph after Thm 2.3, p. 13 | `peled-spinka-2017` lines 519–526 | derivative formula and monotonicity there |
| 1.4 | ADC first paragraph of Section 7, p. 44; paragraph after Prop. 7.2, p. 45 | lines 1980–1986, 2018–2027 | "by continuity" asserted there, as the README says |
| 1.5 | Sokal footnote 2, p. 326; Simon pp. 23–24; Fröhlich after (33), p. 13 | `sokal-1982` lines 394–396; Simon lines 954–976; `frohlich-1982` lines 266–269 | agree (free = Dirichlet; (3.8) on ℤ²; free lattice field with the difference Laplacian) |
| 2.3 | ADC (2.3)–(2.4), p. 9; Simon p. 25 | lines 392–406; Simon lines 1019–1022 | agree; Griffiths–Simon 1973 not read (uncertified) |
| 3.1 | Peled–Spinka Thm 2.1 p. 11, Thm 2.3 and Lemma 2.4 p. 13; Sokal (d), p. 327; Simon p. 24 | lines 334, 515–517, 535; Sokal lines 414–415; Simon lines 977–984 | agree |
| 3.2 | Peled–Spinka after Thm 2.3; Sokal sentence before (a), p. 327 | lines 519–532; Sokal lines 401–405 | agree |
| 3.3 | Sokal (h), p. 327 | Sokal lines 423–424 | agree ("any increasing functions") |
| 3.7 | Sokal Section 3.1, p. 342; (j), p. 328 | Sokal lines 846–853, 434–435 | identity and Newman's bound there (see R03 for the docstring) |
| 4.3 | ADC (5.1) p. 23; Sokal susceptibility p. 329, Prop. 2.1 p. 333 | ADC lines 1017–1020; Sokal lines 470, 574 | agree (see R02 for the added bound) |
| 5.2 | Peled–Spinka Props 2.14, 2.15 pp. 28–29, 2.16 p. 30, Cor. 2.17 p. 32 | lines 1328, 1385–1391, 1490–1493, 1547 | agree; their bounded-interaction setting is reached by the tilt `e^{dJφ²}ρ`, finite by admissibility |
| 6.1 | ADC (1.4) p. 2; footnote 2 p. 4 | lines 56–57, 183–187 | agree |
| 6.2 | ADC (1.5)–(1.6) p. 2; (1.10) p. 3 | lines 63–75, 124–126 | agree |
| 7.1 | ADC (1.14)–(1.15), p. 4 | lines 159–166 | agree |
| 7.2 | ADC Definition 1.1 and footnote 2, p. 4 | lines 167–171 | agree; volume first, then scale |

Further locators opened: ADC Definition 2.1 and (2.2) (lines 363–384), Definitions 3.1–3.2, (3.1)–(3.9), Lemma 3.3 (lines 421–507), (3.11) (line 520), Proposition 5.1 with (5.2)–(5.4), (5.5)–(5.10) (lines 1028–1091), Lemma 5.7 with footnote 5 (lines 1314–1344), Theorem 1.2, Proposition 1.4, Theorem 7.1, Proposition 7.2; Peled–Spinka Theorem 2.13 (lines 1207–1222), (43)–(53) (lines 1569–1766); Simon (5.14)–(5.22) on pp. 36–37; Duminil-Copin Corollary 1.9 on p. 14 (line 549); Lebowitz–Ruelle–Speer Section 1 at (1.2) (lines 62–66) and Lemma 2.4 (lines 217–222); Fröhlich (7), (12), (13) on pp. 4–5. All agree except R01.

**Adversarial table** (values computed here).

| Statement | Instances | Values | Result |
|---|---|---|---|
| Hamiltonian convention | two Ising sites | unordered sum: Z = cosh J, ⟨σσ⟩ = tanh J; at J = (ln 3)/2: 2/√3 and 1/2 | fixes the convention; `hamiltonian` sums over non-diagonal `Sym2` |
| `phi4Measure`, 0.2 | λ, b = 0 | ∫φ⁴ = Γ(5/4)/(λΓ(1/4)) = 1/(4λ); ∫φ² = 0.3380/√λ; scaling φ ↦ sφ gives (λs⁻⁴, bs⁻²) | sound |
| 1.3 | two Ising sites; J = 0 | d/dJ tanh J = 1 − tanh²J; (∫φ²)² | sound |
| 1.4 | ρ_k = (1−e^{−k})δ₀ + ½e^{−k}δ_{±k}, J = 1 | Z ≥ ½e^{k²−2k} → ∞, Z(δ₀) = 1 | uniform bound needed, stated |
| 1.5 | two sites; d = 1 | det = 4b² − J², ⟨φ_xφ_y⟩ = J/(4b² − J²); G_μ(0) = 1/(μ√(4+μ²)) | sound; density is exp(−½φᵀ(2|b|I − J⁰)φ) |
| `leeYang` | V empty; one site; two sites J = −(ln 2)/2 | 1; cosh h zero at iπ/2; zeros at ±0.658 + 1.571i | both hypotheses needed; pair polynomial: (1−a²)(1−|z|²) ≥ 0 |
| `isingBlock_laplace_ne_zero` | N = 0, q = 0; q = (1, −1), K = (ln 3)/2 | δ₀ gives 1; E = (3 + cosh 2h)/4 vanishes at ±0.881 + 1.571i | nonnegative weights needed, in `IsIsingBlock` |
| `isingBlock_laplace_hasProd` | ρ_I; uniform on {−1,0,1} | Σ((k+½)π)⁻² = ½; (2π)⁻²·(4π²/3) = 1/3 = ½·(2/3); fourth cumulant −12·(1/6) = −2 | sound |
| `isingBlock_tailControl` | proof steps (a)–(f); K = 0, q = 1/(√N log N), c = 1, N = 1000 | Paley–Zygmund 1/12; Young exponent α′ < 2; s_k(θ) ≤ (θ log C + θ^{1−α′/2})/log 2 → 0; bound (1 − 2/47.7)^{−1/2} = 1.022 | each step checked; statement sound |
| 2.2 negative controls | N(0,1); (1−ε)δ₀ + ½εδ_{±1}, ε = ¼ | ∫e^{φ²/2} = ∞; ∫φ⁴ = ¼ > 3/16 | growth condition and block structure both used |
| 2.3 | exponent at m = φN^{−1/4}/c | N m²(g_N − 1)/2 − N m⁴/12 = bφ² − λφ⁴ with 12c⁴ = 1/λ; g_N > 0 iff N > 4b²c⁴ | sound |
| `griffiths_first`, `griffiths_second` | Ising pair; ρ = (2δ₋₁+δ₁)/3; J < 0 | tanh J, 1 − tanh²J; −1/3; tanh J < 0 | hypotheses needed; Ginibre identity φφ + φ′φ′ = ½(ss + tt) |
| `fkg_gibbs` | lattice gas on two sites | covariance (e^J − 1)/(3 + e^J)² | ≥ 0 iff J ≥ 0 |
| `randomCurrent_representation` | V empty; one site A = {x}; two sites | 1 = 1; 0 = 0; Σ_even Jⁿ/n! = cosh J | sound (also holds for J < 0; hypothesis harmless) |
| `switching_lemma` | two sites, A = B = {x,y}, F = 1 | sinh²J = cosh²J − 1 | sound; `ofReal` of weights needs J ≥ 0 |
| `gaussian_inequality` | n = 0; n = 1; one site φ⁴, n = 2 | 1 ≤ 1 (one matching of `Fin 0`); equality; 1/(4λ) ≤ 0.3427/λ | sound |
| `simon_lieb` | chain 0−1−2, Λ = {0}; block reduction | tanh²J ≤ J tanh J; J̃ = J_{uv}q_nq_m sums to ⟨φ_oφ_u⟩_Λ J_{uv}⟨φ_vφ_y⟩ | sound |
| `messager_miracleSole` | chain {0..3}, R = 3 − x; J₀₂ = J₁₃ = K only | tanh J ≥ tanh²J; 0 < tanh K | hypothesis `hJP` needed; fixed points cannot lie in P by `hPR` |
| `phi4_secondMoment_le` | b = K = 0 | bound 1/(2√λ) ≥ exact 0.338/√λ | sound for every coupling sign |
| `newman_bound` | Ising pair, J = 1, z = (1, −1) | left 1.329; signed form 1.269; stated right side 5.822 | absolute values needed, present |
| `exists_infiniteVolume_limit` | junk integrals; d = 0 | admissibility makes `exp(a|ω x|)` integrable in each box, so `hexp` is not vacuous; single site trivial | sound; tightness plus moment determinacy |
| `criticalPoint_ising_ge` | d = 0; d = 1, β = ¼ | 0⁻¹ = ∞ ≤ ∞ (χ = 1 for all β); χ = e^{1/2} = 1.649 ≤ 2 | sound in `ℝ≥0∞` |
| `twoPoint_reflection_monotone` | d = 1 Ising | tanhⁿJ antitone; norm on `Fin d → ℤ` is the sup norm | sound |
| `torusCoupling`, `structureFactor` | L = 1, d = 1 | coupling 2J; Ŝ(0) = 1 + tanh 2J, Ŝ(π) = 1 − tanh 2J | matches the README convention |
| `reflectionPositive` | ε = 1: a ↔ a+1, a+L ↔ a+L+1; L = 1, ε = 0 | halves of L layers each; R = id and ⟨|f|²⟩ ≥ 0; edge matrix [[e^{2J}, e^{−2J}], …] PSD iff J ≥ 0 | sound |
| `chessboard` | L = 1, d = 1 | Cauchy–Schwarz of the edge form | sound |
| `gaussian_domination` | L = 1, d = 1 Ising | Z″(0) = −4J + e^{−4J}(32J² − 4J), max of e^{−4J}(8J − 1) is 0.446 < 1; J = 0 equality | sound |
| `infrared_bound` | L = 1, d = 1 Ising; Gaussian torus field | max of 4J(1 − tanh 2J) = 0.557 ≤ 1; E·Ŝ = E/(2(|b| − dJ) + JE) ↑ 1/J; the printed 1/(4dJ) fails at J = 0.375 (1.46 > 0.67) | constant 1/J correct and sharp; evenness not needed since Σ(Δh)_x = 0 |
| `ising_longRangeOrder` | d = 3 | I₃ = W/2 = 0.2527 = 1.516/6; Peled–Spinka's (1/(2J))∫_{[0,1]^d} agrees after p = πt | sound |
| `exists_unique_gaussianProcess` | I empty; K = [[1,2],[2,1]] | Dirac; Var(X₁ − X₂) = −2 excluded by `hpsd` | sound |
| `isGaussianProcess_iff_wick` | n = 0 both parities; random-sign field | ∫T_f = 0 and 1 = 1; M₄ = (∫fh)⁴ ≠ 3(∫fh)⁴ | sound; `hcent` needed for the forward direction |
| 7.1 | tent f, R = 4L; chain of 3 | (2L² + 1)/(3L(2L + 1)) → 1/3; Σ = 3 + 4t + 2t² | sound |
| `HasLimitLaw` | ν of infinite mass | g = 1 gives 1 → 0, impossible | ν is forced to be a probability measure |
| `exists_reachableField` | W_d: g linear isometry with gℤ^d ⊆ ℤ^d | Σ_x f(gx/L)ω_x = Σ_y f(y/L)ω_{g⁻¹y}; box and nearest-neighbour coupling invariant | sound |
| `gff_reachable` | d = 0, m > 0; d = 1; scaling | T_f ~ N(0, f(0)²) = ratio of covariances; C_m(1_Q,1_Q) = 2/m² − (1 − e^{−2m})/m³ (1 + e⁻² at m = 1, ~2/m as m → 0); both sums scale as L^{d+2} | sound; variance 1/(2d + m²/L²) is γ_b at b = −(d + m²/(2L²)) |

**Suppliers, each resolved now.** StochasticCalculus §1.1 (main, `### 1.1 construction`): arbitrary-index extension for standard Borel spaces with uniqueness, as consumed. StandardDistributions §5.3 (main, README line 605): monomial integrability and Wick–Isserlis for centred PSD Gaussian vectors. ZerosOfLFunctions §5.5 (main): `hadamard_of_orderLE_one` and `OrderLE` exist in its `Suggested.lean` (lines 115 and 78) with the hypotheses quoted. RelativisticQuantumFieldTheory §7.1 and §7.3 (open head): Fourier multiplier `(4π²‖ξ‖² + m²)⁻¹`, heat integral, exterior decay for 0 < c < m, radial massless solution (equal to `Γ(d/2 − 1)/(4π^{d/2}|x|^{d−2})`: computed), and the massless limit of item 1. Deferrals: PDE scope lines 104–109 and OperatorAlgebraDynamics D9 exist as cited.

**Dependency check.** Output: `depcheck: 234 roadmaps, 2231 edges, 0 problem(s)`. Merge order: ZerosOfLFunctions 51, StochasticCalculus 225, RelativisticQuantumFieldTheory 226, this roadmap 227; StandardDistributions is on main. No upward or cyclic edge; no declared gap, and none needed.

**Duplication and ownership.** `roadmaps grep` over main and all open heads for Lee–Yang, switching lemma, random current, Griffiths–Simon, Gaussian free field, Simon–Lieb, chessboard, Curie–Weiss, Messager, white noise: no match. Gaussian domination, reflection positivity, Schwinger function, infrared bound, random field: only RelativisticQuantumFieldTheory (continuum, tempered functionals; a zero-dimensional quartic integral) and the completed DenseGraphLimits (graph reflection positivity). Gibbs measure: ClassicalErgodicTheory (shift spaces) and the PDE deferral. Gaussian process: StochasticCalculus (Brownian motion), two statistics roadmaps (limit processes); none builds a process from an arbitrary kernel, so 6.3 stays here, as the Scope says. No `Suggested.lean` name collides with another roadmap. `overlaps.md` lists no dropped id, no second copy and no other pull request changing this roadmap.

Overlap check: read RelativisticQuantumFieldTheory, StochasticCalculus, StandardDistributions, RandomMatrices, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric; nothing shared (Kolmogorov extension: StochasticCalculus; Wick–Isserlis: StandardDistributions; continuum Green kernels: RelativisticQuantumFieldTheory; all cited, none restated).

**Shape.** All eight layers end with Examples and Dependencies; all 34 subsections have at least three Checks (counts 3 to 8); no LaTeX delimiters, no process words, pull-request numbers, paths or anchors (pattern scan: one hit, "corrected", a mathematical remark). All 14 cited works are in `sources.toml`, and no manifest entry was added or changed.

**Copyright.** Passages set beside the sources: the 15 sampled targets and the docstrings of `leeYang`, `switching_lemma`, `chessboard`, `ReachabilityScheme`, and README 2.1 (Asano contraction), 3.4 (currents), 5.3. No shared sentence; shared material is formulas and standard names. Arrangement: the source's sections 2, 3, 5, 7 are spread over Layers 2, 3.4–3.6, 4.3–4.4, 5 and its section 1 over Layers 6–7; the layer order follows the dependency lines (0 → 1 → 2 → 3 → 4; 5 and 6 independent; 7 from 1 and 6). Nothing reused as it stands.

Source independence: 22 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 50 of 116 locators; contents compared with aizenman-duminilcopin-2021: independent.

## Not verifiable

- `sokal-1982`: the extraction lost the displayed equations, so (2.17)–(2.28), (2.33) and (3.4)–(3.5) were placed by the surrounding prose and by the numbers that survive ((2.23), (2.29), (2.30), (2.32)), not read.
- `frohlich-1982`: an OCR scan of the IHES preprint without its displays; (7), (12), (13), (33) were located by their labels and the following sentences. Agreement with the published numbering was not checked.
- The seven works recorded as `uncertified` (`griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`) were not read; each is cited beside a source that was.
- Ownership against board packages other than this one was checked only through the index list, which names no related package.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), printed page 24: the source says the infrared bound has constant one over twice the row sum of couplings times β; it should be one over β times the single-bond strength; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), printed page 8: the source says the block coefficients are arbitrary real numbers; it should be nonnegative coefficients, since opposite signs break the Lee–Yang and Lebowitz properties; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at (1.5), printed page 2: the source says each factor of the product is the same test function; it should be the j-th test function at the j-th point; affects nothing.

## For the human reviewers

- **Scope.** `packages/ConstructiveFieldTheoryPhi4/README.md` lines 23 and 747–766 assign goals 8.1–8.2 and several deferrals to ConstructiveFieldTheoryPhi4PartII, which is not on main and appears in no open pull request, board package or merge-order line.
- **Scope.** The tail control of 2.2 (`isingBlock_tailControl`) and the nonnegative-weight Griffiths–Simon class are the roadmap's own; no source read states them. The proof route was checked step by step here.
- **Licence.** Seven sources are `uncertified` and unread (ids under Not verifiable); `frohlich-1982` is read from an institutional preprint scan.
- **Not tested.** `sokal-1982` (17 locators): displayed equations are missing from the extraction, so its equation numbers were not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "273ca986018e73b5539959ba76ac2d61bca3e081", "job": "REV-PKG-ConstructiveFieldTheoryPhi4", "model": "fable", "worker": "chris-x30"} -->
