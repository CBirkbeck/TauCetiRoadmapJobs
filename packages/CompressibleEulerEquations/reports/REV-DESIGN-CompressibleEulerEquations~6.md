<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6895080967 -->
Review (claude) of 658341f

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) three pinned Tau Ceti special cases are not cited, and one `*Needs:*` input of §4.3 is unnamed

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §4.3 `*Needs:*`: "`TauCeti.HasWeakFDerivOn` and the chain rule for `C^∞ ∘ (C¹ ∩ W^{1,2}_loc)`"; §4.2 `*Needs:*`: "Mathlib Plancherel … for the interpolation inequality on `E`"; the list `### From Tau Ceti`; plan targets 4.2, 4.3 (prerequisites).

   **Claim:** every input of §§4.2–4.3 is a named pin, and nothing stated there exists at the pins.

   **Witness:** at the pinned Tau Ceti (`2fd255d`), under `TauCeti/Analysis/Sobolev/`:
   `W1p/SupercriticalMultiplication.lean:320,500,515` (`TauCeti.W1p.mul`, `norm_mul_le`, `mulL`);
   `W1p/ChainRule.lean:375,385` (`TauCeti.W1p.hasWeakFDerivOn_comp`, `contDiffComp`);
   `Wkp/Interpolation.lean:335` (`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le`). None occurs in the README or the plan.

   What each one is, against the README's statement:

   - `TauCeti.W1p.mul` with `norm_mul_le`: `W^{1,p}(ℝⁿ)` is an algebra for `p > n`, `‖uv‖ ≤ 3‖Morrey‖‖u‖‖v‖`. At `p = 2` the hypothesis `n < 2` forces `n = 1`: this is "`Hᵏ_Λ` is an algebra when `2k > n`" of §4.3 at `Λ = 0`, `n = 1`, `k = 1` (`2 > 1`). §4.3 is the general statement (every `n`, `k`, `Λ`, and the tame form with `L^∞` factors) and stays.
   - `TauCeti.W1p.hasWeakFDerivOn_comp`: for scalar `u ∈ W^{1,p}(Ω)`, `p < ∞`, and `F ∈ C¹(ℝ)` with bounded derivative, `F ∘ u` has weak gradient `F′(u)∇u`; `contDiffComp` adds `F(0) = 0`. This is the chain rule behind the composition estimate of §4.3 at `N = 1`, `k = 1`, for a globally Lipschitz `Φ`. §4.3 needs vector-valued `u` and `Φ` smooth on an open `G` only, so the statement stays, but its `*Needs:*` line names no declaration for the chain rule.
   - `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le`: `‖∇u‖_p ≤ ε‖D²u‖_p + (n²/ε)‖u‖_p` on `W^{2,p}(E)`, `p < ∞`, `ε > 0`. With `ε = n(‖u‖/‖D²u‖)^{1/2}` it gives `‖∇u‖₂ ≤ 2n‖u‖₂^{1/2}‖D²u‖₂^{1/2}`, the case `j = 1`, `k = 2`, `Λ = 0` of the interpolation inequality of §4.2. On the README's own witness `u = e^{−x²}` (`n = 1`): left `(π/2)^{1/4} ≈ 1.120`, right `2·3^{1/4}(π/2)^{1/4} ≈ 2.947`.

   **Exact repair:**

   1. Add to `### From Tau Ceti` three bullets, each with the clause of difference above: `TauCeti.W1p.mul`, `TauCeti.W1p.norm_mul_le`, `TauCeti.W1p.mulL` (`TauCeti/Analysis/Sobolev/W1p/SupercriticalMultiplication.lean:320,500,515`), "the case `Λ = 0`, `n = 1`, `k = 1` of the algebra property of §4.3"; `TauCeti.W1p.hasWeakFDerivOn_comp`, `TauCeti.W1p.contDiffComp` (`…/W1p/ChainRule.lean:375,385`), "the scalar chain rule for a `C¹` function with bounded derivative; §4.3 proves the vector-valued case for `Φ` smooth on an open `G`"; `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` (`…/Wkp/Interpolation.lean:335`), "the case `j = 1`, `k = 2`, `Λ = 0` of the interpolation inequality of §4.2, in additive form".
   2. In the `*Needs:*` line of §4.3 replace "the chain rule for `C^∞ ∘ (C¹ ∩ W^{1,2}_loc)`" by the declarations the route uses: `TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:789`: a `C¹` function's gradient is its weak derivative), Mathlib's `HasFDerivAt.comp` for `Φ ∘ u` with `u` of class `C¹`, and `TauCeti.W1p.hasWeakFDerivOn_comp` for the scalar Sobolev case; density through §4.4 as already written.
   3. Add the three names to the prerequisites of plan targets 4.2 and 4.3 as `tauceti:` entries.

   Tested on the witnesses: with `u = v = e^{−x²}` on `ℝ`, `‖u²‖²_{H¹} = ∫e^{−4x²} + ∫16x²e^{−4x²} = √(π/4)(1 + 2) ≈ 2.659`, finite, as both the pinned bound and §4.3 give; no statement of §§4.2–4.3 changes.

2. **F02** (P3) §6.1 applies §5.2 to an operator whose coefficients exist only near the lens

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §6.1: "The proof applies §5.2 to `W = U₁ − U₂` with the weight `χ = φ₊`, using the difference bound of §2.1"; §5.1: "a linear system `LinearSystem n N` of SymmetricHyperbolicSystems §1.2".

   **Claim:** the operator linearised at `U₁`, `A⁰(U₁)∂_t + Σᵢ Aⁱ(U₁)∂ᵢ`, is an operator of §5.1, to which §5.2 applies.

   **Witness:** SymmetricHyperbolicSystems §1.2 (and its `Suggested.lean`, the structure at line 73): the fields `A0`, `A`, `B` are total functions on `ℝ × E`, and the predicate quantifies over every `(t, x)`. In §6.1, `U₁` is defined only on a relatively open subset of `[t₁, t₂] × E`.

   Instance: `n = N = 1`, `Λ = 0`, `A⁰ = 1`, `A¹(u) = u` (Burgers), `U₁` given on a neighbourhood `𝒩` of the closure of a lens: `A¹(U₁(t, x))` has no value for `(t, x) ∉ 𝒩`, so no `LinearSystem 1 1` is named. The README does this extension for the pointwise identity (the cutoff of the supplier contract) but not for the operator handed to §5.2. The statement of §6.1 is true; the route lacks one sentence.

   **Exact repair:** add to the proof paragraph of §6.1: "The linearised operator is made an operator of §5.1 by a cutoff: with `θ` smooth, Λ-periodic, `0 ≤ θ ≤ 1`, equal to `1` on a neighbourhood of the closure of `L_φ` and supported in the common domain of `U₁`, `U₂`, take the coefficients `θA⁰(U₁) + (1 − θ)λI`, `θAⁱ(U₁)`, `B = 0`, with `λ` the least eigenvalue of `A⁰` on `K`; they are symmetric, bounded with bounded first derivatives, Λ-periodic, and `λI + θ(A⁰(U₁) − λI) ≥ λI`. §5.2 uses them only near the closure of `{χ > 0}`, where `θ = 1`." Such a `θ` exists because the closure of `L_φ` is compact modulo `Λ`. On the instance: `A⁰ = 1`, `λ = 1`, the extended `A⁰` is `1` and `A¹ = θU₁` is defined on all of `ℝ × ℝ`; with `A⁰ = 2`, `λ = 1`, `θ = 1/2` the value is `1.5 ≥ 1`. Same sentence in the `statement` of plan target 6.1's route, if the plan records the route.

Two findings, both P3 (no P1, no P2); each carries a repair, so the verdict asks for changes. The six findings of
round 5 are all repaired. The supplier citations (LorentzianGeometry, SymmetricHyperbolicSystems,
PDE) were resolved again at the present heads and on main, every pinned declaration the README
names was reopened at the pins, the fifteen sampled sections were checked against the cached
texts, and the statements were recomputed (table below). No file of the design or of the manifest
was changed by this review. Elaboration: not available (this lane does not elaborate; say so in
the report); the design stage has no `Suggested.lean`, so the one-tactic probe and the `#check`
comparison have nothing to run on. No supplier gap is declared (`gaps: []` in `design/plan.json`;
the README says so under the supplier contracts). No
maintainer note was left for this roadmap.

## Verified sound

### Round-5 findings, checked first

| Round-5 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) §5.4 omits symmetry | §5.4: "for a linear system `LinearSystem n N` of SymmetricHyperbolicSystems §1.2 satisfying `LinearSystem.IsSymmetricHyperbolic` with constant `λ₀` (so `A⁰` and every `Aⁱ` take symmetric values and `A⁰ ≥ λ₀I`)"; plan 5.4 hypotheses carry the predicate | **Repaired.** Jordan block recomputed (table): excluded. |
| F02 (P3) PDE plans periodic spaces | Scope: "Its §7.1–§7.2 plan the periodic Besov spaces on `𝕋^d = ℝ^d/ℤ^d` by Fourier series; their case `p = q = 2`, integer `s = k`, is `Hᵏ_Λ` for a full-rank `Λ` … up to norm equivalence"; new Check in §4.1 | **Repaired.** PDE §7.1, §7.2, §7.3 and the Scope sentence "every statement below is scalar" read on main; Check recomputed. |
| F03 (P3) `e^{3t}` | §3.2: "which on `[0, 1]` is at least `2 > 1`, so it is not causal there, while on `(−∞, −(ln 2)/3]` … it is causal" | **Repaired.** Same pattern repaired for `x(t) = 2t` ("not on any interval of positive length"). |
| F04 (P3) cutoff range and support | Supplier contract: "a smooth cutoff `ψ` with `0 ≤ ψ ≤ 1`, equal to `1` near `p` and compactly supported in an open subset of `(0, T) × E` on which `u`, `A⁰` and the `Aʲ` are `C¹`" | **Repaired.** R02 is the same pattern one step later (the operator, not the identity). |
| F05 (P3) Layer 7 dependencies | "Layers 2, 3 (§3.3, for §7.3), 4, 5 and 6"; How to read: Layer 6 "(Layers 2, 3 and 5)", Layer 8 "(Layers 1–3, 6 and 7, and LorentzianGeometry §12.6)" | **Repaired.** Each layer's list compared with its `*Needs:*` lines: complete. |
| F06 (P3) ONeill1983 uncited | §3.3: "HawkingEllis1973 at §6.5; ONeill1983, Ch. 14, causality in Lorentz manifolds"; manifest `cited_for = ["3.3"]` | **Repaired** (cited rather than deleted; waived, by locator only). BarGinouxPfaffle2007 line 1005 cites the same chapter for the neighbouring statement. |

Repaired patterns searched in the rest of the text: a hypothesis list that re-states part of a predicate (none further: §5.1, §5.2, §5.3, §6.1, §7.1 name the carrier); a Check true only on part of its interval (none further); a dependency list short of its `*Needs:*` lines (none); a cutoff without range (§7.3 states `0 ≤ χ ≤ 1` and has its own Check); a listed work cited nowhere (none: 21 keys, each cited in the body, counts below).

### Adversarial table

Recomputed this round by hand: the fifteen sampled targets, the headlines, the passages the repairs changed, and the targets the two findings touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 sound speed | `p = ρ²/2`, `ρ = 4`; `P = e^sρ²` at `(1, 0)`; Chaplygin; `p = −ρ²` | `c = 2` (wrong `c = p′`: `4`); `∂_ρP = 2`, `∂_sP = 1`, `c = √2`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0` | sound |
| §1.2 Galilean boost | expanding flow, `w = 1` | `ṽ = (y + 1)/(1 + t)`: `∂_tṽ + ṽ∂_yṽ = 0`; wrong rule: `−(1 + y)/(1+t)² + (y − t)/(1+t)² = −1/(1 + t)`, `−1/2` at `t = 1` | sound |
| §2.1 monotonicity, `κ` | `(c, w) → (c′, w′)`; `λ(U)` | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰` | sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = [[12, 4], [4, 3]]`, `det(A¹ − λA⁰) = 4λ² − 24λ + 20`, roots `1`, `5` | sound |
| §2.2 full symmetriser | general `a = ∂_ρP/ρ`, `b = ∂_sP/ρ`, `d = 1 + b²/a`; `(1, 0)` | `S Mⁱ` rows `(av, aρeᵢ, bv)`, `(aρeᵢ, ρv, bρeᵢ)`, `(bv, bρeᵢ, dv)`: symmetric; `ad − b² = a > 0`; minors `2, 2, 2`; `d = 1/2`: `det = 0` | sound |
| §2.2 dominance | `(1, 3)`, `c = 2`; cones `(2, 0)`, `(5, 0)` | worst covector gives `c′ ≥ c + |v − w|`; `ζ = (2, −1)`: `2 − 3 − 2 = −3 < 0`; threshold `5` | sound |
| §3.1 form | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `−2`, `|−2| = c|ζ′|`, `ζ(1, 3, 0) = 0` | sound; equals LorentzianGeometry §7.3's `g(X, B) = −c²dt(X)` |
| §3.1 covariance | `w = v` | `g_{c,v}((1, ξ + v)) = g_{c,0}((1, ξ))`; `ξ = (2, 0)`: `−4 + 4 = 0` | sound |
| §3.2 integral characterisation | `t/2`, `2t`, `|t|`, `10·`Cantor; one-point `J`; `e^{3t}` | `Δ/2 ≤ Δ`; `2Δ > Δ`; slopes `±1`; `10 > 1`; vacuous; `2e^{3t}`: `2` at `0`, `0.0996` at `−1`, `1` at `−0.231` | both directions hold; repaired Check correct |
| §3.3 closed domain | `{|x| ≤ 1 + t}`, `x ≡ 1.9` from `(1, 1.9)` | reaches the boundary at `(0.9, 1.9) ∈ D`, continues along `x = 1 + s` (speed `1`) to `(0, 1) ∈ S`: `D⁺_D(S) = D`; open domain: leaves at `t = 0.9` | sound |
| §3.3 slab hypothesis, expanding flow | `(1, x²)`; `p = ρ²/2`, `ρ₀ = 1` | `x(s) = 1/(1/4 − s)`: `ẋ = x²`, `x(1/2) = −4`, `→ −∞` at `1/4`; `ẏ = −(1+t)^{−3/2}`, `x = 2√(1+t) − (1+t)`: `0.828` at `t = 1`, `0` at `t = 3` | sound |
| §3.3 compact pasts, idempotence | first-exit argument | a curve of `D` ending at `p ∈ D⁺_D(S)` reaches `t₀`, where it is inextendible, hence in `S`; an exit point of `D⁺_D(S)` starts a curve missing `S` | sound |
| §4.1 norms | `e^{−|x|²}`, `n = 2`, `k = 2` | `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`; operator-norm part `2π(1 − e⁻²) + 10πe⁻²`, total `(7/2 + 8e⁻²)π ≈ 4.58π` | sound |
| §4.1 against PDE §7.2 (new) | `cos x`, `1`, `Λ = 2πℤ` | PDE §7.1: `χ = 1` on `|ξ| ≤ 1`, `ψ(η) = χ(η/2) − χ(η)`; at `|ξ| = 1`, `j ≥ 1`: both arguments `≤ 1/2`, `ψ = 0`; `B¹_{2,2}`: `1/2`, `1`; here `2π`, `2π`; ratios `4π`, `2π` | sound |
| §4.1 against IncompressibleFlows, circle | `cos x` | weight `(1 + 4π²|k|²)` (its Layer 0, item 3): `(1 + 4π²)/2`; `CircleSobolev`: `2·2²·(1/4) = 2` | sound |
| §4.2 interpolation | `e^{−x²}`, `j = 1`, `k = 2`; dilations | `2√(π/2) ≤ √5·√(π/2)`; wrong pair `λ^{1/2}` against `λ^{1/6}`; pinned additive form `1.120 ≤ 2.947` | sound; R01 |
| §4.3 Gagliardo–Nirenberg | `n = 1`, `k = 2`, `i = 1` | both sides `λ^{3/4}`; wrong side `λ^{1/2}`, ratio `2` at `1/16` | sound |
| §4.3 composition, algebra | `Φ_m = sin(ms)`, `u_m = m⁻¹1_{[0,1]}`; `|x|^{−n/3}`; `e^{−x²}` squared | `sin 1 ≈ 0.8415 ≤ m·m⁻¹`; `∫|x|^{−4n/3} = ∞`; `‖u²‖²_{H¹} = 3√(π/4) ≈ 2.659` | sound; R01 |
| §4.4 mollifiers | `a = sin(x/2)`, `u = sin x`; `a = x` | commutator `½[(φ̂(3ε/2) − φ̂(ε)) sin(3x/2) − (φ̂(ε/2) − φ̂(ε)) sin(x/2)]`; at `π`: `½(5/8 − 3/8)μ₂ε² = μ₂ε²/8`; kernel `ψ′`, `‖ψ′‖_{L¹}` free of `ε` | sound |
| §5.1 identity | `B = bI`; `A⁰ = √(1 + x²)` | `E = e^{−2bt}E(0)`; `‖W‖² = π`, `‖W′‖² = π/8`, `2 asinh R → ∞` | sound; same `K` as SymmetricHyperbolicSystems §2.1 |
| §5.2 weights | transport `a = 1`; periodised cone | `−1 − sign x ≤ 0`; `−1/2 + 1 = 1/2 > 0`, bump support `(−1.1, −0.1)` meets `|x| < 0.55`; `(M − e·w) + w·e = M ≥ M|e|` | sound |
| §5.3 Burgers, forcing | `W = u`; `A⁰ = 1/(2 + u)` | `−2∫u_x³ + ∫u_x³ = −∫u_x³`; `S_m ≥ πm⁴/3`, `C₁ ≥ √(2/3)m²` | sound |
| §5.4 hypotheses (repaired) | Jordan block, data `(g, h)` | solution `(g − th′, h)`; `A¹ᵀ ≠ A¹`, predicate fails | excluded, as the Check now says |
| §5.4 constant | `A⁰ = e^{sin x}`, `A¹ = M`, `w = sin x + sin 2x` | `a(w′/a)″ = w‴ − 2cos x w″ + (sin x + cos²x)w′`; `2·2π + 4·4π + 2·π = 22π`; `E₂(0) ≤ e(2π + 5π + 17π) = 24eπ` | sound |
| §5.4 regularisation | constant transport | multiplier `−iamφ̂(εm)²` | matches the Check |
| §6.1 lens uniqueness (headline) | `φ = 1 − |x| − t/2`; `Λ = ℤ`, `A¹ = diag(z², 0)` | not spacelike, bump enters; `g′·(1 − x²/x²) = 0`, `u(0.9, −1/0.3) = g(0.6)` | spacelike condition and periodicity both needed; R02 on the route |
| §6.2 | constant state on `(−2, 2)` | `1.4 < 1.5` claimed; `1.6` not | sound |
| §7.1 continuation | Burgers, `u₀ = −e^{−x²}` | `min u₀′ = −√2e^{−1/2}`, `T* = e^{1/2}/√2 ≈ 1.1658` | sound |
| §7.2 Euler (headline) | `p = ρ³/3` simple wave | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, same `T*`, `ρ ∈ [1, 3/2]`; `v` stays bounded when `∫‖∇ρ‖_∞ < ∞` and `ρ` stays in a compact of `I`, so the criterion may name `ρ` alone | sound |
| §7.3 uniformly local | `F = u/(1 − u)`; cones `C_y`; `(1, 3)` at `ζ = (−2, 1)` | exit time `−log U₀ − (1 − U₀)`: `0.0721`, `0.00365`, `0.0000484`; `|x(s) − y| < 1 − ms` backwards, so `C_y = D⁺_{C_y}(B(y, 1))`; `−2 + 3 = 1 ≥ 1`, added entry `−2` | sound |
| §8.1 developments | `{|x| < 1 + t}`, `{|x| < 1 − t/2}`; `T = 0` | not developments; truncation at `T = t₀` empty, slice `∅ ≠ S` | sound |
| §8.2 (headline) | counter-flow, `p = ρ²`, `ρ = 1/2` | `c = 1`; speeds `1, 3` and `−3, −1`; `T_L = {x < −1 + t}`, `T_R = {x > 1 − t}` past-closed; `(2, 0)` in both, `2 ≠ −2`; `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}`; slice of `D₁ ∩ D₂` at `t = 1` empty | sound |
| §8.2 `W₁₂ = W₂₁`, compatibility, criterion | first exit from `W₁₂`; union; global `U_*` | exit point lies in the compact `J⁻_{D₁}(p) ⊆ D₂`, hence in `W₁₂`; a curve of the union cannot leave `D₁` above `t₀`; with `O = H_{t₀}` every development is below `D⁺_{H_{t₀}}(S)` | sound |
| §8.3 (headline) | two extensions; `S = E` | §6.2 with `O′` the other slab: `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O′`; maximal ∪ slab is a development, so the slab is inside | sound |
| §8.4 (headline) | constant state; expanding flow at `t = 1`; `φ = t − 0.9x` | `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071 = c`; `M = 5`: `φ(−100, −400) = 260`, `ψ = ε + 100`; `M = 1.05`: `−18.2ε < x < 0.514ε` | sound |
| Worked example, full Cauchy data | slab from §7.3 plus `T_L` or `T_R` | §6.2 makes the slab solution the left state on `T_L ∩` slab; both unions are developments, values `2`, `−2` at `(2, 0)` | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into a readable text was opened and resolves to the stated object:

- ChristodoulouMiao2014 lines 606 (1.24), 672–676 ((1.39)–(1.40)), 685, 864–872, 872–880, 880–886; AbbresciaSpeck2022 lines 149–152, 158–171, 172–179, 408–414; LuoYu2023a lines 82–95; LuoYu2023b lines 417–419, 910; Christodoulou2019 lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (the normalisation `c⁻²g`, as the README says).
- Minguzzi2019 lines 1359–1364, 1917, 3576–3583, 3716–3718; MinguzziCone2019 lines 680–683, 696–698 (page 17), 1737–1740; Chrusciel2011 lines 534, 1169, 1352, 1843–1848, 1859; BarGinouxPfaffle2007 lines 1006–1008, 3664–3669.
- EperonReallSbierski2019 lines 767, 1129–1132, 1178–1180, 1195–1210, 1338–1344, 1603; LukNotes lines 679, 724, 1158, 1210, 1239, 1612, 1620; Nirenberg1959 line 318; Speck2016 §1.11 (contents, line 32).

Remark, no change needed: §3.1 cites ChristodoulouMiao2014 lines 864–872 for the sound sheet; the passage describes the sound cones of the acoustical metric in the definition of a development, which is the cone the bullet identifies.

### Pinned declarations opened

All 44 declarations the README names with a file and line were reopened at the pins (Mathlib as in `lake-manifest.json`; Tau Ceti `2fd255d`, which is the manifest's revision and the plan's baseline), each at the stated line: the 18 Mathlib ones (`Matrix.PosDef`, `Matrix.PosSemidef`, `Matrix.IsHermitian`, `Matrix.isHermitian_iff_isSymm`, `Matrix.IsSymm`, the two Rademacher statements, `LipschitzOnWith.absolutelyContinuousOnInterval`, `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `BoundedContinuousFunction.arzela_ascoli`, `zorn_le_nonempty₀`, `IsPicardLindelof` and its existence statement, `ODE_solution_unique_of_mem_Icc`, `TemperedDistribution.MemSobolev`, `MeasureTheory.Lp.fourierTransformₗᵢ`, `MeasureTheory.norm_integral_le_integral_norm`, `Real.young_inequality`) and the 26 Tau Ceti ones (`Wkp`, `HasWeakFDerivOn`, the Bessel comparison, the two embedding declarations, the difference-quotient criterion, `dense_contDiff_representatives`, the five `normedBumpL` declarations and `W1p.normedBumpL`, the six translation declarations, the three Leibniz rules, `CircleSobolev` with `norm_sq_eq_tsum` and `toLpₗᵢ`, the Grönwall inequality). Also `LocallyLipschitzOn` (`Mathlib/Topology/EMetricSpace/Lipschitz.lean:72`), `ContDiffBump` (`Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70`), `convolution` (`Mathlib/Analysis/Convolution.lean:401`). None missing. The six further declarations of R01 and its repair were opened at the lines given there.

"Mathlib has no symmetric hyperbolic system, no Moser estimate, no Lorentzian form with a time orientation, no causal curve": searched in the pinned Mathlib by object; no hit.

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder, read at its head): §6.1 (`minkowskiForm E`, `−v.1² + ‖v.2‖²`), §6.3 (the hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`; timelike is index one, equivalently containing a timelike vector), §7.3 (form, `B`, `g⁻¹ = −c⁻²B ⊗ B + h⁻¹`, `g(X, B) = −c²dt(X)`, causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff `|Y − v|_h ≤ |c|`, time orientation by `[B]`), §8.2, §8.3, §11.4 (arc-length limit curves) and §12.6 (`TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, monotonicity, concatenation, time functions with the extension form and one-point intervals, the slab identity, `futureDomainOfDependenceIn_self`, coverings): each statement the contract assumes is there as stated. Its §7.3 and its Downstream consumers hand the fluid side, developments and well-posedness to the hyperbolic-PDE roadmap; it consumes nothing here. Not in its §12.6: existence of inextendible extensions, causal pasts in a subset, compact pasts, openness, idempotence for open `S` in a half-space; these stay here, each with its clause of difference.
- **SymmetricHyperbolicSystems** (open pull request adding the folder, read at its head): §1.2 (`LinearSystem n N`, `apply`, `IsSymmetricHyperbolic`, declared in its `Suggested.lean` at lines 73, 85, 92), the Conventions' speed, §2.1 (same `K`), §2.2 (single speed, smoothed weight, `F = 0` on the cone), §2.3, §7.3. Its scope excludes quasilinear systems and the `Hˢ` theory and names the quasilinear Cauchy problem as its consumer.
- **PDE** (main): §1.3, §1.4, §7.1–§7.3 and the Scope sentence resolve; the open revision of PDE drops none of them (overlap facts).
- **IncompressibleFlows** (open; on the never-cite list): named in Scope as a boundary and in a Check only, never in a `*Needs:*` line or a supplier contract. **RelativisticQuantumFieldTheory** RQFT1: boundary only; the layer exists at its head.
- By object, with `roadmaps grep` over main and the open heads: Moser, Gagliardo–Nirenberg and Friedrichs-mollifier estimates on `Hᵏ`, quasilinear symmetric hyperbolic systems, developments and maximal developments, the compressible Euler system: no other owner. PositiveMass (main) uses a tangential Friedrichs mollification inside one boundary-regularity route and owns no mollifier target.
- By object at the pins: R01 (three special cases, to be cited). Nothing else of Layer 4 exists in Tau Ceti: `Wkp/Multiplication.lean` is multiplication by a smooth bounded factor on `W^{k,p}_0`, `Wkp/Leibniz.lean` the Leibniz rule for a smooth factor at orders one and two, `Sobolev/Mollification/` the interior derivative identities; none is a Moser estimate, a commutator estimate or a statement on a periodic carrier.
- Overlap facts (`scratch/overlaps.md`, checked): no other open pull request changes this roadmap; no cited id is dropped; no id is defined only by an open revision; the roadmap is not on main and no open pull request adds its folder, so there is no second copy.
- Citation leads: the worker's lead on `LinearSystem.IsSymmetricHyperbolic` is refuted (it is the supplier's declaration, above); `roadmaps resolve`, run again on the README, lists no cross-roadmap citation and no Lean name found nowhere.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, YangMillsConnectionsAndCaloricGauge, PDE (main and its open revision), SobolevPolynomialApproximation, RiemannianGeometry; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here and the full-rank comparisons Checks of §4.1; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a section of this roadmap or a section of the two suppliers, except the one unnamed chain rule of R01. No notion was moved down this round. Ownership against the open pull requests was checked through `roadmaps show` and `roadmaps grep` at their heads; LorentzianGeometry and SymmetricHyperbolicSystems are not among the 239 names of `scratch/open-pull-requests.md` and were read through the same tools.

### Shape, style and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Checks per definition: §1.1 5, §1.2 3, §1.3 3, §2.1 5, §2.2 6, §3.1 4, §3.2 3, §3.3 4, §4.1 8, §4.4 6, §5.1 4, §5.2 5, §6.1 4, §7.3 9, §8.1 4. Every theorem has a locator or says it is proved here.
- Organisation: the layers are worked back from the developments theorems (equations, carrier, causal geometry, Sobolev calculus, linear energy method, uniqueness, existence, developments); no layer is named after a source's chapter, the README does not say it follows a source, and Layers 3 and 4–5 are independent of each other, as "How to read the build" says.
- Headline theorems (How to read the build): §7.2, §6.1, §8.2–§8.3, §8.4, with the definitions they need. There is no `Suggested.lean` at this stage; the backticked names of the README are library or supplier declarations, none is presented as this roadmap's own.
- Style: no LaTeX delimiters, no process words, no pull-request numbers, no dates, no machine paths (searched); the matches of "lemma" are Zorn's and Friedrichs' lemmas.
- `design/plan.json`: parses; 8 layers, 53 targets (36 theorems, 12 definitions, 4 constructions, 1 example), every definition with at least three tests, no dangling `target:` prerequisite, roadmap prerequisites LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §12.6 and SymmetricHyperbolicSystems §1.2, §2.1 only, `gaps: []`; the statements of 4.2, 4.3, 5.4 and 3.3 agree with the README. `sources.toml`: parses; 21 entries, the 21 keys of the References.

### Copyright

Wording: eleven passages set beside their sources: the definition of a development against ChristodoulouMiao2014 lines 866–872; the classical uniqueness claim against lines 875–880; the equation of state against AbbresciaSpeck2022 lines 165–171; the well-posedness sentence of §7.2 against lines 175–179; `D⁺_D(S)` against Minguzzi2019 lines 3576–3578 and BarGinouxPfaffle2007 lines 1006–1008; the causal-curve definition against MinguzziCone2019 lines 680–683; the regular boundary against Christodoulou2019 lines 130–138; the embedding and the composition estimate against LukNotes lines 1210–1212 and 1612–1615; local uniqueness against EperonReallSbierski2019 lines 1178–1180; the half-space configuration against LuoYu2023b lines 417–419. Longest shared run: five words ("the union of all developments"), a standard phrase. No table, figure, exercise or data set is taken over.

Arrangement: 109 locators; ChristodoulouMiao2014 and Majda1984 have 17 each (then AbbresciaSpeck2022 9, LukNotes 8). ChristodoulouMiao2014's contents (lines 339–392: Euler equations and the acoustical metric; null foliation; structure equations; curvature; energy estimates; commutation fields; …): only its §1.1 and §1.3 meet Layer 1 and §3.1; Layers 2 and 4–8 have no counterpart, and no run of layers follows its chapters.

Source independence: 11 passages compared with 9 sources, none shared; largest share ChristodoulouMiao2014 and Majda1984, 17 of 109 locators each; contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1, Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they are cited for (§2.1, §2.2, §§4.2–4.4, §§5.1–5.4, §6.1, §6.2, §§7.1–7.3) were checked mathematically, not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators not checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §3.2 (limit curves), §3.3 (openness), §6.2 (the sweep) and §8.4 (b) (the extension lens) are proved here with no source theorem at this generality; they were checked step by step by hand and on the instances of the table, not against a text.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Scope/ownership.** Two texts are named LorentzianGeometry: the open roadmap pull request (its §7.3 and §12.6 are cited here) and the board design `packages/LorentzianGeometry/design/README.md`. This README follows the numbering of the former.
- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests and are absent from `merge-order/ORDER.txt`; the dependency check draws no edge to them.
- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "658341f6b669b45240fbc216d65eb0b5ef1cc1e6", "job": "REV-DESIGN-CompressibleEulerEquations~6", "model": "fable", "worker": "chris-x82"} -->
