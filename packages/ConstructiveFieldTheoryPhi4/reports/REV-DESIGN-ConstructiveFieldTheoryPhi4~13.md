<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6900703867 -->
Review (claude) of 5c8d4dd

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a Check of 5.2 evaluates the theorem at J = 0, which the layer's standing hypothesis excludes

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:499` (opening of Layer 5): "Throughout, ρ is admissible, J > 0, L ≥ 1"; and `:529` (5.2, third Check): "For J = 0, `μ^{per}` is a product measure: an edge reflection gives `|E f|² ≥ 0`, while a vertex reflection gives …".

   **Claim.** The Check tests the reflection-positivity statement of 5.2.

   **Witness.** With J > 0 standing, 5.2 asserts nothing at J = 0, so the Check (including its worked value 1 against `|E f|² = 0` for d = 1, L = 2) is about a case the stated theorem does not cover.

   **Exact repair.** Replace the standing sentence by "Throughout, ρ is admissible, J ≥ 0, L ≥ 1, …; 5.4 and 5.5 assume J > 0", and make the plan entries 5.1–5.3 agree. Tested on the refuting instance J = 0: the periodic measure is `ρ^{⊗T_L}`; the edge form is `|E f|² ≥ 0` and the vertex form `E[|E(f | fixed spins)|²] ≥ 0` (1 for f = φ₀, Ising, L = 2); in 5.3, `ρ̃ = ρ` and `Z(h) = Z(0)` for every h; only the bound `E(p)Ŝ_L(p) ≤ 1/J` of 5.4 needs J > 0, and 5.5 states J > 0 itself.

Both round-12 findings are repaired. No P1 or P2 finding was found. One P3 finding (R01) carries a repair, so the verdict asks for changes: a fix round applies it; it changes no supplier or merge-order position. No supplier gap is declared. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No maintainer notes exist for this roadmap.

## Previous findings, checked first

| Round-12 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) positive definiteness of a `[0, ∞]`-valued S | `README.md:462`: "S(x) ≤ S(0) = ⟨φ_0²⟩_{J,ρ} (Cauchy–Schwarz in V_R and translation invariance when S(0) is finite, trivially otherwise); and, when S(0) < ∞, every S(x) is finite and S is positive definite"; plan 4.3 `basic` has the same hypothesis; new Check at `:473` and plan test `positive_definite` | **Repaired** |
| F02 (P3) `cited_for` of the main source lacked "2.3" | `sources.toml`, entry `aizenman-duminilcopin-2021`: the list now has 25 entries with "2.3" between "2.2" and "3.4" | **Repaired** |

Adversarial pass on the changed text (values computed this round, `t = tanh J`):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 4.3, S(x) ≤ S(0) | finite box, then limit | `⟨φ₀φ_x⟩_{V_R} ≤ (⟨φ₀²⟩_{V_R}⟨φ_x²⟩_{V_R})^{1/2} ≤ S(0)`, the last step by monotonicity in R and translation invariance of the limit; S(0) = ∞: nothing to prove | holds |
| 4.3, positive definiteness | Ising chain, c = δ₀ − δ_x; c = δ₀ + δ₁ | `2(1 − t^{|x|}) ≥ 0`; `2 + 2t = ⟨(σ₀ + σ₁)²⟩_{V_R}` for R ≥ 1 | holds; the limit formula agrees |
| 4.3, hypothesis needed | S(0) = S(x) = ∞, c = δ₀ − δ_x | `2S(0) − 2S(x)` is `∞ − ∞` | the added hypothesis is used |
| 4.3, new Check | c = δ₀ − δ₁ + δ₂ | chain: `3 + 2(−t − t + t²) = 2(1 − t)² + 1`; f = (1, 4/5, 0, …): `3 + 2(−4/5 − 4/5 + 0) = −1/5`; symbol `1 + (8/5)cos p = −3/5` at p = π | Check correct and discriminating |
| manifest against README | script over all 14 entries and every `### k.n` section | 0 sections missing from any list; 2 extras (`sokal-1982` "4.4", `simon-2020-twelve-tales` "0.2"), both explained by the repair report (the Remark on p. 329 reached through 3.6; the sign convention in the Conventions) | holds |

Pattern sweep. Signed combinations of possibly infinite infinite-volume quantities: none besides the repaired one (4.1 and 4.2 state Griffiths II in product form; the Lebowitz, Gaussian and Simon–Lieb inequalities of 4.1 and 4.3 have nonnegative sums on both sides; 5.4–5.5 subtract finite torus quantities). Manifest lists: checked for all 14 entries as in the table.

## Verified sound

**Coverage.** All 777 lines of the README were read. `design/plan.json` was parsed: 8 layers, 36 targets, 4 suppliers, 1 consumer, `gaps: []`; no prerequisite names a later target; the prerequisite list of each of the 36 targets was set beside its `*Needs:*` line (they agree); every definition target has at least 3 tests (0.1: 5; 0.2: 4; 1.1: 4; 2.1: 9; 2.2: 6; 3.4: 4; 4.1: 3; 4.3: 5; 5.1: 3; 6.1: 3; 6.2: 3; 7.1: 5; 7.2: 4; 7.4: 3). The author flagged no locator as unverified.

**Principles.** No route-specific shortcut (Lee–Yang for site-dependent complex fields and every ferromagnetic coupling; FKG without evenness; Gaussian processes on an arbitrary index type; moment bounds for every coupling). No roadmap is planned again; supply runs one way; no algorithm; no copied passage; no Lean file, hence no `set_option` and no sorry'd data.

**Adversarial table: the fifteen sampled targets, the headlines, and the target of R01.** Every value was computed by me this round.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 stability bound | any coupling | `−H ≤ Σ_{pairs}|J_{xy}|(φ_x² + φ_y²)/2 ≤ ½‖J‖Σφ_x²` | sound |
| 1.1 Checks | three Ising sites; N(0,1) pair, J = 1 | 2 aligned states `e^{3J}`, 6 others `e^{−J}`: `Z = (e^{3J} + 3e^{−J})/4`; numerator `2e^{3J} + 2e^{−J} − 4e^{−J}`; `E[e^{y²/2}] = ∞` | sound |
| 1.4 | `ρ_k = (1 − e^{−k})δ₀ + ½e^{−k}(δ_k + δ_{−k})`; `ρ_{λ,2λ}` | `Z ≥ ¼e^{−2k}e^{k²}`, and `∫e^{cφ²}dρ_k ≥ e^{ck²−k} → ∞`; for |φ| ≥ 2, `(φ² − 1)² ≥ 9φ⁴/16`, tail `≤ e^{−9(λ−1)}·const` against a normaliser of order `λ^{−1/2}` | sound; uniform bound needed and satisfied where claimed |
| 1.5 | two sites; d = 1; box of one point | exponent `−½φᵀ(2|b|I − J⁰)φ`; inverse `(4b² − J²)⁻¹[[2|b|, J],[J, 2|b|]]`; `(2π)⁻¹∫dp/(2 + μ² − 2cos p) = ((2 + μ²)² − 4)^{−1/2} = 1/(μ√(4 + μ²))`; `2d + μ² > 0` | sound |
| 2.1 Lee–Yang (headline) | pair polynomial; a = 1; contraction | `|1 + az|² − |a + z|² = (1 − a²)(1 − |z|²)`; `(1 + z₁)(1 + z₂)`; `{−uv : |u|, |v| ≥ 1} = {|z| ≥ 1}` | sound |
| 2.1 product formula | ρ_I; uniform on {−1, 0, 1} | `Σ((k + ½)π)⁻⁴ = (16/π⁴)(π⁴/96) = 1/6`, cumulant `−2`; `(2π)⁻²π²/sin²(π/3) = 1/3 = ½·(2/3)`; real h: `Π(1 + h²x_j) ≥ 1 + h²Σx_j`, so `Σx_j < ∞` and the coefficient comparison is legitimate | sound |
| 2.2 tail control | steps (a)–(f) | `(σ²/2)² ≤ 3σ⁴·P`, `P ≥ 1/12`; `log(1 + u) ≥ u log 2` on (0, 1]; `θ(log C + θ^{−α′/2})/log 2 → 0` as α′ < 2; at most `S/(2θ)` large terms, each `≤ S/2`; `e^{2cg²s} ≤ e^{g²/4}` for s < 1/(8c) and `E[g^{2k}e^{g²/4}] < ∞` | sound |
| 2.2 Checks | CLT blocks; mixtures; log-N blocks | `x = ((m + ½)π)⁻²/N ≤ 4/(π²N)`, total ½; `1 − 1/k + (2n − 1)!!/k ≤ (2n − 1)!!`; `log²1000 = 47.72`, `(1 − 2/47.72)^{−1/2} = 1.0216`; `Z(η_N) ≤ (1 − J/log²N)⁻¹` | sound |
| 2.3 | exponent; tails; b < 0 | `(g_N − 1)Nm²/2 − Nm⁴/12 = bφ² − φ⁴/(12c⁴) = bφ² − λφ⁴`; |m| > ½: `Nm⁴/12 ≥ N/192`, `exp(c^αN^{α/4})` with α/4 < 1 is absorbed; `g_N > 0` iff `N > 4b²c⁴` | sound |
| 3.2 | non-even control on two sites | `⟨φ₀⟩ = −3e^J/(5e^J + 4e^{−J})`, −1/3 at J = 0, decreasing | sound |
| 3.4 | two sites; corollary | `Σ_{even} Jⁿ/n! = cosh J`; right side `cosh² J − 1 = sinh² J`; `Z_AZ_B = Z_{A∆B}Z_∅·P`, divide by `Z_∅²` | sound |
| 3.5 (headline) | n = 1; block transfer of Simon–Lieb | equality `⟨σ₁σ₂⟩ = ⟨σ₁σ₂⟩`; `Σ q_aq_b·Σ ⟨σ_{0a}σ_{uc}⟩_Λ J_{uv}q_cq_e⟨σ_{ve}σ_{yb}⟩ = Σ⟨φ₀φ_u⟩_Λ J_{uv}⟨φ_vφ_y⟩` | sound |
| 3.6 expansion | pairs in V₊, mixed, with V₀ | `φ_xφ_y + φ_{Rx}φ_{Ry} = ½(ss + tt)`; `φ_xφ_{Ry} + φ_{Rx}φ_y = ½(ss − tt)`; `J_{xz}s_xφ_z`; monomials `s^at^b` vanish unless a, b even | sound |
| 3.6 lattice hypotheses | plane `x₁ = ½`; `x₁ = 0`; `x₁ − x₂ = a` | neighbours x, Ry on opposite open sides force y = x; none; values `≥ a + 1` and `≤ a − 1` differ by 2 while a step changes them by at most 1 | sound |
| 3.7 (used by 4.2) | maximal site | `4λm² ≤ 1 + (2b₊ + ‖J‖)m`; ε = ¼ at a = 2: `0.75 + 0.25·3.762 = 1.6905 > 1.6487`; `(e + e⁻¹cosh 2)/(e + e⁻¹) = 1.3293` | sound |
| 4.2 | d = 1 chain; projections | `e^J/(e^J + e^{−J}) = (1 + t)/2`; Hölder: `E e^{a′|Σc_xφ_x|} ≤ Π(E e^{a′|c_x||F||φ_x|})^{1/|F|}` | sound |
| 4.3 | d = 1 | `Σt^{|x|} = (1 + t)/(1 − t) = e^{2J}`; `e^{1/2} = 1.649 ≤ 2` | sound |
| 5.1 | L = 1; L = 2; Parseval | bonds 0→1 and 1→0 give `2Jφ₀φ₁`; `(t + t³)/(1 + t⁴)`; `|1 − e^{ip_j}|² = 2 − 2cos p_j` | sound |
| 5.2 (headline) | L = 1 edge form; vertex reflection on ℤ/2; J = 0 | matrix `[[e^{2J}, e^{−2J}],[e^{−2J}, e^{2J}]]`, eigenvalues `e^{2J} ± e^{−2J}`; identity map, form `⟨|f|²⟩`; 1 against 0 | sound; R01 on the standing hypothesis |
| 5.3 (headline) | identity; L = 1 Ising | `−(J/2)ΣΣ(φ_x − φ_{x+e_j})² = JΣΣφφ − dJΣφ²`; `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}`; `Z″(0) ∝ −4J + e^{−4J}(32J² − 4J)`, `max e^{−4J}(8J − 1) = 2e^{−3/2} = 0.446` at J = 3/8 | sound |
| 5.4 (headline) | second order in h; Gaussian torus; L = 1 Ising | `J²⟨(φ,Δh)²⟩ ≤ J(h,−Δh)`, cos and sin modes give `E²Ŝ|T| J ≤ E|T|`; symbol `2(|b| − dJ) + JE(p)`; `max 2x(1 − tanh x) = 0.557` | sound; constant 1/J sharp |
| 5.5 (headline) | sum rule; d = 3 | `1 ≤ |T|⁻¹Ŝ(0) + J⁻¹|T|⁻¹Σ_{p≠0}1/E(p)`; `I₃ = W/2 = 0.2527`, `G(0) = 3W = 1.516`, `G(0)/6 = 0.2527` | sound |
| 6.1 | subspace condition; non-example | `ν_{f,g,h}` on `{v_h = av_f + bv_g}` gives `T_{af+bg} = aT_f + bT_g` a.s.; `T_{−f} = T_f` | sound |
| 7.1 Total functions | block of N ≥ 1 sites, any stable ρ | `Σφ_x = 0` a.s. under `ρ^{⊗V}` forces ρ = δ₀ | sound without evenness |
| 7.3 | lattice gas; diluted ρ_n | `Σ_L = N/4 + N²/4`; site variance `2 − p`, limit variance `2^{−d−1}∫f²` | sound |
| 7.4 (headline) | scaling; d = 1; d = 3, 4 | `L^{−(d+2)}·L^{2d}·L^{−d}·L² = 1` in front of `1/(L²E(q/L) + m²)`; `C_m(1_Q,1_Q) = 2/m² − (1 − e^{−2m})/m³`, `1 + e⁻²` at m = 1, `~2/m` as m → 0; `Γ(½)/(4π^{3/2}) = 1/(4π)`, `1/(4π²)` | sound; agrees with RelativisticQuantumFieldTheory §7.1 |

For the targets outside the sample that no repair touched (0.1, 0.2, 1.2, 1.3, 3.1, 3.3, 4.1, 4.4, 6.2–6.4, 7.2, 8.1, 8.2) the round-12 table carries computed values; I recomputed one value in each (for example `(e^J − 1)/(3 + e^J)²`, the tent sum `(2L² + 1)/(3L)`, `3 + 4t + 2t²`, `e^{−|x|²−|y|²} ≤ e^{−|x−y|²/2}`, the Gaussian susceptibility `L_n²/m²`) and they agree.

**Seeded source sample.** All fifteen targets were read at their locators.

| Target | Read | Outcome |
|---|---|---|
| 1.1 | `aizenman-duminilcopin-2021 lines 137–147` (pp. 3–4); `sokal-1982 lines 387–396` (p. 326) | (1.11)–(1.12), unordered pairs; finite volume with footnote 2 |
| 1.4, 2.2 | `aizenman-duminilcopin-2021 lines 363–384` (pp. 8–9), `1979–1986` (p. 44), `2018–2027` (p. 45) | Definition 2.1 with real coefficients and (2.2); the continuity sentence; the weak-limit paragraph |
| 1.5 | `sokal-1982 lines 394–396`; `simon-2020-twelve-tales lines 955–974` (pp. 23–24); `frohlich-1982 lines 263–269` (p. 13) | footnote 2; (3.8) on ℤ²; the free lattice field after (33) |
| 2.3 | `aizenman-duminilcopin-2021 lines 392–406` (p. 9); `simon-2020-twelve-tales lines 1019–1022` (p. 25) | (2.3)–(2.4), `g_N → 1`; the opposite sign of b |
| 3.2 | `peled-spinka-2017 lines 519–532` (p. 13); `sokal-1982 lines 400–405` (p. 327) | derivative formula and monotonicity; monotone limit |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–448` (p. 10), `464–507` (p. 11) | Definitions 3.1–3.2, (3.1)–(3.9), Lemma 3.3; the source's Z is unnormalised (factor `2^{|Λ|}`), the README's normalised |
| 3.6 | `aizenman-duminilcopin-2021 lines 1022–1038` (p. 23); `sokal-1982 lines 436–444` (p. 328), `455–466` (p. 329) | (5.2) and the two families of hyperplanes; property (k); the Remark |
| 4.2 | `sokal-1982 lines 406–409` (p. 327); `duminilcopin-2017-lectures lines 549–551` (p. 14) | properties (a)–(b); Corollary 1.9 (Potts, Ising at q = 2) |
| 5.1 | `aizenman-duminilcopin-2021 lines 1055–1084` (p. 24); `peled-spinka-2017 line 1249` (p. 27) | (5.5)–(5.8); Section 2.7.1 |
| 5.2 | `peled-spinka-2017 lines 1328–1349` (p. 28), `1385–1391` (p. 29), `1476–1493` (p. 30), `1547` (p. 32) | Propositions 2.14–2.16, Corollary 2.17; bounded interaction and finite a-priori measure there, Gaussian example theirs |
| 5.3 | `peled-spinka-2017 lines 1562–1648` (pp. 32–33); `simon-2020-twelve-tales lines 1538–1547` (pp. 36–37) | (43)–(48) and the closing paragraph; (5.19)–(5.21) |
| 5.4 | `aizenman-duminilcopin-2021 lines 1069–1091` (p. 24); `peled-spinka-2017 lines 1686–1741` (pp. 34–35); `simon-2020-twelve-tales lines 1518`, `1556` | (5.7)–(5.10) with the printed constant; (49)–(52); (5.17), (5.22) |
| 5.5 | `peled-spinka-2017 lines 1207–1215` (p. 26), `1759–1806` (p. 36); `simon-2020-twelve-tales lines 1502–1523` (p. 36) | Theorem 2.13; (53) and the Riemann sum; (5.15)–(5.18) |
| 6.1 | `aizenman-duminilcopin-2021 lines 55–57` (p. 2), `183–187` (p. 4) | (1.4); footnote 2 |
| 2.1 (route) | `lebowitz-ruelle-speer-2012 lines 62–68`, `217–222` | the Lee–Yang sentence of (1.2); Lemma 2.4 |

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5 (the checkouts' heads equal the revisions of `lake-manifest.json`). All 43 file-and-line citations of the supplier contracts were opened; each line carries the named declaration, and the enclosing namespace gives the cited full name (for example `TauCeti.Measure.exists_isProjectiveLimit_of_countable` under `namespace TauCeti` / `namespace Measure`, `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`; `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`, `TauCeti/Probability/Moments/Determinacy.lean:246`; `isCompact_closure_of_isTightMeasureSet` in the root namespace, `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530`). Signatures relied on: `Countable.lean:165` assumes `[Countable ι]` and standard Borel coordinates; `Determinacy.lean:246` assumes `Integrable (exp (a|x|))` for some a > 0 for both measures; `Multivariate.lean:233` assumes `S.PosSemidef`; `FiniteDimensionalLaws.lean:53` assumes the process; `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24–26` says the extension theorem is not in Mathlib.

**Duplication and ownership.** `roadmaps grep` over main and the 474 open heads: "Lee–Yang", "switching lemma / random current", "Simon–Lieb / Lebowitz inequality", "chessboard / Messager", "Gaussian free field / white noise", "ConstructiveFieldTheory": no match. "Griffiths": transversality only. "Ising": unrelated substrings. "Gibbs measure": ClassicalErgodicTheory (shift spaces) and a PDE deferral. "infrared bound / Gaussian domination": RelativisticQuantumFieldTheory lines on zero-dimensional integrals and Feynman amplitudes, none the torus statement. "Gaussian process": StochasticCalculus Layer 1 (Brownian motion and the extension theorem) and the statistics roadmaps (limit processes in `ℓ^∞(T)`); none constructs a process from an arbitrary kernel. "random field": RelativisticQuantumFieldTheory §0.5, a rank-one example and a no-Lebesgue-measure theorem, not a C_c-indexed law. This roadmap is the owner of the lattice objects, the Lee–Yang theorem and the kernel-indexed Gaussian process. ConstructiveFieldTheoryPhi4PartII is on neither main, the open list nor the board index; it is named only as a consumer. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy; main has no folder of this name.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2238 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations resolved now (main at f4d95c3):

- StochasticCalculus §1.1 (`TauCetiRoadmap/StochasticCalculus/README.md:879`, its closing sentences): the unique law on the product σ-algebra for any indexed family of standard Borel spaces with consistent finite-product laws.
- StandardDistributions §5.3 (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean:110`, `hadamard_of_orderLE_one`): entire f, `f 0 ≠ 0`, `OrderLE f 1`, multipliable product with exponent `a + b s`, as the contract says.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder, earlier in the merge order): multiplier `(4π²‖ξ‖² + m²)⁻¹`, heat integral for x ≠ 0, exterior decay for 0 < c < m, massless kernel `|x|^{2−n}/((n − 2)|S^{n−1}|)`. Its text names neither this roadmap nor lattice fields, so there is no cycle.
- Scope deferrals: PDE (`TauCetiRoadmap/PDE/README.md:107`) exists as cited.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. The layer order is forced where it matters (1 needs 0; 2 needs 1; 3 needs 2 through 3.5 and 3.7; 4 needs 3; 7 needs 1, 3.2 and 6); Layers 5 and 6 are declared independent. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. A pattern search found no process words, pull-request numbers, machine paths, LaTeX delimiters or field lists ("lemma" and "current" occur only as mathematical terms).

**Headlines.** Lee–Yang and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Copyright.** Wording was compared at every locator of the sample table (36 passages: 12 of `aizenman-duminilcopin-2021`, 10 of `peled-spinka-2017`, 5 of `sokal-1982`, 5 of `simon-2020-twelve-tales`, 2 of `lebowitz-ruelle-speer-2012`, and one each of `frohlich-1982` and `duminilcopin-2017-lectures`), including the definitions of 3.4 against `aizenman-duminilcopin-2021 lines 421–428` and `464–471`, the definition of 7.2 against `lines 167–171`, the Gaussian-gradient Check of 5.3 against `peled-spinka-2017 lines 1634–1648`, the Griffiths-trick Check against `simon-2020-twelve-tales lines 1011–1018` and the Asano step against `lebowitz-ruelle-speer-2012 lines 217–222`. No shared run beyond formulas, standard names and the forced phrase for a sub-current (under ten words). Arrangement: the most cited source has sections 1 (fields and main result), 2 (the class), 3 (random currents), 4, 5 (two-point function), 6 (unconditional proofs), 7 (extension to the class), read at `lines 20`, `355`, `413`, `993`, `1437`, `1979`. The roadmap puts that source's §1 material last (Layers 6–7), builds Layer 3 from its §3, §5.1 and §7 with two other sources, takes Layers 4 and 5 mostly from other sources and has no counterpart of its §4 and §6: no one-to-one run. No table, figure or exercise list is taken over.

Source independence: 36 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 50 of 119 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.17)–(2.30) and `frohlich-1982` displays (33) and following: the extractions drop the formulas. I read the surrounding sentences, which name each property, and recomputed the statements independently.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The Riemann-sum limit of 5.4 for `1/E(p)` in d ≥ 3 and the limit of 7.4 were checked for constants, for `L²E(q/L) ≥ (4/π²)|q|²` and for a uniform tail estimate (Cauchy–Schwarz with Parseval outside |q| ≤ M), not written out in full.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the symbol of (5.7); affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, since a mixed-sign pair block has positive fourth cumulant; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Section 7.1, the paragraph after Proposition 7.2, preprint p. 45: the source says uniform constants pass the bound from Ising blocks to their weak limits; it should supply tail control of the approximants; affects the proof.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), a scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:738–760` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5c8d4ddee6b5b619e20548ece7609db07d23cca2", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~13", "model": "fable", "worker": "chris-x90"} -->
