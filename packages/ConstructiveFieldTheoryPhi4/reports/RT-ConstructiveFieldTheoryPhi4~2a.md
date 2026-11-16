<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17768#issuecomment-6905741857 -->
Red team round 2 pass a (claude) of 5642a3a

Verdict: accepted

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

Round 2. No new finding (no S-numbered entry): every statement, Check, locator and citation that I
could compute or open held. The record follows: the round-1 findings re-verified at this head, the
running tables with the values computed, the dependency check, and the sections the brief requires.

## Round-1 findings at this head

| Id | Status | Witness at 5642a3a |
|---|---|---|
| RT~1a/F01 and RT~1b/F01 (P2), `chessboard` false at d = 0 | repaired | `packages/ConstructiveFieldTheoryPhi4/Suggested.lean:491`: "theorem chessboard (d L : ℕ) (hd : 1 ≤ d) [NeZero L] {J : ℝ} (hJ : 0 ≤ J)"; `README.md:535`: "for d ≥ 1 and bounded measurable real functions"; Check at `README.md:543`. Elaborated type carries `1 ≤ d →`. Instance d = 0, f ≡ −1 is excluded; d = 1, L = 1, f ≡ −1: both sides 1. |
| RT~1a/F02 and RT~1b/F02 (P3), `criticalPoint_ising_ge` weaker than the README | repaired | `Suggested.lean:417–421`: conjunction of "∀ β : ℝ≥0, 2 * (d : ℝ) * β < 1 → susceptibility … ≤ ENNReal.ofReal (1 - 2 * (d : ℝ) * β)⁻¹" and the bound on `criticalPoint`; `README.md:471`: "(`criticalPoint_ising_ge`, which states both inequalities)". d = 1, β = ¼: `e^{1/2} = 1.6487 ≤ 2`. |
| RT~1a/F03 (P3), StandardDistributions asked for facts the pin proves | repaired | `README.md:79` cites `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` (MixedMoments.lean:135) and `…integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (OddMoments.lean:102), both at those lines at the pin; `README.md:89` keeps only the pairing formula. |
| RT~1a/F04 (P3), "pointwise" in the decay bullet of 6.2 | repaired | `README.md:620`: "equivalent to the existence of a representative with `sup_{|x−y|≥r} |S_2(x, y)| → 0` as r → ∞"; negative control at `README.md:627` (sup = 1 for every r). |

No repair introduced an error: the two changed Lean statements were recomputed at d = 0, 1 (table
below), the new d = 0 sentence of the Conventions (`README.md:30`) was tested on every theorem with a
dimension argument, and the three new Tau Ceti citations open at the stated lines.

## Running table: `Suggested.lean` declarations

Context: every theorem of the sections `GriffithsSimon`, `Correlation`, `Currents` and
`ClassInequalities` has `{V : Type*} [Fintype V] [DecidableEq V]`; all other binders are in the
declarations' own signatures. The elaborated types in the job's signature listing (62 entries) were
compared with the README; no binder is lost. I ran no Lean.

| Declaration | Layer | Instance | Values computed | Result |
|---|---|---|---|---|
| `IsAdmissible` | 0.1 | δ_a; N(0,1); density ∝ `exp(−φ² log(1+φ²))` | `e^{ca²}` finite; `∫e^{φ²/2}dN = ∞`; admissible, fails (2.2) for α > 2 | agrees |
| `phi4Measure` | 0.2 | λ, b = 0 | `∫φ⁴ = Γ(5/4)/(λΓ(1/4)) = 1/(4λ)`; `∫φ² = 0.3380/√λ` | agrees |
| `isingMeasure` | 0.2 | — | mass ½ + ½ = 1, `∫φ² = 1` | agrees |
| `hamiltonian`, `partitionFunction`, `gibbsMeasure` | 1.1 | two Ising sites, J = (ln 3)/2; three sites; V = ∅ | `Z = 2/√3`, `⟨σσ⟩ = ½`; `Z = (e^{3J}+3e^{−J})/4`; `Z = 1`, Dirac | agrees with Conventions |
| `isingBlockMeasure`, `IsIsingBlock` | 2.1 | N = 0; N = 2, q = (½,½), K = (ln 2)/2 | δ₀; weights `¼e^K = ½e^{−K}`, uniform on {−1,0,1} | agrees |
| `griffithsSimonClass` | 2.2 | δ₀; N(0,1); `¾δ₀+⅛(δ₁+δ₋₁)` | member; `∫e^{|φ|^α} = ∞`; `¼ > 3/16` | agrees |
| `leeYang` | 2.1 | one site; two sites, equal h; J = −(ln 2)/2 | `cosh h`, zeros `iπ(k+½)`; zero needs `cosh 2h ∈ [−1,0)`, Re h = 0; zero at `0.658 + 1.571i` | true; hypotheses needed |
| `isingBlock_laplace_ne_zero` | 2.1 | N = 0; uniform {−1,0,1}; q = (1,−1), K = (ln 3)/2 | 1; zeros `i(±2π/3+2πk)`; zero at `0.881+1.571i` (excluded by `0 ≤ q`) | true |
| `isingBlock_laplace_hasProd` | 2.1 | ρ_I; uniform {−1,0,1}; δ₀ | `Σ((k+½)π)⁻² = ½`, `−12·(1/6) = −2 = 1 − 3`; `(2π)⁻²·π²/sin²(π/3) = 1/3 = ½·⅔`; x ≡ 0 | true |
| `isingBlock_tailControl` | 2.2 | CLT blocks (limit N(0,1), growth fails); blocks `Σσ_i/(√N log N)` | `s_N(θ) = ½` for large N, moments → ∞; `(1 − 2c/log²N)^{−1/2} = 1.0216` at c = 1, N = 1000 | true; growth hypothesis needed |
| `tendsto_gibbs_of_isingBlock` | 2.2 | `½(δ_{−s_k}+δ_{s_k})`, s_k → s | `s_k² tanh(Js_k²) → s² tanh(Js²)`; Z → Z | true |
| `phi4Measure_mem_griffithsSimonClass` | 2.3 | exponent at `m = φN^{−1/4}/c` | `N m²(g_N−1)/2 − N m⁴/12 = bφ² − φ⁴/(12c⁴) = bφ² − λφ⁴` | true |
| `griffiths_first`, `griffiths_second` | 3.1 | two Ising sites; `ρ = (2δ₋₁+δ₁)/3`; J < 0 | `tanh J ≥ 0`, `1 − tanh²J ≥ 0`; `−1/3`; `tanh J < 0` | true; hypotheses needed |
| `fkg_gibbs` | 3.3 | lattice gas, two sites | `(e^J − 1)/(3+e^J)²` | true iff J ≥ 0 |
| `Edge`, `sources`, `currentWeight` | 3.4 | two sites | even n: `cosh J`; odd n: `sinh J` | agrees |
| `randomCurrent_representation` | 3.4 | V = ∅, A = ∅; two sites | 1 = 1; `sinh J/cosh J = tanh J` | true |
| `switching_lemma` | 3.4 | two sites, A = B = {x,y}, F ≡ 1; J = 0 | `sinh²J = cosh²J − 1`; 0 = 0 | true |
| `gaussian_inequality` | 3.5 | n = 0; (x,x,y,y) Ising; single site ρ_{λ,0} | 1 ≤ 1; `1 ≤ 1 + 2tanh²J`; `0.25 ≤ 0.3427` | true |
| `simon_lieb` | 3.5 | chain 0–1–2, Λ = {0} | `tanh²J ≤ J tanh J` | true |
| `messager_miracleSole` | 3.6 | chain {0,1,2,3}; only `J_{02} = J_{13}`; `(2δ₋₁+δ₁)/3`, J = 0 | `tanh J ≥ tanh²J`; `0 < tanh K` (hypothesis fails); `−1/3 < −1/27` | true; hypotheses needed. Quadratic form recomputed: `½(J_{xy} ± J_{x,Ry})` on `s_xs_y`, `t_xt_y`, no `s t` term |
| `phi4_secondMoment_le` | 3.7 | maximal site m | `4λm² ≤ 1 + (2b₊+K)m`; `M(λ,0,0) = 1/(2√λ) ≥ 0.338/√λ` | true |
| `newman_bound` | 3.7 | ρ_I; ε = ¼ non-member, a = 2; two sites, z = (1,−1) | `cosh a ≤ e^{a²/2}`; `1.6905 > 1.6487`; `1.329 ≤ 5.822` (signed form 1.269 fails) | true |
| `box`, `boxGibbs`, `nnCoupling` | 4 | d = 0; d = 1 | one point; `2R+1` points, bonds `|x−y| = 1` | agrees |
| `twoPoint`, `susceptibility`, `criticalPoint` | 4.3 | d = 1 Ising; δ₀ | `t^{|x|}`, `χ = (1+t)/(1−t)`, `β_c = ∞`; 0, 0, ∞ | agrees |
| `exists_infiniteVolume_limit` | 4.2 | d = 0; d = 1 Ising | constant sequence; Markov chain, `p = (1+tanh J)/2` | true; `hexp` is not vacuous because `hρ` makes the integrand integrable |
| `phi4_uniform_expMoment` | 4.2 | — | `⟨e^{a|φ|}⟩ ≤ 2e^{a²M/2}`, M of 3.7 with K the row norm | true |
| `criticalPoint_ising_ge` | 4.3 | d = 0; d = 1, β = ¼; β = 0 | 1 ≤ 1, ∞ ≤ ∞; 1.6487 ≤ 2; 1 ≤ 1 | true |
| `twoPoint_reflection_monotone` | 4.4 | d = 1; d = 2 to order t² | `t^n`; `t ≥ 2t² ≥ t²` for small t; reflection in `x_2 = x_2/2` gives `S(x_1e_1) ≥ S(x)` | true |
| `torusCoupling`, `torusSymbol`, `structureFactor` | 5.1 | L = 1, d = 1; L = 2 | coupling 2J, `Ŝ(0) = 1+tanh 2J`, `Ŝ(π) = 1−tanh 2J`, `E(π) = 4`; `(t+t³)/(1+t⁴)` | agrees |
| `infraredConstant` | 5.4 | d = 3 | `W/2 = 0.2527 = 1.516/6` | agrees |
| `reflectionPositive` | 5.2 | L = 1, ε = 1; L = 1, ε = 0; general L, ε = 1 | matrix `[[e^{2J},e^{−2J}],[e^{−2J},e^{2J}]]`, PSD iff J ≥ 0; R = id, `∫|f|² ≥ 0`; half `{1..L}` ↦ `{L+1..2L}` | true |
| `chessboard` | 5.2 | d = 1, L = 1; f ≡ −1 | Cauchy–Schwarz of the edge form; 1 ≤ 1 | true for d ≥ 1 |
| `gaussian_domination` | 5.3 | L = 1, d = 1, Ising | `Z'' (0) = −4J + e^{−4J}(32J² − 4J) ≤ 0`, since `max e^{−4J}(8J−1) = 2e^{−3/2} = 0.446` | true |
| `infrared_bound` | 5.4 | L = 1, d = 1, Ising; Gaussian torus field | `4J(1−tanh 2J) ≤ 0.557`; `E/(2(|b|−dJ)+JE) < 1/J`, sharp | true |
| `ising_longRangeOrder` | 5.5 | sum rule | `|T|⁻¹Ŝ(0) ≥ 1 − J⁻¹|T|⁻¹Σ_{p≠0}1/E(p)` | true |
| `IsRandomField` | 6.1 | `T_f = |∫f|` | `T_{−f} = T_f ≠ −T_f` | excluded |
| `exists_unique_gaussianProcess` | 6.3 | `[[1,2],[2,1]]`; I = ∅ | variance `1−4+1 = −2`, excluded by `hpsd`; Dirac on the one-point space | true |
| `isGaussianProcess_iff_wick` | 6.4 | n = 0; n = 2, f_i = f; random sign field | 1 = 1; `3M_2²`; `M_4 = (∫fh)⁴ ≠ 3(∫fh)⁴` | true |
| `latticePoint`, `blockSecondMoment`, `rescaledField` | 7.1 | d = 1, L = R = 1 Ising; tent f, R = 4L; quarter-turn | `3+4t+2t²`; `(2L²+1)/(3L(2L+1)) → 1/3`; `φ_{g⁻¹e₁} = φ_{−e₂}` | agrees |
| `ReachabilityScheme`, `.fieldLaw`, `.HasLimitLaw`, `.Converges` | 7.2 | g ≡ 1 in `HasLimitLaw` | `∫1 dν = lim 1 = 1`, so ν is a probability measure and is unique | determines its object |
| `exists_reachableField` | 7.3 | `(δ₀+δ₁)/2`, J = 0; mixture with `p_n = |Λ|⁻²` | `T_f → 2^{−d}∫f`, not symmetric (evenness needed); variance `2^{−d}∫f²` versus limit `2^{−d−1}∫f²` | true |
| `gffCovariance` | 7.4 | d = 1 | `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`, `1+e^{−2}` at m = 1, `~2/m` | agrees |
| `gff_reachable` | 7.4 | d = 0, m > 0; general | both sides `N(0, f_i(0)f_j(0))`; `L²E(q/L) ≥ (4/π²)|q|²`, prefactor `L^{d+2}` on both covariance and block variance | true |

## Running table: README targets (values beyond those above)

| Target | Instance | Values | Result |
|---|---|---|---|
| Conventions, Hamiltonian | J = (ln 3)/2 | `tanh J = ½`, `tanh 2J = 4/5`, `tanh(J/2) = 2−√3` | correct |
| Conventions, Fourier | d = 1 | transform of `e^{−m|x|}/(2m)` is `1/(m²+4π²ξ²)` | correct |
| 0.1–0.2 | scaling, hard limit | `−λφ⁴+2λφ² = −λ(φ²−1)²+λ` | correct |
| 1.1 | stability bound | `−H ≤ ½‖J‖Σφ_x²` | correct |
| 1.4 Check | `ρ_k`, J = 1 | `Z ≥ ¼e^{−2k}e^{k²}` | correct |
| 1.5 | two sites; d = 1 | inverse `(4b²−J²)⁻¹[[2|b|,J],[J,2|b|]]`; `G_μ(0) = 1/(μ√(4+μ²))` | correct |
| 2.1 Checks | q = (1,−1) | `ε = 1/(1+e^{2K})`, `16ε > 48ε²` iff `ε < 1/3`; cumulant `4 − 3 = 1` | correct |
| 2.1 route | pair polynomial | `|1+az₁|² − |a+z₁|² = (1−a²)(1−|z₁|²)` | correct |
| 2.2 route (a)–(f) | each step | `P ≥ 1/12`; `s_k(θ) log 2 ≤ θ log E_k(θ^{−1/2})`; count `≤ S/(2θ)`; `E[(1+cSg²)^{S/2θ}e^{g²/4}] < ∞` | correct |
| 3.2 Check | `(2δ₋₁+δ₁)/3`, two sites | `⟨φ₀⟩ = −3e^J/(5e^J+4e^{−J})`, from −1/3 toward −3/5 | correct |
| 3.6, lattice hypotheses | coordinate and diagonal planes | no pair x, Ry of neighbours with x ≠ y on one side | correct |
| 3.7 Checks | diagonal; oscillating F | `1 − 0.338 = 0.662`; `∫|cos t|/t dt = ∞` | correct |
| 4.3 Checks | c = δ₀−δ₁+δ₂ | `3−4t+2t² = 2(1−t)²+1`; `3 − 16/5 = −1/5` | correct |
| 5.3 | identity; equivalence | `−(J/2)ΣΣ(∇φ)² = JΣΣφφ − dJΣφ²`; `Z(h)/Z(0) = ⟨e^{J(φ,Δh)}⟩e^{(J/2)(h,Δh)}` | correct |
| 5.4 Check | h = (1,−1) | `(h,−Δh) = 8`, `32J(1−tanh 2J) ≤ 8` | correct |
| 6.2 Checks | Gaussian h | `e^{−|x|²−|y|²} ≤ e^{−|x−y|²/2}` | correct |
| 7.4 | massless kernel | `(d−2)|S^{d−1}| = 4π^{d/2}/Γ(d/2−1)`; `1/(4π|x|)` at d = 3 | correct |
| 8.1 Check | Gaussian susceptibility | `1/(2(|b|−dβ))`, `L²/m²` at β = 1 | correct |

## Dependency check

    depcheck: 241 roadmaps, 2255 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** all 60 of `Suggested.lean` (29 theorems, 30 definitions and abbreviations,
  1 structure), every line; compared with the 62 elaborated types supplied to the job.
- **Targets read:** all 34 subsections 0.1–7.4, the Conventions, the supplier contracts, the
  downstream statements 8.1–8.2 and the references, every line.
- **Checks tested:** every Check bullet with a formula or a number was recomputed (values above and
  in the tables); none false, vacuous or a restatement. Every definition has at least three.
- **Junk values.** Every real integral in a hypothesis or conclusion is of an integrable function
  under the stated hypotheses (admissibility, bounded support, `integrable_sq`, `hmom`), so no
  statement is satisfied through the value 0 of a non-integrable Bochner integral.
- **Pinned declarations:** 47 file-and-line locators opened at the pins (42 Mathlib at 1b1ccf4,
  5 Tau Ceti at 2fd255d): all at the stated line. No Lee–Yang, Griffiths, switching, Isserlis or
  prescribed-covariance Gaussian process declaration exists at either pin; Mathlib's
  GaussianProjectiveFamily.lean:24–26 says the general extension theorem is not in Mathlib.
- **Sibling citations checked (6):** StochasticCalculus §1.1 on main (arbitrary-index extension
  with uniqueness); StandardDistributions §5.3 on main (Wick–Isserlis for PSD covariance);
  ZerosOfLFunctions §5.5 on main with `hadamard_of_orderLE_one` and `OrderLE` as restated;
  RelativisticQuantumFieldTheory §7.1 and §7.3 item 1 at its open head (multiplier, heat integral,
  exterior decay for 0 < c < m, radial massless kernel, unsubtracted limit for n ≥ 3); PDE scope
  paragraph; OperatorAlgebraDynamics D9.
- **Ownership.** Searched main and the open heads by object (Lee–Yang, Griffiths inequalities,
  random current, infrared bound, reflection positivity, chessboard, Gaussian process with
  covariance or kernel, Ising, Wick, FKG): no other roadmap states these objects, and no name of
  `Suggested.lean` is a declaration of a readable roadmap. This roadmap is the owner.
- **Headlines and padding.** The 22 headline theorems of `README.md:5` are all stated; the seven
  further theorems are named README targets and none follows by one tactic or one library lemma.
- **Policy.** The pull request changes only the package folder. No `lemma`, `set_option`, `#eval`,
  `#check`, `True` placeholder, sorry'd data, pull-request number or process narrative. Imports:
  `Mathlib` and one Tau Ceti module that exists at the pin.
- **Source locators verified (44):**
  - `aizenman-duminilcopin-2021`: (1.4)–(1.8), (1.10)–(1.12), (1.14)–(1.20), Definition 1.1 and
    footnote 2, Theorem 1.2, Proposition 1.4, Definition 2.1 with (2.1)–(2.4), Definitions 3.1–3.2,
    (3.1)–(3.9), Lemma 3.3, (3.11), (5.1)–(5.10), Proposition 5.1, Proposition 5.2, (5.23),
    Lemma 5.7 with footnote 5, Theorem 7.1, Proposition 7.2, Section 7.1, each on the cited page.
  - `lebowitz-ruelle-speer-2012`: (1.2) and Lemma 2.4 (line 217).
  - `sokal-1982`: properties (d)–(l) on pp. 327–328, Proposition 2.1 (p. 333), Section 2.3
    (p. 334), Lemma 2.2 (p. 337), Section 3.1 (pp. 341–342).
  - `peled-spinka-2017`: Theorems 2.1, 2.3, 2.13, Lemma 2.4, Propositions 2.14–2.16,
    Corollary 2.17, Sections 2.7.1–2.7.3, (50)–(53), each on the cited page.
  - `simon-2020-twelve-tales`: pp. 23–25 and (5.14)–(5.22); `duminilcopin-2017-lectures`:
    Corollary 1.9, p. 14; `frohlich-1982`: (7), (12), (13), and p. 13 after (33).
- **Arrangement.** Sections of `aizenman-duminilcopin-2021`: 1 introduction, 2 the class,
  3 random currents, 4 intersection estimates, 5 the two-point function, 6 the tree diagram bound,
  7 the extension. Only Layer 2 ↔ Section 2 and subsection 3.4 ↔ Section 3 correspond; Layers 0,
  1, 4, 5, 6 have no counterpart section, Sections 4 and 6 have no layer, and the material of
  Section 1 is Layers 6–7.

Source independence: 15 passages compared with 6 sources (`aizenman-duminilcopin-2021` lines 183–187, 363–386, 421–438, 474–483, 1023–1049, 1056–1091, 1314–1322 with 1342–1344, 2018–2027; `lebowitz-ruelle-speer-2012` lines 62–68, 217–222; `simon-2020-twelve-tales` lines 1010–1022; `sokal-1982` lines 428–434, 710–721; `peled-spinka-2017` lines 1642–1648; `frohlich-1982` lines 266–269), none shared beyond formulas and standard names; largest share aizenman-duminilcopin-2021, 37 of 100 source citations in the layer text; contents compared with aizenman-duminilcopin-2021: independent. The seven uncertified texts could not be read.

## Not verifiable

- The seven uncertified sources (`griffiths-simon-1973`, `aizenman-1982`,
  `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`,
  `fernandez-frohlich-sokal-1992`, `simon-1974`): cited by locator only, no text.
- `sokal-1982`: the extraction lost the displayed formulas, so (2.17)–(2.30), (2.33) and
  (3.4)–(3.5) were located by page and surrounding prose, not by the formulas; the exact form of
  Newman's bound (j) for complex coefficients could not be compared with `newman_bound`, whose
  README route I checked instead.
- `frohlich-1982`, p. 13: the displayed formulas are missing from the extraction; the lines read
  support the free lattice two-point function, not the volume monotonicity, for which §1.5 gives
  its own route (checked).
- `isingBlock_tailControl` has no published statement that I could locate; checked by recomputing
  the route, not against a source.
- ConstructiveFieldTheoryPhi4PartII exists neither on main nor at an open head; it is named only
  as a downstream consumer and nothing is consumed from it.
- Truth of the `sorry`'d statements beyond the instances computed; no Lean was run in this pass.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), p. 24: the source says the infrared bound has right side one over twice the total coupling at a site times β; it should be one over the bond coupling times β, as in peled-spinka-2017 (52); affects a stated result.
- **Misprint** in aizenman-duminilcopin-2021 at the list of reflections after (5.2), p. 23: the source says a coordinate is sent to L minus itself with L a half-integer; it should be L an integer, the hyperplane lying at L/2; affects nothing.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), p. 8: the source says the block coefficients are arbitrary reals; it should require them nonnegative, since coefficients (1, −1) with coupling (ln 3)/2 give a positive fourth cumulant; affects a stated result.
- **Gap** in aizenman-duminilcopin-2021 at Lemma 3.3, p. 11: the source says the identity holds for any real function of currents; it should require the function nonnegative or the sums absolutely convergent; affects nothing.

## For the human reviewers

- **Scope.** `packages/ConstructiveFieldTheoryPhi4/README.md:3`, `:23`, `:751–777` assign the marginal-triviality goals to ConstructiveFieldTheoryPhi4PartII, which exists neither on main nor in any open pull request.
- **Scope.** `isingBlock_tailControl` (`README.md:274`, `Suggested.lean:158`) is a headline whose proof route is the roadmap's own; no cited source states it.
- **Licence.** `frohlich-1982` was read as IHES preprint P/81/41 from the IHES archive host recorded in `sources.toml`; I could not classify it beyond an institutional repository.
- **Not tested.** Seven of the fourteen sources are uncertified and unread; `griffiths-simon-1973` is the primary source of §2.3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5642a3a0e827cc82b8fb33254362c758b0f90aff", "job": "RT-ConstructiveFieldTheoryPhi4~2a", "model": "fable", "worker": "chris-x30"} -->
