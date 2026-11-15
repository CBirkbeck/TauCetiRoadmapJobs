<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6896199410 -->
Review (claude) of 8cfbce9

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the composition route of §4.3 evaluates `Φ` on approximants that leave `G`

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §4.3 `*Needs:*`: "applied
   componentwise to `Φ ∘ u` for smooth `u`, whose classical derivatives up to order `k` are given by
   Mathlib's chain rule … and density through §4.4"; plan target 4.3.2.

   **Claim:** for `Φ` smooth on an open `G` only and `u` with values in a compact `K ⊆ G`, the smooth
   approximants of `u` obtained through §4.4 can be composed with `Φ`.

   **Witness:** `n = 3`, `N = 2`, `Λ = 0`, `k = 1` (`2k ≤ n`), `G = {1/2 < |y| < 2}`, `K` the unit
   circle, `Ū = (1, 0)`, `u = (cos θ, sin θ)` with `θ = πλ(|x|)x₃/|x|`, `λ = 1` on `[0, 1]`, `2 − r`
   on `[1, 2]`, `0` beyond. Then `u − Ū ∈ H¹(ℝ³)` (`∫_{|x|≤1} |∇u|² = 8π³/3`), `u` has values in `K`,
   and for radial `φ` and `ε ≤ 1`, `J_εu(0) = (½∫₋₁¹ cos πt dt, ½∫₋₁¹ sin πt dt) = (0, 0) ∉ G`.

   The statement of §4.3 is true; the route is short of one step, and it is the pattern of round 6's
   F02 (an object defined only on part of the space, used outside it), here for `Φ` instead of the
   linearised operator. The repair of round 6 wrote the cutoff `s ↦ χ(Ū + s)Φ(Ū + s)` for the scalar
   case `N = k = 1` only. For `2k > n` the approximants converge uniformly and stay in `K_δ`, so the
   consumers (§5.3, §7.1, both with `2k > n + 2` or `2(k − 1) > n`) are not affected; the statement of
   §4.3 is for every `k`.

   **Exact repair:** in the `*Needs:*` line of §4.3, before "applied componentwise", add: "the
   composition is run for `Φ̃ = χΦ`, extended by `0`, with `χ` smooth, equal to `1` on the
   `δ/2`-neighbourhood of `K` and supported in `K_δ`: `Φ̃` is smooth with compact support on `ℝ^N`,
   `Φ̃ ∘ u = Φ ∘ u` because `u` has values in `K`, and the approximants of `u`, which may leave `G`,
   are composed with `Φ̃`", and write `Φ̃ ∘ u` for the smooth `u` that follow. The derivatives of `Φ̃`
   of order `≤ max(1, k)` are bounded by those of `Φ` on `K_δ` and powers of `δ⁻¹`, which is the
   dependence the constants paragraph already states. Add the witness as a Check of §4.3 ("the
   approximants leave `G`") and as a test of plan target 4.3.2. Tested on the witness: `Φ̃(J_εu(0)) =
   Φ̃(0) = 0` is defined, while `Φ(y) = 1/|y|`, smooth on `G`, has no value at `J_εu(0)`.

2. **F02** (P3) BarGinouxPfaffle2007 Definition 1.3.5 is the two-sided Cauchy development

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §3.3: "every past-inextendible
   past causal curve in `D` ending at `p` meets `S` (… BarGinouxPfaffle2007 line 1006,
   Definition 1.3.5; …)", and §3.3, Slabs: "the notion is BarGinouxPfaffle2007 line 1006,
   Definition 1.3.5".

   **Claim:** the cited definition is that of the future domain of dependence.

   **Witness:** BarGinouxPfaffle2007 lines 1006–1008: the definition is of the Cauchy development
   `D(S)`, the points through which every inextendible causal curve (inextendible in both directions)
   meets `S`. In Minkowski `ℝ^{1+1}` with `S = {0} × (−1, 1)`: `(−1/2, 0) ∈ D(S)`, not in `D⁺(S)`.

   The neighbouring citations each carry their clause of difference (Minguzzi2019 "for piecewise `C¹`
   causal curves", MinguzziCone2019 "closed achronal `S`", Chrusciel2011 "the timelike variant"); this
   one does not.

   **Exact repair:** in both places write "BarGinouxPfaffle2007 line 1006, Definition 1.3.5, the
   two-sided Cauchy development `D(S)`, defined with causal curves inextendible in both directions";
   the same clause in the `locator` of the manifest entry. On the witness the clause separates the
   two sets: `(−1/2, 0)` lies in `D(S)` only. The citation in §8.1 stands in a list of related
   notions and needs no change.

Two findings, both P3 (no P1, no P2). Each has a repair to apply, so the verdict asks for
changes: a fix round applies R01 and R02, and nothing else stands in the way. Both findings of round 6 are repaired. Every supplier citation (LorentzianGeometry,
SymmetricHyperbolicSystems, PDE) was resolved again at the present heads and on main, every pinned
declaration the README names with a file and line was reopened at the pins, the fifteen sampled
sections were checked against the cached texts, and the statements were recomputed by hand (table
below). This review changed no file of the design and did not touch the manifest. Elaboration: not
available (this lane does not elaborate; say so in the report); the design stage has no
`Suggested.lean`, so the one-tactic probe and the `#check` comparison have nothing to run on. No
supplier gap is declared (`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`, and
the README says so under the supplier contracts). No
maintainer note was left for this roadmap.

## Verified sound

### Round-6 findings, checked first

| Round-6 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) three pinned special cases uncited; chain rule of §4.3 unnamed | `### From Tau Ceti`: "`TauCeti.W1p.mul`, `TauCeti.W1p.norm_mul_le` and `TauCeti.W1p.mulL` … At `p = 2` the hypothesis `n < 2` leaves `n = 1`"; "`TauCeti.W1p.hasWeakFDerivOn_comp` and `TauCeti.W1p.contDiffComp` … the scalar chain rule"; "`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` … the case `j = 1`, `k = 2`, `Λ = 0`"; §4.3 `*Needs:*` names `TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn`, `HasFDerivAt.comp`, `HasFTaylorSeriesUpToOn.comp`; plan 4.2, 4.3.1, 4.3.2 carry the names | **Repaired.** All nine declarations opened at the pins at the stated lines (below). R01 is what the repaired route still lacks for vector-valued `u`. |
| F02 (P3) §6.1 hands §5.2 an operator defined only near the lens | §6.1: "Take the coefficients `θA⁰(U₁) + (1 − θ)λI`, `θAⁱ(U₁)` and `B = 0`, with `λ > 0` such that `A⁰(U) ≥ λI` for `U ∈ K` … so they form an operator of §5.1 with `λ₀ = λ`"; new Check; plan 6.1.1 | **Repaired**, with `K` the values on `N_δ` rather than on the closure of the lens, which is needed (row below). |

Repaired patterns searched in the rest of the text. An operator or function used outside its
domain: §5.3, §5.4, §7.1, §7.2 work on whole slabs; §6.2 and §8.4 reach Layer 5 through §6.1; §7.3
keeps the localised data in `G` by the segment hypothesis and has its own Check; the supplier
contract's local identity carries its cutoff; §4.3 is R01. An input of a route with no named
declaration: none further in Layers 4–6.

### Adversarial table

Recomputed this round by hand: the passages the repair changed, the fifteen sampled targets, the
headlines, and the targets the two findings touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Contract, `W1p.mul` against §4.3 | `p = 2`; `n = 1, 2` | pin: `finrank < p`, so `n < 2`; `n = 1`: `2k = 2 > 1`; `n = 2`: not applicable, §4.3 needs `k ≥ 2`; constant `3‖ι‖` as at the pin | special case, as stated |
| Contract, additive interpolation | `a = ‖D²u‖`, `b = ‖u‖`; `e^{−x²}`, `n = 1` | `inf_ε (εa + n²b/ε) = 2n√(ab)`; `‖u‖₂² = ‖u′‖₂² = √(π/2)`, `‖u″‖₂² = 3√(π/2)`; `1.1195 ≤ 2·3^{1/4}·1.1195 = 2.947` | sound |
| §4.2 new Check, exponents | `u(λx)`, `n = 1` | `‖u′‖ ∝ λ^{1/2}`, `‖u‖ ∝ λ^{−1/2}`, `‖u″‖ ∝ λ^{3/2}`; `(1/2, 1/2)`: `λ^{1/2}`; `(3/4, 1/4)`: `λ⁰`; `(2/3, 1/3)` with `H²`: `λ^{1/6}` | sound |
| §4.3 scalar route (new) | `Φ = s²`, `K = [0, 1]`, `u = e^{−x²}`; `u ≡ Ū = 1` | `Φ′` unbounded on `ℝ`, `F = χΦ` has bounded derivative, `F(u − Ū) = Φ(u)`; `u = 1 ∉ L²(ℝ)`, `u − Ū = 0` | cutoff and centring both needed, both stated |
| §4.3 composition, vector route | circle-valued `u` on `ℝ³`, `k = 1` | `∫_{B₁}|∇u|² = π²·(4π − 4π/3) = 8π³/3`; `J_εu(0) = (0, 0)`, `|0| < 1/2` | R01 |
| §4.3 Gagliardo–Nirenberg | Nirenberg's exponents `m = k`, `j = i`, `q = ∞`, `r = 2`, `a = i/k`; `n = 1`, `k = 2`, `i = 1` | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; exceptional case 2 needs `a < 1` only when `k − i − n/2 ∈ ℕ`, and `i = k` has `−n/2 < 0`; scaling `λ^{3/4}` both sides, wrong side `λ^{1/2}` | sound |
| §4.3 order zero | `Φ_m = sin(ms)`, `u_m = m⁻¹1_{[0,1]}` | `‖Φ_m(u_m)‖₂ = sin 1 = 0.8415`, `‖u_m‖₂ = 1/m`; constant `≥ m sin 1` | sound |
| §6.1 cutoff `θ` (new) | `dist(p, L̄) < δ/4`; `θ(p) ≠ 0` | `B(p, δ/4)` inside the `δ/2`-neighbourhood, `θ(p) = 1`; `θ(p) ≠ 0` gives `dist < 3δ/4 ≤ δ` | sound |
| §6.1 cut-off `A⁰` (new) | `A⁰ = 2`, `λ = 1`, `θ ∈ {0, 1/2, 1}`; without `(1 − θ)λI` | `1`, `1.5`, `2`; wrong: `0`, `1`, `2` | sound |
| §6.1 `K` on `N_δ`, not on `L̄` | `A⁰(U) = 1/(1 + U²)`, `U₁ = 0` on `L̄`, `U₁ = 10` where `θ = 1` off `L̄` | `λ = 1` from `L̄`; value `1/101 < 1` | the repair's choice is the right one |
| §6.1 regularity of the cut-off coefficients | `p ∈ supp θ`; `p ∉ supp θ` | `supp θ ⊆ N_δ ⊆ 𝒩`, `𝒩` relatively open: products of `C¹` maps; elsewhere `λI`, `0` | operator of §5.1 |
| §6.1 lens uniqueness (headline) | `φ = 1 − |x| − t/2`, transport `a = 1`; `Λ = ℤ`, `A¹ = diag(z², 0)` | `−1/2 + 1 = 1/2 > 0`, bump enters; `∂_tu + x²∂_xu = g′(1 − 1) = 0`, `u(0.9, −1/0.3) = g(0.6)` | spacelike condition and periodicity both needed |
| §1.1 sound speed | `p = ρ²/2` at `4`; `p = ρ²` at `1/2`; Chaplygin; `e^sρ²` at `(1, 0)` | `c = 2` (wrong `p′`: `4`); `c = 1`; `p′ = A/ρ² > 0`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | sound |
| §1.2 boost | expanding flow, `w = 1` | `ṽ = (y + 1)/(1 + t)`: residual `0`; wrong rule: `−1/(1 + t)`, `−1/2` at `t = 1` | sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = [[12, 4], [4, 3]]`, `det(A¹ − λA⁰) = 4λ² − 24λ + 20`, roots `1`, `5` | sound |
| §2.2 full symmetriser | `a = ∂_ρP/ρ`, `b = ∂_sP/ρ`, `d = 1 + b²/a` | rows of `SMⁱ`: `(av, aρeᵢ, bv)`, `(aρeᵢ, ρv, bρeᵢ)`, `(bv, bρeᵢ, dv)`; `ad − b² = a > 0`; at `(1, 0)` minors `2, 2, 2`; `d = 1/2`: `det 0` | sound |
| §2.2 dominance, multiplicity zero | `(1, 3)`, `c = 2`; `ζ = (2, −1)`; `ζ = (−3, 1)` | `2 − 3 − 2 = −3 < 0`, threshold `5`; `σ = [[0, 4], [4, 0]]`, `det −16`, `g⁻¹(ζ, ζ) = 1` | sound |
| §3.1 form | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `ζ₀ + v·ζ′ = −2`, `ζ(1, 3, 0) = 0` | sound; LorentzianGeometry §7.3's `g(X, B) = −c²dt(X)` |
| §3.1 covectors | `X = (1, v + cω)`, `|ω| ≤ 1` | `ζ(X) = ζ₀ + v·ζ′ + cω·ζ′`, minimum `ζ₀ + v·ζ′ − c|ζ′|` | sound |
| §3.3 compact pasts | limit curve with `a′ > a`; `a′ = a = t₀` without limit | inextendible above `t₀`, misses `S`; never meets `Σ_{t₀}`, misses `S` | sound |
| §3.3 expanding flow | `p = ρ²/2`, `ρ₀ = 1` | `ẏ = −(1 + t)^{−3/2}`, `x = 2√(1 + t) − (1 + t)`: `0.828` at `1`, `0` at `3` | sound |
| §4.1 norms | `e^{−|x|²}`, `n = 2`, `k = 2` | `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`; operator-norm part `2π(1 − e⁻²) + 10πe⁻²`; total `(7/2 + 8e⁻²)π = 4.58π` | sound |
| §4.1 circle comparison | `cos x`, `1`, `Λ = 2πℤ` | `CircleSobolev 1`: `2·4·(1/4) = 2`, `1`; here `2π`, `2π`; ratios `π`, `2π` | sound |
| §4.4 mollifiers | `a = sin(x/2)`, `u = sin x`; `a = x` | commutator at `π`: `½(5/8 − 3/8)μ₂ε² = μ₂ε²/8`; kernel `ψ′`, `‖ψ′‖_{L¹}` free of `ε` | sound |
| §5.1 identity | `B = bI`; `A⁰ = √(1 + x²)`, `W = (1 + x²)^{−1/2}` | `E = e^{−2bt}E(0)`; `‖W‖² = π`, `‖W′‖² = π/8`, `∫A⁰W² = 2 asinh R → ∞` | sound |
| §5.2 weights, speeds | transport `a = 1`; covectors `(c, ±ω)` | `−1 − sign x ≤ 0`; `−1/2 + 1 > 0`; `cξ·A⁰ξ ± ξ·(ΣωⱼAʲ)ξ ≥ 0` both ways; `M − e·w + w·e = M ≥ M|e|` | sound |
| §5.3 forcing coefficient | `A⁰ = 1/(2 + u)`, `U = sin mx`, `W = (δ + t)(2 + sin mx)` | `S_m ≥ πm⁴/3`; `2√S_m ≤ C₁√(2π)`, so `C₁ ≥ √(2/3)m²` | sound |
| §5.4 constant | `A⁰ = e^{sin x}`, `A¹ = M`, `w = sin x + sin 2x` | `2·2π + 4·4π + 2·π = 22π`; `E₂(0) ≤ e(2π + 5π + 17π)` | sound |
| §7.1 continuation | Burgers, `u₀ = −e^{−x²}` | `min u₀′ = −√2e^{−1/2}`, `T* = 1.1658` | sound |
| §7.2 Euler (headline) | `p = ρ³/3` simple wave | `c = ρ`; `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, same `T*`, `ρ ∈ [1, 3/2]`; `n = 3`: `2k = 6 > 5`, `k = 2`: `4 < 5` | sound |
| §7.3 uniformly local | switched system at `(Ū, 0)`; `(1, 3)` at `ζ = (−2, 1)`; `F = u/(1 − u)` | source `(0·F(Ū), 0) = 0`; `−2 + 3 = 1 ≥ 1`, added entry `−2`; exit times `0.0721`, `0.00365`, `0.0000484` | sound |
| §8.1 developments | `S = ∅`; `{|x| < 1 + t}`; truncation at `T = 0` | `D⁺_D(∅) = ∅`; not a development; slice `∅ ≠ S` | sound |
| §8.2 (headline) | counter-flow, `p = ρ²`, `ρ = 1/2` | `c = 1`; speeds `1, 3` and `−3, −1`; `T_L ∩ T_R` empty for `t ≤ 1`; `(2, 0)`: `2 ≠ −2`; `(1, x)`, `x < 0`, lies in `J⁻_{D₁}((2, 0))` and not in `D₂` | sound |
| §8.2 criterion, compatibility | `O = H_{t₀}` in §6.2; union of a compatible pair | `J⁻_D(p) ⊆ H_{t₀}` always, so `U = U_*` on `D`; a curve leaving `D` above `t₀` gives an inextendible curve of `D` missing `S`; the union bounds both | sound, with no connectedness hypothesis (EperonReallSbierski2019 Corollary 4.69 has one, for its setting) |
| §8.3 (headline) | `S = E` | `J⁻_{D′}(p) ⊆ [t₀, t_p] × E ⊆ O`; a maximal development united with the slab is a development | sound |
| §8.4 (headline) | constant state; expanding flow at `t = 1`; `M = 5`, `M = 1.05` | `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071 = c`; `φ(−100, −400) = 260`; `−18.2ε < x < 0.514ε` | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened this round and resolves to the stated object:

- ChristodoulouMiao2014 lines 606 (1.24), 672–676 ((1.39)–(1.40)), 685, 864–872, 872–880, 880–886.
- AbbresciaSpeck2022 lines 149–152 (the carrier `ℝ × 𝕋²`, `𝕋² = [−π, π]²`), 158–171, 172–179
  (`H³` non-vacuum data), 408–414.
- LuoYu2023a lines 82–95 (`γ ∈ (1, 3)`, the acoustical metric); LuoYu2023b lines 417–419, 910.
- Christodoulou2019 lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (the normalisation
  `c⁻²g`, as the README says).
- LukNotes lines 679, 724, 1158, 1210, 1239, 1612 (constant depending on `‖φ‖_∞`, as §4.3 states
  through `K`), 1620; Nirenberg1959 line 318 (exponents recomputed in the table).
- EperonReallSbierski2019 lines 767, 1129–1144, 1178–1189 (the proof cites the standard local
  result, as §6.1 says), 1195–1210, 1338–1344, 1603.
- BarGinouxPfaffle2007 lines 1006–1008 (R02), 3664–3669; Minguzzi2019 lines 1359–1364, 3576–3583,
  3716–3718; MinguzziCone2019 lines 1737–1740; Chrusciel2011 lines 1843–1848, 1859.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the revisions of `lake-manifest.json`). All 44
declarations the README cites with a file and line were found at the stated line (a script
compared each name with the three lines from its locator): 18 of Mathlib and 26 of Tau Ceti, as
listed in the supplier contracts. The nine added by the repair were read in full:
`TauCeti.W1p.mul`, `norm_mul_le`, `mulL` (`W1p/SupercriticalMultiplication.lean:320,500,515`;
hypothesis `finrank ℝ E < p`, bound `3 * ‖morreyEmbedding‖ * ‖u‖ * ‖v‖`);
`TauCeti.W1p.hasWeakFDerivOn_comp`, `contDiffComp` (`W1p/ChainRule.lean:375,385`; `p ≠ ∞`,
`ContDiff ℝ 1 F`, `‖deriv F t‖₊ ≤ M`, and `F 0 = 0` for the second);
`TauCeti.hasWeakFDerivOn_gradient_of_contDiffOn` (`WeakDeriv/Basic.lean:789`, scalar `u`);
`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le` (`Wkp/Interpolation.lean:335`, constant
`(finrank ℝ E)^2 / ε`); `HasFDerivAt.comp` (`FDeriv/Comp.lean:103`);
`HasFTaylorSeriesUpToOn.comp` (`ContDiff/FaaDiBruno.lean:1051`). Also
`TauCeti.W1p.norm_sq_eq_norm_value_sq_add_norm_gradient_sq` (`W1p/Basic.lean:516`), behind "the
`W1p` norm is the `H¹` norm" at `p = 2`. None missing.

By object at the pins: Tau Ceti's `Analysis/Calculus/Moser.lean` is Moser's deformation argument
for forms, `Sobolev/Embedding.lean` and Mathlib's `FunctionalSpaces/SobolevInequality.lean` are the
Gagliardo–Nirenberg–Sobolev inequality `‖u‖_{p*} ≤ C‖∇u‖_p` (not the interpolation inequality of
§4.3, and the README's sentence on Mathlib is worded for the interpolation inequality),
`Sobolev/EvolutionSpace/` is the Gelfand-triple energy space of parabolic theory. No symmetric
hyperbolic system, Moser product or commutator estimate, Friedrichs lemma or partially periodic
Sobolev space exists at either pin.

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder; read at its head `fc070ae`): §6.1,
  §6.3 (the hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`; timelike is index one, equivalently
  containing a timelike vector), §7.3 (form, `B`, inverse, `g(X, B) = −c²dt(X)`, causal vectors
  have `dt(X) ≠ 0`, `∂_t + Y` causal iff `|Y − v|_h ≤ |c|`, orientation by `[B]`), §8.2, §8.3,
  §11.4 (arc-length limit curves) and §12.6 (`TimeOrientedLorentzianFieldOn`,
  `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, monotonicity,
  concatenation, time functions with the extension form and one-point intervals, the slab identity,
  `futureDomainOfDependenceIn_self`, coverings) each state what the contract assumes. Its §7.3
  hands the fluid side to the hyperbolic-PDE roadmap and its §12.6 has no existence of
  inextendible extensions, no causal past in a subset, no compactness, openness or idempotence for
  open `S` in a half-space: these stay here, each with its clause of difference.
- **SymmetricHyperbolicSystems** (open pull request adding the folder; head `6a5cca3`): §1.2
  (`LinearSystem`, `apply`, `IsSymmetricHyperbolic`, in its `Suggested.lean`; the predicate
  quantifies over every `(t, x)`, as §5.1 and §6.1 say), §2.1 (same `K`), §2.2, §2.3, §7.3
  resolve. Its scope puts quasilinear systems and the `Hˢ` theory outside it and names the
  quasilinear Cauchy problem as a consumer.
- **PDE** (main): §1.3, §1.4, §7.1–§7.3 and the sentence "every statement below is scalar" resolve
  on main (README lines 769, 803, 2668, 2719, 2785, 118). The open revision of PDE is a branch of
  an older form of that README (lanes A–G, 699 lines) without main's section numbers; the overlap
  tool lists no id it drops, PDE is cited here as it is on main, and nothing of it is consumed.
- **IncompressibleFlows** (open; on the never-cite list) and **RelativisticQuantumFieldTheory**
  (RQFT1): named as boundaries only, never in a `*Needs:*` line or a contract; both passages exist
  at their heads (Layer 0 item 3; RQFT1).
- By object over main and the open heads (`roadmaps grep`): Moser estimates, Friedrichs mollifiers,
  maximal developments and quasilinear symmetric hyperbolic systems have no other owner; the only
  other mentions are LorentzianGeometry's hand-over sentences.
- Overlap facts (`scratch/overlaps.md`, run again): no other open pull request changes this
  roadmap, no cited id is dropped, none is defined only by an open revision, and the roadmap is
  neither on main nor in an open pull request, so there is no second copy.
- Citation leads: the worker's one lead (`LinearSystem.IsSymmetricHyperbolic`) is refuted, it is
  the supplier's declaration; `roadmaps resolve`, run again, lists nothing.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE (main, and the headings of its open revision), SobolevPolynomialApproximation, OptimalTransport; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here and the full-rank comparisons Checks of §4.1; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers. No notion was moved down this round.
Ownership against the open pull requests was checked through `roadmaps show` and `roadmaps grep`
at their heads; the two suppliers are not among the names of `scratch/open-pull-requests.md` nor in
the merge order, and were read through the same tools.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Checks per definition: §1.1 5, §1.2 3, §1.3 3, §2.1 5, §2.2 6, §3.1 4,
  §3.2 3, §3.3 4, §4.1 8, §4.4 6, §5.1 4, §5.2 5, §6.1 5, §7.3 9, §8.1 4. Every theorem has a
  locator or says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows a source.
- Headline theorems (How to read the build): §7.2, §6.1, §8.2–§8.3, §8.4, with the definitions they
  need. There is no `Suggested.lean` at this stage, so statability, padding and the backticked-name
  check have no Lean file to run on; every backticked identifier of the README is a library or
  supplier declaration and none is presented as this roadmap's own.
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); the nine matches of "lemma" are Zorn's, Friedrichs' and a source's Lemma 6.8.
- `design/plan.json`: parses; 8 layers, 53 targets (36 theorems, 12 definitions, 4 constructions,
  1 example), every definition and construction with at least three tests, no dangling `target:`
  prerequisite, 10 roadmap prerequisites (LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §12.6;
  SymmetricHyperbolicSystems §1.2, §2.1), `gaps: []`. `sources.toml`: parses; 21 entries, the 21
  keys of the References, each cited in the body.

### Copyright

Wording: twelve passages set beside their sources: the definition of a development against
ChristodoulouMiao2014 lines 866–872; the classical uniqueness claim against lines 875–880; the
equation of state against AbbresciaSpeck2022 lines 165–171; the well-posedness sentence of §7.2
against lines 175–179; `D⁺_D(S)` against Minguzzi2019 lines 3576–3578, MinguzziCone2019 lines
1737–1740 and BarGinouxPfaffle2007 lines 1006–1008; the embedding and the composition estimate
against LukNotes lines 1210–1212 and 1612–1615; local uniqueness against EperonReallSbierski2019
lines 1178–1189; the regular boundary against Christodoulou2019 lines 130–138; the half-space
configuration against LuoYu2023b lines 417–419. Longest shared run: five words ("the union of all
developments"), where the README reports the source's claim in order to refute it. No table,
figure, exercise or data set is taken over.

Arrangement: 109 locators; ChristodoulouMiao2014 and Majda1984 have 17 each (then
AbbresciaSpeck2022 9, LukNotes 8). ChristodoulouMiao2014's contents (lines 338–392: Euler equations
and the acoustical metric; the null foliation; structure equations; curvature; the fundamental
energy estimate; commutation fields; estimates of each order; …): only its §1.1, §1.3 and §2.1 meet
Layer 1, §3.1 and §8.1; Layers 2 and 4–7 have no counterpart, and no run of layers follows its
chapters.

Source independence: 12 passages compared with 9 sources, none shared; largest share ChristodoulouMiao2014 and Majda1984, 17 of 109 locators each; contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

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
- The module docstring of `TauCeti/Analysis/Sobolev/Wkp/Basic.lean` was read for the norm of
  `Wkp` at order `k ≥ 2` (lines 28–36); the definition behind it was not unfolded.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Scope/ownership.** Two texts are named LorentzianGeometry: the open roadmap pull request (its §7.3 and §12.6 are cited here) and a board design of the same name. `packages/CompressibleEulerEquations/design/README.md` follows the numbering of the former.
- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests and are absent from `merge-order/ORDER.txt`; the dependency check draws no edge to them.
- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8cfbce9d63eb261e61be648cecf77f6042a6fbd1", "job": "REV-DESIGN-CompressibleEulerEquations~7", "model": "fable", "worker": "chris-x55"} -->
