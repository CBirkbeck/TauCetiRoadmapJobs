<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6899344524 -->
Review (claude) of 81a7112

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a claim about what Mathlib lacks is too strong

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:48` (Exact supplier contracts, From Mathlib): "Mathlib itself contains no existence theorem for projective limits; its Brownian motion file says so explicitly."

   **Claim.** The pinned Mathlib proves no projective limit to exist.

   **Witness.** At the pin, `Mathlib/Probability/ProductMeasure.lean:362` proves `MeasureTheory.Measure.isProjectiveLimit_infinitePi` and `Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean:484` proves `isProjectiveLimit_trajFun`. The Brownian file (`Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24–26`) says only that the Kolmogorov extension theorem is not in Mathlib.

   **Exact repair.** Replace the sentence by: "Mathlib has no Kolmogorov extension theorem for a general projective family (its Brownian motion file says so explicitly); it proves projective limits to exist only for product families (`isProjectiveLimit_infinitePi`, Mathlib/Probability/ProductMeasure.lean:362) and for Ionescu-Tulcea trajectories." Tested on the instance: the J = 0 state of 4.2 is `MeasureTheory.Measure.infinitePi`, which the README itself cites at `:47`, and the new sentence is consistent with it; the Gaussian families of 6.3 are not product families, so the need for StochasticCalculus §1.1 stands.

2. **F02** (P3) the proof route of 3.6 omits the couplings inside the fixed set

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:379` (3.6): "the remaining Hamiltonian is a quadratic form in (s, t, φ|V₀) with coefficients `½(J_{xy} + J_{x,Ry})` on `s_x s_y`, `½(J_{xy} − J_{x,Ry})` on `t_x t_y` and `J_{xz}` on `s_x φ_z`, all nonnegative".

   **Claim.** These three families are all the terms of the Hamiltonian apart from the crossing terms `J_{x,Rx}`.

   **Witness.** d = 2, reflection in `x₁ = 0`, V = V₁: the fixed sites z = (0, 0) and z′ = (0, 1) are neighbours, so `J_{zz′} = J > 0` and the term `J φ_z φ_{z′}` is in none of the three families.

   **Exact repair.** Write "… `J_{xz}` on `s_x φ_z` and `J_{zz′}` on `φ_z φ_{z′}` for z, z′ ∈ V₀, all nonnegative". Tested on the instance: with the fourth family the expansion has no missing term (I recomputed the change of variables: `J_{xy}(φ_xφ_y + φ_{Rx}φ_{Ry}) = ½J_{xy}(s_xs_y + t_xt_y)`, `J_{x,Ry}(φ_xφ_{Ry} + φ_{Rx}φ_y) = ½J_{x,Ry}(s_xs_y − t_xt_y)`, `J_{xz}φ_xφ_z + J_{Rx,z}φ_{Rx}φ_z = J_{xz}s_xφ_z`, no mixed `s t` term), and the coefficient J ≥ 0 keeps the argument. The statement of 3.6 is unaffected; the plan entry of 3.6 has no route and needs no change.

The round-10 finding is repaired. No P1 or P2 finding was found. Two P3 findings (R01, R02) each carry an exact repair of the README's prose, so the verdict asks for changes; neither changes a statement, and nothing else stands in the way of the design. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No supplier gap is declared. No maintainer notes exist for this roadmap.

## Previous finding, checked first

| Round-10 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) Simon (3.8) cited for the limit kernel `G_μ` | `packages/ConstructiveFieldTheoryPhi4/design/README.md:208`: the limit formula now cites "Fröhlich, the paragraph after (33), p. 13" alone; the covariance sentence cites "Simon, Twelve Tales, Section 3, pp. 23–24, for the free lattice field as a nearest-neighbour ferromagnet with Gaussian single-site measure, written there formally on ℤ² and with another normalisation of the mass term". `:713` carries the same qualified citation. | **Repaired** |

Read against the text: `simon-2020-twelve-tales lines 954–976` (pp. 23–24) says the free field has covariance `(−Δ + m²)⁻¹`, that the lattice version replaces −Δ by a difference operator, and displays a formal product over ℤ² with single-site factor `e^{−m²s²}`; `frohlich-1982 lines 266–269` (p. 13) gives the two-point function at λ = 0 as that of the free lattice field. The qualified citation claims no more than the text has.

Adversarial pass on the changed text (only citations changed; values computed by me):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.5 finite volume | `b = −(d + μ²/2)`, J = 1 | `2|b|I − J⁰ = (2d + μ²)I − A_R = μ² − Δ_R` | agrees with the sentence the Simon citation now sits on |
| 1.5 limit kernel | d = 1, μ = 1 | `(2π)⁻¹∫dp/(3 − 2cos p) = 1/√(9 − 4) = 0.4472 = 1/(μ√(4 + μ²))` | Fröhlich's locator supports it |
| Simon's display against the README kernel | one isolated site, mass 1 | README: variance `1/(2|b|) = 1`; factor `e^{−s²}`: variance `½` | differ; the qualifier "another normalisation" is needed and present |

Pattern sweep: every other Simon citation of the README (Conventions, 0.2, 2.1, 2.3, 3.1, 5.3, 5.4, 5.5) was opened at `simon-2020-twelve-tales lines 977–984, 1011–1022, 1500–1560`; each supports the claim it is attached to (details in the source table below). No other display is cited for a formula it does not contain.

## Verified sound

**Coverage.** All 776 lines of the README were read; `design/plan.json` was parsed (8 layers, 36 targets, 2 downstream goals, `gaps: []`, no prerequisite pointing to a later target); the 14-entry manifest; the round-10 review and its repair report. The author flagged no locator as unverified.

**Principles.** No route-specific shortcut: Lee–Yang is stated for site-dependent complex fields and every ferromagnetic coupling, FKG without evenness, Gaussian processes on an arbitrary index type, the moment bound of 3.7 for every coupling. No re-planned roadmap, one direction of supply, no algorithm, no copied passage, no `set_option`, no sorry'd data (there is no Lean file).

**Adversarial table: sampled targets and headlines.** Every value below was computed this round; `t = tanh J`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, 1.1 | two Ising sites; three sites all coupled | `Z = cosh J`, `⟨σσ⟩ = tanh J`; `Z = (2e^{3J} + 6e^{−J})/8`, numerator of `⟨σ₁σ₂⟩` is `2e^{3J} + 2e^{−J} − 4e^{−J}` | sound |
| 1.1 stability bound | any J | `−H ≤ ½Σ_{x≠y}|J_{xy}|(φ_x² + φ_y²)/2 ≤ ½‖J‖Σφ_x²` | sound |
| 1.2 symmetries | chain 0–1–2; `(δ₀ + δ₁)/2` | `⟨σ₀σ₂⟩ = t²`; `⟨φ⟩ = ½` | sound |
| 1.3 derivative | two Ising sites; J = 0, even ρ | `d tanh J/dJ = 1 − t² = ⟨(σσ)²⟩ − ⟨σσ⟩²`; `⟨φ_x²φ_y²⟩ − 0 = (∫φ²)²` | sound; symmetric direction matches the unordered-pair Hamiltonian |
| 1.5 Gaussian fields | two sites; `J = −3|b|`; d = 1 | inverse of `[[2|b|, −J], [−J, 2|b|]]` is `[[2|b|, J], [J, 2|b|]]/(4b² − J²)`; determinant `−5b²`; `1/√((2 + μ²)² − 4) = 1/(μ√(4 + μ²))` | sound |
| 2.1 Lee–Yang | pair polynomial; a = 1; two sites `J = −(ln 2)/2` | `|1 + az|² − |a + z|² = (1 − a²)(1 − |z|²)`; `(1 + z₁)(1 + z₂)`, zeros on the circle; `cosh 2h = −2` at `±½ln(2 + √3) + iπ/2 = ±0.658 + 1.571i` | sound; Asano with `K₁ = K₂ = {|z| ≥ 1}` gives `−K₁K₂ = {|z| ≥ 1}` |
| 2.1 block-spin representation | N = 1, q = (s) | cross coupling `J q_n q_m` on each of the N² pairs of an unordered {x, y}; `⟨φ_xφ_y⟩ = s² tanh(Js²)` | sound |
| 2.1 product formula | ρ_I; uniform on {−1, 0, 1}; q = (1, −1), `K = (ln 3)/2` | `Σ((k + ½)π)⁻² = ½`, `−12·(1/6) = 1 − 3`; zeros `2π|n + 1/3|`, `(2π)⁻²·π²/sin²(π/3) = 1/3 = ½·(2/3)`; ε = ¼, `E = (3 + cosh 2h)/4`, zeros at `±0.881 + 1.571i`, cumulant `16·¼ − 3·1 = 1 > 0` | sound; the negative control fails as stated |
| 2.1 Checks | Griffiths' trick; mixed signs | `¼e^K = ½e^{−K}` iff `e^{2K} = 2`; `ε = 1/(1 + e^{2K})`, `16ε > 48ε²` iff ε < 1/3 | sound |
| 2.2 tail control | steps (a), (c), (d), (e), (f) | `(σ²/2)² ≤ 3σ⁴P`, so P ≥ 1/12; `|hφ| ≤ |φ|^α/α + |h|^{α′}/α′`; `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})` and `θ log C + θ^{1 − α′/2} → 0`; at most `(S/2)/θ` large terms; `e^{2cg²s}` with s < 1/(8c) is below `e^{g²/4}` | sound |
| 2.2 Checks | log-N blocks; mixtures | `(1 − 2/47.717)^{−1/2} = 1.0216`; `Z ≤ (∫e^{Jφ²/2})² ≤ (1 − J/log²N)⁻¹`; `1 − 1/k + (2n − 1)!!/k ≤ (2n − 1)!!` | sound |
| 2.3 (used by 4.2) | exponent | `Nm²(g_N − 1)/2 − Nm⁴/12` at `m = φN^{−1/4}/c` is `bφ² − φ⁴/(12c⁴) = bφ² − λφ⁴` | sound |
| 3.2 monotonicity | chain; `(2δ₋₁ + δ₁)/3` plus one site | `t₀₁t₁₂`; `⟨φ₀⟩ = −3e^J/(5e^J + 4e^{−J})`, −1/3 at J = 0 and decreasing | sound |
| 3.4 currents | two sites; switching with A = B | `Σ_{n even}Jⁿ/n! = cosh J` with the `2^{−|V|}` of `ρ_I^{⊗V}` cancelling; `sinh² = cosh² − 1` | sound; the corollary is (3.7) of the source rewritten with `σ_Aσ_B = σ_{A∆B}` |
| 3.5 (i)–(iii) | n = 1; (x, x, y, y); chain with Λ = {0}; block transfer | `⟨σ₁σ₂⟩ ≤ ⟨σ₁σ₂⟩·1`; `1 ≤ 1 + 2t²`; `t² ≤ J·t`; multiplying the Ising Simon–Lieb bound on V × Fin N by `q_aq_b` and summing gives the φ form, the Λ factor being the block system of Λ | sound; repeated sites reduce to the distinct case because all pairing terms are ≥ 0 |
| 3.5 corollary | ρ_{λ,0}; ε = ¼ non-member | `1/(4λ) ≤ 3(0.33799)²/λ = 0.3427/λ`; `¼ > 3/16` | sound; t ≥ 0 is needed and stated |
| 3.6 reflection | lattice planes; chain {0,1,2,3}; `J₀₂ = J₁₃ = K` | a neighbour step changes `x_i ± x_j` by at most 1, so no bond joins the two open sides of an integer diagonal plane; across `x_i = a + ½` only x and Rx are neighbours; `t ≥ t²`, `1 ≥ t³`; `0 < tanh K` | sound; R02 on the route |
| 3.7 identity and bound | F = φ_x; b = 0, J = 0 | `1 = 4λ⟨φ⁴⟩ − 2b⟨φ²⟩ − ΣJ⟨φ_xφ_y⟩`; `4λm² − (2b₊ + ‖J‖)m − 1 ≤ 0`; `M(λ, 0, 0) = 1/(2√λ) ≥ 0.338/√λ`; `Γ(5/4)/Γ(1/4) = ¼` | sound |
| 3.7 Newman | two Ising sites, J = 1, z = (1, −1) | left `(e + e⁻¹cosh 2)/(e + e⁻¹) = 1.329`; right `e^{1 + tanh 1} = 5.822`; signed form `e^{0.238} = 1.269` fails | sound |
| 4.3 critical point | d = 1; Λ = {0} | `χ = 1 + 2t/(1 − t) = e^{2J}`, 1.649 ≤ 2 at J = ¼; `M_R ≤ 1 + 2dJ·M_R` | sound |
| 4.4 axis monotonicity | x = (a, b), a ≥ b ≥ 0 | reflection in `x₁ − x₂ = a` sends (a, b) to (a + b, 0) with 0 on the same closed side; reflection in `x₂ = b/2` sends (a, 0) to (a, b); `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞` | sound; source has (5.3)–(5.4) under (2.2), the README proves them for even admissible ρ by 3.6 |
| 5.1 torus | L = 1; L = 2 | pair coupling 2J, `Ŝ₁(0) = 1 + tanh 2J`, `Ŝ₁(π) = 1 − tanh 2J`; 4-cycle `(t + t³)/(1 + t⁴)` | sound |
| 5.2 reflection positivity | L = 1 edge reflection | matrix `[[e^{2J}, e^{−2J}], [e^{−2J}, e^{2J}]]`, positive semidefinite iff J ≥ 0; `e^{Jab} = e^{J(a² + b²)/2}e^{−J(a − b)²/2}` | sound |
| 5.3 Gaussian domination | identity; L = 1 Ising; route | `−(J/2)ΣΣ(φ_x − φ_{x+e_j})² = JΣΣφφ − dJΣφ²`; `Z″(0) ∝ −4J + e^{−4J}(32J² − 4J)`, and `e^{−4J}(8J − 1)` peaks at J = 3/8 with value `2e^{−3/2} = 0.446 < 1`; `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}` | sound; the pair system of the route reduces to 5.2 through s = φ + τ, whose single-site law `e^{−dJs²}(ρ̃ ∗ η₀)` is admissible and given which the pairs are independent |
| 5.4 infrared bound | Gaussian torus; L = 1 Ising | symbol `2|b| − 2JΣcos p_j = 2(|b| − dJ) + JE(p)`, so `EŜ ↑ 1/J`; `2x(1 − tanh x)` at x = 0.64 is 0.557; printed constant: `4(1 − tanh 0.75) = 1.46 > 0.667` | sound; second-order expansion needs `Σ_x(Δh)_x = 0` only |
| 5.5 long-range order | d = 3 | `I₃ = W/2 = 0.2527 = 1.516/6`; `1 = |T|⁻¹Ŝ(0) + |T|⁻¹Σ_{p≠0}Ŝ(p)` | sound |
| 6.1 random fields | `T_f = |∫f|` | `T_{−f} = T_f ≠ −T_f` | sound |
| 6.2 decay (1.10) | representative | setting S₂ to 0 on the null set `∪_n{|x − y| ≥ r_n, |S₂| > 1/n}` gives the pointwise form | sound |
| 6.3, 6.4 | `[[1, 2], [2, 1]]`; random-sign field | variance of `X₁ − X₂` is −2; `M₄ = (∫fh)⁴ ≠ 3(∫fh)⁴` | sound |
| 7.1 | tent, R = 4L; quarter-turn | `1 + 2Σ_{i<L}(i/L)² = (2L² + 1)/(3L)`, normalised limit 1/3 = `½∫f²`; `g⁻¹e₁ = −e₂` | sound |
| 7.2, 7.3 | Gaussian stability; diluted ρ_n | `2|b| ≥ 2dJ_n > J_nλ_max(A_R)`; site variance 2 − p, limit variance `2^{−d−1}∫f²` | sound |
| 7.4 | scaling; d = 1; constant | `L^{2d}·L^{−d}·L² = L^{d+2}`; `C_m(1_Q, 1_Q) = 2/m² − (1 − e^{−2m})/m³`, 1.1353 at m = 1, `2/m − 4/3` as m → 0; `(d − 2)|S^{d−1}| = 4π^{d/2}/Γ(d/2 − 1)` | sound; agrees with the kernel of RelativisticQuantumFieldTheory §7.1 |
| 8.1, 8.2 (downstream goals) | Gaussian check; telegraph | susceptibility `1/(2(|b_n| − dβ))`, `L_n²/m²` at β = 1; `β_c(ρ_I) = ∞` in d = 1 | sound |

**Seeded source sample.** All fifteen targets were checked at their locators in the cached texts.

| Target | Read | Outcome |
|---|---|---|
| 1.2 | `aizenman-duminilcopin-2021 lines 222–230` (p. 5); `sokal-1982 lines 406–409` (p. 327) | (1.16)–(1.17); properties (a)–(b) |
| 1.3 | `peled-spinka-2017 lines 519–526` (p. 13) | the derivative formula after Theorem 2.3 |
| 1.5 | `sokal-1982 lines 392–396` (p. 326); `simon-2020-twelve-tales lines 954–976`; `frohlich-1982 lines 266–269` (p. 13) | footnote 2; the repaired citation; the free lattice field |
| 2.1 | `aizenman-duminilcopin-2021 lines 363–373` (p. 8), `377–388` (p. 9), `2028–2033` (p. 45); `lebowitz-ruelle-speer-2012 lines 62–68`, `217–222`; `simon-2020-twelve-tales lines 1011–1018` (p. 25); `sokal-1982 lines 428–433` (p. 328) | Definition 2.1(1) with real coefficients; Figure 1 and the Lee–Yang remark; the sampling weights; (1.2) for a uniform field; Lemma 2.4; Griffiths' trick, `H = −(log 2)t²`, which is `K₁₂ = (ln 2)/2`; property (i) |
| 2.2 | `aizenman-duminilcopin-2021 lines 374–386` (pp. 8–9), `2019–2022` (p. 45) | Definition 2.1(2) and (2.2), growth asked of the limit; continuity asserted |
| 3.2 | `peled-spinka-2017 lines 519–532`; `sokal-1982 lines 400–405` | p. 13; p. 327 |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–448` (p. 10), `464–507` (p. 11) | Definitions 3.1–3.2, (3.1)–(3.5), Lemma 3.3 with (3.6), (3.7)–(3.9) |
| 3.5 | `aizenman-duminilcopin-2021 line 520` (p. 12), `1319`, `1342–1344` (p. 30), `1996–1999` (p. 45); `sokal-1982 lines 419–422` (p. 327) | (3.11); Lemma 5.7 with (5.38) and footnote 5; site splitting; properties (f)–(g) |
| 3.6 | `aizenman-duminilcopin-2021 lines 1023–1038` (p. 23); `sokal-1982 lines 436–446`, `455–466` (pp. 328–329) | (5.2) and the two families of planes; property (k) and the Remark |
| 3.7 | `sokal-1982 lines 434–435` (p. 328), `825` (Section 3.1) | property (j), "for any complex" coefficients; the displays are dropped by the extraction |
| 4.3 | `aizenman-duminilcopin-2021 lines 1019–1020` (p. 23), `1247`; `sokal-1982 lines 467–470` (p. 329) | (5.1), `|J| = Σ_y J_{0,y}`; (5.23); the susceptibility |
| 4.4 | `aizenman-duminilcopin-2021 lines 1040–1051` (pp. 23–24) | Proposition 5.1, (5.3), (5.4) |
| 5.3 | `peled-spinka-2017 lines 1561–1632` (pp. 32–33); `simon-2020-twelve-tales lines 1527–1547` (pp. 36–37) | (43)–(48), stated for spin O(n) with a route that uses only a finite single-site measure; (5.19)–(5.21) |
| 5.4 | `aizenman-duminilcopin-2021 lines 1069–1091` (p. 24); `peled-spinka-2017 lines 1701–1741` (pp. 34–35); `simon-2020-twelve-tales lines 1516–1518`, `1548–1556` | (5.7)–(5.10), with the constant `1/(2|J|β)` printed; (49)–(52); (5.17), (5.22) |
| 6.1 | `aizenman-duminilcopin-2021 lines 55–57` (p. 2), `183–187` (p. 4) | (1.4); footnote 2 |

Further locators confirmed with their pages: `aizenman-duminilcopin-2021` (1.10) (p. 3), (1.11)–(1.15) and Definition 1.1 (pp. 3–4), Theorem 1.2 (p. 5), Theorem 7.1 and Proposition 7.2 (p. 45, for β ≤ β_c and L ≤ ξ); `peled-spinka-2017` Theorems 2.1 (p. 11) and 2.13 (p. 26), Lemma 2.4 (p. 13), Section 2.7.1 (p. 27), Propositions 2.14–2.16 (pp. 28–30), Corollary 2.17 (p. 32); `sokal-1982` Section 2.3 (from p. 334) and Lemma 2.2 (p. 337).

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, as `lake-manifest.json` records. All 41 file-and-line citations of the supplier contracts were opened; each line carries the named declaration. Signatures relied on:

- `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165`: `[Countable ι]`, `[∀ i, StandardBorelSpace (X i)]`, probability measures; the conclusion gives a probability measure and `IsProjectiveLimit`.
- `TauCeti/Probability/Moments/Determinacy.lean:246`: declared as `Measure.ext_of_…` inside `namespace TauCeti`, so the cited name is right; each measure needs `∫e^{a|x|} < ∞` for some a > 0.
- `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`: `vⁿ(2n − 1)‼`, namespace `TauCeti.Probability`.
- `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:233`: needs `S.PosSemidef`.
- `Mathlib/Analysis/MeanInequalities.lean:547`: `a * b ≤ |a| ^ p / p + |b| ^ q / q`, as step (c) of 2.2 uses.
- `Mathlib/Analysis/Complex/AbsMax.lean:404`: bounded U, `DiffContOnCl`, a bound on the frontier.
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`: `fkg` on a finite distributive lattice, with nonnegative monotone f, g.
- `Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30`: one field, over finite index sets; no centring.
- `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530` (root namespace) and `:636`.

By object, the pinned Mathlib and Tau Ceti contain no Ising or Gibbs lattice measure, no Lee–Yang theorem and no Griffiths inequality (a search for these names finds no file).

**Duplication and ownership.** `roadmaps grep` over main and the open heads of the index:

- "Lee–Yang", "Griffiths–Simon / Griffiths inequalities", "switching lemma / random current", "Simon–Lieb / Lebowitz inequality", "Gaussian free field / white noise", "ConstructiveFieldTheory": no match.
- "Ising" as a word, "Gibbs measure", "Schwinger function": ClassicalErgodicTheory (shift spaces), OperatorAlgebraDynamics (quantum chain), RelativisticQuantumFieldTheory §7.1 (continuum), two unrelated lines.
- "infrared bound / Gaussian domination", "reflection positivity": RelativisticQuantumFieldTheory (continuum Schwinger functions, graph integrals) and DenseGraphLimits (graph parameters); none is the torus statement.
- "Gaussian process", "covariance kernel": StochasticCalculus Layer 1 and the statistics roadmaps (limit processes); none builds a process from an arbitrary positive semidefinite kernel.
- "FKG", "Wick–Isserlis": ArithmeticStatisticsPartIV (finite lattices), StandardDistributions §5.3 (cited).

This roadmap is the owner of the lattice objects, the Lee–Yang theorem and the kernel-indexed Gaussian process. `ConstructiveFieldTheoryPhi4PartII` is on neither main, the open-pull-request list nor the board's package index (2 entries read); it is named only as a consumer. Ownership against the open pull requests was checked through the roadmaps tool. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, RandomMatrices, StandardDistributions, StochasticCalculus (PointProcesses has no text at the index); shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Citations resolved now:

- StochasticCalculus §1.1 on main (`TauCetiRoadmap/StochasticCalculus/README.md:879`, last sentences): the unique law on an arbitrary product of standard Borel spaces with consistent finite-dimensional laws. Line 213 of the merge order.
- StandardDistributions §5.3 on main (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 on main (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1067`; `Suggested.lean` `OrderLE` and `hadamard_of_orderLE_one`): a multipliable product with exponent `a + bs`, as the contract says. Line 47.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder; line 214): multiplier `(4π²‖ξ‖² + m²)⁻¹`, the heat integral for x ≠ 0, exterior decay for 0 < c < m, the massless kernel `|x|^{2−n}/((n − 2)|S^{n−1}|)` with the harmonic ambiguity classified. It does not cite this roadmap.
- Scope deferrals: PDE, Scope and ownership (`TauCetiRoadmap/PDE/README.md:104–107`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:75`) exist as cited.

Every `*Needs:*` line was read against the statement and route above it; none names a later target, and the plan's prerequisite lists have no forward reference.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references. Every definition has an API and at least three Checks (0.1: 5; 0.2: 4; 1.1: 3; 2.1: 8; 2.2: 6; 3.4: 4; 4.1: 3; 4.3: 4; 5.1: 3; 6.1: 3; 6.2: 3; 7.1: 5; 7.2: 4; 7.4: 3). The layer order is forced where it matters (1 needs 0; 2 needs 1; 3 needs 2 through 3.5 and 3.7; 4 needs 3; 7 needs 1, 3.2 and 6), and Layers 5 and 6 are declared independent. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. No process words, pull-request numbers, machine paths or LaTeX delimiters.

**Headlines.** The Lee–Yang theorem and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Copyright.** Wording was compared at every locator of the sample and at eight further passages:

- the definition of 7.2 against `aizenman-duminilcopin-2021 lines 167–179`;
- the definitions of 3.4 against `lines 421–428` and `464–471`;
- 2.1 and 2.2 against Definition 2.1, `lines 363–386`;
- the Simon–Lieb route of 3.5 against footnote 5, `lines 1342–1344`;
- 3.6 against `lines 1023–1038`;
- the Asano route of 2.1 against `lebowitz-ruelle-speer-2012 lines 217–222`;
- the Griffiths-trick Check against `simon-2020-twelve-tales lines 1011–1018`;
- the route of 5.3 against `peled-spinka-2017 lines 1602–1632`.

No shared run beyond formulas and standard names. Arrangement: the most cited source has sections 1 (fields and main result), 2 (the class), 3 (random currents), 4 (intersection clusters), 5 (two-point function), 6 (unconditional proofs), 7 (extension to the class), read from its headings at `lines 20–1990`. The roadmap puts that source's §1 material last (Layers 6–7), builds Layer 3 from its §3, §5.1 and §7 with two other sources, takes Layers 4 and 5 mostly from other sources and has no counterpart of §4 and §6. No one-to-one run. No table, figure or exercise list is taken over.

Source independence: 23 passages compared with 6 sources, none shared; largest share aizenman-duminilcopin-2021, 42 of 107 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.17)–(2.30), (2.33), (3.4)–(3.5) and `frohlich-1982` displays (7), (12), (13), (33): the extractions drop them; I read the surrounding sentences this round and did not render the pages again, so the display contents rest on the round-10 reading. The statements they are cited for were recomputed independently above.
- `duminilcopin-2017-lectures` Corollary 1.9: outside the sample and unchanged since round 10; not reopened.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The Riemann-sum limit of 5.4 for `1/E(p)` in d ≥ 3 and the dominated convergence of 7.4 were checked for constants and for a dominating bound, not written out in full.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the symbol of (5.7); affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, as its sampling weights on p. 45 need; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Section 7.1, the paragraph after Proposition 7.2, preprint p. 45: the source says uniform constants pass the bound from Ising blocks to their weak limits; it should supply tail control of the approximants; affects the proof.
- **Misprint** in simon-2020-twelve-tales at (3.8), p. 24: the source says the single-site factor has exponent minus mass squared times the spin squared; it should carry the factor matching the covariance stated just before; affects nothing.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), a scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:737–759` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "81a71128c6b9d3bcc8a1d31b4df889f32bbf4a56", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~11", "model": "fable", "worker": "chris-x91"} -->
