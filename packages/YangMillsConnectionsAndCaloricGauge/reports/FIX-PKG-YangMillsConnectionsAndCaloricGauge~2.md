# Repair of the package review of YangMillsConnectionsAndCaloricGauge (round 2)

Files edited:

- `packages/YangMillsConnectionsAndCaloricGauge/README.md`;
- `packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean` (module docstring only);
- `packages/YangMillsConnectionsAndCaloricGauge/design/plan.json` (one new entry in the top-level `gaps` list).

`sources.toml` and `metadata.toml` are unchanged. No new work is cited. The new locators
(OhTataru-YMHF line 850–856, 1355–1356, 2419–2423 and 2434) are covered by the existing `OhTataru-YMHF`
entry (§3.2, §4, §5 Lemma 5.30), whose `cited_for` already lists 8.1, 8.4 and 10.3.

There is one review (REV-PKG-YangMillsConnectionsAndCaloricGauge) with seven findings. I checked every
finding against the cited sources, the roadmaps on main and the pinned libraries: all seven are correct
and all seven are applied. No section, layer or target was renumbered, and no Lean name was added or
removed.

## F01 (P1) — applied

Change: §10.3 `‖∂^ℓA_ℓ‖_{ℓ¹L² ∩ W^{1,4/3}}` → `‖∂^ℓA_ℓ‖_{ℓ¹L²} + ‖∇(∂^ℓA_ℓ)‖_{L^{4/3}}` (homogeneous
`Ẇ^{1,4/3}`). Added: Lemma 5.30 as the input, a route, a note on the source's missing dot, a dilation
Check (`‖h_λ‖_{4/3} = λ^{−1}‖h‖_{4/3}`), and an SU(2) Check with nonzero divergence (symbol `−6k/5`).

Evidence: OhTataru-YMHF line 2423 has `Ẇ^{1,4/3}`. Line 3288 prints `W^{1,4/3}`, and its proof (line 3290)
only invokes Lemma 5.30. The symbol `(|ξ|² − |η|²)/(|ξ|² + |η|²)[i, j]` at `ξ = e₁`, `η = 2e₁` is
`−3/5 · 2k = −6k/5`.

## F02 (P2) — applied

Change: §1.4's general theory (closedness, `f(F^k) = dT_f(A)`, the Cartan form) → imported from
CharacteristicClasses C4 item 1 and C5a.3. Kept: the Euclidean and right Maurer–Cartan comparison
(`ω_f = T_f(−θ_R)`), bi-invariance for disconnected `G`, the SU(2) normalisation, and a new Check
recomputing C5a.3's normalisation. Scope, contracts and Dependencies updated.

Evidence: CharacteristicClasses (main) lines 1323–1329 and 1530–1564. The image of C5a.3's
`F_t = tΩ + ((t² − t)/2)[θ, θ]` is `t dA + ½t²[A ∧ A]`. For `k = 2` this gives `tr(A dA + ⅔A³)`, and at
`θ = −θ_R` it gives `⅓tr(θ_R³)`. So `∫_{S³}Φ*ω_f = −8π²` is unchanged.

## F03 (P2) — applied

Change: §1.2's normal-tube inversion route → RiemannianGeometry R6, applied to the compact embedding
`G ⊂ M_N(ℂ)`, supplies `ε`, `𝒰` and the smooth nearest-point `π_G` with `π_G(g + v) = g`. The
derivative target `dπ_G(g)` and the Checks are kept. Added an R6 contract and a Scope bullet; removed
the Tau Ceti tubular contract entries.

Evidence: RiemannianGeometry (main) README lines 3487–3494.

## F04 (P2) — applied

Change: §2.1's construction of `W^{k,p}(X; V)` and its coordinate equivalence → the new supplier gap
`gap:vector-valued-wkp` on PDE Layer 1. It covers every finite-dimensional `V`, every `k ≥ 0` and
`1 ≤ p ≤ ∞`, independent of the basis and commuting with weak derivatives, plus the local class. It is
recorded in the README contracts, the plan `gaps` list, the Scope and the Needs lines. Not narrowed.

Evidence: PDE Layer 1 on main is scalar. PseudoholomorphicCurveAnalysis PH1 (main) covers only
planar domains. IncompressibleFlows may not be cited. The request that IncompressibleFlows consume the
contract is outside this package (For the maintainer).

## F05 (P2) — applied

Change: §8.1's "prove `Ḣ¹` is Banach with dense `C_c^∞`" → consume `TauCeti.D1p0` (`p = 2`, `p* = 4`:
the embedding, its bound, the weak gradient, injectivity, density) and prove only the converse image
characterisation (cut-off plus mollification). Added: a Tau Ceti contract, a Conventions note for
`Ẇ^{1,d/2}`, a Check, and refined `Suggested.lean` docstring paragraphs (Layers 5, 8, 9).

Evidence: `TauCeti/Analysis/Sobolev/D1p0/Basic.lean` lines 117, 128, 134, 149, 155, 246, 275, 321 and
362; elaborated by `#check` (Checks).

## F06 (P3) — applied

Change: §8.3 first Check: "estimate holds with constant `1`" → the energy identity, the bounds
`‖B‖_{L^∞L²} ≤ ‖b‖` and `‖∇B‖_{L²L²} ≤ 2^{−1/2}‖b‖`, and the constant `1 + 1/√2`. That constant is
attained on `[0, ∞)` by every nonzero `b` (supremum `1`, `∫‖∇e^{sΔ}b‖² = ½` for `‖b‖ = 1`).

Evidence: `1 + 0.7071 = 1.7071 > 1`.

## F07 (P2) — applied

Change: §8.1 now defines the realised `Ẇ^{σ,p}(ℝ⁴; V)`, `σ < 4/p`: realisation `𝒮'_h`, norm
`‖|D|^σu‖_{L^p}` with the multipliers `(2π|ξ|)^σψ(2^{−k}ξ)`, and the subspace `Ẇ^{σ,∞}_c`. Added six API
targets and three Checks (step, `C_c^∞` datum, `(4π)^σ`), linked from §8.4 and the Conventions. Pattern:
§5.2's undefined `Ẇ^{n+1,p}` became plain words.

Evidence: OhTataru-YMHF line 849–856 defines only integer orders; line 1356 uses `C([0,∞); Ẇ^{σ,p})`.
The step datum retested:

- it lies in the full space with norm `1`;
- `‖e^{sΔ}b − b‖ = 1` for all `s > 0`;
- fixed blocks converge;
- `g + c` is excluded by `𝒮'_h`.

## Checks

**Elaboration of `Suggested.lean`.** Command: `lake env lean packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean`,
run from the content checkout.

- Result: exit status 0, no output.
- The file has a single `import Mathlib`, no `set_option` and no declarations. Only the module
  docstring changed.

**Library names.**

- `Suggested.lean` declares nothing, so the `#check @name` audit of its declarations has zero cases.
- I built `TauCeti.Analysis.Sobolev.D1p0.Basic` with `lake build` (the object file was missing; the build
  completed successfully).
- I then elaborated a scratch file of `#check` lines for every library declaration this round added
  to the README: `TauCeti.D1p0`, `TauCeti.D1p0.ofTestFunctionₗ`, `TauCeti.D1p0.norm_ofTestFunctionₗ`,
  `TauCeti.D1p0.denseRange_ofTestFunctionₗ`, `TauCeti.D1p0.sobolevEmbeddingL`,
  `TauCeti.D1p0.norm_sobolevEmbeddingL_le`, `TauCeti.D1p0.hasWeakFDerivOn_sobolevEmbeddingL`,
  `TauCeti.D1p0.sobolevEmbeddingL_injective`, `TemperedDistribution.fourierMultiplierCLM` and
  `MeasureTheory.Lp.toTemperedDistribution`.
- Result: all ten elaborate.
- Their hypotheses match the contract as written: `IsFiniteMeasureOnCompacts` for the space, an
  additive Haar measure and `p* ≠ ∞` for the embedding results, and a complex normed target for the
  multiplier, hence the complexification of `V`.

**Dependency direction.** The command given in the brief printed:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new suppliers, RiemannianGeometry (R6) and the
CharacteristicClasses C5a.3 citation, are on main.

**Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name of
TauCetiRoadmap missing. It did not check Lean names outside TauCetiRoadmap; I checked those by the
`#check` file above and by reading the pinned files.

**Ownership against open pull requests.** I checked the new owned object, the realised `Ẇ^{σ,p}` on
`ℝ⁴`, with `roadmaps grep` over main and the open heads (homogeneous Bessel / Triebel / `S'_h` /
`|D|^σ` patterns):

- no roadmap defines a realised homogeneous fractional Sobolev space on `ℝ^d`;
- PDE §7.2 owns only Besov spaces;
- Mathlib has only the inhomogeneous `TemperedDistribution.MemSobolev`.

So this roadmap is its owner (Scope updated).

The overlap report for this roadmap lists no conflicting heads and no dropped ids. This round
renumbers nothing, so it drops no id.

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 1.2 `dπ_G(g)` = orthogonal projection onto `g𝔤` (with R6's `π_G`) | `U(1)` at `1`; `U(N)` at `1`; `G = {±1}` | `π(1+i) = (1+i)/√2`, `dπ(1)(a+ib) = ib`; `dπ(1)H = (H − H*)/2` (complement = Hermitian); finite `G`: `𝔤 = 0`, normal space everything, `dπ = 0` | holds; existing Checks unchanged |
| 1.4 DGA map `θ ↦ A`, `Ω ↦ F[A]` | `d_Wθ`, `d_WΩ` | `Ω − ½[θ,θ] ↦ F − ½[A∧A] = dA`; `−[θ,Ω] ↦ −[A∧F] = dF` (Bianchi) | holds |
| 1.4 `f(F^k) = dT_f(A)` via `CS_P` | `k = 1`, `f` linear invariant; `k = 2`, SU(2); `𝔤 = 0` | `k = 1`: `T = f(A)`, `dT = f(F) − ½f([A,A]) = f(F)` since `f([𝔤,𝔤]) = 0`; `k = 2`: `CS ↦ tr(AdA + ⅔A³)` (∫t = ½, ∫(t²−t)/2 = −1/12); `𝔤 = 0`: both sides `0` | holds |
| 1.4 `ω_f = T_f(−θ_R)` closed, bi-invariant, `T_f(−O;x) = O*ω_f` | `dθ_R`; SU(2); disconnected `T² ⋊ ℤ/2` with `k = 1`, `f(e₁) = 1`, `f(e₂) = 2` | `dθ_R = θ_R∧θ_R`, so `F[−θ_R] = −θ_R∧θ_R + θ_R∧θ_R = 0`; SU(2): `⅓tr(θ_R³)`, `∫_{S³}Φ*ω_f = −8π²`; non-`Ad(G)`-invariant `f`: `L_h*ω_f = f(−Ad(h)θ_R) ≠ ω_f` for the swap `h` | holds; `Ad(G)`-invariance is load-bearing for disconnected `G` (stated) |
| 1.4 Check: `1/k!` model | `k = 2` | halves to `∫Φ*ω_f = −4π²` ≠ `−8π²` | discriminates |
| gap `vector-valued-wkp` | `V = ℝ²`; `V = 0`; `k = 0`; `p = ∞`; change of basis `M` | `(u,v) ↦ (∂^αu, ∂^αv)`; zero product; `W^{0,p} = L^p`; product of complete spaces is complete; `∂^α(Mu) = M∂^αu` for constant `M` | consistent; contract complete |
| 8.1 image of `TauCeti.D1p0.sobolevEmbeddingL` = `{u ∈ L⁴ : ∇u ∈ L²}` | exponents; cut-off error; constant `1` | `1/4 + 1/4 = 1/2`; `‖∇χ_R‖₄⁴ = R^{−4}·R⁴‖∇χ‖₄⁴` (independent of `R`); `1 ∉ L⁴` though `∇1 = 0` | holds |
| Conventions: same for `Ẇ^{1,d/2}` | `d = 3, 4` | `1/d + 1/d = 2/d`; `‖∇χ_R‖_d^d = R^{−d}R^d‖∇χ‖_d^d` | holds |
| 8.1 `Ẇ^{σ,p}`: uniqueness of `g` | constant `c`; polynomial `x₁` | `P_{≤k}c = c`, `P_{≤k}x₁ = x₁` (symbol `1` near `0`), so neither is in `𝒮'_h` unless `0` | holds |
| 8.1 Banach for `σ < 4/p` | `p = ∞, σ = −1`; `p = 2, σ = 2` (excluded) | `‖|D|^{−σ}P_kg‖_∞ ≲ 2^{k(4/p − σ)}`: exponent `1`, summable as `k → −∞`; exponent `0` at `σ = 4/p = 2`, not summable | restriction `σ < 4/p` is necessary |
| 8.1 `L^p ∩ 𝒮'_h = L^p` for `p < ∞` | `p = 1, 2` | `‖P_{≤k}g‖_∞ ≤ 2^{4(k+1)/p}‖K‖_{p'}‖g‖_p → 0` | holds; fails at `p = ∞` (constants) |
| 8.1 step Check | `g = sign(x₁)`, `σ = −1`, `p = ∞` | `P_{≤k}g = Φ(2^{k+1}x₁) → 0` boundedly; norm `1`; `g + c`: sup `1 + |c|`; `‖erf(x₁/(2√s)) − sign x₁‖_∞ = 1` for all `s > 0`; dilation `λ^{σ−4/p} = λ^{−1}` | `b ∈ Ẇ^{−1,∞} ∖ Ẇ^{−1,∞}_c` |
| 8.1 `C_c^∞ ⊆ Ẇ^{σ,∞}_c`, `−2 < σ < 0` | `σ = −1` | Riesz constant `Γ(3/2)/(2π²Γ(1/2)) = (√π/2)/(2π²√π) = 1/(4π²)` (control: `n = 3, α = 2` gives `1/(4π)`); low blocks `2^{k(σ+4)}` summable for `σ > −4` | holds |
| 8.1 `p = 2`, full norm against block quantity | shell at `|ξ| = 2^{k+1}` | `ψ(η) = 1` at `|η| = 2`, `0` at `|η| = 1, 4`; ratio `(2π·2^{k+1})^σ/2^{kσ} = (4π)^σ`; with `|ξ|^σ`: `2^σ` | pins `2π`; equality only at `σ = 0` |
| 8.1 `Ẇ^{σ,∞}_c` = uniformly continuous `|D|^σu` | `g` bounded | `‖∇e^{sΔ}g‖_∞ ≲ s^{−1/2}‖g‖_∞`, so a uniform limit is uniformly continuous; converse by approximate identity | holds |
| 8.4 rewording (`b ∈ Ẇ^{σ,p}`, `Ẇ^{σ,∞}_c`) | `A = 0`, `p < ∞` | `e^{sΔ}b → b` in `Ẇ^{σ,p}` iff `e^{sΔ}g → g` in `L^p`: true for `p < ∞` | consistent with 8.1 |
| 8.3 F06 Check | `A = 0`, `‖b‖₂ = 1`, `J = [0, ∞)` | `sup = 1`, `∫‖∇B‖² = ½`, sum `1 + 2^{−1/2} = 1.7071`; finite `J`: supremum over `b` also tends to `1.7071` (high frequencies) | constant `1` refuted; `1 + 1/√2` sharp |
| 10.3 homogeneous bound | dilation `λ = 2^{−m}`; abelian; `a = 0`; nonabelian packet | `‖∇h_λ‖_{4/3}`: `λ³λ^{−3} = 1`; `‖h_λ‖_{4/3}`: `λ^{−1} = 2^m`; `‖h_λ‖_{ℓ¹L²} = ‖h‖`; E: `λ⁴λ^{−4} = 1`; abelian `h = 0`; `a = 0`: all `0`; SU(2): `(1 − 4)/5·2k = −6k/5` | homogeneous form holds; inhomogeneous refuted |
| 10.3 route `∂^ℓA_ℓ(s) → 0` | caloric `a` | `A_∞ = 0` gives `∂A(s) → 0` in `Ḣ¹`, hence `∂^ℓA_ℓ(s) → 0` in `L²`; Lemma 5.30's difference bound passes to the limit by lower semicontinuity | holds |
| 5.2 reworded higher regularity | `n = 0`, `p = d/2` | "∂B ∈ L^{d/2}" is implied by `B ∈ Ẇ^{1,d/2}` | consistent |
| `Suggested.lean` docstring (Layers 5, 8, 9) | carriers at the pins | `TauCeti.D1p0` exists (scalar, order one); no realised fractional / Besov / covariant carriers; no local-caloric solution carrier | statements of what is missing are now accurate; still no statable headline |

## Source issue

OhTataru-YMHF Proposition 7.7, equation (7.7), printed p. 69 (line 3288), prints the inhomogeneous
`W^{1,4/3}` norm. It should be the homogeneous `Ẇ^{1,4/3}` of Lemma 5.30 (line 2423), which its proof
invokes. This affects a stated result. The README records it at §10.3.

## For the maintainer

- **Other roadmaps (F04).** IncompressibleFlows Layer 0 item 2 still claims the general
  finite-dimensional `W^{k,p}` bridge, as does item 1 for order one. Once PDE supplies
  `gap:vector-valued-wkp`, that roadmap should consume it rather than own a second bridge. This cannot
  be done from this package. PseudoholomorphicCurveAnalysis PH1 (planar domains) could equally
  specialise the PDE contract.
- **New supplier request.** PDE is asked for a fifth section, `vector-valued-wkp` in Layer 1, in
  addition to the three gaps already declared on it.
- **New citations of roadmaps on main.** This roadmap now cites RiemannianGeometry R6 and
  CharacteristicClasses C5a.3.
- **Names other roadmaps might cite.** No name, section or id of this roadmap changed or was removed.
- **Suspicious text.** None in the review.
