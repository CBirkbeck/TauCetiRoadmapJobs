<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6901939631 -->
Review (claude) of 65064a7

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.3 slabs: the description of `D⁺_D(S)` needs `S ⊆ Σ_{t₀}`

   **Location.** `packages/CompressibleEulerEquations/design/README.md` line 879–881, §3.3 *Slabs*:
   "`D⁺_D(S)` is the set of `p` all of whose causal curves on `[t₀, t_p]` start in `S`"; the same
   sentence in plan target 3.3.3, whose `hypotheses` list has only the boundedness of `c`, `|v|`.

   **Claim.** For `D = [t₀, t₁) × E` with bounded field and any `S`, `p ∈ D⁺_D(S)` iff every causal
   curve on `[t₀, t_p]` ending at `p` starts in `S`.

   **Witness.** `n = 1`, field `(1, 0)`, `D = [0, 2) × ℝ`, `S = {(1, 0)}`, `p = (1, 0)`:
   `p ∈ S ∩ D ⊆ D⁺_D(S)` (LorentzianGeometry §12.6), but `x ≡ 0` on `[0, 1]` starts at `(0, 0) ∉ S`.
   The section's `S` is general: target 3.3 has the hypothesis `S ⊆ D`, and *Past-closed
   restriction* uses arbitrary `S`.

   **Exact repair.** In the README bullet write "…extends to one defined on `[t₀, t_p]`; for
   `S ⊆ Σ_{t₀}`, `D⁺_D(S)` is the set of `p` all of whose causal curves on `[t₀, t_p]` start in `S`;
   and `D⁺_D(Σ_{t₀}) = D`", and add the Check "field `(1, 0)`, `D = [0, 2) × ℝ`, `S = {(1, 0)}`:
   `(1, 0) ∈ D⁺_D(S)` although `x ≡ 0` on `[0, 1]` starts at `(0, 0) ∉ S`; the description needs
   `S ⊆ Σ_{t₀}`". In plan 3.3.3 insert the same clause in `statement`, add `"S ⊆ Σ_{t₀} (for the
   description of D⁺_D(S))"` to `hypotheses`, and add the witness as a `non-example` test. Tested on
   the witness: `S = {(1, 0)} ⊄ Σ₀` is excluded; for `S ⊆ Σ_{t₀}` the past-inextendible curves ending
   at `p` are exactly those on `[t₀, t_p]` (first clause; `D ⊆ H_{t₀}`), and such a curve meets
   `S ⊆ Σ_{t₀}` iff its starting point is in `S`; for `t_p = t₀` both sides read `p ∈ S`. The
   consumers (§6.2 slab uniqueness, §7.1, §7.3, §8.3) use only `D⁺_D(Σ_{t₀}) = D` and are unchanged.

One finding, R01 (P2): the slab statement of §3.3 (plan target 3.3.3) characterises `D⁺_D(S)` for
an unrestricted `S`, and is false when `S` is not in the initial slice. The repair is one clause.
The round-14 finding is repaired and the repair is sound. Nothing else is to be changed. No
supplier gap is declared (`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`).
This review changed no file of the design and did not touch the manifest. Elaboration: not
available (this lane does not elaborate); the design stage has no `Suggested.lean`, so the
one-tactic probe and the `#check` comparison had nothing to run on. No maintainer note was left
for this roadmap. No text read contained instructions.

## Verified sound

### The round-14 finding, checked first

| Round-14 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) §3.2 limit-curve route: `σ_m^j` defined only from some index on | §3.2: "fix `j_p` with `p` in the relative interior of `K_{j_p}`. That interior is open in `D`, so for `m` large `p_m ∈ K_{j_p} ⊆ K_j` for every `j ≥ j_p`, and the least times `σ_m^j` … exist"; "`σ_m^j` converges for every `j ≥ j_p`"; "for every `j ≥ j_p` the `x_m` eventually leave `K_j`"; plan 3.2.3 carries the same index | **Repaired** (applied with the letter `j_p` instead of `j₀`; the reason, that `j₀` is used two sentences later for the past endpoint `q`, holds: line 764). |

Recomputed on the round-14 witness (field `(1, 0)`, `D = H₀`, `K_j = [0, j] × [−j, j]`,
`p_m = p = (5, 0)`): the relative interior of `K_j` in `H₀` is `[0, j) × (−j, j)`, containing `p`
iff `j ≥ 6`, so `j_p = 6`; for `j ≥ 6` and `x_m ≡ 0` on `[1, 5]`, `σ_m^j = 1`; for `j ≤ 4` the set
of times is empty, which the new parenthesis says. The index threshold `m₀` (from `p_m → p` and
the open set `int K_{j_p}`) does not depend on `j`, so one diagonal subsequence serves all
`j ≥ j_p`. The dichotomy is unchanged: if some `K_j`, `j < j_p`, holds whole graphs, so does
`K_{j_p}`. The repaired pattern (an infimum or first-exit time over a possibly empty set) was
searched in §3.3 (*Compact pasts*, *Openness*, *Idempotence*), §8.1 (order bullet), §8.2 and
§8.4 (a): in each the curve starts inside the set it leaves; none further. The diff between the
two heads touches only this route (README 11 lines, plan one string).

### Adversarial table

Recomputed by hand this round, independently of the earlier tables; coordinates `(t, x)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 equations of state | `ρ²/2` at `4`; `ρ²` at `1/2`; `−A/ρ`; `−ρ²`; `e^sρ²` at `(1, 0)` | `c = √4 = 2` (wrong `c = p′`: `4`); `c² = 1`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | sound |
| §1.2 (context for §1.3) | boost `w = 1` of expanding flow; `(1 + t, 0)` | `ṽ = (y − t)/(1 + t) + 1`: `∂_tṽ + ṽ∂_yṽ = −1/(1+t) − (y−t)/(1+t)² + (y−t)/(1+t)² + 1/(1+t) = 0`; wrong rule residual `−1/(1 + t) = −1/2` at `t = 1`; `1 ≠ 0` | sound |
| §1.3 full system | static entropy wave; wrong momentum; symmetriser consistency; entropy propagation | `P = e^x e^{−x} = 1`; `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2) = −e^{x/2}`; `∂_t(ρs) + div(ρsv) = ρBs` given continuity; `v` `C¹` and bounded gives backward material curves to `t₀` | sound |
| §2.1 | monotonicity; `κ`; wave system `n = 1`; difference identity | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰`; `[[0, −1], [−1, 0]]`, `λ² − 1`; `F(U₁) − F(U₂) + (A^μ(U₂) − A^μ(U₁))∂_μU₂` | sound |
| §2.2 symmetrisers | `ρ = 1`, `c = 2`, `v = 3`; full `S`; `S N` | `A¹ = [[12, 4], [4, 3]]`, `(12 − 4λ)(3 − λ) − 16 = 4(λ − 1)(λ − 5)`; minor `ad − b² = ∂_ρP/ρ > 0`, at `(1, 0)`: `2·3/2 − 1 = 2`, with `d = 1/2`: `0`; `S N` has `∂_ρP` at `(ρ, vⁱ)`, `(vⁱ, ρ)` and `∂_sP` at `(vⁱ, s)`, `(s, vⁱ)`: symmetric; dominance iff `c′ ≥ c + |v − w|`: `2 − 3 − 2 = −3 < 0` for `(2, 0)` | sound |
| §3.1 (used by §2.2, §8.4) | `n = 2`, `c = 2`, `v = (1, 0)`; covectors; covariance | `g = −3τ² − 2τξ₁ + ξ₁² + ξ₂²`, `det = −3 − 1 = −4`; `(1, 3, 0)`: `−3 − 6 + 9 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `−2`, `c|ζ′| = 2`; `min_{|u − v| ≤ c} ζ(1, u) = ζ₀ + v·ζ′ − c|ζ′|`; `ξ + τw − τv` | sound |
| §3.2 route (repaired) | `p = (5, 0)`, `K_j = [0, j] × [−j, j]` | `j_p = 6`; `σ_m^j = 1` for `j ≥ 6`; empty for `j ≤ 4` | sound |
| §3.3 compact pasts, restriction, idempotence | `q ∈ J⁻_D(p)`, `p ∈ D⁺_D(S)`, `S ⊆ Σ_{t₀}`; `γ` in `D′` extendible in `D` | concatenation meets `S` only at time `t₀`, on the piece ending at `q`, so `J⁻_D(p) ⊆ D⁺_D(S)`; the extension lies in `J⁻_D(p) ⊆ D′`: contradiction | sound |
| §3.3 slabs | `D = [0, 2) × ℝ`, field `(1, 0)`, `S = {(1, 0)}`, `p = (1, 0)`; `S = Σ₀` | `p ∈ D⁺_D(S)`, start point `(0, 0) ∉ S`; `D⁺_D(Σ₀) = D` | **R01** |
| §3.3 Checks | closed `D`; expanding flow; field `(1, x²)` | backward along `x = 1 + t` (slope `1`) stays in `D`: `D⁺ = D`; `ẏ = ∓(1 + t)^{−3/2}`, `x = ±(2√(1+t) − (1+t))`, `0` at `t = 3`, `2√2 − 2 = 0.828` at `t = 1`; `ẋ = (1/4 − s)^{−2} = x²`, `x(1/2) = −4` | sound |
| §4.1 `Hᵏ_Λ` | `e^{−|x|²}`, `n = 2`; `n = 1`; circle; cylinder | `π/2`, `π`; `∂₁₁`: `(3 − 4 + 4)π/2 = 3π/2`, `∂₁₂`: `16·(1/16)·π/2 = π/2`, total `5π`; operator norm: `2π(1 − e^{−2}) + (20 − 12 + 2)πe^{−2}`, `(7/2 + 8e^{−2})π = 4.58π`; `√(π/2)(1 + 1 + 3)`; `2·4·(1/4) = 2` against `2π`, `1` against `2π`, weight ratio `(1+|m|)²/(2π(1+m²)) ∈ [1/(2π), 1/π]`; `√(π/2)·π` | sound |
| §4.2 (used by §4.3, §7) | `e^{−x²}`; dilations; additive form | `1 ≤ √(π/2) = 1.2533`; `2 ≤ √5`; `λ^{1/2}` against `λ^{−1/3}·λ^{1/2} = λ^{1/6}`; `2·3^{1/4}(π/2)^{1/4} = 2.947 ≥ 1.120`; `(3/4, 1/4)`: `λ^{−3/8 + 3/8} = λ⁰` | sound |
| §4.3 Gagliardo–Nirenberg, Moser | Nirenberg's relation; scaling; secant bound; `sin(ms)`; sphere example | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; exceptional case only if `k − i − n/2 ∈ ℕ`, impossible at `a = 1` (`i = k`); both sides `λ^{i − ni/(2k)}`, wrong side `λ^{i − ni/k}`, ratio `λ^{−1/4}`: `2` at `1/16`, `1/2` at `16`; `|a − b| > δ`: `2 sup|Φ| ≤ 2δ⁻¹ sup|Φ||a − b|`; `sin 1 = 0.8415 ≥ C/m` forces `C ≥ m sin 1`; `|∇ϑ|² = π²(1 − t²)/r²`, `π²(4π − 4π/3) = 8π³/3`, mean `(0, 0)` | sound |
| §4.4 mollifiers | `a = x`; `a = sin(x/2)`; loss at `k = 0, 1`; `u = 1` | `ψ = −zφ_ε`, `‖ψ′‖₁ = ∫|φ + wφ′|` independent of `ε`; commutator `½[(φ̂(3ε/2) − φ̂(ε)) sin(3x/2) − (φ̂(ε/2) − φ̂(ε)) sin(x/2)]`, at `x = π`: `(μ₂ε²/4)(5/4 − 3/4) = μ₂ε²/8`; `|1 − φ̂(εm)| → 1`; `‖cos mx‖²_{H¹} = π(1 + m²)`; `1 ≤ C/ε` false at `ε = 2C` | sound |
| §5.1 (used by §5.2, §5.4) | `B = bI`; `A⁰ = √(1 + x²)` | `dE/dt = −2bE`; `∫(1+x²)⁻¹ = π`, `∫x²(1+x²)⁻³ = π/8`, `2 asinh R → ∞` | sound |
| §5.2 weighted energies | moving cone; transport; Euler constant state; speeds | `dφ = (e·w − M, −e)`, `M − e·w + w·e = M ≥ M|e|`; `−1 − sign x ≤ 0`, `−1/2 + 1 = 1/2 > 0`; `(e·v₀ − c₀) − v₀·e + c₀ = 0`; `ξ·σξ ≥ (ζ₀ − c|ζ′|)ξ·A⁰ξ`, `(c, ±ω)`: `c ≥ c|ω|`; `∫₀¹(1 − x)⁻¹ = ∞` | sound |
| §5.3 (used by §5.4) | forcing Check | `A⁰(U)∂_tW = r/r = 1`; `S_m ≥ ∫m⁴sin²/3 = πm⁴/3`; `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ √(2/3)m²` | sound |
| §5.4 linear existence | `a = e^{sin x}`, `w = sin x + sin 2x` | `j = 1`: `∫a w′(w′/a)′ = −∫cos x (w′)² = −2π`; `j = 2`: `−2∫cos x (w″)² + ∫(sin x + cos²x)w″w′`, `∫cos x (w″)² = 4π`, third integral by parts `= −π`; `dE₂/dt / M = 4π + 16π + 2π = 22π`; `E₂(0) ≤ e(2π + 5π + 17π)` | sound |
| §6.1 (headline) | system `A¹ = diag(z², 0)`; cutoff | `g′(1 + x²·(−1/x²)) = 0`, `0.9 − 0.3 = 0.6`; `λI + θ(A⁰ − λI)`: `1.5` at `θ = 1/2`, `A⁰ = 2` | sound |
| §6.2 uniqueness on domains of dependence | slab form; `O ⊇ D` form; Burgers Check | `D⁺_D(Σ_{t₀}) = D` for the bounded field of `U₁`; `J⁻_D(p) ⊆ D ⊆ O`; characteristic of slope `U₂(p)` reaches `t = 0`, `U₂(p) = 0` | sound |
| §7.1 local well-posedness | Burgers `−e^{−x²}`; `λ`-family; `F ≡ 1` | `u₀′ = 2xe^{−x²}`, min `−√2e^{−1/2}`, `T* = 1.6487/1.4142 = 1.1658`; `0.1166`, `3·1.2533·10³ = 3760`; `u₀ + t ∉ L²` | sound |
| §7.2 (headline) | two-alternative criterion; simple wave | `Bv = −(c²/ρ)∇ρ` integrable when `ρ` stays compact in `I`, so `v` bounded: no third alternative; `v − ρ ≡ −1`, `w = 1 + e^{−x²}`, `T* = 1.1658`, `ρ = (w + 1)/2 ∈ [1, 3/2]`; `6 > 5`, `4 < 5` | sound |
| §7.3 uniformly local data | switched symbol; gluing; edge time; `T` | `ζ₀ ≥ (c − |w|)|ζ′| ≥ 0`; `(1, 3)`, `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2`; `|x(s) − y′| < 1 − mt_p + m(t_p − s) = 1 − ms`; `−log(2/3) − 1/3 = 0.0721`, `0.08664 − 0.08299 = 0.00365`; `mt ≤ 1/2 < 1` | sound |
| §8.1 developments | `S = ∅`; truncation; `{|x| < 1 + t}` | one-point curves extend to inextendible ones missing `∅`: `D = ∅`; `D′ ⊆ D⁺_{D′}(S)` by past-closed restriction; `x ≡ 1.9` exits at `t = 0.9` | sound |
| §8.2 (headline) | union of compatible pair; common bound; counter-flow | backward first exit from `D₁` at `σ > t₀` gives a past-inextendible curve in `D₁` missing `S`; `J⁻_{D₁}(p) ⊆ J⁻_D(p) ⊆ D₂`; speeds `[1, 3]`, `[−3, −1]`, towers `x < −1 + t`, `x > 1 − t`, disjoint iff `t ≤ 1`, `2 ≠ −2` at `(2, 0)` | sound |
| §8.2 uniqueness criterion | `(D, U)` against `U_*` on `H_{t₀}` | §6.2 with `O = H_{t₀}`: `U = U_*` on `D`; first exit gives `D ⊆ D⁺_{H}(S)`; `S = ∅`: both empty | sound |
| §8.3 (headline) | largest development in `O`; `S = E`; two extensions | `D′ ⊆ O`: `U′ = U` on `D′` (§6.2), then `D′ ⊆ D⁺_O(S)`; truncation at `t₀ + T` lies below `(O, U)`, union with a maximal one equals it, so `O ⊆ D′`; `T₁ ≤ T₂`: each lies below the other under `t₀ + T₁` | sound |
| §8.4 (headline) | (a); lens bound; expanding flow; slab Check | `min_u dφ(1, u) = ∂_tφ + v·∇φ − c|∇φ| < 0` gives the timelike exit direction; `|y| < ε + (M/a)b·y`, bounded iff `M|b| < a`; `(−100, −400)`: `φ = 260`, `ψ = ε + 100`; `−18.2ε < x < 0.514ε`, `t > −16.4ε`; `0.2929 + 0.4142 = 0.7071`; distances `0.0316 < 0.05 < 0.0707`, foot `0.54`, `1.1 < 1.25` | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. For the fifteen sampled sections every locator
into a readable text was opened this round and carries the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 530–544 (adiabatic motion,
  constant entropy propagates), 606 ((1.24)), 672–676 ((1.39)–(1.40)), 685, 818–822, 833–838
  ((2.1)–(2.3)), 864–872, 872–880, 880–886.
- Christodoulou2019 lines 124–126, 130–138; AbbresciaSpeck2022 lines 149–152, 158–171, 172–179,
  408–414; LuoYu2023a lines 82–95 (`γ ∈ (1, 3)` at line 88); LuoYu2023b lines 417–419, 910;
  LukSpeck2018 lines 1999–2008 ((3.3.10a)–(3.3.10b)).
- LukNotes lines 679, 724, 1158 (proved from line 1111 on by Hahn–Banach), 1210, 1239, 1612
  (`F(0) = 0`), 1620; Nirenberg1959 line 318 (the Theorem of Lecture II, headed at line 258;
  (2.2) named at lines 328–334).
- EperonReallSbierski2019 lines 767, 1129, 1178, 1195, 1338, 1342, 1603; BarGinouxPfaffle2007
  lines 1006–1008, 3664; Minguzzi2019 lines 1359–1364, 1917, 3576–3582, 3716–3718;
  MinguzziCone2019 lines 680–718 (printed p. 17: page markers at 673 and 720), 1737–1740;
  Chrusciel2011 lines 534, 1169, 1352, 1843–1848, 1859.

### Pinned declarations opened

Mathlib at `1b1ccf4b0`, Tau Ceti at `2fd255d997` (the checkouts under the content repository).
All 57 name-and-line pairs of the two supplier-contract lists were tested by script at their
stated lines (the declaration name on that line or the two after): 57 of 57 match, including
`CompactExhaustion` (`Mathlib/Topology/Compactness/SigmaCompact.lean:323`) and
`CompactExhaustion.choice` (line 418). `LipschitzOnWith` and `LocallyLipschitzOn` are at
`Mathlib/Topology/EMetricSpace/Lipschitz.lean:63,72`; `IsLocallyClosed.locallyCompactSpace` at
`Mathlib/Topology/Compactness/LocallyCompact.lean:220`. Signatures were compared by name and
line, not re-read in full this round.

### Duplication and supplier-order audit

- **SymmetricHyperbolicSystems** (open pull request adding the folder; README and
  `Suggested.lean` read at its head): Conventions *Propagation speed* (README line 91 there);
  §1.2 `structure LinearSystem (n N : ℕ)` with fields `A0`, `A`, `B`, `LinearSystem.apply`,
  `LinearSystem.IsSymmetricHyperbolic S lam` (`0 < lam`, `IsSymm`, `lam |ξ|² ≤ ξ·A⁰ξ`), the
  bullet on the speed `√n M/λ`; §2.1 the identity with `K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ` for `A⁰`,
  `Aʲ` of class `C¹`, `B` continuous; §2.2, §2.3, §7.3 exist under those numbers. All as cited.
- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1, §6.3,
  §7.3, §8.2, §8.3, §9.2, §11.4, §12.6, §12.7 exist. §7.3 states the form, `g(B, B) = −c²`,
  `g(X, B) = −c² dt(X)`, the inverse, `g⁻¹(dt, dt) = −c⁻²`, causal `∂_t + Y` iff `|Y − v|_h ≤ |c|`
  and hands the fluid side to a hyperbolic-PDE roadmap. §12.6 states the four declarations,
  `S ∩ D ⊆ D⁺_D(S)` for any `S ⊆ M` (the fact R01's witness uses), concatenation, the
  time-function reduction with the extension form and one-point intervals, the slab identity,
  determination and coverings. `minkowskiForm`, `TimeOrientedLorentzianFieldOn`,
  `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn` and
  `futureDomainOfDependenceIn_self` are declared in its `Suggested.lean`.
- By-object searches over main and the open heads (`roadmaps grep`, this round): "quasilinear
  symmetric hyperbolic", "sound cone": no match; "symmetric hyperbolic": the two suppliers only;
  "acoustical", "maximal development": LorentzianGeometry only; "Moser": De Giorgi–Nash–Moser and
  Trudinger–Moser in PDE and unrelated uses, no `Hᵏ` product estimate; "Gagliardo–Nirenberg":
  the Sobolev embedding `W^{1,p} ↪ L^{p*}` (PDE, Yamabe, PositiveMass, YangMills,
  PseudodifferentialOperators), a different inequality from §4.3; "tame estimate", "Kato–Ponce",
  "commutator estimate": no match.
- Overlap facts (`roadmaps overlaps`, this round): no roadmap of this name on main or in an open
  pull request: no second copy, no other pull request changing it, no dropped id, no id defined
  only by an open revision. `roadmaps resolve`: no cross-roadmap citation and no Lean name found
  nowhere. The worker's lead `LinearSystem.IsSymmetricHyperbolic` is the supplier's declaration
  (above), not a pinned name: no finding.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE, RelativisticQuantumFieldTheory, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; limit curves and null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §11.4 and §12.7, the time-parametrised statement on a domain and the boundary of a development owned here with the differences stated in §3.2 and §8.4; the linear carrier, its predicate, its speed and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check (the brief's command, run this round):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2255 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers, and the layer `### Dependencies` lines
agree. None of the roadmaps that may never be cited as suppliers is cited as one
(IncompressibleFlows is named as a boundary only). No notion was moved down.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References; 25 sections, each with Checks; every theorem has a locator or says it is
  proved here.
- Organisation: layers are worked back from the developments theorems; no layer is named after a
  source's chapter and the README does not say it follows a source.
- Headlines ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4. No `Suggested.lean` exists at
  this stage; every backticked identifier is a library or supplier declaration, resolved above.
- Style (pattern search): no LaTeX delimiters, pull-request numbers, dates, HTML, machine paths
  or process words; "lemma" occurs only in Zorn's and Friedrichs' lemma.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions, 4 constructions,
  1 example); every definition and construction has at least three tests, every theorem a
  locator, no dangling `target:` prerequisite, `gaps: []`; 3.2.3 carries `j_p`.
  `sources.toml`: 21 entries, the 21 keys of the References (14 certified, 3 uncertified,
  4 waived), no local path.

### Copyright

Wording: twelve passages set beside their sources: the equation of state (AbbresciaSpeck2022
lines 165–171); the Euler systems (ChristodoulouMiao2014 lines 481–529, 833–838); entropy
propagation (lines 530–544); the definition of a development (lines 864–872); the classical
uniqueness claim (lines 875–880); the regular boundary (Christodoulou2019 lines 130–138); §7.2
(AbbresciaSpeck2022 lines 172–179); the half-space configuration (LuoYu2023b lines 417–419);
`D⁺_D(S)` (BarGinouxPfaffle2007 lines 1006–1008, Minguzzi2019 lines 3576–3577); the uniqueness
criterion (EperonReallSbierski2019 lines 1342–1343); the embedding and the composition estimate
(LukNotes lines 1210–1211, 1612–1613). Longest shared run: five words ("the union of all
developments"), where the README reports the claim it refutes. No table, figure, exercise or
data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16,
AbbresciaSpeck2022 and LukNotes 8 each. The contents of ChristodoulouMiao2014 (lines 339–407)
are chapters on the acoustical structure, energy estimates and commutation fields of shock
formation; only its Chapters 1–2 meet Layer 1, §3.1 and §8.1, and no run of layers follows its
chapters.

Source independence: 12 passages compared with 9 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984, Kato1975, Dafermos2016: settled as uncertified; cited by locator, text not read. The
  statements they are cited for (§§2.1, 4.2–4.4, 5.1–5.4, 7.1, 7.3) were checked mathematically,
  not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators
  not checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §6.2 (the sweep), §7.1 (the iteration and the Bona–Smith step) and §8.4 (b) (the
  extension lens) have no source theorem at this generality in a readable text; they were checked
  on the instances of the table, not proved in full.
- The IncompressibleFlows and PDE norm conventions behind two Checks of §4.1 were not re-read
  this round; round 14 read them, and those heads are not suppliers.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt`, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry §7.3 hands "the fluid side" to a hyperbolic-PDE roadmap named under its Downstream consumers; this design takes that role and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "65064a72c5057f7274923e9b1a65453c5e44fbdd", "job": "REV-DESIGN-CompressibleEulerEquations~15", "model": "fable", "worker": "chris-x79"} -->
