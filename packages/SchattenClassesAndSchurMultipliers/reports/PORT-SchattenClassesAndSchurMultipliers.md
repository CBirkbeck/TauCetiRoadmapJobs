# PORT-SchattenClassesAndSchurMultipliers

## Result

- Branch: `roadmap/schatten-classes-and-schur-multipliers`, head commit
  `7cdcea4e1c613b839db78b2ce5f3d83bf34afcfa` ("SchattenClassesAndSchurMultipliers: roadmap
  (README, Suggested.lean, metadata)"), one commit on `51d880d`, adding only
  `TauCetiRoadmap/SchattenClassesAndSchurMultipliers/{README.md,Suggested.lean,metadata.toml}`.
- Build (`lake build TauCetiRoadmap.SchattenClassesAndSchurMultipliers.Suggested`):
  `Build completed successfully (18354 jobs).` with 11 warnings, every one
  "declaration uses `sorry`" (the 11 theorems); no error, no other message.
- Gate: `gate SchattenClassesAndSchurMultipliers: set_option=0 blob=0 latex=0 tex=0 prnum=0
  sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (after the edits): `depcheck: 235 roadmaps, 2232 edges, 0 problem(s)` — no
  UPWARD, CYCLE or `moved:` line.
- Citation resolver on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This roadmap builds Schur multipliers on the Schatten classes of `L²(Ω, μ)` for an arbitrary
σ-finite measure space: the compact endpoint of the Schatten scale and completely bounded maps on
Schatten classes defined by matrix amplification, the kernel description of Hilbert–Schmidt
operators between arbitrary σ-finite `L²` spaces with its kernel calculus and the `L^∞`
conditional expectation of symbols, and the multiplier `S_M(A) = T_{M·k_A}` of an essentially
bounded symbol with its `S_p` and completely bounded norms. Its end theorems are the isometry of
`M ↦ S_M` on `S₂`, the invariance of the norms under `p ↦ p'` and transposition with their
log-convexity and monotonicity in the exponent, the Schur product theorem with the norm formula
`max_j M(j, j)`, the Grothendieck–Haagerup characterisation of the `S₁` and `S_∞` norms by
factorisations through Hilbert space, the Lafforgue–de la Salle theorem that norm and completely
bounded norm agree on atomless spaces, the finite-restriction criterion for continuous symbols on
Radon measure spaces, Fourier–Schur transference on `ℝⁿ` for every `L^∞` symbol, and the
Hörmander–Mikhlin–Schur theorem of Conde-Alonso, González-Pérez, Parcet and Tablate through matrix
BMO and its interpolation with `S₂`. It is the operator-theoretic layer between the Schatten
classes of OperatorTheory/OperatorIdeals and the noncommutative `Lᵖ` theory of
NoncommutativeIntegration on one side, and double operator integrals, approximation properties by
Schur multipliers and transference beyond `ℝⁿ` on the other.

## Dependencies that are still pull requests

- **AutomorphicSpectralTheory** (new roadmap, earlier in the merge order): §0.8 (the `L²` kernel
  operator with `kernel_apply`, `kernel_unique`, `kernel_norm`), §0.9 (the basis formula for the
  trace of VonNeumannAlgebras V4.Core), §0.10 (cited for comparison). Read at its head.
- **BochnerSpaces** (new roadmap folder of another author; not in the merge order file): §4.2
  (`exists_fubiniEquiv`), §7.4 (the `L¹` projection and the `L^∞` conditional expectation as its
  adjoint under a σ-finite trim), §7.5 (divisibility of atomless finite measures). Read at its
  head; the dependency check reports no problem for the edge.

No id this roadmap cites is defined only by an open revision. The open revisions touching
suppliers (the VonNeumannAlgebras revision; the BanachSpaceTheory/OperatorTheory revision) drop
no id cited here (overlap tool: none; V2, V2.RectangularL2, V4.Core, V13b, B4.0, OI-A/B/C ids and
UO-E01 present on main).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already has the required form: one module docstring
("target signatures", the roadmap is README.md, the one headline not statable named with its
missing carrier), 8 definitions with real bodies on native carriers (`schattenGauge`,
`IsKernelOperator`, `schurNorm`, `schurCbNorm`, `haagerupNorm`, `lpSchattenNorm`,
`fourierMultiplierCbNorm`, `hmsNorm`), 11 headline theorems, no padding, no sorry'd data, no
`set_option`, `import Mathlib` plus five `TauCeti.*` modules, each used and each present at the
Tau Ceti pin `2fd255d`. The file is ported byte-identical. Every headline of the Summary that is
statable at the pins is stated; the one not stated (multiplicativity and `*`-compatibility of
`M ↦ S_M`, which needs the map `A ↦ S_M(A)` and so the kernel of a Hilbert–Schmidt operator on an
arbitrary σ-finite space) is named in the docstring.

**Mechanical signature check.** A scratch block with `#check @name` for all 19 declarations and
for the 91 backticked library names of the README (with the six further Tau Ceti modules the README
cites imported) was appended temporarily to the module and elaborated once with the build command;
all 110 resolved, no error; the block was then removed (the file is byte-identical to the
package's). Each elaborated type was compared with its README statement: every Schur theorem keeps
`[SigmaFinite μ]` and `MemLp M ∞ (μ.prod μ)`; the two continuous-symbol theorems keep
`LocallyCompactSpace`, `T2Space`, `BorelSpace`, `SigmaFinite`, `IsFiniteMeasureOnCompacts`,
`InnerRegularCompactLTTop`, `Continuous M`, injectivity of `s` and `s i ∈ μ.support`;
`schurNorm_of_posSemidef` keeps `Fintype`, `MeasurableSingletonClass`, `M.PosSemidef`;
`schurNorm_le_hmsNorm` keeps `1 ≤ n`, `ContDiffOn`, `hmsNorm n M < ∞`, `1 < p`, `p ≠ ∞` with `C`
chosen before `M` and `p`. Nothing changed.

## Supplier replacements and duplication removals

- No restatement of a supplier declaration was found, so nothing was deleted and no supplier
  replaced. Sweep by object over main and all 444 open roadmap heads (`roadmaps grep`, plus the
  sibling checkouts of QuantumFoundations, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups,
  CompactQuantumMetricSpaces, NoncompactQuantumSymmetry, RelativisticQuantumFieldTheory):
  Schur/Hadamard multipliers on operators, triangular truncation, Grothendieck–Haagerup
  factorisation, transference, matrix and operator-valued BMO, Hörmander–Mikhlin–Schur — no other
  owner (every "Schur multiplier" hit is the group-homology `H₂(G, ℤ)`, a different object;
  CStarAlgebras C5.3 owns the Haagerup tensor product of operator spaces, not the factorisation
  constant of a symbol). Hilbert–Schmidt kernels: AutomorphicSpectralTheory §0.8 (cited);
  RandomMatrices treats trace-class integral operators of continuous positive kernels (Mercer
  type), a different statement; UnboundedOperators §5.1 already demarcated. Schatten classes:
  OperatorIdeals (cited), NoncommutativeIntegration §1.5 (cited), NoncommutativeGeometry uses them
  for summability only. Atomless splitting: BochnerSpaces §7.5 and Tau Ceti (cited). The
  `L^∞` expectation: BochnerSpaces §7.4 (cited).
- **Added to Scope and ownership:** a bullet for **PDE** (on main), which owns the scalar
  harmonic analysis of `ℝⁿ` — Riesz–Thorin (its §2.2), the Mihlin–Hörmander theorem (its §2.3),
  `BMO(ℝⁿ)` with John–Nirenberg (its §2.4), the dyadic partition and Littlewood–Paley estimates
  (its §7.1) — with one clause each on how §10.1 (operator norm of averages of operator squares)
  and §11.2 (pieces of a `C^{σ_n}` symbol uniformly in a parameter) differ. Nothing is consumed
  from PDE, so no supplier edge.
- Ownership: this roadmap is the owner of the compact Schatten endpoint as a gauge, completely
  bounded maps on `S_p` by amplification, the Hilbert–Schmidt kernel surjectivity and calculus,
  Schur multipliers and their norms, operator-valued and matrix BMO and the HMS theorem; no
  roadmap on main, in the board's packages index or at an open head plans any of these. No
  declaration of `Suggested.lean` has the qualified name of a declaration of another roadmap.

## Fixes made as an upstream reviewer (README)

1. **Scope and ownership** lacked the boundary with PDE, which on main owns the scalar
   Mihlin–Hörmander theorem, scalar BMO and the Littlewood–Paley estimates that Layers 10–11 sit
   next to; added (above).
2. **Supplier contract, martingale BMO gap**: the locators of musat-2003 and jrwz-2020 carried the
   board word "uncertified" (process residue) and jrwz-2020 had no locator. Now: "musat-2003
   Theorem 3.1, as cited in mei-2007 lines 3229–3230" and "jrwz-2020, as cited in cgpt-2023 lines
   483–484", with "noncommutative" added before "Burkholder–Gundy constant".
3. **"Mathlib has no … Fourier multiplier with an `L^∞` symbol"** was unqualified, while Mathlib
   has `SchwartzMap.fourierMultiplierCLM` and `TemperedDistribution.fourierMultiplierCLM`; the
   sentence now names them and their temperate-growth hypothesis
   (`Mathlib/Analysis/Distribution/FourierMultiplier.lean`, docstring line 12; namespaces at
   lines 35 and 129).
4. **§6.2** claimed attainment with `dim K ≤ 2|ι|` without a reason; sharpened to `dim K ≤ |ι|`
   with the projection, balancing and compactness argument.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `schattenGauge` (§1.1) | identity of `ℓ²(ℕ)`; `ℂ^d`; `ℂ⁰`; rank-one projection; `diag(1/(j+1))` | `∞` at every `p` (not compact at `p = ∞`); `d^{1/p}`, `1`; `0`; `1` (zero-indexed `a₀ = 1`); `‖·‖₂² = π²/6`, `‖·‖₁ = ∞`, compact | holds; `B(H)` endpoint would give `1` on `ℓ²(ℕ)` | none |
| §1.1 `‖VXW‖_p ≤ ‖V‖‖X‖_p‖W‖` at `p = ∞` | `V = 0`, `X` non-compact | LHS `‖0‖_∞ = 0`, RHS `0·∞·‖W‖ = 0` in `[0, ∞]` | holds | none |
| §1.1 compression bound | identity of `ℓ²(ℕ)`, `P_α` | `‖P_α‖_∞ = 1` vs `‖1‖_∞ = ∞`; `‖P_α‖_p = α^{1/p} → ∞` | fails at `p = ∞` as stated, holds `p < ∞` | none |
| §1.2 norming | `X = E₁₂`, `p = 2`; `diag((j+1)^{−2})`, `p = 1` | `|X|u* = E₂₁`, `Tr(XE₂₁) = 1 = ‖X‖₂`, `u*|X| = 0`; `Tr(XP_d) = Σ_{j<d}(j+1)^{−2} → π²/6` | holds | none |
| §1.3 interpolation | `T(A) = Tr(A)E₁₁` on `M_n` | `C₀ = 1`, `C₁ = n`, bound `n^{1−1/p_θ}` = norm `‖1‖_{p'}`; exchanged exponents `n^{1/4}` < `n^{3/4}` at `p_θ = 4` | holds | none |
| §1.4 cb norms | transpose on `M_n`; `T` fixing `w₀`; `T∘R` | `Σ E_{ij}⊗E_{ij}` = `n`·projection, `‖t‖_{cb,∞} = n`; `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1`, `p_θ = 4/3`; `‖T∘R‖₁ = ∞` vs `0·∞ = 0` | holds with stated exclusions | none |
| `IsKernelOperator` (§2.1) | `1_{(1,2)}` on `{1,2}`; `min(x,y)` on `[0,1]`; diagonal of `[0,1]²` | `E₁₂δ₂ = δ₁`; `Σ((j+½)π)^{−4} = 1/6 = ∫∫min²`; null set, operator `0` | holds | none |
| §2.2 trace formula | `A = iE₁₂`, `C = E₂₁`; two spaces `{1}`, `{2}` | `⟨k_{A*}, k_C⟩ = conj(−i) = i = Tr(AC)`; without conjugation `−i`; `1 = k_A(1,2)k_C(2,1)` | holds | none |
| §2.3 transposition | `iE₁₂`; `[[1,1],[0,0]]`; `D_i` | `(iE₁₂)^T = iE₂₁`, adjoint `−iE₂₁`; singular values `√2, 0` both; `D_i^T = i`, `D_i* = −i`; kernel `conj(conj k(y,x)) = k(y,x)` | holds | none |
| §2.4 sub-σ-algebra, `C_φ`, change of measure | trivial `𝒜` on `{1,2}`; 3-cycle; `δ₀ ≪ δ₀+δ₁` | `P(ι(a)) = (a/2)·4/2 = a`, kernel `c = 1/4`; `C_φE₁₂C_φ* = E₃₁` (`E₂₃` with `φ⁻¹`); `UU* = E₀₀ ≠ 1` | holds | none |
| §2.5 `L^∞` expectation | masses `(1,3)`; density `(3,1)`; adjoint of `g ↦ g(1)·1`; `{1,2,3,4}` | `(a+3b)/4`; `(a+b)/2`, `1/2` vs `1/4`; `ψ = (φ(1)+3φ(2))1_{1}`, `1 ↦ (4,0)`; `(½,½,0,0)`, mean `1/4`; other σ-algebra `1/4` vs `(½,0,½,0)` | holds; inclusion `𝒜' ⊆ 𝒜` needed | none |
| `schurNorm` (§3.1, §3.3) | `[[1,2],[3,4]]`; `1_{x<y}` with kernel `1`; `M = 1` on `{1,2}`; `M_k = 1_{(k,k)}` on `ℕ` | `4` at `E₂₂`; `‖S_M A‖₂² = 1/2`; `‖S_M‖₁ = 1` vs `sup{‖A‖₁ : ‖A‖₂ ≤ 1} = √2`; `1` each, limit `0` | holds; lsc strict | none |
| §3.4 triangular truncation | unitary `[[√2,1],[−1,√2]]/√3`; random search over `U(2)` | `B*B` eigenvalues `4/3, 1/3`, norm `2/√3`; numerical sup `1.15470054` = `2/√3` | holds | none |
| `schurCbNorm`, `schurNorm_two_eq` (§3.5) | `M = 1`; `[[1,2],[2,1]]`; `μ = 0` | `1` (`0` for `μ = 0`), pinching variant kills block `(1,2)`; `(3/2)J − (1/2)vvᵀ`, bound `2`, `S_M(E₁₂) = 2E₁₂`; `0 = 0` | holds; `‖M_m‖_∞ = ‖M‖_∞` for `m ≥ 1` | none |
| §3.6 stabilisation | one-point `Ω`, `M = 1`; `ν = 0` | all norms `1`; all `0` (zero space) | holds; `ν ≠ 0` needed | none |
| §3.7 invariances | masses `(1,3)`; `δ₀ ≪ δ₀+δ₁` | matrix `[[k₁₁, √3k₁₂],[√3k₂₁, 3k₂₂]]`; `|M(0,0)| = 1 ≤ 2` | holds | none |
| `schurNorm_eq_of_holderConjugate` (§4.1) | `M = 1_{(1,2)}`; triangular truncation | `Tr(S_M(A)B) = A₁₂B₂₁ = Tr(AS_{M^t}(B))`, `Tr(AS_M(B)) = A₂₁B₁₂`; `‖·‖₁ = ‖·‖_∞ = 2/√3` | holds | none |
| `schurNorm_interpolation` (§4.2) | zero endpoint; `∞` endpoint; `p = 4` from `(2, ∞)` | zero endpoint ⇒ rank-one kernels `M u(x)conj v(y) = 0` ⇒ `M = 0` a.e., LHS `0`; `θ = 1/2`, `(2/√3)^{1/2} = 1.0746` | holds in `[0, ∞]` with no finiteness hypothesis | none |
| `schurNorm_mono_of_abs_inv_sub_le` (§4.2) | `p = 2, q = 4`; `p = 4, q = 4/3`; `p = ∞` (`p⁻¹.toReal = 0`) | `0 ≤ 1/4`; `1/4 = 1/4` both ways (equality by duality); `|0 − ½| = ½` maximal | holds | none |
| §4.3 weak-* extension | `M = 1`; `1_{x=y}` on `ℕ` | identity; diagonal projection, both send `1` to `1`, not `0` | holds | none |
| §5.1 contractivity | trivial `𝒜` on `{1,2}`; `ℕ`, `φ = 1` | `3/2 ≤ 2`, `3/4 ≤ 2/√3`, `1/4 ≤ 1`; `1 = 1` (with `condExp`: `1 = 0`) | holds | none |
| §5.2 martingale limits | dyadic `1_{x<y}`; empty family | `f₀ = 1/2`, `f₁ = [[½,1],[0,½]]` norm `≥ 1`; `1` vs `⨆∅ = 0` | holds; nonempty needed | none |
| §5.3 ambient σ-algebra | `{1,2,3,4}`, blocks `[[1,2],[2,1]]` | `2 × 2` matrix vs Kronecker with `J₂`; both cb norms `2` | holds | none |
| `schurNorm_of_posSemidef` (§6.1) | `[[2,1],[1,1]]`; `[[1,2],[2,1]]`; `J`, `I`; empty `ι` | `2` at `E₁₁`; diagonal `1` but norm `2` (eigenvalue `−1`); `1`, `1`; `⨆∅ = 0` on the zero space | holds; PSD needed | none |
| `haagerupNorm` (§6.2) | `[[1,2],[2,1]]` via `ℂ²` and via `ℂ`; constant `1` on `ℕ`; `ξ = 0`, `η` unbounded | `⟨ξ_j,η_k⟩ = 3/2 − v_jv_k/2`, `‖ξ_j‖² = 2`; rank `1` vs `det = −3` gives `∞`; `1` (`L²` variant `∞`); `0·∞ = 0` with `M = 0` a.e. | holds; `dim ≤ |ι|` | wording sharpened |
| §6.3 finite Grothendieck–Haagerup | `α = (1,i)/√2`, `β = (1,1)/√2`, `a = I`, `M = diag(1,i)` | `Σψ_{ij}M_{ij} = 0 = ⟨ᾱ, S_M(a)β⟩`; `⟨α, S_M(a)β⟩ = 1` | holds | none |
| `schurNorm_eq_haagerupNorm` (§6.4) | `cos(x−y)` on `ℝ`; ultraproduct with `K_n = ℂ` | `⟨ξ(x),η(y)⟩ = (e^{i(y−x)}+e^{−i(y−x)})/2`, norms `1`; `⟨[1],[i]⟩ = i`, `‖[1+1/n]‖ = 1` | holds | none |
| §7.1 atoms (Tau Ceti `IsAtom`: `μ B = 0 ∨ μ B = μ A`) | σ-finite set of measure `∞`; `[0,2]`, `t = 1/2`; countable–cocountable | some `A ∩ S_n` has finite positive measure, so not an atom; ratio `1/4`, `[0,1/2]`; null singletons yet whole space an atom | holds | none |
| §7.2 equal-measure refinement | masses `(1,1,3,3)`; `(1,2,3,3)` | four permutations measure preserving; weights `(1,2,2,4)/9` vs `1/4` each | hypothesis needed and sufficient | none |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` (§7.3) | `μ = 0`; two countable–cocountable copies | both `0`; `L² ≅ ℂ²`, excluded since `{·}`-copies are atoms | holds | none |
| §8.1 finitely supported approximation | discrete `X`, `|X| > 2^ℵ₀`, `δ_{x₀}` | diagonal not in `P(X)⊗P(X)`; class of `1_{x=y}` is the constant `1` | holds; measurability step needed | none |
| `schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous` (§8.2) | `δ₀+δ₁` on `ℝ`; `e^{i(x−y)}`; `M = x`; `1_{x=y}` on `[0,1]` | `2`; `1`; RHS only with `C = ∞`; continuity fails, multiplier `0` vs restrictions `1` | holds; `MemLp` conjunct, injectivity, finite `C`, continuity needed | none |
| §9.1 Toeplitz symbols | `m = e_a`; `cos(2π⟨a,·⟩)`; `1_{0}` | conjugation by `D_{e_a}`; `(cu)⊗(cu)* + (su)⊗(su)*`, norm `≥ ‖cu‖² → 1`; `0` | holds | none |
| `lpSchattenNorm`, `fourierMultiplierCbNorm` (§9.2) | `1_{[0,2]}E₁₁`; `1_{[0,1]}[[1,1],[0,0]]`; `1_{[0,1]}I_k`; `cos` at `p = 1` | `2^{1/p}`; `√2` (entrywise `2^{1/p}`, max `1`); `k^{1/p}` (normalised trace `1`); `‖T_mf‖₁ = ‖f‖₁` for `f ≥ 0` | holds | none |
| §9.3 Følner compressions | `g = 1_{[−½,½]}`, `n = 1` | `ǧ(u) = sin(πu)/(πu)`, `Tr Λ_F(g) = |F|ǧ(0) = |F| = |F|‖g‖₁`; `‖Λ_F(h)‖₂² = ∫‖ȟ(u)‖²|F∩(F+u)|du ≤ |F|‖h‖₂²` | holds | none |
| §9.4 Gaussians | `p = 1`, `p = ∞`, `n = 1`; `1 < p < ∞` | `(1+R²/T²)^{−n/2}`; `R(R²+T²)^{−1/2}` = `0.995` at `T = R/10`, `0.0995` at `T = 10R`; `f_R^{p−1} ∝ γ_{R/√(p−1)}`, `∫f_Rg_R = 1` | holds | none |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` (§9.5) | `n = 0`, `m = 2i`; `m = e_a` (`T_mf = f(·+a)` with Mathlib's `𝓕`); `m = sign` at `p = 2` | both `2`; both `1`; both `1 = ‖m‖_∞` | holds for every `L^∞` symbol | none |
| §10.1 column/row BMO | `f = Σ1_{I_k}E_{k1}`, `N = 4`; `z e` with wrapping arcs | column `(1−Σa_k²)E₁₁` → `0.866`; row `diag(a)−aaᵀ` → `0.707` at `a = (½,½,0,0)`; arc `[3/4,5/4)`: `7/48`; `[1−h,1+h)`: `1/4 − h/2 + h²/3 → 1/4`, seminorm `1/2` | holds | none |
| §10.2 matrix BMO | `n = 0`; `u = 1_{[0,1]}`, `z = 1/2` | `‖A‖_BMO = 0` for `A = 1`, definiteness fails; kernel `(e^{πi(x−y)}−1)1_{[0,1]²} ≠ 0` | holds for `n ≥ 1` | none |
| §10.3 periodisation | `n = 2`, `k = 0`, `x = (.05,.05)`, `y = (.95,.95)`; `n = 0` | `|x−y| = 1.273 ≥ 1`, `m₀(x) = m₀(y)`; `‖A‖_p = 1 > 0 = liminf` | thresholds `4^k ≥ √n`, `4^k ≥ 4√n` needed | none |
| §10.4 BMO–`S₂` interpolation, operator form | `Ψ(z) = C_∞^{z−1}C₂^{−z}T(U|A|^{pz/2})`; `T = id`; `n = 0`, `p = 4` | `Ψ(2/p) = C_∞^{2/p−1}C₂^{−2/p}TA`, `λ_j = (p/2)ln s_j + ln C_∞ − ln C₂` real; `C_np ≥ 1`; `e^{−R/2} ≤ 4Ce^{−R}` fails for large `R` | holds for `n ≥ 1` | none |
| `hmsNorm` (§11.1) | `φ(ξ) = ξ/√(1+ξ²)`; `M = 1`; `sin x₁`; `M = x`; range of the sum | `2 + 2·(1/√2)(3/2)^{−3/2} = 2 + 0.770`; `2`; `∞`; `∞`, `u⊗v*` with `‖·‖₂ = 1` maps outside `L²`; `range (n/2+2) = {0,…,σ_n}` | holds | none |
| §11.2 Littlewood–Paley | `N = 1` | `∫|s|^{2σ}|k_j|² = 2^{j(n−2σ)}∫|u|^{2σ}|ψ̌|²` | exponents exact | none |
| §11.3 twisted multipliers | Toeplitz; `M = f(x)` | `M_c(x,ξ) = m(ξ)`; `T̃^c = D_f` on the left | holds | none |
| §11.4 BMO endpoint | `sin y₁` | `|||M|||_r = 1`, `|||M|||_c = ∞` | holds | none |
| `schurNorm_le_hmsNorm` (§11.5) | `M = 1`; `p ↦ p'`; route constants | `1 ≤ C·4·2`, `C ≥ 1/8`; `p²/(p−1) = pp'`; `C_np(C_n|||M|||)^{1−2/p}(|||M|||/2)^{2/p} ≤ C'_np|||M|||` | holds; `M` bounded and a.e. strongly measurable from `ContDiffOn` off the null diagonal | none |
| Layer 11 examples | `φ((x−y)/⟨x⟩)`; `n = 1` with `⟨x⟩+⟨y⟩`; `n = 2`, `sin t₁` | `|x−y|^k‖D_y^kM‖ = |t|^k‖D^kφ(t)‖`; `|x−y||∂_xt| ≤ 1 + 1`, bound `2sup|φ| + 4sup|φ′|`; numerically `5.703, 54.60, 540.9` at `R = 10, 100, 1000` | holds | none |
| Conventions witnesses | `E₁₂` kernel; `[[1,2],[3,4]]` symbol; `M̃` vs `M̄`; `(iE₁₂)^T`; `Tr(E₁₂E₂₁)`; transpose cb norm; `e_a` Fourier; countable–cocountable | `E₁₂` not `E₂₁`; `[[a,2b],[3c,4d]]`; `S_{M̃}(E₁₂) = 0`, `M̄ = M`; `iE₂₁` vs `−iE₂₁`; `1` vs `Tr(E₁₂*E₂₁) = 0`; `1`, `2`, `1`; `f(·+a)`; atom with null singletons | each convention pinned | none |
| Library claims (Supplier contracts) | Mathlib `NullSingletonClass` file; `fourierMultiplierCLM`; Schatten/trace class at the pin; Tau Ceti modules | `NoAtoms` deprecated alias (line 35), TODO says atomless is stronger; temperate-growth symbols only; no Schatten or trace-class declaration in Mathlib; all 12 cited Tau Ceti files exist at `2fd255d` | holds | Fourier-multiplier sentence made precise |

## Unresolved

- The acceptance is conditional on the two declared supplier gaps, unchanged by the port:
  `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8 is stated at its head for
  σ-finite standard Borel spaces with separable `L²`; Layers 2, 5 and 7 need arbitrary σ-finite
  spaces) and `semifinite-martingale-bmo-interpolation` (requested of NoncommutativeIntegration,
  Part II; NoncommutativeIntegration §8.4 on main is finite-tracial). The README states both
  contracts in the "What X must provide (gap:…)" form used by roadmaps on main.
- BochnerSpaces is consumed from an open new-roadmap pull request of another author that is not
  in the merge-order file; the dependency check reports no problem for it, and the worker should
  name it in the merge-order paragraph.
- No suspicious instruction was found in any text read (package, reports, other roadmaps, library
  sources).


Pull request: #2421 (roadmap/schatten-classes-and-schur-multipliers at 7cdcea4)
