# Review of ConstructiveFieldTheoryPhi4 (pull request #2432 at f2bf69c)

**Verdict:** needs changes

## Previous findings

The previous review, of this same head, listed no finding. Its two earlier findings stay repaired: `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/README.md` line 716 has "(Aizenman–Duminil-Copin, the paragraph after Definition 1.1 and footnote 2, p. 4; …)" at the existence sentence and "stated in this form by this roadmap" at the symmetry and variance claims; the description's Dependencies paragraph names the three suppliers on main and the open one.

## R01 (P3) — 3.2: both locators are cited for more than they state

**Location:** `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/README.md` line 332: "(Peled–Spinka, the paragraph after Theorem 2.3, p. 13; Sokal, Section 2.2, the sentence before property (a), p. 327)".

**Claim:** The target is for every even admissible ρ and every multi-index, in the couplings and in the volume. Each source states a special case, and the parenthesis does not say so, unlike 1.3, 3.1 and 7.4.

**Witness:** peled-spinka-2017 lines 515–526: monotonicity in `J{z,w}` of two-spin correlations of the spin O(n) model, n ∈ {1, 2}. sokal-1982 lines 401–404: monotonicity in the volume only, for the φ⁴ lattice model.

**Repair:** Replace the parenthesis by: "(Peled–Spinka, the paragraph after Theorem 2.3, p. 13, for the two-spin correlations of the spin O(n) model with n ∈ {1, 2} as functions of the couplings; Sokal, Section 2.2, the sentence before property (a), p. 327, for the monotonicity in the volume of the correlation functions of the φ⁴ lattice model; the statement for every even admissible ρ and every multi-index is this roadmap's, by the route below)".

## R02 (P3) — 1.5: the locator supports the limit kernel, not the convergence

**Location:** `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/README.md` line 221: "Prove that `G^{(R)}_μ(x, y)` is non-decreasing in R and converges, for μ > 0 in every dimension and for μ = 0 when d ≥ 3, to `G_μ(x − y) = …` (Fröhlich, the paragraph after (33), p. 13)."

**Claim:** The source gives the two-point function of the free field on the whole lattice. It has no box, no limit in R and no condition on (d, μ); those are the roadmap's.

**Witness:** frohlich-1982 lines 266–269: for λ = 0 the two-point function is that of the free Gaussian lattice field, written with the finite-difference Laplacian. README line 734 cites the same passage with that scope.

**Repair:** Replace the parenthesis by: "(Fröhlich, the paragraph after (33), p. 13, for the limit kernel, the two-point function of the free lattice field expressed through the finite-difference Laplacian; the monotone convergence of the Dirichlet box kernels and the range of (d, μ) are this roadmap's, by the Neumann series below and, at μ = 0, the integrability of `1/E(p)` near p = 0 exactly when d ≥ 3)".

## Verified sound

| Target | Instances tried | Values computed (README/Lean side vs computed) | Result |
|---|---|---|---|
| 0.1 admissibility | N(0,1); two sites J = 1; density `∝ exp(−φ² log(1+φ²))` | `∫e^{φ²/2}dN = ∞`; form `½(x²+y²) − xy` singular, Z = ∞; third law admissible, `∫e^{\|φ\|^α} = ∞` for α > 2 | holds |
| 0.2 φ⁴, Ising | b = 0 moments; b = 2λ; scaling s | `∫φ⁴ = Γ(5/4)/(λΓ(1/4)) = 1/(4λ)`; `∫φ² = 0.3380/√λ`; `−λφ⁴+2λφ² = −λ(φ²−1)²+λ`; image is `ρ_{λs⁻⁴, bs⁻²}` | holds |
| 1.4 continuity | `ρ_k = (1−e^{−k})δ₀ + ½e^{−k}(δ_k+δ_{−k})`, two sites J = 1 | `Z(ρ_k) ≥ ¼e^{k²−2k} → ∞`, `Z(δ₀) = 1` | holds; uniform bound needed |
| 1.5 Gaussian fields | two sites; d = 1 | det `4b² − J²`, covariance `J/(4b²−J²)`; `G_μ(0) = 1/(μ√(4+μ²)) → ∞` as μ → 0 | holds; R02 on the locator |
| 2.2 class, `isingBlock_tailControl` | CLT blocks; blocks scaled by `√N log N`; route steps (a), (d), (e) | `x_{N,j} ≤ 4/(π²N)`, `s_N(θ) = ½`; `∫e^{φ²} ≤ 1.022` at N = 1000; Paley–Zygmund 1/12; count `≤ S/(2θ)` | holds |
| 2.3 `phi4Measure_mem_griffithsSimonClass` | exponent at `m = φN^{−1/4}/c` | `N(g_N−1)m²/2 = bφ²`; `Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴`; `g_N > 0` iff `N > 4b²c⁴` | holds |
| 3.2 monotonicity | chain 0−1−2; V = {0, 2} ⊂ {0, 1, 2} | `tanh J₀₁ tanh J₁₂` increasing in both; `0 ≤ tanh² J` | holds; R01 on the locators |
| 3.6 `messager_miracleSole` | chain {0..3}; `J₀₂ = J₁₃ = K`; non-even ρ, J = 0 | `tanh J ≥ tanh² J`; `0 < tanh K` with hypothesis false; `−1/3 < −1/27`; coefficients `½(J_xy ± J_{x,Ry}) ≥ 0` | holds |
| 3.7 `phi4_secondMoment_le`, `newman_bound` | b = K = 0; two Ising sites J = 1, z = (1, −1) | `M = 1/(2√λ) ≥ 0.338/√λ`, root of `4λm² − (2b₊+K)m − 1`; `1.329 ≤ 5.822`, signed form 1.269 fails | holds |
| 4.1 monotone limits | d = 1 Ising; ρ = δ₀ | `tanh^{\|x\|} J` for every R ≥ \|x\|; 0 for positive degree, 1 for A = 0 | holds |
| 5.1 torus | L = 1, d = 1; L = 2, d = 1 | Lean count gives coupling 2J; `Ŝ(0) = 1 + tanh 2J`, `Ŝ(π) = 1 − tanh 2J`; 4-cycle `(t+t³)/(1+t⁴)` | holds |
| 6.1 random fields | `T_f = \|∫f\|` | `T_{−f} = T_f ≠ −T_f` | excluded |
| 6.3 `exists_unique_gaussianProcess` | `K = [[1,2],[2,1]]`; I empty | `Var(X₁ − X₂) = −2`, hypothesis false; unique μ is the point mass | holds |
| 6.4 `isGaussianProcess_iff_wick` | n = 0; n = 2, f_i = f; random-sign field | `1 =` one matching of `Fin 0`; `3M₂²`; `1 ≠ 3` | holds |
| 7.4 `gff_reachable` | d = 1; d = 0, m > 0; scaling | `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`, `1 + e^{−2}` at m = 1, `≈ 2/m`; both sides `N(0, f_i f_j)`; factor `L^{d+2}` | holds |
| `leeYang` | one site; two sites; J = −(ln 2)/2; V empty | `cosh(iπ/2) = 0` with Re h = 0; `cosh 2h = −e^{−2J}` forces Re h = 0; zero at `0.658 + 1.571i`; 1 | holds |
| `isingBlock_laplace_ne_zero`, `isingBlock_laplace_hasProd` | ρ_I; uniform on {−1,0,1}; δ₀ | `Σ((k+½)π)⁻² = ½`, cumulant `−12·(1/6) = −2`; `Σ = 1/3 = ½·(2/3)`; x = 0, product 1 | holds |
| `tendsto_gibbs_of_isingBlock` | blocks `½(δ_{−s_k}+δ_{s_k})`, s_k → s | `s_k² tanh(Js_k²) → s² tanh(Js²)`; at s = 0 both 0 | holds |
| `griffiths_first`, `griffiths_second` | two Ising sites; `(2δ₋₁+δ₁)/3`; J < 0 | `tanh J ≥ 0`, `1 − tanh² J ≥ 0`; mean −1/3; `tanh J < 0` | holds |
| `fkg_gibbs` | lattice gas `(δ₀+δ₁)/2`, two sites | covariance `(e^J − 1)/(3 + e^J)²`, sign of J | holds |
| `randomCurrent_representation` | two sites; V empty | `Σ_{n even} Jⁿ/n! = cosh J = ∫e^{−H}dρ_I^{⊗2}` (no factor `2^{\|V\|}`); 1 = 1 | holds |
| `switching_lemma` | A = B = {x, y}, F = 1; J = 0 | `sinh² J = cosh² J − 1`; `0 = 0` | holds |
| `gaussian_inequality` | n = 0; (x, x, y, y); non-member ε = ¼ | `1 ≤ 1`; `1 ≤ 1 + 2tanh² J`; `¼ > 3/16` | holds |
| `simon_lieb` | chain, Λ = {0}; block expansion | `tanh² J ≤ J tanh J`; block coupling `J_uv q_n q_m` sums to `J_uv⟨φ_oφ_u⟩_Λ⟨φ_vφ_y⟩` | holds |
| `exists_infiniteVolume_limit` | d = 0; J = 0; d = 1 Ising | μ = ρ; product measure; Markov chain with `P(same) = (1 + tanh J)/2`; `exp(a\|φ_x\|)` integrable, no junk integral | holds |
| `phi4_uniform_expMoment` | a > 0; a ≤ 0 | `⟨e^{a\|φ\|}⟩ ≤ 2e^{a²M/2}`, K the finite row sum; `≤ 1` | holds |
| `criticalPoint_ising_ge` | d = 1, β = ¼; d = 0 | `e^{1/2} = 1.649 ≤ 2`; χ = 1, `β_c = ⊤ ≥ (2·0)⁻¹ = ⊤` | holds |
| `twoPoint_reflection_monotone` | d = 2, small t | `t ≥ 2t² ≥ t²` at (1,0), (1,1), (2,0); third claim from `‖x‖₁ ≤ d‖x‖∞` | holds |
| `reflectionPositive` | L = 1, ε = 0; L = 1, ε = 1; general ε = 1 | R = id, `⟨\|f\|²⟩ ≥ 0`; matrix `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]` PSD iff J ≥ 0; `a+L ↦ a+L+1` | holds |
| `chessboard` | f ≡ −1; d = 0 | `1 ≤ 1` since `(2L)^d` even; `1 ≤ −1` false, excluded by d ≥ 1 | holds |
| `gaussian_domination` | L = 1, d = 1, Ising; d = 0 | `Z″(0) = −4J + e^{−4J}(32J² − 4J) ≤ 0`, max of `e^{−4J}(8J−1)` is 0.446; equality | holds |
| `infrared_bound` | L = 1, d = 1, Ising; Gaussian torus field | `4J(1 − tanh 2J) ≤ 0.557`; `E/(2(\|b\|−dJ) + JE) → 1/J`; source constant: 1.46 > 0.67 at J = 0.375 | holds; constant sharp |
| `ising_longRangeOrder` | d = 3; sum rule at L = 1 | `I₃ = W/2 = 0.2527`; `½((1+t) + (1−t)) = 1` | holds |
| `exists_reachableField` | quarter-turn g, `f = 1_{e₁}`; `(δ₀+δ₁)/2`; mixed ρ_n | `T_{f∘g} = φ_{−e₂} = T_f(φ∘g⁻¹)`; limit `2^{−d}∫f`, not symmetric; `2^{−d−1}∫f² < 2^{−d}∫f²` | holds |

- Source locators checked against the text: 71 (aizenman-duminilcopin-2021 34, sokal-1982 13, peled-spinka-2017 13, simon-2020-twelve-tales 4, frohlich-1982 4, lebowitz-ruelle-speer-2012 2, duminilcopin-2017-lectures 1); 69 support their statements, 2 are R01 and R02.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): 60, each at the file and line the README gives (54 Mathlib, 6 Tau Ceti); all present. No Ising, Gibbs-measure, Lee–Yang, Wick-pairing or Gaussian-process-existence declaration at either pin duplicates a target.
- Cross-roadmap citations resolved: 8. StochasticCalculus §1.1, StandardDistributions §5.3, ZerosOfLFunctions §5.5 with `hadamard_of_orderLE_one`, PDE (Scope and ownership) and OperatorAlgebraDynamics D9 on main; RelativisticQuantumFieldTheory §7.1, §7.3 and §7.6 at its open head 3708620.
- Gate rerun at f2bf69c: every check 0, `OK`. Dependency check: `depcheck: 248 roadmaps, 2377 edges, 0 problem(s)`. Nothing changed outside the folder.
- `lake env lean` on `Suggested.lean`: exit 0, 29 `sorry` warnings and nothing else. The 62 elaborated signatures were compared with the README: no binder lost, generality equal. One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a scratch copy: 0 of 29 theorems close.
- Pull-request text: title, summary block and prose agree with the head ("29 headline theorems", three suppliers on main, one open, PartII as the only named consumer).
- Overlap check: read RelativisticQuantumFieldTheory, DimerModelsAndLozengeTilings, MathematicalStatisticsNonparametric, PointProcesses, MathematicalStatisticsSemiparametric, MathematicalStatisticsAsymptotic, StandardDistributions, RandomMatrices; shared objects and owners: Wick–Isserlis moments, StandardDistributions §5.3 (cited); continuum Green kernels, RelativisticQuantumFieldTheory §7.1 and §7.3 (cited); the Gibbs specifications of DimerModelsAndLozengeTilings are a different object (this roadmap excludes the DLR formalism); nothing else shared.
- Source independence: 71 passages at their locators and 6 further passages (0.2 hard limit, 2.1 Lee–Yang route, 3.4 switching lemma, 5.2 reflection positivity, 7.2 reachability, the docstring of `exists_reachableField`) compared with 7 sources, and every run of 7 or more words shared with a source text is a bibliographic title: none shared; largest share aizenman-duminilcopin-2021, 52 of 120 locators; contents compared with aizenman-duminilcopin-2021 (its Sections 1 to 7): independent, since its Section 1 material is Layers 6–7, its Sections 2, 3 and 5 are parts of Layers 2, 3, 4 and 5, and Layers 0 and 1 have no counterpart.

## Not verifiable

- sokal-1982: the displayed equations are images in the text, so the numbers (2.17)–(2.30), (2.33) and (3.4)–(3.5) were matched by section, property letter and page only.
- frohlich-1982: the displayed formulas after (33) and at (7), (12), (13) are images; the surrounding sentences were read.
- griffiths-simon-1973, aizenman-1982, frohlich-simon-spencer-1976 (Theorem 1), glimm-jaffe-1987 (Chapters 4 and 6), fernandez-frohlich-sokal-1992 (Part I), friedli-velenik-2017 (Section 3.6, Chapter 10), simon-1974 (Chapter I): uncertified, cited by locator, not read.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), printed page 24: the source says the infrared bound is `E(p)Ŝ(p) ≤ 1/(2|J|β)` with `|J| = Σ_y J_{0,y}`; it should be `E(p)Ŝ(p) ≤ 2d/(|J|β)`, that is `1/(Jβ)` for nearest-neighbour strength J; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.2) with the standing assumption of Section 5, printed page 23: the source says the reflection inequality holds for an arbitrary common single-spin distribution satisfying (2.2); it should be for an even distribution, since `(2δ₋₁+δ₁)/3` with J = 0, A = {1}, B = {0, 1} gives −1/3 against −1/27; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at the list of reflections after (5.2), printed page 23: the source says a coordinate reflection sends `x_i` to `L − x_i` for a fixed L in ½ℤ; it should be L in ℤ, the hyperplane `x_i = L/2` passing through vertices or mid-edges; affects nothing.
- **Misprint** in simon-2020-twelve-tales at (5.19), printed page 36: the source says the shifted square is of `σ_α − σ_γ − h_α − h_β`, β being the inverse temperature of the same formula; it should be the square of `σ_α − σ_γ` shifted by the difference `h_α − h_γ`; affects nothing.

## For the human reviewers

- Scope: README lines 3, 23 and 754–780 hand the marginal-triviality goals 8.1–8.2 and several named estimates to ConstructiveFieldTheoryPhi4PartII; no roadmap of that name is on main, among the 458 open pull requests, in the board's packages or in the merge order.
- Licence: RelativisticQuantumFieldTheory's open head (README line 5575) cites a public Lean formalisation of the Gaussian free field, `LeanPool/OSforGFF`; this README names no existing formalisation, and `Suggested.lean` was not compared with that repository.
