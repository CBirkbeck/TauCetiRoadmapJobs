<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6849175011 -->
Review (claude) of d9ac392

Verdict: needs_changes

1. **F01** (P2) The Griffiths–Simon finite-volume transfer has no route, and its listed inputs cannot supply the tail control

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:248` and `:250`: "there exists a sequence of Ising-block measures η_k converging weakly to ρ such that `μ_{V,J,η_k} → μ_{V,J,ρ}` … including the choice and tail control of the approximants"; "*Needs:* 0.1; 1.1; 1.2; 1.4 …; 2.1". Same in `design/plan.json`, layer 2, target 2.2, API item 4.

   **Claim.** The transfer is a theorem of this roadmap, provable from 0.1, 1.1, 1.2, 1.4 and 2.1, with Aizenman–Duminil-Copin as locator. Every Griffiths–Simon-class statement of the roadmap passes through it (3.5, Newman's bound in 3.7, 4.1–4.3, downstream goal 8.2).

   **Witness.** (a) The cited passages (`aizenman-duminilcopin-2021 line 1985` and `lines 2019–2022`) assert the passage "by continuity" and prove nothing. (b) The only analytic input named, 1.4, needs `sup_k ∫e^{cφ²}dη_k < ∞`, which is exactly what is missing. (c) Nothing the roadmap proves about block laws gives it: `(1 − 1/k)ρ_I + (1/k)N(0,1)` is even, satisfies `∫φ^{2n} ≤ (2n−1)!!(∫φ²)ⁿ` (values `1 − 1/k + (2n−1)!!/k ≤ (2n−1)!!`, variance 1), converges weakly to ρ_I, and has Z = ∞ on two sites with J ≥ 1 (README 0.1 Check). So the tail control must come from a property of Ising blocks that no layer states. I know one: the Lee–Yang property, which the Scope (`README.md:19`) declares "not part of this roadmap".

   I do not claim that no elementary route exists; I claim that none is named, the source gives none, and the named inputs do not suffice by any argument I can find. That is why this is P2 and not P1. The statement itself is true; in fact more is true, which simplifies it.

   **Exact repair.** Three additions, no renumbering.

   1. In 2.1, add the API fact (Lee–Yang property of block laws): for an Ising-block measure with ferromagnetic K and weights q ≥ 0, the entire function `E(h) = ∫e^{hφ}dρ_{N,K,q}` has no zero with Re h ≠ 0; consequently `E(h) = Π_j (1 + h²/a_j²)` with `a_j > 0`, `Σ_j a_j⁻² = ½∫φ²dρ`. Inputs: the Lee–Yang circle theorem for a ferromagnetic Ising system with site-dependent fields of positive real part (a new target of 2.1, stated with its hypotheses; Lee–Yang 1952; Lieb–Sokal 1981), the case of some `q_n = 0` by a limit; and the factorisation of an even entire function of order ≤ 1 with purely imaginary zeros (resolve against ZerosOfLFunctions, Layer 5 "Hadamard factorization", which is earlier in the merge order, or prove it directly for finite exponential sums). The nonnegativity of q is used here: add the mixed-sign control `q = (1, −1)`, `K = (ln 3)/2`, where `E(h) = (3 + cosh 2h)/4` vanishes at `cosh 2h = −3`, that is at `h = ±½arccosh 3 + iπ/2` with real part ±0.881: the property fails, as it must for a non-member (2.1 Checks).
   2. In 2.2, add the API fact (tail control) before the transfer: if block measures η_k converge weakly to ρ and `∫exp(|φ|^α)dρ < ∞` for some α > 2, then for every real c there is k₀ with `sup_{k≥k₀} ∫e^{cφ²}dη_k < ∞`. Route: with `x_{k,j} = a_{k,j}⁻²`, the measures `ν_k = Σ_j x_{k,j} δ_{x_{k,j}}` on `[0, ½sup_k σ_k²]` have mass `½σ_k²` (bounded: `∫φ⁴ ≤ 3σ⁴` and Paley–Zygmund give `η_k(φ² ≥ σ_k²/2) ≥ 1/12`, and the η_k are tight); `log E_k(h) = ∫ x⁻¹log(1 + h²x) dν_k(x)` for real h; a weak limit ν has `log E_ρ(h) = βh² + ∫_{x>0} x⁻¹log(1 + h²x) dν`, `β = ν({0})`; the growth condition gives `E_ρ(h) ≤ C exp(C h^{α/(α−1)})` with `α/(α−1) < 2`, so β = 0; hence for every δ > 0 there are η > 0 and k₀ with `ν_k([0, η)) ≤ δ` for k ≥ k₀, so `E_k(h) ≤ (1 + h²·½σ²_max)^{M} e^{δh²}` with `M ≤ ½σ²_max/η`; finally `∫e^{cφ²}dη_k = E_g[E_k(√(2c) g)]` for a standard normal g, finite uniformly once `4cδ < 1`.
   3. Restate the transfer as: for every ρ in the class, **every** sequence of Ising-block measures converging weakly to ρ, every finite V, every ferromagnetic J and every continuous polynomially bounded F, `Z_{V,J}(η_k) → Z_{V,J}(ρ)`, `⟨F⟩_{V,J,η_k} → ⟨F⟩_{V,J,ρ}` and `μ_{V,J,η_k} → μ_{V,J,ρ}` weakly (tail control, then 1.4 on the tail of the sequence). The "one sequence must serve … simultaneously" clause becomes a consequence and is deleted. *Needs:* 0.1; 1.1; 1.2; 1.4; 2.1 (Lee–Yang property); the factorisation input chosen in item 1.

   Then: change `README.md:19` to exclude Lee–Yang theory beyond the zero theorem of 2.1; adjust `:716` likewise; keep the plan's 2.1 and 2.2 API in step; record the new works in `sources.toml` through the sources service (T. D. Lee and C. N. Yang, Phys. Rev. 87 (1952), 410–419; C. M. Newman, Comm. Pure Appl. Math. 27 (1974), 143–159; E. H. Lieb and A. D. Sokal, Comm. Math. Phys. 80 (1981), 153–179) and check their locators, which I did not read. `sokal-1982 lines 428–433` (item (i)) and `aizenman-duminilcopin-2021 lines 387–388` name the Lee–Yang property and are readable now.

   **Repair test.** On the witness: the mixture is not a block law (its support is unbounded), so the restated theorem, which quantifies over block sequences only, does not apply to it and is not refuted; what excludes its behaviour for block sequences is the factorisation, under which the Gaussian factor `e^{βh²}` of a limit is the mass of ν_k escaping to x = 0, and β = 0 for a thin-tailed limit. On `X_N = Σσ_i/(√N log N)` (README `:257`): `E_N(h) = cosh(h/(√N log N))^N`, `Σ_j a_j⁻² = N · (N log²N)⁻¹ · ½ = 1/(2 log²N) = ½σ_N²` (using `Σ_{n≥0} ((n+½)π)⁻² = ½`), and the lemma's conclusion is `∫e^{cX_N²} ≤ (1 − 2c/log²N)^{−1/2}`, which is 1.069 at c = 1, log N = 4 and tends to 1 = `∫e^{cφ²}dδ₀`. On the Curie–Weiss sequence of 2.3 the conclusion agrees with the quartic tails proved there.

2. **F02** (P3) The §2.2 Check on shrinking blocks draws an inference its own example refutes

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:257`: "For every α > 2 their exponential α-moments are at least `2^{1−N} exp(N^{α/2}/(log N)^α) → ∞` … transfer must allow a suitable choice of approximants." Plan 2.2, test 4.

   **Claim.** The sequence X_N is a bad approximating sequence for δ₀, so the transfer needs a choice.

   **Witness.** Transfer (via 1.4) needs quadratic exponential moments, not α-moments. `E e^{aX_N} = cosh(a/(√N log N))^N ≤ e^{a²/(2 log²N)}`, so `E e^{cX_N²} ≤ (1 − 2c/log²N)^{−1/2} → 1`. On two sites, `Z(η_N) → 1 = Z(δ₀)`: this sequence transfers.

   **Exact repair.** Keep the two computed facts and replace the conclusion: the α-moments of approximants are not controlled by the limit (so the growth condition cannot be asked of the sequence), while the quadratic exponential moments are, `≤ (1 − 2c/log²N)^{−1/2}` for `log²N > 2c`, which is what 1.4 uses. Tested on the same X_N (values above).

3. **F03** (P3) Layer 0 Dependencies omit two declarations its targets need

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:136`: "Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.map`, `MeasureTheory.Measure.IsNegInvariant`, `ProbabilityTheory.gaussianReal`, `integral_gaussian`, `Real.Gamma`, `MeasureTheory.ProbabilityMeasure`. No other roadmap."

   **Witness.** The 0.1 `*Needs:*` line (`README.md:100`) lists `ProbabilityTheory.integrableExpSet` and `MeasureTheory.Integrable.mono'`; neither is in the layer's Dependencies. The other seven layers' Dependencies were compared with their `*Needs:*` lines item by item and agree.

   **Exact repair.** Add both names to line 136.

Three findings: one P2 and two P3. The three findings of round 4 are all repaired. The design files and the source manifest were left unchanged.

## Previous findings, checked first

| Round-4 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P2) sparse-law range, mixed-sign non-members | `design/README.md:255`: "with 0 < ε < 1/3 is even and admissible but is not in the class … at ε = 0 the measure is δ₀, a member"; `:236` "A mixed-sign representation alone does not exclude a measure: at K = 0 …"; `:274` restricts the non-member to "a pair coupling K > (ln 2)/2". Plan test `lebowitz_test` agrees. | **Repaired.** Recomputed: ε = 0: 0 = 0; ε = ¼: ¼ > 3/16; ε = 1/3: 1/3 = 1/3. K = 0: law (¼, ½, ¼) on (−2, 0, 2), equal to the block q = (1,1); K = (ln 3)/2: ε = ¼, 16ε = 4 > 48ε² = 3. |
| F02 (P2) measurability in the dominated-integrability API | `design/README.md:93`: "every ρ-a.e. measurable F : ℝ → ℝ with `|F(φ)| ≤ C e^{cφ²}` for ρ-almost every φ … is ρ-integrable"; Check at `:108`; contract at `:45`. | **Repaired.** `MeasureTheory.Integrable` and `Integrable.mono'` opened at `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58` and `:104`; `mono'` takes the a.e. strong measurability separately. |
| F03 (P3) pair counting | `design/README.md:25`: "minus the sum over unordered pairs … equivalently, it is minus one half of the sum over ordered pairs"; `:157` "omitting the factor ½ from the ordered-pair sum". | **Repaired.** Two Ising sites at J = (log 3)/2: both forms give H(1,1) = −J, Z = 2/√3, correlation ½; no-½ ordered sum gives 4/5; half-unordered gives 2 − √3. |

The repaired patterns were searched in the rest of both files (every "1/3", every "ordered", every integrability claim over a class of functions): the §3.7 Newman Check now reads "0 < ε < 1/3", §3.3 says "measurable non-decreasing F, G"; no further instance found. The pattern sweep is what led to R01 and R02: the §2.2 Check added in an earlier round and the transfer theorem it accompanies were recomputed in full.

## Verified sound

**Coverage.** All 755 README lines read; plan.json parsed (8 layers, `gaps: []`, the changed entries compared with the README); the 13-entry manifest; the previous review and repair report; the overlap report; the package index. No maintainer notes and no declared gaps exist.

**Principles.** No route-specific shortcut (general couplings for existence, the full Griffiths–Simon class for the inequalities), no re-planned roadmap, no upward supply, no algorithm, no copied passage, no `set_option`, no sorry'd data. The layer order is forced by the `*Needs:*` lines (0 → 1 → 2 → 3 → 4; 5 from 0–1; 6 independent; 7 from 1, 3.2, 6); no layer is named after a source chapter and no sentence says the plan follows a source.

**Adversarial table** (j = (log 3)/2, t = tanh J). Values recomputed by hand this round; rows for the sampled targets, the headline families and every target a finding touches.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.2 moments, scaling, hard limit | k = 1, 2; s > 0; b = 2λ | `∫φ^{2k}e^{−λφ⁴} = ½λ^{−(2k+1)/4}Γ((2k+1)/4)`, ratio `λ^{−k/2}Γ((2k+1)/4)/Γ(¼)`; k = 2: ¼λ⁻¹; image density `exp(−λs⁻⁴ψ⁴ + bs⁻²ψ²)`; `−λφ⁴ + 2λφ² = −λ(φ²−1)² + λ` | sound |
| 1.1 stability bound, three-site Z | ordered half-sum | `−H ≤ ½‖J‖Σφ_x²`; Z = (2e^{3J} + 6e^{−J})/8; ⟨σ₁σ₂⟩ = (e^{3J} − e^{−J})/(e^{3J} + 3e^{−J}) < 0 for J < 0 | sound |
| 1.3 coupling derivative | two Ising sites; J = 0 even ρ; diagonal | 1 − t²; `⟨φ_x²φ_y²⟩ − 0 = (∫φ²)²`; diagonal derivative 0 (½⟨F;φ_x²⟩ under the wrong convention) | sound |
| 1.5 Gaussian field | two sites; d = 1 | precision `[[2|b|, −J], [−J, 2|b|]]`, det 4b² − J², inverse entries 2|b|/(4b²−J²), J/(4b²−J²); `G_μ(0) = 1/√((2+μ²)² − 4) = 1/(μ√(4+μ²))` | sound |
| 2.1 Griffiths trick, mixed signs | K = (ln 2)/2; q = (1,−1) | weights ¼e^K, ½e^{−K}, ¼e^K equal iff e^{2K} = 2; ε = 1/(1+e^{2K}); 16ε vs 48ε² | sound |
| 2.2 transfer | Gaussian mixture; X_N | mixture: Gaussian inequality holds, Z = ∞ at J ≥ 1; X_N: `E e^{cX²} ≤ (1 − 2c/log²N)^{−1/2}` (1.069 at c = 1, log N = 4) | R01, R02 |
| 2.3 Curie–Weiss scaling | c = (12λ)^{−1/4}, m = φN^{−1/4}/c | `N(g_N − 1)m²/2 = bφ²`; `N m⁴/12 = λφ⁴`; `N m⁶ = O(N^{−1/2})`; at m = ½: `m⁴/12 = 1/192`; `|φ|^α ≤ c^α N^{α/4} = o(N)` for α < 4; g_N > 0 iff N > 4b²c⁴ (b < 0) | sound |
| 3.4 currents, switching | two sites, A = B = {x,y}, F = 1; J = 0 | Σ_even = cosh J, Σ_odd = sinh J; sinh² = cosh² − 1; from the identity `Z_A Z_B = Z_{A∆B} Z_∅ P`, i.e. ⟨σ_A⟩⟨σ_B⟩ = ⟨σ_{A∆B}⟩P; Z_D = 0 at J = 0 | sound; normalisation differs from the source by 2^{|V|}, correctly |
| 3.5 Lebowitz, Gaussian, Simon–Lieb | ρ_I; ρ_{λ,0}; sparse ε = ¼; chain, Λ = {0}; block expansion | 1 ≤ 3; ¼ ≤ 3(0.33799)² = 0.3427; ¼ > 3/16; t² ≤ J t; `q_iq_j`-weighted sum of the Ising inequality on V × Fin N reproduces the φ form with ⟨φ₀φ_u⟩_Λ | sound for blocks; class case rests on R01 |
| 3.6 reflection inequality | chain {0,1,2,3}; J₀₂ = J₁₃ = K only; nearest-neighbour hyperplanes | t ≥ t², 1 ≥ t³; 0 < tanh K when J₀₁ = 0 < J₀,R1 = K; coefficients ½(J_xy ± J_{x,Ry}) and J_xz ≥ 0; for coordinate and diagonal reflections J_{x,Ry} = 0 for distinct x, y ∈ V₊ (one step changes x_i − x_j by 1, never by 2) | sound |
| 3.7 identity, bound, Newman | F = φ_x; b = 0, J = 0; sparse ε = ¼, a = 2 | 1 = 4λ⟨φ⁴⟩ − 2b⟨φ²⟩ − ΣJ⟨φ_xφ_y⟩; 4λm² − (2b₊+‖J‖)m − 1 ≤ 0 gives M; M(λ,0,0) = 1/(2√λ) ≥ 0.338/√λ; 0.75 + 0.25·3.7622 = 1.6905 > 1.6487 | sound |
| 4.1 monotone limits | open chain; δ₀; J = 0 | tanh^{|x|}J for every R ≥ |x|; 1 and 0; products of single-site moments | sound |
| 4.3 susceptibility, critical point | d = 1, J = ¼, ½, 1 | χ = (1+t)/(1−t) = e^{2J}: 1.6487 ≤ 2; bound M ≤ 1 + 2dJ·M in V_R; denominator 0 and −1 excluded; β_c ≥ 1/(2dJ) | sound |
| 5.1 torus, Fourier | L = 1, 2, d = 1 | coupling 2J at L = 1: Ŝ(0) = 1 + tanh 2J, Ŝ(π) = 1 − tanh 2J; 4-cycle (t + t³)/(1 + t⁴); `|Λ*_L| = (2L)^d`; E((π,…,π)) = 4d | sound |
| 5.2 reflection positivity | L = 1 edge form; J = 0 vertex form, L = 2 | matrix `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]`, PSD iff J ≥ 0; ⟨φ₀φ_{R0}⟩ = ⟨φ₀²⟩ = 1 vs |E f|² = 0; ρ̃ finite and the pair interaction bounded, as Peled–Spinka's setting requires | sound |
| 5.3 Gaussian domination | L = 1 Ising, u = h₀ − h₁ | Z ∝ 2e^{−Ju²} + e^{−J(2+u)²} + e^{−J(2−u)²}; Z″(0) = −4J + e^{−4J}(32J² − 4J); max of e^{−4J}(8J−1) at J = 3/8 is 2e^{−3/2} = 0.446; `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}` | sound |
| 5.4–5.5 infrared bound, long-range order | L = 1; Gaussian; d = 3 | second-order expansion gives `J⟨(φ,Δh)²⟩ ≤ (h,−Δh)`, first order 0; 4J(1 − tanh 2J) ≤ 0.557; at J = 0.375: 1.46 vs 0.667 for the printed constant; precision 2(|b| − dJ) + JE(p); I₃ = W/2 = 0.2527; `I_d = ½∫_{[0,1]^d}dt/Σ(1 − cos πt_j)` matches Peled–Spinka's n/(2β) at n = 1 | sound |
| 6.2 Schwinger functions | h = e^{−|x|²}; h = 1; white noise | `|x−y|² ≤ 2|x|² + 2|y|²` gives the bound; constant 1 fails (1.10); null-set representative: zero S₂ on the union of countably many null sets | sound |
| 6.3–6.4 covariance, Wick | K = [[1,2],[2,1]]; random sign; variance 0 | Var(X₁ − X₂) = −2; M₄ = (∫fh)⁴ vs 3(∫fh)⁴; E[Y²] = 0 gives the Dirac law, a Gaussian | sound |
| 7.1 rescaled field | tent, R = L and 4L; chain L = R = 1; quarter-turn | 0; `1 + 2Σ_{j<L}(j/L)² = (2L²+1)/(3L)`, normalised → 1/3; 3 + 4t + 2t²; `T_{f∘g}(φ) = φ_{g⁻¹e₁} = φ_{−e₂}`, wrong form φ_{e₂}; Σ = 0 iff an i.i.d. sum over ≥ 1 sites is a.s. 0 iff ρ = δ₀ | sound |
| 7.2 reachability | J = 0 Ising; δ₀; Cauchy; telegraph | covariance 2^{−d}∫fg; zero field; infinite second moment excluded; ⟨σ₀σ_x⟩ = e^{−c|x|/L}, Σ_L ~ L²κ | sound |
| 7.3 structure | Bernoulli {0,1}; rare spikes | Σ_L = n/4 + n²/4, mean → 2^{−d}∫f, variance → 0; spike variance 2 − p per site, P(spike in supp) = O(1/|Λ|), limit variance 2^{−d−1}∫f² | sound |
| 7.4 Gaussian free field | d = 1; lattice symbol; G₀ | `C_m(1_Q,1_Q) = 2/m² − (1 − e^{−2m})/m³`, 1 + e^{−2} at m = 1, ~ 2/m; `L²E(q/L) → |q|²`, `≥ (4/π²)|q|²`; `Γ(d/2−1)/(4π^{d/2}) = 1/((d−2)|S^{d−1}|)`: 1/(4π) at d = 3 | sound; agrees with the supplier's kernel |
| Conventions | two Ising sites | −J, −J/2, −2J; ½, 2 − √3, 4/5 | sound |

**Seeded source sample.** All fifteen targets were checked against the cached texts.

| Target | Lines read | Outcome |
|---|---|---|
| 0.2 | `aizenman-duminilcopin-2021 lines 143–147` (1.12), `222–230` (1.16)–(1.17), `257` (1.20); `simon-2020-twelve-tales line 1021` | sign of b, Ising measure, hard limit agree; Simon's sign is opposite, as the Conventions say |
| 1.3 | `peled-spinka-2017 lines 519–526` | derivative-as-covariance for Ising and XY pair correlations; the general-F statement is the roadmap's own, by 1.2 and the named Mathlib lemma |
| 2.3 | `aizenman-duminilcopin-2021 lines 392–406`; `simon-2020-twelve-tales lines 1011–1030` | block averages, mean-field inner coupling, g_N → 1; Simon names the second-order de Moivre–Laplace limit; explicit c and g_N are the roadmap's (computed above) |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–448`, `464–482`, `500–507` | Definitions 3.1–3.2, (3.2)–(3.9), Lemma 3.3 agree; the source's F is real-valued, the roadmap's `[0, ∞]`-valued |
| 3.5 | `aizenman-duminilcopin-2021 line 520`, `1314–1322`, `1342–1344`, `1996–2002`; `sokal-1982 lines 419–422`; `frohlich-1982 line 109` | (3.11), Lemma 5.7 with footnote 5 (finite-volume factor), Lebowitz and Gaussian inequalities named; class extension asserted in the source "by continuity" (R01) |
| 3.6 | `aizenman-duminilcopin-2021 lines 1023–1038`; `sokal-1982 lines 436–444`, `455–466` | (5.2), a ∈ ½ℤ and diagonal a ∈ ℤ, the Remark on exhaustions; the source assumes (2.2), the roadmap proves it for even admissible ρ by its own route (checked above) |
| 4.1 | `sokal-1982 lines 400–411`; `peled-spinka-2017 lines 527–532`; `aizenman-duminilcopin-2021 lines 231–233` | monotone limits by Griffiths, properties (a)–(b) |
| 4.3 | `aizenman-duminilcopin-2021 lines 1017–1020`; `sokal-1982 line 470`, `574` | S, β_c, χ named; the sup-formula for β_c is the roadmap's definition |
| 5.1 | `aizenman-duminilcopin-2021 lines 1058–1084`; `peled-spinka-2017 lines 1283–1284` | modes, Λ*_L, (5.7)–(5.8) agree up to the half-open cell |
| 5.2 | `peled-spinka-2017 lines 1328–1333`, `1385–1390`, `1486–1493` | Propositions 2.14–2.16; the Gaussian positive-definite representation at line 1486 |
| 5.3 | `peled-spinka-2017 lines 1563–1632`, `1633–1648` | (43)–(48), the auxiliary pair system with bounded interaction, the pinned Gaussian remark |
| 6.2 | `aizenman-duminilcopin-2021 lines 59–76`, `126` | (1.5)–(1.6), (1.10) |
| 7.1 | `aizenman-duminilcopin-2021 lines 157–166` | (1.14)–(1.15) |
| 7.2 | `aizenman-duminilcopin-2021 lines 167–187` | Definition 1.1, order of limits, subsequences, footnote 2 |
| 7.3 | `aizenman-duminilcopin-2021 lines 172–179`; `sokal-1982 lines 710–721` | the limit as a random field; Lemma 2.2 is a subsequence statement for φ⁴ lattice measures, cited as background only |

Also read: `duminilcopin-2017-lectures line 549` (Corollary 1.9, limits of finite-volume measures, q = 2), `frohlich-1982 lines 266–269` (free lattice field at λ = 0), `peled-spinka-2017 lines 1207–1222`, `1741`, `1766`. No locator flagged unverified by the author exists in the design.

**Duplication and ownership.** Searched main and the open heads (`roadmaps grep`) for Griffiths inequalities, random currents, reflection positivity, infrared bound, Schwinger functions, Lee–Yang, Laguerre–Pólya: no roadmap owns any of the retained lattice objects; "Lee–Yang" matches nowhere. ClassicalErgodicTheory's Gibbs measures are equilibrium states on shifts, a different object; PointProcesses excludes infinite-volume Gibbs processes; MathematicalStatisticsFoundations, ProbabilisticAndMetricNumberTheory and RandomMatrices state none of the objects. ConstructiveFieldTheoryPhi4PartII is named only as a consumer and exists nowhere yet, which is not a defect. Hadamard factorisation is owned by ZerosOfLFunctions, Layer 5 (line 47 of the merge order); Mathlib at the pin has only the three-lines theorem (`Mathlib/Analysis/Complex/Hadamard.lean:13`) and no Lee–Yang statement. The overlap report lists no changing pull request, no dropped id and no revision-only id.

Overlap check: read MathematicalStatisticsFoundations, RelativisticQuantumFieldTheory, PointProcesses, ProbabilisticAndMetricNumberTheory, ClassicalErgodicTheory, StandardDistributions, RandomMatrices, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1898 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved now: StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`, the arbitrary-index extension in its last sentences); StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`); RelativisticQuantumFieldTheory §7.1 at its open head (heading at line 4476: Mathlib-normalised multiplier `(4π²‖ξ‖² + m²)⁻¹`, heat integral, exterior exponential bound for c < m, massless `|x|^{2−n}/((n−2)|S^{n−1}|)`, equal to the roadmap's Gamma form). Every `*Needs:*` line was read; apart from R01 and R03 each item is a target here, a resolved supplier section or a pinned declaration.

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5 match the README. Opened this round at the stated lines: `IsNegInvariant` (`Mathlib/MeasureTheory/Group/Measure.lean:310`), `integrableExpSet` (`Mathlib/Probability/Moments/IntegrableExpMul.lean:112`), `Integrable` and `Integrable.mono'` (`Mathlib/MeasureTheory/Function/L1Space/Integrable.lean:58`, `:104`), `fkg` (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`), `multivariateGaussian` (`Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`), Cramér–Wold (`Mathlib/Probability/CramerWold.lean:39`), `isCompact_closure_of_isTightMeasureSet` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean:530`), `ZMod.dft` (`Mathlib/Analysis/Fourier/ZMod.lean:87`), `ae_eq_zero_of_integral_contDiff_smul_eq_zero` (`Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:186`), `map_eq_iff_forall_finset_map_restrict_eq` (`Mathlib/Probability/Process/FiniteDimensionalLaws.lean:61`), `exists_isProjectiveLimit_of_countable` (`TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`), `ext_of_forall_integral_pow_eq_of_exists_integrable_exp` (`TauCeti/Probability/Moments/Determinacy.lean:246`), `centralMoment_id_two_mul_gaussianReal` (`TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`). The remaining contract lines were opened by the round-4 review at the same pins and are unchanged text.

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API list and at least three Checks; every theorem a locator. No LaTeX delimiters, job ids, pull-request numbers, paths or dates. No backticked name is presented as a Lean declaration of this roadmap.

**Headlines and Lean.** Headline families: finite-volume Gibbs measures and Gaussian fields (Layer 1); φ⁴ in the Griffiths–Simon class and the transfer (Layer 2); Griffiths, FKG, switching lemma, Lebowitz/Gaussian/Simon–Lieb, reflection monotonicity, uniform moments (Layer 3); the free-boundary state (Layer 4); reflection positivity, Gaussian domination, infrared bound, Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and reachability of the Gaussian free field (Layer 7). The design has no `Suggested.lean`, so there is nothing to probe for padding and no binders to check. Elaboration: not available (this lane does not elaborate; say so in the report); no Lean command was run.

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- Lee–Yang 1952, Newman 1974 and Lieb–Sokal 1981, named in the repair of R01: not in the manifest and not fetched this round; the mathematics of the repair was derived here, and their locators remain for the fix worker to record and check.
- Whether an elementary proof of the §2.2 transfer exists that avoids the Lee–Yang property: not decided (see R01).
- The exact block-normalised reachability theorem of 7.4 is the roadmap's own Fourier derivation; its scaling and constants were recomputed, the full dominated-convergence argument was not written out.

## Source issues

- **Gap** in aizenman-duminilcopin-2021 at Section 7, opening paragraph and the paragraph after Proposition 7.2, preprint pp. 44–45: the source says Ising-block results pass to weak limits with the growth condition by continuity; it should supply tail control of the approximants, for instance from the Lee–Yang property; affects the proof.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the displayed symbol; affects a stated result.
- **Misprint** in sokal-1982 at (2.24), printed p. 327: the source says the pair expectations are multiplied over all pairings; it should sum over pairings the products within each; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d9ac39290acb863fba73dba1b7273ef1968ff8de", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~5", "model": "fable", "worker": "chris-x27"} -->
