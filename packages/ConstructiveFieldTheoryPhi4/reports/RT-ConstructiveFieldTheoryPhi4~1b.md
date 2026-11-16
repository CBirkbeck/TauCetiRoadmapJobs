<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17768#issuecomment-6904858621 -->
Red team round 1 pass b (claude) of 961d8dd

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `chessboard` is false at d = 0, which the Lean signature admits

   **Location.** `packages/ConstructiveFieldTheoryPhi4/Suggested.lean:487–493`: "theorem chessboard (d L : ℕ) [NeZero L] {J : ℝ} (hJ : 0 ≤ J) (ρ : Measure ℝ) [IsProbabilityMeasure ρ] (hρ : IsAdmissible ρ) (f : (Fin d → ZMod (2 * L)) → ℝ → ℝ) …".

   **Claim.** `|∫ ∏ v, f v (φ v)| ^ card ≤ ∏ w, ∫ ∏ v, f w (φ v)` for every `d : ℕ`.

   **Witness.** d = 0, L = 1, J = 0, ρ = δ₀, f ≡ −1. `Fin 0 → ZMod 2` has one point, the coupling sum is empty, Z = 1 and the Gibbs measure is ρ. Left side `|−1|¹ = 1`, right side `−1`. README Conventions (line 30) say d ≥ 1; the Lean dropped it.

   **Why only this declaration.** For d ≥ 1 the cardinality `(2L)^d` is even and each right-hand factor is a reflection-positive form, hence ≥ 0; at d = 0 the cardinality is 1 and nothing forces the factor to be nonnegative. The other Layer 5 theorems are safe at d = 0: `reflectionPositive` takes `j : Fin d` (vacuous), `infrared_bound` takes `k ≠ 0` (no such k), `gaussian_domination` has empty j-sums (equality), `ising_longRangeOrder` has `3 ≤ d`.

   **Repair.**

   1. In `Suggested.lean`, change the binder list of `chessboard` to carry the dimension hypothesis:

      ```lean
      theorem chessboard (d L : ℕ) [NeZero d] [NeZero L] {J : ℝ} (hJ : 0 ≤ J) (ρ : Measure ℝ)
          [IsProbabilityMeasure ρ] (hρ : IsAdmissible ρ) (f : (Fin d → ZMod (2 * L)) → ℝ → ℝ)
          (hf : ∀ v, Measurable (f v)) (hfb : ∃ C, ∀ v t, |f v t| ≤ C) :
      ```

      (statement unchanged) and begin its docstring "For `d ≥ 1`, `J ≥ 0`, …".
   2. In README §5.2 Checks add the negative control: "The dimension hypothesis d ≥ 1 is needed: on the one-point torus (d = 0) the estimate would read `|∫ f dρ| ≤ ∫ f dρ`, false for f ≡ −1; for d ≥ 1 the number of sites `(2L)^d` is even."

   **Tested on the refuting instance.** With `[NeZero d]`, d = 0 is not an instance. At d = 1, L = 1 (two sites, pair coupling 2J) the statement is `⟨f₀(φ₀)f₁(φ₁)⟩² ≤ ⟨f₀(φ₀)f₀(φ₁)⟩⟨f₁(φ₀)f₁(φ₁)⟩`, the Cauchy–Schwarz inequality of the edge-reflection form; with f₀ = f₁ ≡ −1 it reads 1 ≤ 1.

2. **F02** (P3) `criticalPoint_ising_ge` states less than its README target and its docstring

   **Location.** `packages/ConstructiveFieldTheoryPhi4/Suggested.lean:412–418`: docstring "for `0 ≤ β < 1/(2d)` the susceptibility is at most `1/(1 − 2dβ)`"; statement `((2 * d : ℝ≥0∞))⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure`. README §4.3, line 470: "Prove the high-temperature bound … (`criticalPoint_ising_ge`): for 0 ≤ β with 2dβ < 1, `χ(ρ_I, βJ^{nn}) ≤ 1/(1 − 2dβ)`".

   **Claim.** The README target named by this declaration is the quantitative susceptibility bound; the docstring repeats it.

   **Witness.** The elaborated type is only `∀ d, (2 * ↑d)⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure`: finiteness of χ below 1/(2d), with no bound. A proof of the Lean statement need not prove `χ ≤ 1/(1 − 2dβ)`.

   **Repair.** State the bound and keep the corollary:

   ```lean
   theorem criticalPoint_ising_ge (d : ℕ) :
       (∀ β : ℝ≥0, 2 * (d : ℝ) * β < 1 →
           susceptibility d (fun e ↦ (β : ℝ) * nnCoupling d e) isingMeasure ≤
             ENNReal.ofReal (1 / (1 - 2 * d * β))) ∧
         ((2 * d : ℝ≥0∞))⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure := by
     sorry
   ```

   **Tested.** d = 1, β = ¼: `χ = (1 + tanh ¼)/(1 − tanh ¼) = e^{1/2} ≈ 1.649 ≤ 2`. d = 0 (one site, no coupling): χ = 1 ≤ 1 for every β, and `(2·0)⁻¹ = ∞ ≤ β_c = ∞`. d = 1, β = 1: the hypothesis `2 < 1` fails, so nothing is asserted (χ = e² there). Re-run `#check @criticalPoint_ising_ge` after the edit.

Two findings: one P2 (a Lean statement false at a degenerate dimension the README excludes) and one P3 (a Lean statement weaker than its README target and its own docstring). Everything else I computed held; the record is in the tables below.

## Adversarial pass: record

### Suggested.lean theorems (29)

Context column: section variables actually used (from the elaborated signatures supplied in the job's `signatures.md`, compared one by one with the README statements).

| Declaration | Context | Instances and computed values | Result |
|---|---|---|---|
| `leeYang` | `[Fintype V] [DecidableEq V]`, J ≥ 0, Re h > 0 | V = ∅: integral 1. One site: cosh h, zeros `iπ(k+½)`. Two sites, equal h: `½(e^J cosh 2h + e^{−J})`, zero needs `cosh 2h = −e^{−2J} ∈ [−1,0)` ⇒ Re h = 0. J = −(ln 2)/2: zero at `±0.658 + 1.571i` | true; both hypotheses needed |
| `isingBlock_laplace_ne_zero` | `IsIsingBlock η` | N = 0: E ≡ 1. ρ_I: cosh h. Uniform on {−1,0,1}: `(1+2cosh h)/3`, zeros `i(±2π/3+2πk)`. q = (1,−1), K = (ln 3)/2: `(3+cosh 2h)/4` vanishes at `±0.881+1.571i` (excluded by `0 ≤ q`) | true |
| `isingBlock_laplace_hasProd` | same | δ₀: x ≡ 0, sum 0, product 1. ρ_I: `Σ((k+½)π)⁻² = ½`, `−12·Σ((k+½)π)⁻⁴ = −2 = 1 − 3`. Uniform: `(2π)⁻²·π²/sin²(π/3) = 1/3 = ½·⅔` | true |
| `isingBlock_tailControl` | α > 2 on the limit | Steps (a)–(f) recomputed: Paley–Zygmund gives 1/12; `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`; `(1+cSg²)^{S/2θ} e^{g²/4}` integrable. N(0,1) limit (growth fails): `s_N(θ) = ½`, moments diverge. `σ/(√N log N)` blocks: `∫e^{cφ²} ≤ (1−2c/log²N)^{−1/2}`, 1.022 at c = 1, N = 1000 | true; growth hypothesis needed |
| `tendsto_gibbs_of_isingBlock` | any J, continuous F | `½(δ_{−s_k}+δ_{s_k})`, two sites: `s_k² tanh(Js_k²) → s² tanh(Js²)`. V = ∅: Z = 1. Mixtures `(1−1/k)ρ_I + N(0,1)/k`, J ≥ 1: Z = ∞ (not blocks) | true |
| `phi4Measure_mem_griffithsSimonClass` | λ > 0 | Exponent `N(g−1)m²/2 − Nm⁴/12 = bφ² − λφ⁴` with `c = (12λ)^{−1/4}`, `g_N = 1+2bc²N^{−1/2}`; `g_N > 0` iff `N > 4b²c⁴` for b < 0 | true |
| `griffiths_first`, `griffiths_second` | even admissible ρ, J ≥ 0 | Two Ising sites: `tanh J ≥ 0`, `1 − tanh²J ≥ 0`. `(2δ₋₁+δ₁)/3`, J = 0: `⟨φ⟩ = −1/3`. J < 0: `tanh J < 0` | true |
| `fkg_gibbs` | admissible ρ, J ≥ 0 | Lattice gas: covariance `(e^J − 1)/(3+e^J)²`, sign of J. One site F = G: variance | true |
| `randomCurrent_representation` | J ≥ 0 | With ρ_I a probability measure no factor `2^{|V|}`: two sites, even n: cosh J = Z; odd n: sinh J. Singleton A: 0 = 0 | true |
| `switching_lemma` | J ≥ 0 | Two sites, A = B = {x,y}, F ≡ 1: `sinh²J = cosh²J − 1`. J = 0, A = {x,y}, B = ∅: 0 = 0 | true |
| `gaussian_inequality` | ρ in class | n = 0: 1 ≤ 1 (one matching of `Fin 0`). (x,x,y,y) Ising: `1 ≤ 1 + 2tanh²J`. Non-member ε = ¼: `¼ > 3/16` | true |
| `simon_lieb` | ρ in class | Chain 0−1−2, Λ = {0}: `tanh²J ≤ J tanh J`. Block reduction: multiply by `q_i q_j q_n q_m ≥ 0` and sum | true |
| `messager_miracleSole` | even admissible ρ | Chain {0,1,2,3}: `tanh J ≥ tanh²J`, `1 ≥ tanh³J`. Only `J₀₂ = J₁₃ = K`: `0 < tanh K` (hypothesis `hJP` fails). Non-even ρ, J = 0: `−1/3 < −1/27`. Quadratic form in (s,t): coefficients `½(J_{xy} ± J_{x,Ry})`, no s·t term | true |
| `phi4_secondMoment_le` | λ > 0, any-sign J | `4λm² ≤ 1 + (2b₊+K)m` at the maximal site; `M(λ,0,0) = 1/(2√λ) ≥ 0.338/√λ` | true |
| `newman_bound` | ρ in class | ρ_I: `cosh a ≤ e^{a²/2}`. z = (1,−1), J = 1: 1.329 ≤ 5.822 (signed form 1.269 fails). ε = ¼, a = 2: 1.691 > 1.649 (non-member) | true |
| `exists_infiniteVolume_limit` | even admissible, exp. moments | d = 0: one site, μ = ρ. d = 1 Ising: Markov chain, `P(same) = (1+tanh J)/2`. J = 0: `infinitePi` | true |
| `phi4_uniform_expMoment` | λ > 0 | `⟨e^{a|φ|}⟩ ≤ 2e^{a²M/2}` with M of `phi4_secondMoment_le`, K the (finite) row sum | true |
| `criticalPoint_ising_ge` | none | d = 0: ∞ ≤ ∞. d = 1: `χ = e^{2β}`, β_c = ∞ | true, but weaker than target (R02) |
| `twoPoint_reflection_monotone` | even admissible, J ≥ 0 | d = 0: no `i`. d = 1: `tanh^n J`. d = 2 small t: `t ≥ 2t² ≥ t²`. `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞` | true |
| `reflectionPositive` | J ≥ 0, admissible | L = 1, ε = 0: R = id, `∫|f|² ≥ 0`. L = 1, ε = 1, d = 1: matrix `[[e^{2J}, e^{−2J}],[e^{−2J}, e^{2J}]]` PSD iff J ≥ 0. Half `{1..L}` maps to `{0, 2L−1, …, L+1}` | true |
| `chessboard` | J ≥ 0, admissible | d = 0, f ≡ −1: 1 ≤ −1 | **false at d = 0 (R01)** |
| `gaussian_domination` | J ≥ 0, admissible | L = 1, d = 1 Ising: second derivative `−4J + e^{−4J}(32J²−4J) ≤ 0` since `max e^{−4J}(8J−1) = 2e^{−3/2} ≈ 0.45`. General ρ, L = 1, d = 1: `∫e^{−J(s+u)²} d(ρ̃∗ρ̃⁻)` maximal at u = 0 (Fourier transform `|ρ̂|² ≥ 0`). J = 0: equality | true |
| `infrared_bound` | J > 0 | d = 1, L = 1: `4J(1−tanh 2J) ≤ 0.557`. d = 2, L = 1, k = (1,1): `8J·Ŝ` = 0.69, 0.67, 0.61 at J = 0.2, 0.25, 0.3. Gaussian: `E/(2(|b|−dJ)+JE) < 1/J` | true; constant sharp |
| `ising_longRangeOrder` | d ≥ 3, J > 0 | `I₃ = W/2 ≈ 0.2527 = 1.516/6`; sum rule L = 1, d = 1: `½((1+t)+(1−t)) = 1` | true |
| `exists_unique_gaussianProcess` | any `I : Type*` | I = ∅: Dirac. `[[1,2],[2,1]]`: `hpsd` fails at c = (1,−1): −2 | true |
| `isGaussianProcess_iff_wick` | centred, all moments | n = 0: 1 = 1. f_i = f: `M₄ = 3M₂²`. Random sign: `M₄ = M₂²` fails | true |
| `exists_reachableField` | convergent scheme | ρ_I, J = 0: variance `→ 2^{−d}∫f²`. `(δ₀+δ₁)/2`: deterministic `2^{−d}∫f`, not symmetric. Rotation by a quarter turn: `T_{f∘g}(φ) = T_f(φ∘g⁻¹) = φ_{−e₂}`. A limit ν is automatically a probability measure (g ≡ 1) | true |
| `gff_reachable` | m > 0, or m = 0 and d ≥ 3 | `2|b| = 2d + m²/L²`. d = 1: `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³` (`1+e⁻²` at m = 1; ~2/m as m → 0). d = 0, m > 0 (admitted by the Lean, outside the README's d ≥ 1): both sides N(0, f_i(0)f_j(0)) | true |

### Definitions (30 `def`/`abbrev`, 3 of them in the namespace of the 1 structure)

| Declaration(s) | Value computed | Wrong model excluded by |
|---|---|---|
| `IsAdmissible` | δ_a: `e^{ca²}`; N(0,1): `∫e^{φ²/2} = ∞` | "some c" would admit N(0,1), then Z = ∞ at J ≥ 1 |
| `phi4Measure` | `∫φ⁴dρ_{λ,0} = 1/(4λ)`, `∫φ² = 0.338/√λ` | sign of b: `γ_{−1/2}` = N(0,1) |
| `isingMeasure` | mass 1, second moment 1 | — |
| `hamiltonian`, `partitionFunction`, `gibbsMeasure` | two sites: H(1,1) = −J, Z = cosh J, tanh J; three sites: `(e^{3J}+3e^{−J})/4` | doubled sum: tanh 2J = 4/5 at J = (ln 3)/2; halved: 2−√3 |
| `isingBlockMeasure`, `IsIsingBlock`, `griffithsSimonClass` | Griffiths' trick K = (ln 2)/2: `¼e^K = ½e^{−K}`; `s² tanh(Js²)` | mixed signs: `16ε > 48ε²` for ε < 1/3 |
| `Edge`, `sources`, `currentWeight` | `Σ_n w = e^J`; `J⁰/0! = 1` at J = 0 | no factorial: `1/(1−J)` |
| `box`, `boxGibbs`, `nnCoupling` | `(2R+1)^d` points; `|J| = 2d` | — |
| `twoPoint`, `susceptibility`, `criticalPoint` | d = 1: `t^{|x|}`, `(1+t)/(1−t)`, ∞; δ₀: 0, 0, ∞ | — |
| `torusCoupling`, `torusSymbol`, `structureFactor`, `infraredConstant` | L = 1, d = 1: coupling 2J, E(π) = 4, `Ŝ(π) = 1 − tanh 2J`; 4-cycle `(t+t³)/(1+t⁴)` | one bond per pair at L = 1 would give tanh J |
| `IsRandomField` | `T_f = |∫f|` fails: `T_{−f} ≠ −T_f` | — |
| `latticePoint`, `blockSecondMoment`, `rescaledField` | chain of three: `3+4t+2t²`; tent with R = 4L: `(2L²+1)/(3L(2L+1)) → 1/3`; Σ = 0 ⇒ T ≡ 0 | R = L: second moment 0 |
| `ReachabilityScheme`, `.fieldLaw`, `.HasLimitLaw`, `.Converges` | telegraph field `e^{−c|u−v|}`; Cauchy fails `integrable_sq` | order of limits: k then n |
| `gffCovariance` | d = 1: Fourier transform of `e^{−m|x|}/(2m)` is `1/(m²+4π²ξ²)` | kernel `e^{−2πi⟨x,ξ⟩}` |

### README targets without a Lean declaration (values recomputed)

| Target | Values | Result |
|---|---|---|
| 0.2 scaling, moments, hard limit | image under φ ↦ sφ is `ρ_{λs⁻⁴, bs⁻²}`; `λ^{−k/2}Γ((2k+1)/4)/Γ(1/4)` | true |
| 1.1 stability bound | `−H ≤ ½‖J‖Σφ_x²` | true |
| 1.3 derivative | `d/dJ tanh J = 1 − tanh²J` | true |
| 1.4 continuity | `Z(ρ_k) ≥ ¼e^{−2k}e^{k²}` without the uniform bound | true |
| 1.5 Gaussian fields | two sites: `J/(4b²−J²)`, `2|b|/(4b²−J²)`; `G_μ(0) = 1/(μ√(4+μ²))` in d = 1 | true |
| 2.1 Lee–Yang route | `|1+az₁|² − |a+z₁|² = (1−a²)(1−|z₁|²)`; contraction set `{−uv}` = `{|z| ≥ 1}` | true |
| 3.2 monotonicity | `(2δ₋₁+δ₁)/3`, two sites: `⟨φ₀⟩ = −3e^J/(5e^J+4e^{−J})`, from −1/3 towards −3/5 | true |
| 3.7 identity | `⟨∂F⟩ = ⟨F(4λφ³ − 2bφ − ΣJφ_y)⟩`; diagonal Check `1 − Γ(3/4)/Γ(1/4) ≈ 0.662` | true |
| 4.3 API | `3 − 4t + 2t² = 2(1−t)² + 1`; counterexample `−1/5`; `χ(¼) = e^{1/2}` | true |
| 5.1 API | Parseval `ΣΣ(φ_x−φ_{x+e_j})² = |T|⁻¹ΣE|φ̂|²` | true |
| 5.4 quadratic form, sum rule | h = (1,−1): `(h,−Δh) = 8`, `32J(1−tanh 2J) ≤ 8` | true |
| 6.2, 6.4 | `e^{−|x|²−|y|²} ≤ e^{−|x−y|²/2}`; `G_n[S₂]` locally integrable | true |
| 7.1 API | Σ = 0 iff ρ = δ₀ (sum of independent variables a.s. constant) | true |
| 7.3 strict variance Check | lattice variance `→ 2^{−d}∫f²`, limit `2^{−d−1}∫f²` | true |
| 7.4 route | `L^{−(d+2)}ΣΣ… = (2π)^{−d}∫ conj(F_L)H_L/(L²E(q/L)+m²)`; `L²E(q/L) ≥ (4/π²)|q|²`; `Γ(d/2−1)/(4π^{d/2})` = `1/((d−2)|S^{d−1}|)` | true |
| 8.1, 8.2 Checks (not targets) | Gaussian susceptibility `1/(2(|b|−dβ))`, `L²/m²` at β = 1 | consistent |

## Dependency check

```
depcheck: 237 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `merge-order/ORDER.txt` has ZerosOfLFunctions at line 51, StochasticCalculus 225, RelativisticQuantumFieldTheory 226 and this roadmap 227; StandardDistributions is on main.

## Verified sound

- **Declarations read:** all 60 of `Suggested.lean` (29 theorems, 30 definitions, 1 structure), every line; each compared with its elaborated type in the job's `signatures.md` (62 entries) and with the README. No section binder is lost. I ran no Lean; nothing in the file was changed, so the supplied elaboration stands.
- **Targets read:** every line of the README (Layers 0–7, 34 subsections, and the two downstream statements).
- **Checks tested:** all 134 Check bullets read and every one with a computable value recomputed by hand (the tables above carry the values); none false, vacuous or a restatement. Every definition has at least three.
- **Pinned declarations:** 41 Mathlib and 5 Tau Ceti `file:line` citations opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d): all 46 are at the stated line. `multivariateGaussian` is the Dirac mass for a non-PSD matrix (Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166–176), which the README's contract respects. Tau Ceti has only the fourth mixed Gaussian moment and vanishing odd moments (TauCeti/Probability/Distributions/Gaussian/MixedMoments.lean, OddMoments.lean), not the general pairing formula, so citing StandardDistributions §5.3 is right. Mathlib has no general Kolmogorov extension (its Brownian file says so, lines 24–26).
- **Sibling citations checked (6):** StochasticCalculus §1.1 (arbitrary-index extension on standard Borel spaces, with uniqueness: present); StandardDistributions §5.3 ("Mixed moments": integrability, odd products, pairings, PSD covariance: present); ZerosOfLFunctions §5.5 and `hadamard_of_orderLE_one` (hypotheses `Differentiable`, `f 0 ≠ 0`, `OrderLE f 1`: as cited); RelativisticQuantumFieldTheory §7.1 and §7.3 item 1 at its open head (multiplier `(4π²‖ξ‖²+m²)⁻¹`, heat integral, exterior decay for 0 < c < m, radial massless solution for n ≥ 3, unsubtracted limit: present); PDE scope paragraph on the stochastic programme; OperatorAlgebraDynamics D9.
- **Ownership:** searched main and the open heads by object (Lee–Yang, Griffiths, random current, Ising, Gibbs measure, FKG, chessboard, infrared bound, reflection positivity, Gaussian free field, white noise, covariance kernel, Kolmogorov extension, Curie–Weiss). No other roadmap states these objects; RelativisticQuantumFieldTheory's reflection positivity and infrared mentions concern Osterwalder–Schrader fields, and DimerModelsAndLozengeTilings mentions the Gaussian free field once as out of scope. This roadmap is the owner of what it states. No Lean name here is the fully qualified name of a declaration in another roadmap (all are under `TauCetiRoadmap.ConstructiveFieldTheoryPhi4`).
- **Headline theorems:** the 22 end theorems named in README line 5 are all stated. The seven further theorems (`isingBlock_laplace_ne_zero`, `isingBlock_laplace_hasProd`, `randomCurrent_representation`, `phi4_secondMoment_le`, `phi4_uniform_expMoment`, `criticalPoint_ising_ge`, `twoPoint_reflection_monotone`) are each named in the README and none follows by one tactic or one library lemma, so I report no padding.
- **Policy:** the pull request changes only the package folder (five files); no pull-request numbers or process narrative in the README or docstrings; `theorem` throughout; no `set_option`; imports are `import Mathlib` plus `TauCeti.Combinatorics.Enumerative.PerfectMatching`, which exists at the pin.
- **Locators verified (47)** against the cached texts: `aizenman-duminilcopin-2021` (1.5)–(1.7), (1.8), (1.10)–(1.12), (1.14)–(1.15), Definition 1.1 and footnote 2 (lines 139–187), Theorem 1.2 (line 190), Definition 2.1 and (2.2)–(2.4) (lines 363–402), Definition 3.1 and (3.1)–(3.4) (lines 421–438), Lemma 3.3 (line 474), (3.11) (line 520), (5.1)–(5.10) with Proposition 5.1 (lines 1019–1091), Lemma 5.7 (line 1314), Theorem 7.1 and Proposition 7.2 (lines 2006–2014); `peled-spinka-2017` Theorems 2.1, 2.3, 2.13, Lemma 2.4, Propositions 2.14–2.16, Corollary 2.17, (43), (48), (49), (52), (53), Sections 2.7.1–2.7.3 (pages as cited); `lebowitz-ruelle-speer-2012` (1.2) (line 67) and Lemma 2.4 (line 217); `simon-2020-twelve-tales` p. 25 (lines 1011–1021), (5.14)–(5.22) (lines 1501–1556); `frohlich-1982` (7), (12), (13), (33) and the paragraph after it (lines 83–269); `duminilcopin-2017-lectures` Corollary 1.9 (line 549); `sokal-1982` (2.29)–(2.30) and the Remark (lines 455–459).
- README 4.4 is stated for even admissible ρ while `aizenman-duminilcopin-2021` line 1041 assumes the growth condition (2.2); the roadmap proves it itself through 3.6, whose route I checked at that generality, so the wider hypothesis is supported.

Source independence: 9 passages compared with 5 sources (`aizenman-duminilcopin-2021` lines 167–171, 363–386, 421–428, 1023–1038, 1056–1091; `simon-2020-twelve-tales` lines 1011–1018; `frohlich-1982` lines 266–269; `lebowitz-ruelle-speer-2012` lines 217–222; `peled-spinka-2017` lines 1490–1493), none shared beyond formulas; largest share `aizenman-duminilcopin-2021`, 52 of 118 locators; contents compared with `aizenman-duminilcopin-2021` (its sections: introduction, the Griffiths–Simon class, random currents, intersection estimates, the two-point function, the improved tree diagram bound, the extension to the class): independent — the README's eight layers do not follow that run, and only Layer 2 and §3.4 share a scope with a source section, in an order the dependency lines 2.1 → 2.2 → 3.5 force.

## Not verifiable

- `sokal-1982`: the extraction lost most equation numbers, so (2.17)–(2.27), (2.33), Proposition 2.1, Lemma 2.2 and (3.4)–(3.5) could not be matched by number; only (2.29)–(2.30) and the Remark were found. The earlier repair report records line numbers for (3.4)–(3.5), which I did not re-derive.
- The seven sources recorded as uncertified (`griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`): cited by locator only; no text to compare.
- ConstructiveFieldTheoryPhi4PartII is on main at no head I can read and in no open pull request, so what the README says it owns (lines 3, 11, 23, 747–748, 751–773) cannot be checked against it. It is named only as a downstream consumer, never as a supplier, and the dependency check reports no problem.
- `frohlich-1982` lines 266–269 support the identification of the free lattice two-point function with `(−Δ + m²)⁻¹`; the displayed formulas are missing from the extraction, so whether the source also states the volume monotonicity that README §1.5 attaches to this locator could not be read. The README gives its own route (Neumann series) for that part.
- Truth of the Lean statements beyond the instances computed: no Lean was run in this pass.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), p. 24: the source says the infrared bound has right side one over twice |J|β with |J| the sum of the couplings at a site; it should be 2d/(|J|β), that is 1/(βJ) for bond coupling J; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at the list of reflections after (5.2), p. 23: the source says a coordinate is sent to L minus itself with L a half-integer; it should be 2L minus itself (the hyperplane at L), so that lattice points map to lattice points; affects nothing.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), p. 8: the source says block coefficients may be arbitrary real numbers; it should require them nonnegative, since weights (1, −1) with coupling (ln 3)/2 give a law with positive fourth cumulant; affects a stated result.

## For the human reviewers

- **Scope.** README lines 3, 23 and 747–773 assign the marginal-triviality theorems to ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in any open pull request; two of its goals are written out here with Checks, as non-targets.
- **Licence.** `frohlich-1982` was read as IHES preprint P/81/41 from the IHES archive; `sources.toml` records the host. I could not classify beyond "institutional repository".
- **Not tested.** `sokal-1982`, the second most cited source (17 locators), has an extraction without most equation numbers; wording and locators were compared at one passage only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "961d8dd99a6fbe7a6732472848ef32dea06135c2", "job": "RT-ConstructiveFieldTheoryPhi4~1b", "model": "fable", "worker": "chris-x89"} -->
