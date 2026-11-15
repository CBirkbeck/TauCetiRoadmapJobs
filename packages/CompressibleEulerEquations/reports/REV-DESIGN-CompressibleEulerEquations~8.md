<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6897288077 -->
Review (claude) of 431428f

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.4 does not say how it differs from LorentzianGeometry §12.7

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §8.4 (b): "`∂D` is a null
   hypersurface of the acoustical form of `Ũ` at `q`"; Scope, the Lorentzian bullet: "Null
   hypersurfaces, null generators and geodesics of `C^{1,1}` metrics are LorentzianGeometry's as well
   and are not used here."

   **Claim:** every statement kept beside a LorentzianGeometry statement on the same object says how
   it differs (the README does so for §§3.1–3.3), and nothing of LorentzianGeometry states nullity of
   the boundary of a domain of dependence.

   **Witness:** LorentzianGeometry §12.7 ("Slices of a temporal function", at its open head): for a
   locally Lipschitz metric on an open `U`, `S` closed in a slice, `∂_U D⁺_U(S) ∩ {t > t₀} = H⁺_U(S)`,
   null wherever it is a `C¹` hypersurface; its Check is the constant acoustical state. The README
   never names §12.7.

   The two statements are different theorems, and §8.4 stands; only the clause is missing. In §12.7
   the metric is given on a fixed open `U` containing the boundary and the set is all of `D⁺_U(S)`;
   in §8.4 the form exists only on `D` and on the neighbourhood `N` the solution extends to, `S` is
   open, `D` lies in a half-space with boundary, and nullity comes from maximality through the lens of
   §6.1.

   **Exact repair:** after the locator paragraph of §8.4 add: "LorentzianGeometry §12.7 proves, for a
   locally Lipschitz metric given on an open set `U` of a manifold without boundary and `S` closed in
   a slice of a temporal function, that `∂_U D⁺_U(S) ∩ {t > t₀}` is the horizon `H⁺_U(S)`, null where
   it is a `C¹` hypersurface. Statement (b) differs: the acoustical form exists only on `D` and on the
   neighbourhood `N` to which the solution extends, `S` is open, `D` is a relatively open subset of the
   half-space `H_{t₀}`, and nullity follows from maximality among developments by the lens of §6.1, not
   from achronality in a fixed spacetime; (a), for a development that need not be maximal, gives only
   spacelike or null." In the Scope bullet, add "(§9.2, §12.7 there)" after "LorentzianGeometry's as
   well". Tested on the instance that separates them: constant state `c = 1`, `v = 0`, `n = 1`,
   `S = (−1, 1)`; the truncation `{|x| < 1 − t, t < 1/2}` is a development with `D = D⁺_D(S)` whose
   top `t = 1/2` has `∂_tφ = 1 > 0 = c|∇φ|`, spacelike: (a) allows it, (b) excludes it by
   non-maximality, and §12.7 with `U = ℝ²` says nothing about it, since `D⁺_U([−1, 1])` is the full
   cone `{|x| ≤ 1 − t}`, with null boundary.

2. **F02** (P3) the bound on the second solution's cone field is not needed in §6.2 and §7.1

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §6.2, *Slab uniqueness*: "Two
   classical solutions on `[t₀, t₁) × E` with the same data on `Σ_{t₀}` and bounded cone fields on
   `[t₀, t₂] × E` for each `t₂ < t₁` agree"; §7.1, *uniqueness*: "the only classical solution on
   `[0, T) × E` with this data and bounded cone field on each `[0, t₂] × E` (§6.2)"; plan targets
   6.2.1 and 7.1.

   **Claim:** uniqueness on a slab needs both cone fields bounded.

   **Witness:** the Theorem of §6.2 with `D = O = [t₀, t₁) × E`, `S = Σ_{t₀}`: only `κ ∘ U₁` enters;
   `D⁺_D(Σ_{t₀}) = D` (§3.3, slabs, for the field of `U₁`) and `J⁻_D(p) ⊆ O`, so `U₁ = U₂` for every
   classical `U₂`. §7.3 of the same README states exactly this ("Uniqueness among all classical
   solutions").

   The statements are true as written; they are narrower than what §6.2 proves and than §7.3, which
   is derived from them, asserts. Instance without the hypothesis: Burgers `∂_tu + u∂_xu = 0` with
   `U₁ ≡ 0` (cone `(1, 0)`, bounded). A `C¹` solution `U₂` on `[0, T) × ℝ` with zero data, no bound
   assumed, is constant on the line through each point `p` with slope `U₂(p)`, which reaches `t = 0`;
   so `U₂ = 0 = U₁`.

   **Exact repair:** in §6.2 write "Two classical solutions on `[t₀, t₁) × E` with the same data on
   `Σ_{t₀}`, one of which has a cone field bounded on `[t₀, t₂] × E` for each `t₂ < t₁`, agree"; in
   §7.1 write "and the only classical solution on `[0, T) × E` with this data: the cone field of `U`
   is bounded on each `[0, t₂] × E` because `U` takes values in a compact subset of `G` there, and
   §6.2 uses the cones of one solution only"; the same wording in plan targets 6.2.1 and 7.1. On the
   Burgers instance the repaired statement applies (the field of `U₁` is `(1, 0)`) and gives
   `U₂ = 0`; the present wording would first ask for a bound on `1 + |U₂|`.

Two findings, both P3 (no P1, no P2); each carries an exact repair, so the verdict asks for changes
and a fix round applies them. Nothing else was found. Both findings of
round 7 are repaired. Every supplier citation (LorentzianGeometry, SymmetricHyperbolicSystems, PDE)
was resolved again at the present heads and on main, every pinned declaration the README names with
a file and line was reopened at the pins, the fifteen sampled sections were checked against the
cached texts, and the statements were recomputed by hand (table below). This review changed no file
of the design and did not touch the manifest. Elaboration: not available (this lane does not
elaborate; say so in the report); the design stage has no `Suggested.lean`, so the one-tactic probe
and the `#check` comparison have nothing to run on. No supplier gap is declared (`gaps: []` in
`packages/CompressibleEulerEquations/design/plan.json`, and the README says so under the supplier
contracts), so no verdict on this design is conditional on one. No maintainer note was left for this roadmap.

## Verified sound

### Round-7 findings, checked first

| Round-7 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) the composition route of §4.3 evaluates `Φ` on approximants that leave `G` | §4.3 `*Needs:*`: "the cut-off `Φ̃ = χΦ`, extended by `0` outside `G`, with `χ` smooth on `ℝ^N`, equal to `1` on the `δ/2`-neighbourhood of `K` and supported in `K_δ` … are composed with `Φ̃`, never with `Φ`"; new Check "The approximants leave `G` when `2k ≤ n`"; both contract bullets name `Φ̃`; plan 4.3.2 test `approximants_leave_G` | **Repaired.** Witness and cutoff recomputed (rows below). |
| F02 (P3) BarGinouxPfaffle2007 Definition 1.3.5 is the two-sided Cauchy development | §3.3: "BarGinouxPfaffle2007 line 1006, Definition 1.3.5, the two-sided Cauchy development `D(S)`, defined with causal curves inextendible in both directions"; *Slabs*: "the two-sided analogue is …"; §8.1 short clause; plan 3.3, 3.3.3, 8.1.1; manifest `locator` | **Repaired.** BarGinouxPfaffle2007 lines 1006–1008 read again: every inextendible causal curve, no direction. |

Repaired patterns searched in the rest of the text. A function given on `G` only, evaluated at a
mollified or cut-off object: §7.1 (the added clause, row below); §5.3 and §5.4 mollify the linear
unknown, not the argument of a coefficient; §6.1 has its cutoff `θ` with the term `(1 − θ)λI`; §7.3
keeps the cut-off data in the segment hull `K′ ⊆ G` and has a Check for a cutoff outside `[0, 1]`;
the Bona–Smith step of §7.1 uses the same mollified data. A cited definition that is a neighbouring
notion without its clause: Minguzzi2019 ("piecewise `C¹`"), MinguzziCone2019 ("closed achronal
`S`"), Chrusciel2011 ("the timelike variant", read at lines 1843–1848 and 1859) each carry one;
ChristodoulouMiao2014 lines 866–872 is the future notion. None further.

### Adversarial table

Recomputed this round by hand: the passages the repair changed or added, the fifteen sampled
targets, the headlines, and the targets the two findings touch.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §4.3 new Check, `u − Ū ∈ H¹(ℝ³)` | unit ball; shell `1 ≤ r ≤ 2`; `r ≥ 2` | ball: `|∇ϑ|² = π²(1 − t²)/r²`, `∫ = π²·∫₀¹dr·∫_{S²}(1 − t²) = π²(4π − 4π/3) = 8π³/3 ≈ 82.68`; shell: `|∇ϑ| ≤ π(|t| + (2 − r)√(1 − t²)/r) ≤ 2π`; beyond: `ϑ = 0`, `u = Ū` | sound |
| §4.3 new Check, approximant at `0` | radial kernel in the unit ball, `ε ≤ 1` | `½∫₋₁¹cos πt dt = [sin πt]/(2π) = 0`, `½∫₋₁¹sin πt dt = 0` (odd); `|J_εu(0)| = 0 < 1/2` | leaves `G` |
| §4.3 cutoff `χ` | `dist(y, K) ≤ δ/2`; `χ(y) ≠ 0`; `δ = 1/4`, `K` the unit circle | `B(y, δ/8) ⊆ K_{5δ/8} ⊆ K_{3δ/4}`: `χ = 1`; support in `K_{7δ/8}`; `K_δ = {3/4 ≤ |y| ≤ 5/4} ⊆ {1/2 < |y| < 2}`; `Φ̃(0) = 0`, `1/|0|` undefined; `|D^jχ| ≤ (8/δ)^j‖D^jψ‖_{L¹}` | sound |
| §4.3 route with `Φ̃` | limit of the approximants | `‖J_εw‖_∞ ≤ ‖w‖_∞`, `Φ̃` globally Lipschitz: `Φ̃(u_ε) → Φ̃(u) = Φ(u)` in `L²`; `Hᵏ` bound passes by §4.2 | closes |
| §7.1 added clause | `n = 3, k = 3`; `n = 1, k = 2`; `M = 0`; barotropic `K ⊆ {ρ ≥ ρ_min}`, `δ < ρ_min` | `2(k − 1) = 4 > 3`; `2 > 1`; `‖J_εw − w‖_∞ ≤ C₁‖J_εw − w‖_{Hᵏ⁻¹} ≤ C₁C₂ε‖w‖_{Hᵏ}`, `ε₀ = δ/(2C₁C₂M)`; `M = 0`: data `Ū`; density `≥ ρ_min − δ/2 > 0` | sound |
| §3.3 F02 clause | Minkowski `ℝ^{1+1}`, `S = {0} × (−1, 1)`, `p = (−1/2, 0)`, `p′ = (1/2, 0)` | `p`: every inextendible curve reaches `t = 0` at `|x| ≤ 1/2`, in `D(S)`; `x ≡ 0`, `t ≤ −1/2` misses `S`, not in `D⁺(S)`; `p′` in both | clause separates |
| §1.1 sound speed | `p = ρ²/2` at `4`; `p = ρ²` at `1/2`; Chaplygin; `e^sρ²` at `(1, 0)` | `c = 2` (wrong `c = p′`: `4`); `c = 1`; `p′ = A/ρ² > 0`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | sound |
| §1.2 expanding flow, boost | `n = 1`, `t = 1`, `w = 1` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; `ṽ = (y + 1)/(1 + t)`: `−(y + 1)/(1 + t)² + (y + 1)/(1 + t)² = 0`; wrong rule: `−1/2` | sound |
| §1.3 entropy wave | `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}` | `P = e^x e^{−x} = 1`; wrong momentum term `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2) = −e^{x/2}` | sound |
| §2.1 monotonicity, `κ` | cone `ζ₀ + w′·ζ′ ≥ c′|ζ′|`; `N = 0` | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰`; `det` of the `0 × 0` matrix `= 1`, no root | sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = [[12, 4], [4, 3]]`; `(12 − 4λ)(3 − λ) − 16 = 4λ² − 24λ + 20`, roots `1`, `5` | sound |
| §2.2 full symmetriser | `a = ∂_ρP/ρ`, `b = ∂_sP/ρ`, `d = 1 + b²/a`; `(1, 0)` | rows of `SMⁱ`: `(av, aρeᵢ, bv)`, `(aρeᵢ, ρv, bρeᵢ)`, `(bv, bρeᵢ, dv)`; `ad − b² = a`; `S = [[2,0,1],[0,1,0],[1,0,3/2]]`, minors `2, 2, 2`; `d = 1/2`: `det 0` | sound |
| §2.2 dominance | `(1, 3)`, `c = 2`; `ζ = (2, −1)`; `ζ = (−3, 1)`; `ζ′ = 0` | `min(ζ₀ + v·ζ′ − c|ζ′|) = (c′ − c − |v − w|)|ζ′|`; `2 − 3 − 2 = −3`; `σ = [[0,4],[4,0]]`, `det −16`; `σ = ζ₀A⁰` | sound |
| §3.1 form, covectors | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3,−1,0],[−1,1,0],[0,0,1]]`, `det = −3 − 1 = −4`; `(1,3,0)`: `−4 + 4 = 0`; `(1,4,0)`: `5`; `ζ = (−3,1,0)`: `ζ₀ + v·ζ′ = −2`, `g⁻¹ = −4/4 + 1 = 0`, `ζ(1,3,0) = 0` | sound; agrees with LorentzianGeometry §7.3 |
| §3.3 closed domain; expanding flow | `D = {|x| ≤ 1 + t}`; `p = ρ²/2`, `ρ₀ = 1` | `x ≡ 1.9` continues along `x = 1 + t` (speed `1`) to `(0, 1)`; `ẏ = −(1 + t)^{−3/2}`, `x = 2√(1 + t) − (1 + t)`: `0.828` at `1`, `0` at `3` | sound |
| §3.3 past-closed restriction, idempotence | inextendible curve in `D′` | its extension in `D` lies in `J⁻_D(q) ⊆ D′`, so equals it and meets `S` | sound |
| §4.1 norms | `e^{−|x|²}`, `n = 2`, `k = 2` | `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`; operator part `2π(1 − e⁻²) + π(16·5/4 − 16·3/4 + 2)e⁻² = (2 + 8e⁻²)π`; total `≈ 4.58π` | sound |
| §4.2 interpolation | `e^{−x²}`, `u(λx)` | `2√(π/2) ≤ √5·√(π/2)`; wrong pair `(2/3, 1/3)`: `λ^{1/2}` against `λ^{−1/3}·λ^{1/2} = λ^{1/6}` | sound |
| §4.4 mollifiers | `cos mx`; `u = 1`, `Λ = 2πℤ` | factor `φ̂(εm) ∈ [−1, 1]`; `‖1‖_{Hᵏ⁺¹} = ‖1‖_{Hᵏ} = √(2π)`: `1 ≤ C/ε` fails at `ε = 2C`, `1 ≤ C(1 + ε⁻¹)` holds | sound |
| §5.2 moving cone | one term of the maximum | `dχ = (e·w − M, −e)`; `M − e·w + w·e = M ≥ M|e|`, so `σ(dχ) ≤ 0` | sound |
| §5.4 statement | Jordan block; `M`-dependence | `(g − th′, h)` leaves `Hᵏ`; `dE₂/dt = 22πM` against `E₂(0) ≤ 24eπ` | sound, as round 7 |
| §6.1 lens uniqueness (headline) | `φ = 1 − |x| − t/2`, `a = 1`; base empty, lens nonempty | `−1/2 + 1 > 0`, bump enters; `φ` increases backwards along characteristics inside `L_φ`, so a nonempty spacelike lens has a nonempty base | sound |
| §6.1 cut-off operator | `A⁰ = 2`, `λ = 1`, `θ ∈ {0, 1/2, 1}` | `1`, `1.5`, `2`; support of `θ` in the `3δ/4`-neighbourhood `⊆ N_δ` | sound |
| §6.2 slab uniqueness, §7.1 uniqueness | `D = O` a slab, `U₂` unbounded allowed; Burgers, `U₁ ≡ 0` | `J⁻_D(p) ⊆ O`, `D⁺_D(Σ) = D` from `U₁` alone; characteristics of `U₂` are straight lines reaching `t = 0` | R02 |
| §7.2 Euler (headline) | `p = ρ³/3` simple wave; `n = 3` | `c = ρ`; `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `min` slope `−√2e^{−1/2}`, `T* = 1.1658`, `ρ = (w + 1)/2 ∈ [1, 3/2]`; `k = 3`: `6 > 5`, `k = 2`: `4 < 5`; continuation: `|∂_tv| ≤ |v|‖∇v‖_∞ + C‖∇ρ‖_∞`, so `v` stays bounded when the integral is finite | sound |
| §7.3 uniformly local | `p ∈ C_y ∩ C_{y′}`; `T` | `|x(t) − y′| < 1 − mt_p + m(t_p − t) = 1 − mt`; `mt ≤ 1/2`, `(t, x) ∈ C_x`; added entry `ζ₀ ≥ (c − |w|)|ζ′|`; `(1, 3)` at `(−2, 1)`: `1 ≥ 1`, entry `−2` | sound |
| §8.1 developments | `S = ∅`; `{|x| < 1 + t}`; `T = 0` | `D = ∅`; not a development; slice `∅ ≠ S` | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2`; `(2, 0)` | `c = 1`; left speeds `1, 3`; from `(2, 0)` in `T_L`: `x(t) ≤ t − 2 < t − 1`; `2 ≠ −2`; at `t = 1` the curve has `x < 0`, outside `D₂`, so `(2, 0) ∉ W₁₂` | sound |
| §8.2 compatibility, criterion | compatible pair; `U_*` on `H_{t₀}` | union: a curve leaving `D₁` above `t₀` is inextendible in `D₁` and misses `S`; `J⁻_{D₁}(p) ⊆ J⁻_{D₁∪D₂}(p) ⊆ D₂`; a curve of `U_*` leaving `D` at `a ≥ t₀` misses `S` | sound |
| §8.3 (headline) | `S = E`; counter-flow with `S = ℝ` | `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`; both towers' developments contain the slab and differ at `(2, 0)` | sound |
| §8.4 (headline) | constant state; expanding flow at `t = 1`; `M = 5`, `M = 1.05`; truncation | `c₀ = c₀|∇φ|`; `0.2929 + 0.4142 = 0.7071 = c`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `−18.2ε < x < 0.514ε`; `1 > 0` | sound; R01 |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened this round and resolves to the stated object:

- ChristodoulouMiao2014 lines 488 and 529, 530–544, 606 (1.24), 672–676 ((1.39)–(1.40)), 685,
  816–822, 833–838, 864–872, 872–880, 880–886.
- AbbresciaSpeck2022 lines 149–152 (`ℝ × 𝕋²`), 158–171 (the system, the material field, (1.3)),
  172–179 (non-vacuum `H³` data), 408–414.
- LuoYu2023a lines 82–95 (`γ ∈ (1, 3)`, the acoustical metric); LuoYu2023b lines 417–419, 910.
- Christodoulou2019 lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (normalisation `c⁻²g`).
- LukNotes lines 679, 724, 1158, 1210, 1239, 1612, 1620; Nirenberg1959 line 318.
- EperonReallSbierski2019 lines 767, 1129–1132, 1178–1183, 1195–1198, 1338–1344, 1603.
- BarGinouxPfaffle2007 lines 1006–1008, 3664–3669; Minguzzi2019 lines 1359–1364, 1917, 3576–3582,
  3716–3718; MinguzziCone2019 lines 680–683, 697–698, 1737–1740; Chrusciel2011 lines 534, 1169,
  1352, 1843–1848, 1859.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d`. All 53 name-and-line pairs the README gives in its
supplier contracts (20 of Mathlib, 33 of Tau Ceti) were compared by script with the lines around
each locator: every name is at its stated line. `LocallyLipschitzOn` is at
`Mathlib/Topology/EMetricSpace/Lipschitz.lean:72`. By object at the pins: no symmetric hyperbolic
system, Moser product or commutator estimate, Friedrichs lemma, partially periodic Sobolev space or
causal curve exists in either library (`Analysis/Calculus/Moser.lean` of Tau Ceti is Moser's
deformation of forms), as the README says.

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder, head `fc070ae`, unchanged since
  round 7): §6.1, §6.3 (the hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `B`,
  inverse, `g(X, B) = −c²dt(X)`, causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff
  `|Y − v|_h ≤ |c|`), §8.2, §11.4 (arc-length limit curves) and §12.6
  (`TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`,
  `futureDomainOfDependenceIn`, monotonicity, concatenation, time functions with the extension form
  and one-point intervals, the slab identity, `futureDomainOfDependenceIn_self`, coverings) state
  what the contract assumes. Its scope hands the fluid side, developments, maximal developments and
  local well-posedness to the hyperbolic-PDE roadmap. Its §12.7 is R01.
- **SymmetricHyperbolicSystems** (open pull request adding the folder, head `6a5cca3`, unchanged):
  §1.2 (`LinearSystem`, `apply`, `IsSymmetricHyperbolic` with `Matrix.IsSymm`; in its
  `Suggested.lean` at lines 73, 85, 92), §2.1 (same `K`), §2.2, §2.3, §7.3 resolve. Its scope puts
  quasilinear systems and the `Hˢ` theory outside it and names the quasilinear Cauchy problem as a
  consumer.
- **PDE** (main, `1a19c9f`): §1.3, §1.4, §7.1–§7.3 and "every statement below is scalar" resolve
  (README lines 769, 803, 2668, 2719, 2785, 118); its Layer 9 is quasilinear elliptic existence by
  a compact map, no hyperbolic system. Nothing of it is consumed.
- **IncompressibleFlows** (open; on the never-cite list) and **RelativisticQuantumFieldTheory**
  (RQFT1): named as boundaries only, never in a `*Needs:*` line or a contract; both passages exist
  at their heads (Layer 0, `UnitAddTorus d`; RQFT1).
- By object over main and the open heads (`roadmaps grep`): quasilinear symmetric hyperbolic
  systems, Moser estimates, equations of state and maximal developments have no other owner (the
  only other mentions are LorentzianGeometry's hand-over sentences); PositiveMass on main uses a
  tangential Friedrichs mollification inside one regularity proof and states no mollifier target.
- Overlap facts (`scratch/overlaps.md`, run again): no other open pull request changes this
  roadmap, no cited id is dropped, none is defined only by an open revision, and the roadmap is
  neither on main nor in an open pull request, so there is no second copy.
- Citation leads: the worker's one lead (`LinearSystem.IsSymmetricHyperbolic`) is the supplier's
  declaration; `roadmaps resolve`, run again, lists nothing.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE (main, and its open revision by search), SobolevPolynomialApproximation, RiemannianGeometry; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; null `C¹` horizons of `D⁺_U(S)` in a fixed spacetime — owner LorentzianGeometry §12.7, with the boundary of a maximal development owned here (R01 asks for the clause); the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here and the full-rank comparisons Checks of §4.1; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers. No notion was moved down this round.
Ownership against the open pull requests was checked through `roadmaps show` and `roadmaps grep`
at their heads; the two suppliers are not among the names of `scratch/open-pull-requests.md` nor in
the merge order, and were read through the same tools.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every definition has at least three Checks (the fewest: §1.2, §1.3 and
  §3.2 with three; §4.3 now has seven). Every theorem has a locator or says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows a source.
- Headline theorems (How to read the build): §7.2, §6.1, §8.2–§8.3, §8.4, with the definitions they
  need. There is no `Suggested.lean` at this stage, so statability, padding and the backticked-name
  check have no Lean file to run on; every backticked identifier of the README is a library or
  supplier declaration and none is presented as this roadmap's own.
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); the nine matches of "lemma" are Zorn's, Friedrichs' and a source's Lemma 6.8;
  "round" occurs only in "round cone".
- `design/plan.json`: parses; 8 layers, 53 targets (36 theorems, 12 definitions, 4 constructions,
  1 example), every definition and construction with at least three tests, no dangling `target:`
  prerequisite, roadmap prerequisites LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §12.6 and
  SymmetricHyperbolicSystems §1.2, §2.1, `gaps: []`. `sources.toml`: parses; 21 entries, the 21
  keys of the References, each cited in the body.

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

Arrangement: 109 locators; ChristodoulouMiao2014 and Majda1984 have 17 each (then
AbbresciaSpeck2022 9, LukNotes 8). ChristodoulouMiao2014's contents (lines 338–394: the Euler
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
- The pinned declarations were compared by name and line; the nine read in full in round 7 were not
  unfolded again, the pins being the same.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Scope/ownership.** LorentzianGeometry §12.7 (open pull request) proves nullity of `C¹` Cauchy horizons in a fixed spacetime; `packages/CompressibleEulerEquations/design/README.md` §8.4 proves nullity of the boundary of a maximal development. R01 keeps both.
- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests and are absent from `merge-order/ORDER.txt`; the dependency check draws no edge to them.
- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "431428f45601756dc2a7d10aef8b79c0d21b101b", "job": "REV-DESIGN-CompressibleEulerEquations~8", "model": "fable", "worker": "chris-x55"} -->
