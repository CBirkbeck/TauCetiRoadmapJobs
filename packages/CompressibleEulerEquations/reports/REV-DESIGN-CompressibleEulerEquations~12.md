<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6899942690 -->
Review (claude) of beb3f36

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.1 continuous dependence: the approximating data are not kept in the class for which `[0, T]` is an existence interval

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §7.1, bullet *continuous
   dependence*: "if `U₀^m → U₀` in `Ū + Hᵏ_Λ` with values in `K`, the solutions converge in
   `C([0, T]; Hᵏ_Λ)`"; the same clause in plan target 7.1 ("depends continuously on the data").

   **Claim:** the solutions of the data `U₀^m` are defined on `[0, T]`, `T = T(M, K)`.

   **Witness:** `N = n = 1`, `G = ℝ`, `K = [−1, 1]`, `‖U₀ − Ū‖_{Hᵏ_Λ} = M` with `sup |U₀| < 1`,
   `U₀^m = Ū + (1 + 1/m)(U₀ − Ū)`: values in `K` for large `m`, norm `M(1 + 1/m) > M`. The existence
   clause gives these data only `T(M(1 + 1/m), K)`, which the statement does not bound below by `T`.

   **Exact repair:** in §7.1 and in plan target 7.1 write "if `U₀^m → U₀` in `Ū + Hᵏ_Λ` with
   `‖U₀^m − Ū‖_{Hᵏ_Λ} ≤ M` and values in `K`, the solutions, which exist on `[0, T]` by the
   existence clause, converge in `C([0, T]; Hᵏ_Λ)`". On the witness the data `U₀^m` are then
   excluded, and `U₀^m = Ū + (1 − 1/m)(U₀ − Ū)` (norm `M(1 − 1/m) ≤ M`, values in `K`) is covered,
   with every solution on `[0, T(M, K)]`. The statement for data outside the ball (true for large
   `m`, since the solution of `U₀` continues past `T`) is not needed by §7.2, §7.3 or §8.3.

2. **F02** (P3) the supplier's notion of speed is cited at §1.2; it is defined in its Conventions

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, "From
   TauCetiRoadmap.SymmetricHyperbolicSystems", first bullet: "§1.2: the structure `LinearSystem n N`
   … its notion of a speed `c ≥ 0`"; the `suppliers` entry of
   `packages/CompressibleEulerEquations/design/plan.json` ("its notion of speed (§1.2)").

   **Claim:** SymmetricHyperbolicSystems §1.2 defines the speed.

   **Witness:** at the head of SymmetricHyperbolicSystems, the definition
   (`|ξ ⬝ᵥ ((Σⱼ ωⱼ Aʲ) *ᵥ ξ)| ≤ c (ξ ⬝ᵥ (A⁰ *ᵥ ξ))`, for all `(t, x)`, `‖ω‖ ≤ 1`) is the paragraph
   "Propagation speed" of its Conventions; §1.2 has only the bullet "A speed exists when the `Aʲ` are
   bounded".

   **Exact repair:** write "its notion of a speed `c ≥ 0` (its Conventions, *Propagation speed*; §1.2
   gives the existence of one for bounded `Aʲ`)" in the bullet, and "(Conventions)" in the plan's
   supplier entry. The statement compared in §5.2 is unchanged: the supplier's formula is the one the
   README quotes, and §5.2 already says it uses it at a point.

Two findings, both P3 (one missing clause in the continuous-dependence statement of §7.1, one
supplier locator); no P1 or P2. Each has a repair to apply, so the verdict asks for changes. The single finding of round 11 is repaired. The repaired and added
passages of §8.4, the fifteen sampled sections, the sections the round-11 table had no row for
(§1.3, §2.1, §4.1, §5.1, §8.1) and the headlines were recomputed by hand (table below). Both
supplier roadmaps were read at their open heads, all 55 pinned name-and-line pairs were opened, and
every locator of the sampled sections into a readable text was opened. This review changed no file
of the design and did not touch the manifest. Elaboration: not available (this lane does not
elaborate; say so in the report); the design stage has no `Suggested.lean`, so the one-tactic probe
and the `#check` comparison have nothing to run on. No supplier gap is declared (`gaps: []` in
`packages/CompressibleEulerEquations/design/plan.json`), so no verdict here is conditional on one.
No maintainer note was left for this roadmap. No text read contained instructions.

## Verified sound

### Round-11 finding, checked first

| Round-11 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P3) the route of "Developments inside a slab" takes `Ũ = U`, which need not be Λ-periodic | §8.4: "Route: (b) on an open ball `N₁ ⊆ N` about `q` of diameter less than the least norm of a nonzero period (any open ball about `q` inside `N` when `Λ = 0`) … with `Ũ(t, x + λ) = U(t, x)` for `(t, x) ∈ N₁` and `λ ∈ Λ`"; new Check "The slab solution need not be Λ-periodic off `D`"; *Needs:* "§1.2 and §1.3 (Λ-translates of solutions) for the translated extensions"; plan 8.4.2 route and test `slab_solution_not_periodic` | **Repaired.** Recomputed below. |

Passages the repair changed or added: the route and Check above; the bullet *Regular boundary
hypersurfaces* ("a classical extension of `U` to `N` and, Λ-periodically, to its Λ-translates, as
(b) requires (an extension to `N` alone gives one on a smaller ball about `q` …)"); the last
sentence of the slab-top Check ("by dropping the condition on developments"); plan 8.4.1 and
8.4.2. All four agree with one another and with (b).

Repaired pattern searched in the rest of the text (an extension used in (b) that is not known to
be Λ-periodic, or a solution assumed periodic off its development): §8.3 (the development is
`(D⁺_O, U)` and periodicity is claimed on `D⁺_O` only; verified below), §8.2 uniqueness criterion
(`U_*` is assumed Λ-periodic in the statement), §6.1 (periodicity of both solutions is a
hypothesis, with a Check), §7.3 (periodicity derived from uniqueness), the Checks of §8.4 other
than the new one (`Λ = 0`). None further.

### Adversarial table

Recomputed by hand this round. Coordinates `(t, x)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §8.4 slab route (repaired) | `n = 1`, `Λ = ℤ`, `c₀ = 1`, `S = ⋃(k, k + 1/2)`, bump of `w⁻ = v − ∫c/ρ` on `(0.52, 0.6)`, `q = (0.2, 0.3)`, `N = B(q, 0.05)` | `w⁺` constant, so a simple wave; characteristic from `1/2` is `x = 1/2 − t` (state unperturbed on `[1/2, 0.52]`); distance from `q` to `x = t`: `0.1/√2 = 0.0707 > 0.05`; `(0.21, 0.33)`: `x + t = 0.54 ∈ (0.52, 0.6)`, `U ≠ (ρ₀, 0)`; `N + 1`: `x > 1.25 > 0.6 + 2·0.25 = 1.1`, `U = (ρ₀, 0)`; `Ũ` on `N₁ + 1`: translate, equals the constant state on `D ∩ (N₁ + 1)`; `φ = x − 1/2 + t`: `1 + 0 = 1·1` | sound |
| §8.4 slab statement, "largest in `O`" | a development `(D′, U′)`, `D′ ⊆ O`; `Λ = 0`; `S = E` | `J⁻_{D′}(p) ⊆ D′ ⊆ O`, so `U′ = U` on `D′` (§6.2); a `U`-curve from `p ∈ D′` leaving `D′` backwards does so at `a > t₀` or at `t₀` outside `S`, giving a past-inextendible curve in `D′` missing `S`; `⋃(N₁ + λ) = N₁`; `∂D ∩ {t₀ < t < t₀ + T} = ∅` | sound |
| §8.4 hypersurface bullet (repaired) | extension on `N` only; non-maximal `D` | translate on `N₁ ⊆ N`: `p + λ ∈ D ⇒ p ∈ D`, `U(p + λ) = U(p) = Ũ(p + λ)`; a development inside `D ∪ ⋃(N₁ + λ)` is one inside `D ∪ ⋃(N + λ)`, so the hypothesis for `N` gives it for `N₁` | sound |
| §8.4 (a), (b) | `{|x| < 1 − t/2}`; `b = 0`; truncation top `(1/2, x_q)`; lens `M = 5`, `1.05` | `X = −(1, v − θcb/|b|)`: `dφ(X) = −(a − θc|b|) > 0` near `θ = 1` when `a < c|b|`; `1/2 < 1`; `a = c̃·0 = 0` contradicts `dφ(q) ≠ 0`; `|x(t)| < |x_q| + r + 1/2 − t < 1 − t`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `|x| + 0.945x < ε`: `−18.2ε < x < 0.514ε` | sound |
| §8.4 Checks | ball; expanding flow at `(1, 2√2 − 2)`; `(1/2, 1/2)` and `(1, 5)` of `{x > t, t < 1}` | `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071 = 2^{−1/2}`; `1 = 1·1`; `1 > 0` and `x(t) > 5 − r − 1 + t > t` | sound |
| §1.2 system, boost | expanding flow `n = 1`, `t = 1`, `w = 1` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; `ṽ = (y + 1)/(1 + t)`: `−(y + 1)/(1 + t)² + (y + 1)/(1 + t)² = 0`; wrong rule: `−(1 + y)/(1 + t)² + (y − t)/(1 + t)² = −1/(1 + t) = −1/2` | sound |
| §1.3 full system | `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}`; `(1, 0, t)` | `P = eˣe^{−x} = 1`; wrong momentum `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2) = −e^{x/2}`; `Bs = 1` | sound |
| §2.1 carrier | wave system `ζ = (1/2, e₁)`, `n = 1` at `(0, 1)`; monotonicity; `κ` | `1/2 − 1 = −1/2`; `[[0, −1], [−1, 0]]`, `λ² − 1`; `ζ₀ + w·ζ′ ≥ c′|ζ′| − |w′ − w||ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰` | sound |
| §2.2 symmetrisers | `ρ = 1`, `c = 2`, `v = 3`; full `S` in general and at `(1, 0)`; `ζ = (−3, 1)`; `(2, 0)` at `ζ = (2, −1)` | `A¹ = [[12, 4], [4, 3]]`, `4λ² − 24λ + 20 = 4(λ − 1)(λ − 5)`; `SMⁱ` rows `(avⁱ, aρeᵢ, bvⁱ)`, `(ρaeᵢ, ρvⁱ, ρbeᵢ)`, `(bvⁱ, bρeᵢ, dvⁱ)`: symmetric; `ad − b² = a`; minors `2, 2, 2`, `d = 1/2`: `0`; `[[0, 4], [4, 0]]`, `det = −16`; `2 − 3 − 2 = −3`; least cone: `c′|ζ′| + (v − w)·ζ′ ≥ c|ζ′|` for all `ζ′` iff `c′ ≥ c + |v − w|` | sound |
| §3.1 form, covectors | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −3 − 1 = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `ζ₀ + v·ζ′ = −2`, `g⁻¹ = −1 + 1 = 0`, `ζ(1, 3, 0) = 0`; `min_{|u|≤1}(ζ₀ + v·ζ′ + cu·ζ′) = ζ₀ + v·ζ′ − c|ζ′|`; agrees with LorentzianGeometry §7.3 (`g(X, B) = −c²dt(X)`, inverse `−c⁻²B⊗B + h⁻¹`) | sound |
| §3.2 integral characterisation, Checks | field `(1, x)`; Cantor curve; converse direction | `e^{3t}`: `|3e^{3t} − e^{3t}| = 2e^{3t}`, `0.0996` at `−1`; `10 > 1`; the inequality gives a local Lipschitz bound, then `|ẋ − v| ≤ c` at Lebesgue points | sound |
| §4.1 norms | `n = 2`, `k = 2`, `e^{−|x|²}`; circle `cos x` | `π/2`, `π`, `(3 − 4 + 4)π/2 = 3π/2`, `16·(1/16)·π/2 = π/2`, sum `7π/2`, total `5π`; operator norm: `2π(1 − e^{−2}) + 2π·½·(20 − 12 + 2)e^{−2} = (2 + 8e^{−2})π`; `2·4·¼ = 2` against `2π`, constants `1` against `2π` | sound; Tau Ceti's norm as in the module docstring of `TauCeti/Analysis/Sobolev/Wkp/Basic.lean` lines 28–36 |
| §4.3 Gagliardo–Nirenberg, products, composition | Nirenberg's relation; scaling; `sin(ms)`; the circle-valued map on `ℝ³` | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; both sides `λ^{i − ni/(2k)}`, wrong `λ^{−1/4}`: `2` at `1/16`; Hölder `(|β| + |α − β|)/(2|α|) = 1/2`; product of the factors `‖u‖_∞^{j−1}‖u‖_{Hᵏ}`: linear; `sin 1 = 0.8415`; `|∇(x₃/|x|)|² = (1 − t²)/|x|²`, `π²·2π·4/3 = 8π³/3`, sphere means `(0, 0)` | sound |
| §4.4 mollifiers | `a = sin(x/2)`, `u = sin x`; `a = x`; loss constant; two-bump kernel | commutator at `π`: `½(μ₂ε²/2)(−2 + 9/4 + 1/4) = μ₂ε²/8`; `ψ = −zφ_ε`, `‖ψ′‖_{L¹} = ∫|φ + wφ′|`; `Σ_{|α|≤k−1}Σᵢ‖∂ᵢ∂^αu‖² ≤ n‖u‖²_{Hᵏ}`, `C = √n∫|y|φ`; `J_ε = ½(τ_{2ε} + τ_{−2ε})(η_ε ⋆ ·)` | sound |
| §5.1 identity | `A⁰ = √(1 + x²)`, `W = (1 + x²)^{−1/2}`; `B = bI` | `‖W‖² = π`, `‖W′‖² = ∫x²(1 + x²)^{−3} = π/8`, `∫A⁰W² = 2 asinh R`; `E′ = −2bE` | sound |
| §5.2 weights (used by §6.1) | transport `a = 1`; periodised cone; speed against cone | `−1 − sign x ≤ 0`; `dχ = (e·w − M, −e)`, `M − e·w + w·e = M ≥ M|e|`; `ξ·σξ ≥ (ζ₀ − c|ζ′|)ξ·A⁰ξ`, and `ζ = (c, ±ω)` gives `∓ξ·(ΣωA)ξ ≤ cξ·A⁰ξ` | sound |
| §5.4 linear existence | third Check, `w = sin x + sin 2x` | `∫cos x (w′)² = 4·π/2 = 2π`; `∫cos x (w″)² = 8·π/2 = 4π`; `∫(−sin x − cos²x)w″w′ = π + 0`; `2·2π + 4·4π + 2π = 22π`; `E₂(0) ≤ e(2π + 5π + 17π)` | sound |
| §6.1 lens uniqueness (headline) | `A¹ = diag(z², 0)`, `Λ = ℤ`; cut-off | `g′·(1 − x²/x²) = 0`, `0.9 − 0.3 = 0.6`; `λI + θ(A⁰ − λI)`: `1.5` at `θ = 1/2` | sound |
| §6.2 Theorem, slab uniqueness | constant state on `(−2, 2)`; compact pasts | `1.4 < 1.5 < 1.6`; `J⁻_D(p) ∩ Σ_{t₀}` is a compact subset of the relatively open `S ∩ O`, so the neighbourhood `N` exists | sound |
| §7.1 well-posedness | Burgers `u₀ = −e^{−x²}`; range of `U`; data on the sphere of radius `M` | `min u₀′ = −√2e^{−1/2}`, `T* = 1.6487/1.4142 = 1.1658`; closure of the range is the range with `Ū`, compact in `G`; `M(1 + 1/m) > M` | sound except the clause of R01 |
| §7.2 Euler (headline) | `p = ρ³/3`; `n = 3`; `I = (1, 2)`, `ρ_* = 1.1` | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `ρ = (w⁺ + 1)/2 ∈ [1, 3/2]`, `T* = 1.1658`; `6 > 5`, `4 < 5`; `ρ ≥ 0.55` is implied by `ρ ∈ I` | sound |
| §7.3 uniformly local | gluing; `F = u/(1 − u)`; switched symbol | `|x(t) − y′| < 1 − mt_p + m(t_p − t)`; `t ≤ 1/(2m)` gives radius `1 − mt ≥ 1/2`; `log u − u`: `0.4055 − 0.3333 = 0.0721`, `0.08664 − 0.08299 = 0.00365`; `ζ₀ ≥ (c − |w|)|ζ′| ≥ 0`; `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2` | sound |
| §8.1 developments | `S = ∅`; order bullet; truncation | a one-point curve has a past-inextendible extension, so `D⁺_D(∅) = ∅`; exit at `t₀` impossible since `D′ ∩ Σ_{t₀} = D ∩ Σ_{t₀}`; `D′ = D ∩ D′ ⊆ D⁺_{D′}(S)` by §3.3 | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2`; `W₁₂ = W₂₁`; union of a compatible pair | `c² = 2ρ = 1`; edges `−1 + t`, `1 − t`, disjoint iff `t < 1`; `(2, 0)`: `0 < 1`, `0 > −1`, `2 ≠ −2`; slice of `D₁ ∩ D₂` at `t = 1`: `x < 0` and `x > 0`, empty; a `U₂`-curve from `p` stays in the compact `J⁻_{D₁}(p)` inside the open `W₁₂` where the fields agree; first exit from `D₁` in `D₁ ∪ D₂` is at `a > t₀` | sound |
| §8.3 (headline) | non-periodic extension; `S = E` | `U = τ_λU` on `J⁻_O(p)` by §6.2 with `U₂ = τ_λU`, and `γ − λ` stays in `J⁻_O(p)`, so `D⁺_O` is Λ-invariant; `J⁻_{D′}(p) ⊆ {t ≤ t_p} ⊆ O` | sound |
| Worked example, full data | `S = ℝ`, slab `[0, T′) × ℝ` with `T′ < 1`, towers | the slab solution is the left state on `T_L ∩` slab (§6.2 with `D = T_L`); `(2, 0)` lies in both towers and in neither slab | sound |

A remark that needs no change here: the Besov Check of §4.1 uses PDE §7.1 as it is on main (`χ = 1`
on the unit ball, `P_j` with `ψ(2^{−j}·)` for `j ≥ 1`), and its values (`1/2` and `1`) follow from
that text.

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened and resolves to the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 530–544 ((1.11)–(1.13),
  adiabatic motion and constant entropy), 606 ((1.24)), 672–676 ((1.39)–(1.40)), 685, 818–822,
  833–838 ((2.1)–(2.3)), 864–872, 872–880, 880–886.
- AbbresciaSpeck2022 lines 149–152, 158–171 ((1.1a)–(1.3)), 172–179, 408–414; LuoYu2023a
  lines 82–95 (`γ ∈ (1, 3)` at line 88); LuoYu2023b lines 417–419 and 910 (Definition 2.13);
  Christodoulou2019 lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (Definition 3.3,
  normalisation `c⁻²g`); Nirenberg1959 line 318 (the Theorem; the text is an OCR and its displayed
  inequality is not legible).
- LukNotes lines 679 (Proposition 4.1), 724 (Proposition 4.4), 1158 (Theorem 5.3), 1210
  (Theorem 5.5), 1239 (Theorem 6.1), 1612 (Lemma 6.8, `F(0) = 0`), 1620 (Theorem 6.10).
- EperonReallSbierski2019 lines 767 (Theorem 3.45), 1129–1132, 1178–1182 (Proposition 4.63),
  1195–1198, 1338 and 1342 (Corollaries 4.68, 4.69), 1603 (Theorem 4.82).
- BarGinouxPfaffle2007 lines 1006–1008 (Definition 1.3.5), 3664–3668 (Theorem 3.2.11);
  Minguzzi2019 lines 1359–1364 (Theorem 2.12, Remark 2.13), 1917 (§2.11), 3576–3582, 3716–3718;
  MinguzziCone2019 lines 680–697, 698, 1737–1740; Chrusciel2011 lines 534, 1169, 1352, 1843–1848,
  1859; Speck2016 line 1343 (§1.11).

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the checkouts' heads equal the revisions of
`lake-manifest.json`). All 55 name-and-line pairs of the supplier contracts (20 of Mathlib, 35 of
Tau Ceti) were tested by script at their stated lines; each line carries the named declaration.
Signatures read in full: `zorn_le_nonempty₀` (`Mathlib/Order/Zorn.lean:126`, nonempty chains with a
base point), `LipschitzWith.integral_lineDeriv_mul_eq` (`Mathlib/Analysis/Calculus/Rademacher.lean:170`,
`g` compactly supported), `TauCeti.le_mul_exp_of_le_add_mul_integral`
(`TauCeti/Analysis/ODE/Gronwall.lean:59`, `φ` continuous, `0 ≤ K`),
`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient`
(`TauCeti/Analysis/Sobolev/Translation.lean:133`, for `u ∈ w1p0Submodule`),
`TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le`
(`TauCeti/Analysis/Sobolev/Wkp/Interpolation.lean:335`, constant `(finrank ℝ E)² / ε`). The
README states each with these hypotheses.

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1
  (`minkowskiForm`), §6.3 (hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `B`,
  inverse, `g(X, B) = −c² dt(X)`, causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff
  `|Y − v|_h ≤ |c|`, used in §12.6 on subsets where only continuity is known), §8.2, §8.3, §9.2,
  §11.4, §12.6 (the four declarations, monotonicity, concatenation, time functions with the
  extension form and one-point intervals, the slab identity, `futureDomainOfDependenceIn_self`
  for `S` closed in an open set of a manifold without boundary, coverings) and §12.7 (horizons
  of `S` closed in a slice, null where `C¹`) exist and state what the README assumes or compares
  with. `minkowskiForm`, `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`,
  `IsPastInextendibleIn`, `futureDomainOfDependenceIn` and `futureDomainOfDependenceIn_self` are
  declared in its `Suggested.lean`. Its §7.3 and Downstream consumers leave the fluid side, the
  developments `D = D⁺_D(S)` and their uniqueness to a hyperbolic-PDE roadmap.
- **SymmetricHyperbolicSystems** (open pull request adding the folder; read at its head): §1.2
  (`LinearSystem n N`, `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic` with `IsSymm` and
  `lam * (ξ ⬝ᵥ ξ) ≤ ξ ⬝ᵥ (A0 *ᵥ ξ)`, all in its `Suggested.lean`), §2.1 (the same `K`), §2.2 (single
  speed, `F = 0` on the cone, smoothed weight), §2.3, §7.3 resolve; the speed is in its
  Conventions (R02). Its Scope puts quasilinear systems and the `Hˢ` theory outside it, and its
  Downstream consumers name the quasilinear Cauchy problem as a consumer.
- **PDE** (main): §1.3, §1.4 and Layer 7 with §7.1–§7.3 exist on main under these numbers.
  Nothing of it is consumed.
- **IncompressibleFlows** (never-cite list) and **RelativisticQuantumFieldTheory**: named as
  boundaries only; `UnitAddTorus d` is the periodic setting of IncompressibleFlows at its head.
- By object over main and the open heads (`roadmaps grep`): "symmetric hyperbolic" only in
  SymmetricHyperbolicSystems and one line of LorentzianGeometry; "Gagliardo–Nirenberg
  interpolation", "Kato–Ponce" and "CompressibleEulerEquations" have no match; "Moser estimate"
  only a DGFloer sentence; "Friedrichs mollification" one tangential use inside a PositiveMass
  proof; "maximal development", "equation of state" and "compressible Euler" only
  LorentzianGeometry's deferral sentences and IncompressibleFlows' title lines; "uniformly local"
  nothing in analysis. No roadmap cites CompressibleEulerEquations.
- Overlap facts (`roadmaps overlaps`, run again): the roadmap is neither on main nor in an open
  pull request: no second copy, no other pull request changes it, no cited id is dropped, none
  is defined only by an open revision. `roadmaps resolve`, run again: no cross-roadmap citation
  and no Lean name found nowhere.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE, SobolevPolynomialApproximation, RiemannianGeometry; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §12.7, with the boundary of a development owned here and the difference stated in §8.4; the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers; the layer `### Dependencies` lines agree
with them (Layer 4 needs no earlier layer; Layer 6 needs 2, 3, 5; Layer 7 needs §6.2, which forces
uniqueness before well-posedness). No notion was moved down this round.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every definition has at least three Checks; every theorem has a locator or
  says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows one.
- Headline theorems ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4. There is no
  `Suggested.lean` at this stage; every backticked identifier is a library or supplier declaration.
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); "lemma" occurs only in Zorn's and Friedrichs' lemma and in a source's Lemma 6.8.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions, 4 constructions,
  1 example), every definition and construction with at least three tests, no dangling `target:`
  prerequisite, `gaps: []`; 8.4.1 and 8.4.2 agree with the README. `sources.toml`: 21 entries, the
  21 keys of the References (14 certified, 3 uncertified, 4 waived).

### Copyright

Wording: fourteen passages set beside their sources: the equation of state (AbbresciaSpeck2022
lines 165–171); the Euler system (LuoYu2023a lines 82–88); the definition of a development
(ChristodoulouMiao2014 lines 866–872); the classical uniqueness claim (lines 875–880); entropy
propagation (lines 541–544); the acoustical form (lines 672–676; LukSpeck2018 lines 1999–2008);
the slab statement of §8.4 (LuoYu2023b lines 417–419); the regular boundary (Christodoulou2019
lines 130–138); `D⁺_D(S)` (Minguzzi2019 lines 3576–3578, MinguzziCone2019 lines 1737–1740,
BarGinouxPfaffle2007 lines 1006–1008, Chrusciel2011 lines 1843–1846); the embedding and the
composition estimate (LukNotes lines 1210–1212, 1612–1614); the uniqueness criterion
(EperonReallSbierski2019 lines 1338–1344). Longest shared run: five words ("the union of all
developments"), where the README reports the source's claim in order to refute it. No table,
figure, exercise or data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16
(AbbresciaSpeck2022 and LukNotes 8 each). Of ChristodoulouMiao2014 only its §1.1, §1.2 and §2.1
meet Layer 1, §3.1 and §8.1; Layers 2 and 4–7 have no counterpart there and no run of layers
follows its chapters.

Source independence: 14 passages compared with 12 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1,
  Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they are
  cited for were checked mathematically, not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators not
  checked.
- Nirenberg1959: the theorem is at line 318, but the OCR does not render its inequality or the
  number (2.2); the exponents of §4.3 were checked by Nirenberg's dimensional relation and scaling.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §3.2 (limit curves), §3.3 (openness), §6.2 (the sweep), §7.1 (the iteration and the
  Bona–Smith step) and §8.4 (b) (the extension lens) have no source theorem at this generality in a
  readable text; they were checked step by step by hand and on the instances of the table.
- The pinned declarations were compared by name and line, five of them by full signature; their
  bodies were not unfolded.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt`, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry's Downstream consumers also assign characteristic data and "characteristic iff null" to the hyperbolic-PDE roadmap; this design states the Euler-symbol form (§3.1) and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "beb3f362411e5c9a1333fb04a3fd579d4ecff7dc", "job": "REV-DESIGN-CompressibleEulerEquations~12", "model": "fable", "worker": "chris-x82"} -->
