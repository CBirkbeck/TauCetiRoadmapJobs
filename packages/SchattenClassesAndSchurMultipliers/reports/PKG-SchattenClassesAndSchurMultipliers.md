# PKG-SchattenClassesAndSchurMultipliers

Package of the accepted design `SchattenClassesAndSchurMultipliers`. Deliverables:
`packages/SchattenClassesAndSchurMultipliers/README.md` (2,300 lines; all 45 targets, 11 layers,
every Check and worked example of the design kept), `Suggested.lean` (287 lines),
`metadata.toml` (`topic = "math.FA"`, as for the OperatorTheory family on main), `sources.toml`
(unchanged: no work cited that it lacks) and `design/plan.json` (top-level `gaps` unchanged: the
two declared gaps still hold, and no new one is needed).

## Headline theorems

Listed from the Summary's end theorems (the deep results the roadmap is built to reach), before
writing the Lean file.

| Headline (README) | Status | Lean name |
|---|---|---|
| `M ↦ S_M` is isometric on `S₂`, with `‖S_M‖_{cb,2} = ‖M‖_∞` (§3.2, §3.5) | stated | `schurNorm_two_eq` |
| `M ↦ S_M` is a unital `*`-homomorphism into `B(S₂)` (§3.2) | not statable at the pins | lacks the map `A ↦ S_M(A)`, i.e. the kernel `k_A` of a Hilbert–Schmidt operator on an arbitrary σ-finite space (no kernel theorem in Mathlib or Tau Ceti; Layer 2 builds it from the gap `sigma-finite-hilbert-schmidt-kernels`). Recorded in the module docstring |
| Invariance of `‖S_M‖_p`, `‖S_M‖_{cb,p}` under `p ↦ p'` and transposition (§4.1) | stated | `schurNorm_eq_of_holderConjugate` |
| Log-convexity in `1/p` (§4.2) | stated | `schurNorm_interpolation` |
| Monotonicity in `abs(1/p − 1/2)` (§4.2) | stated | `schurNorm_mono_of_abs_inv_sub_le` |
| Schur product theorem with `‖S_M‖_p = ‖S_M‖_{cb,p} = max_j M(j, j)` (§6.1) | stated | `schurNorm_of_posSemidef` |
| Grothendieck–Haagerup on σ-finite spaces (§6.4) | stated | `schurNorm_eq_haagerupNorm` |
| Lafforgue–de la Salle, atomless spaces (§7.3) | stated | `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` |
| Continuous symbols on Radon measure spaces (§8.2) | stated | `schurNorm_le_iff_of_continuous`, `schurCbNorm_le_iff_of_continuous` |
| Fourier–Schur transference on `ℝⁿ` (§9.5) | stated | `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` |
| Hörmander–Mikhlin–Schur theorem (§11.5) | stated | `schurNorm_le_hmsNorm` |

Definitions kept only to make these statable, each with a real body on native carriers:
`schattenGauge` (extended Schatten gauge, Tau Ceti's Schatten gauge for finite `p`, the compact
operators at `p = ∞`), `IsKernelOperator` (predicate: `T` is the integral operator of `k`),
`schurNorm`, `schurCbNorm`, `haagerupNorm` (factorisation through `ℓ²(ℕ)`), `lpSchattenNorm` and
`fourierMultiplierCbNorm` (Tau Ceti's `fourierMultiplierCLM` on Frobenius matrices with Tau Ceti's
Schatten seminorm), `hmsNorm`. No sorry'd data, no `set_option`, no `example`.

Considered and not taken as headlines: the complete-positivity equivalence of §6.1, which follows in
a few lines from Mathlib's `Matrix.PosSemidef.hadamard` and `Matrix.PosSemidef.kronecker`; the
finite Grothendieck–Haagerup theorem §6.3, which is the counting-measure case of §6.4 (its
attainment clause stays in the README); the matrix BMO interpolation §10.4 (cgpt-2023 Theorem 1.1),
a route step to §11.5. All three stay README targets.

The Schur multiplier norm is stated through kernels: `schurNorm μ p M` is the supremum of
`‖B‖_p` over pairs of integral operators `A`, `B` with kernels `k ∈ L²(μ ⊗ μ)` and `M · k` and
`‖A‖_p ≤ 1`. By the kernel theorem (§2.1) this is `sup {‖S_M A‖_p : A ∈ S₂, ‖A‖_p ≤ 1}`, the
README's definition. The README says so in Conventions, §2.1 and §3.3.

## What the README could not support

Nothing of the design was dropped. The README cannot carry the `*`-homomorphism half of §3.2 into
Lean (above). The two declared supplier gaps (`sigma-finite-hilbert-schmidt-kernels` on
AutomorphicSpectralTheory §0.8, `semifinite-martingale-bmo-interpolation` on
NoncommutativeIntegration, Part II) still hold: AutomorphicSpectralTheory §0.8 is still stated on
σ-finite standard Borel spaces with separable `L²`, and NoncommutativeIntegration §8.4 on main is
still finite-tracial. Both are now in the required form `What <Supplier> must provide
(gap:<slug>): …` in their supplier subsections.

## Notions moved down from later roadmaps

None. Every supplier is earlier in the merge order, on main, or an allowed open new-roadmap pull
request (BochnerSpaces, another author's).

## Duplication sweep and removals

No removal: no definition or theorem of the design exists elsewhere. Checked by object at the pins,
on main, in the 477 open roadmap pull requests through `roadmaps grep`/`roadmaps show`, and in the
board's packages.
- Pinned libraries (all searched in the files): no Schur multiplier on Schatten classes beyond
  `Matrix.hadamard` and Tau Ceti's `Matrix.PosSemidef.hadamard_pow` (a Schur power lemma, not a
  norm), no completely bounded map, no integral/kernel operator theorem, no compact Schatten
  endpoint (Tau Ceti's `p = ∞` family is all of `B(H)`). Tau Ceti's BMO
  (`TauCeti/MeasureTheory/Integral/CalderonZygmund/BoundedMeanOscillation.lean`) is the
  Banach-valued `⨍_Q ‖f − f_Q‖` of Calderón–Zygmund theory, a different seminorm from the column
  seminorm of §10.1. This is now stated in the Tau Ceti contract.
- Roadmaps: "Schur multiplier" elsewhere is group-cohomological (InverseGalois…, CFSG…,
  InductionRestrictionPartII). The Haagerup tensor product belongs to CStarAlgebras and is not
  restated here. Operator-valued BMO occurs only in NoncommutativeIntegration §8.4, the gap's
  supplier. Hilbert–Schmidt kernels occur only in AutomorphicSpectralTheory §0.8 (cited). New
  citation: OperatorTheory/UnboundedOperators §5.1 (UO-E01) treats measurable-kernel integral
  operators on `L²(ℝ)` (domains, conjugate-transpose adjoints, composition), a narrower and
  different statement. It is now named in Scope and ownership with the one-clause difference;
  nothing of it is consumed. Scalar Mihlin–Hörmander is planned in PDE §2.3 (main) and already in
  Tau Ceti, which is what this roadmap consumes. AmenableTracesOnCStarAlgebras (open) and
  VonNeumannAlgebras (open revision) were read: no Schur or Schatten multiplier content.
- Ownership against open pull requests was checked with the tools on the heads of the 477 open
  roadmap pull requests (index of 2026-11-15). No `Suggested.lean` declaration carries the fully
  qualified name of a declaration in another roadmap.

## Corrections made (and why)

1. BochnerSpaces §7.5 contract: the design said §7.5 assumes atomlessness "in the sense of §7.1".
   At the pull request's head, §7.1 is about vector measures and defines no atom. Now: atomless is
   read as "no set is a Tau Ceti `MeasureTheory.Measure.IsAtom`", the only reading under which
   §7.5 holds (the countable–cocountable counterexample is kept).
2. BanachSpaceTheory B4.0 contract: B4.0 states, for a reflexive real Banach space (complex through
   the underlying real space), a finite measure and a vector measure of finite variation with
   `|m| ≪ μ`, a density with `m = μ.withDensityᵥ h` and `|m|(s) = ∫_s ‖h‖`. It does not state
   `‖h‖ ≤ C` directly. The contract now says so and derives `‖h‖ ≤ C` a.e. from the variation
   formula under `|m| ≤ Cμ`.
3. §6.2: the definition now fixes the Hilbert space to `ℓ²(ℕ)` with a.e. strongly measurable
   `ξ, η` (the Lean `haagerupNorm`). Arbitrary separable `K` and strongly measurable maps are an API
   fact (same infimum), with the null-set argument. Generality is unchanged.
4. §9.2: the carrier `F_k` is now named: `Matrix (Fin k) (Fin k) ℂ` with Tau Ceti's
   `Matrix.frobeniusInnerProductSpace`, and the `S_p^k` norm goes through `Matrix.toEuclideanLin`
   (review remark applied).
5. §1.1 and the Tau Ceti contract: `TauCeti.OperatorIdealFamily.schatten` takes a real exponent and
   a proof of `1 ≤ p` (review remark applied); the extended gauge uses `p.toReal`.
6. §1.3 had no worked example. Added `T(A) = Tr(A) E₁₁` on `M_n`: the bound `n^{1−1/p_θ}` is
   attained, while exchanged exponents would give a bound below the norm.
7. §8.2: the finite sets are enumerated by injective `s : Fin N → X`. A sentence explains why the
   points are distinct: with repetitions the norm lies between the norm and the completely bounded
   norm of the distinct-point matrix. No claim is made that it can exceed the norm, since
   Conjecture 1.8 leaves that open.
8. §11.1: the essential supremum is over Lebesgue measure on the whole product; the diagonal is
   null, so it is the README's `x ≠ y` supremum.
9. Summary: the Fourier–Schur and HMS bullets now carry `n ≥ 1` and `|||M||| < ∞`, as their targets
   do. A paragraph on what `Suggested.lean` states was added.
10. Wrapped the three over-long lines the review named. "(proposed)" was dropped from the
    Downstream consumers.
11. Conventions: a bullet on the Lean encoding (exponents with `Fact (1 ≤ p)`, symbols with
    `MemLp M ∞`, the kernel-based Schur norm). Lean names were added at every target that
    `Suggested.lean` states. Supplier contracts gained `Matrix.toEuclideanLin`,
    `ENNReal.HolderConjugate`, `MeasureTheory.Measure.count`, `essSup` and
    `Matrix.frobeniusInnerProductSpace`.

## Adversarial pass

Every statement written or changed, with the values computed.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `schattenGauge` | identity of `ℓ²(ℕ)` at `p = ∞`; `diag(1/(j+1))` at `p = 2, ∞`; rank-one projection at `p = 1`; zero space | `∞` (not compact; Tau Ceti's `p = ∞` family gives `1`); `π/√6 ≈ 1.2825`, `1`; `1`; `0` at every `p` | sound | none |
| `IsKernelOperator` | `{1,2}`, `k = 1_{(1,2)}`; `k = 0`; identity of `L²[0,1]` with `k = 1_{x=y}`; `μ = 0` | `(Tg)(1) = g(2)`, `(Tg)(2) = 0`, so `T = E₁₂` (row convention); only `T = 0`; the integral is `0`, so the identity is not the kernel operator of the null diagonal; vacuous, `T = 0` | sound | none |
| `schurNorm` (§3.3 encoding) | `{1,2}`, `M = [[1,2],[3,4]]`, `p = 2`; triangular truncation at `p = ∞`; `M = 1`, `μ ≠ 0` and `μ = 0` | `4` at `E₂₂` (= `max abs M`); `2/√3` at `A = [[√2,1],[−1,√2]]/√3` (eigenvalues of `B*B`: trace `5/3`, det `4/9`, so `4/3`, `1/3`); `1`; `0` | sound | none |
| `schurCbNorm` | `M = 1`; amplified-symbol alternative `M δ_{ij}` at `m = 2`; `M = [[1,2],[2,1]]`, `p = ∞` | levels `m ≥ 1` give `1`, `m = 0` gives `0`, sup `1`; block `(1,2)` sent to `0`, not the amplified identity; `(3/2)·1 + (1/2)·1 = 2` at every level, `2E₁₂` from `E₁₂` | sound | none |
| `haagerupNorm` | `[[1,2],[2,1]]`; constant `1` on `ℕ`; `1_{i=j}` on `ℕ`; `μ = 0`; `0·∞` case | `ξ_j = (√(3/2), v_j/√2)`, `η_k = (√(3/2), −v_k/√2)`, `⟨ξ_j,η_k⟩ = 3/2 − v_j v_k/2 ∈ {1, 2}`, `‖ξ_j‖² = 2`, product `2`; `e₀`: `1`; `e_i`: `1`; `0`; `‖ξ‖_∞ = 0` forces `M = 0` a.e., so the ENNReal product `0` is the true value | sound | none |
| §6.2 null-set clause | `ξ` changed on `μ(N) = 0` | changes `⟨ξ(x),η(y)⟩` on `N × Ω`, with `(μ⊗μ)(N × Ω) = 0 · μ(Ω) = 0` (σ-finite) | sound | new text |
| `lpSchattenNorm` | `k = 1`; `f = g·E₁₁`; `f = g·I₂` at `p = 1` | `‖f‖_p`; `‖g‖_p`; `2‖g‖₁` (Frobenius would give `√2‖g‖₁`) | sound | none |
| `fourierMultiplierCbNorm` | `m = 1`, `m = 0`, `m = e_a` | `1`; `0`; `T_m f = f(· + a)`, isometric on every `Lᵖ(S_p^k)`, so `1` | sound | none |
| `hmsNorm` | `n = 1`, `sign(x − y)`; `n = 1`, `φ(x − y)` with `φ = ξ/√(1+ξ²)`; ranges for `n = 1..4` | `k ∈ {0,1}`: `2 + 0 = 2`; `max ξ(1+ξ²)^{−3/2}` at `ξ² = 1/2`: `0.3849`, so `2 + 0.7698`; `Finset.range (n/2+2)` gives `σ = 1, 2, 2, 3` | sound | none |
| `schurNorm_two_eq` | `[[1,2],[3,4]]`; triangular truncation; `μ = 0` | `4 = 4`; `1 = 1`; `0 = 0` | sound | none |
| `schurNorm_eq_of_holderConjugate` | triangular truncation `p = 1, q = ∞`; its transpose `[[1,0],[1,1]]`; `1_{(1,2)}` | `2/√3 = 2/√3`; `2/√3`; `1` at every `p`; `1⁻¹ + ∞⁻¹ = 1` | sound | none |
| `schurNorm_interpolation` | triangular truncation, `p₀ = 2`, `p₁ = ∞`, `θ = 1/2`; zero endpoint; infinite endpoint (triangular truncation on `ℓ²(ℕ)`); `p₀ = p₁` | `1/p = 1/4`, bound `(2/√3)^{1/2} = 1.0746 ≤ 1.1547`; `M = 0`, `0 ≤ 0`; `1^{1/2}·∞^{1/2} = ∞`; `x^{1−θ}x^θ = x` in `[0,∞]` | sound | none |
| `schurNorm_mono_of_abs_inv_sub_le` | `p = 4`, `q = ∞`; `p = 4`, `q = 4/3`; `p = 2` | `1/4 ≤ 1/2`; `1/4 = 1/4`, both directions, equal by duality; `0 ≤ abs(1/q − 1/2)`, so `‖M‖_∞ ≤ ‖S_M‖_q` | sound | none |
| `schurNorm_of_posSemidef` | `[[2,1],[1,1]]`; `J₂`; `I₂`; empty `ι`; non-example `[[1,2],[2,1]]` | `2` at `E₁₁`; `1`; `1` (pinching contraction); `0 = sup ∅`; eigenvalue `−1`, norm `2 ≠ 1`, so PSD needed | sound | none |
| `schurNorm_eq_haagerupNorm` | `[[1,2],[2,1]]`; `f(x)g(y)` on `[0,1]`; `cos(x − y)` on `ℝ` | all five `2`; all `‖f‖_∞‖g‖_∞`; `ξ = η = (e^{ix}, e^{−ix})/√2`, all `1` | sound | none |
| `schurNorm_eq_schurCbNorm_of_forall_not_isAtom` | Lebesgue `[0,1]`, `1_{x<y}`, `p = 2`; counting `{1,2}`; countable–cocountable; `gaussianReal m 0`; `μ = 0` | `1 = 1`; atoms `{1}`, `{2}`, excluded; whole space an atom, excluded; `{m}` an atom, excluded; `0 = 0`, no set of positive measure | sound | none |
| `schurNorm_le_iff_of_continuous` (and cb) | `μ = δ₀ + δ₁`, values `[[1,2],[2,1]]`; `μ = 0`; `e^{i(x−y)}` Lebesgue; `M = x`; discrete `X`, `μ = δ_{x₀}`, `1_{x=y}` | both sides iff `C ≥ 2`; both true (only `N = 0`); both iff `C ≥ 1`; both false for finite `C` (`max abs s_i` unbounded); both iff `C ≥ 1` | sound | none |
| §8.2 distinct-points sentence | `s = (x, x, y)` | matrix `[[a,a,b],[a,a,b],[c,c,d]]`: restriction to `{1,3}` gives `≥` norm; compression of `M ⊗ J₂` gives `≤` level-2 norm | sound | new text, no claim beyond Conjecture 1.8 |
| `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` | `m = e_a`, `0`, `1` | `1 = 1`, `0 = 0`, `1 = 1`; `R T_m R f = f(· − a)` | sound | none |
| `schurNorm_le_hmsNorm` | `M = 1`; `sign(x − y)`, `n = 1`; `sin x₁` | `1 ≤ C·4·2` forces `C ≥ 1/8`; HMS norm `2`, bounded with norm `O(p²/(p−1))`; HMS norm `∞`, hypothesis fails | sound | none |
| §1.3 example | `T(A) = Tr(A) E₁₁` on `M_n`, `p₀ = 1`, `p₁ = ∞` | `C₀ = 1`, `C₁ = n`; `p_θ = 4`: bound `n^{3/4}`, norm `n^{1−1/4} = n^{3/4}` (Hölder at `1`), exchanged `n^{1/4}` | sound | new |
| B4.0 bound | variation of `m` at most `Cμ` | on `s = {‖h‖ > C + ε}`, `(C+ε)μ(s) ≤ ∫_s‖h‖ ≤ Cμ(s)`, so `μ(s) = 0` | sound | contract reworded |
| §7.5 reading | countable–cocountable on an uncountable set | values `{0, 1}`, no set of measure `1/2` | sound | attribution fixed |
| Frobenius carrier | `⟨E₁₁, E₁₁⟩`, `⟨a, b⟩` | `1`; `Σ conj a_{ij} b_{ij} = Tr(a* b)` (Tau Ceti `frobenius_inner_eq_trace_conjTranspose_mul`) | sound | none |
| Lean-encoding convention (class dependence) | `M = M'` a.e. | `M·k = M'·k` a.e.; the integrals agree for a.e. `x` (null set has null sections); `hmsNorm` is not a class function, now said | sound | wording fixed |

Context and generality: the `#check @name` audit (below) shows `[SigmaFinite μ]`, `Fact (1 ≤ p)`,
`MemLp M ∞ (μ.prod μ)`, the Radon instances of §8.2, `1 ≤ n` in §9.5 and §11.5, and the
`ContDiffOn` order `⌊n/2⌋ + 1` in every statement that needs them. They match the README's standing
hypotheses: σ-finite (Layers 3–7), Radon (Layer 8), `n ≥ 1` (Layers 9–11), counting measure on a
finite type (§6.1).

## Elaboration

`lake env lean packages/SchattenClassesAndSchurMultipliers/Suggested.lean` (from the content
checkout): exit 0, exactly 11 warnings `declaration uses 'sorry'` (one per theorem), no other
message. The Tau Ceti modules it imports were built first with targeted `lake build`
(`…OperatorIdeal.Family.Schatten`, `…UnitarilyInvariantSeminorm.Schatten`,
`…Fourier.L2Multiplier`, `…Matrix.Frobenius`, `…MeasureTheory.Measure.Atom`). The first run had one
error: `Matrix.PosSemidef` needs `PartialOrder ℂ`. The fix was to open the scope `ComplexOrder`.

`#check` audit: every declaration of `Suggested.lean` was put in one scratch file under
`#check @name` and elaborated once. Each elaborated type was compared with its README statement.
No binder was dropped (the definitions carry only what they use; every theorem keeps its
`SigmaFinite`, `Fact` and hypothesis binders), and nothing changed after the audit. A second
scratch file `#check`ed 84 Mathlib and Tau Ceti names the README cites at the pins, and all
resolve. The rest (`Matrix.toEuclideanLin`, `MeasureTheory.Lp`, `MeasureTheory.Measure.prod`)
are used in `Suggested.lean` and elaborate there; `kernel_apply`, `kernel_unique` and
`kernel_norm` are AutomorphicSpectralTheory §0.8's names.

## Dependency check

```
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists the roadmap right after
NoncommutativeIntegration; AutomorphicSpectralTheory is earlier. BochnerSpaces is another author's
open pull request adding a new roadmap folder. `roadmaps resolve` on the package README: no
cross-roadmap citation and no Lean name found nowhere.

## Sources

No new work cited; `sources.toml` unchanged (16 entries, 7 certified, 9 uncertified and settled).
No `needs-references.toml` request. Locators quoted in the Lean docstrings were re-read in the
cache: lafforgue-delasalle-2011 lines 239, 244, 246, 267–268, 274, 505, 524; cgpt-2023 lines
71–72, 149, 1042; caspers-delasalle-2015 lines 485, 626; pisier-grothendieck-2012 lines 767, 781.

## Untrusted text

Nothing read in issues, pull requests, roadmaps or sources gave an instruction. No suspicious
passage.
