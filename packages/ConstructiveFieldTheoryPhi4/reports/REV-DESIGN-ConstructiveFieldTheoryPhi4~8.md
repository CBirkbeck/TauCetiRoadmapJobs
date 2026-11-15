<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6897276701 -->
Review (claude) of ac16c7a

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) downstream goals 8.1 and 8.2 quantify over every reachability scheme, the cited proofs over `β ≤ β_c`

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:740`: "Every 𝒞-reachable random field that has a two-point Schwinger function S_2 satisfying the decay condition (1.10) is a generalised Gaussian process"; `:750` the same for the Griffiths–Simon class; `design/plan.json`, downstream goals 8.1 and 8.2, hypothesis "Phi C-reachable".

   **Claim.** For d ≥ 4, Gaussianity holds for the limit of every convergent scheme of 7.2, where `J_n ≥ 0` is arbitrary.

   **Witness.** `aizenman-duminilcopin-2021 lines 122–128` (the d > 4 citation of 8.1) restricts to scaling limits at β ≤ β_c; `lines 323–324` (Proposition 1.4), `1438–1442` and `2014–2015` (Proposition 7.2) assume β ≤ β_c and L ≤ ξ(β); `line 554` says the infinite-volume switching lemma is straightforward only for β ≤ β_c.

   Instance. Take d = 4, ρ_n = ρ_I and `J_n ↓ β_c(ρ_I)` from above, with L_n of the order of the low-temperature correlation length. This is a scheme of 7.2. If its limit has a decaying S_2, statements 8.1 and 8.2 assert that it is Gaussian. No cited result covers it: for d ≥ 5 the cited passage itself carries the hypothesis the README drops, and for d = 4 the source's Theorem 1.2 is worded for all reachable fields while its proof is for β ≤ β_c (recorded under Source issues).

   **Exact repair.** In 8.1 replace "Every 𝒞-reachable random field that has" by "Every random field reachable from 𝒞 by a convergent scheme with `J_n ≤ β_c(ρ_n, J^{nn})` for every n, where `β_c` is the critical point of 4.3 for the nearest-neighbour coupling of strength 1, and that has". Make the same replacement in 8.2. After the locators of 8.1 add: "The cited estimates (Proposition 1.4 and Proposition 7.2) hold for β ≤ β_c and L ≤ ξ(β); schemes with couplings above the critical point are not part of the statement." In `design/plan.json`, add the hypothesis "J_n <= beta_c(rho_n) for every n (4.3, unit nearest-neighbour coupling)" to downstream goals 8.1 and 8.2, add `target:4.3` to their prerequisites, and in README line 736 write "Layers 0, 2, 4, 6 and 7".

   Tested on the instance: the scheme with `J_n > β_c(ρ_I)` no longer satisfies the hypothesis, so nothing is asserted about it. The Checks of 8.1 and 8.2 keep their force. The d = 1 telegraph scheme has `β_c(ρ_I) = ∞` (4.3, first Check: `χ = (1 + t)/(1 − t) < ∞` for every J), so it satisfies the new hypothesis and still shows that d ≥ 4 is needed. White noise has J_n = 0 ≤ β_c. "8.2 implies 8.1" still holds, because the hypothesis is the same on both sides and reachability is monotone in 𝒞.

One finding (R01, P2), in the two downstream-goal statements 8.1 and 8.2; it has an exact repair. Both round-7 findings are repaired. Every owned target (Layers 0–7) that was recomputed this round is sound. The design files and the source manifest were left unchanged. Elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so no Lean command was run and there is nothing to probe for padding.

## Previous findings, checked first

| Round-7 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) two `*Needs:*` lines name a Mathlib declaration their plan entries lack | `packages/ConstructiveFieldTheoryPhi4/design/plan.json`, target 0.1 prerequisites: "mathlib:MeasureTheory.Measure.pi", "mathlib:MeasureTheory.Measure.map", "mathlib:MeasureTheory.Integrable.mono'"; target 0.2: "mathlib:Real.Gamma", "mathlib:MeasureTheory.ProbabilityMeasure", "target:0.1" | **Repaired.** Both names exist at the pin (`Mathlib/MeasureTheory/Measure/Map.lean:96`; `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`). |
| F02 (P3) a sentence that reads as history | `packages/ConstructiveFieldTheoryPhi4/design/README.md:736`: "This roadmap ends with Layer 7. The two statements below, numbered 8.1 and 8.2, are the goals of ConstructiveFieldTheoryPhi4PartII, stated with their sources so that the hypotheses Layers 0, 2, 6 and 7 must serve are visible; they are not targets of this roadmap." | **Repaired.** The added "Layer 0" is correct: the class of 8.1 is defined in 0.2 and plan 8.1 lists `target:0.2`. The plan's two ownership notes now read "not a target of this roadmap". |

Pattern sweep. I set the 34 `*Needs:*` lines beside the prerequisite lists of the 36 owned plan entries: the Mathlib and Tau Ceti names agree on both sides, and the four roadmap suppliers appear in both (2.1, 6.1, 6.3, 6.4, 7.4). A search of the README for "so far", "current(ly)", "removed", "round", "review", "pull request", "optional", "deferred", "for later" and for LaTeX delimiters finds nothing; "lemma" occurs only in the names of results (switching lemma, Ginibre's lemma, Fatou's lemma, Lemma 2.4, Lemma 3.3, Lemma 5.7, Lemma 2.2). The adversarial pass on the repaired paragraph produced R01: the paragraph introduces the two statements whose hypotheses were recomputed below.

## Verified sound

**Coverage.** All 773 README lines read; `plan.json` parsed (8 layers, 36 owned targets, 2 downstream goals, `gaps: []`, four suppliers); the 14-entry manifest; the round-7 review and its repair report; the diff of the two heads (one README paragraph, two prerequisite lists, two ownership notes); the overlap and citation leads (both empty); the package index. No maintainer notes exist, no gap is declared, and the author flagged no locator as unverified.

**Principles.** No route-specific shortcut: Lee–Yang is stated for site-dependent complex fields and any ferromagnetic coupling, FKG without evenness, Gaussian processes on an arbitrary index type. No re-planned roadmap: Kolmogorov extension, Wick–Isserlis, Hadamard factorisation and the continuum Green kernels are imported. One direction of supply (gate below). No algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file).

**Adversarial table.** Values recomputed by hand this round; `t = tanh J`. The table covers the fifteen sampled targets, the headline theorems and the target of R01. For the unsampled sections I relied on the round-7 rows, which carry computed values, and spot-recomputed 1.1, 1.5, 2.1, 3.4, 3.5, 3.7, 5.4, 5.5, 7.1 and 7.3 (rows below).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 admissibility | density `∝ exp(−φ² log(1+φ²))`; N(0,1) on two sites, J ≥ 1; `(2δ₋₁+δ₁)/3` | `cφ² − φ² log(1+φ²) → −∞` for every c, `\|φ\|^α − φ² log(1+φ²) → +∞` for α > 2; form `½(x²+y²) − Jxy` positive definite iff \|J\| < 1; mean `(−2+1)/3 = −1/3` | sound; "every c" needed |
| 0.2 φ⁴, Gaussian, Ising | u = λφ⁴; s-scaling; λ → ∞ | `∫φ^{2k} = λ^{−k/2}Γ((2k+1)/4)/Γ(1/4)`: 0.33799/√λ at k = 1, 1/(4λ) at k = 2; image under φ ↦ sφ has exponent `−λs⁻⁴ψ⁴ + bs⁻²ψ²`; `−λφ⁴+2λφ² = −λ(φ²−1)² + λ`; for \|φ\| > 2 the weight is at most `e^{−9(λ−1)}e^{−(φ²−1)²}` against a normaliser of order λ^{−1/2}, so the sup over λ ≥ 1 is finite; `γ_b` has variance 1/(2\|b\|) | sound |
| 1.1 Gibbs measure | 3 Ising sites, all pairs J | 2 configurations of weight `e^{3J}`, 6 of weight `e^{−J}`: `Z = (e^{3J}+3e^{−J})/4`, `⟨σ₁σ₂⟩ = (2e^{3J} − 2e^{−J})/(2e^{3J}+6e^{−J})` | sound |
| 1.3 coupling derivative | 2 Ising sites; J = 0, even ρ; diagonal | `d/dJ tanh J = 1 − t²`; `⟨φ_x²φ_y²⟩ − 0 = (∫φ²)²`; `J_{xx}` absent from H gives 0, a diagonal convention would give `½⟨F;φ_x²⟩` | sound |
| 1.4 continuity in ρ | `ρ_k = (1−e^{−k})δ₀ + ½e^{−k}(δ_k+δ_{−k})`, 2 sites, J = 1 | both sites at k: probability `¼e^{−2k}`, weight `e^{k²}`, so `Z(ρ_k) ≥ ¼e^{k²−2k} → ∞`, `Z(δ₀) = 1` | sound; uniform bound needed |
| 1.5 Gaussian fields | 2 sites; d = 1 | determinant `4b² − J²`, negative at J = −3\|b\|; `(2π)⁻¹∫dp/(2+μ²−2cos p) = ((2+μ²)² − 4)^{−1/2} = 1/(μ√(4+μ²))` | sound |
| 2.1 Lee–Yang, blocks | pair polynomial; q = (½,½); q = (1,−1); uniform on {−1,0,1}; ρ_I | `\|1+az\|² − \|a+z\|² = (1−a²)(1−\|z\|²)`; weights `¼e^K`, `½e^{−K}`, equal iff `e^{2K} = 2`; `ε = 1/(1+e^{2K})`, `16ε > 48ε²` iff ε < 1/3; zeros `i·2π(n+1/3)`, `(2π)⁻²·4π²/3 = 1/3 = ½·(2/3)`; `Σ((k+½)π)⁻² = ½`, `−12·(1/6) = −2 = 1 − 3` | sound; nonnegative weights needed |
| 2.2 class and tail control | steps (a)–(f); N(0,1) blocks; `(1−ε)δ₀+½ε(δ₁+δ₋₁)`; blocks `Σσ_i/(√N log N)` | Paley–Zygmund `(½)²σ⁴/(3σ⁴) = 1/12`; `log(1+u) ≥ u log 2` on (0,1] gives `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`, limsup `θ log C + θ^{1−α′/2} → 0` since α′ < 2; at most S/(2θ) factors exceed θ; `E[e^{√(2c)gφ}] = e^{cφ²}` and `E[(1+cSg²)^m e^{g²/4}] < ∞`; all `x_{N,j} ≤ 4/(π²N)`, total ½; `ε > 3ε²` iff ε < 1/3; `2^{1−N}exp(N^{α/2}/log^αN) → ∞`, `(1 − 2/47.72)^{−1/2} = 1.0216` | sound; growth condition on the limit, not the approximants |
| 2.3 φ⁴ as limit | `c = (12λ)^{−1/4}`, `m = φN^{−1/4}/c` | Gibbs weight `exp(g_N(S²−N)/(2N))`; `(g_N−1)Nm²/2 = bφ²`; `Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴`; next term `Nm⁶/30 = O(N^{−1/2})`; for \|m\| > ½, `N(I − m²/2) ≥ N/192` against `c^αN^{α/4}`, α < 4; `g_N > 0` iff `N > 4b²c⁴` | sound |
| 3.1 Griffiths I, II | duplication; `(2δ₋₁+δ₁)/3`; J < 0 | `(s_xs_y + t_xt_y)/2 = φ_xφ_y + φ′_xφ′_y`; Ginibre integrand odd under swap for n odd and under negation for m+n odd; `⟨φ⟩ = −1/3`; `tanh J < 0` | sound; evenness and J ≥ 0 needed |
| 3.3 FKG | lattice gas on 2 sites | `[e^J(3+e^J) − (1+e^J)²]/(3+e^J)² = (e^J − 1)/(3+e^J)²`, ≥ 0 iff J ≥ 0; `∂²(−H)/∂φ_x∂φ_y = J_{xy}` | sound; no evenness used |
| 3.4 switching lemma | 2 sites, A = B = {x,y} | `Σ_even = cosh J = Z` (the factor `2^{−\|V\|}` of ρ_I cancels the spin sum), `sinh²J = cosh²J − 1` | sound |
| 3.5 Lebowitz, Gaussian, Simon–Lieb | ρ_I; `ρ_{λ,0}`; chain; block reduction | `1 ≤ 3`; `0.25 ≤ 3·0.33799² = 0.3427`; `t² ≤ Jt`; with `J̃ = J_{uv}q_kq_l` the Ising inequality sums to `Σ⟨φ₀φ_u⟩_Λ J_{uv}⟨φ_vφ_y⟩` | sound |
| 3.6 reflection monotonicity | coefficients; chain R(x) = 3−x; `J₀₂ = J₁₃ = K`; lattice planes | pair {x,y} ⊂ V₊ contributes `½(J_{xy}+J_{x,Ry})s_xs_y + ½(J_{xy}−J_{x,Ry})t_xt_y`; `J_{x,Rx}φ_xφ_{Rx} = ¼J(s²−t²)`; `t ≥ t²`, `1 ≥ t³`; `0 < tanh K`; half-integer plane forces y = x, integer and diagonal planes put x and Ry at distance ≥ 2 | sound; `J_{xy} ≥ J_{x,Ry}` needed |
| 3.7 moment bounds | F = φ_x; ε = ¼, a = 2 | `4λm² − (2b₊+‖J‖)m − 1 ≤ 0`; `0.75 + 0.25·3.7622 = 1.6905 > e^{1/2} = 1.6487`; coefficients of a⁴: ε/24 against ε²/8 | sound |
| 4.1 monotone limits | open chain; W_n = {−n,…,2n}; exponential moments | `⟨σ₀σ_x⟩_{V_R} = t^{\|x\|}` for R ≥ \|x\|; `⟨cosh aφ_x⟩ = Σa^{2k}⟨φ_x^{2k}⟩/(2k)!` is monotone in the volume, so bounds on boxes pass to every exhaustion | sound |
| 4.3 susceptibility, critical point | d = 1 Ising, J = ¼ and 1; Λ = {0} | `1 + 2t/(1−t) = (1+t)/(1−t) = e^{2J}`: 1.649 ≤ 2 and 7.389 with no bound claimed; `max χ_R ≤ 1 + 2dJ max χ_R`; χ(ρ, 0) = ∫φ² | sound |
| 5.1 periodic measures | L = 1, d = 1; 4-cycle | `x + e₁ = x − e₁` gives coupling 2J, `Ŝ(0) = 1 + tanh 2J`, `Ŝ(π) = 1 − tanh 2J`; cycle `(t + t³)/(1 + t⁴)`; `\|1 − e^{ip}\|² = 2 − 2cos p`; `\|Λ*_L\| = (2L)^d` | sound |
| 5.2 reflection positivity | L = 1 edge reflection; J = 0, L = 2, f = φ₀ | matrix `[[e^{2J}, e^{−2J}],[e^{−2J}, e^{2J}]]` positive semidefinite iff J ≥ 0; vertex form `⟨φ₀²⟩ = 1` against `\|Ef\|² = 0`; chessboard at L = 1 is Cauchy–Schwarz for the form | sound |
| 5.3 Gaussian domination | expansion; L = 1 Ising | `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}`; `−(J/2)ΣΣ(∇φ)² = JΣΣφφ − dJΣφ²`; second derivative `−4J + e^{−4J}(32J² − 4J)`, max of `e^{−4J}(8J−1)` is `2e^{−3/2} = 0.446`; at J = 0.1, u = 2: `Z(u) = 2.54 ≤ 3.34 = Z(0)` | sound |
| 5.4 infrared bound | h = e^{ip·x}; L = 1; Gaussian torus | `JE²\|T\|Ŝ ≤ E\|T\|`; `2u(1 − tanh u)` at u = 0.64 is 0.557; `Ŝ = 1/(2(\|b\|−dJ) + JE)`, `EŜ ↑ 1/J`, above `1/(4dJ)` | sound |
| 5.5 long-range order | sum rule; d = 3 | `1 ≤ \|T\|⁻¹Ŝ(0) + (J\|T\|)⁻¹Σ_{p≠0}1/E(p)`; `I₃ = W/2 = 0.2527 = 1.516/6` | sound |
| 6.3, 6.4 Gaussian processes, Wick | `[[1,2],[2,1]]`; random-sign field | `Var(X₁−X₂) = −2`; `M₄ = (∫fh)⁴ ≠ 3(∫fh)⁴` | sound |
| 7.1 rescaled field | tent at 3, R = 4L; 3-site chain | `1 + 2Σ_{j≤L}(1−j/L)² = (2L²+1)/(3L)`, ratio → 1/3 = ½·(2/3); `3 + 4t + 2t²` | sound |
| 7.3 structure | `(δ₀+δ₁)/2`; diluted ρ_n | `Σ_L = N/4 + N²/4`, mean → `2^{−d}∫f`; site variance `2 − p_n`, lattice variance → `2^{−d}∫f²`, limit variance `2^{−d−1}∫f²` | sound |
| 7.4 free field | d = 1; lattice scaling; massless constant | `∫∫_{Q²}e^{−m\|x−y\|} = 4/m − 2(1−e^{−2m})/m²`, so `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`: `1 + e^{−2}` at m = 1, ≈ 2/m as m → 0; powers of L: `L^{2d}·L^{−d}·L^{−(d+2)}·L² = 1`; q = 2πξ turns `(2π)^{−d}∫\|F\|²/(\|q\|²+m²)dq` into C_m; `4sin²(θ/2) ≥ 4θ²/π²`; `(d−2)\|S^{d−1}\| = 4π^{d/2}/Γ(d/2−1)`, 1/(4π) at d = 3 | sound |
| 8.1, 8.2 downstream goals | scheme with `J_n ↓ β_c` from above, d = 4 | cited estimates need β ≤ β_c and L ≤ ξ(β); d = 1 telegraph has β_c = ∞ | **R01** |

**Seeded source sample.** All fifteen targets checked against the cached texts.

| Target | Lines read | Outcome |
|---|---|---|
| 0.1 | `aizenman-duminilcopin-2021 line 384` | (2.2), growth for some α > 2 |
| 0.2 | `aizenman-duminilcopin-2021 lines 145`, `220–230`, `257`; `simon-2020-twelve-tales line 1021` | (1.12) with sign +bφ²; (1.16)–(1.17); (1.20) hard limit; opposite sign of b in Simon |
| 1.3 | `peled-spinka-2017 lines 519–526` | derivative of a correlation in a coupling is a covariance (Ising and O(2) spins; the general single-site case is the roadmap's own, by the cited Mathlib lemma) |
| 1.4 | `aizenman-duminilcopin-2021 lines 1982–1985`, `2019–2022` | passage to weak limits asserted, not proved; the README says so |
| 2.2 | `aizenman-duminilcopin-2021 lines 363–386` | Definition 2.1 and (2.2): growth asked of the limit |
| 2.3 | `aizenman-duminilcopin-2021 lines 392–406`; `simon-2020-twelve-tales lines 1019–1030` | block averages, mean-field inner coupling, g_N → 1; second-order de Moivre–Laplace |
| 3.1 | `peled-spinka-2017 lines 334`, `515`, `535`; `sokal-1982 lines 414–415` (p. 327); `simon-2020-twelve-tales lines 977–984` | Theorems 2.1, 2.3 and Lemma 2.4; item (d); GKS for continuous spins |
| 3.3 | `sokal-1982 lines 423–424` | item (h), FKG for increasing functions |
| 3.6 | `aizenman-duminilcopin-2021 lines 1023–1038`; `sokal-1982 lines 436–444`, `455–466` | (5.2) and the two families of reflections; item (k); the Remark on exhaustions |
| 4.1 | `sokal-1982 lines 400–411`; `peled-spinka-2017 lines 527–532`; `aizenman-duminilcopin-2021 lines 231–233` | monotone infinite-volume limit by Griffiths' inequalities |
| 4.3 | `aizenman-duminilcopin-2021 lines 1017–1020`; `sokal-1982 lines 470`, `574` | (5.1); susceptibility; Proposition 2.1 |
| 5.1 | `aizenman-duminilcopin-2021 lines 1058–1084`; `peled-spinka-2017 lines 1283–1284` | (5.5)–(5.8); the torus of side 2L |
| 5.2 | `peled-spinka-2017 lines 1328–1333`, `1385–1388`, `1490–1493` | Propositions 2.14, 2.15, 2.16; the chessboard estimate has the form restated |
| 5.3 | `peled-spinka-2017 lines 1563–1648`; `simon-2020-twelve-tales lines 1529–1546` | (43)–(48) and the pinned Gaussian remark; (5.19)–(5.21) |
| 7.4 | `sokal-1982 lines 620–626`, `710–721`; `frohlich-1982 lines 266–269`; `simon-2020-twelve-tales lines 960–975` | Section 2.3, Lemma 2.2; free lattice field at λ = 0; (3.8) |

Also read: `aizenman-duminilcopin-2021 lines 54–60`, `77–89`, `120–128`, `150–192`, `296–345`, `419–432`, `470–476`, `498–508`, `518–521`, `554`, `1040–1050`, `1085–1091`, `1312–1316`, `1340–1344`, `1436–1443`, `1994–2032`; `lebowitz-ruelle-speer-2012 lines 62–69`, `217–222`; `duminilcopin-2017-lectures lines 549–551`; `frohlich-1982 lines 105–115`; `simon-2020-twelve-tales lines 1011–1018`.

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, as `lake-manifest.json` of the content repository records. All 39 file-and-line citations of the supplier contracts were opened and each line carries the named declaration. Signatures relied on:

- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`: `multivariateGaussian (μ : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ)`. It is the Dirac measure at μ when S is not positive semidefinite, which is why 6.3 states semidefiniteness.
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:241`: `measurePreserving_restrict₂_multivariateGaussian` needs `S.PosSemidef`.
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`: `fkg` is stated for a finite distributive lattice; it says nothing about ℝ^V, as the README notes.
- `Mathlib/Analysis/Complex/AbsMax.lean:404`: `Complex.norm_le_of_forall_mem_frontier_norm_le` needs a bounded set and `DiffContOnCl`.
- `Mathlib/MeasureTheory/Measure/Prokhorov.lean:636`: `MeasureTheory.isTightMeasureSet_of_isCompact_closure`, complete second-countable metric space; `:530` `isCompact_closure_of_isTightMeasureSet`, root namespace.
- `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`: countable index, standard Borel coordinates, probability measures.
- `TauCeti/Probability/Moments/Determinacy.lean:246`: both measures need an exponential moment `∫e^{a|x|}`.

**Duplication and ownership.** `roadmaps grep` over main and the 475 open heads, by object:

- "Lee–Yang", "Ising model/spin", "switching lemma/random current", "Gaussian free field" and "white noise" match nowhere.
- "FKG" matches ArithmeticStatisticsPartIV and one line on main, neither about measures on ℝ^V.
- "Gibbs measure" matches ClassicalErgodicTheory (shift spaces) and the PDE scope sentence.
- "infrared bound", "Gaussian domination", "Schwinger function" and reflection positivity match RelativisticQuantumFieldTheory only, for dominated-convergence bounds and continuum free Schwinger functions (§7.1), a different object from the lattice statements here.
- "Gaussian process" matches StochasticCalculus Layer 1 (Brownian motion) and two statistics roadmaps (limit processes); none states existence for an arbitrary positive semidefinite kernel.

This roadmap is the owner of the lattice objects, of the Lee–Yang theorem and of the kernel-indexed Gaussian process. `ConstructiveFieldTheoryPhi4PartII` is on neither main, the open heads nor the board's package index; it is named only as a consumer. Ownership against the open pull requests was checked through the roadmaps tool at the heads of the index. The overlap report lists no changing pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations resolved now:

- StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`): the arbitrary-index extension for standard Borel state spaces and consistent probability laws is stated there. Line 213 of the merge order.
- StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, mixed moments at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `Suggested.lean:110` `hadamard_of_orderLE_one`, `:73` `OrderLE`): the statement is the multipliable product with exponent `a + bs`, as the contract says. Line 47 of the merge order.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder; line 214 of the merge order): heat-integral kernel, Mathlib-normalised multiplier `(4π²‖ξ‖²+m²)⁻¹`, exterior decay for 0 < c < m, massless kernel `|x|^{2−n}/((n−2)|S^{n−1}|)` with the harmonic ambiguity classified. That roadmap does not cite this one.
- Scope deferrals: PDE, Scope and ownership (`TauCetiRoadmap/PDE/README.md:104–108`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`) exist as cited.

Every `*Needs:*` item is a target here, a resolved supplier section or a pinned declaration; no target needs a later one.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API list and at least three Checks; every theorem a locator or the roadmap's own derivation with its route. The layer order is forced: 1 needs 0; 2 needs 1 (1.1, 1.2, 1.4); 3 needs 2 (3.5, 3.7); 4 needs 3; 5 needs only 0–1; 6 needs only suppliers; 7 needs 1, 3.2 and 6. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap.

**Headlines.** The Lee–Yang theorem and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity, uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Remark, no change asked.** Many README locators are line numbers of the cached extractions. Most carry an equation, theorem or page as well; the package stage can pair the rest (for example the Sokal and Peled–Spinka line ranges) with a page.

**Copyright.** Wording compared at every locator of the sample and at six further passages: the definition of 7.2 against `aizenman-duminilcopin-2021 lines 167–179`; the Asano route of 2.1 against `lebowitz-ruelle-speer-2012 lines 217–222`; the Griffiths-trick Check against `simon-2020-twelve-tales lines 1011–1018`; the pinned Gaussian Check of 5.3 against `peled-spinka-2017 lines 1633–1648`; the boundary-condition sentence of 1.5 against `sokal-1982 lines 394–396`; 4.4 against `aizenman-duminilcopin-2021 lines 1040–1050`. No shared run beyond formulas and standard names. Arrangement: the most cited source has sections 1 (introduction and main result), 2 (the class), 3 (random currents), 4 (conditional proof), 5 (regularity of the two-point function), 6 (unconditional proofs), 7 (extension to the class). The roadmap places that source's §1 material last (Layers 6–7), draws Layer 3 from its §3, §5.1 and §7 together, takes Layer 5 mostly from another source, and has no counterpart of §4 and §6. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 21 passages compared with 7 sources, none shared; largest share aizenman-duminilcopin-2021, 36 of 94 parenthetical locators by my count; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.19)–(2.30): the extraction drops displayed formulas; the surrounding sentences were read and the formulas recomputed. The equation numbers of items (d) and (h) were inferred from the numbers the text prints for (f) and (k).
- The Riemann-sum limit of 5.4 for the singular integrand `1/E(p)` in d ≥ 3 and the L² convergence step of 7.4 were checked for scaling, constants and the dominating bound, not written out in full.
- Whether a scheme with couplings above the critical point can have a non-Gaussian limit with decaying S_2 (R01) is not known to me; the finding is that no cited result excludes it.

## Source issues

- **Gap** in aizenman-duminilcopin-2021 at Section 7, opening paragraph and the paragraph after Proposition 7.2, preprint pp. 44–45: the source says Ising-block results pass to weak limits with the growth condition by continuity; it should supply tail control of the approximants, for instance from the Lee–Yang property; affects the proof.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the displayed symbol; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Theorem 1.2, preprint p. 5: the source says every reachable field with decaying two-point function is Gaussian; it should restrict to, or treat, parameter sequences beyond β ≤ β_c and L ≤ ξ(β), the range of its Proposition 1.4; affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at Section 5.1, first bullet after (5.2), preprint p. 23: the source says a coordinate is sent to L minus itself with L a half-integer; it should take the mirror coordinate in the half-integers, so L an integer; affects nothing.
- **Misprint** in simon-2020-twelve-tales at (5.19), p. 36: the source says the two shifts enter with the same sign and an index not bound by the sum; it should be the difference of the shifts at the two neighbouring sites; affects nothing.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators, and each statement citing them also has a locator in a text that was read or the roadmap's own derivation.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), an OCR scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:732–756` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ac16c7add340ff9cdc9efd7fa091ef51ce40702e", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~8", "model": "fable", "worker": "chris-x29"} -->
