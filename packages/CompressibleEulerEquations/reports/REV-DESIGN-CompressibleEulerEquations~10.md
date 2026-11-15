<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6898669557 -->
Review (claude) of ed518fd

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §8.3 claims nullity "by §8.4" for a development that is not maximal

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §8.3, the bullet after the
   route: "For data on a half-space `{x¹ > 0}`, the part of the boundary of the development along
   which the solution extends as a classical solution is null by §8.4".

   **Claim:** §8.4 gives nullity of the boundary of the development `(D⁺_O({t₀} × S), U)` of §8.3
   wherever `U` extends classically.

   **Witness:** §8.4 (b) assumes `(D, U)` maximal; `D⁺_O(S)` is only the largest development inside
   the slab `O`. Constant state, `n = 1`, `c₀ = 1`, `v₀ = 0`, `t₀ = 0`, `T = 1`:
   `D = {x > t, 0 ≤ t < 1}`; at `q = (1, 5)`, `φ = t − 1`, `∂_tφ = 1 > 0 = c|∇φ|`: spacelike, and the
   constant state extends.

   The README's own §8.4 Check says the same of truncations ("spacelike, which (a) allows and (b)
   excludes, and indeed truncations are not maximal"). The intended statement, for the lateral
   boundary below the top of the slab, is true, but it does not follow from (b) as stated: the lens
   argument must be run against "largest development contained in `O`", not against maximality.

   **Exact repair:**

   1. §8.4 (b): replace the hypothesis "`(D, U)` is maximal" by the weaker one that the route
      actually uses: "no development `(D′, U′) ≥ (D, U)` with `D′ ⊆ D ∪ ⋃_{λ∈Λ} (N + λ)` contains `q`;
      this holds in particular when `(D, U)` is maximal". The route is unchanged: the development it
      builds is `D` with the lens and its Λ-translates, the lens lies in `N₀ ⊆ N`, and it contains
      `q`. Update the same sentence in plan target 8.4.1 (statement and `hypotheses`).
   2. Move the half-space bullet from §8.3 to the consequences of §8.4 and state it as: "For the
      development `(D⁺_O({t₀} × S), U)` of §8.3 and a boundary point `q` with `t₀ < t(q) < t₀ + T`
      satisfying the hypotheses on `φ`, the boundary is null at `q` for the acoustical form of `U`:
      take `N ⊆ (t₀, t₀ + T) × E` and `Ũ = U`; a development above it inside `D ∪ ⋃ (N + λ) ⊆ O` is
      below it, since it is the largest development contained in `O` (§8.3), so it does not contain
      `q`. On the top `{t = t₀ + T}` only (a) applies. This is the configuration of LuoYu2023b lines
      417–419." Add §8.3 to the *Needs:* line of §8.4 and to the prerequisites of 8.4.1.
   3. Add the witness as a Check of §8.4 and a test of 8.4.1: for the constant state above,
      at `(1/2, 1/2)` with `φ = t − x`: `∂_tφ = 1 = c|∂_xφ|`, null; at `(1, 5)` with `φ = t − 1`:
      `1 > 0`, spacelike, although the solution extends.

   Tested on the refuting instance: at `q = (1, 5)` no `N ⊆ (0, 1) × ℝ` contains `q`, and for small
   `r` the set `D ∪ {t ≥ 1, |x − 5| < r − 2(t − 1)}` with the constant state is a development above
   `D`, inside `D ∪ N`, containing `q` (backward curves of speed at most `1` stay under the cone of
   slope `2` down to `t = 1`), so the new hypothesis fails and nothing is claimed; at `(1/2, 1/2)` the hypothesis holds and `1 = 1` is the asserted equality.
   For a maximal development the new hypothesis holds trivially, so the headline is unchanged.

2. **F02** (P3) the consequence of §8.4 does not repeat the hypothesis of (b)

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §8.4, the bullet before the
   Checks: "Consequently, a `C¹` hypersurface contained in `∂D ∩ {t > t₀}`, with `D` on one side and
   along which `U` extends as a classical solution, is null".

   **Claim:** the bullet is a consequence of (b); the section opens "for a development `(D, U)`" and
   the bullet names no further hypothesis.

   **Witness:** the paragraph just above it: the truncation `{|x| < 1 − t, 0 ≤ t < 1/2}` of the state
   `c = 1`, `v = 0` is a development whose top `t = 1/2` is such a hypersurface, with
   `∂_tφ = 1 > 0 = c|∇φ|`: spacelike.

   **Exact repair:** begin the bullet "Consequently, when `(D, U)` satisfies the hypothesis of (b) at
   each point of it (in particular when `(D, U)` is maximal), a `C¹` hypersurface …". On the
   truncation the hypothesis fails at every point `(1/2, x_q)` of the top (adding the small cone
   `{t ≥ 1/2, |x − x_q| < r − 2(t − 1/2)}` gives a development above it that contains the point), so
   nothing is claimed; on the lateral boundary `|x| = 1 − t` of the maximal development
   `{|x| < 1 − t}` it gives `1 = 1`.

Two findings: one P2 and one P3, both in Layer 8 and both about the same hypothesis (maximality in
§8.4 (b)). Both findings of round 9 are repaired. Everything else was checked again and found
sound: the supplier citations at the present heads, all 55 pinned line citations, the
fifteen sampled sections against the cached texts, and the statements by hand (table below). This
review changed no file of the design and did not touch the manifest. Elaboration: not available
(this lane does not elaborate; say so in the report); the design stage has no `Suggested.lean`, so
the one-tactic probe and the `#check` comparison have nothing to run on. No supplier gap is
declared (`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`). No maintainer note
was left for this roadmap.

## Verified sound

### Round-9 findings, checked first

| Round-9 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) the loss bound of §4.4 has a pinned input that no contract names | "From Tau Ceti": "`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient` (`TauCeti/Analysis/Sobolev/Translation.lean:133`): for `1 ≤ p ≤ ∞` … with `TauCeti.w1p0Submodule_top_eq_top` …"; §4.4: "so `C = √n ∫ |y|φ(y) dy` serves"; the *Needs:* line of §4.4; plan target 4.4 | **Repaired.** Both declarations opened at the pin (below); the constant `√n ∫|y|φ` and the `Λ ≠ 0` form with `‖w‖_{H¹_Λ}` recomputed (rows below). The fix worker's change of constant is correct. |
| F02 (P3) the list of definitions the headlines need omits three | "How to read the build": "the quasilinear symmetric hyperbolic system with its symbol (§2.1), the space `Hᵏ_Λ` (§4.1), the lens function and its spacelike condition (§6.1) … and the initial data set and the development with its order (§8.1)" | **Repaired.** Each headline (§6.1, §7.2, §8.2–§8.4) now has every definition its statement names. |

Repaired patterns searched in the rest of the text. A "proved here" statement with an unnamed
pinned input: §4.2 (Plancherel, the difference-quotient criterion), §4.3 (Leibniz, chain rule, Faà
di Bruno, Young), §5.1–§5.4 (Grönwall, Picard–Lindelöf), §3.2 (Rademacher, Arzelà–Ascoli) all name
theirs; none further. A list of definitions needed by the headlines: only in "How to read the
build".

### Adversarial table

Recomputed by hand this round: the passages the repair changed, the fifteen sampled targets, the
headlines and the targets the two findings touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §4.4 loss bound, `Λ = 0` (repaired) | `w = e^{−x²}`; count of `(i, α)` for `n = 2`, `k = 2` | `‖J_εw − w‖ ≤ ∫φ(y)‖τ_{−εy}w − w‖ ≤ ε∫|y|φ·‖w′‖₂`, `‖w′‖₂² = √(π/2)`; `Σ_{|α|≤k−1} Σᵢ ‖∂ᵢ∂^αu‖² ≤ n Σ_{1≤|γ|≤k}‖∂^γu‖²` since `γ = α + eᵢ` for at most `n` values of `i` | holds with `C = √n∫|y|φ` |
| §4.4 loss bound, `Λ ≠ 0` (repaired) | localisation, `|h| ≤ 1` and `|h| ≥ 1`; `cos(mx)`, `Λ = 2πℤ` | `χτ_hw = τ_h((τ_{−h}χ)w)`, so `‖χ(τ_hw − w)‖ ≤ |h|‖∇(χw)‖ + |h|‖∇χ‖_∞‖w‖` over finitely many cells; for `|h| ≥ 1`, `2‖w‖ ≤ 2|h|‖w‖`; `4π sin²(mh/2) ≤ πm²h² ≤ h²π(1 + m²)` | holds with `‖w‖_{H¹_Λ}` |
| §4.4 loss bound, `k = 0` | `cos(mx)`, `m → ∞` | `|1 − φ̂(εm)| → 1 > Cε` | excluded, as stated |
| §4.4 Friedrichs commutator | `a = sin(x/2)`, `u = sin x`; `a = x` | at `x = π`: `½[2φ̂(ε) − φ̂(3ε/2) − φ̂(ε/2)] = ½(μ₂ε²/2)(−2 + 9/4 + 1/4) = μ₂ε²/8`; `ψ = −zφ_ε`, `‖ψ′‖_{L¹} = ∫|φ + wφ′|` | sound |
| §1.1 sound speed | `ρ²/2` at `4`; `ρ²` at `1/2`; `e^sρ²` at `(1, 0)`; `−A/ρ` | `c = 2` (wrong `c = p′`: `4`); `c = 1`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2`; `p′ = A/ρ² > 0` | sound |
| §1.2 expanding flow, boost `w = 1` | `n = 1`, `t = 1` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; `ṽ = (y + 1)/(1 + t)`: `−(y + 1)/(1 + t)² + (y + 1)/(1 + t)² = 0`; wrong rule: `−(1 + y)/(1 + t)² + (y − t)/(1 + t)² = −1/(1 + t) = −1/2` | sound |
| §1.3 entropy wave | `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}` | `P = e^x e^{−x} = 1`; wrong term `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2) = −e^{x/2}` | sound |
| §2.1 monotonicity, `κ`, wave system | `c′ ≥ c + |w′ − w|`; `N = 0`; `ζ = (1/2, e₁)` | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `Σωᵢ Aⁱ ≥ −λA⁰`, so `σ ≥ (ζ₀ − λ|ζ′|)A⁰`; empty determinant `1`; eigenvalue `1/2 − 1 = −1/2` | sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = [[12, 4], [4, 3]]`, `(12 − 4λ)(3 − λ) − 16 = 4(λ − 1)(λ − 5)` | sound |
| §2.2 full symmetriser | `a = ∂_ρP/ρ`, `b = ∂_sP/ρ`, `d = 1 + b²/a`; `(1, 0)` | rows of `SMⁱ`: `(av, aρeᵢ, bv)`, `(∂_ρP eᵢ, ρv, ∂_sP eᵢ)`, `(bv, bρeᵢ, dv)`, symmetric since `aρ = ∂_ρP`, `bρ = ∂_sP`; `ad − b² = a`; minors `2, 2, 2`; `d = 1/2`: `0` | sound |
| §2.2 dominance, multiplicity zero | `(1, 3)`, `c = 2`; `ζ = (2, −1)`, `(−3, 1)` | minimum on the cone `(c′ − c − |v − w|)|ζ′|`; `2 − 3 − 2 = −3`; `σ = [[0, 4], [4, 0]]`, `det = −16`, `g⁻¹ = 1` | sound |
| §3.1 form, covectors, boost | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `−2`, `|−2| = 2·1`; boost: `(1, 2, 0)`, `−4 + 4 = 0` | sound; agrees with LorentzianGeometry §7.3 |
| §3.3 half-space, slab control, expanding flow, idempotence | `S = {x¹ > 0}`; field `(1, x²)`; `p = ρ²/2`; `q ∈ J⁻_D(p)` | leftmost start `x¹ − (v₀¹ + c₀)t`; `x(s) = 1/(1/4 − s)`: `−4` at `1/2`, `−∞` at `1/4`; `ẏ = −(1 + t)^{−3/2}`, `x = 2√(1 + t) − (1 + t)`: `0.828` at `1`, `0` at `3`; `D⁺_D(S)` is past-closed in `D`, so the extension in `D` of a curve of `D⁺_D(S)` stays in it | sound |
| §4.1 norms | `e^{−|x|²}`, `n = 2`; `cos x`, `Λ = 2πℤ`; PDE §7.1 blocks | `π/2 + π + (3π/2 + π/2 + 3π/2) = 5π`; operator-norm Hessian `2π(1 − e^{−2}) + 10πe^{−2}`, total `(7/2 + 8e^{−2})π ≈ 4.58π`; `π + π = 2π`; Circle norm `2·4·(1/4) = 2`; `ψ(2^{−j}ξ) = 1 − 1 = 0` at `|ξ| = 1`, `j ≥ 1`, so `B¹_{2,2}` norm squared `1/2` | sound |
| §5.1 identity, coefficient bound | `B = bI`; `A⁰ = √(1 + x²)`, `W = (1 + x²)^{−1/2}` | `E = e^{−2bt}E(0)`; `‖W‖² = π`, `‖W′‖² = π/8`, `∫_{−R}^{R} A⁰W² = 2 asinh R → ∞` | sound |
| §5.2 weights, speeds | transport `a = 1`; Euler constant state; `c = 1/2` | `−1 − sign x ≤ 0`; `−1/2 + 1 = 1/2 > 0`, bump support `(−1.1, −0.1)` meets `|x| < 0.55`; `e·v₀ − c₀ − v₀·e + c₀ = 0`; `ω = 1`: `1 > 1/2`, `ζ = (1/2, −1)`: `−1/2` | sound |
| §5.3 forcing coefficient | `A⁰ = 1/(2 + u)`, `U = sin mx`, `W = (δ + t)(2 + sin mx)` | `A⁰(U)∂_tW = 1`; `S_m ≥ ∫r″²/3 = πm⁴/3`; `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ √(2/3)m²` | sound |
| §5.4 constant depends on `Ā¹` | `A⁰ = e^{sin x}`, `A¹ = M`, `w = sin x + sin 2x` | `∫cos x(w′)² = 2π`, `∫cos x(w″)² = 4π`, `∫(−sin x − cos²x)w″w′ = π`; `2·2π + 4·4π + 2π = 22π`; `E₂(0) ≤ e(2π + 5π + 17π)` | sound |
| §6.1 lens uniqueness (headline) | `φ = 1 − |x| − t/2`, `a = 1`; cut-off `A⁰ = 2`, `λ = 1`; `A¹ = diag(z², 0)`, `Λ = ℤ` | `1/2 > 0`, uniqueness fails on the lens; `1 + θ = 1.5` at `θ = 1/2`; `∂_tu + x²∂_xu = g′ − g′ = 0`, `u = g(0.6)` at `(0.9, −10/3)` | sound |
| §6.2 Theorem, slab uniqueness | constant state, `S = (−2, 2)`; expanding flow; `S = Σ_{t₀}` | `1.4 < 1.5 < 1.6` at `t = 1/2`; `0.828` against frozen-field `0` at `t = 1`; `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O` | sound |
| §7.1 well-posedness | Burgers `u₀ = −e^{−x²}`; `F ≡ 1`; mollified data | `min u₀′ = −√2e^{−1/2}`, `T* = e^{1/2}/√2 ≈ 1.1658`; `u₀ + t ∉ L²`; `‖J_εw − w‖_∞ ≤ C‖·‖_{Hᵏ⁻¹} ≤ CεM` with `2(k − 1) > n` | sound |
| §7.2 Euler (headline) | `p = ρ³/3`; `n = 3`; continuation | `c = ρ`, `v ± ρ` solve Burgers, `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* ≈ 1.1658`, `ρ ∈ [1, 3/2]`; `6 > 5`, `4 < 5`; `Bv = −(c²/ρ)∇ρ` bounds `v` along material curves when `∫‖∇ρ‖_∞ < ∞` | sound |
| §7.3 uniformly local | `p ∈ C_y ∩ C_{y′}`; `F = u/(1 − u)`; transport `a = 3` | `|x(t) − y′| < 1 − mt_p + m(t_p − t) = 1 − mt`; exit time `−log U₀ − (1 − U₀)`: `0.0721` at `0`, `0.00365` at `10`, `4.84·10⁻⁵` at `100`; `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2` | sound |
| §8.1 developments | truncation at `T = 1/2`, `T = 0`; `(D, U) ≤ (D′, U′)` | slice `{0} × S` and `J⁻_D(q) ⊆ {t ≤ t_q}`; empty slice at `T = 0`; a curve of `U′` leaving `D` above `t₀` is inextendible in `D` and misses `S` | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2`; union of a compatible pair | `c = 1`, speeds `[1, 3]` and `[−3, −1]`, towers `x < −1 + t`, `x > 1 − t`; `(2, 0)`: `0 < 1`, `0 > −1`, velocities `2 ≠ −2`; a `U₁`-curve from `t_p ≥ 1` in `T_L` has `x(1) < 0`, outside `T_R`: `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}`; `D₁` is past-closed in `D₁ ∪ D₂` (first exit above `t₀`) | sound |
| §8.3 (headline) | `S = E`; largest in `O`; half-space bullet | `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`, so every development is compatible with the slab; a `U`-curve leaving a development `D ⊆ O` above `t₀` contradicts `D = D⁺_D(S)`; top of `{x > t, t < 1}`: `1 > 0` | theorem sound; bullet R01 |
| §8.4 (a), (b) (headline) | negation of (a); constant state; expanding flow; `M = 5`, `1.05`; the lens | `X = −(1, v − θcb/|b|)`: `dφ(X) = −(a − θc|b|) > 0`; `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `−18.2ε < x < 0.514ε`; `{ψ > 0}` is past-closed for speeds below `M`, and `φ` increases to the future | (a), (b) sound; consequence R02 |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened this round and resolves to the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 527–529 ((1.10)), 606 ((1.24)), 672–676
  ((1.39)–(1.40)), 685, 816–822, 833–838 ((2.1)–(2.3)), 864–872, 872–880, 880–886.
- AbbresciaSpeck2022 lines 79–83, 149–152 (`ℝ × 𝕋²`), 158–171 ((1.1a)–(1.3)), 172–179
  (non-vacuum `H³` data), 408–414.
- LuoYu2023a lines 82–95 (`γ ∈ (1, 3)`, the acoustical metric); LuoYu2023b lines 417–419, 910.
- Christodoulou2019 lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (Definition 3.3,
  normalisation `c⁻²g`).
- LukNotes lines 679 (Proposition 4.1), 724 (Proposition 4.4), 1158 (Theorem 5.3, by duality),
  1210 (Theorem 5.5), 1239 (Theorem 6.1), 1612 (Lemma 6.8, `F(0) = 0`), 1620 (Theorem 6.10);
  Nirenberg1959 line 318.
- EperonReallSbierski2019 lines 767 (Theorem 3.45), 1010–1014 (Remark 3.56), 1129–1133, 1178
  (Proposition 4.63), 1195–1199, 1232–1240, 1338–1344 (Corollaries 4.68, 4.69), 1603 (Theorem 4.82).
- BarGinouxPfaffle2007 lines 1006–1008 (Definition 1.3.5), 3664–3668 (Theorem 3.2.11);
  Minguzzi2019 lines 1359–1364, 1917, 3576–3578, 3716–3718; MinguzziCone2019 lines 680–683,
  698–699, 1737–1740; Chrusciel2011 lines 534, 1169, 1352, 1843–1846, 1859.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the pins of `lake-manifest.json`). All 55
name-and-line pairs of the supplier contracts (20 of Mathlib, 35 of Tau Ceti, counting `TauCeti.CircleSobolev.norm_sq_eq_tsum` at line 375 of `Circle/Basic.lean`) were printed by
script at their stated lines: each line is the named declaration. The two added this round:
`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`
(`TauCeti/Analysis/Sobolev/Translation.lean:133`: `(h : E) {u : W1p mu ⊤ p}
(hu : u ∈ w1p0Submodule mu ⊤ p)`, conclusion `eLpNorm (…) p mu ≤ ‖h‖ₑ * ‖W1p.gradient u‖ₑ`, with
`[Fact (1 ≤ p)]`, `[mu.IsAddHaarMeasure]`, `E` a finite-dimensional real inner product space) and
`TauCeti.w1p0Submodule_top_eq_top` (`TauCeti/Analysis/Sobolev/W1p/Density.lean:299`:
`(hp : p ≠ ∞) : w1p0Submodule mu ⊤ p = ⊤`). `Wkp 1 = W1p` is line 61 of the module docstring of
`TauCeti/Analysis/Sobolev/Wkp/Basic.lean`. The declaration takes a real-valued `u`; §4.4 applies
it to the coordinates of `∂^αu`, which costs nothing.

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder): §6.1 (`minkowskiForm E`), §6.3
  (the hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `B`, inverse,
  `g(X, B) = −c² dt(X)`, causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff `|Y − v|_h ≤ |c|`),
  §8.2, §8.3, §9.2 (`du_p ≠ 0`, `g⁻¹(du, du)(p) = 0`), §11.4 (arc-length limit curves), §12.6
  (`TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`,
  `futureDomainOfDependenceIn`, monotonicity, concatenation, time functions with the extension
  form, the slab identity, `futureDomainOfDependenceIn_self`, coverings) and §12.7 were read at its
  head and state what the README assumes or compares with; the four §12.6 declarations and
  `minkowskiForm` are in its `Suggested.lean`. Its Scope and Downstream consumers leave the
  compressible Euler equations and developments to the hyperbolic-PDE roadmap.
- **SymmetricHyperbolicSystems** (open pull request adding the folder): §1.2 (`LinearSystem n N`,
  `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic`, all in its `Suggested.lean`), §2.1
  (the same `K`), §2.2 (single speed `c ≥ 0`, `F = 0` on the cone, smoothed weight), §2.3, §7.3
  (`C_b^∞` coefficients, smooth compactly supported data) resolve. Its Scope puts quasilinear
  systems and the `Hˢ` theory outside it.
- **PDE** (main): §1.3, §1.4, Layer 7 with §7.1–§7.3 resolve; the block convention of §7.1
  (`χ = 1` on the unit ball, `ψ(ξ) = χ(ξ/2) − χ(ξ)`, `P_0` by `χ`) is the one the Check of §4.1
  uses. Nothing of it is consumed.
- **IncompressibleFlows** (open; on the never-cite list) and **RelativisticQuantumFieldTheory**
  (RQFT1): named as boundaries only, never in a `*Needs:*` line or a contract; `UnitAddTorus d`
  and RQFT1 exist at their heads.
- By object over main and the open heads (`roadmaps grep`): quasilinear symmetric hyperbolic
  systems, Moser estimates, Kato–Ponce, equations of state, maximal developments and Friedrichs
  mollifiers have no other owner (the Gagliardo–Nirenberg hits in PDE, PositiveMass, Yamabe,
  PseudodifferentialOperators and YangMillsConnectionsAndCaloricGauge are the
  Gagliardo–Nirenberg–Sobolev inequality, a different statement; PositiveMass uses a tangential
  mollification inside one proof). No roadmap cites CompressibleEulerEquations.
- Overlap facts (`roadmaps overlaps`, run again): the roadmap is neither on main nor in an open
  pull request: no second copy, no other pull request changes it, no cited id is dropped and none
  is defined only by an open revision.
- Citation leads: `roadmaps resolve`, run again, lists nothing found nowhere.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE, SobolevPolynomialApproximation, OptimalTransport; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; null `C¹` horizons of `D⁺_U(S)` in a fixed spacetime — owner LorentzianGeometry §12.7, with the boundary of a development owned here and the difference stated in §8.4; the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here and the full-rank comparisons Checks of §4.1; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers (LorentzianGeometry §6.1, §6.3, §7.3,
§8.2, §12.6; SymmetricHyperbolicSystems §1.2, §2.1). No notion was moved down this round.
Ownership against the open pull requests was checked through `roadmaps show` and `roadmaps grep`
at their heads.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every definition has at least three Checks; every theorem has a locator or
  says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows one.
- Headline theorems (How to read the build): §7.2, §6.1, §8.2–§8.3, §8.4. There is no
  `Suggested.lean` at this stage; every backticked identifier of the README is a library or
  supplier declaration and none is presented as this roadmap's own.
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); the matches of "lemma" are Zorn's, Friedrichs' and a source's Lemma 6.8.
- `design/plan.json`: parses; 8 layers, 53 targets (36 theorems, 12 definitions, 4 constructions,
  1 example), every definition and construction with at least three tests, no dangling `target:`
  prerequisite, `gaps: []`; target 4.4 agrees with the repaired README. `sources.toml`: parses;
  21 entries, the 21 keys of the References.

### Copyright

Wording: fourteen passages set beside their sources: the equation of state against
AbbresciaSpeck2022 lines 165–171; the definition of a development against ChristodoulouMiao2014
lines 866–872; the classical uniqueness claim against lines 875–880; the acoustical form against
lines 672–676; the well-posedness sentence of §7.2 against AbbresciaSpeck2022 lines 175–179;
`D⁺_D(S)` against Minguzzi2019 lines 3576–3578, MinguzziCone2019 lines 1737–1740,
BarGinouxPfaffle2007 lines 1006–1008 and Chrusciel2011 lines 1843–1846; the embedding, the
composition estimate and the weighted energy against LukNotes lines 1210–1212, 1612–1615 and
724–726; the uniqueness criterion against EperonReallSbierski2019 lines 1338–1344; the regular
boundary against Christodoulou2019 lines 130–138. Longest shared run: five words ("the union of
all developments"), where the README reports the source's claim in order to refute it. No table,
figure, exercise or data set is taken over.

Arrangement: 109 locators in the body; ChristodoulouMiao2014 and Majda1984 have 17 each (then
AbbresciaSpeck2022 9, LukNotes 8). ChristodoulouMiao2014's contents (lines 338–370: Ch. 1 the
Euler equations and the acoustical metric; Ch. 2 the null foliation; Ch. 3 structure equations;
Ch. 4 curvature; Ch. 5 the fundamental energy estimate; Ch. 6 commutation fields; Ch. 7 estimates
of each order): only its §1.1, §1.3 and §2.1 meet Layer 1, §3.1 and §8.1; Layers 2 and 4–7 have no
counterpart, and no run of layers follows its chapters.

Source independence: 14 passages compared with 10 sources, none shared; largest share ChristodoulouMiao2014 and Majda1984, 17 of 109 locators each; contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

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
- The pinned declarations were compared by name, line and (for the two new ones) full signature;
  the bodies of the others were not unfolded.
- Nirenberg1959 line 318 is an OCR text: the heading of the Theorem is legible, its displayed
  inequality is not; the exponents of §4.3 were checked by scaling instead.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt` nor in the list of open pull requests given to this review, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry's Downstream consumers also assign characteristic data and "characteristic iff null" to the hyperbolic-PDE roadmap; this design states the Euler-symbol form (§3.1) and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ed518fdae3ff3080c75465a9c7045abf535e0832", "job": "REV-DESIGN-CompressibleEulerEquations~10", "model": "fable", "worker": "chris-x55"} -->
