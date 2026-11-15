<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6898084142 -->
Review (claude) of 2b4da02

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the loss bound of §4.4 has a pinned input that no contract names

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §4.4: "for `k ≥ 1` and every
   `ε > 0`, `‖J_εu − u‖_{Hᵏ⁻¹_Λ} ≤ Cε‖u‖_{Hᵏ_Λ}`" and "Proved here as well are the `ε^{−1}` gain and `ε`
   loss bounds"; the *Needs:* line of §4.4; the Tau Ceti contracts; plan target for the mollifiers.

   **Claim:** every input of the loss bound is named, as it is for the contraction, the gain and the
   convergence.

   **Witness:** `TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`
   (`TauCeti/Analysis/Sobolev/Translation.lean:133`, at the pin): `‖u(· + h) − u‖_p ≤ ‖h‖‖∇u‖_p` on the
   closure of the test functions in `W^{1,p}(ℝⁿ)`. The README names it nowhere.

   The loss bound is one step from it: `J_εw − w = ∫ φ(y)(τ_{−εy}w − w) dy`, so
   `‖J_εw − w‖_{L²} ≤ ε(∫ |y|φ(y) dy)‖∇w‖_{L²}`, applied to `w = ∂^αu`, `|α| ≤ k − 1`. The statement
   of §4.4 is true and stays; only the citation is missing (the README does name the corresponding
   inputs for the other three bounds).

   **Exact repair:** add to "From Tau Ceti": "`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`
   (`TauCeti/Analysis/Sobolev/Translation.lean:133`): the translation estimate
   `‖u(· + h) − u‖_p ≤ ‖h‖‖∇u‖_p` on the closure of the test functions in `W^{1,p}(ℝⁿ)`, which for
   `p < ∞` is all of `W^{1,p}(ℝⁿ)`; with the Bochner-integral bound it gives the loss bound of §4.4 for
   `Λ = 0`, with `C = ∫ |y|φ(y) dy`, and the localisation of §4.1 carries it to a general `Λ`." Add the
   name to the *Needs:* line of §4.4 and to the prerequisites of the mollifier target in the plan.
   Tested on the instance of the README's own Check: for `cos(mx)` the Check uses
   `|1 − φ̂(εm)| ≤ ε|m|∫ |y|φ(y) dy`, the same constant; for `w = e^{−x²}` on `ℝ`,
   `‖w′‖₂ = (π/2)^{1/4} ≈ 1.1195`, and the bound reads `‖J_εw − w‖₂ ≤ 1.1195 ε ∫ |y|φ`.

2. **F02** (P3) the list of definitions the headlines need omits three of them

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, "How to read the build": "the
   definitions they need are the equation of state, the Euler system, the sound-cone causal curve and
   the future domain of dependence … and the development."

   **Claim:** these five definitions make the four headlines (§7.2, §6.1, §8.2–§8.3, §8.4) statable.

   **Witness:** §6.1 is stated for "Λ-periodic classical solutions of the same quasilinear symmetric
   hyperbolic system" and a lens function "spacelike for `U₁`" (the carrier and symbol of §2.1, the lens
   function of §6.1); §7.2 for data with `ρ̄ − ρ₀, v̄ − v₀ ∈ Hᵏ_Λ` (§4.1). None of the three is in the list.

   Stated with the five listed definitions only, §6.1 would have to be narrowed to the Euler systems
   and §7.2 to `Λ = 0` on Tau Ceti's `Wkp`, which is a generality below the README's.

   **Exact repair:** write "the definitions they need are the equation of state, the Euler system, the
   quasilinear symmetric hyperbolic system with its symbol (§2.1), the space `Hᵏ_Λ` (§4.1), the lens
   function and its spacelike condition (§6.1), the sound-cone causal curve and the future domain of
   dependence (in the time-parametrised form that LorentzianGeometry §12.6 reduces its notions to) and
   the development." Tested on the two witnesses: with the amended list §6.1 is statable for the
   scalar transport system of §2.1 (not an Euler system) and §7.2 for `Λ_cyl`, `n = 3`, `k = 3`, the
   setting of AbbresciaSpeck2022 line 179.

Two findings, both P3 (no P1, no P2). Each carries a repair to the README, so the verdict asks for
changes: a fix round applies R01 and R02, and nothing else stands in the way. Both findings of round 8 are repaired. Every supplier citation was resolved again at the
present heads and on main, every pinned declaration the README names with a file and line was
reopened at the pins, the fifteen sampled sections were read against the cached texts, and the
statements were recomputed by hand (table below). This review changed no file of the design and did
not touch the manifest. Elaboration: not available (this lane does not elaborate; say so in the
report); the design stage has no `Suggested.lean`, so the one-tactic probe and the `#check`
comparison have nothing to run on. No supplier gap is declared (`gaps: []` in
`packages/CompressibleEulerEquations/design/plan.json`, and the README says so under the supplier
contracts), so no finding concerns a gap. No maintainer note was left for this roadmap.

## Verified sound

### Round-8 findings, checked first

| Round-8 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) §8.4 does not say how it differs from LorentzianGeometry §12.7 | §8.4: "LorentzianGeometry §12.7 proves, for a locally Lipschitz time-oriented Lorentzian metric on an open set `U` of a manifold without boundary and `S` closed in a slice … Statement (b) differs: the acoustical form exists only on `D` and on the neighbourhood `N` …"; Scope: "Null hypersurfaces are LorentzianGeometry's as well (§9.2 there); §8.4 states the nullity of a boundary through the conormal condition of §3.1"; §3.2: "and from the limit curve theorem of its §12.7"; plan 3.2.3, 8.4.1 and test `separates_from_horizon_theorem` | **Repaired.** Read against LorentzianGeometry at its head: §12.7 ("Slices of a temporal function") has the identity with `∩ {t > t₀}` on both sides and "null there in the sense of §9.2"; its Layer 12 introduction and setting table give "manifolds without boundary" and "locally Lipschitz"; §9.2 has the equivalent form `du_p ≠ 0`, `g⁻¹(du, du)(p) = 0`. The fix worker's split of the Scope sentence is correct: §8.4 does use §9.2's form. |
| F02 (P3) the bound on the second solution's cone field is not needed | §6.2: "one of which has a cone field bounded on `[t₀, t₂] × E` for each `t₂ < t₁`, agree: take that solution as `U₁` …"; §7.1: "the only classical solution on `[0, T) × E` with this data: `U([0, T] × E)` has compact closure in `G` …"; new Check of §6.2; plan 6.2.1, 7.1 | **Repaired.** Derivation, compactness argument and both halves of the Check recomputed (rows below). |

Repaired patterns searched in the rest of the text. A statement beside a LorentzianGeometry
statement on the same object without its clause: §§3.1–3.3 carry one per kept statement (determinant
and frame, covectors, limit curves, covariance, existence of extensions, openness, idempotence,
slabs, invariance); §8.1–§8.3 are developments, which LorentzianGeometry's Scope and Downstream
consumers hand to the hyperbolic-PDE roadmap; none further. A hypothesis on both solutions where one
suffices: §6.1 ("Only the cones of `U₁` enter"), §7.3 (only the field `(m, 0)` of the constructed
solution), §8.2 and §8.3 (the Theorem of §6.2 directly), §1.3 (one solution); none further.

### Adversarial table

Recomputed this round by hand: the passages the repair changed or added, the fifteen sampled
targets, the headlines, and the targets the two notes touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §6.2 slab uniqueness, one bounded field | Burgers, `U₁ ≡ 0`, `C¹` `U₂` with zero data | largest root of `ωu − λ` over `ω = ±1` is `|u|`, `κ = (1 + |u|, 0)`, `κ(0) = (1, 0)`; along `ẋ = U₂`, `d/dt U₂ = 0`, so `x(t) = x_p + U₂(p)(t − t_p)`, bounded, reaches `t = 0`; `U₂(p) = 0` | holds, no bound on `U₂` |
| §6.2 Check, negative control | `A¹ = diag(z², 0)`, solutions `(0, x)`, `(g(t + 1/x), x)` | `∂_tu + x²∂_xu = g′ − g′ = 0`; at `t = 0`, `1/x < 0`, `u = 0`; at `(0.9, −10/3)`, `0.9 − 0.3 = 0.6 ∈ (1/2, 1)`; any dominating `(c, w)` needs `c ≥ |w|` and `c ≥ |z² − w|`, so `c + |w| ≥ x²`: unbounded for every cone map | one bounded field is needed |
| §6.2 slab, degenerate | `t₁ = t₀`; `S = Σ_{t₀}`, `D = O` | `[t₀, t₀) × E = ∅`; `J⁻_D(p) ⊆ D = O`, `D⁺_D(Σ_{t₀}) = D` by §3.3 for the field of `U₁` | sound |
| §7.1 uniqueness among all classical solutions | `t_m → t*`, `x_m = f_m + y_m`, `|y_m| → ∞` orthogonal to `V`; Burgers `u₀ = −e^{−x²}`; full-rank `Λ` | `|U(t_m, x_m) − Ū| ≤ ‖U(t_m) − U(t*)‖_∞ + |U(t*, x_m) − Ū| → 0`: closure `⊆` image `∪ {Ū} ⊆ G`; values in `[−1, 0]`, `κ ≤ (2, 0)`; `E/Λ` compact | sound |
| §8.4 comparison paragraph | `c = 1`, `v = 0`, `n = 1`, `S = (−1, 1)`, truncation at `1/2`; `U = ℝ²` | top `φ = t − 1/2`: `1 > 0 = c|∇φ|`; `D⁺_U({0} × [−1, 1])`: past curves from `(t, x)` reach `|x(0)| ≤ |x| + t ≤ 1` iff `|x| ≤ 1 − t`; side `φ = |x| − 1 + t`: `1 = c|∇φ|` | separates (a), (b), §12.7 |
| Scope, §9.2 form | constant state; expanding flow at `t = 1` | `g⁻¹(dφ, dφ) = −c₀⁻²(c₀)² + 1 = 0`; `−2(1/√2)² + 1 = 0` | agrees with §3.1 |
| §3.2 clause on §12.7 | field `c = 1 + |x|^{1/2}`, `v = 0` on `H₀` | continuous, not Lipschitz at `x = 0`: §3.2 applies, §12.7's hypothesis fails | clause separates |
| §1.1 sound speed | `p = ρ²/2` at `4`; `p = ρ²` at `1/2`; Chaplygin; `e^sρ²` at `(1, 0)` | `c = 2` (wrong `c = p′`: `4`); `c = 1`; `p′ = A/ρ² > 0`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | sound |
| §1.2 expanding flow, boost | `n` general; `n = 1`, `w = 1` | `∂_tρ = −nρ/(1 + t)`, `ρ div v = nρ/(1 + t)`; `ṽ = (y + 1)/(1 + t)`: `−(y + 1)/(1 + t)² + (y + 1)/(1 + t)² = 0`; wrong rule: `−(1 + y)/(1 + t)² + (y − t)/(1 + t)² = −1/(1 + t)`, `−1/2` at `t = 1` | sound |
| §1.3 entropy wave, propagation | `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}`; bounded `v` | `P = e^x e^{−x} = 1`; wrong term `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2) = −e^{x/2}`; material curve backward stays in a ball of radius `(t_p − t₀) sup|v|` | sound |
| §2.1 monotonicity, `κ`, wave system | `c′ ≥ c + |w′ − w|`; `N = 0`; `ζ = (1/2, e₁)` | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰`; empty determinant `1`; eigenvalue `1/2 − 1 = −1/2` | sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = 3·diag(4, 1) + 4[[0, 1], [1, 0]] = [[12, 4], [4, 3]]`; `(12 − 4λ)(3 − λ) − 16 = 4(λ − 1)(λ − 5)` | sound |
| §2.2 full symmetriser | `a = ∂_ρP/ρ`, `b = ∂_sP/ρ`, `d = 1 + b²/a`; `(1, 0)` | rows of `SMⁱ`: `(av, aρeᵢ, bv)`, `(aρeᵢ, ρv, bρeᵢ)`, `(bv, bρeᵢ, dv)`; `ad − b² = a`; minors `2, 2, 3 − 1 = 2`; `d = 1/2`: `1 − 1 = 0` | sound |
| §2.2 dominance, multiplicity zero | `(1, 3)`, `c = 2`; `ζ = (2, −1)`; `ζ = (−3, 1)` | minimum of `ζ₀ + v·ζ′ − c|ζ′|` on the cone: `(c′ − c − |v − w|)|ζ′|`; `2 − 3 − 2 = −3`; `σ = [[0, 4], [4, 0]]`, `det −16` | sound |
| §3.1 form, covectors, boost | `n = 2`, `c = 2`, `v = (1, 0)` | Gram determinant `−3 − 1 = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `−2`, `g⁻¹ = −4/4 + 1 = 0`, `ζ(1, 3, 0) = 0`; boost: `(1, 2, 0)`, `−4 + 4 = 0` | sound; agrees with LorentzianGeometry §7.3 |
| §3.3 half-space, slab control, expanding flow | `S = {x¹ > 0}`; field `(1, x²)`; `p = ρ²/2` | leftmost past point `x¹ − (v₀¹ + c₀)t`; `dφ = (−(v₀¹ + c₀), e₁)`: `ζ₀ + v·ζ′ = −c₀`, null; `x(s) = 1/(1/4 − s)`, `−4` at `1/2`, `−∞` at `1/4`; `ẏ = −(1 + t)^{−3/2}`, `x = 2√(1 + t) − (1 + t)`: `0.828` at `1`, `0` at `3` | sound |
| §3.3 past-closed restriction, idempotence, compact pasts | inextendible curve in `D′`; `q ∈ J⁻_D(p)`, `p ∈ D⁺_D(S)`; `q_m` escaping | its extension in `D` lies in `J⁻_D(q) ⊆ D′`; a curve from `q` prolongs one from `p`, so `q ∈ D⁺_D(S)`: `D⁺_D(S)` is past-closed in `D`; the limit curve on `(a′, t_p]`, `a′ ≥ t₀`, misses `Σ_{t₀}` | sound |
| §4.1 norms | `e^{−|x|²}`, `n = 2`; `cos x`, `Λ = 2πℤ` | `π/2 + π + 7π/2 = 5π`; `π + π = 2π`; Circle norm `2·4·(1/4) = 2`, ratios `π`, `2π`; torus norm `(1 + 4π²)/2` | sound |
| §4.2 embedding, interpolation | `e^{−x²}`; `u(λx)` | `1 ≤ √(π/2) ≈ 1.2533`; `2√(π/2) ≤ √5√(π/2)`; wrong pair: `λ^{1/2}` against `λ^{−1/3}λ^{1/2} = λ^{1/6}`; additive form `2·3^{1/4}(π/2)^{1/4} ≈ 2.947 ≥ 1.120`; `(3/4, 1/4)`: `λ^{−3/8 + 3/8} = λ⁰` | sound |
| §4.3 Gagliardo–Nirenberg, products, composition | `u(λx)`; `|x|^{−n/3}`; `sin(ms)`, `m⁻¹1_{[0,1]}` | both sides `λ^{i − ni/(2k)}`; wrong exponent ratio `λ^{−1/4}`: `2` at `1/16`, `1/2` at `16`; `∫ r^{−n/3−1} dr = ∞`; `sin 1 ≈ 0.8415` against `m·m⁻¹` | sound |
| §4.4 loss bound | `cos(mx)`; `e^{−x²}`; `k = 0` | `|1 − φ̂(εm)| ≤ εm∫|y|φ`; `‖w′‖₂ = (π/2)^{1/4} ≈ 1.1195`; at `k = 0` the factor tends to `1 > Cε` | sound; R01 |
| §4.4 Friedrichs commutator | `a = sin(x/2)`, `u = sin x`; `a = x` | `½[2φ̂(ε) − φ̂(3ε/2) − φ̂(ε/2)] = ½(μ₂ε²/2)(−2 + 9/4 + 1/4) = μ₂ε²/8` at `π`; `ψ = −zφ_ε`, `‖ψ′‖_{L¹} = ∫|φ + wφ′|` | sound |
| §5.3 estimate, forcing coefficient | `A⁰ = 1/(2 + u)`, `U = sin mx`, `W = (δ + t)(2 + sin mx)` | `A⁰(U)∂_tW = 1`; `S_m ≥ (1/3)πm⁴`; `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ 2m²/√6 = √(2/3)m²` | sound |
| §5.4 statement | regularised right side; Jordan block | `⟨J_ε(Aⁱ∂ᵢJ_εW), W⟩ = ⟨Aⁱ∂ᵢJ_εW, J_εW⟩`, so §5.1 applies to `J_εW`; `(g − th′, h)` leaves `Hᵏ` | sound |
| §6.1 lens uniqueness (headline) | `φ = 1 − |x| − t/2`, `a = 1`; cut-off `A⁰ = 2`, `λ = 1`; R02 instance | `−1/2 + 1 = 1/2 > 0`, bump support `(−1.1, −0.1)` meets `|x| < 0.55` at `0.9`; `1 + θ = 1.5` at `θ = 1/2`; transport is a system of §2.1 and not an Euler system | sound; R02 |
| §6.2 Theorem, expanding flow | `p = ρ²/2`, data on `(−1, 1)` | uniqueness on `|x| < 2√(1 + t) − (1 + t)`; frozen field would give `1 − t = 0` at `t = 1` against `0.828` | sound |
| §7.2 Euler (headline) | `p = ρ³/3`; `n = 3`; continuation | `c = ρ`, `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, least slope `−√2e^{−1/2}`, `T* = e^{1/2}/√2 ≈ 1.1658`, `ρ = (w₊ + 1)/2 ∈ [1, 3/2]`; `6 > 5`, `4 < 5`; if `∫‖∇U‖_∞ < ∞` and the range of `ρ` is compact in `I`, `|∂_tv| ≤ |v|‖∇v‖_∞ + C‖∇ρ‖_∞` bounds `v` | sound |
| §7.3 uniformly local | `p ∈ C_y ∩ C_{y′}`; `T`; `F = u/(1 − u)`; transport `a = 3` | `|x(t) − y′| < 1 − mt_p + m(t_p − t) = 1 − mt`; `mt ≤ 1/2`; exit time `−log U₀ − (1 − U₀)`: `0.4055 − 0.3333 = 0.0721` at `0`, `0.08664 − 0.08299 = 0.00365` at `10`; `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2` | sound |
| §8.1 developments | `S = ∅`; past-closed truncation; `(D, U) ≤ (D′, U′)` | some past-inextendible curve exists at every point, so `D = ∅`; `D⁺_D(S) ∩ D′ ⊆ D⁺_{D′}(S)`; a curve of `U′` leaving `D` above `t₀` is inextendible in `D` and misses `S` | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2` | `c = 1`; speeds `1, 3` and `−3, −1`; `T_L`, `T_R` disjoint for `t < 1`; `(2, 0)`: `0 < 1`, `0 > −1`, velocities `2 ≠ −2`; from `T_L ∩ T_R ∩ {t ≥ 1}` a `U₁`-curve has `x(1) < 0`, outside `T_R`: `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}` | sound |
| §8.2 `W₁₂ = W₂₁`, compatibility, criterion | first exit of a `U₂`-curve from `W₁₂`; `U_*` on `H_{t₀}` | `J⁻_{D₁}(p)` compact in `D₂`, `W₁₂` open by upper semicontinuity, so the exit time is `t₀`; `J⁻_{D₁}(p) ⊆ J⁻_{D₁∪D₂}(p) ⊆ D₂`; §6.2 with `O = H_{t₀}` gives `U = U_*` on `D` | sound |
| §8.2 a maximal development above `D₁` | `D* = T_L ∪ (T_R ∖ closure T_L)` | from `x_p > −1 + t_p` backward at speeds in `[1, 3]`: `x(s) > −1 + s`; the line `x = −1 + t`, `t > 1`, has `|1 − (−2)| = 3 > c` for the right state (timelike) but `D*` lies on both sides, so §8.4 does not apply | consistent with §8.4 |
| §8.3 (headline) | `S = E`; two extensions | `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`, so every development is compatible with the slab; `S = {x¹ > 0}`: `x¹ > (v₀¹ + c₀)(t − t₀)` | sound |
| §8.4 (headline) | (a) negation; constant state; expanding flow; `M = 5`, `1.05` | `Y = (1, v + cu)`, `|u| < 1`, `dφ(Y) → a − c|b| < 0`; `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `−18.2ε < x < 0.514ε`; `b = 0` gives `a > 0 = c|b|`, strict, excluded | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened this round and resolves to the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 527–529 ((1.10)), 536–544 ((1.12)–(1.13)), 606
  ((1.24)), 672–676 ((1.39)–(1.40)), 685, 816–822, 833–838 ((2.1)–(2.3)), 864–872, 872–880, 880–886.
- AbbresciaSpeck2022 lines 149–152 (`ℝ × 𝕋²`), 158–171 ((1.1a)–(1.3)), 172–179 (non-vacuum `H³`
  data), 408–414.
- LuoYu2023a lines 82–95 (`γ ∈ (1, 3)`, the acoustical metric); LuoYu2023b lines 417–419, 910.
- Christodoulou2019 lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (Definition 3.3,
  normalisation `c⁻²g`).
- LukNotes lines 679, 724, 1158, 1210, 1239, 1612, 1620; Nirenberg1959 line 318.
- EperonReallSbierski2019 lines 767, 1129–1132, 1178–1180, 1195–1198, 1338–1344, 1603–1605.
- BarGinouxPfaffle2007 lines 1006–1008, 3664–3667; Minguzzi2019 lines 1359–1364, 1917, 3576–3582,
  3716–3718; MinguzziCone2019 lines 680–683, 697–699, 1737–1740; Chrusciel2011 lines 534, 1169,
  1352, 1843–1848, 1859.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the pins of `lake-manifest.json`). All 53 name-and-line
pairs of the supplier contracts (20 of Mathlib, 33 of Tau Ceti) were printed by script at their
stated lines: each line is the named declaration (for instance `Matrix.PosDef` at
`Mathlib/LinearAlgebra/Matrix/PosDef.lean:176`, `HasFTaylorSeriesUpToOn.comp` at
`Mathlib/Analysis/Calculus/ContDiff/FaaDiBruno.lean:1051`, `TauCeti.Wkp.toZeroAtInfty` at
`TauCeti/Analysis/Sobolev/BesselPotential/Embedding.lean:194`, `TauCeti.CircleSobolev.norm_sq_eq_tsum`
at `TauCeti/Analysis/Sobolev/Circle/Basic.lean:375`). `LocallyLipschitzOn` is at
`Mathlib/Topology/EMetricSpace/Lipschitz.lean:72`.

By object at the pins, module docstrings read: `TauCeti/Analysis/Sobolev/Wkp/Multiplication.lean`
and `W1p/Multiplication.lean` (multiplication by a smooth bounded factor, not two Sobolev factors),
`Wkp/Leibniz.lean` (weak gradient and Hessian of `ζu`, `ζ` smooth), `Wkp/Mollification.lean` and
`Mollification/Basic.lean`, `Mollification/Lipschitz.lean` (interior mollification of weak
derivatives; no commutator estimate), `EvolutionSpace/Basic.lean` (the parabolic Gelfand-triple
energy space, with the time derivative in `V*`; not the class of §5.1), `Translation.lean` (R01).
No symmetric hyperbolic system, Moser product, commutator or composition estimate in `Hᵏ`,
Friedrichs lemma, partially periodic Sobolev space or causal curve exists in either library
(`TauCeti/Analysis/Calculus/Moser.lean` is Moser's deformation of forms; the Gagliardo–Nirenberg
statements of `TauCeti/Analysis/Sobolev/Embedding.lean` are the Sobolev inequality, not the
interpolation between `L^∞` and `Hᵏ`), as the README says.

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder, head `fc070ae`): §6.1, §6.3 (the
  hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `B`, inverse, `g(X, B) = −c² dt(X)`,
  causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff `|Y − v|_h ≤ |c|`), §8.2, §9.2, §11.4
  (arc-length limit curves), §12.6 (`TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`,
  `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, monotonicity, concatenation, time functions
  with the extension form and one-point intervals, the slab identity,
  `futureDomainOfDependenceIn_self`, coverings) and §12.7 were read and state what the README
  assumes or compares with. Its Scope puts "the compressible Euler equations, their states,
  developments and maximal developments" outside it, and its Downstream consumers give the fluid
  side, developments, their uniqueness and local well-posedness to the hyperbolic-PDE roadmap.
- **SymmetricHyperbolicSystems** (open pull request adding the folder, head `6a5cca3`): §1.2
  (`LinearSystem n N`, `apply`, `IsSymmetricHyperbolic S λ`), §2.1 (the same `K`), §2.2 (single
  speed `c ≥ 0`, `F = 0` on the cone, smoothed weight), §2.3, §7.3 (`C_b^∞` coefficients, smooth
  compactly supported data) resolve. Its Scope puts quasilinear systems and the `Hˢ` theory outside it.
- **PDE** (main, `1a19c9f`): §1.3, §1.4, Layer 7 with §7.1–§7.3 and "every statement below is
  scalar" resolve (README lines 769, 803, 2661–2785, 118); its Layer 9 is quasilinear elliptic
  existence. Nothing of it is consumed.
- **IncompressibleFlows** (open; on the never-cite list) and **RelativisticQuantumFieldTheory**
  (open; RQFT1): named as boundaries only, never in a `*Needs:*` line or a contract; Layer 0 with
  `UnitAddTorus d` and RQFT1 exist at their heads.
- By object over main and the open heads (`roadmaps grep`): quasilinear symmetric hyperbolic
  systems, Moser estimates, equations of state, maximal developments and Friedrichs mollifiers have
  no other owner (the other hits are LorentzianGeometry's hand-over sentences, SymmetricHyperbolicSystems'
  exclusion, and PositiveMass on main, which uses a tangential Friedrichs mollification inside one
  regularity proof and states no mollifier target). No roadmap cites CompressibleEulerEquations.
- Overlap facts (`roadmaps overlaps`, run again): the roadmap is neither on main nor in an open
  pull request, so there is no second copy, no other pull request changes it, no cited id is
  dropped and none is defined only by an open revision.
- Citation leads: `roadmaps resolve`, run again, lists nothing; the worker's one lead
  (`LinearSystem.IsSymmetricHyperbolic`) is the supplier's declaration (SymmetricHyperbolicSystems §1.2).

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE (main, and its open revision by search), SobolevPolynomialApproximation, RiemannianGeometry; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; null `C¹` horizons of `D⁺_U(S)` in a fixed spacetime — owner LorentzianGeometry §12.7, with the boundary of a maximal development owned here and the difference stated in §8.4; the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here and the full-rank comparisons Checks of §4.1; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers (LorentzianGeometry §6.1, §6.3, §7.3,
§8.2, §12.6; SymmetricHyperbolicSystems §1.2, §2.1); §9.2, §11.4 and §12.7 of LorentzianGeometry are
comparisons only and add no edge. No notion was moved down this round. Ownership against the open
pull requests was checked through `roadmaps show` and `roadmaps grep` at their heads.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every definition has at least three Checks; every theorem has a locator or
  says it is proved here.
- Organisation: the layers are worked back from the developments theorems (equations, carrier,
  causal geometry, Sobolev calculus, linear energy method, uniqueness, well-posedness,
  developments); none is named after a source's chapter and the README does not say it follows one.
- Headline theorems (How to read the build): §7.2, §6.1, §8.2–§8.3, §8.4. There is no
  `Suggested.lean` at this stage, so statability, padding and the backticked-name check have no
  Lean file to run on; every backticked identifier of the README is a library or supplier
  declaration and none is presented as this roadmap's own. R02 is about the sentence that lists the
  definitions the headlines need.
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); the nine matches of "lemma" are Zorn's, Friedrichs' and a source's Lemma 6.8.
- `design/plan.json`: parses; 8 layers, 53 targets (36 theorems, 12 definitions, 4 constructions,
  1 example), every definition and construction with at least three tests, no dangling `target:`
  prerequisite, roadmap prerequisites LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §12.6 and
  SymmetricHyperbolicSystems §1.2, §2.1, `gaps: []`; targets 3.2.3, 6.2.1, 7.1 and 8.4.1 agree with
  the repaired README. `sources.toml`: parses; 21 entries, the 21 keys of the References.

### Copyright

Wording: thirteen passages set beside their sources: the definition of a development against
ChristodoulouMiao2014 lines 866–872; the classical uniqueness claim against lines 875–880; the
equation of state against AbbresciaSpeck2022 lines 165–171; the well-posedness sentence of §7.2
against lines 175–179; `D⁺_D(S)` against Minguzzi2019 lines 3576–3578, MinguzziCone2019 lines
1737–1740, BarGinouxPfaffle2007 lines 1006–1008 and Chrusciel2011 lines 1843–1848; the embedding
and the composition estimate against LukNotes lines 1210–1212 and 1612–1615; the uniqueness
criterion against EperonReallSbierski2019 lines 1338–1344; the regular boundary against
Christodoulou2019 lines 130–138; the half-space configuration against LuoYu2023b lines 417–419.
Longest shared run: five words ("the union of all developments"), where the README reports the
source's claim in order to refute it. No table, figure, exercise or data set is taken over.

Arrangement: 109 locators in the body; ChristodoulouMiao2014 and Majda1984 have 17 each (then
AbbresciaSpeck2022 9, LukNotes 8). ChristodoulouMiao2014's contents (lines 338–396: the Euler
equations and the acoustical metric; the null foliation; structure equations; curvature; the
fundamental energy estimate; commutation fields; estimates of each order; …): only its §1.1, §1.3
and §2.1 meet Layer 1, §3.1 and §8.1; Layers 2 and 4–7 have no counterpart, and no run of layers
follows its chapters.

Source independence: 13 passages compared with 10 sources, none shared; largest share ChristodoulouMiao2014 and Majda1984, 17 of 109 locators each; contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1,
  Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they are
  cited for (§2.1, §2.2, §§4.2–4.4, §§5.1–5.4, §6.1, §6.2, §§7.1–7.3) were checked mathematically,
  not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators not
  checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §3.2 (limit curves), §3.3 (openness), §6.2 (the sweep), §7.1 (the iteration and
  the Bona–Smith step) and §8.4 (b) (the extension lens) have no source theorem at this generality
  in a readable text; they were checked step by step by hand and on the instances of the table.
- The pinned declarations were compared by name and line and, for the Sobolev files listed above,
  by module docstring; their bodies were not unfolded.
- Nirenberg1959 line 318 is an OCR text: the heading of the Theorem is legible, its displayed
  inequality is not; the exponents of §4.3 were checked by scaling instead.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders and are absent from `merge-order/ORDER.txt`; the dependency check draws no edge to them.
- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry's Downstream consumers also assign "characteristic for `□_g` iff null" and characteristic data to the hyperbolic-PDE roadmap; this design states the Euler-symbol form (§3.1) and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2b4da02c2ab4957b507c981e4bb82c0b9f5a5541", "job": "REV-DESIGN-CompressibleEulerEquations~9", "model": "fable", "worker": "chris-x81"} -->
