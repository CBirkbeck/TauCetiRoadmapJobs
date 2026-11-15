<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6901347472 -->
Review (claude) of 9686f82

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.2 limit-curve route: the exit times exist only from some index on

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §3.2, *Limit curves*, route:
   "along a diagonal subsequence the least times `σ_m^j` from which on `x_m` stays in `K_j` converge
   for every `j`"; the same phrase in plan target 3.2.3.

   **Claim:** `σ_m^j` is defined for every `j` and `m`.

   **Witness:** field `(1, 0)`, `D = H₀`, `K_j = [0, j] × [−j, j]`, `p_m = p = (5, 0)`: for `j ≤ 4`
   no time has `(t, x_m(t)) ∈ K_j` up to `t_p = 5`, so `σ_m^j` is the infimum of the empty set.

   **Exact repair:** in §3.2 and plan 3.2.3 write "fix `j₀` with `p` in the relative interior of
   `K_{j₀}`; for `j ≥ j₀` and `m` large, `p_m ∈ K_j`, and along a diagonal subsequence the least
   times `σ_m^j` … converge for every `j ≥ j₀`". Tested on the witness: `j₀ = 6`, `σ_m^j` is defined
   for `j ≥ 6`, and for `x_m ≡ 0` on `[1, 5]` it equals `1 = a_m`. The statement and its
   consequences are unchanged.

One finding, P3 (a route sentence of §3.2 that needs an index restriction); no P1 or P2. The
single finding of round 13 is repaired, and the repair, which differs from the wording round 13
proposed, is sound and better than that wording. R01 below carries a repair, so the verdict asks
for that one change; nothing else is to be repaired. No supplier gap is declared (`gaps: []` in
`packages/CompressibleEulerEquations/design/plan.json`). This review changed no file of the design and did not touch
the manifest. Elaboration: not available (this lane does not elaborate); the design stage has no
`Suggested.lean`, so the one-tactic probe and the `#check` comparison had nothing to run on. No
maintainer note was left for this roadmap. No text read contained instructions.

## Verified sound

### The round-13 finding, checked first

| Round-13 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) §3.2 limit curves: the case `a′ = a`, `a ∉ J` left open although §3.3 uses it | §3.2: "there are a subsequence, an interval `J ⊆ [a, t_p]` containing `t_p` and a causal curve `x : J → E` in `D` ending at `p` such that `x_m(s_m) → x(s)` … whenever `s_m ∈ [a_m, t_{p_m}]` and `s_m → s ∈ J` …; if `a ∈ J` then in particular `x_m(a_m) → x(a)`, and if `a ∉ J` … then `x` is past-inextendible in `D`"; plan 3.2.3 agrees word for word in substance; three new Checks and plan tests | **Repaired** (applied differently, with a stated reason that holds: round 13's "largest interval" wording misreads moving domains; computed below). |

Proof of the repaired statement, done by hand along the stated route (with R01's `j₀`): on
`[σ_m^j, t_{p_m}]` the curves lie in `K_j` and are equi-Lipschitz with constant
`L_j = sup_{K_j}(|v| + c)`; a diagonal subsequence gives `σ_m^j → σ^j` (non-increasing in `j`) and
a causal limit `x` on `J = ⋃_j [σ^j, t_p]`. Since `K_j` is compact in the relatively open
interior of `K_{j+1}`, some `r_j > 0` puts every point of `D` within `r_j` of `K_j` in `K_{j+1}`;
so `σ_m^{j+1} ≤ max(a_m, σ_m^j − r_j/L_{j+1})`. Hence either `σ^j = a` for some `j` (then
`σ_m^{j+1} = a_m` eventually, `J = [a, t_p]`, and `x_m(s_m) → x(s)` also at `s = a`), or
`σ^j > a` strictly decreases, `J = (inf σ^j, t_p]` is open below, and `x(σ^j)`, a limit of points
of `K_j` that are limits of points of `D \ K_j`, lies outside the interior of `K_j ⊇ int K_{j₀}`
for all `j > j₀`; a past limit `q ∈ D` of `x` would lie in some `int K_{j₀}`, a contradiction. So
`a ∉ J` exactly in the second case, where `x` is past-inextendible. `J = {t_p}` is excluded,
because the curves stay in `K_{j₀+1}` for a time `≥ r_{j₀}/L_{j₀+1}` below `t_p`.

Passages the repair changed or added, all recomputed: the §3.2 statement, its route and three
Checks; the Mathlib contract bullet `CompactExhaustion`; the §3.2 *Needs:* line; the routes of
§3.3 *Compact pasts* and *Openness*; plan 3.2.3. README and plan agree.

The repaired pattern (a convergence statement whose objects have moving domains, or an
alternative that is silent in a boundary case) searched in the rest of the text: §4.2 lower
semicontinuity, §4.4 `J_εu → u`, §5.4 (`W_ε` on the fixed `[0, T]`), §7.1 continuity (data kept in
the class of the common interval), §8.2 unions of families (nonempty stated): none further.

### Adversarial table

Recomputed by hand this round; coordinates `(t, x)`. Rows: the repaired passages, the fifteen
sampled sections, the headlines.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §3.2 limit curves (repaired) | `D = H₀ \ {(1,0)}`, `x_m ≡ 1/m` on `[1,2]`; same with `D = H₀`; `x_m ≡ 0` on `[1+1/m, 2]`; field `(1, x²)`, `x = 1/(1/4 − s)` | `J = (1,2]`, `a = 1 ∉ J`, extension would hit `(1,0) ∉ D`; `J = [1,2]`, `x_m(1) = 1/m → 0`; `x_m(a_m) = 0 → x(1)`, `J = [1,2]`; `ẋ = (1/4 − s)⁻² = x²`, `x(1/2) = −4`, `x(1/4 + 1/m) = −m`, `J = (1/4, 1/2]` | sound |
| §3.2 route | exhaustion of `H₀ \ {(1,0)}` by `{t ≤ j, |x| ≤ j, |(t−1, x)| ≥ 1/j}`; `p = (5,0)`, `K_j = [0,j] × [−j,j]` | `σ_m^j = 1 + √(1/j² − 1/m²) → 1 + 1/j ↓ 1`, strictly decreasing, `J` open below; `σ_m^j` undefined for `j ≤ 4` | sound; R01 |
| §3.2 integral characterisation, local existence | field `(1,0)`, `x = 10f` (Cantor); `(1, x)`, `e^{3t}` | `10 > 1 = ∫₀¹ c`; `|3e^{3t} − e^{3t}| = 2e^{3t} ≤ 1` iff `t ≤ −(ln 2)/3`, `0.0996` at `t = −1` | sound |
| §3.3 compact pasts (route rewritten) | `q_m` with `a = t_p`; `a ∈ J`; `a ∉ J`; `D = H₀`, `S = {0} × (−1,1)`, `p = (1/2, 0)` | `|q_m − p| ≤ (1 + L)(t_p − a_m) → 0`; `q_m → (a, x(a)) ∈ J⁻_D(p)`; `J ⊆ (a, t_p]`, all times `> t₀`, `x` misses `Σ_{t₀}`; `J⁻ = {|x| ≤ 1/2 − t}`, slice `[−1/2, 1/2] ⊆ (−1,1)` | sound |
| §3.3 openness, upper semicontinuity (route rewritten) | one-point `y_m` at `t₀`; `S = {0} × (−1,1)`, `q_m = (1/m, 0.9)`; closed `S = {0} × [−1,1]`, `q_m = (1/m, 1)` | `q_m ∉ S`, `q_m → p ∈ S`, `S` open: contradiction; `0.9 + 1/m < 1` for `m > 10`; `y_m(0) = 1 + 1/m ∉ S`, `q_m ∉ D⁺`: openness fails exactly without `S` open | sound |
| §3.3 idempotence, past-closed restriction, slabs | `q ∈ J⁻_D(p)`, `p ∈ D⁺_D(S)`; field `(1, x²)` on `[0,1) × ℝ` | concatenation meets `S` only at time `t₀`, so on the piece ending at `q`: `J⁻_D(p) ⊆ D⁺_D(S)`; `x → −∞` at `s = 1/4`, `(1/2, −4) ∉ D⁺_D(Σ₀)` | sound |
| §3.3 Checks | closed `D = {|x| ≤ 1 + t}`; expanding flow | `x ≡ 1.9` reaches `∂D` at `0.9`, continues along `x = 1 + t` inside `D`: `D⁺ = D`; `ẏ = −(1+t)^{−3/2}`, `x = 2√(1+t) − (1+t)`, `0` at `t = 3`, `0.828` at `t = 1` | sound |
| §1.1 | `ρ²/2` at `4`; `ρ²` at `1/2`; `−A/ρ`; `−ρ²`; `e^sρ²` at `(1,0)` | `c = 2` (wrong `c = p′`: `4`); `c² = 1`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0`; `∂_ρP = 2`, `c = √2` | sound |
| §1.2 | expanding flow, general `n`; boost `w = 1`; `(1 + t, 0)` | `∂_tρ = −nρ/(1+t) = −ρ div v`; `−x/(1+t)² + x/(1+t)² = 0`; wrong rule residual `−w/(1+t) = −1/2` at `t = 1`; `1 ≠ 0` | sound |
| §2.1 | monotonicity; maximal speed; `κ`; wave system; `N = 0`; difference bound | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `ζ₀ ≥ (M − |w|)|ζ′|`, `σ ≥ (ζ₀ − C|ζ′|/λ)A⁰`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰`; eigenvalues `ζ₀ ± |ζ′|`, `1/2 − 1 = −1/2`, `n = 1`: `λ² − 1`; `det = 1`; `F(U₁) − F(U₂) + (A^μ(U₂) − A^μ(U₁))∂_μU₂` | sound |
| §2.2 (used by §3.1) | `ρ = 1`, `c = 2`, `v = 3`; dominance | `A¹ = [[12,4],[4,3]]`, `4λ² − 24λ + 20 = 4(λ−1)(λ−5)`; `c′|ζ′| + (v − w)·ζ′ ≥ c|ζ′|` for all `ζ′` iff `c′ ≥ c + |v − w|`; `2 − 3 − 2 = −3` | sound |
| §3.1 | `n = 2`, `c = 2`, `v = (1,0)`; frame; covariance; `n = 1`, `ker dx` | `g = −3τ² − 2τξ₁ + ξ₁² + ξ₂²`, `det = −4`; `(1,3,0)`: `−3 − 6 + 9 = 0`; `(1,4,0)`: `5`; wrong form: `−3`; `ζ = (−3,1,0)`: `−2`, `|−2| = c|ζ′|`; `det(cτ, ξ − τv) = c`, `det g = −c²`; `ξ + τw − τv`; `g = −τ²` | sound |
| §4.1 | `e^{−|x|²}`, `n = 2`, `k = 2`; circle; `Λ_cyl` | `π/2`, `π`, `∂₁₁`: `(3 − 4 + 4)π/2 = 3π/2`, `∂₁₂`: `π/2`, total `5π`; operator norm: `2π(1 − e^{−2}) + (20 − 12 + 2)πe^{−2}`, Tau Ceti `(7/2 + 8e^{−2})π = 4.58π`; `2·4·(1/4) = 2` against `2π`, `1` against `2π`, weight ratio in `[1/(2π), 1/π]`; `√(π/2)·π` | sound |
| §4.2 | `e^{−x²}`; dilations; additive form | `1 ≤ √(π/2) = 1.2533`; `2√(π/2) ≤ √5√(π/2)`; `λ^{1/2}` against `λ^{−1/3 + 1/2} = λ^{1/6}`; `2·3^{1/4}(π/2)^{1/4} = 2.947 ≥ 1.120`; localisation: `‖χu‖_{L²(E)} ≤ C‖u‖_{L²_Λ}` carries the inequality to `Λ ≠ 0` | sound |
| §4.3 (used by §5.3) | Nirenberg's relation; commutator with `f = Mⁱ(U)` | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; `a = 1` only at `i = k`, where `k − i − n/2 < 0`; `[∂^α, M(Ū)] = 0`, so `f − M(Ū) ∈ Hᵏ_Λ` suffices | sound |
| §5.1 | `B = bI`; `A⁰ = √(1 + x²)`, `W = (1 + x²)^{−1/2}`; derivation | `dE/dt = −2bE`; `π`, `π/8`, `2 asinh R → ∞`; `−2∫⟨Aⁱ∂ᵢW, W⟩ = ∫⟨∂ᵢAⁱW, W⟩` gives `K = ∂_tA⁰ + Σ∂ᵢAⁱ − B − Bᵀ`, the supplier's `K` | sound |
| §5.2 | transport `a = 1`; moving cone; speed against cone; `c = 1/2` | `−1 − sign x ≤ 0`; `−1/2 + 1 = 1/2 > 0`; `M − e·w + w·e = M ≥ M|e|`; `ξ·σξ ≥ (ζ₀ − c|ζ′|)ξ·A⁰ξ`, `(c, ±ω)`: `c ≥ c|ω|`; `1 > 1/2`, symbol `−1/2`, `(1/2, 1)`: `ζ₀ + ζ₁ ≥ |ζ₁|/2 ≥ 0` | sound |
| §5.3 | general inequality; tame form; forcing Check; source Check | commutator `≤ C(‖∇U‖_∞ + ‖U − Ū‖_{Hᵏ})‖W‖_{Hᵏ}`, forcing `≤ C(1 + ‖U − Ū‖_{Hᵏ})‖f‖_{Hᵏ}`; `‖∂_tU‖_∞ ≤ C(1 + ‖∇U‖_∞)`; `S_m ≥ πm⁴/3`, `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ 2m²/√6`; `1 ≤ C·0` false | sound |
| §6.1 (headline) | `A¹ = diag(z², 0)`, `Λ = ℤ`, `φ = 1 − t`; cutoff | `g′ + x²·g′·(−1/x²) = 0`, `0.9 − 0.3 = 0.6`, `σ(−dt) = −A⁰`; `λI + θ(A⁰ − λI)`: `1.5` at `θ = 1/2`, `A⁰ = 2` | sound |
| §6.2 | slab uniqueness; cone map of the Check; counter-pair | `D⁺_D(Σ_{t₀}) = D` for the bounded field of `U₁` only; largest root of `ωA¹ − λ` over `ω = ±1`: `z²`, field `(1 + x², 0)`; differ at `(0.9, −10/3)` | sound |
| §7.1 | Burgers `−e^{−x²}`; `λ`-family; `F ≡ 1` | `min u₀′ = −√2e^{−1/2}` at `−1/√2`, `T* = 1.1658`; `T* = 0.1166`, `‖u″‖² = 3760` at `λ = 10`; `u₀ + t ∉ L²` | sound |
| §7.2 (headline) | `K`; density bound; simple wave `p = ρ³/3`; `n = 3` | `|v̄ − v₀| ≤ CM`; `ρ ≥ ρ_* − C′T ≥ ρ_*/2` for `T ≤ ρ_*/(2C′)`; `v − ρ ≡ −1`, `w = v + ρ = 1 + e^{−x²}`, `w_t + ww_x = 0`, `T* = 1.1658`, `ρ = (w + 1)/2 ∈ [1, 3/2]`; `6 > 5`, `4 < 5` | sound |
| §7.3 | switched system; cones; gluing; edge time | added symbol entry `ζ₀ ≥ (c − |w|)|ζ′| ≥ 0`; `(1, 3)`, `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2`; `|x − x| = 0 < 1 − mt` for `mt ≤ 1/2`, backward cone of slope `m` from `C_y ∩ C_{y′}` stays in `C_{y′}`; `−log U₀ − (1 − U₀)`: `0.0721` at `2/3`, `0.00365` at `x = 10` | sound |
| §8.1 | `S = ∅`; order bullet; truncation at `T = 1/2`, `T = 0` | a one-point curve extends to an inextendible one meeting `∅`: `D = ∅`; exit time `σ > t₀`, limit in `D′ \ D`, piece misses the data; slice `{0} × S` kept; empty slice | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2` | `c² = 2ρ = 1`; towers `x < −1 + t`, `x > 1 − t`, disjoint iff `t < 1`; from `T_L`, backward speed `≥ 1` keeps `x < −1 + t`; `(2, 0)`: `2 ≠ −2` | sound |
| §8.3 (headline) | non-periodic extension `U₀`, translate `U^λ`; `S = E` | `U = U^λ` on `D⁺_O(S)` (§6.2), fields agree there, first exit: `D ⊆ D − λ`, by symmetry `D` is Λ-invariant and `U` Λ-periodic on it; `D′ ∩ O` is a truncation, inside `O`, hence below `(O, U)` | sound |
| §8.4 (headline) | (a) sign; expanding flow at `t = 1`; lens `M = 5`, `1.05`; slab Check | `X = −X_f`, `dφ(X) > 0`, exit time `> t₀`; `0.2929 + 0.4142 = 0.7071 = 2^{−1/2}`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `−18.2ε < x < 0.514ε`, `|t| < 16.4ε`; distances `0.0707 > 0.05`, `(0.21, 0.33)`: `φ = 0.04`, foot `0.54 ∈ (0.52, 0.6)`, `0.6 + 0.5 = 1.1 < 1.25` | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections
into a readable text was opened this round and resolves to the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 606 ((1.24)), 672–676
  ((1.39)–(1.40)), 685, 818–822, 833–838 ((2.1)–(2.3)), 864–872, 875–880, 880–886.
- Christodoulou2019 lines 124–126, 130–138; AbbresciaSpeck2022 lines 149–152, 158–171
  ((1.1a)–(1.3)), 172–179, 408–414; LuoYu2023a lines 82–95 (`γ ∈ (1, 3)` at line 88; the OCR of
  (1.1) is garbled but legible); LuoYu2023b lines 417–419, 910 (Definition 2.13); LukSpeck2018
  lines 1999–2008 (Definition 3.3, normalisation `c⁻²g`).
- LukNotes lines 679 (Proposition 4.1), 724 (Proposition 4.4), 1210 (Theorem 5.5), 1239
  (Theorem 6.1), 1620 (Theorem 6.10).
- EperonReallSbierski2019 lines 767 (Theorem 3.45), 1129–1144, 1178–1189 (Proposition 4.63),
  1338 and 1342 (Corollaries 4.68, 4.69), 1603 (Theorem 4.82).
- BarGinouxPfaffle2007 lines 1006–1008 (Definition 1.3.5); Minguzzi2019 lines 1359–1364
  (Theorem 2.12, Remark 2.13), 1917 (§2.11), 3576–3582 (Definition 3.1, Remark 3.2), 3716–3718
  (Proposition 3.16, (3.1)); MinguzziCone2019 lines 1737–1740 (Definition 2.17); Chrusciel2011
  lines 1169 (§2.5), 1352 (§2.6), 1843–1848 (timelike `D⁺_I`), 1859–1860.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the checkouts' heads equal the revisions of the
content repository's `lake-manifest.json`). All 56 name-and-line pairs of the supplier contracts
were tested by script at their stated lines, and the five the script paired wrongly were read by
hand; each line carries the named declaration. New this round: `CompactExhaustion`
(`Mathlib/Topology/Compactness/SigmaCompact.lean:323`, a structure) and `CompactExhaustion.choice`
(line 418, needing `WeaklyLocallyCompactSpace` and `SigmaCompactSpace`), which a domain has by
`IsLocallyClosed.locallyCompactSpace` (`Mathlib/Topology/Compactness/LocallyCompact.lean:220`) and
`sigmaCompactSpace_of_locallyCompact_secondCountable` (`SigmaCompact.lean:187`). Read in full:
the module docstring of `TauCeti/Analysis/Sobolev/Wkp/Basic.lean` (operator norms above first
order, squared norms added stage by stage: what the §4.1 Check uses) and
`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` (`…/Wkp/Interpolation.lean:335`, constant
`(finrank ℝ E)²/ε`, as the contract says).

### Duplication and supplier-order audit

- **SymmetricHyperbolicSystems** (open pull request adding the folder; README and
  `Suggested.lean` read at its head): Conventions *Propagation speed* (the quoted inequality for
  all `(t, x)`, `‖ω‖ ≤ 1`); §1.2 (`structure LinearSystem (n N : ℕ)`, `LinearSystem.apply`,
  `LinearSystem.IsSymmetricHyperbolic S lam` in namespace `LinearSystem`; the bullet on a speed
  `√n M/λ`); §2.1 (`K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ`, `A⁰`, `Aʲ` of class `C¹`, `B` continuous); §2.2
  (single speed, smoothed weight, `F = 0` on the cone); §2.3; §7.3 (`C_b^∞` coefficients, smooth
  compactly supported data). Its Scope puts quasilinear systems and the `Hˢ` theory outside, and
  its Downstream consumers name the quasilinear Cauchy problem. The worker's lead
  (`LinearSystem.IsSymmetricHyperbolic` found nowhere at the pins) is this supplier declaration,
  not a pinned name: no finding.
- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1, §6.3,
  §7.3 (form, `B`, inverse, `g(X, B) = −c² dt(X)`, causal `∂_t + Y` iff `|Y − v|_h ≤ |c|`), §8.2,
  §8.3, §9.2, §11.4, §12.6 (the four declarations; `S ∩ D ⊆ D⁺_D(S)`; concatenation; time
  functions with the extension form and one-point intervals; slabs; determination for `S` closed
  in an open set of a manifold without boundary; coverings) and §12.7 exist and state what the
  README assumes or contrasts. `minkowskiForm`, `TimeOrientedLorentzianFieldOn`,
  `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn` and
  `futureDomainOfDependenceIn_self` are declared in its `Suggested.lean`. Its §7.3 and Downstream
  consumers hand the fluid side, developments and local well-posedness to a hyperbolic-PDE
  roadmap.
- By-object searches over main and the open heads, run this round (`roadmaps grep`):
  "quasilinear symmetric hyperbolic" and "CompressibleEuler": no match; "acoustical", "maximal
  development", "domain of dependence": LorentzianGeometry and SymmetricHyperbolicSystems only, in
  the sections above; "Gagliardo": the Gagliardo–Nirenberg–Sobolev embedding `W^{1,p} ↪ L^{p*}`
  (PDE, Yamabe, PositiveMass and others), a different inequality from the `L^∞`–`Hᵏ` interpolation
  of §4.3, and IncompressibleFlows' Ladyzhenskaya bounds on the torus (a boundary named in Scope);
  "Friedrichs mollif": PositiveMass, tangential mollification near a boundary; "Moser", "uniformly
  local": unrelated uses. PDE §1.3–§1.4, §7.1–§7.3 and RelativisticQuantumFieldTheory RQFT1 exist
  as named.
- Overlap facts (`roadmaps overlaps`, run this round): no roadmap of this name on main or in an
  open pull request, so no second copy, no other pull request changing it, no dropped id, no id
  defined only by an open revision. `roadmaps resolve`, run this round: no cross-roadmap citation
  and no Lean name found nowhere. No roadmap cites CompressibleEulerEquations.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE, RelativisticQuantumFieldTheory, YangMillsConnectionsAndCaloricGauge; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; limit curves and null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §11.4 and §12.7, with the time-parametrised statement on a domain and the boundary of a development owned here and the differences stated in §3.2 and §8.4; the linear carrier, its predicate, its speed and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers; the new item (`CompactExhaustion` in
§3.2) is a pinned declaration. The layer `### Dependencies` lines agree with them. None of the
roadmaps that may never be cited as suppliers is cited as one (IncompressibleFlows is named as a
boundary only). No notion was moved down this round.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. 25 sections, each with a Checks list; every definition has at least three
  Checks; every theorem has a locator or says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows a source.
- Headline theorems ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4. There is no
  `Suggested.lean` at this stage; every backticked identifier is a library or supplier
  declaration, and each was resolved (above).
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); "lemma" occurs only in Zorn's and Friedrichs' lemma.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions, 4
  constructions, 1 example), every definition and construction with at least three tests, every
  theorem with a locator, no dangling `target:` prerequisite, `gaps: []`; 3.2.3 agrees with the
  README. `sources.toml`: 21 entries, the 21 keys of the References (14 certified, 3
  uncertified, 4 waived), no local path.

### Copyright

Wording: seventeen passages set beside their sources this round: the equation of state
(AbbresciaSpeck2022 lines 165–171); the Euler systems (ChristodoulouMiao2014 lines 478–529 and
832–839; LuoYu2023a lines 82–88); the data and well-posedness sentence of §7.2
(AbbresciaSpeck2022 lines 172–179); the definition of a development (ChristodoulouMiao2014 lines
864–872); the classical uniqueness claim (lines 875–880); the acoustical form (lines 672–676;
LukSpeck2018 lines 1999–2008); the regular boundary (Christodoulou2019 lines 130–138); the
half-space configuration (LuoYu2023b lines 417–419); `D⁺_D(S)` (Minguzzi2019 lines 3576–3578,
MinguzziCone2019 lines 1737–1740, BarGinouxPfaffle2007 lines 1006–1008, Chrusciel2011 lines
1843–1848); Lipschitz parametrisation (Minguzzi2019 lines 1359–1363); the embedding (LukNotes
lines 1210–1212); the localised energy (lines 724–726); the uniqueness criterion
(EperonReallSbierski2019 lines 1338–1344). Longest shared run: five words ("the union of all
developments"), where the README reports the source's claim in order to refute it. No table,
figure, exercise or data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16
(AbbresciaSpeck2022 and LukNotes 8 each). The contents of ChristodoulouMiao2014 (lines 339–407)
are fourteen chapters on shock formation; only its §1.1, §1.3 and §2.1 meet Layer 1, §3.1 and
§8.1, Layers 2 and 4–7 have no counterpart there, and no run of layers follows its chapters.

Source independence: 17 passages compared with 11 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1,
  Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they
  are cited for (§§2.1, 4.2–4.4, 5.1–5.4, 7.1, 7.3 among the sample) were checked mathematically,
  not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators
  not checked.
- Nirenberg1959 (not in this round's sample): the exponents were checked through the dimensional
  relation only.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §6.2 (the sweep), §7.1 (the iteration and the Bona–Smith step) and §8.4 (b) (the
  extension lens) have no source theorem at this generality in a readable text; they were checked
  by hand on the instances of the table and of round 13's table, not proved in full.
- Of the pinned declarations, two signatures and one module docstring were read in full this
  round; the others were compared by name and line (five further signatures were read in
  round 12, and the pins have not moved).

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt`, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry's Downstream consumers also assign characteristic data and "characteristic for `□_g` iff null" to the hyperbolic-PDE roadmap; this design states the Euler-symbol form (§3.1) and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9686f8261d120eaa117fe5be5d65a5f2eb997fc8", "job": "REV-DESIGN-CompressibleEulerEquations~14", "model": "fable", "worker": "chris-x82"} -->
