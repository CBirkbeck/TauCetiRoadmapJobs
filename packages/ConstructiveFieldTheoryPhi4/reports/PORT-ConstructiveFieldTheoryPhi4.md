# PORT-ConstructiveFieldTheoryPhi4

## Result

- Branch: `roadmap/constructive-field-theory-phi4`, one commit `7e9970f` ("ConstructiveFieldTheoryPhi4: roadmap (README, Suggested.lean, metadata)") on `51d880d`. It adds `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/{README.md,Suggested.lean,metadata.toml}` and nothing else.
- Build: `lake build TauCetiRoadmap.ConstructiveFieldTheoryPhi4.Suggested` → `Build completed successfully (18258 jobs).` with 29 warnings, all `declaration uses 'sorry'` (one per theorem); no other warning or error.
- Gate: `gate ConstructiveFieldTheoryPhi4: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 243 roadmaps, 2270 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line).
- `roadmaps resolve` on the ported README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.
- The package review (`review.json`) is accepted with no open findings and no non-blocking notes beyond the three P3 items already repaired at the package head; its decisions are kept (Part II owns marginal triviality; nonnegative block weights; the corrected infrared constant; Gaussian processes owned here).

## Draft pull request body

This roadmap builds the lattice, probabilistic side of Euclidean scalar field theory in every dimension: single-site measures (φ⁴, Gaussian, Ising), finite-volume Gibbs measures of ferromagnetic pair interactions on finite sets, the Griffiths–Simon class of single-site measures with the Lee–Yang theorem as the tool that controls the tails of its Ising-block approximants, and the finite-volume correlation inequalities of the subject (Griffiths I and II, FKG, the random current representation and switching lemma, the Gaussian/Lebowitz and Simon–Lieb inequalities for the Griffiths–Simon class, Messager–Miracle-Solé, Newman's exponential bound). On that foundation it constructs the free-boundary infinite-volume state with its two-point function, susceptibility and critical point; proves reflection positivity, the chessboard estimate, Gaussian domination and the infrared bound on the discrete torus, with long-range order of the Ising model in d ≥ 3; develops random fields indexed by compactly supported test functions, Gaussian processes with an arbitrary positive semidefinite kernel and Wick's law; and closes with Aizenman–Duminil-Copin's reachable random fields and the reachability of the massive (and, in d ≥ 3, massless) Gaussian free field from Gaussian lattice fields. These are exactly the inputs that the marginal-triviality theorem of Aizenman and Duminil-Copin needs, which is the goal of a Part II roadmap that consumes this one. `Suggested.lean` states 29 headline theorems against the pinned Mathlib and Tau Ceti, using Mathlib's exponential tilt for the Gibbs and φ⁴ measures and Tau Ceti's perfect matchings for the pairings of the Gaussian inequality and Wick's law.

## Dependencies that are still pull requests

- RelativisticQuantumFieldTheory (§7.1 analytic Green kernels of `−Δ + m²`, Fourier agreement and decay; §7.3 item 1, the massless limit in d ≥ 3). It is earlier in the merge order (immediately before this roadmap). The README also names its §7.6 in Scope and ownership only to separate the covariance form `C_m` owned here from that section's massive reflected covariance; that is not a supply edge.

All other suppliers are on main: StochasticCalculus §1.1, StandardDistributions §5.3 (mixed moments), ZerosOfLFunctions §5.5 (`hadamard_of_orderLE_one`), and, in Scope only, OperatorAlgebraDynamics D9 and PDE (Scope and ownership, PDE Part II). No cited id is dropped by any open pull request (`scratch/overlaps.md`: none).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule: every declaration is a headline theorem or a definition a headline needs, there are no `example`s, no API lemmas restating definitions, no sorry'd data and no `set_option`. Every headline theorem named in the README's opening paragraphs is stated; the module docstring's "every headline theorem of the roadmap is statable at the pins" is correct (the marginal-triviality goals belong to the Part II roadmap and are deliberately not stated). Imports are `import Mathlib` and `TauCeti.Combinatorics.Enumerative.PerfectMatching` (exists at the pin; `TauCeti.PerfectMatching` at line 129, `TauCeti.card_perfectMatching` at line 619).

## Supplier replacements and duplication removals

- **Mathlib `MeasureTheory.Measure.tilted` replaces two hand-made normalised densities.** `gibbsMeasure J ρ` was `Z⁻¹ • (ρ^{⊗V}).withDensity e^{−H}` with a lintegral normaliser; it is now `(Measure.pi fun _ ↦ ρ).tilted (−hamiltonian J ·)`. `phi4Measure lam b` was `ofReal(∫ e^{…})⁻¹ • volume.withDensity e^{…}`; it is now `volume.tilted (−lam φ⁴ + b φ²)`. The two bodies agree with the old ones on every stable triple (and both give the zero measure on unstable ones; for `phi4Measure` with a non-integrable density the old body was the junk measure `∞ • …`, the new one is `0`), so no statement changes meaning; Mathlib's tilt API (`isProbabilityMeasure_tilted`, `tilted_of_not_integrable`, `integral_tilted`, `tilted_tilted`, read at Mathlib/MeasureTheory/Measure/Tilted.lean:42–250) now applies directly. The README supplier contracts, 0.1 (tilting preserves admissibility), 0.2, 1.1 (definition and the single-site tilting bullet, now via `tilted_tilted`), the Needs lines and the Layer 0 and Layer 1 Dependencies are updated accordingly. `partitionFunction` stays: `tendsto_gibbs_of_isingBlock` states convergence of `Z` in `[0, ∞]`.
- No target of the package is provided at the pins: Loogle/LeanSearch leads in `scratch/library-matches.md` were checked (the only same-name hit, `box`, is `BoxIntegral.Box`, an unrelated real box); Mathlib's `fkg`/`holley` are the finite-distributive-lattice inequalities, `HarrisKleitman` is set-family Harris–Kleitman, and nothing at the pins states FKG, Griffiths, Lee–Yang, reflection positivity or Gaussian-process existence for measures on ℝ^V or ℝ^I.
- **Duplication sweep by object** (main and the open roadmap heads, via `roadmaps grep`): Lee–Yang, random currents/switching lemma, chessboard, Simon–Lieb/Lebowitz, Messager–Miracle-Solé, Curie–Weiss, Paley–Zygmund: no other roadmap. Gibbs measures: DimerModelsAndLozengeTilings (open, later in the order) owns DLR specifications on finite-alphabet configuration spaces, which this README already places outside its scope; ClassicalErgodicTheory's Gibbs measures are equilibrium states of shifts. Gaussian processes with prescribed kernel: no owner elsewhere (MathematicalStatisticsAsymptotic and MathematicalStatisticsNonparametric only use Mathlib's `IsGaussianProcess`), so this roadmap owns 6.3; the Scope sentence now says why without the time-bound "no roadmap plans it". Wick–Isserlis for vectors: StandardDistributions §5.3 (cited) and RandomMatrices (main) — this roadmap's 6.4 is the field-level characterisation and consumes §5.3. Kolmogorov extension: StochasticCalculus §1.1 (cited). Euclidean Green kernels: RelativisticQuantumFieldTheory §7.1/§7.3 (cited); its §7.6 massive covariance on four-dimensional Schwartz tests is a different carrier — a one-clause distinction was added to Scope and ownership. Reflection positivity in Completed/DenseGraphLimits is for graph parameters (different object). Quantum spin systems: OperatorAlgebraDynamics D9 (cited). No removals were needed, so "Scope and ownership" records only the added §7.6 clause.
- Ownership against open pull requests was checked against the sibling checkouts listed in `scratch/open-pull-requests.md` through `roadmaps grep`/`show`.

## Upstream-reviewer fixes to the README

1. Scope and ownership: "it is planned here because no roadmap plans it" (time-bound) → owned here because every Gaussian random field of the roadmap is built from it and StochasticCalculus §1.1 supplies only the extension theorem.
2. Downstream consumers: "which no roadmap owns, would build on …" (time-bound, conditional) → "builds on Layers 1, 3, 4 and 5"; "phase transitions by the infrared bound" dropped from that bullet, since long-range order by the infrared bound is this roadmap's 5.5.
3. Scope and ownership: added how `C_m` (every d, m ≥ 0 in the stated range, C_c tests) differs from RelativisticQuantumFieldTheory §7.6 (m > 0, four-dimensional Schwartz tests), so the two covariance objects have explicit owners.
4. 0.2: the φ⁴ measure is now stated as Mathlib's tilt, with its value outside λ > 0 (zero measure for λ < 0 and for λ = 0, b ≥ 0; `γ_b` for λ = 0, b < 0), which makes "`γ_b = ρ_{0,b}`" literally true of `phi4Measure 0 b`.
5. 1.1: the Gibbs measure is the tilt `(ρ^{⊗V}).tilted (−H)`; the unstable case is cited to `tilted_of_not_integrable` instead of the `∞⁻¹ = 0` convention of the old body.

The source misprint claim in the Conventions (Aizenman–Duminil-Copin (5.9) prints `E(p) Ŝ(p) ≤ 1/(2|J|β)`) was re-read in arXiv:1912.07973v4, p. 24: the printed constant is `1/(2|J|β)`, and the Gaussian torus field below refutes it, so the README's corrected constant `1/J` stands. The φ⁴ sign convention was re-read at (1.12), p. 4: `ρ(dφ) = e^{−λφ⁴ + bφ²} dφ`, as in the README.

## Elaborated signatures

All 62 declarations (`#check @name`, including the five `ReachabilityScheme` projections and namespace definitions) were elaborated once by temporarily appending the checks to `Suggested.lean` and building with the permitted command; the file was restored byte-for-byte before the commit. Every elaborated type carries its binders explicitly: `[Fintype V] [DecidableEq V]` on all finite-volume statements, `[IsProbabilityMeasure ρ]`, `[ρ.IsNegInvariant]`, `IsAdmissible ρ`, `0 ≤ J`/`0 < J`, `[NeZero L]`, `1 ≤ d` (chessboard), `3 ≤ d` (long-range order) and `0 < m ∨ (m = 0 ∧ 3 ≤ d)` (Gaussian free field) are all present where the README states them. Nothing changed as a result; the only Lean change is the two definition bodies above. The output is kept in `scratch/signatures-elaborated.txt` of the job.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hamiltonian convention (unordered pairs) | V = {x, y}, Ising, J = (ln 3)/2 | `Z = cosh J = 2/√3`, `⟨σσ⟩ = tanh J = 1/2`; ordered sum without ½ gives `tanh 2J = 4/5`; halved gives `tanh(J/2) = 2 − √3` | witness correct | none |
| Three-site Ising (frustration) | all pairs J | `Z = (e^{3J} + 3e^{−J})/4`, `⟨σ₁σ₂⟩ = (e^{3J} − e^{−J})/(e^{3J} + 3e^{−J})` < 0 for J < 0 | correct | none |
| `IsAdmissible` | δ_a; N(0,1); density ∝ `e^{−φ² log(1+φ²)}` | `∫e^{cφ²}dδ_a = e^{ca²}`; `∫e^{φ²/2}dN(0,1) = ∞`; last admissible, fails `∫e^{|φ|^α} < ∞` for α > 2 | correct; strictly between the two conditions | none |
| `phi4Measure` (now `volume.tilted`) | λ > 0, b = 0, moments k = 1, 2; λ = 0, b < 0; λ < 0 | `∫φ² = Γ(3/4)/(Γ(1/4)√λ) ≈ 0.3380/√λ`; `∫φ⁴ = Γ(5/4)/(λΓ(1/4)) = 1/(4λ)`; λ = 0, b = −½ gives N(0,1); λ < 0 gives 0 (was `∞ • …`) | correct on λ > 0; junk value now 0 | body → `Measure.tilted` |
| Scaling of ρ_{λ,b} | s > 0 | density of sφ ∝ `exp(−λs⁻⁴ψ⁴ + bs⁻²ψ²)` | correct | none |
| `gibbsMeasure` (now tilt) | J = 0; V = ∅; unstable N(0,1), J = 1 on two sites | tilt by 0 of a probability measure is itself; V = ∅: Dirac, Z = 1; unstable: both bodies give 0 | equal to old body on all cases | body → `Measure.tilted` |
| 1.3 coupling derivative | two Ising sites; diagonal coordinate | `d/dJ tanh J = 1 − tanh²J`; at J = 0, even ρ: `(∫φ²)² = 1` for ρ_I; diagonal derivative 0 | correct | none |
| 1.4 continuity in ρ | `ρ_k = (1−e^{−k})δ₀ + ½e^{−k}(δ_k + δ_{−k})` | `Z(ρ_k) ≥ ¼e^{−2k}e^{k²} → ∞`, `Z(δ₀) = 1` | uniform bound needed, as stated | none |
| 1.5 Gaussian lattice field | two sites; d = 1 Green function | det `4b² − J²`; `⟨φ_xφ_y⟩ = J/(4b² − J²)`; `G_μ(0) = 1/(μ√(4+μ²))` | correct; `2|b|I − J⁰` with `−½φᵀ(2|b|I − J⁰)φ` checked | none |
| `leeYang` | V = ∅; one site; two sites equal field; J = −(ln 2)/2 | ∅: 1 ≠ 0; `cosh h`, zeros `iπ(k+½)`; `½(e^J cosh 2h + e^{−J})` zero needs `cosh 2h = −e^{−2J} ∈ [−1,0)` ⇒ Re h = 0; antiferro zeros `±0.658 + 1.571i` | Re h > 0 sharp, J ≥ 0 needed | none |
| Asano pair step | `|1 + az|² − |a + z|²` | `= (1 − a²)(1 − |z|²) ≥ 0` | correct | none |
| `isingBlock_laplace_ne_zero` | ρ_I; uniform on {−1,0,1}; mixed weights q = (1,−1), K = (ln 3)/2 | `cosh h`; `(1+2cosh h)/3` zeros `i(±2π/3 + 2πk)`; mixed: `(3 + cosh 2h)/4` zero at `±0.881 + 1.571i` | nonnegative weights needed, as stated | none |
| `isingBlock_laplace_hasProd` | ρ_I; uniform{−1,0,1}; δ₀ | `Σ((k+½)π)⁻² = ½ = ½∫φ²`; κ₄ = `1 − 3 = −2 = −12·(1/6)`; `(2π)⁻²·π²/sin²(π/3) = 1/3 = ½·(2/3)`; δ₀: x ≡ 0 | correct; HasProd valid since `Σ|h²x_j| < ∞` | none |
| Griffiths' trick, mixed-sign Check | N = 2, q = (½,½), K = (ln 2)/2; q = (1,−1) | weights `¼e^K` vs `½e^{−K}` equal iff `e^{2K} = 2`; `ε = 1/(1+e^{2K})`, `16ε > 48ε²` iff ε < 1/3; at K = (ln 3)/2: 4 > 3 | correct | none |
| `isingBlock_tailControl` route | steps (a)–(f) | Paley–Zygmund: `(1−½)²σ⁴/(3σ⁴) = 1/12`; `log(1+u) ≥ u log 2` on [0,1]; Young `α′ = α/(α−1) < 2` iff α > 2; `e^{cφ²} = E_g e^{√(2c)gφ}`; with `s_k < 1/(8c)` the factor is `e^{g²/4}` | correct | none |
| Tail-control Check (CLT blocks) | `q_n = N^{−1/2}` | `x_{N,j} ≤ 4/(π²N)`, `s_N(θ) = ½` for `N ≥ 4/(π²θ)` | growth condition needed | none |
| `tendsto_gibbs_of_isingBlock` | `½(δ_{−s_k} + δ_{s_k})`, s_k → s | two sites `s_k² tanh(Js_k²) → s² tanh(Js²)`; s = 0 gives 0 | correct; any-sign J allowed by uniform moments | none |
| `phi4Measure_mem_griffithsSimonClass` (Curie–Weiss) | exponent at `m = φN^{−1/4}/c` | `−N(m²/2 + m⁴/12) + g_N Nm²/2 = bφ² − φ⁴/(12c⁴) + o(1) = bφ² − λφ⁴`; `g_N > 0` iff `N > 4b²c⁴`; |m| > ½ tail `−N/192 + O(√N)` | correct | none |
| `griffiths_first` | A = 0; ρ = (2δ₋₁+δ₁)/3, J = 0; J < 0 | 1 ≥ 0; `⟨φ⟩ = −1/3`; `tanh J < 0` | evenness and J ≥ 0 needed | none |
| `griffiths_second` (every even ρ) | Ginibre lemma cases; duplicated Hamiltonian | `(x+y)^m(x−y)^n`: n odd ⇒ 0 by swap, m+n odd ⇒ 0 by flip, else ≥ 0; `φ_xφ_y + φ′_xφ′_y = ½(s_xs_y + t_xt_y)` | holds for all even admissible ρ | none |
| `fkg_gibbs` | lattice gas (δ₀+δ₁)/2, two sites | cov `= (e^J − 1)/(3 + e^J)²`, ≥ 0 iff J ≥ 0 | correct; evenness not needed | none |
| `randomCurrent_representation` | V = ∅; two sites | ∅: weight 1 = ∫1; `Σ_{n even}Jⁿ/n! = cosh J`, odd `sinh J` | correct normalisation (probability product measure) | none |
| `switching_lemma` | two sites A = B = {x,y}, F ≡ 1 | LHS `sinh²J`; RHS even pairs with n₁+n₂ ≥ 1: `cosh²J − 1` | equal | none |
| `gaussian_inequality` | n = 0, 1; (x,x,y,y); (x,x,y,z) | 1 ≤ 1; equality at n = 1; `1 ≤ 1 + 2t²`; `⟨σ_yσ_z⟩ ≤ ⟨σ_yσ_z⟩ + 2⟨σ_xσ_y⟩⟨σ_xσ_z⟩` | repetitions handled; block expansion factorises over pairs | none |
| `simon_lieb` | chain 0−1−2, Λ = {0} | `t² ≤ J t` since tanh J ≤ J; block-spin version resums to `⟨φ_oφ_u⟩_Λ J_uv ⟨φ_vφ_y⟩` | correct | none |
| `messager_miracleSole` | chain {0,1,2,3}, R(x) = 3−x; only J₀₂ = J₁₃ = K; site reflection; non-even ρ | `t ≥ t²`, `1 ≥ t³`; violating chain: `0 < tanh K`; `1 ≥ t²`; non-even: `−1/27 ≤ −1/3` false, flipped ρ⁻: `1/27 ≤ 1/3` | hypotheses needed; quadratic form coefficients `½(J_xy ± J_{x,Ry})` rechecked | none |
| `phi4_secondMoment_le` | one site, J = 0, b = 0 | identity `4λ⟨φ⁴⟩ = 1`; `M = 1/(2√λ) ≥ 0.338/√λ`; quadratic `4λM² − (2b₊+K)M − 1 ≤ 0` | correct for any-sign J (Cauchy–Schwarz) | none |
| `newman_bound` | ρ_I one site; z = iy; two sites z = (1,−1), J = 1; non-member ε = ¼ | `cosh a ≤ e^{a²/2}`; `|cos y| ≤ 1`; LHS 1.329, signed 1.269, stated RHS 5.822; non-member at a = 2: 1.691 > 1.649 | absolute values and class needed | none |
| `exists_infiniteVolume_limit` | d = 0; d = 1 Ising | one-point lattice: μ = ρ; Markov chain with `P(σ_{x+1} = σ_x) = (1 + tanh J)/2` | correct; f.d.d. convergence ⇔ weak convergence on ℝ^ℕ | none |
| `phi4_uniform_expMoment` | route | `⟨e^{a|φ|}⟩ ≤ 2e^{a²M/2}` with M of 3.7, K = row norm of J (finite range) | correct | none |
| `criticalPoint_ising_ge` | d = 0; d = 1, β = ¼; d = 1, β = 1 | d = 0: χ = 1 ≤ 1, `0⁻¹ = ⊤ ≤ β_c = ⊤`; `e^{1/2} = 1.649 ≤ 2`; β = 1: e² = 7.389 outside hypothesis | correct | none |
| `twoPoint_reflection_monotone` | d = 0, 1, 2; J = 0; x = 0 | d = 0 vacuous; d = 1: `S(x) = S(|x|)`; d = 2: `t ≥ 2t² ≥ t²`; J = 0 antitone; x = 0: `S(y) ≤ S(0)` | (c) follows from (a),(b) since `‖x‖₁ ≤ d‖x‖∞` | none |
| Positive definiteness Check | c = δ₀ − δ₁ + δ₂ | `3 − 4t + 2t² = 2(1−t)² + 1 > 0`; counterexample function gives `−1/5` | correct | none |
| `torusCoupling` | L = 1, d = 1; L ≥ 2 | pair {0,1} gets 2J; Hamiltonian `−JΣ_xΣ_jφ_xφ_{x+e_j}` in both cases | correct | none |
| `torusSymbol`, `structureFactor` | k = (L,…,L); L = 1, d = 1 Ising | `E = 4d`; `Ŝ(0) = 1 + tanh 2J`, `Ŝ(π) = 1 − tanh 2J`; 4-cycle `⟨σ₀σ₁⟩ = (t+t³)/(1+t⁴)` | correct | none |
| `reflectionPositive` | L = 1 edge; L = 1 vertex; J = 0, L = 2 vertex | matrix `[[e^{2J}, e^{−2J}],[e^{−2J}, e^{2J}]]` PSD iff J ≥ 0; L = 1 vertex reflection is the identity (`⟨|f|²⟩ ≥ 0`); vertex form value 1 vs `|Ef|² = 0` | half-sets and R rechecked mod 2L | none |
| `chessboard` | f ≡ 1; f ≡ −1, d ≥ 1 and d = 0 | equality; `1 ≤ 1`; d = 0: `1 ≤ −1` false | d ≥ 1 needed, present | none |
| `gaussian_domination` | L = 1, d = 1 Ising; J = 0; h constant | `Z(u)'' (0) = −4J + e^{−4J}(32J² − 4J) ≤ 0` (max of `e^{−4J}(8J−1)` is `2e^{−3/2} ≈ 0.446`); J = 0: equality; constant h: equality; `Z(0)` = periodic partition function | correct | none |
| `infrared_bound` | L = 1, d = 1 Ising; Gaussian torus field | `4J(1 − tanh 2J) ≤ 1`, max ≈ 0.557 near 2J ≈ 0.64; source constant fails at J = 0.375 (1.46 vs 0.67); Gaussian `EŜ = E/(2(|b|−dJ) + JE) ↑ 1/J` | constant 1/J sharp; source (5.9) re-read, prints `1/(2|J|β)` | none |
| `infraredConstant`, `ising_longRangeOrder` | d = 3; d ≤ 2 | `I_3 = W/2 ≈ 0.2527 = 1.516/6`; d ≤ 2 integral diverges (Bochner value 0, only used with d ≥ 3); sum rule at L = 1: `½((1+t)+(1−t)) = 1` | correct | none |
| `IsRandomField` | `T_f = |∫f|` | `T_{−f} = T_f ≠ −T_f` | excluded, as stated | none |
| `exists_unique_gaussianProcess` | I = Fin 2, `[[1,r],[r,1]]`; `[[1,2],[2,1]]`; I = ∅ | bivariate normal; `Var(X₁ − X₂) = −2` impossible; I = ∅: Dirac, unique | PSD hypothesis needed | none |
| `isGaussianProcess_iff_wick` | n = 2, f_i = f; random-sign field | `M₄ = 3M₂²`; `(∫fh)⁴ ≠ 3(∫fh)⁴` | correct; linearity of T not needed for the converse (harmless) | none |
| `rescaledField`, `blockSecondMoment` | J = 0 Ising; tent at u = 3 with R = L and R = 4L; d = 1 chain L = R = 1; ρ = δ₀; quarter-turn | `(2L+1)^d`, limit `2^{−d}∫f²`; R = L: 0, R = 4L: `(2L²+1)/(3L(2L+1)) → 1/3 = ½∫f²`; `3 + 4t + 2t²`; Σ = 0 ⇒ T ≡ 0 iff ρ = δ₀ (sum of independent coordinates a.s. 0); `T_{f∘g}(φ) = φ_{−e₂} = T_f(φ∘g⁻¹)` ≠ `T_f(φ∘g) = φ_{e₂}` | correct | none |
| `ReachabilityScheme`, `HasLimitLaw`, `Converges` | limit ν infinite? | `∫1 dν_n = 1 → ∫1 dν` forces `ν(univ) = 1` | limit is automatically a probability measure | none |
| `exists_reachableField` | (δ₀+δ₁)/2, J = 0; strict variance example; d = 1 W₁ | `Σ ≈ |Λ|²/4`, mean → `2^{−d}∫f`, deterministic limit not symmetric; `∫φ² = 2 − p`, lattice variance → `2^{−d}∫f²`, limit `2^{−d−1}∫f²` | evenness hypothesis needed; bound can be strict | none |
| `gffCovariance` | d = 1, m = 1 and m → 0; d = 4 | `C_m(1_Q,1_Q) = 2/m² − (1−e^{−2m})/m³`, `= 1 + e⁻²` at m = 1, `~ 2/m` as m → 0; `G_0 = Γ(1)/(4π²|x|²)` in d = 4 | correct | none |
| `gff_reachable` | d = 0, m > 0; scaling of covariances | d = 0: variance `L²/m²`, T → N(0, f(0)²), `C_m = f(0)g(0)/m²`, ratio `f(0)g(0)`; `L^{−(d+2)}Σ f g G_{m/L} → C_m(f,g)` with `L²E(q/L) ≥ (4/π²)|q|²`; Λ_L/L = Q | correct | none |
| 8.1 Check (Gaussian critical coupling) | `γ_{b_n}`, `βJ^{nn}` | `χ = 1/(2(|b_n| − dβ))`, finite iff `β < 1 + m²/(2dL_n²)`; at β = 1: `L_n²/m²` | correct | none |

No statement was found false, vacuous or mis-scoped; the only Lean changes are the two definition bodies, which leave every statement's meaning unchanged on its hypotheses.

## Unresolved

- ConstructiveFieldTheoryPhi4PartII, which the README names as the owner of the marginal-triviality goals (8.1, 8.2) and of the additional current-geometry and infrared material, is not a roadmap anywhere yet (not on main, not an open pull request, not on the board). The README states those goals only as that roadmap's targets, as the accepted package does; when it is written it must take its statements from the "Downstream consumers" section of this README.
- No suspicious passage (instruction-like text) was found in the package, the reports, the supplier roadmaps or the fetched source.


Pull request: #2432 (roadmap/constructive-field-theory-phi4 at 7e9970f)
