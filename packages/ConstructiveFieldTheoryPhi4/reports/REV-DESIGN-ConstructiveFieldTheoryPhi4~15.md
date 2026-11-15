<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6901880159 -->
Review (claude) of bc3d493

Verdict: accepted

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

Both round-14 findings are repaired, and this round found no new finding at any priority. No supplier gap is declared, so the acceptance is unconditional. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No maintainer notes exist for this roadmap. Nothing I read contained an instruction addressed to the reviewer.

## Previous findings, checked first

| Round-14 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) 3.6 had no negative control for evenness | `packages/ConstructiveFieldTheoryPhi4/design/README.md:390`: "Evenness is needed for general multi-indices: on V = {−1, 0, 1} with R(x) = −x, J = 0 and the non-even `ρ = (2δ₋₁ + δ₁)/3` …"; `design/plan.json` entry 3.6 has the test `evenness_needed` | **Repaired** |
| F02 (P3) the Sokal locator of 1.2 was for the infinite-volume state | `packages/ConstructiveFieldTheoryPhi4/design/README.md:172`: "Both invariances follow by changing variables in the integral that defines the finite-volume state (Aizenman–Duminil-Copin (1.11)–(1.12), p. 4, … (1.17), p. 5 …); Sokal, Section 2.2, property (b), p. 327, states the same invariances for the infinite-volume state of 4.2"; the plan locator of 1.2 matches | **Repaired** |

The repair also added "for the infinite-volume φ⁴ state" to the Sokal locators of 3.1, 3.3, 3.5 and 3.7 (README lines 302, 331, 363, 394). `sokal-1982 lines 402–412` introduce the limit measure before listing properties (d)–(k), so the qualifier is accurate. Each of those targets still has a finite-volume source or its own route.

Adversarial pass on the text the repair changed or added (values computed this round):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.6, new Check | V = {−1,0,1}, R(x) = −x, J = 0, `ρ = (2δ₋₁ + δ₁)/3`, A = 1_{1}, B = 1_{0,1} | mean −1/3, `∫φ² = 1`; `⟨φ₁²φ₀⟩ = 1·(−1/3) = −1/3`; `R(B) = 1_{−1,0}`, `⟨φ₁φ₋₁φ₀⟩ = (−1/3)³ = −1/27`; `−1/3 < −1/27` | Check correct |
| 3.6, hypotheses on that instance | V₊ = {1}, V₀ = {0} | `J_{Rx,Ry} = 0 = J_{xy}`; the condition over distinct x, y ∈ V₊ is empty; A, B supported in V₊ ∪ V₀ | only evenness fails |
| 3.6, flip remark | `H(−φ) = H(φ)`; `|A + R(B)| = |A| + |B|` | `⟨φ_C⟩_{ρ⁻} = (−1)^{|C|}⟨φ_C⟩_ρ`; odd degree: X ≥ Y for ρ iff X ≤ Y for ρ⁻; `ρ⁻ = (δ₋₁ + 2δ₁)/3` gives `1/3 > 1/27`; ρ_I gives 0 = 0 | correct |
| 3.6, proof route with even ρ | pairs in V₊; x ∈ V₊, z ∈ V₀; crossing term | `φ_xφ_y + φ_{Rx}φ_{Ry} = ½(s_xs_y + t_xt_y)`, `φ_xφ_{Ry} + φ_{Rx}φ_y = ½(s_xs_y − t_xt_y)`; `J_{xz}s_xφ_z`; `φ_xφ_{Rx} = ¼(s_x² − t_x²)`; `φ_{R(B)} = Π((s − t)/2)^{B(x)} Π φ_z^{B(z)}` | route sound |
| 1.2, change of variables | φ ↦ φ∘g with `J_{gx,gy} = J_{xy}`; φ ↦ −φ, ρ even | `H(φ∘g) = H(φ)`; `H(−φ) = H(φ)`; `ρ^{⊗V}` invariant under both | holds in finite volume |
| 3.1, 3.3, 3.5, 3.7 locators | `sokal-1982 lines 412–435` | (d) Griffiths, (f)–(g) Lebowitz and Gaussian, (h) FKG, (j) Newman, all for the limit measure | qualifier accurate |

Pattern sweep. A Check missing for a stated hypothesis: every target that assumes evenness has a non-even control (1.2, 3.1, 3.2, 3.6, 7.3). A finite-volume claim resting on an infinite-volume locator alone: none found in the remaining Sokal citations (3.2 cites the sentence on finite-volume monotonicity, `sokal-1982 lines 402–405`; 3.6 cites the Remark on finite boxes, `lines 455–466`; 4.1, 4.2 and 4.3 are infinite-volume statements).

## Verified sound

**Coverage.** All 779 lines of the README were read. `design/plan.json` parses: 8 layers, 36 targets (38 entries with the sub-entries 0.2.1 and 7.4.1), 4 suppliers, 1 consumer, `gaps: []`. No prerequisite names a later target, and every entry has at least 3 tests. The author flagged no locator as unverified.

**Principles.** No route-specific shortcut: Lee–Yang is stated for site-dependent complex fields and every ferromagnetic coupling, FKG without evenness, Gaussian processes on an arbitrary index type, and the moment bounds for every coupling. No roadmap is planned again, supply runs one way, there is no algorithm and no copied passage. There is no Lean file, hence no `set_option` and no sorry'd data.

**Adversarial table: the fifteen sampled targets and the headlines.** Every value was computed this round.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, Hamiltonian | two Ising sites; Gaussian torus field | `Z = cosh J`, `tanh J`; `exp(JΣΣφφ + bΣφ²) = exp(−½[J(φ,−Δφ) + 2(|b| − dJ)|φ|²])`, `Ŝ(p) = 1/(JE(p) + 2(|b| − dJ))` | sound |
| 0.1 | N(0,1); two sites J ≥ 1; `(2δ₋₁ + δ₁)/3`; Vitali indicator | `∫e^{cφ²}dN(0,1) < ∞` iff c < ½; form `½(φ_x² + φ_y²) − Jφ_xφ_y` not positive definite; mean −1/3; not a.e. measurable | sound |
| 0.2 moments, scaling, hard limit | u = λφ⁴; φ ↦ sφ; b = 2λ | `2·¼λ^{−(2k+1)/4}Γ((2k+1)/4)`; k = 2: `Γ(5/4)/(λΓ(1/4)) = 1/(4λ)`; `Γ(3/4)/Γ(1/4) = 0.33799`; density of sφ `∝ exp(−λs⁻⁴ψ⁴ + bs⁻²ψ²)`; `−λφ⁴ + 2λφ² = −λ(φ² − 1)² + λ`; tail `√λ e^{−(9/16)λφ⁴}` for |φ| ≥ 2 | sound |
| 1.1 stability; three Ising sites | any coupling; all pairs J | `−H ≤ ½Σ_{x≠y}|J_{xy}|(φ_x² + φ_y²)/2 ≤ ½‖J‖Σφ_x²`; `Z = (2e^{3J} + 6e^{−J})/8`; numerator `2e^{3J} + 2e^{−J} − 4e^{−J}` | sound |
| 1.2 | chain {0,1,2}; `(δ₀ + δ₁)/2` | `tanh J`, `tanh² J`; mean ½ | sound |
| 1.3 | two Ising sites; J = 0 even ρ; diagonal | `d/dJ tanh J = 1 − tanh² J`; `⟨φ_x²φ_y²⟩ − 0 = (∫φ²)²`; with a diagonal term `½J_{xx}φ_x²` the derivative is `½⟨F ; φ_x²⟩` | sound |
| 2.1 Lee–Yang (headline) | pair polynomial; a = 1; contraction | `|1 + az|² − |a + z|² = (1 − a²)(1 − |z|²)`; `(1 + z₁)(1 + z₂)`; contraction of the pair product keeps `Π_{x∈A}z_x Π_{x∈A,y∉A}a_{xy}`; `−K·K = {|z| ≥ 1}` | sound |
| 2.1 block-spin representation | ρ = ρ_{N,K,q} | pull-back weight `Π_x e^{−H_K(σ_x)} · exp(ΣJ_{xy}(Σq_nσ_{x,n})(Σq_mσ_{y,m}))`, so `J̃ = J_{xy}q_nq_m ≥ 0` | sound |
| 2.1 product formula and cumulant | ρ_I; uniform on {−1,0,1}; q = (1, −1) | `Σ((k+½)π)⁻² = ½`, `Σ((k+½)π)⁻⁴ = 1/6`, cumulant `−2`; zeros `2πi(n + 1/3)`, `(2π)⁻²π²/sin²(π/3) = 1/3`; `ε = 1/(1 + e^{2K})`, `16ε > 48ε²` iff ε < 1/3; `cosh 2h = −3` at `±0.881 + 1.571i` | sound |
| 2.1 Checks | Griffiths' trick; two sites, equal fields | `¼e^K = ½e^{−K}` iff `e^{2K} = 2`; `Z = ½(e^J cosh 2h + e^{−J})`; `cosh 2h = −2` at `±½ln(2 + √3) + iπ/2 = ±0.658 + 1.571i` | sound |
| 2.2 tail control (headline) | steps (a), (d), (e), (f) | `P ≥ (σ²/2)²/(3σ⁴) = 1/12`; `log(1 + u) ≥ u log 2` on [0,1]; `θ log C + θ^{1−α′/2} → 0`; at most `S/(2θ)` large terms; `e^{2cg²s} ≤ e^{g²/4}` for `s < 1/(8c)` | sound |
| 2.3 (headline) | exponent at `m = φN^{−1/4}/c` | `(g_N − 1)Nm²/2 = bφ²`, `Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴`; `N(½)⁴/12 = N/192` | sound |
| 3.1 | duplication; Ginibre's lemma | `H(φ) + H(φ′) = −¼Σ_{x≠y}J_{xy}(s_xs_y + t_xt_y)`; integrand odd under x ↔ y for n odd, odd under negation for m + n odd | sound |
| 3.2 | chain; `(2δ₋₁ + δ₁)/3` with an added site | `tanh J₀₁ tanh J₁₂`; `⟨φ₀⟩ = −3e^J/(5e^J + 4e^{−J})`: −1/3 at J = 0, → −3/5 | sound |
| 3.3 | lattice gas on two sites; two Ising sites | weights 1, 1, 1, `e^J`; covariance `(e^J − 1)/(3 + e^J)²`; `−tanh J ≤ 0` | sound |
| 3.4 (headline) | two sites, A = B = {x,y}, F ≡ 1; J = 0 | normalised `Z⟨σ_A⟩ = Σ_{∂n=A}w(n)` (the `2^{−|V|}` cancels the spin sum); left `sinh² J`, right `cosh² J − 1`; `Z_D = sinh 0 = 0`; `Σ_n w = Πe^{J_{xy}}` | sound |
| 3.5 (touched by the repair) | chain, Λ = {0}; repeated sites; block Simon–Lieb | `tanh² J ≤ J tanh J`; `1 ≤ 1 + 2tanh² J`; multiplying the Ising inequality on V × Fin N by `q_nq_m` and summing gives the φ form with `J_{uv}` | sound |
| 3.6 lattice hypotheses | `x_i = a`, a half-integer or integer; `x_i − x_j = a`, `x_i + x_j = a` | neighbours x, Ry across the plane force y = x, or differ by ≥ 2; `u = x_i ∓ x_j − a` differs by ≥ 2 across the plane while a step changes it by ≤ 1; both diagonal reflections preserve ℤ^d | sound |
| 3.7 | maximal site; one-site Checks; ε = ¼, a = 2; z = (1, −1), J = 1 | `4λm² ≤ 1 + (2b₊ + ‖J‖)m`, `M(λ,0,0) = 1/(2√λ)`; `1 − 0.338 = 0.662`; `∫|cos t|/t dt = ∞`; `0.75 + 0.25·3.7622 = 1.6905 > 1.6487`; `1.3293`, `e^{0.2384} = 1.269`, `e^{1.7616} = 5.822` | sound |
| 4.2 | other exhaustions; d = 1 Ising; Gaussian class member | `⟨e^{a|φ_x|}⟩_W ≤ 2⟨cosh aφ_x⟩_{V_R}` for W ⊆ V_R; `P(σ_{x+1} = σ_x) = e^J/(e^J + e^{−J}) = (1 + tanh J)/2`; `⟨e^{a|φ|}⟩ ≤ 2e^{a²⟨φ²⟩/2}` | sound |
| 4.3 | d = 1; Λ = {0} | `Σt^{|x|} = (1 + t)/(1 − t) = e^{2J}`; `χ ≤ 1 + 2dJχ`, `e^{1/2} = 1.649 ≤ 2` | sound |
| 5.1, 5.5 (headline) | L = 1; L ≥ 2; d = 3 | pair {x, x+e_j} counted twice at L = 1, coupling 2J; `(t + t³)/(1 + t⁴)`; `1 ≤ |T|⁻¹Ŝ(0) + J⁻¹|T|⁻¹Σ_{p≠0}1/E(p)`; `I₃ = W/2 = 0.2527`, `G(0) = 3W = 1.516` | sound |
| 6.2, 6.3 (headline) | deterministic field; `K = [[1,2],[2,1]]` | `|x − y|² ≤ 2|x|² + 2|y|²`; `Var(X₁ − X₂) = −2` | sound |
| 7.1 | W_d direction; tent; three-site chain; Σ = 0 | `g⁻¹e₁ = −e₂`, `T_{f∘g}(φ) = φ_{−e₂}`; `1 + (L−1)(2L−1)/(3L) = (2L² + 1)/(3L)`, `½∫f² = 1/3`; `3 + 4t + 2t²`; an i.i.d. sum vanishing a.s. forces ρ = δ₀ | sound |
| 7.2 | Gaussian stability; telegraph Check; Cauchy | `2|b| ≥ 2dJ_n >` top eigenvalue of `J_nA_R`; `t^{|x−y|} = e^{−c|x−y|/L}`, `Σ ≈ L²κ`; Z = 1 but infinite second moment | sound |
| 7.3 | W_d invariance; lattice gas; diluted ρ_n | `T_{f∘g}(φ) = T_f(φ∘g⁻¹)` and μ is g-invariant; `Σ_L = N/4 + N²/4`, mean `→ 2^{−d}∫f`; site variance `(1 − p) + pa² = 2 − p`, limit variance `2^{−d−1}∫f²` | sound |
| 7.4 (headline) | scaling; d = 1; massless constant | `L^{−d}·L^{2d}·L² = L^{d+2}`; `C_m(1_Q,1_Q) = 2/m² − (1 − e^{−2m})/m³`, `1 + e⁻²` at m = 1, `2/m − 4/3 + …`; `(n − 2)|S^{n−1}| = 4π^{n/2}/Γ(n/2 − 1)` | sound; agrees with RelativisticQuantumFieldTheory §7.1 |
| 8.1 Check (Gaussian susceptibility) | coupling `βJ^{nn}`, p = 0 | `1/(2|b_n| − 2dβ)`; at β = 1: `L_n²/m²` | sound |

Targets outside the sample that no repair touched (1.4, 1.5, 4.1, 4.4, 5.2–5.4, 6.1, 6.4) rely on the round-14 and round-13 tables, whose rows carry computed values. I recomputed one value in each of 1.5, 5.4 and 6.4 and they agree: the inverse of `[[2|b|, −J], [−J, 2|b|]]`, the sum rule `½((1 + t) + (1 − t)) = 1`, and `M₄ = 3M₂²`.

**Seeded source sample.** All fifteen targets were read at their locators.

| Target | Read | Outcome |
|---|---|---|
| 0.2 | `aizenman-duminilcopin-2021 lines 142–145` (p. 4), `220–230` (p. 5), `253–258` (p. 6); `simon-2020-twelve-tales line 1021` (p. 25) | (1.12) with the README's sign of b; (1.16)–(1.17); (1.20); the opposite sign in Simon |
| 1.1 | `aizenman-duminilcopin-2021 lines 137–146` (pp. 3–4); `sokal-1982 lines 387–396` (p. 326) | (1.11)–(1.12) with unordered pairs; finite volume and footnote 2 |
| 1.2 | `aizenman-duminilcopin-2021 lines 139–145`, `227–230`; `sokal-1982 lines 406–409` (p. 327) | as the repaired locator says |
| 1.3 | `peled-spinka-2017 lines 519–526` (p. 13) | the derivative formula after Theorem 2.3 |
| 2.1 | `aizenman-duminilcopin-2021 lines 363–373` (p. 8), `377–391` (p. 9), `2028–2033` (p. 45); `lebowitz-ruelle-speer-2012 lines 62–68`, `217–222`; `simon-2020-twelve-tales lines 1011–1018` (p. 25) | Definition 2.1(1) with real coefficients; Figure 1 and the Lee–Yang remark; the probability `Q_iQ_j⟨σσ⟩/⟨ττ⟩`; the Lee–Yang sentence of (1.2) for a uniform field; Lemma 2.4; Griffiths' trick (`H = −(log 2)t²` is `K₁₂ = (log 2)/2`) |
| 3.1 | `peled-spinka-2017 lines 334–341` (p. 11), `515–518` and `535–542` (p. 13); `sokal-1982 lines 414–418` | Theorems 2.1 and 2.3, Lemma 2.4; property (d) |
| 3.2 | `peled-spinka-2017 lines 519–532` (p. 13); `sokal-1982 lines 402–405` (p. 327) | monotonicity in the couplings and the volume limit |
| 3.3 | `sokal-1982 lines 423–424` (p. 327) | property (h) |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–448` (p. 10), `464–507` (p. 11) | Definitions 3.1–3.2, (3.1)–(3.5), Lemma 3.3 with (3.6), (3.7)–(3.9); the source's F is real-valued and its Z unnormalised |
| 3.6 | `sokal-1982 lines 436–444` (p. 328), `455–466` (p. 329) | property (k); the Remark; (5.2) of Aizenman–Duminil-Copin relied on from round 14 (`lines 1022–1038`) |
| 3.7 | `sokal-1982 lines 434–435` (p. 328), `825–853` (pp. 341–342) | property (j); Section 3.1, integration by parts in finite volume |
| 4.2 | `sokal-1982 lines 402–409` (p. 327); `duminilcopin-2017-lectures lines 545–551` (p. 14) | properties (a)–(b); Corollary 1.9, stated for Potts measures, of which q = 2 is the Ising case |
| 7.1 | `aizenman-duminilcopin-2021 lines 157–166` (p. 4) | (1.14)–(1.15) |
| 7.2 | `aizenman-duminilcopin-2021 lines 167–187` (p. 4) | Definition 1.1 (volume limit first, subsequences allowed), footnote 2 |
| 7.3 | `aizenman-duminilcopin-2021 lines 172–179` (p. 4); `sokal-1982 lines 710–721` (p. 337) | the paragraph after Definition 1.1; Lemma 2.2 |

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5; the checkouts' heads equal `lake-manifest.json`. All 43 file-and-line citations of the supplier contracts were opened (35 by script, 8 by hand), and each line carries the named declaration in the cited namespace. Examples:

- `fkg` at `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`, with `0 ≤ μ`, `0 ≤ f`, `0 ≤ g`, a finite-lattice statement.
- `Real.young_inequality` at `Mathlib/Analysis/MeanInequalities.lean:547`, inside `namespace Real`.
- `TauCeti.Measure.exists_isProjectiveLimit_of_countable` at `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`, with `[Countable ι]`, standard Borel coordinates and probability marginals.
- `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` at `TauCeti/Probability/Moments/Determinacy.lean:246`, which needs an exponential moment for both measures.
- `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24–26` says the extension theorem is not in Mathlib.

**Duplication, by object.** `roadmaps grep` over main and the 460 open heads for "Lee–Yang", "switching lemma", "random current", "Griffiths–Simon", "Gaussian free field", "Simon–Lieb" and "chessboard" returns no match. The other searches match only unrelated objects:

- "infrared bound", "Gaussian domination": RelativisticQuantumFieldTheory (dominated convergence of Gaussian integrals, graph-integral infrared bounds).
- "Gibbs measure": ClassicalErgodicTheory (shift spaces) and PDE's deferral.
- "FKG": a Stacks tag.
- "Gaussian process", "covariance kernel": the statistics roadmaps (limit processes) and StochasticCalculus Layer 1 (Brownian motion).

None constructs a process from an arbitrary kernel or states a lattice result of this roadmap. ConstructiveFieldTheoryPhi4PartII is on neither main, the open list nor the board index; it is named only as a consumer. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy; main has no folder of this name.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsNonparametric, PointProcesses, ClassicalErgodicTheory, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2258 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no citation and no name found nowhere. Citations resolved now:

- StochasticCalculus §1.1 (`TauCetiRoadmap/StochasticCalculus/README.md:879`): the arbitrary-index extension for standard Borel state spaces and consistent probability laws, with law uniqueness.
- StandardDistributions §5.3 (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1573`; `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean:78` `OrderLE`, `:115` `hadamard_of_orderLE_one`): differentiable f, `f 0 ≠ 0`, `OrderLE f 1`, multipliable product, exponent `a + b s`, as the contract says.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder, earlier in the merge order): multiplier `(4π²‖ξ‖² + m²)⁻¹`, heat integral for x ≠ 0, exterior decay for 0 < c < m, massless kernel `|x|^{2−n}/((n − 2)|S^{n−1}|)` for n ≥ 3. Its text names neither this roadmap nor lattice Gibbs fields: no cycle.
- Scope deferrals: PDE (`TauCetiRoadmap/PDE/README.md:104–107`) and OperatorAlgebraDynamics D9 exist as cited.

**Shape.** The README has the Summary, Scope and ownership, Conventions, contracts per supplier, the build paragraph, eight layers each ending in Examples and Dependencies, consumers, and references (14 entries, the 14 manifest keys). The layer order is forced where it matters (1 needs 0; 2 needs 1; 3 needs 2 through 3.5 and 3.7; 4 needs 3; 7 needs 1, 3.2 and 6); Layers 5 and 6 are declared independent. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. A pattern search found no process words, pull-request numbers, machine paths, LaTeX delimiters, HTML anchors or field lists.

**Headlines.** Stating them in `Suggested.lean` is the package stage's work. They are:

- Layer 2: Lee–Yang and the Griffiths–Simon transfer with φ⁴ membership.
- Layer 3: Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments.
- Layer 4: the free-boundary state and critical point.
- Layer 5: reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3.
- Layer 6: covariance realisation and Wick's law.
- Layer 7: reachable fields and the reachability of the Gaussian free field.

**Copyright.** Wording was set beside the source at 13 passages:

- the current and sub-current definitions of 3.4 against `aizenman-duminilcopin-2021 lines 421–428` and `470–471`;
- the reachability definition of 7.2 against `lines 167–171`;
- the field construction of 7.3 against `lines 172–173`;
- the class definition of 2.2 against `lines 363–384`;
- the transfer paragraph of 2.2 against `lines 2019–2027`;
- the hard limit of 0.2 against `lines 253–260`;
- the Griffiths-trick Check of 2.1 against `simon-2020-twelve-tales lines 1011–1018`;
- the Lee–Yang statement and the Asano sentence of 2.1 against `lebowitz-ruelle-speer-2012 lines 62–68` and `217–222`;
- the derivative and monotonicity statements of 1.3 and 3.2 against `peled-spinka-2017 lines 519–532`;
- the limit definition of 4.1 against `sokal-1982 lines 402–405`;
- the new sentence of 3.6 and its route against `sokal-1982 lines 455–466`;
- the law of 4.2 against `duminilcopin-2017-lectures lines 549–551`.

No shared run beyond formulas, standard names and the forced phrase for a sub-current (under ten words).

Arrangement: the most cited source has sections 1 (fields and main result), 2 (the class), 3 (random currents), 4, 5 (two-point function), 6, 7 (extension to the class). The roadmap puts that source's §1 material last (Layers 6–7), builds Layer 3 from its §3, §5.1 and §7 with two other sources, takes Layers 4 and 5 mostly from other sources and has no counterpart of its §4 and §6: no one-to-one run. No table, figure or exercise list is taken over.

Source independence: 13 passages compared with 6 sources, none shared; largest share aizenman-duminilcopin-2021, 48 of 117 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.17)–(2.30) and (3.4)–(3.5): the extraction drops the formulas. I read the surrounding sentences, which name each property, and recomputed the statements independently; whether (2.17) is printed on p. 326 or at the top of p. 327 could not be told from the extraction.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The local-limit step of 2.3 and the Riemann-sum limits of 5.4 and 7.4 were checked for exponents and constants, not written out in full.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the symbol of (5.7); affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, since a mixed-sign pair block has positive fourth cumulant; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Section 7.1, the paragraph after Proposition 7.2, preprint p. 45: the source says uniform constants pass the bound from Ising blocks to their weak limits; it should supply tail control of the approximants; affects the proof.
- **Gap** in aizenman-duminilcopin-2021 at Section 5, the paragraph before (5.1), preprint p. 23: the source says the reflection inequality (5.2) holds for an arbitrary common spin distribution; it should assume an even distribution for products of odd total degree; affects nothing.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), a scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:740–762` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bc3d493b2c5085829a73fe9b0841bb5920362f4c", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~15", "model": "fable", "worker": "chris-x91"} -->
