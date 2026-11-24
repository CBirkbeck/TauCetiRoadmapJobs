# Review of ConstructiveFieldTheoryPhi4 (pull request #2432 at f40ac5a)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check, proof route or locator of the folder was found false or unsupported, and both findings of the previous review are repaired. The mathematics was recomputed target by target (the Lee–Yang factorisation and tail control, the correlation inequalities, the infrared constant `1/J`, the real-scale reachability statements) and the values are in the table below. There are three small corrections and two format notes, none blocking. Two questions are left for the human reviewers (the consumer roadmap that does not exist yet, and a public formalisation the Lean was not compared with).

## Previous findings

- R01 of the previous review (3.2, both locators cited for more than they state): repaired. `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/README.md` line 265 now reads "for the two-spin correlations of the spin O(n) model with n ∈ {1, 2} as functions of each coupling; Sokal, … for the monotonicity in the volume … the statement for every even admissible ρ and every multi-index follows by the route below".
- R02 of the previous review (1.5, the locator supports the limit kernel, not the convergence): repaired. Line 154 now reads "for the limit kernel as the two-point function of the free lattice field, expressed through the finite-difference Laplacian; the convergence of the Dirichlet box kernels and the range of (d, μ) are this roadmap's", and the Neumann-series route covers μ = 0.

## C01 — The description's list of roadmaps named only as owners of excluded material is out of date

A reader of the description would not learn that the head now names two more roadmaps, one of them still an open pull request. The description says "PDE and OperatorAlgebraDynamics (D9) are named only as owners of material this roadmap excludes"; the head's Scope and ownership (README line 732) also names DimerModelsAndLozengeTilings Layer 4 (§§4.1, 4.5, 4.6; on main) for DLR specifications, and GibbsMeasuresAndTheIsingModel (Layers 1–3, §§4.2–4.3, §5.2; an open pull request adding that roadmap) for finite-spin Gibbs measures, the plus and minus states and Peierls' argument, and line 689 names it again under Downstream consumers. All the cited sections exist where cited, and that roadmap's own scope assigns §§2.1, 3.1, 3.3 and Layers 4–5 here, so the split is consistent.

The sentence that would be right: "PDE, OperatorAlgebraDynamics (D9), DimerModelsAndLozengeTilings (Layer 4) and GibbsMeasuresAndTheIsingModel (an open pull request) are named only as owners of material this roadmap excludes; none is a supplier."

## C02 — The overview and the build guide say Layer 7 rests on Layers 1 and 6, while the layer itself also uses 3.2

An implementer planning the build from the top of the README would not schedule Layer 3 before Layer 7. Line 15 says "Layer 7 joins Layers 1 and 6" and line 21 "Layer 7 combines Layers 1 and 6 into reachable random fields"; the Dependencies of Layer 7 (line 683) say "Layers 1, 3 (through 3.2) and 6", and the *Needs:* of 7.1 (line 619) uses 3.2 for the monotonicity of the block second moment in R.

Adding "and 3.2 for the monotonicity of the block second moment" to the two sentences makes them agree with the layer.

## C03 — Corollary 1.9 of Duminil-Copin's lectures is stated for the Potts model, not for the Ising model

In 4.2 (line 387) the locator reads "Duminil-Copin, Corollary 1.9, p. 14, for the Ising model". At duminilcopin-2017-lectures line 549 the corollary is about the infinite-volume free and monochromatic measures of the q-state Potts model, obtained as limits of the finite-volume ones through the random-cluster coupling; the Ising model is its case q = 2. The other locators of 4.2 already say what their sources cover.

"…, for the free and monochromatic measures of the q-state Potts model, whose case q = 2 is the Ising model" would say what the source states.

## N01 — "The last part follows Aizenman and Duminil-Copin" (line 11)

The sentence reads as a statement about the plan, although what is meant is that the notion is theirs. Would "The notion of a reachable random field is Aizenman and Duminil-Copin's" serve?

## N02 — The Ising energy of QuantumOptimization §1.1 is the same function on ±1 configurations in another convention, and the README does not say so

QuantumOptimization (on main) defines `ising J h` on `ι → Bool` as the sum over all ordered pairs, diagonal included, with the opposite sign. For a coupling J here and spins σ, `H_{V,J}(σ)` is `ising (−J⁰/2) 0` (two sites: `−½(J + J)σ_xσ_y = −Jσ_xσ_y`). The carriers differ (real configurations and `Sym2` here), so nothing is owned twice; one clause in the Conventions or in Scope and ownership giving this dictionary would save a reader the computation.

## Verified sound

| Target | Instances tried | Values computed (README/Lean side against recomputation) | Result |
|---|---|---|---|
| 0.2 φ⁴, Ising | b = 0 moments; b = 2λ; scaling s | `∫φ⁴ = Γ(5/4)/(λΓ(1/4)) = 1/(4λ)`; `∫φ² = 0.33799/√λ`; `−λφ⁴+2λφ² = −λ(φ²−1)²+λ`; image `ρ_{λs⁻⁴,bs⁻²}` | holds |
| 1.1 Gibbs measure | two sites, `J = (log 3)/2`; three sites; N(0,1), J = 1 | `Z = 2/√3`, `tanh J = ½`, `tanh 2J = 4/5`, `tanh(J/2) = 2−√3`; `Z₃ = (e^{3J}+3e^{−J})/4`; Z = ∞ | holds |
| 1.3 coupling derivative | two Ising sites; J = 0 even ρ | `d/dJ tanh J = 1 − tanh²J`; `(∫φ²dρ)²`, 1 for ρ_I | holds |
| 1.5 Gaussian fields (previous R02) | two sites; d = 1 | det `4b² − J²`, covariance `J/(4b²−J²)`; `G_μ(0) = 1/(μ√(4+μ²))` | holds |
| 2.2 class, checks | CLT blocks; blocks scaled by `√N log N`; mixtures | `x_{N,j} ≤ 4/(π²N)`, mass ½; `(1−2/log²N)^{−1/2} = 1.0216` at N = 1000; moments `≤ (2n−1)!!`, Z = ∞ | holds |
| 2.3 Curie–Weiss limit | `m = φN^{−1/4}/c` | `N(g_N−1)m²/2 = bφ²`; `Nm⁴/12 = λφ⁴`; `g_N > 0` iff `N > 4b²c⁴`; far part `e^{−N/192}` | holds |
| 3.1 Griffiths route | Ginibre variables | `H+H′ = −¼Σ J(ss+tt)`; `∫∫(x+y)^m(x−y)^n ≥ 0` (zero unless m, n even) | holds |
| 3.2 monotonicity (previous R01) | `(2δ₋₁+δ₁)/3`, one against two sites | `⟨φ₀⟩ = −1/3` against `−3e^J/(5e^J+4e^{−J})`, `−3/5` as J → ∞ | holds |
| 3.4 currents | two sites; J = 0 | `Σ_{even} Jⁿ/n! = cosh J`, no factor `2^{|V|}`; `sinh²J = cosh²J − 1`; `0 = 0` | holds |
| 3.7 moment bounds | F = φ_x; b = K = 0; sum over all y | `1 = 4λ⟨φ⁴⟩ − 2b⟨φ²⟩ − ΣJ⟨φφ⟩`; `M = 1/(2√λ) ≥ 0.338/√λ`; 0.662 | holds |
| 4.1 monotone limits | d = 1 Ising; ρ = δ₀ | `tanh^{|x|}J` for R ≥ |x|; 0 in positive degree, 1 in degree 0 | holds |
| 4.2 infinite-volume law (C03) | d = 0; J = 0; d = 1 Ising | μ = ρ; product measure; Markov chain, `P(same) = (1+tanh J)/2` | holds |
| 4.3 two-point function | `c = δ₀−δ₁+δ₂`; d = 1, β = ¼, 1 | `3−4t+2t² = 2(1−t)²+1`; `3 − 16/5 = −1/5`; `e^{1/2} = 1.649 ≤ 2`; `e² = 7.389` | holds |
| 5.1 torus | L = 1; L = 2, d = 1 | Lean count gives 2J; `Ŝ(0), Ŝ(π) = 1 ± tanh 2J`; `(t+t³)/(1+t⁴)` | holds |
| 5.3 route | L = 1, d = 1 Ising; law of s = φ + τ | `Z″(0) = −4J + e^{−4J}(32J²−4J)`, max of `e^{−4J}(8J−1)` is 0.446; `W(s) = e^{−H^{per}(s)−dJΣs²}` | holds |
| 5.5 constant | d = 3; Peled–Spinka form | `I₃ = W/2 = 0.2527`, `G(0)/6`; `(1/2J)∫_{[0,1]^d} dt/Σ(1−cos πt_j) = I_d/J` | holds |
| 6.1 random fields | `T_f = |∫f|` | `T_{−f} = T_f ≠ −T_f` | excluded |
| 7.1 real scales (C02) | L = 3/2; tent, R = L and R = 4L; three-site chain | block {−1,0,1}, Σ = 3 (5 if rounded up, 3/5); 0 against `(2L²+1)/(3L(2L+1)) → 1/3`; `3+4t+2t²` | holds |
| 7.2–7.3 checks | telegraph chain; `(δ₀+δ₁)/2`; mixed ρ_n | `t^{|x−y|} = e^{−c|x−y|/L}`; `Σ ≈ N²/4`, limit `2^{−d}∫f`; `2^{−d−1}∫f² < 2^{−d}∫f²` | holds |
| `leeYang` | one site; two sites; `J = −(ln 2)/2`; V empty | `cosh(iπ/2) = 0`; `cosh 2h = −e^{−2J}` forces Re h = 0; zero at `0.658 + 1.571i`; 1 | holds |
| `isingBlock_laplace_ne_zero` | q = (1, −1), `K = (ln 3)/2` | `(3 + cosh 2h)/4` vanishes at `0.881 + 1.571i`; excluded by q ≥ 0 | holds |
| `isingBlock_laplace_hasProd` | ρ_I; uniform on {−1,0,1}; δ₀ | `Σ((k+½)π)⁻² = ½`, cumulant `−12/6 = −2`; `(2π)⁻²·4π²/3 = 1/3`; x = 0 | holds |
| `isingBlock_tailControl` | steps (a), (d), (e), (f) | Paley–Zygmund 1/12; `s_k(θ)log 2 ≤ θ log E_k(θ^{−1/2})`; count `≤ S/(2θ)`; `e^{2cg²s} ≤ e^{g²/4}` | holds |
| `tendsto_gibbs_of_isingBlock` | blocks `½(δ_{−s_k}+δ_{s_k})` | `s_k² tanh(Js_k²) → s² tanh(Js²)`; 0 at s = 0 | holds |
| `phi4Measure_mem_griffithsSimonClass` | α ∈ (2, 4), far part | `|φ| ≤ cN^{1/4}`, `e^{−N/192+O(√N)+c^αN^{α/4}} → 0` | holds |
| `griffiths_first`, `griffiths_second` | two Ising sites; `(2δ₋₁+δ₁)/3`; J < 0 | `tanh J ≥ 0`, `1 − tanh²J ≥ 0`; mean −1/3; `tanh J < 0` | holds |
| `fkg_gibbs` | lattice gas, two sites | covariance `(e^J − 1)/(3+e^J)²`, sign of J | holds |
| `randomCurrent_representation`, `switching_lemma` | two sites, A = B = {x, y} | `sinh J`; `sinh²J = cosh²J − 1` | holds |
| `gaussian_inequality` | n = 0; (x, x, y, y); x₁ repeated; ε = ¼ | `1 ≤ 1`; `1 ≤ 1 + 2tanh²J`; term j equals the left side; `¼ > 3/16` | holds |
| `simon_lieb` | chain, Λ = {0}; block expansion | `tanh²J ≤ J tanh J`; `Σ q_aq_bq_nq_m` terms sum to `J_uv⟨φ_oφ_u⟩_Λ⟨φ_vφ_y⟩` | holds |
| `messager_miracleSole` | chain {0..3}; `J₀₂ = J₁₃ = K`; non-even ρ, J = 0 | `tanh J ≥ tanh²J`; `0 < tanh K`, hypothesis false; `−1/3 < −1/27`; coefficients `½(J_xy ± J_{x,Ry})` | holds |
| `phi4_secondMoment_le` | quadratic at the maximal site | `4λm² − (2b₊+K)m − 1 ≤ 0`, root M | holds |
| `newman_bound` | two Ising sites, z = (1, −1); ε = ¼, a = 2 | `1.329 ≤ 5.822`, signed form 1.269 fails; `1.691 > 1.649` for the non-member | holds |
| `exists_infiniteVolume_limit`, `phi4_uniform_expMoment` | d = 0; a ≤ 0 | μ = ρ; `⟨e^{a|φ|}⟩ ≤ 2e^{a²M/2}`, K the finite row sum; `≤ 1` | holds |
| `criticalPoint_ising_ge` | Λ = {v}; d = 0 | `χ_v ≤ 1 + 2dβ max χ`; χ = 1, `⊤ ≤ ⊤` | holds |
| `twoPoint_reflection_monotone` | d = 2, small t | `t ≥ 2t² ≥ t²` at (1,0), (1,1), (2,0); `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞` | holds |
| `reflectionPositive` | L = 1, ε = 0 and 1 | R = id; matrix `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]`, det `e^{4J} − e^{−4J}` | holds |
| `chessboard` | f ≡ −1, d ≥ 1 and d = 0; L = 1, d = 1 | `1 ≤ 1`; `1 ≤ −1` false, excluded; Cauchy–Schwarz of the reflection form | holds |
| `gaussian_domination`, `infrared_bound` | h = (1, −1), L = d = 1; Gaussian torus field; J = 0.375 | `32J(1−tanh 2J) ≤ 8`, maximum 0.557 of `4J(1−tanh 2J)`; `E/(2(|b|−dJ)+JE) → 1/J`; source constant 1.46 > 0.67 | holds |
| `ising_longRangeOrder` | sum rule, L = 1 | `½((1+t)+(1−t)) = 1`; `|T|⁻²⟨(Σσ)²⟩ ≥ 1 − J⁻¹|T|⁻¹Σ_{p≠0}1/E(p)` | holds |
| `exists_unique_gaussianProcess` | `[[1,2],[2,1]]`; I empty | `Var(X₁−X₂) = −2`, hypothesis false; point mass | holds |
| `isGaussianProcess_iff_wick` | n = 0; f_i = f; random sign | 1 = one matching of `Fin 0`; `3M₂²`; `1 ≠ 3` | holds |
| `exists_reachableField` | quarter-turn g, `f = 1_{e₁}`; limit ν with ν(univ) = ∞ | `T_{f∘g} = φ_{−e₂} = T_f(φ∘g⁻¹)`; g = 1 gives 0 ≠ 1, so ν is a probability measure | holds |
| `gff_reachable` | d = 1; d = 0, m > 0; scaling | `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`, `1+e⁻²` at m = 1; both sides `N(0, f_i(0)f_j(0))`; factor `L^{d+2}` | holds |
| Scope and ownership (C01, N02) | QuantumOptimization `ising`, two sites | `ising (−J⁰/2) 0 = −Jσ_xσ_y = H(σ)` | different carrier |

- Source locators checked against the text: 58 (aizenman-duminilcopin-2021 31, peled-spinka-2017 12, sokal-1982 8, simon-2020-twelve-tales 4, lebowitz-ruelle-speer-2012 2, frohlich-1982 1); all support their statements at the stated page; duminilcopin-2017-lectures Corollary 1.9 is C03.
- Library declarations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): 62 file-and-line citations, all present at the line given; `TauCeti.PerfectMatching` is the subtype of fixed-point-free involutions that the Lean uses through `π.1`. No Ising, Gibbs-measure, Lee–Yang, random-field or Gaussian-process-existence declaration at either pin duplicates a target.
- Cross-roadmap citations resolved: 12. On main: StochasticCalculus §1.1 (arbitrary-index extension), StandardDistributions §5.3 (Wick–Isserlis in every degree), ZerosOfLFunctions §5.5 (`hadamard_of_orderLE_one`), DimerModelsAndLozengeTilings §§4.1, 4.5, 4.6, PDE (Part II stochastic programme), OperatorAlgebraDynamics D9. At open heads: RelativisticQuantumFieldTheory §§7.1, 7.3, 7.6; GibbsMeasuresAndTheIsingModel Layers 1–3, §§4.2–4.3, §5.2.
- Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder. The automatic checks all passed on this head.
- `lake env lean` on `Suggested.lean`: exit 0, 29 `sorry` warnings and nothing else. The elaborated types of the 62 declarations were compared with the README: no binder lost, generality equal, real scales in 7.1–7.4 on both sides. One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact?`) on a copy of the file: 0 of 29 theorems close (27 fail, 2 time out).
- Pull-request text: title, summary block, "29 headline theorems", three suppliers on main and one open, all agree with the head; C01 is the one sentence that does not.

Overlap check: read GibbsMeasuresAndTheIsingModel, CurieWeissModel, GlauberDynamicsOfTheIsingModel, HopfieldModelThermodynamics, RelativisticQuantumFieldTheory, BernoulliPercolation, StandardDistributions, MathematicalStatisticsAsymptotic; shared objects and owners: Wick–Isserlis moments, StandardDistributions §5.3 (cited); continuum Green kernels, RelativisticQuantumFieldTheory §§7.1, 7.3 (cited); DLR Gibbs measures, plus and minus states, Peierls, GibbsMeasuresAndTheIsingModel (cited as owner, and it assigns GKS, Lee–Yang, real-spin FKG and Layers 4–5 here); the critical Curie–Weiss scaling limit of 2.3 is excluded by CurieWeissModel; Harris's inequality on Bernoulli sets (BernoulliPercolation) and finite-graph Ising laws on ±1 configurations (GlauberDynamicsOfTheIsingModel) are different carriers; nothing owned twice.

Source independence: 58 passages at their locators and 7 further passages (0.2 hard limit, 2.2 class definition, 2.3 block limit, 3.6 list of reflections, 5.3 route, 7.2 reachability, the docstring of `leeYang`) compared with 7 sources, none shared beyond formulas and standard names; largest share aizenman-duminilcopin-2021, 52 of about 119 locators; contents compared with aizenman-duminilcopin-2021 (Sections 1 to 7): independent, since its Section 1 material is Layers 6–7, its Sections 2, 3.1 and 5.1–5.2 are parts of Layers 2, 3, 4 and 5, its Sections 4, 5.3–5.6 and 6 have no counterpart, and Layers 0 and 1 have none in it.

Research link: Layers 2–7 are the lattice inputs of the marginal-triviality theorem of Aizenman and Duminil-Copin (2021) and of the d ≥ 5 results of Aizenman (1982) and Fröhlich (1982); Layer 5 is the infrared bound of Fröhlich–Simon–Spencer (1976). Rests on the README's downstream goals 8.1–8.2 and on aizenman-duminilcopin-2021, Sections 1, 5 and 7.

## Not verifiable

- sokal-1982: the displayed equations are images in the text, so (2.17)–(2.30), (2.33) and (3.4)–(3.5) were matched by section, property letter and printed page only.
- frohlich-1982: the displayed formulas after (33) and at (7), (12), (13) are images; the surrounding sentences were read.
- griffiths-simon-1973, aizenman-1982, frohlich-simon-spencer-1976 (Theorem 1), glimm-jaffe-1987 (Chapters 4 and 6), fernandez-frohlich-sokal-1992 (Part I), friedli-velenik-2017 (Section 3.6, Chapter 10), simon-1974 (Chapter I): uncertified, cited by locator, not read. In particular the d ≥ 5 clause of downstream goal 8.1, which rests on aizenman-1982, was not checked against that text.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), printed page 24: the source says the infrared bound is `E(p)Ŝ(p) ≤ 1/(2|J|β)` with `|J| = Σ_y J_{0,y}`; it should be `E(p)Ŝ(p) ≤ 2d/(|J|β)`, that is `1/(Jβ)` for nearest-neighbour strength J; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.2) with the standing assumption of Section 5, printed page 23: the source says the reflection inequality holds for an arbitrary common single-spin distribution satisfying (2.2); it should be for an even distribution, since `(2δ₋₁+δ₁)/3` with J = 0, A = {1}, B = {1, 2} gives −1/3 against −1/27; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at the list of reflections after (5.2), printed page 23: the source says a coordinate reflection sends `x_i` to `L − x_i` for a fixed L in ½ℤ; it should be L in ℤ, the hyperplane `x_i = L/2` passing through vertices or mid-edges; affects nothing.
- **Misprint** in simon-2020-twelve-tales at (5.19), printed page 36: the source says the shifted square is of `σ_α − σ_γ − h_α − h_β`, β being the inverse temperature of the same formula; it should be the square of `σ_α − σ_γ` shifted by the difference `h_α − h_γ`; affects nothing.

## For the human reviewers

- Scope: README lines 13, 687–713 and 729 hand the marginal-triviality goals 8.1–8.2 and several named estimates to ConstructiveFieldTheoryPhi4PartII; no roadmap of that name is on main, among the open pull requests, in the board's packages or in the merge order.
- Licence: RelativisticQuantumFieldTheory's open head (its Provenance section) cites a public Lean formalisation of the Gaussian free field, `LeanPool/OSforGFF`; this README names no existing formalisation, and `Suggested.lean` was not compared with that repository.
