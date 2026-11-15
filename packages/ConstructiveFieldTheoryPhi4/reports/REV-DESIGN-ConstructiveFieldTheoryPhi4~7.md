<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6896117950 -->
Review (claude) of 508d0cb

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two `*Needs:*` lines name a Mathlib declaration their plan entries lack

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:109` "*Needs:* Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.map`, …"; `:130` "*Needs:* 0.1; Mathlib `ProbabilityTheory.gaussianReal`, `integral_gaussian`, `Real.Gamma`, `MeasureTheory.ProbabilityMeasure`."

   **Claim.** The README line and the plan entry of a target list the same inputs.

   **Witness.** `design/plan.json`, target 0.1: prerequisites are `integrableExpSet`, `IsNegInvariant`, `Measure.pi`, `Integrable.mono'`, no `Measure.map`. Targets 0.2 and 0.2.1: `integral_gaussian`, `Real.Gamma`, `gaussianReal`, `target:0.1`, no `MeasureTheory.ProbabilityMeasure`.

   **Exact repair.** Add `mathlib:MeasureTheory.Measure.map` to the prerequisites of plan target 0.1 and `mathlib:MeasureTheory.ProbabilityMeasure` to those of plan target 0.2. The README lines stay as they are: 0.1 uses `Measure.map` for the images under φ ↦ sφ, and 0.2 uses `ProbabilityMeasure` for the weak limit `ρ_{λ,2λ} → ρ_I`. If the plan is frozen when this is applied, the README lines are the authority and the package README keeps them. Both names exist at the pin (`Mathlib/MeasureTheory/Measure/Map.lean:96`; `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`), so nobody is blocked either way.

2. **F02** (P3) a sentence that reads as history

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:736`: "The following sourced statements describe the downstream goals and retain identifiers 8.1 and 8.2 for their mathematical content; they are not theorem targets or acceptance statements of this roadmap."

   **Claim.** The text is timeless.

   **Witness.** "retain identifiers" tells the reader the two statements had these numbers in an earlier arrangement; "The base completion ends at Layer 7" in the same paragraph is a milestone phrase.

   **Exact repair.** Replace the paragraph by: "This roadmap ends with Layer 7. The two statements below, numbered 8.1 and 8.2, are the goals of ConstructiveFieldTheoryPhi4PartII, stated with their sources so that the hypotheses Layers 2, 6 and 7 must serve are visible; they are not targets of this roadmap."

No P1 or P2 finding. Two P3 findings (R01, R02), each with an exact repair for a fix round to apply; a repair of any priority asks for changes, so the design is not accepted with them open. The single finding of round 6 is repaired. The design files and the source manifest were left unchanged. Elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so no Lean command was run and there is nothing to probe for padding.

## Previous finding, checked first

| Round-6 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) `*Needs:*` lines covering several targets with different needs (2.1, 3.7) | `packages/ConstructiveFieldTheoryPhi4/design/README.md:242` "*Needs:* 0.1; 0.2; 1.1; Mathlib `MeasureTheory.Measure.map`; for the evenness of the block measures and for the Lee–Yang property, 1.2; for the Lee–Yang property only, also Mathlib `Complex.norm_le_of_forall_mem_frontier_norm_le` and ZerosOfLFunctions §5.5."; `:395` "*Needs:* 0.2; 1.1; 1.2; for Newman's bound only, 2.2 and 3.5."; `:447` "… and for φ⁴ measures also 2.3"; `:493` "Layers 1 and 3, and Layer 2 (through 3.5 and 3.7, and 2.3 for the φ⁴ case of 4.2)". Plan: 2.1 gains `target:0.1`, `target:1.2`; 3.7 has `target:2.2` in place of `target:2.3`; 4.2 gains `target:2.3`. | **Repaired.** The repairer's departure from the suggested 3.7 line is correct: Newman's bound is stated for every member of the class, so it needs the class (2.2) and the Gaussian inequality (3.5), not the membership of φ⁴ measures (2.3); 4.2, which combines 3.7 with membership, now lists 2.3 itself. |

Pattern sweep. All 37 `*Needs:*` lines were set beside the 36 owned plan entries (0.1–7.4.1) and beside each layer's Dependencies. The ten further lines the repair scoped (2.2, 3.5, 3.6, 4.1, 4.3, 5.4, 6.1, 7.1, 7.2, 7.4) have the same union as their plan entries. No remaining line blocks one target of its section behind a supplier only another target uses. Two residual README/plan disagreements, both about Mathlib names only, are R01.

## Verified sound

**Coverage.** All 773 README lines read; `plan.json` parsed (8 layers, 36 owned targets and 2 downstream goals, `gaps: []`, four suppliers); the 14-entry manifest; the round-6 review and its repair report; the diff of the two heads (README 30 lines, plan 3 prerequisite lists); the overlap and citation leads; the package index. No maintainer notes exist and no gap is declared. No locator is flagged unverified by the author.

**Principles.** No route-specific shortcut (Lee–Yang with site-dependent complex fields and general ferromagnetic couplings; FKG without evenness; Gaussian processes on an arbitrary index type), no re-planned roadmap (Kolmogorov extension, Wick–Isserlis, Hadamard factorisation and the continuum Green kernels are imported), single direction of supply (gate below), no algorithm, no copied passage, no `set_option`, no sorry'd data (no Lean file).

**Adversarial table.** Values computed by hand this round; `t = tanh J`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Repair: 3.7 Newman needs 2.2 and 3.5, not 2.3 | ρ in the class, X = Σ t_xφ_x | odd moments vanish by spin flip (1.2); `Σ_n ⟨X^{2n}⟩/(2n)! ≤ Σ_n (2n−1)!!⟨X²⟩ⁿ/(2n)! = e^{⟨X²⟩/2}`; ρ_I: cosh 2 = 3.762 ≤ e² = 7.389 | sound; no φ⁴ input |
| Repair: 4.2 φ⁴ case needs 2.3 | λ = 1, b = 0, d = 1, J(±1) = ¼ | ‖J‖ = ½; `M = (½ + √(¼ + 16))/8 = 0.5664`; Newman gives `⟨e^{|φ_x|}⟩ ≤ 2e^{0.2832} = 2.655` for every R, and Newman requires membership | sound |
| Repair: 2.1 evenness from 1.2 | N = 2, q = (½, ½), K = (ln 2)/2 | weights `¼e^K` at t = ±1, `½e^{−K}` at 0, equal iff e^{2K} = 2; law uniform on {−1, 0, 1} | sound |
| 1.1 Gibbs measure | 2 and 3 Ising sites; N(0,1), J = 1 | `Z = cosh J`, `⟨σσ⟩ = t`; `Z = (2e^{3J} + 6e^{−J})/8`, `⟨σ₁σ₂⟩ = (e^{3J} − e^{−J})/(e^{3J} + 3e^{−J})` < 0 for J < 0; form `½(x² + y²) − xy` degenerate, Z = ∞; `|H| ≤ ½‖J‖Σφ_x²` from `|φ_xφ_y| ≤ (φ_x² + φ_y²)/2` | sound |
| 1.2 symmetries | chain 0−1−2; `(δ₀ + δ₁)/2` | `⟨σ₀σ₂⟩ = t²`; `⟨φ⟩ = ½ ≠ 0` | sound; evenness needed |
| 1.4 continuity | `ρ_k = (1 − e^{−k})δ₀ + ½e^{−k}(δ_k + δ_{−k})`, 2 sites, J = 1 | both sites at k: probability `¼e^{−2k}`, weight `e^{k²}`, so Z(ρ_k) → ∞ while Z(δ₀) = 1 | sound; uniform bound needed |
| 1.5 Gaussian fields | 2 sites; d = 1; box | inverse of `[[2\|b\|, −J], [−J, 2\|b\|]]` has entries `2\|b\|/(4b² − J²)`, `J/(4b² − J²)`; `(2π)⁻¹∫dp/(a − 2cos p) = (a² − 4)^{−1/2}` with a = 2 + μ² gives `1/(μ√(4 + μ²))`; `2\|b\| = 2d + μ²` exceeds the spectral radius of A_R (< 2d on a finite box) | sound |
| 2.1 mixed signs | q = (1, −1), K = (ln 3)/2 | `ε = 1/(1 + e^{2K}) = ¼`; `∫φ⁴ = 16ε = 4 > 3 = 48ε²`; zeros of `(3 + cosh 2h)/4` off the imaginary axis | sound; nonnegative weights needed |
| 2.1 product formula | uniform on {−1, 0, 1} | zeros `i·2π(n + 1/3)`, n ∈ ℤ; `(2π)⁻² π²/sin²(π/3) = 1/3 = ½·(2/3)` | sound |
| 2.2 class | N(0,1); `(1 − ε)δ₀ + ½ε(δ₁ + δ₋₁)`, ε = ¼ | `∫e^{\|φ\|^α}dN = ∞` for α > 2; `¼ > 3/16` | sound; both excluded |
| 2.3 φ⁴ as limit | `c = (12λ)^{−1/4}`, `m = φN^{−1/4}/c` | `(g_N − 1)Nm²/2 = bφ²`; `Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴`; at \|m\| = ½, `Nm⁴/12 = N/192`; `\|φ\|^α ≤ c^αN^{α/4} = o(N)` for α < 4 | sound |
| 3.3 FKG | lattice gas, 2 sites | `e^J/(3 + e^J) − ((1 + e^J)/(3 + e^J))² = (e^J − 1)/(3 + e^J)²`, ≥ 0 iff J ≥ 0; `∂²(−H)/∂φ_x∂φ_y = J_{xy}` | sound; ferromagnetism needed, evenness not |
| 3.4 switching | 2 sites, A = B = {x, y} | `Σ_{even} = cosh J = Z`, `Σ_{odd} = sinh J`; `sinh² J = cosh² J − 1` | sound |
| 3.5 inequalities | ρ_I; `ρ_{λ,0}`; chain; block reduction | `1 ≤ 3`; `0.25 ≤ 3·0.33799² = 0.3427`; `t² ≤ Jt`; `Σ q_nq_m` of the Ising Simon–Lieb with `J̃ = J_{uv}q_kq_l` gives `Σ_{u,v} ⟨φ₀φ_u⟩_Λ J_{uv} ⟨φ_vφ_y⟩` | sound |
| 3.6 reflection | coefficients; chain R(x) = 3 − x | `J_{xy}(ss + tt)/2 + J_{x,Ry}(ss − tt)/2`; half-integer plane forces y = x, integer and diagonal planes give distance ≥ 2, so `J_{x,Ry} = 0`; `t ≥ t²`, `1 ≥ t³` | sound |
| 3.7 identity and bound | F = φ_x; b = J = 0; ε = ¼, a = 2 | `1 = 4λ⟨φ⁴⟩ − 2b⟨φ²⟩ − ΣJ⟨φ_xφ_y⟩`; `4λm² − (2b₊ + ‖J‖)m − 1 ≤ 0`; `M = 1/(2√λ) ≥ 0.338/√λ`; `0.75 + 0.25·3.7622 = 1.6905 > 1.6487` | sound |
| 4.3 susceptibility | d = 1 Ising, J = ¼, 1 | `max χ_R ≤ 1 + 2dJ max χ_R`; `(1 + t)/(1 − t) = e^{2J}`: 1.649 ≤ 2; 7.389 with no bound claimed | sound |
| 5.3 Gaussian domination | L = 1, Ising | `−4J + e^{−4J}(32J² − 4J) ≤ 0`; max of `e^{−4J}(8J − 1)` at J = 3/8 is 0.446 | sound |
| 5.4 infrared bound | h = e^{ip·x}; L = 1; Gaussian torus | `J E²\|T\|Ŝ ≤ E\|T\|`; `4J(1 − tanh 2J)` ≤ 0.557; `Ŝ = 1/(2(\|b\| − dJ) + JE)`, `EŜ ↑ 1/J`; printed constant fails: 1.46 > 0.667 at J = 0.375 | sound |
| 5.5 long-range order | sum rule; d = 3 | `⟨φ₀²⟩ ≤ \|T\|⁻¹Ŝ(0) + (J\|T\|)⁻¹Σ_{p≠0}1/E(p)`; `(1/(2J))∫_{[0,1]^d}dt/Σ(1 − cos πt_j) = I_d/J`; `I_3 = W/2 = 0.2527 = 1.516/6` | sound |
| 6.1 random field | `T_f = \|∫f\|`; T ≡ 0 | `T_{−f} = T_f ≠ −T_f`; zero field linear | sound |
| 6.2 Schwinger functions | `h = e^{−\|x\|²}`; h ≡ 1 | `\|x − y\|² ≤ 2\|x\|² + 2\|y\|²`; S₂ ≡ 1 fails (1.10) | sound |
| 6.3 Gaussian processes | `[[1, 2], [2, 1]]` | Var(X₁ − X₂) = 1 − 4 + 1 = −2 | sound; semidefiniteness needed |
| 7.1 rescaled field | tent at 3, R = 4L; chain L = R = 1; quarter-turn | `1 + 2Σ_{j≤L}(1 − j/L)² = (2L² + 1)/(3L)`, ratio → 1/3 = ½∫f²; `3 + 4t + 2t²`; `Σ_x f(gx/L)φ_x = Σ_y f(y/L)φ_{g⁻¹y}` | sound |
| 7.2 reachability | ρ_I, J = 0; `tanh J_n = e^{−c/L_n}`; γ_b | white noise `2^{−d}∫fg`; `⟨σ₀σ_x⟩ = e^{−c\|x\|/L}`, Σ_L ≈ L²κ, field bounded by `κ^{−1/2}∫\|f\|`; `2\|b\| ≥ 2dJ_n` > spectral radius | sound |
| 7.3 structure | Bernoulli {0, 1}; diluted ρ_n | `Σ_L = N/4 + N²/4`, mean → `2^{−d}∫f`; site variance `2 − p_n`, lattice variance → `2^{−d}∫f²`, limit variance `2^{−d−1}∫f²` | sound |
| 7.4 free field | d = 1; scaling; massless kernel | `C_m(1_Q, 1_Q) = 2/m² − (1 − e^{−2m})/m³`, `1 + e^{−2}` at m = 1, ≈ 2/m as m → 0; `2\|b_n\| − A = μ² − Δ` with μ = m/L; `4sin²(θ/2) ≥ 4θ²/π²` on \|θ\| ≤ π; `1/((d − 2)\|S^{d−1}\|) = Γ(d/2 − 1)/(4π^{d/2})`, which is 1/(4π) at d = 3 | sound |

**Seeded source sample.** All fifteen targets checked against the cached texts.

| Target | Lines read | Outcome |
|---|---|---|
| 1.1 | `aizenman-duminilcopin-2021 lines 139–147`; `sokal-1982 lines 392–400` | (1.11)–(1.12), unordered pairs, sign +bφ²; finite volume with free boundary conditions |
| 1.2 | `aizenman-duminilcopin-2021 line 230`; `sokal-1982 lines 405–409` | (1.17); symmetry property (b) of the limit state |
| 1.4 | `aizenman-duminilcopin-2021 lines 1982–1985`, `2019–2022` | passage to weak limits asserted, not proved; the README says so |
| 1.5 | `sokal-1982 lines 394–396`; `frohlich-1982 lines 266–269`; `simon-2020-twelve-tales lines 960–975` | footnote on free and Dirichlet conditions; free lattice field at λ = 0; (3.8) |
| 2.1 | `aizenman-duminilcopin-2021 lines 363–373`, `377–382`, `387–388`, `392–410`, `2023–2031`; `lebowitz-ruelle-speer-2012 lines 62–69`, `217–222`; `sokal-1982 lines 428–433`; `simon-2020-twelve-tales lines 1011–1018` | Definition 2.1(1) with real coefficients; Figure 1; Lee–Yang property named; sampling weights; theorem in fugacity form; Lemma 2.4; item (i); Griffiths' trick |
| 2.2 | `aizenman-duminilcopin-2021 lines 374–386` | Definition 2.1(2) and (2.2): growth asked of the limit |
| 2.3 | `aizenman-duminilcopin-2021 lines 392–406`; `simon-2020-twelve-tales lines 1019–1030` | block averages with mean-field inner coupling, g_N → 1; second-order de Moivre–Laplace |
| 3.3 | `sokal-1982 line 423`; `simon-2020-twelve-tales lines 977–984` | item (h), (2.25); FKG for continuous spins |
| 3.5 | `aizenman-duminilcopin-2021 lines 520`, `1314`, `1342`, `1996–2002`; `sokal-1982 lines 419–422`; `frohlich-1982 line 109` | (3.11); Lemma 5.7; footnote 5; site-splitting; items (f), (g); Lebowitz inequality |
| 5.5 | `peled-spinka-2017 lines 1207–1222`, `1741`, `1766`; `simon-2020-twelve-tales lines 1502–1523` | Theorem 2.13; (52); (53); (5.15)–(5.18) |
| 6.1 | `aizenman-duminilcopin-2021 lines 56`, `183–187` | (1.4); footnote 2 |
| 6.2 | `aizenman-duminilcopin-2021 lines 59–76`, `126` | (1.5)–(1.6); (1.10) |
| 6.3 | `aizenman-duminilcopin-2021 lines 77–89` | Gaussian fields and (1.7) |
| 7.1 | `aizenman-duminilcopin-2021 lines 157–166` | (1.14)–(1.15) |
| 7.2 | `aizenman-duminilcopin-2021 lines 167–179`, `183–187` | Definition 1.1: volume limit first, then scale, along subsequences |

Also read: `aizenman-duminilcopin-2021 lines 1017–1049`, `1058–1091` ((5.1)–(5.10), for 3.6, 4.3, 4.4, 5.1, 5.4); `sokal-1982 lines 455–466`, `620–626`, `710–721`, `846–853`; `duminilcopin-2017-lectures line 549`.

**Duplication and ownership.** `roadmaps grep` over main and the 475 open heads: Lee–Yang, switching lemma, random current and white noise match nowhere; FKG matches only a Stacks tag; "Ising" matches only substrings of other words in arithmetic roadmaps; "Gibbs measure" matches ClassicalErgodicTheory §8.6 (Gibbs measures of Hölder potentials on shift spaces, a different object) and a scope sentence of PDE; "infrared bound" and reflection positivity match RelativisticQuantumFieldTheory (continuum Schwinger functions); "Gaussian process" matches StochasticCalculus Layer 1 (Brownian motion) and two statistics roadmaps (Brownian bridges and limits), none stating existence for an arbitrary positive semidefinite kernel. This roadmap is the owner of the lattice objects, of the Lee–Yang theorem and of the kernel-indexed Gaussian process. `ConstructiveFieldTheoryPhi4PartII` exists nowhere; it is named only as a consumer. Ownership against the open pull requests was checked through the roadmaps tool at the heads of the index.

The overlap report lists no changing pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations resolved now:

- StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`): its last sentence states the extension for any indexed family of standard Borel spaces with consistent finite-product laws, with uniqueness. Matches the contract.
- StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, mixed moments at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `Suggested.lean:110` `hadamard_of_orderLE_one`, `:73` `OrderLE`). Line 47 of the merge order.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder; line 214 of the merge order): heat-integral kernel, Mathlib-normalised multiplier `(4π²‖ξ‖² + m²)⁻¹`, exterior decay for 0 < c < m, massless kernel `|x|^{2−n}/((n − 2)|S^{n−1}|)`, equal to the README's constant (table, 7.4). It does not cite this roadmap.
- Scope deferrals: PDE, Scope and ownership (`TauCetiRoadmap/PDE/README.md:104–108`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`) exist as cited.

Every `*Needs:*` item is a target here, a resolved supplier section or a pinned declaration; no target needs a later one.

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, as the manifest of the content repository records. All 39 file-and-line citations of the supplier contracts were opened at the pins and each line carries the named declaration: 36 in Mathlib (from `Mathlib/MeasureTheory/Group/Measure.lean:310` to `Mathlib/Probability/Distributions/Gaussian/Real.lean:503`) and 3 in Tau Ceti (`TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`, `TauCeti/Probability/Moments/Determinacy.lean:246`, `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`). `ProbabilityTheory.gaussianReal` is at `Mathlib/Probability/Distributions/Gaussian/Real.lean:220`, with variance in `ℝ≥0`.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API list and at least three Checks; every theorem a locator or the roadmap's own derivation with its route. The layer order is forced: 1 needs 0; 2 needs 1 (1.1, 1.2, 1.4); 3 needs 2 (3.5); 4 needs 3; 5 needs only 0–1; 6 needs only suppliers; 7 needs 1, 3.2 and 6. No layer is named after a source chapter and no sentence says the plan follows a source. No LaTeX delimiters, job ids, pull-request numbers, paths or dates; "lemma" occurs only in the names Ginibre's lemma, switching lemma and Fatou's lemma. No backticked name is presented as a Lean declaration of this roadmap.

**Headlines.** The Lee–Yang theorem and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity, uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Their statement in `Suggested.lean` is the package stage's work.

**Copyright.** Wording compared at every locator of the sample and at five further passages (the Asano route of 2.1 against `lebowitz-ruelle-speer-2012 lines 217–222`; the transfer of 2.2 against `aizenman-duminilcopin-2021 lines 2019–2027`; 4.2 against `sokal-1982 lines 405–411`; 3.6 against `aizenman-duminilcopin-2021 lines 1023–1038`; 7.3 against `sokal-1982 lines 710–721`): no shared run beyond formulas and standard names. Arrangement: the most cited source has sections 1 (introduction and main result), 2 (the class), 3 (current intersections), 4 (intersection clusters), 5 (regularity of the two-point function), 6 (proofs), 7 (extension to the class). The roadmap places that source's §1 material last (Layers 6–7), draws Layer 3 from its §3.1, §5.1 and §7 together, Layer 5 from part of §5.2 and from another source, and has no counterpart of §4 and §6. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 20 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 45 of 113 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.19)–(2.30) and those of Section 3.1: the extraction drops displayed formulas; the surrounding sentences were read and the formulas recomputed.
- The Riemann-sum limit of 5.4 for the singular integrand `1/E(p)` in d ≥ 3 and the dominated-convergence step of 7.4 were checked for scaling, constants and the dominating bound, not written out in full.

## Source issues

- **Gap** in aizenman-duminilcopin-2021 at Section 7, opening paragraph and the paragraph after Proposition 7.2, preprint pp. 44–45: the source says Ising-block results pass to weak limits with the growth condition by continuity; it should supply tail control of the approximants, for instance from the Lee–Yang property; affects the proof.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the displayed symbol; affects a stated result.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators, and each statement citing them also has a locator in a text that was read or the roadmap's own derivation.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), an OCR scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:732–756` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "508d0cbb40302d832bf2f05632b6b71b246b7016", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~7", "model": "fable", "worker": "chris-x81"} -->
