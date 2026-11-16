# PKG-ConstructiveFieldTheoryPhi4

Package of the accepted design of ConstructiveFieldTheoryPhi4: `packages/ConstructiveFieldTheoryPhi4/README.md`, `packages/ConstructiveFieldTheoryPhi4/Suggested.lean`, `packages/ConstructiveFieldTheoryPhi4/metadata.toml` (`topic = "math.MP"`), and `packages/ConstructiveFieldTheoryPhi4/sources.toml` (unchanged: no new work is cited). `design/plan.json` is unchanged; its `gaps` list stays empty because every supplier section the README consumes already states what is used (checked below).

The accepting review had no findings and no supplier gap. Its three questions for human reviewers stay open and are unchanged by this package: seven sources are `uncertified` and were not read; `frohlich-1982` is the IHES preprint; and 8.1–8.2 state the goals of ConstructiveFieldTheoryPhi4PartII, a roadmap that does not exist yet. Those two statements stay under `## Downstream consumers`, as in the design, and are not stated in `Suggested.lean`, because they are not theorems of this roadmap.

## Headline theorems

All the roadmap's headline theorems can be stated at the pins (Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5). Each is stated, with `sorry`:

| Layer | Headline | Lean name |
|---|---|---|
| 2.1 | Lee–Yang theorem (ferromagnetic pair interactions, complex fields with Re h_x > 0) | `leeYang` |
| 2.1 | Lee–Yang property of Ising-block measures | `isingBlock_laplace_ne_zero` |
| 2.1 | Product formula `E(h) = Π(1 + h² x_j)` with `Σ x_j = ½∫φ²` | `isingBlock_laplace_hasProd` |
| 2.2 | Tail control of Ising-block sequences | `isingBlock_tailControl` |
| 2.2 | Finite-volume transfer to the Griffiths–Simon class | `tendsto_gibbs_of_isingBlock` |
| 2.3 | φ⁴ measures lie in the Griffiths–Simon class | `phi4Measure_mem_griffithsSimonClass` |
| 3.1 | Griffiths I and II | `griffiths_first`, `griffiths_second` |
| 3.3 | FKG for Gibbs measures on ℝ^V | `fkg_gibbs` |
| 3.4 | Random current representation; switching lemma | `randomCurrent_representation`, `switching_lemma` |
| 3.5 | Gaussian inequality (Lebowitz at n = 2) and Simon–Lieb for the class | `gaussian_inequality`, `simon_lieb` |
| 3.6 | Messager–Miracle-Solé inequality | `messager_miracleSole` |
| 3.7 | Uniform φ⁴ second-moment bound; Newman's exponential bound | `phi4_secondMoment_le`, `newman_bound` |
| 4.2 | Free-boundary infinite-volume state; uniform exponential moments of φ⁴ systems | `exists_infiniteVolume_limit`, `phi4_uniform_expMoment` |
| 4.3 | High-temperature bound `β_c(ρ_I, J^{nn}) ≥ 1/(2d)` | `criticalPoint_ising_ge` |
| 4.4 | Axis monotonicity of the two-point function (ADC Prop. 5.1, (5.3)–(5.4)) | `twoPoint_reflection_monotone` |
| 5.2 | Reflection positivity (vertex and edge); chessboard estimate | `reflectionPositive`, `chessboard` |
| 5.3 | Gaussian domination | `gaussian_domination` |
| 5.4 | Infrared bound | `infrared_bound` |
| 5.5 | Ising long-range order in d ≥ 3 | `ising_longRangeOrder` |
| 6.3 | Gaussian process with a prescribed PSD kernel, any index type (exists, unique) | `exists_unique_gaussianProcess` |
| 6.4 | Wick's law characterises centred Gaussian random fields | `isGaussianProcess_iff_wick` |
| 7.3 | Reachable field of a convergent scheme: existence, fdd, symmetry, W_d-invariance, variance bound | `exists_reachableField` |
| 7.4 | Reachability of the Gaussian free field (m > 0; m = 0 for d ≥ 3) | `gff_reachable` |

Definitions added only to make these statable, each with a real body on native carriers: `IsAdmissible`, `phi4Measure`, `isingMeasure`, `hamiltonian`, `partitionFunction`, `gibbsMeasure`, `isingBlockMeasure`, `IsIsingBlock`, `griffithsSimonClass`, `Edge`, `sources`, `currentWeight`, `box`, `boxGibbs`, `nnCoupling`, `twoPoint`, `susceptibility`, `criticalPoint`, `torusCoupling`, `torusSymbol`, `structureFactor`, `infraredConstant`, `IsRandomField`, `latticePoint`, `blockSecondMoment`, `rescaledField`, the structure `ReachabilityScheme` with `ReachabilityScheme.fieldLaw`, `ReachabilityScheme.HasLimitLaw` and `ReachabilityScheme.Converges`, and `gffCovariance`. There is no sorry'd data and no `set_option`, and the file has one module docstring. Pairings use Tau Ceti's `TauCeti.PerfectMatching` instead of a new definition.

The following README targets are not in the Lean file, because they are lemmas or computations and not headlines: 1.2–1.5 (integrability, symmetries, coupling derivatives, continuity in ρ, Gaussian lattice fields), 3.2 (monotonicity), the Lebowitz recursion (i) and the moment corollaries of 3.5, the integration-by-parts identity of 3.7, 4.1, the sum rule of 5.4, the general admissible form of 5.5, and 6.1–6.2. They remain README targets with their API and Checks.

## What the README could not support

Nothing. Every target keeps a source locator or its own proof route. The seven `uncertified` works are cited only by locator, as `sources.toml` records. No text was missing, and no missing-reference request was written.

## Notions moved down from later roadmaps

None. Every supplier comes earlier in the merge order: StochasticCalculus (line 225 of ORDER.txt), RelativisticQuantumFieldTheory (226), StandardDistributions and ZerosOfLFunctions (on main), with this roadmap at 227.

## Duplication sweep and ownership

I used `roadmaps grep` over main (now 14b48a4) and the open heads (446–450 pull requests in the index) for: Lee–Yang, switching lemma, random current, Griffiths–Simon, Gaussian free field, Simon–Lieb, chessboard, infrared bound, Gaussian domination, reflection positivity, Ising, Gibbs measure, FKG, Ginibre, Messager, Curie–Weiss, Wick, Isserlis, positive semidefinite kernel, covariance kernel, Gaussian process, Kolmogorov extension, φ⁴, Schwinger function, Asano, Lebowitz, Newman, long-range order and susceptibility. Each hit was opened.
- Hits for Lee–Yang, the switching lemma, random currents, Griffiths–Simon, the Gaussian free field, Simon–Lieb, the chessboard estimate, Messager–Miracle-Solé, Curie–Weiss, Lebowitz, long-range order and susceptibility: none.
- Hits for the infrared bound, Gaussian domination, reflection positivity and Schwinger functions: RelativisticQuantumFieldTheory (Euclidean continuum objects; consumed through §7.1 and §7.3) and DenseGraphLimits (graph reflection positivity). Neither is a lattice statement.
- Gibbs measure hits: ClassicalErgodicTheory (Gibbs measures of shift spaces) and PDE line 107 (a deferral that is already cited).
- Gaussian process hits: StochasticCalculus §1.1 (Brownian motion plus the arbitrary-index Kolmogorov extension, consumed) and the two statistics roadmaps (Gaussian limit processes). Neither constructs a process from an arbitrary PSD kernel, so this roadmap keeps 6.3 and says why in Scope and ownership.
- Wick and Isserlis hits: StandardDistributions §5.3 (consumed); the others are unrelated (Wick rotation, combinatorics).
- FKG hit: a Stacks tag. Ginibre hits: RandomMatrices. Newman hits: Newman's Tauberian theorem.

At the pins: Mathlib has `fkg` and `holley` only on finite distributive lattices. Both are now named in the supplier contracts, with the remark that Mathlib's `fkg` needs nonnegative functions. Mathlib has no Ising, Gibbs, Lee–Yang, Wick or chessboard object. Tau Ceti has `TauCeti.PerfectMatching` (TauCeti/Combinatorics/Enumerative/PerfectMatching.lean:129) and `TauCeti.card_perfectMatching` (:619).

Duplication removals: none, because no target of the design exists elsewhere. Instead of introducing a pairings carrier, the package adopts Tau Ceti's `TauCeti.PerfectMatching` for the pairings of 3.5 and 6.4 and records it in "From Tau Ceti" and in Scope and ownership. No declaration of `Suggested.lean` reuses the fully qualified name of a declaration in another roadmap. Ownership was checked against the open pull requests through `roadmaps grep` and `roadmaps show`, which read every open head, not only the 231 named in the scratch list.

## Corrections to the design

1. **Cramér–Wold name.** The design cited `ProbabilityTheory.tendstoInDistribution_iff_tendstoInDistribution_inner`. At the pin, Mathlib/Probability/CramerWold.lean:39 declares it in the root namespace (the file only opens `MeasureTheory Filter RealInnerProductSpace`), and `#check` of the design's name fails. All three occurrences now read `tendstoInDistribution_iff_tendstoInDistribution_inner`. Every other library name in the README passes `#check @…` at the pins (a scratch file of 53 `#check` lines: no error).
2. **Coupling carrier.** A coupling is now a function on `Sym2 V`, which is equivalent to a symmetric matrix with the diagonal ignored. Conventions, 1.1 (relabelling by `J ∘ Sym2.map e`), 1.3 (the derivative in the coordinate `J({x,y})`) and 1.5 (`J⁰`) are reworded to match. The row norm excludes the diagonal: `‖J‖ = max_x Σ_{y≠x}|J_xy|`, which agrees with the statement that the diagonal plays no role. The stability bound `−H ≤ ½‖J‖Σφ²` is unchanged.
3. **3.7.** The uniform bound is stated for every K bounding the row sums, as in Lean. M is increasing in K, so the design's `M(λ,b,‖J‖)` is the case `K = ‖J‖`.
4. **4.2.** I added a sentence explaining that weak convergence of the zero-extended box measures on ℝ^{ℤ^d} in the product topology is equivalent to convergence of all finite-dimensional marginals. This is the form `exists_infiniteVolume_limit` states. The φ⁴ sufficient condition is now stated for every a, with its route through Newman's bound and 3.7.
5. **4.3.** The bound `β_c(ρ_I, J^{nn}) ≥ 1/(2d)` was a Check. It is now a target (`criticalPoint_ising_ge`) with a proof route (Simon–Lieb with Λ = {v} in the box, then Fatou), and the Checks are reworded in terms of β. The two-point function is the supremum over boxes, equal to the monotone limit of 4.1.
6. **7.1.** The rescaled field is defined on boxes V_R, the only finite sets that occur in 7.2, and for an arbitrary function f : ℝ^d → ℝ, as in the design. The Check on the direction of the W_d action used `V = {0, ±e₁, ±e₂}`, which is not a box. It now uses `V = V_1`, and the computed values are unchanged because only x with g x = e₁ contributes.
7. **7.2–7.3.** The reachability scheme, its field laws, double limits and convergence are named (`ReachabilityScheme` and its three definitions). W_d is identified with the linear isometries of ℝ^d that map ℤ^d into itself, which are the orthogonal integer matrices, that is, the signed permutation matrices.
8. **RelativisticQuantumFieldTheory §7.3.** §7.1 gives the massless radial fundamental solution only up to the harmonic-polynomial ambiguity, which it classifies. The identification of the decaying kernel's Fourier transform with `(4π²|ξ|²)⁻¹` in d ≥ 3 comes from §7.3 item 1, the massless limit with multipliers dominated by `(4π²|ξ|²)⁻¹`. The contract, the Scope, the 7.4 Needs and the Layer 7 Dependencies now cite §7.1 and §7.3, both read at the open head.
9. The Summary lists the end theorems with their Lean names and suggests a home. The supplier contracts add `holley`, `Sym2`, `ZMod`, `BoundedContinuousFunction`, `gaussianReal` and Tau Ceti's perfect matchings. The torus convention explains the representative `p = (π/L)k`, k ∈ (ℤ/2Lℤ)^d, used by `torusSymbol` and `structureFactor`. `gffCovariance` is the real part of a real integral.

## Elaboration

Command, run from the content checkout: `lake env lean packages/ConstructiveFieldTheoryPhi4/Suggested.lean` (absolute path).
Result: **29** warnings `declaration uses 'sorry'` (one per theorem) and no other message.

The binder check was mechanical. I appended a `#check @TauCetiRoadmap.ConstructiveFieldTheoryPhi4.<name>` for each of the 60 declarations to a scratch copy and elaborated it once (no error). I then compared each elaborated type with its README statement. Every hypothesis is an explicit binder of its own declaration (`[Fintype V] [DecidableEq V]` come from the section `variable` and appear in every elaborated type that mentions V), and none was lost.

Changes made while elaborating:
- `open scoped Nat` was dropped, because its `φ` (totient) notation broke every binder named φ.
- The variable `Σ` of `rescaledField` was renamed `s`, because `Σ` is reserved syntax.
- `[DecidableEq ι]` was added to `gff_reachable`, which `multivariateGaussian` needs.
- `rescaledField` was generalised from `C_c` to arbitrary `f : ℝ^d → ℝ`, so that it has the README's generality.

## Dependency check

```text
depcheck: 235 roadmaps, 2235 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, and the merge order already lists this roadmap at line 227, after its last supplier, RelativisticQuantumFieldTheory. `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that resolves nowhere (main 14b48a4, 446 open heads). I re-read the cited supplier sections at those heads:
- StochasticCalculus §1.1 (README line 880; the arbitrary-index extension at line 891).
- StandardDistributions §5.3 (line 578, mixed moments at 606).
- ZerosOfLFunctions §5.5 (line 1574; `OrderLE` at Suggested.lean:79, `hadamard_of_orderLE_one` at :116).
- RelativisticQuantumFieldTheory §7.1 and §7.3 (lines 4476, 4540).
- OperatorAlgebraDynamics D9.
- PDE, lines 104–108.

`roadmaps overlaps ConstructiveFieldTheoryPhi4` reports no roadmap of this name on main or in an open pull request. The worker's overlap listing names no changing pull request, no dropped id and no second copy. Its closest roadmaps (MathematicalStatisticsAsymptotic, RelativisticQuantumFieldTheory, MathematicalStatisticsNonparametric, PointProcesses, ClassicalErgodicTheory, RandomMatrices, StandardDistributions, StochasticCalculus) share only the objects already cited above. PointProcesses is not cited.

## Adversarial pass

Values were computed this run: by hand, or by brute-force scripts (exact enumeration over {±1}^V or {−1,0,1}^V, currents truncated at 12 per edge).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `hamiltonian` (Sym2, diagonal ignored) | two Ising sites, J at {x,y}, value 5 at {x,x} | H(1,1) = −J; Z = cosh J; ⟨σσ⟩ = tanh J; diagonal value never read | correct | coupling carrier changed to `Sym2` |
| `partitionFunction`, `gibbsMeasure` | N(0,1) on two sites, J = 1; three-site triangle | Z = ∞ ⇒ `∞⁻¹ • … = 0` measure (not a probability measure); triangle Z = (e^{3J} + 3e^{−J})/4 by 8-term count | correct | none |
| row norm, stability | one row with J_xx = 7 | `‖J‖` ignores 7; `−H ≤ ½Σ_{pairs}|J|(φ_x² + φ_y²) = ½Σ_xφ_x²Σ_{y≠x}|J_xy|` | correct | diagonal excluded from ‖J‖ |
| `leeYang` | triangle J = (0.7, 0.3, 1.1), 20000 random h with Re h ∈ (0.001, 2); antiferro pair J = −(ln 2)/2 | min \|Z\| = 0.699 > 0; antiferro \|Z\| at h = 0.658 + 1.571i: 1.3·10⁻¹⁶ | holds; the hJ hypothesis is needed | none |
| `isingBlock_laplace_hasProd` | ρ_I; uniform on {−1,0,1}; N = 0 | Σ((k+½)π)⁻⁴ = 0.1666667 (cumulant −12/6 = −2 = 1 − 3); Σ(2π)⁻²(n+1/3)⁻² = 0.33333 = ½·⅔; N = 0: η = δ₀, x ≡ 0, E ≡ 1, ½∫φ² = 0 | correct | none |
| `isingBlock_laplace_ne_zero` | mixed sign q = (1,−1), K = (ln 3)/2 (excluded by `IsIsingBlock`, q ≥ 0) | E(h) = (3 + cosh 2h)/4 vanishes at 0.881 + 1.571i | the hypothesis is needed | none |
| `isingBlock_tailControl` | blocks Σσ_i/√N → N(0,1) | limit fails the α > 2 growth condition; ∫e^{φ²/2}dη_N → ∞ by Fatou | the hypothesis is needed | none |
| `griffithsSimonClass` | `(1−ε)δ₀ + ½ε(δ₁+δ₋₁)`, ε = ¼ | ∫φ⁴ = ¼ > 3/16 = 3(∫φ²)², so outside the class by 3.5; the space of probability measures on ℝ is metrizable, so sequences suffice | correct | metrizability sentence added |
| `griffiths_second` | uniform{−1,0,1}, triangle J = (0.7, 0.4, 0.2), all 729 pairs of multi-indices in {0,1,2}³ | min(⟨φ_Aφ_B⟩ − ⟨φ_A⟩⟨φ_B⟩) = −4·10⁻¹⁷ (zero up to rounding) | holds | none |
| `randomCurrent_representation` | triangle J = (0.4, 0.7, 0.2), A = {0,1} | integral 0.6910216874, current sum 0.6910216874 | equal | none |
| `switching_lemma` | same triangle, A = {0,1}, B = {1,2}, F ≡ 1 | lhs 0.6497965888, rhs 0.6497965888 | equal | none |
| `switching_lemma`, odd A | two sites, A = B = {x} | both sides 0 (no current has a single source) | correct | none |
| `gaussian_inequality` | uniform{−1,0,1} (a class member by Griffiths' trick) on a 4-chain, all 256 tuples in V⁴; n = 0 | min(rhs − lhs) = 0.0117 ≥ 0; n = 0: 1 = 1 (one empty matching) | holds | pairings via `TauCeti.PerfectMatching` |
| `simon_lieb` | uniform{−1,0,1}, 4 sites, J = (0.8, 0.5, 1.1) on the chain plus 0.3 on {0,2}, Λ = {0,1}, y = 3 | lhs 0.17084 ≤ rhs 0.18323 | holds | none |
| `messager_miracleSole` | uniform{−1,0,1}, chain 0–3, R(x) = 3−x, P = {0,1}, all 81 pairs (A,B) ∈ {0,1,2}² × {0,1,2}² | min(⟨φ_Aφ_B⟩ − ⟨φ_Aφ_{B∘R}⟩) = −1·10⁻¹⁶ (equality cases) | holds | none |
| `phi4_secondMoment_le` | one site λ = 1, b = 1; λ = 1, b = 0 | ⟨φ²⟩ = 0.5209 ≤ M = (2 + √20)/8 = 0.8090; b = 0: ⟨φ²⟩ = 0.3380 = Γ(3/4)/Γ(1/4) ≤ ½, ⟨φ⁴⟩ = 0.2500 = 1/(4λ) | holds | stated for every K ≥ ‖J‖ |
| `newman_bound` | uniform{−1,0,1}, triangle, 300 random complex z | min(rhs − lhs) = 0.647 > 0 | holds | none |
| `boxGibbs`, `twoPoint` | d = 1 Ising, x outside V_R | ω x = 0 under the zero extension, so the term is 0 and the supremum equals the monotone limit `tanh^{|x|}J` | correct | none |
| `criticalPoint_ising_ge` | d = 1, β = ¼; d = 0 | χ = e^{1/2} = 1.6487 ≤ 2; d = 0: (2·0)⁻¹ = ∞ and χ = 1 < ∞ for every β, so β_c = ∞ | holds | promoted from a Check |
| `twoPoint_reflection_monotone` | d = 2 Ising, small t | S(1,0) ≈ t ≥ S(1,1) ≈ 2t² ≥ S(2,0) ≈ t²; ‖(1,1)‖₁ = 2, ‖(1,1)‖∞ = 1 | consistent | axis notation |
| `exists_infiniteVolume_limit` | J = 0, ρ = ρ_I | box measures converge to `infinitePi ρ_I`; marginals converge ⇔ product-topology convergence (marginals tight) | correct | equivalence sentence added |
| `torusCoupling` | L = 1 (ZMod 2), L = 2 | L = 1: y = x+e_j and x = y+e_j both hold, coupling 2J, ⟨σ₀σ₁⟩ = tanh 2J; L = 2: one count, 4-ring ⟨σ₀σ₁⟩ = 0.638806 = (t+t³)/(1+t⁴) at J = 0.6 | correct | none |
| `infrared_bound` | L = 1, d = 1 Ising; 4-ring, J = 0.6, k = 1, 2, 3 | max 4J(1 − tanh 2J) = 0.5569 ≤ 1; E·Ŝ = 0.9349, 1.0197, 0.9349 ≤ 1.6667 | holds | none |
| `reflectionPositive` (ε = 1) | 4-ring Ising J = 0.5, a = 0 (R: 0↔1, 2↔3), half {1,2}, 500 random complex f | min Re = 0.048 ≥ 0, Im = 0 | holds | coordinates written out |
| `reflectionPositive` (ε = 0, L = 1) | ZMod 2 | R is the identity in coordinate j and the half is everything: ⟨\|f\|²⟩ ≥ 0 | trivially true | none |
| `chessboard` | 4-ring, 500 random real f_v | min(rhs − lhs) = 1.3·10⁻⁹ ≥ 0 | holds | none |
| `gaussian_domination` | 4-ring Ising, d = 1, J = 0.5, 2000 random h | min(Z(0) − Z(h)) = 0.0046 ≥ 0 | holds | none |
| `infraredConstant` | d = 3 | I₃ = W/2 = 0.2527 (Watson W = 0.5055); 1/E(0) = 0 in Lean on a null set | correct | none |
| `ising_longRangeOrder` | d = 3, J ≤ I₃ | bound ≤ 0, vacuous; sum rule at L = 1: ½((1+t) + (1−t)) = 1 | consistent | none |
| `exists_unique_gaussianProcess` | K = [[1,2],[2,1]], c = (1,−1) | Σcc K = −2 < 0, so `hpsd` excludes it | the hypothesis is needed | none |
| `isGaussianProcess_iff_wick` | random-sign field εs; mean-shifted Gaussian field | M₄ = s⁴ ≠ 3s⁴, Wick fails and the field is not Gaussian; the shifted field has M₁ ≠ 0 and is excluded by `hcent` | correct | none |
| `rescaledField`, `blockSecondMoment` | ρ = δ₀; d = 1, L = R = 1 Ising | Σ = 0 ⇒ (√0)⁻¹ = 0 ⇒ T ≡ 0; Σ = 3 + 4t + 2t² | correct | f : ℝ^d → ℝ, boxes only |
| W_d direction (7.1 Check) | d = 2, V_1, quarter turn g, f = 1_{e₁} | T_{f∘g}(φ) = φ_{−e₂} = T_f(φ∘g⁻¹) ≠ φ_{e₂} | correct | V changed to V_1 |
| `exists_reachableField`, W_d clause | g ∈ O(d) mapping ℤ^d into ℤ^d | columns are integer unit vectors, so g is a signed permutation and the box and `nnCoupling` are invariant | correct | new statement |
| `exists_reachableField`, fdd clause | ν with HasLimitLaw | ∫1 dν = lim 1 = 1 forces ν finite of mass 1, so ν is determined by integrals of bounded continuous g | well posed | new statement |
| `exists_reachableField`, symmetry | 𝒞 = {(δ₀ + δ₁)/2}, J = 0 | mean 2^{−d}∫f ≠ 0, so the evenness hypothesis is needed | correct | none |
| `gffCovariance` | d = 1, m = 1 | C₁(1_Q,1_Q) = 2 − (1 − e⁻²) = 1.135335 = 1 + e⁻²; the imaginary part vanishes by ξ ↦ −ξ | correct | real part documented |
| `gff_reachable` | scaling with p = q/L | L^{−(d+2)}·L^{2d}·L²·L^{−d} = 1; L²E(q/L) ≥ (4/π²)\|q\|² from sin t ≥ 2t/π; d = 1, m = 0: C diverges like 2/m, so excluded by `hm` | correct | RQFT §7.3 cited for m = 0 |

## Sources

No new work is cited, and `sources.toml` is unchanged. Every locator added or rephrased was read in the cache:
- Peled–Spinka Propositions 2.14–2.16: `peled-spinka-2017` lines 1328, 1385, 1490–1493. The torus is `{−L+1,…,L}^d`, side 2L.
- Aizenman–Duminil-Copin Proposition 5.1 with (5.3)–(5.4): `aizenman-duminilcopin-2021` lines 1040–1051.

No passage was copied, and no fetched text contained an instruction addressed to the worker.
