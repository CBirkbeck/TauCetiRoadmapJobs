<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13733#issuecomment-6901276240 -->
Review (claude) of 3def4b2

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 3.6 has no negative control for evenness, which its most-cited source does not assume

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:379` (3.6): "let V be finite, ρ even and admissible, J a ferromagnetic coupling on V, and R an involution of V …"; Checks at `:387–389`.

   **Claim.** The three Checks discriminate the hypotheses of the reflection inequality.

   **Witness.** `aizenman-duminilcopin-2021 lines 1007–1009` asserts (5.2) for an arbitrary common distribution. V = {−1, 0, 1}, R(x) = −x, J = 0, `ρ = (2δ₋₁ + δ₁)/3`, A = δ₁, B = δ₁ + δ₀: `⟨φ₁²φ₀⟩ = −1/3 < −1/27 = ⟨φ₁φ₋₁φ₀⟩`.

   **Exact repair.** Add a fourth Check to 3.6 (and a test `evenness_needed` to the plan entry): "Evenness is needed for general multi-indices: on V = {−1, 0, 1} with R(x) = −x, J = 0 and `ρ = (2δ₋₁ + δ₁)/3`, A = δ₁ and B = δ₁ + δ₀ give `⟨φ₁²φ₀⟩ = −1/3 < −1/27 = ⟨φ₁φ₋₁φ₀⟩`; in general, for odd |A| + |B| the inequality for ρ is the reversed inequality for its image under φ ↦ −φ." Tested on the instance: mean −1/3, second moment 1, product measure, so the two sides are `1 · (−1/3)` and `(−1/3)³`; with the even measure ρ_I both sides are 0.

2. **F02** (P3) the Sokal locator of 1.2 states the invariances for the infinite-volume state

   **Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:172` (1.2): "… so that `⟨φ_A⟩ = 0` whenever |A| is odd (Aizenman–Duminil-Copin (1.17), p. 5; Sokal, Section 2.2, properties (a)–(b), p. 327)".

   **Claim.** The locators support the finite-volume symmetry and spin-flip statement.

   **Witness.** `sokal-1982 lines 402–409`: properties (a)–(b) concern the limit measure on the whole lattice obtained after the volume limit; `aizenman-duminilcopin-2021 lines 228–230` is the definition of the finite-volume Ising state. Neither states the finite-volume invariances.

   **Exact repair.** In 1.2 write "(Aizenman–Duminil-Copin (1.17), p. 5, for the finite-volume state; Sokal, Section 2.2, property (b), p. 327, states the same invariances for the infinite-volume state of 4.2)". The manifest needs no change (`sokal-1982` already lists 1.2 and 4.2).

The round-13 finding is repaired. No P1 or P2 finding was found. Two P3 findings (R01, R02) each carry a repair, so the verdict asks for changes: a fix round applies them; neither changes a statement, a supplier or the merge-order position. No supplier gap is declared. The design files and the source manifest were not edited. Elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so no Lean command was run and there was nothing to probe for padding. No maintainer notes exist for this roadmap.

## Previous finding, checked first

| Round-13 finding | Passage read at this head | Result |
|---|---|---|
| F01 (P3) a Check of 5.2 evaluated the theorem at J = 0, which the Layer 5 standing hypothesis excluded | `packages/ConstructiveFieldTheoryPhi4/design/README.md:499`: "Throughout, ρ is admissible, J ≥ 0, L ≥ 1, … the bound `E(p) Ŝ_L(p) ≤ 1/J` of 5.4 and the statements of 5.5 assume J > 0"; `:545` "Prove, for J > 0, the infrared bound … and, for J ≥ 0, its quadratic-form version"; `:558` "for admissible ρ and J > 0"; `:32` "for p ≠ 0 and J > 0"; plan entries 5.1–5.4 carry `J >= 0`, 5.4 adds `J > 0 for the bound`, 5.5 keeps `J > 0` | **Repaired** |

Adversarial pass on the text the repair changed or added (values computed this round):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Layer 5 standing hypothesis | J = 0 | density `e^0`, `μ^{per} = ρ^{⊗T_L}`, Z = 1 | defined |
| 5.2 at J = 0, edge and vertex forms | product measure; d = 1, L = 2, R(x) = −x, f = σ₀ | edge: `E f · conj(E f) = |E f|²`; vertex: fixed set {0, 2}, `E[σ₀²] = 1` against `|E σ₀|² = 0` | Check now inside the hypothesis, correct |
| 5.2 at L = 1 | edge reflection 0 ↔ 1; vertex reflection on ℤ/2 | kernel `e^{2Jσσ′}`, eigenvalues `e^{2J} ± e^{−2J}`, both ≥ 0 iff J ≥ 0; R = id and the form is `⟨|f|²⟩` | holds |
| 5.3 equivalence | expand the square | `−(J/2)ΣΣ((φ+h)_x − (φ+h)_{x+e_j})² = (J/2)(φ,Δφ) + J(φ,Δh) + (J/2)(h,Δh)`, so `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩ e^{(J/2)(h,Δh)}` | holds |
| 5.3 at J = 0; two-site Check | any h; u = h₀ − h₁ | `ρ̃ = ρ`, `Z(h) = 1`; weights `2e^{−Ju²} + e^{−J(2+u)²} + e^{−J(2−u)²}`, second derivative `−4J + e^{−4J}(32J² − 4J)`, `max e^{−4J}(8J − 1) = 2e^{−3/2} = 0.446` at J = 3/8 | equality at J = 0; Check correct |
| 5.4 identity `(h, −Δh) = ΣΣ(h_x − h_{x+e_j})²` | L = 1, d = 1, h = (1, −1) | `(Δh)₀ = −4`, `(Δh)₁ = 4`, `(h, −Δh) = 8`; right side `2² + (−2)² = 8` | holds |
| 5.4 quadratic form, J ≥ 0 | second order of 5.3 in εh; J = 0 | `J²⟨(φ,Δh)²⟩ ≤ J(h, −Δh)`; first order `⟨φ₀⟩Σ_x(Δh)_x = 0`; at J = 0 the claim is `0 ≤ 8` | J ≥ 0 suffices |
| 5.4 bound `E Ŝ ≤ 1/J`, J > 0 | h = cos(p·x), sin(p·x); L = 1 Ising | `J E² |T| Ŝ ≤ E |T|`; `32J(1 − tanh 2J) ≤ 8` iff `4J(1 − tanh 2J) ≤ 1`; at 2J = 0.64: `1.28 · 0.4351 = 0.557` | holds; the new Check agrees with the first |
| 5.4 against the printed constant | `aizenman-duminilcopin-2021 lines 1019, 1069–1087`: `|J| = Σ_y J_{0y}`, `E(p) = 2Σ(1 − cos p_j)`, bound `1/(2|J|β)` | d = 1, J = 0.375: `4(1 − tanh 0.75) = 1.46` against `1/(4J) = 0.667` (and against `1/(2J) = 1.33`) | the README's correction stands |
| 5.5 | sum rule with 5.4; J ↓ 0 | `1 ≤ |T|⁻¹Ŝ(0) + J⁻¹|T|⁻¹Σ_{p≠0} 1/E(p)`; `1 − I_d/J → −∞` | J > 0 needed and stated |

Pattern sweep. A Check that leaves its target's stated hypotheses without saying so: none found in the fifteen sampled targets or in Layers 4–5. The Checks that do leave the hypotheses (antiferromagnet in 5.2, Lebesgue example in 5.3, d = 1, 2 in 5.5, non-even and J < 0 controls in Layers 1–3) say so.

## Verified sound

**Coverage.** All 778 lines of the README were read. `design/plan.json` parses: 8 layers, 36 targets, 4 suppliers, 1 consumer, `gaps: []`; no prerequisite names a later target; every target has at least 3 tests (0.1: 5; 0.2: 4 and 3; 1.1: 4; 1.5: 4; 2.1: 9; 2.2: 6; 3.4: 4; 3.5: 5; 3.7: 6; 4.2: 4; 4.3: 5; 5.4: 4; 7.1: 5; 7.2: 4; the rest 3). The author flagged no locator as unverified.

**Principles.** No route-specific shortcut (Lee–Yang for site-dependent complex fields and every ferromagnetic coupling; FKG without evenness; Gaussian processes on an arbitrary index type; moment bounds for every coupling). No roadmap is planned again; supply runs one way; no algorithm; no copied passage; no Lean file, hence no `set_option` and no sorry'd data.

**Adversarial table: the fifteen sampled targets, the headlines and the targets of the findings.** Every value was computed this round.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, Hamiltonian witness | two Ising sites, `J = (log 3)/2` | `cosh J = 2/√3`, `tanh J = 1/2`, `tanh 2J = 4/5`, `tanh(J/2) = 2 − √3` | sound |
| Conventions, Gaussian torus field | density `exp(JΣΣφφ + bΣφ²)` | `= exp(−½[J(φ,−Δφ) + 2(|b| − dJ)|φ|²])`, `Ŝ(p) = 1/(JE(p) + 2(|b| − dJ))` | sound |
| 0.2 moments, scaling, hard limit | u = λφ⁴; φ ↦ sφ; b = 2λ | `¼λ^{−(2k+1)/4}Γ((2k+1)/4)`, ratio `λ^{−k/2}Γ((2k+1)/4)/Γ(1/4)`; k = 2: `1/(4λ)`; `Γ(3/4)/Γ(1/4) = 0.33799`; `ρ_{λs⁻⁴, bs⁻²}`; `−λ(φ² − 1)² + λ` | sound |
| 0.2 conventions | `γ_{−1/2}`; `γ_b` | `exp(bφ²) = exp(−φ²/(2v))` with `v = 1/(2|b|)`; `∫e^{cφ²}dγ_b = ∞` for `c ≥ |b|` | sound; not admissible as stated |
| 1.1 stability bound; Checks | any coupling; three Ising sites; N(0,1) pair | `−H ≤ ½‖J‖Σφ_x²`; `Z = (2e^{3J} + 6e^{−J})/8`, numerator `2e^{3J} + 2e^{−J} − 4e^{−J}`; `E[e^{y²/2}] = ∞` | sound |
| 1.2 | chain {0,1,2}; `(δ₀ + δ₁)/2` | `tanh J`, `tanh² J`; mean ½ | sound; R02 on the locator |
| 1.5 (used by 7.2, 7.4) | two sites; d = 1 | determinant `4b² − J²`, `⟨φ_xφ_y⟩ = J/(4b² − J²)`; `1/√((2 + μ²)² − 4) = 1/(μ√(4 + μ²))` | sound |
| 2.1 Lee–Yang (headline) | pair polynomial; a = 1 | `|1 + az|² − |a + z|² = (1 − a²)(1 − |z|²)`; `(1 + z₁)(1 + z₂)` | sound |
| 2.1 product formula | ρ_I; uniform on {−1,0,1} | `Σ((k+½)π)⁻⁴ = 1/6`, cumulant `−12/6 = −2`; `(2π)⁻²π²/sin²(π/3) = 1/3 = ½ · 2/3` | sound |
| 2.2 tail control (headline) | steps (a), (d), (e), (f) | `(σ²/2)² ≤ 3σ⁴P`, `P ≥ 1/12`; `θ log C + θ^{1−α′/2} → 0`; at most `S/(2θ)` large terms; `e^{2cg²s} ≤ e^{g²/4}` for `s < 1/(8c)` | sound |
| 2.3 (headline) | exponent at `m = φN^{−1/4}/c` | `(g_N − 1)Nm²/2 = bφ²`, `Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴` | sound |
| 3.3 FKG | lattice gas on two sites; two Ising sites | weights 1, 1, 1, `e^J`: covariance `(e^J − 1)/(3 + e^J)²`; `−tanh J ≤ 0` | sound |
| 3.4 switching lemma (headline) | two sites, A = B = {x, y}, F ≡ 1; J = 0 | left `sinh² J`; right `cosh² J − 1`; `Z_D = sinh 0 = 0` and `0 = 0`; `Σ_n w = Π e^{J_{xy}}`; normalised `Z = Σ_{∂n=∅} w` with no factor `2^{|V|}` | sound |
| 3.5 (headline) | chain, Λ = {0}; repeated sites | `tanh² J ≤ J tanh J`; `1 ≤ 1 + 2tanh² J` | sound |
| 3.6 expansion | pairs in V₊, mixed, with V₀ | `φ_xφ_y + φ_{Rx}φ_{Ry} = ½(ss + tt)`, `φ_xφ_{Ry} + φ_{Rx}φ_y = ½(ss − tt)`, `J_{xz}s_xφ_z`; moments of `s^a t^b` vanish unless a, b even (even ρ) | sound |
| 3.6 lattice hypotheses | `x_i = a` with a half-integer, integer; `x_i ± x_j = a` | neighbours x, Ry across the plane force y = x; coordinates differ by ≥ 2; `x_i ∓ x_j` differs by ≥ 2 while a step changes it by ≤ 1; both diagonal reflections preserve ℤ^d | sound |
| 3.6 Checks; non-even control | chain {0,1,2,3}; `J₀₂ = J₁₃ = K`; R01 instance | `tanh J ≥ tanh² J`, `1 ≥ tanh³ J`; `0 < tanh K`; `−1/3 < −1/27` | Checks correct; R01 |
| 3.7 (used by 4.2) | maximal site; ε = ¼, a = 2; z = (1, −1), J = 1 | `4λm² ≤ 1 + (2b₊ + ‖J‖)m`, `M(λ,0,0) = 1/(2√λ)`; `1.6905 > 1.6487`; `1.329`, `e^{0.2384} = 1.269`, `e^{1.7616} = 5.822` | sound |
| 4.3 | d = 1; c = δ₀ − δ₁ + δ₂ | `Σt^{|x|} = (1 + t)/(1 − t) = e^{2J}`; `3 − 4t + 2t² = 2(1 − t)² + 1`; `3 − 16/5 = −1/5` | sound |
| 4.4 | reflection in `x_i = n + ½`; (5.3) ⇒ (5.4); d = 2 small t | A = δ₀, B = δ_{ne_i}: `S(ne_i) ≥ S((n+1)e_i)`; `‖x‖₁ ≤ d‖x‖∞ ≤ ‖y‖∞`; `t ≥ 2t² ≥ t²` | sound |
| 5.1 | L = 1; L = 2; Parseval | two bonds give `2Jφ₀φ₁`, `tanh 2J`; 4-cycle `(t + t³)/(1 + t⁴)`; `|1 − e^{ip_j}|² = 2 − 2cos p_j`; `Ŝ_L(p) = |T|⁻¹⟨|φ̂(p)|²⟩` by translation invariance | sound |
| 5.5 (headline) | d = 3 | `I₃ = W/2 = 0.2527`, `G(0) = 3W = 1.516`; Peled–Spinka's `(1/(2J))·W` is `I₃/J` | sound |
| 6.1 | subspace condition; non-example | coordinates under ν_{f,g,h} satisfy `v_h = av_f + bv_g` a.s.; `T_{−f} = T_f ≠ −T_f` | sound |
| 6.3 (headline) | `K = [[1,2],[2,1]]`; bilinear K | `Var(X₁ − X₂) = −2`; `Var(X_{af+bg} − aX_f − bX_g) = 0` | sound |
| 7.1 | W_d direction; tent; three-site chain; Σ = 0 | `g⁻¹e₁ = −e₂`; `1 + (L−1)(2L−1)/(3L) = (2L² + 1)/(3L)`, `½∫f² = 1/3`; `3 + 4t + 2t²`; an i.i.d. sum that vanishes a.s. forces ρ = δ₀ | sound |
| 7.2 | Gaussian stability; telegraph Check | `2|b| ≥ 2dJ_n >` top eigenvalue of `J_nA_R`; flip probability `(1 − t)/2 ≈ c/(2L)`, covariance `e^{−c|u−v|}`, `|T_f| ≤ κ^{−1/2}∫|f|` | sound |
| 7.3 | lattice gas; diluted ρ_n | `Σ_L = N/4 + N²/4`; site variance `2 − p_n`, limit variance `2^{−d−1}∫f²` | sound |
| 7.4 (headline) | scaling; d = 1; d = 3, 4 | `L^{2d}·L^{−d}·L² = L^{d+2}`; `C_m(1_Q,1_Q) = 2/m² − (1 − e^{−2m})/m³`, `1 + e⁻²` at m = 1, `2/m − 4/3 + …` as m → 0; `Γ(½)/(4π^{3/2}) = 1/(4π)`, `1/(4π²)` | sound; agrees with RelativisticQuantumFieldTheory §7.1 (`(n − 2)|S^{n−1}| = 4π^{n/2}/Γ(n/2 − 1)`) |

Targets outside the sample that no repair touched (0.1, 1.3, 1.4, 3.1, 3.2, 4.1, 4.2, 6.2, 6.4, 8.1, 8.2) rely on the round-13 and round-12 tables, whose rows carry computed values; I recomputed one value in each of 0.1, 4.2, 6.2 and 6.4 (`exp(|φ|^α − φ² log(1 + φ²)) → ∞`; `P(σ_{x+1} = σ_x) = (1 + tanh J)/2`; `e^{−|x|²−|y|²} ≤ e^{−|x−y|²/2}`; `M₄ = 3M₂²`) and they agree.

**Seeded source sample.** All fifteen targets were read at their locators.

| Target | Read | Outcome |
|---|---|---|
| 0.2 | `aizenman-duminilcopin-2021 lines 142–145` (p. 4), `228–230` (p. 5), `255–258` (p. 6); `simon-2020-twelve-tales lines 1019–1022` (p. 25) | (1.12) with the README's sign of b; (1.17); (1.20); the opposite sign in Simon |
| 1.1 | `aizenman-duminilcopin-2021 lines 137–146` (pp. 3–4); `sokal-1982 lines 387–396` (p. 326) | (1.11)–(1.12), unordered pairs; finite volume and footnote 2 |
| 1.2 | `aizenman-duminilcopin-2021 lines 228–230`; `sokal-1982 lines 402–409` (p. 327) | exist as cited; R02 |
| 3.3 | `sokal-1982 lines 423–424` (p. 327) | property (h), FKG for increasing functions |
| 3.4 | `aizenman-duminilcopin-2021 lines 421–432` (p. 10), `464–507` (p. 11) | Definitions 3.1–3.2, (3.1)–(3.2), Lemma 3.3 with (3.6), (3.7)–(3.9); the source's F is real-valued and its Z unnormalised |
| 3.6 | `aizenman-duminilcopin-2021 lines 1022–1038` (p. 23); `sokal-1982 lines 436–444` (p. 328), `455–466` (p. 329) | (5.2), the two families of hyperplanes; property (k); the Remark |
| 4.4 | `aizenman-duminilcopin-2021 lines 1040–1051` (pp. 23–24) | Proposition 5.1, (5.3), (5.4) with the README's hypothesis `‖y‖∞ ≥ d‖x‖∞` |
| 5.1 | `aizenman-duminilcopin-2021 lines 1055–1084` (p. 24); `peled-spinka-2017 lines 1249`, `1283–1284` (p. 27) | (5.5)–(5.8), the dual torus with the other half-open convention; Section 2.7.1 and the torus |
| 5.4 | `aizenman-duminilcopin-2021 lines 1085–1091`; `peled-spinka-2017 lines 1686–1742` (pp. 34–35); `simon-2020-twelve-tales lines 1516–1519`, `1548–1560` (pp. 36–37) | (5.9) as printed, (5.10); (49)–(52); (5.17), (5.22) |
| 5.5 | `peled-spinka-2017 lines 1207–1222` (p. 26), `1759–1766` (p. 36); `simon-2020-twelve-tales lines 1502–1523` (p. 36) | Theorem 2.13 with the limiting inequality; (53); (5.15)–(5.18) |
| 6.1 | `aizenman-duminilcopin-2021 lines 55–57` (p. 2), `183–187` (p. 4) | (1.4); footnote 2 |
| 6.3 | `aizenman-duminilcopin-2021 lines 77–89` (p. 2) | the paragraph of (1.7) |
| 7.1 | `aizenman-duminilcopin-2021 lines 157–166` (p. 4) | (1.14)–(1.15) |
| 7.2 | `aizenman-duminilcopin-2021 lines 167–187` (p. 4) | Definition 1.1 (volume limit first, subsequences allowed), footnote 2 |
| 7.4 | `sokal-1982 lines 620–633` (p. 334), `710–721` (p. 337); `frohlich-1982 lines 265–269` (p. 13); `simon-2020-twelve-tales lines 954–974` (pp. 23–24) | the continuum-limit set-up and Lemma 2.2; the free lattice two-point function; (3.8) on ℤ². No read source states the reachability with the block normalisation; the README gives its own route, checked above |

**Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5; the checkouts' heads equal `lake-manifest.json`. All 43 file-and-line citations of the supplier contracts were opened by script and by hand; each line carries the named declaration (for example `class IsNegInvariant` at `Mathlib/MeasureTheory/Group/Measure.lean:310`; `fkg` at `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370`, a statement about finite sums with `0 ≤ μ`, `0 ≤ f`, `0 ≤ g`; `structure IsGaussianProcess` at `Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30`, one field, no centring; `exists_isProjectiveLimit_of_countable` at `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165` with `[Countable ι]` and standard Borel coordinates; `Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` at `TauCeti/Probability/Moments/Determinacy.lean:246` with an exponential moment for both measures; `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24–26` says the extension theorem is not in Mathlib).

**Duplication, by object.** The pinned libraries have no Ising or Gibbs measure, no Lee–Yang, random-current, Griffiths or infrared statement and no Wick–Isserlis formula (grep over both pins). `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean` gives a Hilbert-space feature map of a positive semidefinite kernel, not a probability law, so 6.3 is not a restatement of it. `roadmaps grep` over main and the 468 open heads for "Lee–Yang", "switching lemma", "random current", "Simon–Lieb", "infrared bound", "Gaussian domination", "reflection positivity", "Griffiths–Simon", "Gaussian free field", "chessboard", "Ising model", "Gibbs measure", "Gaussian process", "white noise", "Kolmogorov extension": the only matches are RelativisticQuantumFieldTheory (Osterwalder–Schrader reflection positivity of Schwinger functions, zero-dimensional integrals, §7.1), DenseGraphLimits (graph-parameter reflection positivity), ClassicalErgodicTheory (Gibbs measures on shift spaces), StochasticCalculus Layer 1, the statistics roadmaps (limit processes) and PDE's deferral. None constructs a process from an arbitrary kernel or states a lattice result of this roadmap. ConstructiveFieldTheoryPhi4PartII is on neither main, the open list nor the board index; it is named only as a consumer. The overlap file lists no changing pull request, no dropped id, no revision-only id and no second copy; main has no folder of this name.

Overlap check: read MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, PointProcesses, RandomMatrices, StandardDistributions, StochasticCalculus; shared objects: the continuum Green kernels of `−Δ + m²` (owner RelativisticQuantumFieldTheory §7.1, cited), the arbitrary-index Kolmogorov extension (owner StochasticCalculus §1.1, cited), Wick–Isserlis for Gaussian vectors (owner StandardDistributions §5.3, cited; RandomMatrices also proves a Wick formula, which is between those two roadmaps on main); nothing else shared.

**Supplier-order audit.** Gate output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no citation and no name found nowhere. Citations resolved now:

- StochasticCalculus §1.1 (`TauCetiRoadmap/StochasticCalculus/README.md:879`): the arbitrary-index extension for standard Borel state spaces and consistent probability laws.
- StandardDistributions §5.3 (`TauCetiRoadmap/StandardDistributions/README.md:577`, "Mixed moments" at `:605`): monomial integrability and Wick–Isserlis for centred vectors with positive semidefinite covariance.
- ZerosOfLFunctions §5.5 (`TauCetiRoadmap/ZerosOfLFunctions/README.md:1573`; `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean:78` `OrderLE`, `:115` `hadamard_of_orderLE_one`): differentiable f, `f 0 ≠ 0`, `OrderLE f 1`, multipliable product, exponent `a + b s`, as the contract says.
- RelativisticQuantumFieldTheory §7.1 at its open head (a new roadmap folder, earlier in the merge order; README line 4476): multiplier `(4π²‖ξ‖² + m²)⁻¹`, heat integral for x ≠ 0, exterior decay for 0 < c < m, massless kernel `|x|^{2−n}/((n − 2)|S^{n−1}|)` for n ≥ 3. Its text names neither this roadmap nor lattice Gibbs fields: no cycle.
- Scope deferrals: PDE (`TauCetiRoadmap/PDE/README.md:104–107`) and OperatorAlgebraDynamics D9 (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:3851`) exist as cited.

**Shape.** Summary, Scope and ownership, Conventions, contracts per supplier, build paragraph, eight layers each ending in Examples and Dependencies, consumers, references (14 entries, the 14 manifest keys). The layer order is forced where it matters (1 needs 0; 2 needs 1; 3 needs 2 through 3.5 and 3.7; 4 needs 3; 7 needs 1, 3.2 and 6); Layers 5 and 6 are declared independent. No layer is named after a source chapter and no sentence says the plan follows a source. No backticked name is presented as a Lean declaration of this roadmap. A pattern search found no process words, pull-request numbers, machine paths, LaTeX delimiters or field lists ("lemma" occurs only in names of results).

**Headlines.** Lee–Yang and the Griffiths–Simon transfer with φ⁴ membership (Layer 2); Griffiths, FKG, the switching lemma, Lebowitz, Gaussian, Simon–Lieb, reflection monotonicity and uniform moments (Layer 3); the free-boundary state and critical point (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order in d ≥ 3 (Layer 5); covariance realisation and Wick's law (Layer 6); reachable fields and the reachability of the Gaussian free field (Layer 7). Stating them in `Suggested.lean` is the package stage's work.

**Copyright.** Wording was set beside the source at every locator of the sample table and at six further passages (the proof route of 3.6 against `sokal-1982 lines 455–466`; the hyperplane sentence of 3.6 against `aizenman-duminilcopin-2021 lines 1035–1038`; the Griffiths-trick Check of 2.1 against `simon-2020-twelve-tales lines 1011–1018`; the definition of 2.2 against `aizenman-duminilcopin-2021 lines 363–384`; the transfer paragraph of 2.2 against `lines 2018–2027`; the derivation of 5.4 against `peled-spinka-2017 lines 1731–1742`): 28 passages in all. No shared run beyond formulas, standard names and the forced phrase for a sub-current (under ten words). Arrangement: the most cited source has sections 1 (fields and main result), 2 (the class), 3 (random currents), 4, 5 (two-point function), 6, 7 (extension to the class), read at `lines 136`, `363`, `413`, `993`, `2014`. The roadmap puts that source's §1 material last (Layers 6–7), builds Layer 3 from its §3, §5.1 and §7 with two other sources, takes Layers 4 and 5 mostly from other sources and has no counterpart of its §4 and §6: no one-to-one run. No table, figure or exercise list is taken over.

Source independence: 28 passages compared with 5 sources, none shared; largest share aizenman-duminilcopin-2021, 50 of 119 locators; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read (below).

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, `simon-1974`: settled as uncertified in the manifest; cited by locator only, not read.
- `sokal-1982` displays (2.17)–(2.30) and `frohlich-1982` displays (33) and following: the extractions drop the formulas. I read the surrounding sentences, which name each property, and recomputed the statements independently.
- Elaboration and the one-tactic probe: not available in this lane, and the design has no Lean file.
- The Riemann-sum limit of 5.4 for `1/E(p)` in d ≥ 3 and the limit of 7.4 were checked for constants, for `L²E(q/L) ≥ (4/π²)|q|²` and for the tail estimate (Cauchy–Schwarz with Parseval), not written out in full.
- Whether the two-point case of the reflection inequality survives without evenness was not decided; R01 concerns general multi-indices only.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p. 24: the source says the infrared constant is one over twice the coupling row sum; it should be one over the per-bond coupling for the symbol of (5.7); affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p. 8: the source says block coefficients may be arbitrary reals; it should require nonnegative coefficients, since a mixed-sign pair block has positive fourth cumulant; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Section 7.1, the paragraph after Proposition 7.2, preprint p. 45: the source says uniform constants pass the bound from Ising blocks to their weak limits; it should supply tail control of the approximants; affects the proof.
- **Gap** in aizenman-duminilcopin-2021 at Section 5, the paragraph before (5.1), preprint p. 23: the source says the reflection inequality (5.2) holds for an arbitrary common spin distribution; it should assume an even distribution for products of odd total degree; affects nothing.

## For the human reviewers

- **Not tested.** Seven cited works are recorded `uncertified` in `packages/ConstructiveFieldTheoryPhi4/sources.toml` and were not read; none carries the largest share of locators.
- **Licence.** `frohlich-1982` was read as the IHES preprint P/81/41 from the institute's archive (`licence_class = "institutional"`), a scan whose equation numbers may differ from the Nuclear Physics B version.
- **Scope.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:739–761` states the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that exists neither on main nor in an open pull request nor on the board.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3def4b212ebb9b65634f808b534e37faa351deb1", "job": "REV-DESIGN-ConstructiveFieldTheoryPhi4~14", "model": "fable", "worker": "chris-x90"} -->
