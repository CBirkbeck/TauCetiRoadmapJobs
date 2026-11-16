# Review of ConstructiveFieldTheoryPhi4 (pull request #2432 at 7e9970f)

**Verdict:** needs changes

## R01 (P3) — §7.3 locator does not contain the symmetry, invariance or variance claims

**Location:** `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/README.md` line 716 and `Suggested.lean` lines 656–658 (docstring of `exists_reachableField`): "…and that `E[T_f(Φ)²] ≤ liminf_n liminf_k ⟨(T^{n,k}_f)²⟩_{μ_{n,k}}` (Aizenman–Duminil-Copin, the paragraph after Definition 1.1, p. 4; compare Sokal, Lemma 2.2…)".

**Claim:** The single locator at the end covers four claims: existence of the field, symmetry under Φ ↦ −Φ, W_d-invariance and the second-moment bound. The cited paragraph supports only existence. Sokal, Lemma 2.2 gives subsequential tightness on 𝒮′.

**Witness:** aizenman-duminilcopin-2021 lines 172–179 (p. 4) only present the limit as a random field, with the details omitted. Searching that text for "invarian", "symmetr" or "liminf" finds no statement about reachable fields.

**Repair:** Put "(Aizenman–Duminil-Copin, the paragraph after Definition 1.1 and footnote 2, p. 4)" after the existence sentence. End the second sentence with "(stated in this form by this roadmap: each box Gibbs measure is W_d- and, for even 𝒞, flip-invariant, and ∫v² is weakly lower semicontinuous; compare Sokal, Lemma 2.2, p. 337, …)". Split the docstring the same way.

## R02 (P3) — the description announces a dependency list it never gives

**Location:** Pull-request description, prose paragraph 3: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … everything else named in the README is a consumer, not a prerequisite."

**Claim:** No list follows, so the three suppliers on main are never named. PDE and OperatorAlgebraDynamics are named in the README only for material it excludes, so they are neither suppliers nor consumers.

**Witness:** README §"Exact supplier contracts" (lines 86–100) consumes StochasticCalculus §1.1, StandardDistributions §5.3, ZerosOfLFunctions §5.5 and RelativisticQuantumFieldTheory §7.1, §7.3. README line 25 names PDE and OperatorAlgebraDynamics D9.

**Repair:** Replace the paragraph with: "Suppliers: StochasticCalculus §1.1, StandardDistributions §5.3 and ZerosOfLFunctions §5.5 (on main); RelativisticQuantumFieldTheory §7.1 and §7.3 (open, in the merge order below). Consumer: ConstructiveFieldTheoryPhi4PartII. PDE and OperatorAlgebraDynamics D9 are named only for excluded material. The Lean imports none of them."

## Verified sound

| Target | Instances tried | Values computed (README/Lean side vs computed) | Result |
|---|---|---|---|
| 0.1 `IsAdmissible` | N(0,1); density ∝ e^{−φ² log(1+φ²)} | ∫e^{φ²/2}dN(0,1) = ∞, so not admissible; second: e^{cφ²} integrable for every c, yet ∫e^{\|φ\|^α} = ∞ for every α > 2 | holds |
| 1.1 Hamiltonian / Gibbs convention | two Ising sites, J = (ln 3)/2 | Z = 2/√3, ⟨σσ⟩ = ½; ordered sum without ½ gives 4/5; halved sum gives 2 − √3 | holds |
| 1.1 three sites | all pairs J, enumeration | Z = (e^{3J}+3e^{−J})/4; ⟨σ₁σ₂⟩ = (e^{3J}−e^{−J})/(e^{3J}+3e^{−J}), negative for J < 0 | holds |
| 1.2 symmetries | chain 0–1–2; ρ = (δ₀+δ₁)/2 | ⟨σ₀σ₂⟩ = tanh²J; one-site mean ½ ≠ 0, so evenness is needed | holds |
| 1.5 Gaussian lattice fields | two sites γ_b; d = 1 G_μ(0) | covariance (4b²−J²)⁻¹[[2\|b\|, J],[J, 2\|b\|]]; (2π)⁻¹∫dp/(2−2cos p+μ²) = 1/(μ√(4+μ²)) | holds |
| 2.1 `leeYang` | V empty; one site; two sites, equal h; J = −(ln 2)/2 | 1; zeros iπ(k+½); ferromagnetic zeros force Re h = 0; antiferromagnetic zero ±0.658 + 1.571i | holds |
| `isingBlock_laplace_ne_zero` | δ₀; ρ_I; uniform {−1,0,1}; q = (1,−1), K = (ln 3)/2 | 1; cosh h; zeros at i(±2π/3 + 2πk); mixed-sign zero ±0.881 + 1.571i | holds, needs q ≥ 0 |
| `isingBlock_laplace_hasProd` | ρ_I; uniform {−1,0,1} | Σ((k+½)π)⁻² = ½ = ½∫φ²; (2π)⁻²Σ(n+⅓)⁻² = ⅓; κ₄(ρ_I) = −12·(1/6) = −2 | holds |
| `isingBlock_tailControl` | CLT blocks q_n = N^{−1/2}; X_N = Σσ/(√N log N) | first: limit N(0,1) excluded by α-moment hypothesis; second: ∫e^{φ²}dη₁₀₀₀ ≤ 1.022 | holds |
| `tendsto_gibbs_of_isingBlock` | ½(δ_{−s_k}+δ_{s_k}), two sites; X_N above | s_k² tanh(Js_k²) → s² tanh(Js²); 1 ≤ Z(η_N) ≤ (1 − J/log²N)⁻¹ → 1 | holds |
| `phi4Measure_mem_griffithsSimonClass` | Curie–Weiss, c = (12λ)^{−1/4}, g_N = 1 + 2bc²N^{−1/2} | exponent −Nm⁴/12 + (g_N−1)Nm²/2 = −λφ⁴ + bφ² at m = φN^{−1/4}/c | holds |
| 3.1 `griffiths_first`, `griffiths_second` | two Ising sites, J < 0; ρ = (2δ₋₁+δ₁)/3 | tanh J < 0; ⟨φ⟩ = −⅓; Ginibre parity argument gives ∫∫(x+y)^m(x−y)^n ≥ 0 for every even ρ | holds |
| 3.2 monotonicity | chain 0–1–2; ρ = (2δ₋₁+δ₁)/3 on two sites | tanh J₀₁ tanh J₁₂ increasing; ⟨φ₀⟩ = −3e^J/(5e^J+4e^{−J}) moves from −⅓ to −⅗ | holds, evenness needed |
| 3.3 `fkg_gibbs` | lattice gas (δ₀+δ₁)/2, two sites | covariance (e^J − 1)/(3+e^J)², nonnegative iff J ≥ 0 | holds |
| `randomCurrent_representation` | two sites | Σ_{n even}J^n/n! = cosh J = ∫e^{Jσσ}dρ_I^{⊗2}; odd sum sinh J | holds |
| `switching_lemma` | two sites, A = B = {x,y}, F ≡ 1 | left side sinh²J; right side cosh²J − 1 | holds |
| `gaussian_inequality` | n = 0, 1; (x,x,y,y); non-member ε = ¼ | 1 ≤ 1; equality; 1 ≤ 1 + 2tanh²J; ¼ > 3/16 off the class | holds, class needed |
| `simon_lieb` | chain 0–1–2, Λ = {0} | tanh²J ≤ J tanh J | holds |
| `messager_miracleSole` | {0,…,3}, only J₀₂ = J₁₃ = K; V = {−1,0,1}, ρ = (2δ₋₁+δ₁)/3 | hypothesis fails, and 0 < tanh K; without evenness −1/27 > −⅓ | holds, both hypotheses needed |
| 3.7 `phi4_secondMoment_le` | one site, b = 0, J = 0; J_xx = 1 | M = 1/(2√λ) ≥ 0.338/√λ; identity gives 1 = 1, diagonal convention would give 0.662 | holds |
| 3.7 `newman_bound` | two sites J = 1, z = (1,−1); ε = ¼ member test, a = 2 | 1.329 vs signed 1.269 (fails), stated right side 5.822; non-member 1.691 > 1.649 | holds, \|Re z\| needed |
| 4.1 monotone limits | d = 1 Ising; ρ = δ₀ | tanh^{\|x\|}J for every R ≥ \|x\|; A = 2δ_x gives 0, A = 0 gives 1 | holds |
| `exists_infiniteVolume_limit` | d = 1 Ising; d = 0 | stationary chain, P(σ_{x+1} = σ_x) = (1+tanh J)/2; d = 0 gives μ = ρ | holds |
| `phi4_uniform_expMoment` | Newman plus 3.7 bound | ⟨e^{a\|φ\|}⟩ ≤ 2exp(a²M(λ,b,K)/2), K = finite row sum (finite range, translation invariance) | holds |
| `criticalPoint_ising_ge` | d = 0; d = 1, β = ¼; β = 1 | χ = 1, β_c = ⊤ = (2·0)⁻¹; e^{1/2} = 1.649 ≤ 2; β = 1 outside hypothesis (χ = e²) | holds |
| `twoPoint_reflection_monotone` | d = 1; d = 2, small t | tanh^n J decreasing; S(1,0) ≈ t ≥ S(1,1) ≈ 2t² ≥ S(2,0) ≈ t² | holds |
| 5.2 `reflectionPositive` | L = 1, d = 1 edge; L = 2 vertex, J = 0, f = φ₀ | matrix [[e^{2J},e^{−2J}],[e^{−2J},e^{2J}]] PSD iff J ≥ 0; vertex form 1 while \|E f\|² = 0 | holds |
| 5.2 `chessboard` | f ≡ −1, d = 0 vs d ≥ 1 | \|T\| = 1: 1 ≤ −1 false; (2L)^d even: 1 ≤ 1 | holds with d ≥ 1 |
| `gaussian_domination` | L = 1, d = 1 Ising | Z″(0) = −4J + e^{−4J}(32J² − 4J) ≤ 0; max of e^{−4J}(8J−1) is 2e^{−3/2} ≈ 0.446 | holds |
| 5.4 `infrared_bound` | Gaussian torus field; L = 1, d = 1 Ising | E/(2(\|b\|−dJ)+JE) < 1/J, sharp; max 4J(1−tanh 2J) ≈ 0.557; ADC constant fails at J = 0.375 | holds |
| `ising_longRangeOrder` | d = 3 | I₃ = W/2 ≈ 0.2527 = G(0)/6; Peled–Spinka constant (1/(2J))·2I_d = I_d/J | holds |
| 6.3 `exists_unique_gaussianProcess` | K = [[1,2],[2,1]]; I empty | excluded by PSD (Var(X₁−X₂) = −2); Dirac measure on the one point | holds |
| `isGaussianProcess_iff_wick` | random-sign field; Gaussian with mean | M₄ = (∫fh)⁴ ≠ 3(∫fh)⁴; M₁ ≠ 0 excluded by centring hypothesis | holds |
| 7.1 rescaled field | J = 0, ρ_I; tent, d = 1, R = 4L; δ₀ | Σ = (2L+1)^d, limit 2^{−d}∫f²; (2L²+1)/(3L(2L+1)) → ⅓; T ≡ 0 | holds |
| 7.3 `exists_reachableField` | 𝒞 = {(δ₀+δ₁)/2}; quarter-turn, d = 2 | limit 2^{−d}∫f is not flip-symmetric (even 𝒞 needed); T_{f∘g}(φ) = φ_{−e₂} = T_f(φ∘g⁻¹) | holds; locator R01 |
| 7.4 `gff_reachable` | d = 1, m = 1; d = 0 | C₁(1_Q,1_Q) = 1 + e⁻²; d = 0 ratio f(0)g(0); with p = q/L, q = 2πξ: L^{−(d+2)}Σ → C_m(f,g) | holds |

- Gate rerun at this head: every check 0, `OK`. `lake env lean` on `Suggested.lean`: exit 0, 29 `sorry` warnings and nothing else. Depcheck output: `depcheck: 247 roadmaps, 2328 edges, 0 problem(s)`.
- 82 source locators checked against the text: aizenman-duminilcopin-2021 40, sokal-1982 14, peled-spinka-2017 13, simon-2020-twelve-tales 7, frohlich-1982 5, lebowitz-ruelle-speer-2012 2, duminilcopin-2017-lectures 1. Only R01 fails.
- Library declarations opened at the pins: 54 Mathlib (every file and line the README cites) and 7 Tau Ceti (Countable.lean:165, Determinacy.lean:246, MixedMoments.lean:135, OddMoments.lean:102, Moments.lean:147, PerfectMatching.lean:129 and :619). All match.
- 8 cross-roadmap citations resolve. On main: StochasticCalculus §1.1, StandardDistributions §5.3 (Layer 5, "5.3"), ZerosOfLFunctions §5.5 (`hadamard_of_orderLE_one`, `OrderLE`), the PDE scope (PDE, Part II) and OperatorAlgebraDynamics D9. At the open head: RelativisticQuantumFieldTheory §7.1, §7.3, §7.6.
- `#check @` for all 60 declarations in one scratch file. Elaborated types agree with the README and no section binder is lost. `⁻¹` parses as `ofReal ((1 − 2dβ)⁻¹)` and `toNNReal ((2d + m²/L²)⁻¹)`.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `positivity`, `norm_num`) on all 29 theorems: none closes, so there is no padding. Of the 29, 22 are listed as end theorems in README line 5; the other 7 are named in their sections.
- The citation tool's two leads, `ReachabilityScheme.HasLimitLaw` and `.fieldLaw`, are false positives: `Suggested.lean` declares them at lines 636 and 627.
- No `set_option`, no `lemma`, no sorry'd data, a single `import Mathlib` plus `TauCeti.Combinatorics.Enumerative.PerfectMatching`, and no process words in either file.

Overlap check: read RelativisticQuantumFieldTheory, DimerModelsAndLozengeTilings, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, StandardDistributions, RandomMatrices and MathematicalStatisticsFoundations; the results-and-headings list is empty. Shared objects and their owners: Wick–Isserlis belongs to StandardDistributions §5.3 (cited); continuum Green kernels to RelativisticQuantumFieldTheory §7.1, §7.3 (cited); Kolmogorov extension to StochasticCalculus §1.1 (cited); DLR specifications to DimerModelsAndLozengeTilings (excluded here). No roadmap owns existence of Gaussian processes on an arbitrary index set, so ownership of 6.3 here stands.

Source independence: 82 locator passages plus 9 further passages compared with 7 sources, and a scan for shared runs of 7 or more words of the README and `Suggested.lean` against all 7 cached texts. Nothing is shared beyond reference titles and formula symbols. Largest share: aizenman-duminilcopin-2021, 52 of about 120 locators. Contents compared with aizenman-duminilcopin-2021: independent. Layer 2 ↔ §2, 3.4 ↔ §3.1, 4.4 ↔ §5.1, 5.1–5.4 ↔ §5.2, 6.1–7.3 ↔ §1.1–1.2; Layers 0, 1, 4.1–4.3 and 7.4 have no counterpart; §4, §6 and §7 have no layer; the order differs.

## Not verifiable

- sokal-1982 (2.17)–(2.30), (2.33), (3.4)–(3.5): the equation images are missing from the Numdam extraction, so the numbers were placed from the surrounding sentences only.
- sokal-1982 (2.27): the form of Newman's bound (signed or absolute Re z) is not visible. The README's \|Re z\| form was checked by computation instead (table row).
- frohlich-1982 (7), (12), (13), (33): formulas are images in the IHES scan. The sentences around them were checked.
- griffiths-simon-1973, aizenman-1982, frohlich-simon-spencer-1976, glimm-jaffe-1987, fernandez-frohlich-sokal-1992, friedli-velenik-2017, simon-1974: settled as uncertified and not read.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), p. 24: the source bounds E(p)Ŝ(p) by 1/(2\|J\|β), with \|J\| = 2dJ for the nearest-neighbour model; it should be 1/(Jβ) under (1.12) and (5.7), which the Gaussian torus field attains in the limit; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Definition 2.1(1), p. 8: the source allows block coefficients b_n of either sign; b = (1, −1) with a strong ferromagnetic K breaks the single-site Lebowitz inequality; it should require b_n ≥ 0, as Section 7.1 uses; affects a stated result.
- **Misprint** in peled-spinka-2017 at the Example after Proposition 2.15, p. 30: the source writes h̃(a − b) as ∫e^{ita}e^{itb}dν(t), which is h̃(a + b); it should be ∫e^{ita}e^{−itb}dν(t), with the second factor of (41) conjugated; affects the proof.
- **Misprint** in peled-spinka-2017 at Propositions 2.14–2.15, pp. 28–29: the source calls E[f(σ)g(Rσ)] positive semidefinite on complex-valued f; for f = i·g with g real it equals −(g, g); it should conjugate g(Rσ) or take real f; affects a stated result.

## For the human reviewers

- Scope: README lines 3, 23 and 752–780 assign the marginal-triviality goals 8.1–8.2 and several deferred topics to ConstructiveFieldTheoryPhi4PartII. No roadmap of that name exists on main, among the open pull requests or in the board's packages.
