<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6903495679 -->
Review (claude) of f84617a

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Tau Ceti's circle algebra and Nemytskii map are special cases of §4.3 that the README does not record

   **Location.** `packages/CompressibleEulerEquations/design/README.md` lines 69–73, Scope: "Tau Ceti
   also has three special cases of Layer 4: the product on `W^{1,p}(ℝⁿ)` for `p > n` …, the scalar
   weak chain rule …, and the additive interpolation inequality"; lines 333–339, the contract for
   `TauCeti.CircleSobolev`, which names the space only.

   **Claim.** The count of pinned special cases is three, and the circle space carries nothing that
   Layer 4 restates.

   **Witness.** At the pin, `TauCeti.CircleSobolev.norm_mul_le`
   (`TauCeti/Analysis/Sobolev/Circle/Algebra.lean:288`): for `s > 1/2`, `‖a * b‖ ≤ C_s‖a‖‖b‖`, the
   product being pointwise (`toContinuousMap_mul`, line 300); and
   `TauCeti.CircleSobolev.toContinuousMap_nemytskii` (`Circle/Nemytskii.lean:431`). These are the case
   `n = 1`, `Λ = Tℤ` of §4.3.

   **Exact repair.** In the Scope sentence write "five special cases" and add: "and, on the circle,
   the algebra property of `TauCeti.CircleSobolev s A` for `s > 1/2` and the action of holomorphic
   functions on it". In the `TauCeti.CircleSobolev` contract add: "`TauCeti.CircleSobolev.norm_mul_le`
   (`TauCeti/Analysis/Sobolev/Circle/Algebra.lean:288`) and
   `TauCeti.CircleSobolev.toContinuousMap_nemytskii` (`TauCeti/Analysis/Sobolev/Circle/Nemytskii.lean:431`)
   are the case `n = 1`, `Λ = Tℤ`, complex values, of the algebra property and of the composition
   statement of §4.3, up to the norm equivalence of §4.1; §4.3 states the tame bounds with `L^∞`
   factors, every `n`, period groups of every rank, and real `Φ` that is only smooth on an open
   `G ⊆ ℝ^N`." Add the two names to the `*Needs:*` paragraph of §4.3 beside the `W1p` ones. Tested on
   the instance: for `n = 1`, `Λ = 2πℤ`, `k = 1`, `2k = 2 > 1 = n` and `s = 1 > 1/2`, so both
   statements apply to `cos x · cos x`; the pinned one gives a bound by `‖a‖‖b‖` only, not the
   `‖f‖_∞‖g‖_{Hᵏ}` form §5.3 uses, so §4.3 is kept.

2. **F02** (P3) the Friedrichs commutator estimate of ComplexKahlerGeometry §5.7 is not named as a boundary

   **Location.** `packages/CompressibleEulerEquations/design/README.md` lines 64–134 (Boundaries) and
   lines 1162–1167, §4.4: "Friedrichs' lemma: for `a` bounded, Lipschitz and Λ-periodic …
   `‖J_ε(a∂ᵢu) − a∂ᵢJ_εu‖_{L²_Λ} ≤ C(‖a‖_∞ + Lip a)‖u‖_{L²_Λ}`".

   **Claim.** Scope and ownership names every roadmap that states a neighbouring form of a kept
   target, with the difference in one clause.

   **Witness.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` lines 1964–1968 (on main, §5.7):
   commutators `[P, J_ε] : H^r → H^{r−1}`, uniform for `0 < ε ≤ 1`, for a chart-localised
   second-order `P` with smooth matrix coefficients and a convolution regulariser.

   **Exact repair.** Add a Boundaries bullet: "**Commutators with mollifiers.** ComplexKahlerGeometry
   §5.7 proves, on the Bessel scale of every real order, that `[P, J_ε]` is bounded from `H^r` to
   `H^{r−1}` uniformly in `ε` for a chart-localised second-order operator `P` with smooth matrix
   coefficients. Friedrichs' lemma of §4.4 is the first-order `L²` statement for a coefficient that is
   only bounded and Lipschitz, on `E/Λ`; the coefficients `Mⁱ(U)` of §5.3 are not smooth, so neither
   statement gives the other, and nothing of that roadmap is consumed." Tested on the instance that
   separates them: `a = |sin x|` on `Λ = 2πℤ` is bounded, Lipschitz with constant `1` and periodic, so
   §4.4 applies, while it is not `C¹` at `x = 0` and the smooth-coefficient statement does not.

3. **F03** (P3) §5.3 and §7.1 use the composition estimate of §4.3 without its hypothesis `Ū ∈ K`

   **Location.** `packages/CompressibleEulerEquations/design/README.md` lines 1382–1383, §5.3: "a
   compact `K ⊆ G` and a constant state `Ū`; constants `C` below depend only on `K`, the system, `n`,
   `k` and `Λ`"; lines 1658–1659, §7.1; lines 1741–1745, the compact `K` of the route of §7.2.

   **Claim.** The routes of §5.3 and §7.1 bound `A⁰(U)⁻¹ − A⁰(Ū)⁻¹` and `A⁰(U^m) − A⁰(Ū)` by the
   composition estimate of §4.3, whose statement (line 1073) assumes `Ū ∈ K`.

   **Witness.** `Λ = 2πℤ`, `n = 1`, `I = (0, ∞)`, data `(ρ̄, v̄) ≡ (1, 0)`, `[ρ_*, ρ^*] = {1}`,
   background `(5, 0)`: `‖ρ̄ − 5‖² = 16·2π = 32π`, so §7.2 applies, yet `K = {1} × B̄(0, CM) ∌ (5, 0)`.
   With `Φ(y) = y³`, `K = {0}`, `Ū = 10`, `δ = 1`: ratio `1000/10 = 100` against the stated constant
   `max(3, 0) = 3`.

   **Exact repair.** State the hypothesis where it is used; nothing is lost, since a compact `K ⊆ G`
   may be enlarged by the point `Ū ∈ G`. §5.3: "a compact `K ⊆ G` and a constant state `Ū ∈ K`".
   §7.1: "a compact `K ⊆ G` containing `Ū`". §7.2, route: "`K = ([ρ_*, ρ^*] ∪ {ρ₀}) × B̄(v₀, CM)`"
   and, for the full system, "`K = {(ρ, v, s) : (ρ, s) ∈ L ∪ {(ρ₀, s₀)}, |v − v₀| ≤ CM}`"; add to the
   last Check of §7.2 that for full-rank `Λ` the background need not lie in `L`, which is why it is
   adjoined. Plan targets 5.3 and 7.1 gain the hypothesis `Ū ∈ K`, and target 7.2 the same two sets.
   Tested on the witness: `K = {1, 5} × B̄(0, CM)` is compact, lies in `G = I × E` and contains
   `(5, 0)`; it is not convex, which the secant bound of §4.3 allows. Every Check of §§4.3, 5.3, 7.1
   and 7.3 already has `Ū ∈ K` (`Ū = 0` in `[−1, 1]`, `[0, 2]`, `[−1, 0]`; `(1, 0)` on the unit
   circle; `(Ū, 0) ∈ K′ × [0, 1]`). The displayed inequalities of §5.3 remain true as stated: their
   proofs use derivatives of `U` and the vanishing of `A⁰⁻¹F` at `Ū` only.

The three round-16 findings are repaired and the repairs are sound. This round found no false,
vacuous or overclaimed statement, no upward or cyclic supply and no unowned prerequisite. Three
findings remain, all P3 and none blocking, each with a written repair: R01 to R03. Because each
asks for a repair, the verdict asks for changes rather than accepting. No supplier gap is declared
(`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`). This review changed no file of the design and did not
touch the manifest. Elaboration: not available (this lane does not elaborate); the design stage has
no `Suggested.lean`, so the one-tactic probe and the `#check` comparison had nothing to run on. No
maintainer note was left for this roadmap. No text read contained instructions.

## Verified sound

### The round-16 findings, checked first

| Round-16 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) §7.2: the full-system background is not introduced | Lines 1733–1738: "a background `(ρ₀, v₀, s₀)` with `(ρ₀, s₀) ∈ 𝒪` and `v₀ ∈ E` in place of `(ρ₀, v₀)`, and data `(ρ̄, v̄, s̄)` with `s̄ − s₀ ∈ Hᵏ_Λ` as well"; route, lines 1743–1745: "`Ū = (ρ₀, v₀, s₀)`, which lies in `G` because `(ρ₀, s₀) ∈ 𝒪`"; new Check, lines 1764–1770; plan target 7.2 has the two hypotheses and the test `full_background_outside_states` | **Repaired** |
| F02 (P3) `*Needs:*` of §5.3 and §7.1 omit §2.1 | Line 1440: "§2.1 (the system), §§4.1–4.3, §4.4 …"; line 1718: "§2.1 (the system and the dominating cone map `κ`), §§4.1–4.4, §§5.1–5.4, §6.2"; plan targets 5.3 and 7.1 list `target:2.1` and `target:4.1`. The same pattern was repaired in §5.4, §6.1, §7.2, §7.3, the Layer 7 Dependencies and "How to read the build" | **Repaired** |
| F03 (P3) §1.3: "interval" should be "open interval" | Line 507: "on each open interval `J` with `J × {s₀} ⊆ 𝒪` containing `ρ(D)`" | **Repaired** |

Recomputed on the witnesses. F01: `s₀ = 5` gives squared norm `(81/4)·2π = 81π/2` and
`(1, 5) ∉ (0, ∞) × (0, 1)`, excluded; `s₀ = 1/2` gives `Ū ∈ G`. For `Λ` not of full rank,
`s̄ − s₀ → 0` orthogonally to the span, so `(ρ₀, s₀)` is a limit of values in the compact `L`. The
criterion with `∇(ρ, v, s)` is what §7.1 gives for `U = (ρ, v, s)`; `v` stays bounded because
`|Bv| ≤ C‖∇(ρ, s)‖_∞` is integrable in time. F02: each added item exists and is earlier in the
build (§2.1, §3.1, §4.1, §§1.1–1.3, SymmetricHyperbolicSystems §1.2); the dependency check is
below. F03: `J = [1, 2]` is excluded, `(1/2, 3)` qualifies. The repaired pattern of F01 (a constant
state used without membership) led to R03; the repaired pattern of F02 was read on all 25
`*Needs:*` lines and found nowhere else. The diff between the two heads touches only these
passages and plan targets 5.3, 5.4, 7.1, 7.2, 7.3.

### Adversarial table

Recomputed by hand this round; coordinates `(t, x)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 equations of state | `p = ρ²/2` at `4`; ideal gas at `(1, 0)`; Chaplygin; `p = −ρ²` | `c² = 4`, `c = 2` against `p′ = 4`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0` | sound |
| §1.2 barotropic system | expanding flow `n` general and `n = 1`, `t = 1`; boost `w = 1`; `(1 + t, 0)` | `∂_tρ = −nρ/(1 + t)`, `ρ div v = nρ/(1 + t)`; `−x/4 + x/4 = 0`; `∂_tṽ = −(1 + y)/(1 + t)²`, `ṽ∂_yṽ = (1 + y)/(1 + t)²`; wrong rule residual `−1/(1 + t) = −1/2`; `1 ≠ 0` | sound |
| §1.3 full system | entropy wave; reduction on closed `J` | `P = e^x e^{−x} = 1`; wrong momentum `−e^{x/2}`; `[1, 2]` is no interval of §1.1 | sound |
| §2.1 carrier (sampled) | monotonicity; `κ`; wave system; transport `a = 3`; `N = 0` | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰`; eigenvalues `ζ₀ ± |ζ′|`, `−1/2` at `(1/2, e₁)`; cone `1 ≥ 1`, symbol `−2`; empty determinant `1` | sound |
| §2.2 symmetrisers | `ρ = 1`, `c = 2`, `v = 3`; full `S`; `S Mⁱ`; dominance | `4λ² − 24λ + 20 = 4(λ − 1)(λ − 5)`; minor `∂_ρP/ρ`, `det S = 3 − 1 = 2`, `d = 1/2` gives `0`; entries `(ρ, vⁱ) = (vⁱ, ρ) = ∂_ρP`, `(vⁱ, s) = (s, vⁱ) = ∂_sP`; `c′ − |v − w| ≥ c`, `2 − 3 − 2 = −3` | sound |
| §3.1 acoustical form (sampled) | `n = 2`, `c = 2`, `v = (1, 0)`; covector `(−3, 1, 0)`; covariance | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −4`; `−4 + 4 = 0`, `−4 + 9 = 5`; `ζ₀ + v·ζ′ = −2 = −c|ζ′|`, `ζ(1, 3, 0) = 0`; `ξ + τw − τv` gives `g_{c, v−w}`; wrong form `−3` | sound |
| §3.2 causal curves (sampled) | field `(1, x)`; Cantor curve; integral form | `|3e^{3t} − e^{3t}| = 2e^{3t}`, `0.0996` at `t = −1`; `10 > 1`; both directions of the iff by integration and Lebesgue differentiation | sound |
| §3.3 pasts and `D⁺` (sampled) | past-closed restriction; half-space; expanding flow; punctured domain | an extension in `D` lies in `J⁻_D(p) ⊆ D′`; `x¹ − (v₀¹ + c₀)t > 0`; `y = −1 + 2(1 + t)^{−1/2}`, `x = 2√(1 + t) − (1 + t)`, `0` at `t = 3`, `0.828` at `t = 1`; `D = H₀ \ {(1, 0)}`: `D⁺ = H₀ \ {t ≥ 1, |x| ≤ t − 1}`, open | sound |
| §4.1 `Hᵏ_Λ` (sampled) | `e^{−|x|²}`, `n = 2`; cylinder; circle | `π/2 + π + 7π/2 = 5π`; `√(π/2)·π`; `2·4·(1/4) = 2` against `2π`, `1` against `2π` | sound |
| §4.2 embeddings, interpolation (sampled) | `e^{−x²}`; dilations; additive form; transfer to `Λ ≠ 0` | `1 ≤ 1.2533`; `λ^{1/2}` against `λ^{1/6}`; `2·3^{1/4}(π/2)^{1/4} = 2.947 ≥ 1.120`; `‖χu‖_{L²(E)} ≲ ‖u‖_{L²_Λ}` carries the product form | sound |
| §4.3 Gagliardo–Nirenberg, Moser | scaling; sphere map; `Φ = y³` with `Ū ∉ K` | both sides `λ^{i − ni/(2k)}`, ratio `2` at `1/16`; `π²(4π − 4π/3) = 8π³/3`, mean `(0, 0)`; `100 > 3` | sound; R01, R03 |
| §4.4 mollifiers | `u = 1`; loss at `k = 0`; `a = |sin x|` | `1 ≤ C/ε` false at `ε = 2C`; `|1 − φ̂(εm)| → 1`; Lipschitz `1`, not `C¹` | sound; R02 |
| §5.1 energy identity (sampled) | derivation; `B = bI`; Jordan block; `A⁰ = √(1 + x²)` | `dE/dt = ∫⟨∂_tA⁰W, W⟩ + ∫⟨∂ᵢAⁱW, W⟩ − ∫⟨(B + Bᵀ)W, W⟩ + 2∫⟨LW, W⟩`; `e^{−2bt}`; `W₁ = g − tf′`; `π`, `π/8`, `2 asinh R` | sound |
| §5.2 weighted energies (sampled) | derivative of `E_χ`; moving cone; transport; speeds | `∫⟨σ(dχ)W, W⟩ + ∫χ(⟨KW, W⟩ + 2⟨LW, W⟩)`; `M − e·w + w·e = M ≥ M|e|`; `−1 − sign x ≤ 0`, `−1/2 + 1 = 1/2`; `(c, ±ω)` on the cone; symbol `−1/2` at `(1/2, −1)` | sound |
| §5.3 `Hᵏ` estimates | forcing Check; `Ū ∉ K` | `S_m ≥ πm⁴/3`, `C₁ ≥ 2m²/√6 = √(2/3)m²`; forcing bound by `max(sup_{K_δ}|Dg|, sup_K|g|/δ)` since `g(Ū) = 0` | sound; R03 |
| §6.1 lens uniqueness (headline, sampled) | cutoff; non-periodic pair; dominance | `λI + θ(A⁰ − λI) ≥ λI`, `1.5` at `θ = 1/2`; `g′·(1 + x²·(−1/x²)) = 0`, `0.9 − 0.3 = 0.6`; `σ(−(M − e·w, e)) ≤ 0` | sound |
| §6.2 domains of dependence (sampled) | sweep margins; slab form | base of a step: ball of radius `(c + 2ε)h` about `x − hv`, within `r + 3εh` of the past; `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`; `1.4 < 1.5 < 1.6` | sound |
| §7.1 well-posedness (sampled) | Burgers; `λ`-family; compact range | `√2 e^{−1/2}`, `T* = 1.6487/1.4142 = 1.1658`; `0.1166`, `3·1.2533·10³ = 3760`; range closure is `U(E) ∪ {Ū}` per time, compact in `G` | sound; R03 |
| §7.2 compressible Euler (headline) | simple wave; background `s₀ = 5`, `1/2`; `ρ₀ = 5` | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* = 1.1658`, `ρ ∈ [1, 3/2]`; `81π/2`, `(1, 5) ∉ 𝒪`; `32π`, `(5, 0) ∉ K`; `6 > 5`, `4 < 5` | sound; R03 |
| §7.3 uniformly local data (sampled) | gluing; edge Check; switched symbol; cutoff | `mt ≤ 1/2 < 1`, speed `≤ m` keeps the past in `C_{y′}`; `0.4055 − 0.3333 = 0.0721`; `−2 + 3 = 1 ≥ 1`, entry `−2`; `1 + 3/2 = 5/2 ∉ (0, 2)` | sound |
| §8.1 developments | truncation; `S = ∅` | restriction gives `D′ ⊆ D⁺_{D′}`; every point carries a past-inextendible curve, so `D⁺_D(∅) = ∅` | sound |
| §8.2 developments (headline, sampled) | `W₁₂ = W₂₁`; union; counter-flow; criterion | the times at which a `U₂`-curve lies in `W₁₂` are open (semicontinuity of `J⁻`) and closed (compact past); a curve leaving `D₁` above `t₀` misses the data; speeds `[1, 3]`, `[−3, −1]`, towers overlap iff `t > 1`, `2 ≠ −2` at `(2, 0)`; `J⁻_D(p) ⊆ H_{t₀}` | sound |
| §8.3 existence (headline) | largest in `O`; `S = E` | `J⁻_{D′}(p) ⊆ D′ ⊆ O`; `J⁻ ⊆ {t ≤ t_p} ⊆ O`, so every development is compatible with the slab | sound |
| §8.4 regular boundary (headline) | constant state; expanding flow; lens bound | `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `1.945x < ε`, `0.055|x| < ε`, so `|x| < 18.2ε` | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. For the fifteen sampled sections every locator into
a readable text was opened this round and carries the stated object (50 locators in 13 texts):

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 530–544, 606 ((1.24)), 672–676
  ((1.39)–(1.40)), 685, 818–822, 833–838 ((2.1)–(2.3)), 864–872, 872–880.
- Christodoulou2019 lines 124–126, 130–138; AbbresciaSpeck2022 lines 149–152, 158–164, 165–171,
  172–179, 408–414; LuoYu2023a lines 82–95 (the range of `γ` at line 88); LuoYu2023b
  lines 417–419, 910; LukSpeck2018 lines 1999–2008 (the normalisation `c⁻²g`).
- LukNotes lines 679, 724, 1158, 1210, 1239, 1612 (with `F(0) = 0`), 1620; Nirenberg1959 line 318
  (Lecture II headed at line 258; the exceptional cases at lines 325–329 do not meet `q = ∞`,
  `r = 2`, `a = i/k`, `i ≥ 1`).
- EperonReallSbierski2019 lines 767, 1129, 1178, 1195, 1338, 1342, 1603; BarGinouxPfaffle2007
  lines 1006–1008, 3664; Minguzzi2019 lines 1359–1364, 1917, 3576–3582, 3716–3718;
  MinguzziCone2019 lines 680–718 (page 17, between the markers at 673 and 720), 1737–1740;
  Chrusciel2011 lines 534, 1169, 1352, 1843–1848, 1859.

`sources.toml`: 21 entries, the 21 keys of the References (14 certified, 3 uncertified, 4 waived),
no local path; unchanged by this review. Speck2016 is cited once, under Downstream consumers.

### Pinned declarations opened

Mathlib and Tau Ceti at the pins of `lake-manifest.json`. All 58 name-and-line pairs of the two
supplier-contract lists were tested by script at their stated lines: all match (22 in Mathlib, 36
in Tau Ceti, among them `LipschitzWith.integral_lineDeriv_mul_eq` at
`Mathlib/Analysis/Calculus/Rademacher.lean:170`, `zorn_le_nonempty₀` at `Mathlib/Order/Zorn.lean:126`,
`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` at
`TauCeti/Analysis/Sobolev/Wkp/Interpolation.lean:335` and
`TauCeti.le_mul_exp_of_le_add_mul_integral` at `TauCeti/Analysis/ODE/Gronwall.lean:59`).
`LocallyLipschitzOn` is at `Mathlib/Topology/EMetricSpace/Lipschitz.lean:72`. By object, the pinned
Tau Ceti Sobolev tree was read file by file for what Layer 4 states: `Wkp/Multiplication.lean`
(smooth factor on `W^{k,p}_0`), `Wkp/Leibniz.lean` (smooth factor, orders one and two),
`Wkp/Mollification.lean` and `Mollification/` (interior derivative identities, Lipschitz
mollification), `W1p/Multiplication.lean` (smooth cutoff), `EvolutionSpace/` (parabolic Gelfand
triples): none states a Moser, commutator or Friedrichs estimate. `Circle/Algebra.lean` and
`Circle/Nemytskii.lean` do state special cases: R01. No symmetric hyperbolic system, acoustical
form, equation of state or domain of dependence exists in either library.

### Duplication and supplier-order audit

- **SymmetricHyperbolicSystems** (open pull request adding the folder; README and `Suggested.lean`
  read at its head): Conventions *Propagation speed* as quoted; §1.2 `LinearSystem n N`,
  `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic` (declared in namespace `LinearSystem`),
  the speed `√n M/λ`; §2.1 the pointwise identity with `K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ` on
  `(0, T) × ℝⁿ`; §2.2 a static cone of one speed with `F = 0` on it; §2.3; §7.3. Its scope leaves
  quasilinear systems and the `Hˢ` theory outside, and its Downstream consumers name the
  quasilinear Cauchy problem. All as cited.
- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1
  (`minkowskiForm`), §6.3 (the hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form,
  `g(B, B) = −c²`, `g(X, B) = −c² dt(X)`, inverse, causal `∂_t + Y` iff `|Y − v|_h ≤ |c|`, causal
  vectors have `dt(X) ≠ 0`, the fluid side handed to a hyperbolic-PDE roadmap), §8.2, §8.3, §9.2
  (`g⁻¹(du, du) = 0`), §11.4, §12.6 (the four declarations, `S ∩ D ⊆ D⁺_D(S)`, monotonicity,
  concatenation, time functions with the extension form and one-point intervals, the slab
  identity, determination, coverings), §12.7 exist and say what the README says. The five cited
  names are declared in its `Suggested.lean`.
- By-object searches over main and the open heads (`roadmaps grep`, this round): "quasilinear
  symmetric hyperbolic", "sound cone", `CompressibleEuler`: no match; "maximal development",
  "acoustical", "equation of state": LorentzianGeometry only, as the consumer it names;
  "compressible Euler": LorentzianGeometry and IncompressibleFlows, as boundaries; "symmetric
  hyperbolic", "domain of dependence": the two suppliers; "Gagliardo": the embedding
  `W^{1,p} ↪ L^{p*}` in PDE, IncompressibleFlows and PositiveMass, a different inequality;
  "Moser", "tame estimate", "uniformly local": unrelated uses; "Friedrichs": ComplexKahlerGeometry
  §5.7 (R02) and a proof step of PositiveMass that is no target.
- Overlap facts (`roadmaps overlaps`, this round): no roadmap of this name on main or in an open
  pull request, so no second copy, no other pull request changing it, no dropped id and no id
  defined only by an open revision. The worker's one lead, `LinearSystem.IsSymmetricHyperbolic`,
  is the supplier's declaration, not a pinned name: no finding.
- Ownership against open pull requests was checked with the tools above; the two suppliers are
  not among the 231 names of the brief's list and were read through `roadmaps show`.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE, RelativisticQuantumFieldTheory, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; limit curves and null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §11.4 and §12.7, the time-parametrised statements on a domain and the boundary of a development owned here with the differences stated in §3.2 and §8.4; the linear carrier, its predicate, its speed and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check (the brief's command, run this round):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2239 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers. None of the roadmaps that may never be
cited as suppliers is cited as one (IncompressibleFlows is a boundary only). No notion was moved
down.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References; 25 sections, each with Checks; every theorem has a locator or says it is
  proved here.
- Organisation: the layers are worked back from the developments theorems; no layer is named
  after a source's chapter and the README does not say it follows a source.
- Headlines ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4; all are in the table above. No
  `Suggested.lean` exists at this stage; every backticked identifier is a library or supplier
  declaration, resolved above.
- Style (pattern search, this round): no LaTeX delimiters, pull-request numbers, dates, HTML,
  machine paths or process words; "lemma" occurs only in Zorn's and Friedrichs' lemma.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions, 4 constructions,
  1 example); every definition and construction has at least three tests, every theorem a
  locator, no dangling `target:` prerequisite, `gaps: []`.

### Copyright

Wording: thirteen passages set beside their sources: the equation of state (AbbresciaSpeck2022
lines 165–171); the Euler systems (ChristodoulouMiao2014 lines 481–529, 833–838); entropy
propagation (lines 530–544); the definition of a development (lines 864–872); the classical
uniqueness claim (lines 875–880); the regular boundary (Christodoulou2019 lines 130–138); §7.2
(AbbresciaSpeck2022 lines 172–179); the half-space configuration (LuoYu2023b lines 417–419);
`D⁺_D(S)` (Minguzzi2019 lines 3576–3578, BarGinouxPfaffle2007 lines 1006–1008, Chrusciel2011
lines 1843–1848, MinguzziCone2019 lines 1737–1740); the Lipschitz parametrisation (Minguzzi2019
lines 1359–1363); the uniqueness criterion (EperonReallSbierski2019 lines 1342–1344); the
composition estimate (LukNotes lines 1612–1615); the interpolation theorem (Nirenberg1959
lines 318–329). Longest shared run: five words ("the union of all developments"), where the
README reports the claim it refutes. No table, figure, exercise or data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16,
AbbresciaSpeck2022 and LukNotes 8 each. The contents of ChristodoulouMiao2014 (from line 338) are
chapters on the acoustical structure equations, curvature, energy estimates and commutation
fields of shock formation; only its Chapters 1–2 meet Layer 1, §3.1 and §8.1, and no run of
layers follows its chapters.

Source independence: 13 passages compared with 11 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984, Kato1975, Dafermos2016: settled as uncertified; cited by locator, text not read. The
  statements they are cited for (§§2.1, 4.2–4.4, 5.1–5.4, 7.1, 7.3) were checked mathematically,
  not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators not
  checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §3.2 (limit curves), §6.2 (the sweep), §7.1 (the iteration and the Bona–Smith
  step) and §8.4 (b) (the extension lens) have no source theorem at this generality in a readable
  text; they were checked on the instances of the table, not proved in full.
- The IncompressibleFlows and PDE norm conventions behind two Checks of §4.1 were not re-read
  this round; those roadmaps are not suppliers.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt`, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry §7.3 hands "the fluid side" to a hyperbolic-PDE roadmap named under its Downstream consumers; this design takes that role and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f84617a4f9500d0cf788e18a000f7e02214eb487", "job": "REV-DESIGN-CompressibleEulerEquations~17", "model": "fable", "worker": "chris-x88"} -->
