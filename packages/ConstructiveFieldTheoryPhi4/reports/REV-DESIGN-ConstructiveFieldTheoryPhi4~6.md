<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6894952589 -->
Review (claude) of ae06901

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `*Needs:*` lines that cover several targets with different needs

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:242`: "*Needs:* 0.2; 1.1; 1.2; Mathlib `Complex.norm_le_of_forall_mem_frontier_norm_le`; ZerosOfLFunctions §5.5." Same pattern at `:395` (3.7): "*Needs:* 0.2; 1.1; 1.2; 2.3; 3.5."

   **Claim.** Each line is the need of every target of its section.

   **Witness.** In 2.1 the definition, the block-spin representation and the Lee–Yang theorem use neither the maximum modulus principle nor ZerosOfLFunctions §5.5 (only the Lee–Yang property does), yet 3.5 lists 2.1 for the block-spin representation alone. In 3.7 the integration-by-parts identity and the bound `M(λ, b, ‖J‖)` use neither 2.3 nor 3.5 (only Newman's bound does). Line `:267` already itemises: "2.1 (the Lee–Yang property)". `design/plan.json`, target 2.1, lists `mathlib:MeasureTheory.Measure.map` and no `target:1.2`; the README line lists 1.2 and no `Measure.map`.

   **Exact repair.** At `:242`: "*Needs:* 0.2; 1.1; 1.2; Mathlib `MeasureTheory.Measure.map`; for the Lee–Yang property only, Mathlib `Complex.norm_le_of_forall_mem_frontier_norm_le` and ZerosOfLFunctions §5.5." At `:395`: "*Needs:* 0.2; 1.1; 1.2; for Newman's bound only, 2.3 and 3.5." Tested on the witness: an implementer of the block-spin representation (consumed by 3.5) or of the φ⁴ identity (consumed by 4.2 through the uniform bound) is then blocked by no unrelated supplier. The Layer 2 and Layer 3 Dependencies stay as they are (they already contain every name).

One finding, P3, with an exact repair (R01); a repair of any priority asks for changes. No P1 or P2. The three findings of round 5 are repaired; the passages the repair added (the Lee–Yang theorem, the Lee–Yang property of block laws, the tail control and the restated transfer) were recomputed step by step and hold. The design files and the source manifest were left unchanged. Elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so no Lean command was run.

## Previous findings, checked first

| Round-5 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P2) transfer without a route | `design/README.md:232` "Prove the Lee–Yang theorem: for a finite set V, a ferromagnetic coupling J on V and complex fields h ∈ ℂ^V with Re h_x > 0 … is not zero"; `:240` "Lee–Yang property: … E(h) ≠ 0 whenever Re h ≠ 0 … `E(h) = Π_j (1 + h²/a_j²)`"; `:264` "Tail control: … then `sup_k ∫ e^{cφ²} dη_k < ∞` for every real c"; `:265` "every sequence of Ising-block measures η_k converging weakly to ρ, every finite set V, every coupling J"; Scope `:20` "Lee–Yang theory beyond the theorem of 2.1". Plan 2.1 and 2.2 carry the same statements; supplier ZerosOfLFunctions §5.5 added. | **Repaired.** Applied by a different route in step (d) (a direct bound instead of weak compactness) and for every coupling; both recomputed below and correct. |
| F02 (P3) shrinking-blocks Check | `:275` "Their exponential α-moments are not controlled by those of the limit … Their quadratic exponential moments, which 1.4 uses, are controlled: … `≤ (1 − 2c/log²N)^{−1/2}`" | **Repaired.** N = 1000, c = 1: log²N = 47.717, value 1.02164. |
| F03 (P3) Layer 0 Dependencies | `:145` now lists `ProbabilityTheory.integrableExpSet` and `MeasureTheory.Integrable.mono'` | **Repaired.** |

Pattern sweep. "suitable", "one sequence", "simultaneous", "by continuity": the only remaining occurrence is `:265`, which attributes the phrase to the source. Every layer's `*Needs:*` names were compared with its Dependencies: none missing. The repair's pattern (a `*Needs:*` line updated for one target of a section) is what R01 records.

## Verified sound

**Coverage.** All 773 README lines read; `plan.json` parsed (8 layers, 36 targets, `gaps: []`, four suppliers; entries 2.1 and 2.2 compared with the README sentence by sentence); the 14-entry manifest; the round-5 review and its repair report; the overlap and citation leads; the package index. The repair touched README lines 3, 7, 13, 20, 60–63, 81–83, 91, 145, 196, 232, 240, 242, 250–253, 264–265, 267, 271–272, 275–276, 296, 734 and 766 (read from the diff of the two heads); everything else is the text the round-5 table computed on. No maintainer notes and no declared gaps exist.

**Principles.** No route-specific shortcut (the Lee–Yang theorem is stated with site-dependent complex fields and general ferromagnetic couplings, the transfer for every approximating sequence and every coupling), no re-planned roadmap (Hadamard factorisation is imported, not restated), no upward supply, no algorithm, no copied passage, no `set_option`, no sorry'd data.

**Adversarial table.** Values computed by hand this round. `t = tanh J`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.1 Lee–Yang theorem | V = ∅; one site; two sites, equal fields, J ≥ 0 and J = −(ln 2)/2; a = 1 | `Z = 2^{−\|V\|} e^{Σh} e^{ΣJ} P(z)`, `z = e^{−2h}`, so Re h > 0 iff \|z\| < 1; P = 1; P = 1 + z; `½(e^J cosh 2h + e^{−J})`, zero needs `cosh 2h = −e^{−2J} ∈ [−1, 0)`: with 2h = x + iy, sinh x sin y = 0 and cosh x \|cos y\| ≤ 1 force x = 0; J = −(ln 2)/2: cosh 2h = −2, h = ±½·1.31696 + iπ/2 = ±0.658 + 1.571i | sound; strictness and ferromagnetism both needed |
| 2.1 pair polynomial, contraction | a ∈ (0, 1]; z₁ = −a | `\|1 + az₁\|² − \|a + z₁\|² = (1 − a²)(1 − \|z₁\|²)`; at z₁ = −a the value is 1 − a² ≠ 0 for a < 1, and a = 1 puts z₁ on the circle; contracting all copies of each site in `Π_{pairs}(1 + a z + a z′ + z z′)` keeps the terms with all or no copies and gives `Σ_A Π_{x∈A} z_x Π_{x∈A,y∉A} a_xy`; `−K·K = {\|z\| ≥ 1}` for K the closed exterior | sound |
| 2.1 Lee–Yang property | δ₀; ρ_I; uniform on {−1, 0, 1}; q = (1, −1), K = (ln 3)/2; q = (1, 0) | E ≡ 1, empty product; `Σ((k+½)π)⁻² = (4/π²)(π²/8) = ½`, `Σ((k+½)π)⁻⁴ = (16/π⁴)(π⁴/96) = 1/6`, κ₄ = 1 − 3 = −2 = −12/6; zeros `i(±2π/3 + 2πk)`, `(2π)⁻²·π²/sin²(π/3) = 1/3 = ½·(2/3)`; ε = ¼, `E = (3 + cosh 2h)/4`, zero at ±0.881 + 1.571i, κ₄ = 4 − 3 = +1; with a zero weight, `\|E_ε\| ≥ m/2` on a circle and `1/E_ε` analytic give `\|E_ε(h₀)\| ≥ m/2`, against E_ε(h₀) → 0 | sound; mixed signs fail, as a non-member must |
| 2.1 Hadamard input | `\|E(h)\| ≤ e^{\|h\|Σq}`; E(0) = 1; E even | `e^{c\|h\|} ≤ e^{\|h\|^{A′}}` for large \|h\| and A′ > 1, so `OrderLE E 1`; e^a = 1; `(1 − h/(ia))(1 + h/(ia)) = 1 + h²/a²` with the exponential factors cancelling; evenness gives b = 0; h² coefficient `Σa⁻² = E″(0)/2`; `log E = Σ(h²/a² − h⁴/(2a⁴) + …)` against `κ₂h²/2 + κ₄h⁴/24` gives κ₄ = −12Σa⁻⁴ | sound |
| 2.2 tail control (a)–(f) | σ = 0; CLT blocks; X_N; mixtures | (a) `(σ²/2)² ≤ ∫φ⁴ · P ≤ 3σ⁴P`, P ≥ 1/12, and σ = 0 is δ₀; (b) `E_k(2h) ≤ e^{2h²S}` gives uniform integrability; (c) `\|hφ\| ≤ \|φ\|^α/α + \|h\|^{α′}/α′`; (d) for x ≤ θ, `log(1 + x/θ) ≥ (x/θ) log 2`, so `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`, limsup `≤ (θ log C + θ^{1−α′/2})/log 2 → 0`; (e) count ≤ (S/2)/θ, each ≤ S/2; (f) `E_g e^{√(2c)gφ} = e^{cφ²}`, `2c g² s_k < g²/4`, `E e^{g²/4} = √2`. CLT blocks: largest x is `4/(π²N)`, s_N(θ) = ½ for N ≥ 4/(π²θ), and `∫e^{φ²/2}dη_N → ∞` | sound; growth and block structure both needed |
| 2.2 transfer | V = ∅; J = 0; `½(δ_{−s_k} + δ_{s_k})`; X_N on two sites | Z = 1; products; `s_k² tanh(Js_k²) → s² tanh(Js²)`, 0 at s = 0; `1 ≤ Z(η_N) ≤ (∫e^{Jφ²/2}dη_N)² ≤ (1 − J/log²N)⁻¹` | sound; 1.4 holds for every coupling |
| 2.2 Checks | mixture; X_N | `∫φ^{2n} = 1 − 1/k + (2n−1)!!/k ≤ (2n−1)!!`, Z = ∞ at J ≥ 1 from the `k⁻²` Gaussian product term, order 2; variance `N/(N log²N)`, α-moment ≥ `2^{1−N} exp((√N/log N)^α)`, zeros of multiplicity N give `N·½/(N log²N)` | sound |
| 0.2 | k = 1, 2; b = 2λ | `λ^{−k/2}Γ((2k+1)/4)/Γ(¼)`: 0.338/√λ and 1/(4λ); `−λφ⁴ + 2λφ² = −λ(φ² − 1)² + λ` | sound |
| 1.1 | two and three Ising sites; N(0,1), J = 1 | cosh J, tanh J; `(e^{3J} + 3e^{−J})/4`; form `½(x² + y²) − xy` degenerate, Z = ∞ | sound |
| 1.5 | two sites; d = 1; box at μ = 0 | det 4b² − J², entries `2\|b\|/(4b² − J²)`, `J/(4b² − J²)`; `(2π)⁻¹·2π/√((2+μ²)² − 4) = 1/(μ√(4+μ²))`; spectral radius of A_R below 2d on a finite box | sound |
| 3.1 | two sites; `(2δ₋₁ + δ₁)/3`; J < 0 | tanh J, 1 − tanh²J; −1/3; tanh J < 0 | sound |
| 3.4 | two sites, A = B = {x, y}; J = 0 | cosh J, sinh J; sinh² = cosh² − 1; Z_D = 0 with identity 0 = 0 | sound |
| 3.5 | ρ_I; ρ_{λ,0}; ε = ¼; chain | 1 ≤ 3; 0.25 ≤ 3·0.33799² = 0.3427; ¼ > 3/16; t² ≤ J t | sound |
| 3.7 | F = φ_x; b = 0 = J; ε = ¼, a = 2 | `1 = 4λ⟨φ⁴⟩ − 2b⟨φ²⟩ − ΣJ⟨φ_xφ_y⟩`; `4λm² − (2b₊ + ‖J‖)m − 1 ≤ 0`; M = 1/(2√λ) ≥ 0.338/√λ; `Σ t^{2n}(2n−1)!!/(2n)! = e^{t²/2}`; 0.75 + 0.25·3.7622 = 1.6905 > 1.6487 | sound |
| 4.1, 4.2 | open chain; J = 0; d = 1 | `tanh^{\|x\|}J` for R ≥ \|x\|; product moments; 2p − 1 = tanh J for p = (1 + tanh J)/2 | sound |
| 5.3 | L = 1 Ising | exponent `−J(Δφ + u)²`, Δφ ∈ {0, 0, 2, −2}; Z″(0) = `−4J + e^{−4J}(32J² − 4J)`; max of `e^{−4J}(8J − 1)` at J = 3/8 is 0.446 | sound |
| 5.5 | d = 3; Ising sum rule | `I_d = ½∫_{[0,1]^d} dt/Σ(1 − cos πt_j)`, equal to Peled–Spinka's `n/(2β)` constant at n = 1; W/2 = 0.2527 = 1.516/6; `1 = \|T\|⁻¹Ŝ(0) + \|T\|⁻¹Σ_{p≠0}Ŝ(p) ≤ ⟨m²⟩ + (J\|T\|)⁻¹Σ 1/E(p)` | sound |
| 6.2, 6.3 | h = e^{−\|x\|²}; K = [[1,2],[2,1]] | `\|x − y\|² ≤ 2\|x\|² + 2\|y\|²`; Var(X₁ − X₂) = −2 | sound |
| 7.3 | Bernoulli {0, 1} | Σ_L = n/4 + n²/4, mean → 2^{−d}∫f, variance → 0 | sound |

**Seeded source sample.** All fifteen targets checked against the cached texts, plus every locator the repair added.

| Target | Lines read | Outcome |
|---|---|---|
| 0.2 | `aizenman-duminilcopin-2021 lines 143–147`; `simon-2020-twelve-tales line 1021` | (1.12) with +bφ²; Simon's sign opposite, as the Conventions say |
| 1.1 | `aizenman-duminilcopin-2021 lines 139–147`; `sokal-1982 lines 392–400` | (1.11)–(1.12), sum over unordered pairs; finite volume with free boundary conditions |
| 1.5 | `sokal-1982 lines 394–396`; `frohlich-1982 lines 266–269`; `simon-2020-twelve-tales lines 960–975` | footnote on free and Dirichlet conditions; free lattice field at λ = 0; (3.8) |
| 2.1 | `aizenman-duminilcopin-2021 lines 363–373`, `387–388`, `2031`; `lebowitz-ruelle-speer-2012 lines 62–69`, `217–222`; `sokal-1982 lines 428–433`; `simon-2020-twelve-tales lines 1011–1018` | Definition 2.1(1) with real coefficients; Lee–Yang property of the construction named; sampling weights; the theorem in fugacity form for one variable, as the README says; Lemma 2.4 as used; item (i); Griffiths' trick |
| 2.2 | `aizenman-duminilcopin-2021 lines 374–386`, `1982–1985`, `2019–2022` | Definition 2.1(2), (2.2); passage to limits asserted without proof |
| 3.1 | `peled-spinka-2017 lines 334`, `515–526`, `535`; `sokal-1982 lines 414–415`; `simon-2020-twelve-tales lines 977–984` | Theorems 2.1, 2.3, Lemma 2.4; items (d), (e); GKS for continuous spins |
| 3.4, 3.5, 4.1, 5.3, 6.2, 7.3 | as in the round-5 table (same lines, unchanged text) | agree; spot-read again: `sokal-1982 lines 400–411`, `419–422` |
| 3.7 | `sokal-1982 lines 846–853`, `434–435` | integration by parts in finite volume (displays missing in the extraction); item (j) |
| 4.2 | `sokal-1982 lines 405–409`; `duminilcopin-2017-lectures line 549` | properties (a)–(b); Corollary 1.9 |
| 5.5 | `peled-spinka-2017 lines 1207–1222`, `1766`; `simon-2020-twelve-tales lines 1502–1523` | Theorem 2.13, (53); (5.15)–(5.18) |
| 6.3 | `aizenman-duminilcopin-2021 lines 77–89` | Gaussian fields and (1.7) |

No locator flagged unverified by the author exists in the design.

**Duplication and ownership.** `roadmaps grep` over main and the 475 open heads: "Lee.Yang|Asano" matches only authors' names in four arithmetic roadmaps; Griffiths inequalities, FKG, switching lemma, random current, Griffiths–Simon, Ising model, and Gaussian processes with a prescribed covariance match nowhere; reflection positivity matches RelativisticQuantumFieldTheory (the Osterwalder–Schrader axiom for continuum Schwinger distributions) and Completed/DenseGraphLimits (graph parameters), both different objects from the torus statement of 5.2. This roadmap is the owner of the Lee–Yang theorem and of the retained lattice objects. Hurwitz's theorem is stated by no roadmap and is used here only as an argument from a pinned declaration. The overlap report lists no changing pull request, no dropped id and no revision-only id. The package index lists AnalyticNumberTheory and LawrenceVenkateshMethod only.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved now:

- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`, "Hadamard's theorem at order at most one"; `Suggested.lean:110` `hadamard_of_orderLE_one`, hypotheses `Differentiable ℂ f`, `f 0 ≠ 0`, `OrderLE f 1`; `OrderLE` at `Suggested.lean:73`, for every A′ > A, `f =O[cobounded] exp ‖s‖^{A′}`). The README contract states exactly this. ZerosOfLFunctions is line 47 of the merge order; its open revision keeps the heading "### 5.5 Hadamard's theorem at order at most one", so the citation survives that merge.
- StochasticCalculus §1.1 on main (`README.md:879`); StandardDistributions §5.3, mixed moments (`README.md:605`); RelativisticQuantumFieldTheory §7.1 at its open head (heading at line 4475).

Every `*Needs:*` line was read; each item is a target here, a resolved supplier section or a pinned declaration (R01 concerns their granularity only).

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5 match the manifest. Opened this round: `Complex.norm_le_of_forall_mem_frontier_norm_le` (`Mathlib/Analysis/Complex/AbsMax.lean:404`, in `namespace Complex`, bounded U and `DiffContOnCl`), `MeasureTheory.isTightMeasureSet_of_isCompact_closure` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean:636`, complete second-countable metric space), `Real.young_inequality` (`Mathlib/Analysis/MeanInequalities.lean:547`, `a * b ≤ |a|^p/p + |b|^q/q` under `HolderConjugate`), `ProbabilityTheory.mgf_id_gaussianReal` (`Mathlib/Probability/Distributions/Gaussian/Real.lean:503`), `ProbabilityTheory.multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`; a non-positive-semidefinite S gives the Dirac measure, so the positive semidefiniteness of 6.3 is a real hypothesis). The other contract lines are unchanged text opened by rounds 4 and 5 at the same pins.

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API list and at least three Checks (2.1 has eight, 2.2 six); every theorem a locator. The layer order is forced by the dependency lines (0 → 1 → 2 → 3 → 4; 5 from 0–1; 6 from suppliers only; 7 from 1, 3.2, 6); no layer is named after a source chapter and no sentence says the plan follows a source. No LaTeX delimiters, job ids, pull-request numbers, paths or dates; "lemma" occurs only in the names Ginibre's lemma, switching lemma and Fatou's lemma. No backticked name is presented as a Lean declaration of this roadmap.

**Headlines and Lean.** Headline families: finite-volume Gibbs measures and Gaussian lattice fields (Layer 1); the Lee–Yang theorem, the Griffiths–Simon class, its transfer and the membership of φ⁴ (Layer 2); Griffiths, FKG, switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity, uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). The design has no `Suggested.lean`: nothing to probe for padding, no binders to compare.

**Copyright.** Wording compared at every locator of the sample and at six further passages (the 2.1 definition against `aizenman-duminilcopin-2021 lines 363–373`; the Lee–Yang route against `lebowitz-ruelle-speer-2012 lines 204–222`; the 2.3 route against `aizenman-duminilcopin-2021 lines 392–406`; Griffiths' trick against `simon-2020-twelve-tales lines 1011–1018`; the 3.2 route against `peled-spinka-2017 lines 519–532`; the 5.5 statement against `peled-spinka-2017 lines 1207–1222`): no shared run beyond formulas and standard names. Arrangement: the most cited source's sections are 1 (introduction, fields and the main result), 2 (the class), 3 (current intersections), 4 (intersection clusters), 5 (regularity of the two-point function), 6 (proofs), 7 (the class extension); the roadmap puts that source's §1 material last (Layers 6–7), draws Layer 3 from its §3.1, §5.1 and §7 together, and Layer 5 from part of §5.2 and from another source. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 21 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 37 of 102 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` (2.19)–(2.30) and the displays of Section 3.1: the extraction drops the displayed formulas; the surrounding sentences were read and the formulas recomputed.
- The Riemann-sum limit of 5.4 for the singular integrand `1/E(p)` in d ≥ 3 and the dominated-convergence step of 7.4 were checked for scaling and constants, not written out in full.

## Source issues

- **Gap** in aizenman-duminilcopin-2021 at Section 7, opening paragraph and the paragraph after Proposition 7.2, preprint pp. 44–45: the source says Ising-block results pass to weak limits with the growth condition by continuity; it should supply tail control of the approximants, for instance from the Lee–Yang property; affects the proof.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the displayed symbol; affects a stated result.
- **Misprint** in sokal-1982 at (2.24), printed p. 327: the source says the pair expectations are multiplied over all pairings; it should sum over pairings the products within each; affects a stated result.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators, and each statement citing them also has a locator in a text that was read or is the roadmap's own derivation.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), an OCR scan whose equation numbers may differ from the Nuclear Physics B version.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ae06901a023200ecc6d420954b7628d63126c346", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~6", "model": "fable", "worker": "chris-x83"} -->
