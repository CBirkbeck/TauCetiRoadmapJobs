<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17768#issuecomment-6905824078 -->
Red team round 2 pass b (claude) of 5642a3a

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the route of 5.3 applies the chessboard estimate to a spin system that 5.2 does not state

   **Location.** `packages/ConstructiveFieldTheoryPhi4/README.md:548`: "A proof route: Peled–Spinka's auxiliary spin system of pairs (φ, τ) with the bounded positive-definite interaction `e^{−(J/2)(a + a′ − b − b′)²}`, reflection positivity (5.2) and the chessboard estimate".

   **Claim.** 5.2 supplies what the route consumes.

   **Witness.** 5.2 (`README.md:535`) states reflection positivity and the chessboard estimate only for `μ^{per}_{L,J,ρ}`, spins in ℝ and functions `f_v(φ_v)`. The auxiliary system has spin space ℝ × ℝ (`peled-spinka-2017` lines 1604–1611) and the events `{|τ_v − t_v| < ε}`; it is no `μ^{per}_{L,J,ρ}`.

   **Repair.** Replace the route sentence of 5.3 by:

   "A proof route: let η₀ be Lebesgue measure on a bounded open interval U ∋ 0 and give the pairs (φ_x, τ_x) the density proportional to `exp(−(J/2) Σ_x Σ_j (φ_x + τ_x − φ_{x+e_j} − τ_{x+e_j})²)` with respect to `Π_x ρ̃(dφ_x) η₀(dτ_x)`; the marginal density of τ is `Z(τ)/∫Z dη₀^{⊗T_L}`. The sums `s_x = φ_x + τ_x` are distributed as `μ^{per}_{L,J,κ}`, where κ is the normalisation of `e^{−dJs²} (ρ̃ * η₀)(ds)`, an admissible probability measure, and given s the τ_x are independent with τ_x depending on s_x only. Hence `P(|τ_v − t_v| < ε for all v) = ⟨Π_v f_v(s_v)⟩^{per}_{L,J,κ}` with `f_v(s) = P(|τ_v − t_v| < ε | s_v = s)`, and the chessboard estimate of 5.2 for κ bounds it by the geometric mean over w of the same probabilities for the constant configurations t ≡ t_w, for which `Z(t) = Z(0)`; dividing by `(2ε)^{|T_L|}`, letting ε ↓ 0, and using the continuity of Z and that U is arbitrary gives `Z(t) ≤ Z(0)` (Peled–Spinka, the proof of (46), p. 33, where the estimate is applied to the pair system itself)."

   Tested on the refuting instance: the functions `f_v` are bounded measurable functions of the single real spin `s_v`, κ integrates `e^{cs²}` for every c because `∫∫ e^{(c−dJ)(φ+τ)²} e^{dJφ²} ρ(dφ) η₀(dτ) < ∞` for bounded τ and admissible ρ, so `chessboard` as stated applies; at L = 1, d = 1 the bound is the Cauchy–Schwarz inequality `P(E_{(t₀,t₁)})² ≤ P(E_{(t₀,t₀)}) P(E_{(t₁,t₁)})`. No Lean change.

2. **F02** (P3) Sokal, Section 2.3 and Lemma 2.2, is cited for the reachability of the Gaussian free field, which it does not state

   **Location.** `README.md:731`: "Sokal, Section 2.3 and Lemma 2.2, pp. 334–337; Fröhlich, the paragraph after (33), p. 13"; the docstring of `gff_reachable`, `Suggested.lean:688–689`: "(Sokal, Section 2.3 and Lemma 2.2; Fröhlich, the paragraph after (33); README §7.4)".

   **Claim.** The locator supports `gff_reachable`.

   **Witness.** `sokal-1982` lines 620–640 and 710–716: Section 2.3 and Lemma 2.2 treat sequences of φ⁴ lattice measures and a subsequential limit on the distribution space; no Gaussian single-site measure and no block normalisation occur. The free lattice field is at `frohlich-1982` lines 265–269.

   **Repair.** In `README.md:731` replace "Sokal, Section 2.3 and Lemma 2.2, pp. 334–337; Fröhlich, the paragraph after (33), p. 13;" by "the statement in this form, with the block normalisation of 7.1, is this roadmap's; for the free lattice field and its two-point function `(−Δ + m²)⁻¹`, Fröhlich, the paragraph after (33), p. 13; for the rescaling of lattice measures to a continuum field, stated there for φ⁴ lattice measures and along subsequences, Sokal, Section 2.3 and Lemma 2.2, pp. 334–337;". In the docstring replace "(Sokal, Section 2.3 and Lemma 2.2; Fröhlich, the paragraph after (33); README §7.4)" by "(Fröhlich, the paragraph after (33), for the free lattice field; README §7.4)".

3. **F03** (P3) the route of 2.3 uses Stirling's formula, which no *Needs* line, Dependencies line or supplier contract names

   **Location.** `README.md:290`: "Stirling's formula and the expansion of the Cramér rate function of a fair ±1 coin"; `README.md:292`: "*Needs:* 0.2; 2.1; 2.2."

   **Claim.** Every input of the route is a target, a named supplier section or a pinned declaration.

   **Witness.** The two-sided bound `C(N, k) 2^{−N} ≤ C N^{−1/2} e^{−N I(m)}` and the local limit need factorial asymptotics. They are pinned in Mathlib/Analysis/SpecialFunctions/Stirling.lean: `Stirling.tendsto_stirlingSeq_sqrt_pi` (211), `Stirling.le_factorial_stirling` (248), `Stirling.stirlingSeq'_antitone` (154); the README names none.

   **Repair.** `README.md:292`: "*Needs:* 0.2; 2.1; 2.2; Mathlib `Stirling.tendsto_stirlingSeq_sqrt_pi`, `Stirling.le_factorial_stirling`, `Stirling.stirlingSeq'_antitone`." Add the same three names to the Layer 2 Dependencies line (`README.md:306`), and to "From Mathlib" the bullet: "`Stirling.tendsto_stirlingSeq_sqrt_pi`, `Stirling.le_factorial_stirling` and `Stirling.stirlingSeq'_antitone` (Mathlib/Analysis/SpecialFunctions/Stirling.lean:211, 248 and 154): `n!/(√(2n)(n/e)ⁿ)` decreases for n ≥ 1 to √π, so `√(2πn)(n/e)ⁿ ≤ n! ≤ (e/√2)√(2n)(n/e)ⁿ`; used for the binomial bounds of 2.3." Checked at n = 1: `√(2π)/e = 0.922 ≤ 1 ≤ (e/√2)·√2/e = 1`.

4. **F04** (P3) the Griffiths–Simon class and the class argument of a reachability scheme have different carriers

   **Location.** `README.md:770`: "for d ≥ 4 and 𝒞 the Griffiths–Simon class of 2.2, every random field reachable from 𝒞 by a convergent scheme of 7.2"; also `README.md:774` ("reachability is monotone in 𝒞").

   **Claim.** The class of 2.2 can be passed to 7.2 as it stands.

   **Witness.** `Suggested.lean:120`: `griffithsSimonClass : Set (ProbabilityMeasure ℝ)`; `Suggested.lean:594`: `structure ReachabilityScheme (d : ℕ) (𝒞 : Set (Measure ℝ))`. `ReachabilityScheme d griffithsSimonClass` does not typecheck, and 8.1's 𝒞 (φ⁴ measures and ρ_I) is a set of `Measure ℝ`.

   **Repair.** Add to 7.2 (`README.md:695`), after "(`ReachabilityScheme`, which records stability as the box Gibbs measure being a probability measure)": "The class 𝒞 is a set of `MeasureTheory.Measure ℝ`; for the Griffiths–Simon class of 2.2, a set of `MeasureTheory.ProbabilityMeasure ℝ`, it is the image of `griffithsSimonClass` under the coercion to measures, and this is the meaning of '𝒞 the Griffiths–Simon class' in 8.2." Tested: `{μ | ∃ ρ ∈ griffithsSimonClass, (ρ : Measure ℝ) = μ}` contains `isingMeasure` and, by `phi4Measure_mem_griffithsSimonClass` as stated, every `phi4Measure lam b` with λ > 0, so the first Check of 8.2 reads as an inclusion of sets of `Measure ℝ`. No Lean change.

Four P3 findings (S01–S04), all in README prose and one docstring; no Lean statement was found false, and no statement changes. The four round-1 findings are repaired and no repair introduced an error.

## Round-1 findings at this head

| Earlier finding | Status | Witness at 5642a3a |
|---|---|---|
| ~1a/F01 = ~1b/F01 (P2): `chessboard` false at d = 0 | repaired | `Suggested.lean:491`: "theorem chessboard (d L : ℕ) (hd : 1 ≤ d) [NeZero L] {J : ℝ} (hJ : 0 ≤ J)"; `README.md:535`: "for d ≥ 1 and bounded measurable real functions"; Check at `README.md:543`. Recomputed: d = 0, f ≡ −1 gives `1 ≤ −1`, now excluded; d = 1, L = 1, f ≡ −1 gives `1 ≤ 1`. |
| ~1a/F02 = ~1b/F02 (P3): `criticalPoint_ising_ge` weaker than its target | repaired | `Suggested.lean:417–421` is the conjunction "(∀ β : ℝ≥0, 2 * (d : ℝ) * β < 1 → susceptibility … ≤ ENNReal.ofReal (1 - 2 * (d : ℝ) * β)⁻¹) ∧ ((2 * d : ℝ≥0∞))⁻¹ ≤ criticalPoint …"; `README.md:471` "which states both inequalities". Recomputed: d = 1, β = ¼: `e^{1/2} = 1.6487 ≤ 2`; d = 0: `1 ≤ 1` and `∞ ≤ ∞`; d = 1, β = 1: hypothesis `2 < 1` false. |
| ~1a/F03 (P3): contract asked StandardDistributions for facts pinned in Tau Ceti | repaired | `README.md:79` cites `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` (MixedMoments.lean:135) and `…integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (OddMoments.lean:102); both opened at the pin: any `m`, `c`, any matrix `S`; `Odd s.card`, repeated indices. `README.md:89` keeps only the pairing formula. |
| ~1a/F04 (P3): "pointwise" in the decay bullet of 6.2 | repaired | `README.md:620`: "(1.10) is equivalent to the existence of a representative with `sup_{|x−y|≥r} |S_2(x, y)| → 0` as r → ∞"; Check at `README.md:627`. Witness `1[|x−y| ≤ 1+|x|]`: sup = 1 for every r and (1.10) fails at ε = ½, both sides false. |

New error introduced by a repair: none. The added Conventions sentence (`README.md:30`, the Lean statements at d = 0) was recomputed for all thirteen theorems carrying `d` (table below).

## Adversarial pass: record

Declarations of `Suggested.lean` (60: 29 theorems, 30 definitions and abbreviations, 1 structure). Section context: `{V : Type*} [Fintype V] [DecidableEq V]` in the sections `FiniteVolume`, `GriffithsSimon`, `Correlation`, `Currents`, `ClassInequalities`; `{d} {𝒞}` in `namespace ReachabilityScheme`; no other `variable`. Elaborated types read in the worker's signature listing (62 entries, the two extra being structure auxiliaries); no declaration lost a binder; I ran no Lean.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsAdmissible`, `phi4Measure`, `isingMeasure` | δ_a; N(0,1); λ = 1, b = 2; b = 0 moments | `e^{ca²}` finite; `∫e^{φ²/2}dN = ∞`; `−φ⁴+2φ² = −(φ²−1)²+1`; `Γ(5/4)/Γ(1/4) = ¼`, `Γ(3/4)/Γ(1/4) = 0.3380` | definitions determine their objects; wrong model "some c" excluded by N(0,1) | none |
| `hamiltonian`, `partitionFunction`, `gibbsMeasure` | two sites `J = (log 3)/2`; three sites; V = ∅; N(0,1) with J = 1 | `Z = 2/√3`, `⟨σσ⟩ = ½` (wrong models give 4/5 and 2 − √3); `Z = (e^{3J}+3e^{−J})/4`; Z = 1; Z = ∞ and zero measure | true | none |
| `isingBlockMeasure`, `IsIsingBlock` | N = 0; q = (½,½), K = (ln 2)/2; q = (1,−1), K = (ln 3)/2 | δ₀; uniform on {−1,0,1}; `¾δ₀+⅛(δ₂+δ₋₂)`, `∫φ⁴ = 4 > 3` (excluded by `0 ≤ q`) | true | none |
| `griffithsSimonClass` | ρ_I; N(0,1); `(1−ε)δ₀+½ε(δ₁+δ₋₁)`, ε = ¼ | member; excluded by growth; `¼ > 3/16`, excluded by Lebowitz | true | S04 (carrier) |
| `leeYang` | V = ∅; one site; two sites J ≥ 0 and `J = −(ln 2)/2`; pair polynomial | 1; `cosh h`, zeros `iπ(k+½)`; `cosh 2h = −e^{−2J} ∈ [−1,0)` forces Re h = 0; zeros `±0.658+1.571i`; `|1+az|²−|a+z|² = (1−a²)(1−|z|²)` | true; both hypotheses needed | none |
| `isingBlock_laplace_ne_zero` | δ₀; ρ_I; uniform {−1,0,1}; some q_n = 0 | 1; `cosh h`; `(1+2cosh h)/3`, zeros `i(±2π/3+2πk)`; limit of zero-free functions with E(0) = 1 | true | none |
| `isingBlock_laplace_hasProd` | δ₀; ρ_I; uniform {−1,0,1}; `cosh(h/(√N log N))^N` | x ≡ 0; `Σ((k+½)π)⁻² = ½`, `−12·(1/6) = −2 = 1−3`; `(2π)⁻²π²/sin²(π/3) = 1/3 = ½·⅔`; `1/(2log²N) = ½σ²` | true | none |
| `isingBlock_tailControl` | steps (a)–(f) recomputed; CLT blocks (limit N(0,1), growth fails); `Σσ_i/(√N log N)` | PZ bound `(σ²/2)²/(3σ⁴) = 1/12`; `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`; CLT: `s_N(θ) = ½`, moments `→ ∞`; `(1−2c/log²N)^{−1/2} = 1.022` at c = 1, N = 1000 | true; growth hypothesis needed | none |
| `tendsto_gibbs_of_isingBlock` | `½(δ_{−s_k}+δ_{s_k})`, s_k → s; mixtures `(1−1/k)ρ_I+(1/k)N(0,1)` (not blocks) | `s_k² tanh(Js_k²) → s² tanh(Js²)`; `Z = ∞` at J ≥ 1 | true; block hypothesis needed | none |
| `phi4Measure_mem_griffithsSimonClass` | exponent at `m = φN^{−1/4}/c`, `c⁴ = 1/(12λ)`; b < 0 | `Nm²(g_N−1)/2 − Nm⁴/12 = bφ² − λφ⁴`; `g_N > 0 ⇔ N > 4b²c⁴`; `I(m) ≥ m²/2+m⁴/12` | true | S03 (Stirling) |
| `griffiths_first`, `griffiths_second` | two Ising sites; `(2δ₋₁+δ₁)/3`; J < 0 | `tanh J`, `1 − tanh²J`; `−1/3`; `tanh J < 0` | true; hypotheses needed | none |
| `fkg_gibbs` | lattice gas, two sites; F = σ_x, G = −σ_y | `(e^J−1)/(3+e^J)²`; `−tanh J ≤ 0` | true | none |
| `Edge`, `sources`, `currentWeight`, `randomCurrent_representation` | two sites; V = ∅; without factorials | `cosh J`, `sinh J` (the factor `2^{−|V|}` is in `ρ_I^{⊗V}`); 1; `1/(1−J)` | true | none |
| `switching_lemma` | two sites, A = B = {x,y}, F ≡ 1; A = {x,y}, B = ∅, J = 0; an edge with J_e = 0 | `sinh²J = cosh²J − 1`; `0 = 0`; both sides lose the same terms | true | none |
| `gaussian_inequality` | n = 0; (x,x,y,y); (x,x,x,y); ρ_{λ,0}; non-member ε = ¼ | `1 ≤ 1`; `1 ≤ 1+2t²`; `t ≤ 3t`; `1/(4λ) ≤ 0.3427/λ`; `¼ > 3/16` | true; class needed | none |
| `simon_lieb` | chain 0−1−2, Λ = {0}; block expansion `φ_x = Σq_nσ_{x,n}` | `tanh²J ≤ J tanh J`; `J̃ = J_{uv}q_iq_j` reproduces `J_{uv}⟨φ_oφ_u⟩_Λ⟨φ_vφ_y⟩` | true | none |
| `messager_miracleSole` | chain {0,1,2,3}, R = 3−x; `J_{02} = J_{13} = K`; P = ∅; `(2δ₋₁+δ₁)/3` | `tanh J ≥ tanh²J`, `1 ≥ tanh³J`; `0 < tanh K` (hypothesis fails); equality; `−1/3 < −1/27` | true; coefficients `½(J_{xy} ± J_{x,Ry})` recomputed | none |
| `phi4_secondMoment_le` | one site, b = 0, K = 0; b < 0; J of either sign | `1/(2√λ) ≥ 0.338/√λ`; `2bm ≤ 0 = 2b₊m`; `4λm² ≤ 1+(2b₊+K)m` | true | none |
| `newman_bound` | ρ_I; z = (1,−1), J = 1; z = iy; non-member ε = ¼, a = 2 | `cosh a ≤ e^{a²/2}`; `1.329 ≤ 5.822` (signed form 1.269 fails); `|cos y| ≤ 1`; `1.691 > 1.649` | true; class and absolute values needed | none |
| `box`, `boxGibbs`, `nnCoupling`, `twoPoint`, `susceptibility`, `criticalPoint` | d = 1 Ising; ρ = δ₀; d = 0; x ∉ V_R | `tanh^{|x|}J`, `χ = (1+t)/(1−t)`, `β_c = ∞`; 0, 0, ∞; one point; integral 0 | definitions determine their objects | none |
| `exists_infiniteVolume_limit` | d = 0; J = 0; d = 1 Ising | constant sequence; `infinitePi ρ`; Markov chain with `P(σ_{x+1}=σ_x) = (1+tanh J)/2`; `e^{a|φ_x|}` integrable, so no junk value in `hexp` | true | none |
| `phi4_uniform_expMoment` | a ≤ 0; a > 0 | ≤ 1; `2e^{a²M/2}`, M of 3.7 with K the row norm | true | none |
| `criticalPoint_ising_ge` | d = 0; d = 1, β = ¼, 1 | `1 ≤ 1`, `∞ ≤ ∞`; `1.649 ≤ 2`; hypothesis false | true | none |
| `twoPoint_reflection_monotone` | d = 1; x = (1,1), (2,0), (3,0,0) → (2,1,0); d = 0 | `tⁿ` decreasing; `t ≥ 2t² ≥ t²`; reflection in `x₁−x₂ = 2` keeps 0 and (2,1,0) on one side; no `i : Fin 0` | true; (5.3)–(5.4) read at `aizenman-duminilcopin-2021` lines 1040–1051 | none |
| `torusCoupling`, `torusSymbol`, `structureFactor`, `infraredConstant` | L = 1, d = 1; L = 2; `k_j ↦ k_j+2L` | coupling 2J, `Ŝ(0) = 1+tanh 2J`, `Ŝ(π) = 1−tanh 2J`; one j per neighbour; phase changes by 2π; `I_3 = W/2 = 0.2527` | definitions determine their objects | none |
| `reflectionPositive` | ε = 0, L = 1 (R = id); ε = 1, L = 1, d = 1; ε = 0, L = 2, J = 0, f = φ₀; d = 0 | `⟨|f|²⟩ ≥ 0`; matrix `[[e^{2J},e^{−2J}],[e^{−2J},e^{2J}]]` PSD iff J ≥ 0; 1; vacuous | true | none |
| `chessboard` | d = 0 (excluded); d = 1, L = 1, f ≡ −1; f₀ ≠ f₁ | `1 ≤ −1`; `1 ≤ 1`; Cauchy–Schwarz of the edge form | true for d ≥ 1 | S01 uses it as stated |
| `gaussian_domination` | L = 1, d = 1 Ising; h constant; J = 0; d = 0 | second derivative `−4J+e^{−4J}(32J²−4J) ≤ 0` (max of `e^{−4J}(8J−1)` is 0.446); equality; `1 = 1`; `1 = 1` | true | S01 (route) |
| `infrared_bound` | L = 1, d = 1 Ising; Gaussian torus field; d = 0 | `4J(1−tanh 2J) ≤ 0.557`; `E/(2(|b|−dJ)+JE) < 1/J`, sharp; vacuous | true; constant 1/J | none |
| `ising_longRangeOrder` | sum rule L = 1; d = 3 | `½((1+t)+(1−t)) = 1`; `1 − 0.2527/J` | true | none |
| `IsRandomField` | zero field; `T_f = |∫f|` | field; `T_{−f} ≠ −T_f` | determines its object | none |
| `exists_unique_gaussianProcess` | I = ∅; `[[1,r],[r,1]]`; `[[1,2],[2,1]]` | Dirac on the point; bivariate normal; `Var(X₁−X₂) = −2`, excluded by `hpsd` | true; uniqueness by cylinders | none |
| `isGaussianProcess_iff_wick` | n = 0; f_i = f, n = 2; random sign; uncentred Gaussian | `1 = 1`; `3M_2²`; `1 ≠ 3`; excluded by `hcent` | true both ways | none |
| `latticePoint`, `blockSecondMoment`, `rescaledField` | J = 0, ρ_I; three-site chain; δ₀; tent with R = L and R = 4L | `(2L+1)^d`; `3+4t+2t²`; Σ = 0 and T ≡ 0; 0 and `(2L²+1)/(3L(2L+1)) → 1/3` | determine their objects | none |
| `ReachabilityScheme`, `fieldLaw`, `HasLimitLaw`, `Converges` | g ≡ 1 in `HasLimitLaw`; Cauchy law | `∫1 dν = 1` forces ν(univ) = 1, so ν is a probability measure and unique; excluded by `integrable_sq` | determine their objects | S04 |
| `exists_reachableField` | 𝒞 = {δ₀}; `(δ₀+δ₁)/2`; quarter-turn g; strict second moment | zero field; `T_f = 2^{−d}∫f`, not symmetric (evenness needed); `T_{f∘g}(φ) = T_f(φ∘g⁻¹)`; `2^{−d−1}∫f² < 2^{−d}∫f²` | true | none |
| `gffCovariance`, `gff_reachable` | d = 1, m = 1; m → 0 in d = 1; d = 0, m > 0; scaling `L^{d+2}`; d = 3, 4 at m = 0 | `C_1(1_Q,1_Q) = 1+e^{−2}`; `≈ 2/m`; `f_i(0)f_j(0)`; `L^{2d}·L^{−d}·L²`; `1/(4π|x|)`, `1/(4π²|x|²)` | true in the stated range | S02 (citation) |

The Lean statements at d = 0 (Conventions, `README.md:30`): `reflectionPositive`, `twoPoint_reflection_monotone` have no index in `Fin 0`; `infrared_bound` has no `k ≠ 0`; `gaussian_domination` reads `1 ≤ 1`; `exists_infiniteVolume_limit`, `phi4_uniform_expMoment` have constant box sequences; `criticalPoint_ising_ge` reads `1 ≤ 1` and `∞ ≤ ∞`; `gff_reachable` gives `N(0, f_i(0)f_j(0))` on both sides; `ising_longRangeOrder` has `3 ≤ d`; `chessboard` has `1 ≤ d`; `exists_reachableField`, `isGaussianProcess_iff_wick` do not use d.

README targets (34 subsections, Conventions, contracts, 8.1–8.2):

| Target | Instances and values | Result |
|---|---|---|
| Conventions | Hamiltonian witness (above); `|J| = 2dJ`; Fourier transform of `e^{−m|x|}/(2m)` is `1/(m²+4π²ξ²)`; Σ = 0 iff ρ = δ₀ (a sum of independent variables vanishing a.s.) | true |
| 0.1, 0.2 | `exp(−φ² log(1+φ²))` admissible, fails (2.2); scaling `ρ_{λs⁻⁴, bs⁻²}`; Vitali indicator | true |
| 1.1–1.5 | `−H ≤ ½‖J‖Σφ_x²`; `∂⟨φ_xφ_y⟩/∂J = (∫φ²)²` at J = 0; `Z(ρ_k) ≥ ¼e^{k²−2k}`; Gaussian two sites `J/(4b²−J²)`; `G_μ(0) = 1/(μ√(4+μ²))` | true |
| 2.1–2.3 | rows above; Asano contraction of pair polynomials gives `Σ_A Π z_x Π a_{xy}` with `−K·K = {|z| ≥ 1}` | true |
| 3.1–3.7 | Ginibre parity cases; `−3/(5+4e^{−2J}) < −1/3`; integration by parts `1 = 4λ⟨φ⁴⟩−2b⟨φ²⟩−ΣJ⟨φφ⟩`; `F = φ+sin(e^{φ⁴})`: `∫|cos t|/t = ∞`; diagonal reflection has no edge between V₊ and V₋ | true |
| 4.1–4.4 | `3−4t+2t² = 2(1−t)²+1`; `3−16/5 = −1/5`; `χ(¼J^{nn}) = e^{1/2}` | true |
| 5.1–5.5 | 4-cycle `(t+t³)/(1+t⁴)`; `(h,−Δh) = 8` at h = (1,−1); `32J(1−tanh 2J) ≤ 8` | true |
| 6.1–6.4 | `e^{−|x|²−|y|²} ≤ e^{−|x−y|²/2}`; white noise has no S_2 | true |
| 7.1–7.4 | `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`; `Γ(d/2−1)/(4π^{d/2}) = 1/((d−2)|S^{d−1}|)`; `L²E(q/L) ≥ (4/π²)|q|²` | true |
| 8.1, 8.2 (not targets) | Gaussian susceptibility `1/(2(|b|−dβ))`, `L²/m²` at β = 1 | consistent |

## Dependency check

    depcheck: 241 roadmaps, 2255 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The merge order lists StochasticCalculus (225), RelativisticQuantumFieldTheory (226) and ZerosOfLFunctions (51) before ConstructiveFieldTheoryPhi4 (227); StandardDistributions is on main. No supplier gap is declared and none is needed.

## Verified sound

- **Declarations read:** 60 of 60, every line of `Suggested.lean` (713 lines); each compared with its README statement and with its elaborated type in the worker's listing.
- **Targets read:** all 34 subsections, the Conventions, the five supplier contracts and the two downstream goals, every line of the README (794 lines).
- **Headlines.** The 22 theorems named in the README's second paragraph are all stated; the module docstring says every headline is statable. Padding: none (no declaration follows from one tactic or one library lemma; every definition is used by a stated theorem).
- **Checks tested:** about 115 of roughly 128 bullets recomputed (the values are in the tables above); none false; every definition has at least three.
- **Pinned declarations:** 50 file-and-line locators opened at the pins (42 Mathlib at 1b1ccf4, 8 Tau Ceti at 2fd255d); all correct, including the two repaired Tau Ceti citations and the "not in Mathlib yet" comment of GaussianProjectiveFamily.lean:24–26.
- **Sibling citations checked (7), resolved at this round:** StochasticCalculus §1.1 on main (arbitrary-index extension with uniqueness, README line 879 ff.); StandardDistributions §5.3 on main ("Mixed moments", line 605); ZerosOfLFunctions §5.5 on main with `hadamard_of_orderLE_one` and `OrderLE` (Suggested.lean:78, 115); RelativisticQuantumFieldTheory §7.1 and §7.3 item 1 at its open head (multiplier `(4π²‖ξ‖²+m²)⁻¹`, heat integral, exterior decay for 0 < c < m, radial massless kernel, unsubtracted limit for n ≥ 3); PDE "Scope and ownership" and OperatorAlgebraDynamics D9 on main.
- **Source locators verified (38)** against the cached texts: `aizenman-duminilcopin-2021` (1.4)–(1.8), (1.10)–(1.17), (1.19)–(1.20), Definition 1.1 with footnote 2, Definition 2.1 with (2.1)–(2.4), Definitions 3.1–3.2, (3.1)–(3.9), Lemma 3.3, (3.11), (5.1)–(5.10), Proposition 5.1, Proposition 5.2, Lemma 5.7 with footnote 5, Theorem 7.1, Proposition 7.2; `lebowitz-ruelle-speer-2012` (1.2), Lemma 2.4; `peled-spinka-2017` Theorem 2.13, Propositions 2.14–2.16, Corollary 2.17, (43)–(52), the proof of (46); `sokal-1982` Proposition 2.1 (p. 333), Section 2.3 (p. 334), Lemma 2.2 (p. 337), Section 3.1 (p. 342); `frohlich-1982` (12)–(13) (p. 5), after (33) (p. 13); `simon-2020-twelve-tales` (5.14)–(5.22) (pp. 36–37); `duminilcopin-2017-lectures` Corollary 1.9.
- **Ownership.** Searched the open pull requests and main by object (Lee–Yang, Griffiths inequalities, random currents, switching lemma, chessboard estimate, infrared bound, reflection positivity, Gaussian process with a prescribed kernel, Gaussian free field, Gibbs measure): reflection positivity and infrared bounds occur in RelativisticQuantumFieldTheory only for continuum Schwinger functions and graph integrals; DimerModelsAndLozengeTilings and ClassicalErgodicTheory use Gibbs measures in other senses; no roadmap plans a lattice spin system or a Gaussian process with an arbitrary kernel. This roadmap is the owner. No declaration of `Suggested.lean` has the fully qualified name of a declaration in another readable roadmap.
- **Policy.** The pull request changes only the package folder (6 files). No `lemma` declaration, `set_option`, `#eval`, `True` placeholder, sorry'd data, pull-request number or process narrative. Imports: `Mathlib` and `TauCeti.Combinatorics.Enumerative.PerfectMatching`, which exists at the pin. Every Lean name occurs in the README (checked mechanically, 60 of 60).
- **Arrangement.** `aizenman-duminilcopin-2021` has 52 of 121 named-source citations. Its sections (1 introduction, 2 the class, 3 random currents, 4 intersection estimates, 5 the two-point function, 6 the improved tree diagram bound, 7 the extension) do not map onto Layers 0–7: Layers 1, 5 and 6 have no counterpart section, Sections 4 and 6 have no layer, and Section 5 is split between Layers 3, 4 and 5.

Source independence: 15 passages compared with 6 sources (`aizenman-duminilcopin-2021` lines 168–187, 363–411, 421–482, 1022–1045, 1058–1091, 1314–1345; `lebowitz-ruelle-speer-2012` lines 62–68, 217–222; `peled-spinka-2017` lines 1328–1392, 1490–1493, 1602–1630, 1695–1745; `frohlich-1982` lines 264–269; `sokal-1982` lines 574–580, 620–640, 710–716; `simon-2020-twelve-tales` lines 1501–1556), none shared beyond formulas; largest share aizenman-duminilcopin-2021, 52 of 121 locators; contents compared with aizenman-duminilcopin-2021: independent.

## Not verifiable

- The seven uncertified sources (`griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`) are cited by locator only; their text was not read.
- `sokal-1982` is an OCR scan whose displayed equations are not recognised: (2.17)–(2.30), (2.33), (3.4)–(3.5) were located by page and surrounding prose only.
- Elaboration: I ran no Lean; binders and types were read in the worker's signature listing.
- `isingBlock_tailControl` has no published statement that I could find; it was checked by recomputing the route (a)–(f).
- Truth of the `sorry`'d statements beyond the instances tabulated.
- Agreement of `Suggested.lean` with public formalisations other than the pinned libraries was not searched.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), p. 24 (used again in (5.14)–(5.15), p. 25): the source says the infrared bound has the constant one over twice the total coupling times β; it should be one over the single-bond coupling times β, as in peled-spinka-2017 (52); affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at the list of reflections after (5.2), p. 23: the source says a coordinate is sent to L minus itself with L a half-integer; it should be L an integer, the hyperplane being at L/2; affects nothing.
- **Gap** in aizenman-duminilcopin-2021 at Definition 2.1(1), p. 8: the source says the block coefficients are arbitrary reals; it should be nonnegative coefficients, since coefficients (1, −1) with a strong coupling give a positive fourth cumulant; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at Definition 3.1, p. 10: the source says a current is an integer-valued function on pairs; it should be a function with values in the nonnegative integers, as its weight with factorials requires; affects nothing.
- **Misprint** in aizenman-duminilcopin-2021 at (3.2), p. 10: the source says the product in the weight runs over pairs inside a set written V; it should be the set Λ on which the current is defined; affects nothing.

## For the human reviewers

- **Scope.** `README.md:3`, `:23`, `:751–770` assign the marginal-triviality goals to ConstructiveFieldTheoryPhi4PartII, which exists neither on main nor in any open pull request.
- **Scope.** `isingBlock_tailControl` (`README.md:274`, `Suggested.lean:158`) is a headline whose statement and proof route are the roadmap's own; no cited source states it.
- **Not tested.** Seven of the fourteen sources are uncertified and unread; `griffiths-simon-1973` is the primary source of 2.3.
- **Licence.** `Suggested.lean` was not compared with public Lean formalisations of lattice Gibbs measures or Gaussian free fields; none is cited by the package.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5642a3a0e827cc82b8fb33254362c758b0f90aff", "job": "RT-ConstructiveFieldTheoryPhi4~2b", "model": "fable", "worker": "chris-x80"} -->
