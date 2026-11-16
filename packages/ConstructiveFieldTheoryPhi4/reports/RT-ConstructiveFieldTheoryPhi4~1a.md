<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17768#issuecomment-6904847837 -->
Red team round 1 pass a (claude) of 961d8dd

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `chessboard` is false at d = 0

   **Location.** `packages/ConstructiveFieldTheoryPhi4/Suggested.lean:487–493`: "theorem chessboard (d L : ℕ) [NeZero L] {J : ℝ} (hJ : 0 ≤ J) …"; `packages/ConstructiveFieldTheoryPhi4/README.md:533` (§5.2) and `README.md:511` ("Throughout, ρ is admissible, J ≥ 0, L ≥ 1").

   **Claim.** For every `d : ℕ`, `|⟨Π_v f_v(φ_v)⟩|^{|T_L|} ≤ Π_w ⟨Π_v f_w(φ_v)⟩`.

   **Witness.** d = 0: `Fin 0 → ZMod (2L)` has one point, the only `Sym2` element is diagonal, so the Gibbs measure is ρ. With `f ≡ −1` the left side is `|−1|¹ = 1` and the right side is `−1`.

   **Why it matters.** The estimate needs `|T_L| = (2L)^d` even, which holds exactly for d ≥ 1. The README says d ≥ 1 in the Conventions, but the Lean signature does not carry it.

   **Repair.**
   - `Suggested.lean`: add the binder `(hd : 1 ≤ d)` to `chessboard`, after `(d L : ℕ) [NeZero L]`. Add to its docstring: "for `d ≥ 1`, so that `|T_L| = (2L)^d` is even".
   - `README.md:511`: change "ρ is admissible, J ≥ 0, L ≥ 1" to "d ≥ 1, ρ is admissible, J ≥ 0, L ≥ 1".
   - `README.md` §5.2 Checks, add: "With all `f_v ≡ −1` both sides equal 1, because `|T_L| = (2L)^d` is even for d ≥ 1; on a one-point torus (d = 0) the estimate would read `1 ≤ −1`, so d ≥ 1 is used."

   **Repair tested on the witness.** With `hd : 1 ≤ d` the instance d = 0 is excluded. For d ≥ 1 and `f ≡ −1`: left `|(−1)^{(2L)^d}|^{(2L)^d} = 1`, right `Π_w (−1)^{(2L)^d} = 1`.

   The other Layer 5 theorems were tested at d = 0 and hold: `infrared_bound` is vacuous (no `k ≠ 0`), `gaussian_domination` reads `1 ≤ 1`, `reflectionPositive` has no `j : Fin 0`, and `ising_longRangeOrder` assumes `3 ≤ d`.

2. **F02** (P3) `criticalPoint_ising_ge` states less than the README attaches to its name

   **Location.** `README.md:470`: "(`criticalPoint_ising_ge`): for 0 ≤ β with 2dβ < 1, `χ(ρ_I, βJ^{nn}) ≤ 1/(1 − 2dβ)` … so that `β_c(ρ_I, J^{nn}) ≥ 1/(2d)`"; `Suggested.lean:412–417`.

   **Claim.** The README names the susceptibility bound; the docstring repeats it.

   **Witness.** The elaborated type is only `(2 * ↑d)⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure`. The bound `χ ≤ 1/(1 − 2dβ)` (for example `e^{1/2} ≤ 2` at d = 1, β = ¼) is not a consequence of the Lean statement.

   **Repair.** `README.md:470`: replace "(`criticalPoint_ising_ge`): for 0 ≤ β with 2dβ < 1, `χ(ρ_I, βJ^{nn}) ≤ 1/(1 − 2dβ)`, where … so that `β_c(ρ_I, J^{nn}) ≥ 1/(2d)`" by "for 0 ≤ β with 2dβ < 1, `χ(ρ_I, βJ^{nn}) ≤ 1/(1 − 2dβ)`, where `J^{nn}` is the nearest-neighbour coupling of strength 1 (`nnCoupling`), so that `β_c(ρ_I, J^{nn}) ≥ 1/(2d)` (`criticalPoint_ising_ge` states this last inequality)". In the docstring, replace "for `0 ≤ β < 1/(2d)` the susceptibility is at most `1/(1 − 2dβ)`" by "because the susceptibility is finite for `0 ≤ β < 1/(2d)` (README §4.3 gives the bound `1/(1 − 2dβ)`)".

3. **F03** (P3) the StandardDistributions contract asks for two facts the pinned Tau Ceti already proves

   **Location.** `README.md:16` and `README.md:88`: "every monomial in the coordinates is integrable, odd products have mean zero, and `E[Z_{i_1} ⋯ Z_{i_{2n}}] = Σ_π …`" (all three attributed to StandardDistributions §5.3).

   **Witness.** At the Tau Ceti pin: `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` (TauCeti/Probability/Distributions/Gaussian/MixedMoments.lean:135) and `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (TauCeti/Probability/Distributions/Gaussian/OddMoments.lean:102). Both hold for any matrix `S`, with repeated coordinates.

   **Repair.**
   - `README.md` "From Tau Ceti", add: "`TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` (TauCeti/Probability/Distributions/Gaussian/MixedMoments.lean:135) and `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (TauCeti/Probability/Distributions/Gaussian/OddMoments.lean:102): every monomial in the coordinates of a multivariate Gaussian vector is integrable, and every odd product of centred coordinates has mean zero. Used in 6.4."
   - `README.md:88`: reduce the StandardDistributions contract to the even-moment pairing formula: "§5.3 (mixed moments): for a centred random vector Z with law `ProbabilityTheory.multivariateGaussian 0 S`, S positive semidefinite, `E[Z_{i_1} ⋯ Z_{i_{2n}}] = Σ_π Π_{j=1}^n S_{i_{π(2j−1)} i_{π(2j)}}` with π over the pairings of {1, …, 2n}."
   - Adjust `README.md:16` and the *Needs:* and Dependencies lines of 6.4 and Layer 6 to match.
   - Optional: the 6.4 Check n = 2 can cite `TauCeti.Probability.integral_mul_mul_mul_multivariateGaussian` (MixedMoments.lean:162), the pinned fourth-moment case.

4. **F04** (P3) "pointwise" in the 6.2 decay bullet makes the equivalence false as written

   **Location.** `README.md:617`: "(1.10) is equivalent to the existence of a representative with `S_2(x, y) → 0` pointwise as |x − y| → ∞."

   **Claim.** The README's (1.10) is uniform: one r for each ε, for almost every (x, y) with |x − y| ≥ r.

   **Witness.** `S(x, y) = 1` if `|x − y| ≤ 1 + |x|`, else 0. For fixed x it vanishes once `|x − y| > 1 + |x|`, so it tends to 0 pointwise. But for every r the set `{|x − y| ≥ r, S = 1}` has positive measure (take |x| ≥ r), so (1.10) fails with ε = ½.

   **Repair.** Replace the clause by: "(1.10) is equivalent to the existence of a representative with `sup_{|x−y|≥r} |S_2(x, y)| → 0` as r → ∞."

   **Repair tested on the witness.** The supremum is 1 for every r, so the witness fails both sides.

One Lean statement is false as typed in a degenerate case (R01, P2). The other three findings are P3.

## Adversarial pass record

Each row gives the instances tried and the values computed. "ok" means the statement held on every instance.

### Suggested.lean declarations

| Declaration (context) | Instances | Values computed | Result |
|---|---|---|---|
| `IsAdmissible`, `phi4Measure`, `isingMeasure` (no variables) | δ_a; N(0,1); ρ_{λ,0} | `∫e^{cφ²}dδ_a = e^{ca²}`; `∫e^{φ²/2}dN = ∞`; `∫φ⁴dρ_{λ,0} = Γ(5/4)/(λΓ(1/4)) = 1/(4λ)` | ok |
| `hamiltonian`, `partitionFunction`, `gibbsMeasure` (`[Fintype V] [DecidableEq V]`) | V empty; two Ising sites; three sites; N(0,1) with J = 1 | Z = 1; `Z = cosh J`, `⟨σσ⟩ = tanh J` (`2/√3`, `½` at `J = (ln 3)/2`); `Z = (e^{3J}+3e^{−J})/4`; Z = ∞ gives the zero measure | ok |
| `isingBlockMeasure`, `IsIsingBlock`, `griffithsSimonClass` | N = 0; Griffiths' trick; q = (1, −1), K = (ln 3)/2 | δ₀; weights `¼e^K = ½e^{−K}` iff `e^{2K} = 2`; ε = ¼, `∫φ⁴ = 4 > 3 = 3(∫φ²)²` (excluded by `0 ≤ q`) | ok |
| `leeYang` | V empty; one site; two sites J ≥ 0; J = −(ln 2)/2 | 1; `cosh h`, zeros `iπ(k+½)`; `cosh 2h = −e^{−2J}` forces Re h = 0; zeros at `±0.658 + iπ/2` | ok; both hypotheses needed |
| `isingBlock_laplace_ne_zero` | q = 0; ρ_I; uniform on {−1,0,1} | E ≡ 1; `cosh h`; zeros `i(±2π/3 + 2πk)` | ok |
| `isingBlock_laplace_hasProd` | ρ_I; uniform on {−1,0,1} | `Σx_j = π⁻²·π²/2 = ½`; `−12Σx_j² = −12/6 = −2 = 1 − 3`; `Σ = (2π)⁻²π²/sin²(π/3) = 1/3 = ½·⅔` | ok |
| `isingBlock_tailControl` | CLT blocks (limit N(0,1), growth fails); blocks `Σσ_i/(√N log N)`; steps (a)–(f) recomputed | `∫e^{φ²/2}dη_N → ∞`; `(1 − 2/log²1000)^{−1/2} = 1.022`; Paley–Zygmund constant `¼·⅓ = 1/12`; `limsup s_k(θ) ≤ (θ log C + θ^{1−α′/2})/log 2 → 0` | ok |
| `tendsto_gibbs_of_isingBlock` | blocks `½(δ_{±s_k})`, s_k → s; V empty; J of either sign | `s_k² tanh(Js_k²) → s² tanh(Js²)`; `1 → 1` | ok |
| `phi4Measure_mem_griffithsSimonClass` | exponent at `m = φN^{−1/4}/c` | `(g_N − 1)Nm²/2 = bφ²`; `Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴` | ok |
| `griffiths_first`, `griffiths_second` | two Ising sites; non-even `(2δ₋₁+δ₁)/3`; J < 0; V empty | `tanh J ≥ 0`, `1 − tanh²J ≥ 0`; `⟨φ⟩ = −1/3`; `tanh J < 0`; `1 ≥ 0` | ok |
| `fkg_gibbs` | lattice gas on two sites; V empty | `(e^J − 1)/(3 + e^J)²`, sign of J; equality | ok |
| `Edge`, `sources`, `currentWeight`, `randomCurrent_representation` | two sites; J = 0 | `Σ_{even} Jⁿ/n! = cosh J`, `Σ_{odd} = sinh J`; `0⁰ = 1` gives the zero current only | ok; no `2^{|V|}` factor because `ρ_I^{⊗V}` is normalised |
| `switching_lemma` | two sites, A = B = {x, y}, F ≡ 1 | `sinh²J = cosh²J − 1` | ok |
| `gaussian_inequality` | n = 0; (x, x, y, y) | `1 ≤ 1`; `1 ≤ 1 + 2tanh²J` | ok |
| `simon_lieb` | chain 0–1–2, Λ = {0}; block spins | `tanh²J ≤ J tanh J`; `J̃ = J_{uv}q_nq_m` sums to `J_{uv}⟨φ_oφ_u⟩_Λ⟨φ_vφ_y⟩` | ok |
| `messager_miracleSole` | chain {0,1,2,3}; `J_{02} = J_{13} = K` only; non-even ρ on {−1,0,1} | `tanh J ≥ tanh²J`; `0 < tanh K` (hypothesis `hJP` fails); `−1/3 < −1/27` | ok; coefficients `½(J_{xy} ± J_{x,Ry})` recomputed |
| `phi4_secondMoment_le` | (λ, b, K) = (λ, 0, 0); V empty | `M = √(16λ)/(8λ) = 1/(2√λ) ≥ 0.338/√λ`; vacuous | ok |
| `newman_bound` | two Ising sites, J = 1, z = (1, −1); ε = ¼ non-member, a = 2 | `1.329 ≤ e^{1+tanh 1} = 5.822`; `1.691 > 1.649` | ok |
| `box`, `boxGibbs`, `nnCoupling`, `twoPoint`, `susceptibility`, `criticalPoint` | d = 0; d = 1 Ising | one point, χ = 1; `χ = (1+t)/(1−t)`, `β_c = ∞` | ok |
| `exists_infiniteVolume_limit` | d = 0; J = 0; d = 1 Ising | μ = ρ; `infinitePi`; Markov chain with `P(σ_{x+1} = σ_x) = (1+t)/2` | ok |
| `phi4_uniform_expMoment` | a ≤ 0; a > 0 | `≤ 1`; `2e^{a²M/2}` with K the row norm | ok |
| `criticalPoint_ising_ge` | d = 0; d = 1, β = ¼ | `∞ ≤ ∞`; `e^{1/2} ≤ 2` | ok; R02 |
| `twoPoint_reflection_monotone` | d = 1; x = (x₁, x₂) with reflections `x₁ − x₂ = x₁` and `x₂ = x₂/2` | `tⁿ` antitone; `S(x) ≥ S((x₁+x₂, 0))`, `S((x₁, 0)) ≥ S(x)`; `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞` | ok |
| `torusCoupling`, `torusSymbol`, `structureFactor`, `infraredConstant` | L = 1, d = 1; L ≥ 2; d = 3 | coupling 2J, `Ŝ(0) = 1 + tanh 2J`, `Ŝ(π) = 1 − tanh 2J`; no pair counted twice; `I₃ = W/2 = 0.2527` | ok |
| `reflectionPositive` | ε = 0, L = 1; ε = 1, L = 1; halves for general L | R = id, `⟨|f|²⟩ ≥ 0`; matrix `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]`; `{1..L} ↦ {0, L+1..2L−1}` | ok |
| `chessboard` | d = 0, f ≡ −1; d = 1, L = 1 | `1 ≤ −1`; Cauchy–Schwarz for the positive form | **false at d = 0: R01** |
| `gaussian_domination` | d = 0; L = 1, d = 1 Ising; J = 0 | `1 ≤ 1`; `Z″(0) = −4J + e^{−4J}(32J² − 4J) ≤ 0`; equality | ok |
| `infrared_bound` | L = 1, d = 1 Ising; Gaussian torus field | `4J(1 − tanh 2J) ≤ 0.557`; `E/(2(|b| − dJ) + JE) < 1/J` | ok |
| `ising_longRangeOrder` | sum rule at L = 1 | `½((1+t) + (1−t)) = 1` | ok |
| `IsRandomField`, `exists_unique_gaussianProcess` | I empty; K = [[1,2],[2,1]]; K = 0 | unique measure on a point; variance `−2` (hypothesis fails); Dirac at 0 | ok |
| `isGaussianProcess_iff_wick` | n = 0; random-sign field; non-centred Gaussian | `1 = 1` and `hcent`; `M₄ = (∫fh)⁴ ≠ 3(∫fh)⁴`; excluded by `hcent` | ok |
| `latticePoint`, `blockSecondMoment`, `rescaledField` | J = 0 Ising; three-site chain; tent function with R = L and R = 4L | `(2L+1)^d`; `3 + 4t + 2t²`; `0` and `(2L²+1)/(3L(2L+1)) → 1/3` | ok |
| `ReachabilityScheme`, `fieldLaw`, `HasLimitLaw`, `Converges` | g ≡ 1 in `HasLimitLaw`; infinite ρ | forces `ν(univ) = 1`, so ν is unique; `Z ≥ ρ(ℝ₊)² + ρ(ℝ₋)² = ∞`, excluded by the probability field | ok |
| `exists_reachableField` | 𝒞 = {δ₀}; 𝒞 = {(δ₀+δ₁)/2}; quarter-turn g | zero field; `E T_f → 2^{−d}∫f`, not symmetric; `T_{f∘g}(φ) = φ_{−e₂} = T_f(φ∘g⁻¹)` | ok |
| `gffCovariance`, `gff_reachable` | d = 1, m = 1; d = 0, m > 0; scaling exponent | `C₁(1_Q, 1_Q) = 1 + e⁻²`; covariance `f_i(0)f_j(0)` on both sides; `L^{−2d}·L^{d−2}` gives `L^{−(d+2)}` | ok |

### README targets not covered by a Lean row

| Target | Instances | Values computed | Result |
|---|---|---|---|
| Conventions (Hamiltonian, torus, Fourier) | two sites; `e^{−m|x|}/(2m)` | `tanh 2J = 4/5`, `tanh(J/2) = 2 − √3`; transform `1/(m² + 4π²ξ²)` | ok |
| 0.1, 0.2 | density `exp(−φ² log(1+φ²))`; scaling by s | admissible, fails (2.2); `ρ_{λs⁻⁴, bs⁻²}` | ok |
| 1.1–1.4 | row-norm bound; derivative at J = 0; `ρ_k` with atoms at ±k | `−H ≤ ½‖J‖Σφ²`; `(∫φ²)²`; `Z ≥ ½e^{k²−2k}` | ok |
| 1.5 | two sites; d = 1 | `det = 4b² − J²`; `G_μ(0) = 1/(μ√(4+μ²))` | ok |
| 2.1 (pair polynomial, Asano) | `1 + az₁ + az₂ + z₁z₂` | `|1+az₁|² − |a+z₁|² = (1−a²)(1−|z₁|²)`; `−K·K = {|z| ≥ 1}` | ok |
| 2.2 Checks | mixture `(1−1/k)ρ_I + N(0,1)/k` | moments `≤ (2n−1)!!`, Z = ∞ on two sites with J ≥ 1 | ok |
| 3.2, 3.4 API, 3.5 (i) | chain; two sites with J = 0 | `tanh J₀₁ tanh J₁₂`; `Z_D = 0` | ok |
| 3.6 reflections | `x_i = a`, a ∈ ½ℤ; `x_i − x_j = a` | neighbour pair across the plane forces y = x; difference changes by ≤ 1 per step | ok |
| 3.7 identity | one site, `J_{xx} = 1`, F = φ; `F = φ + sin(e^{φ⁴})` | `1 = 4⟨φ⁴⟩`; `∫|cos t|/t dt = ∞` | ok |
| 4.1–4.4 | c = δ₀ − δ₁ + δ₂; d = 2 small t | `3 − 4t + 2t²` versus `−1/5`; `t ≥ 2t² ≥ t²` | ok |
| 5.1–5.5 | 4-cycle; h = (1, −1); Peled–Spinka's constant | `(t+t³)/(1+t⁴)`; `(h, −Δh) = 8`; `(1/(2J))∫dt/Σ(1 − cos πt_j) = I_d/J` | ok |
| 6.1–6.4 | `T_f = |∫f|`; `e^{−|x|²−|y|²}` | not linear; `≤ e^{−|x−y|²/2}` | ok; R04 |
| 7.1–7.4 | strict variance example; `G₀` in d = 3 and 4 | `2^{−d−1}∫f² < 2^{−d}∫f²`; `1/(4π|x|)`, `1/(4π²|x|²)` | ok |
| 8.1, 8.2 (not targets) | Gaussian susceptibility at β = 1 | `L_n²/m²` | ok |

## Dependency check

Output of the `gate --depcheck` command of the brief:

    depcheck: 237 roadmaps, 2235 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** all 60 of `Suggested.lean` (29 theorems, 30 definitions and abbreviations, 1 structure; the worker's signature listing has 62 entries), every line. I compared the elaborated types in the worker's signature listing with the README statements; no declaration lost a section binder. I ran no Lean.
- **Targets read:** all 34 README subsections (0.1–7.4), the Conventions, the supplier contracts and the two downstream goals, every line.
- **Checks tested:** every Check with a closed-form or numerical value was recomputed (about 110 of roughly 125 bullets; the rest are qualitative and were read against the theorems of their section); none is false. Every definition has at least three.
- **Pinned declarations:** 47 file-and-line locators verified at the pins (42 Mathlib, 5 Tau Ceti); all correct. `multivariateGaussian` takes an arbitrary matrix and is a Dirac measure when it is not positive semidefinite, which does not affect `gff_reachable` in its stated range.
- **Sibling citations checked (6):**
  - StochasticCalculus §1.1 on main states the arbitrary-index extension with uniqueness.
  - StandardDistributions §5.3 on main states Wick–Isserlis (see R03).
  - ZerosOfLFunctions §5.5 on main has `hadamard_of_orderLE_one` with the hypotheses the README restates.
  - RelativisticQuantumFieldTheory §7.1 and §7.3 (item 1) at its open head give the multiplier `(4π²‖ξ‖² + m²)⁻¹`, exterior decay for 0 < c < m, the radial massless kernel and the unsubtracted limit for n ≥ 3.
  - PDE (Scope) and OperatorAlgebraDynamics D9 exist on main.
- **Source locators verified (31) against the cached texts:**
  - `aizenman-duminilcopin-2021`: (1.8), (1.10), (1.11)–(1.12), (1.16)–(1.20), Definition 2.1 with (2.1)–(2.4) and Figure 1, (5.1)–(5.10), Proposition 5.1, Proposition 5.2, Proposition 7.2 and Section 7.1.
  - `sokal-1982`: footnote 2 (p. 326), properties (a)–(l) (pp. 327–328), the Remark (p. 329).
  - `peled-spinka-2017`: Theorems 2.1, 2.3, 2.13, Lemma 2.4, Propositions 2.14–2.16, Corollary 2.17, (43), (48), (49), (51)–(53), with their pages.
  - `lebowitz-ruelle-speer-2012`: (1.2) and Lemma 2.4.
  - `simon-2020-twelve-tales`: p. 25 and (5.14)–(5.22).
  - `duminilcopin-2017-lectures`: Corollary 1.9, p. 14.
  - `frohlich-1982`: (7), (12), (13) on pp. 4–5.
- **Ownership.** No roadmap on main or at an open head plans the Ising model, Griffiths, Lee–Yang, random currents, reflection positivity or the infrared bound, or a Gaussian process with a prescribed kernel. This roadmap is the owner. No name of `Suggested.lean` collides with a readable roadmap's.
- **Padding and headlines.** The 22 headline theorems named in the README's second paragraph are all stated. No declaration is padding: none follows from one tactic or one library lemma, and every definition is used by a stated theorem.
- **Policy.** The diff touches only the package folder. No `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data, pull-request number or process narrative. Imports are `Mathlib` and one existing Tau Ceti module.
- **Arrangement.** `aizenman-duminilcopin-2021` has 52 of 118 locators. Its sections are 1 introduction, 2 the Griffiths–Simon class, 3 random currents, 4–6 tree diagrams and the proof, 7 the extension. Layers 0–7 do not map onto a run of them: Layers 1, 4, 5 and 6 have no counterpart section, and Sections 4 and 6 have no layer.

Source independence: 9 passages compared with 5 sources, none shared; largest share aizenman-duminilcopin-2021, 52 of 118 locators; contents compared with aizenman-duminilcopin-2021: independent.

## Not verifiable

- The seven uncertified sources (`griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`) are cited by locator only; their text was not read.
- `sokal-1982` is an OCR scan whose displayed equations are not recognised. Equation numbers (2.17)–(2.30), (2.33) and (3.4)–(3.5) were located by page and surrounding prose, not by the formulas.
- `frohlich-1982`, "the paragraph after (33), p. 13", and `sokal-1982` Proposition 2.1 (p. 333), Section 2.3 with Lemma 2.2 (pp. 334–337) and Section 3.1 (p. 342): these pages were not opened in this pass.
- `isingBlock_tailControl` has no published statement that I could locate. I checked it by recomputing steps (a)–(f) of the README's route, not against a source.
- ConstructiveFieldTheoryPhi4PartII, named as owner of the downstream goals, exists neither on main nor at any open head. Nothing is consumed from it, so no dependency is affected.
- Truth of the `sorry`'d statements beyond the instances in the table.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), p. 24 (repeated in (5.14)–(5.15), p. 25): the source says the infrared bound has constant one over twice the total coupling 2dJ times β; it should be 1/(Jβ), as in peled-spinka-2017 (52); affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at the list after (5.2), p. 23: the source says a coordinate is sent to L minus itself with L a half-integer; it should be L an integer (the hyperplane is at L/2); affects nothing.
- **Gap** in aizenman-duminilcopin-2021 at Definition 2.1(1), p. 8: the source says the block coefficients are arbitrary reals; it should be nonnegative coefficients, since weights (1, −1) with strong coupling give a positive fourth cumulant; affects a stated result.

## For the human reviewers

- **Scope.** `README.md:3`, `:11`, `:23`, `:747–766` assign the marginal-triviality goals to ConstructiveFieldTheoryPhi4PartII, which exists neither on main nor in any open pull request.
- **Scope.** `isingBlock_tailControl` (`README.md:273`, `Suggested.lean:158`) is a headline theorem whose proof route is the roadmap's own; no cited source states it.
- **Not tested.** Seven of the fourteen sources are uncertified and unread; `griffiths-simon-1973` is the primary source for §2.3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "961d8dd99a6fbe7a6732472848ef32dea06135c2", "job": "RT-ConstructiveFieldTheoryPhi4~1a", "model": "fable", "worker": "chris-x79"} -->
