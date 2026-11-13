<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6850452400 -->
Review (claude) of f154759

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.4 does not restate the symmetry of the coefficients

   **Location:** `packages/CompressibleEulerEquations/design/README.md:1266`–1269, "for coefficients `A^μ(t, x)`, `B(t, x)` with `A^μ − Ā^μ, B ∈ C([0, T]; Hᵏ_Λ)` … `A⁰ ≥ λ₀I`, `2k > n + 2`"; `design/plan.json` target 5.4, `hypotheses`.

   **Claim:** the listed hypotheses give a unique `W ∈ C([0, T]; Hᵏ_Λ) ∩ C¹([0, T]; Hᵏ⁻¹_Λ)` with the estimate.

   **Witness:** the README's own Jordan block (§5.1 Check, line 1115): `A⁰ = I`, `A¹ = [[0, 1], [0, 0]]`, `B = 0` meet every listed hypothesis; `W = (g − t f′, f)` leaves `Hᵏ` when `f ∈ Hᵏ \ Hᵏ⁺¹`. Line 1291 says so itself.

   The operator `L` of the layer is §5.1's, which carries the predicate, so the intended statement is true; but §5.4 re-lists the coefficient hypotheses, restates positivity and omits symmetry, and the plan's hypothesis list does the same.

   **Exact repair:** in §5.4 write "for a linear system of SymmetricHyperbolicSystems §1.2 satisfying `LinearSystem.IsSymmetricHyperbolic` with constant `λ₀` (so `A⁰` and every `Aⁱ` are symmetric and `A⁰ ≥ λ₀I`), with coefficients …"; add "`A⁰`, `Aⁱ` symmetric (the predicate of §5.1)" to the `hypotheses` of plan 5.4. On the witness the predicate fails (`A¹` is not symmetric), so the statement no longer applies to it.

2. **F02** (P3) the PDE roadmap on main does plan periodic spaces

   **Location:** `packages/CompressibleEulerEquations/design/README.md:69`–71, "it plans no hyperbolic system, no Moser estimate and no periodic Sobolev space, so nothing here duplicates it".

   **Claim:** PDE on main plans no periodic Sobolev space.

   **Witness:** `TauCetiRoadmap/PDE/README.md` on main, §7.1 line 2686 ("the periodic versions on `𝕋^d = ℝ^d/ℤ^d` by Fourier series") and §7.2 lines 2726–2729: `B^s_{p,q} = H^{s,2}` at `p = q = 2` "and the periodic versions on `𝕋^d`".

   For a full-rank `Λ` and integer order, `Hᵏ_Λ` is therefore PDE §7.2's periodic `B^k_{2,2}` after a linear change of variable, with equivalent norms: the same relation the README already records for IncompressibleFlows and `TauCeti.CircleSobolev`. Partially periodic `Λ` (the cylinder, the case used) is not in PDE.

   **Exact repair:** replace the clause by "it plans no hyperbolic system and no Moser estimate; its §7.2 plans the periodic Besov spaces on `𝕋^d = ℝ^d/ℤ^d`, whose case `p = q = 2`, integer `s = k`, is `Hᵏ_Λ` for `Λ = (2πℤ)^n` after `y = x/2π`, up to norm equivalence; nothing here uses the full-rank case, and the comparison is a Check of §4.1". Add the Check to §4.1: for `n = 1`, `cos x` becomes `cos 2πy`, of frequency `|ξ| = 1`, carried by the block `P_0` alone (`χ = 1` on the unit ball, so `ψ(ξ) = 0` there), with PDE norm squared `‖cos 2πy‖²_{L²(𝕋)} = 1/2` at every `s`, against `2π` here; the constant `1` has `1` against `2π`. The ratios `4π` and `2π` differ: equivalent, not proportional.

3. **F03** (P3) the Check on `x(t) = e^{3t}` is false on early intervals

   **Location:** `packages/CompressibleEulerEquations/design/README.md:698`–699, "`x(t) = e^{3t}` has `|ẋ − v| = 2e^{3t} > 1` and is not"; the matching test of plan target 3.2.

   **Claim:** for the field `(1, x)` the curve `e^{3t}` is not causal.

   **Witness:** `2e^{3t} > 1` iff `t > −(ln 2)/3 ≈ −0.231`. At `t = −1`, `|ẋ − v| = 2e^{−3} ≈ 0.0996 ≤ 1`: on `(−∞, −0.24]` the curve is causal.

   **Exact repair:** "`x(t) = e^{3t}` on `[0, 1]` has `|ẋ − v| = 2e^{3t} ≥ 2 > 1` and is not causal there (on `(−∞, −(ln 2)/3]`, where `2e^{3t} ≤ 1`, it is)". Same wording in the plan test.

4. **F04** (P3) the cutoff of the local energy identity needs its range and support

   **Location:** `packages/CompressibleEulerEquations/design/README.md:325`–327, "applied to `ψu` and to the coefficients `ψA⁰ + (1 − ψ)λI`, `ψAʲ`, `ψB` for a smooth cutoff `ψ` equal to `1` near a point".

   **Claim:** the cut-off system keeps `LinearSystem.IsSymmetricHyperbolic` with constant `λ`.

   **Witness:** `ψA⁰ + (1 − ψ)λI = λI + ψ(A⁰ − λI) ≥ λI` needs `ψ ≥ 0`: with `A⁰ = 2I`, `λ = 1`, `ψ = −1` at a point the matrix is `0`. The README's own §7.3 Check (line 1586) treats a cutoff with values outside `[0, 1]`.

   **Exact repair:** "for a smooth cutoff `ψ` with `0 ≤ ψ ≤ 1`, equal to `1` near the point and compactly supported in the set where `u`, `A⁰` and the `Aʲ` are `C¹`". With `ψ = 1/2` the witness gives `1.5I ≥ I`.

5. **F05** (P3) Layer 7's dependency list omits Layer 3

   **Location:** `packages/CompressibleEulerEquations/design/README.md:1612`–1614, "Layers 2, 4, 5 and 6"; line 349, "Layer 7 is local well-posedness (Layers 4–6)".

   **Claim:** Layer 7 needs Layers 2, 4, 5 and 6 only.

   **Witness:** the `*Needs:*` line of §7.3 (line 1604–1605) lists "§3.3 (slabs)", and its route uses `J⁻_{C_y}(p)` and causal curves of `κ_m` (lines 1553–1562).

   **Exact repair:** write "Layers 2, 3 (§3.3, for §7.3), 4, 5 and 6" under Layer 7's Dependencies and "(Layers 4–6, and §3.3 for uniformly local data)" in How to read the build. No order changes: Layer 3 already precedes Layer 6.

6. **F06** (P3) ONeill1983 is listed but cited nowhere

   **Location:** `packages/CompressibleEulerEquations/design/README.md:1873`–1874, "ONeill1983 — B. O'Neill, *Semi-Riemannian Geometry with Applications to Relativity*, 1983, Ch. 14"; `sources.toml` entry `ONeill1983`.

   **Claim:** the References list the works the roadmap cites.

   **Witness:** the key occurs `0` times before `## References` (every other key occurs at least once; counts below), and in no target of `design/plan.json`.

   **Exact repair:** delete the References bullet (the manifest entry stays as the author recorded it), or cite it where it is used, for instance at the Lorentzian signature in the Conventions with its locator.

Six findings, all P3 (no P1, no P2); each carries a repair, so a fix round applies them. The six findings of round 4 are
all repaired, the two new supplier contracts (LorentzianGeometry, SymmetricHyperbolicSystems) resolve
at the heads of their open pull requests, and the whole README was recomputed this round, not only
the repaired passages. No file of the design or the manifest was changed by this review.
Elaboration: not available (this lane does not elaborate; say so in the report). The design has no
`Suggested.lean`, so the one-tactic probe and the `#check` comparison have nothing to run on.
No supplier gap is declared (`gaps: []` in `design/plan.json`, and the README says so at line 334), so no
conditional gap is recorded.

## Verified sound

### Round-4 findings, checked first

| Round-4 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P2) LorentzianGeometry owns the acoustical form and `D⁺_D(S)` | Scope, lines 72–86: "LorentzianGeometry §7.3 owns the acoustical form on `ℝ × Σ` … §12.6 owns causal curves in an arbitrary subset, past-inextendibility, the future domain of dependence"; contract at lines 285–313; §3.1 line 602 "Prove the following, which LorentzianGeometry §7.3 does not state" | **Repaired.** Each cited section opened at the head of the open pull request (below). No definition of the form, causal curves or `D⁺_D(S)` remains here; every kept statement names its difference. |
| F02 (P2) linear carrier owned by SymmetricHyperbolicSystems | §5.1, lines 1078–1081: "is a linear system `LinearSystem n N` of SymmetricHyperbolicSystems §1.2 … satisfying its `LinearSystem.IsSymmetricHyperbolic`"; bridge at lines 1146–1151 | **Repaired.** Bridge recomputed (table). R01 and R04 are slips in the repaired text. |
| F03 (P3) upper bound on `M` | §8.4 (b), line 1752: "Choose `M` with `c̃ + |ṽ − ṽ(q)| < M` on a neighbourhood of `q` and `M|b| < a`" | **Repaired.** Recomputed (table). |
| F04 (P3) truncations need `T > t₀` | lines 1634, 1701, 1782 "with `T > t₀`"; Check at lines 1651–1655 | **Repaired.** No other truncation in README or plan. |
| F05 (P3) Young's convolution inequality; unnamed inputs | §4.4, line 1011–1014: "the norm of a Bochner integral is at most the integral of the norm (`MeasureTheory.norm_integral_le_integral_norm`) … no separate convolution inequality is used" | **Repaired.** All named declarations opened at the pins (below). |
| F06 (P3) Corollary 4.68 | lines 1696–1698: "which is stated for quasilinear wave equations with data on a connected hypersurface and does not apply here" | **Repaired.** EperonReallSbierski2019 lines 1338–1340 read. |

Repaired patterns searched in the rest of the text: a second owner of a construction (found R02, a P3 boundary sentence; nothing else: see the duplication audit); a missing bound in a route (none further); an unnamed library input in a `*Needs:*` line (none: every `*Needs:*` item is a named pin, a section here or a supplier section); a citation applied outside its hypotheses (none further: Corollary 4.69, Theorem 4.82, Theorem 3.2.11, the LukNotes results are each labelled as wave-equation analogues).

### Adversarial table

All eight layers were recomputed this round. Rows: the fifteen sampled targets, the headlines, the repaired passages and every target a finding touches.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 sound speed | `p = ρ²/2`, `ρ = 4`; Chaplygin; `P = e^sρ²` at `(1, 0)` | `c = 2` (wrong `c = p′`: `4`); `p′ = A/ρ² > 0`; `∂_ρP = 2`, `c = √2` | sound |
| §1.2 expanding flow, boost | `n = 1`, `t = 1`, `w = 1` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; correct boost residual `0`; `ṽ = v ∘ φ⁻¹`: `−(1+t)⁻¹ = −1/2` | sound |
| §1.3 entropy wave | `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}` | `P = e^x e^{−x} = 1`; truncated momentum term `−e^{x/2} ≠ 0` | sound |
| §2.1 monotonicity, `κ` | `(c, w) → (c′, w′)`; `N = 0` | `ζ₀ + w·ζ′ ≥ (c′ − |w − w′|)|ζ′| ≥ c|ζ′|`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰`; empty determinant `1` | sound |
| §2.2 symmetrisers | `ρ = 1`, `c = 2`, `v = 3`; full, `n = 1`, general `a = ∂_ρP/ρ`, `b = ∂_sP/ρ` | `det(A¹ − λA⁰) = 4λ² − 24λ + 20`, roots `1, 5`; `SM = [[av, aρ, bv], [aρ, ρv, ρb], [bv, bρ, dv]]` symmetric; `ad − b² = a > 0`; minors `2, 2, 2` | sound |
| §2.2 least cone | `(1, 3)`, `c = 2`: `(2, 0)`, `(5, 0)` | `ζ = (2, −1)`: `2 − 3 − 2 = −3`; threshold `2 + 3 = 5` | sound |
| §3.1 form, covectors, boost | `n = 2`, `c = 2`, `v = (1, 0)` | Gram determinant `−3 − 1 = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `ζ₀ + v·ζ′ = −2 = −c|ζ′|`, `ζ(1, 3, 0) = 0`; boosted `(1, 2, 0)`: `−4 + 4 = 0` | sound; agrees with LorentzianGeometry §7.3 (`g(X, B) = −c² dt(X)`) |
| §3.1 symbol identification | barotropic `n = 1`, `ζ = (−3, 1)`; `n = 2`, `ζ = (0, 1, 0)` | `σ = [[0, 4], [4, 0]]`, `det = −16`, `g⁻¹ = 1`; `det = 0` with `g⁻¹ = 1` | material sheet characteristic, never null |
| §3.2 integral characterisation | field `(1, 0)`: `t/2`, `2t`, `|t|`, `10·`Cantor; one-point `J` | `Δ/2 ≤ Δ`; `2Δ > Δ`; slopes `±1`; `10 > 1` with `ẋ = 0` a.e.; vacuous | both directions hold |
| §3.2 Check, field `(1, x)` | `e^{3t}` at `t = 0`, `t = −1` | `2`; `2e⁻³ ≈ 0.0996 ≤ 1` | R03 |
| §3.3 domains of dependence | constant field; closed and open `{|x| ≶ 1 + t}`; `(1, x²)`; expanding flow | `{|x − tv₀| < R − c₀t}`; exit time `s = (x + t − 1)/2 > 0` iff `x + t > 1`; `x(s) = 1/(1/4 − s)`, `x(1/2) = −4`; `ẏ = −(1+t)^{−3/2}`, `x = 2√(1+t) − (1+t)`, `0` at `t = 3`, `0.828` at `t = 1` | sound |
| §3.3 idempotence | `S ⊆ Σ_{t₀}`, extension `σ` of a curve of `D⁺_D(S)` | a curve meets `S` only at time `t₀`, so every point of `σ` lies in `D⁺_D(S)` | holds; outside §12.6's determination (`H_{t₀}` has boundary) |
| §4.1 norms | `e^{−|x|²}`, `n = 2`, `k = 2`; `cos x` on `2πℤ` | `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`; operator-norm part `2π(1 − e⁻²) + 10πe⁻² `, total `(7/2 + 8e⁻²)π ≈ 4.58π`; circle `2` and `1` against `2π`, `2π` | sound; Tau Ceti docstring read at the pin |
| §4.1 against PDE §7.2 | `cos x`, `1`, `Λ = 2πℤ` | PDE periodic `B¹_{2,2}`: `1/2`, `1`; here `2π`, `2π` | R02 |
| §4.2 interpolation | `e^{−x²}`, `j = 1`, `k = 2`; dilations | `2√(π/2) ≤ √5·√(π/2)`; wrong exponents: `λ^{1/2}` against `λ^{1/6}` | sound |
| §4.3 Gagliardo–Nirenberg, composition | `n = 1`, `k = 2`, `i = 1`; `Φ_m = sin(ms)` | both sides `λ^{3/4}`, wrong side `λ^{1/2}`, ratio `2` at `1/16`; `sin 1 ≈ 0.8415 ≤ m·m⁻¹` | sound |
| §4.4 mollifiers | `cos(mx)`; `a = sin(x/2)`, `u = sin x`; `a = x` | factor `φ̂(εm) ∈ [−1, 1]`; commutator `½[(φ̂(3ε/2) − φ̂(ε)) sin(3x/2) − (φ̂(ε/2) − φ̂(ε)) sin(x/2)]`, at `x = π`: `(5/16 − 3/16)μ₂ε² = μ₂ε²/8`; `‖ψ′‖_{L¹}` independent of `ε` | sound |
| §5.1 identity | `B = bI`; `A⁰ = √(1+x²)`, `W = (1+x²)^{−1/2}` | `E = e^{−2bt}E(0)`; `‖W‖² = π`, `‖W′‖² = π/8`, `∫_{−R}^{R} A⁰W² = 2 asinh R` | sound; same `K` as SymmetricHyperbolicSystems §2.1 |
| §5.2 speed ⇔ cone `(c, 0)` | transport `a = 1`; `c = 1/2`; cone `(1/2, 1)` | `(c, ±ω)`: `c ≥ c|ω|`, gives `∓ξ·(ΣωⱼAʲ)ξ ≤ cξ·A⁰ξ`; `ζ = (1/2, −1)`: `−1/2`; `ζ₀ + ζ₁ ≥ |ζ₁|/2` | bridge sound |
| §5.2 periodised cone | one term, unit `e` | `dχ = (e·w − M, −e)`; `(M − e·w) + w·e = M ≥ M|e|` | characteristic-monotone |
| §5.2 local identity | `A⁰ = 2I`, `λ = 1`, `ψ = 1/2`, `ψ = −1` | `1.5I ≥ I`; `0` | R04 |
| §5.3 forcing coefficient | `A⁰ = 1/(2+u)`, `U = sin mx`, `W = (δ+t)(2 + sin mx)` | `S_m ≥ ∫ r″²/3 = πm⁴/3`; `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ √(2/3)m²` | sound |
| §5.3 Burgers | `W = u` | `d/dt‖u_x‖² = −2∫u_x³ + ∫u_x³ = −∫u_x³` | tame form |
| §5.4 constant | `A⁰ = e^{sin x}`, `A¹ = M`, `w = sin x + sin 2x` | `2∫cos x w′² = 4π`, `4∫cos x w″² = 16π`, `2∫(−sin x − cos²x)w″w′ = 2π`; total `22π`; `E₂(0) ≤ 24eπ` | sound |
| §5.4 hypotheses | Jordan block | listed hypotheses hold; `W = (g − tf′, f) ∉ Hᵏ` | R01 |
| §6.1 lens uniqueness | transport, `φ = 1 − |x| − t/2`; `Λ = ℤ`, `A¹ = diag(z², 0)` | `−1/2 + 1 = 1/2 > 0`, bump enters; `∂_tu + x²∂_xu = g′(1 − 1) = 0`, `u(0.9, −1/0.3) = g(0.6)` | spacelike condition and periodicity both needed |
| §6.2 | constant state, data on `(−2, 2)` | `(1/2, 1.4)`: `1.4 < 1.5`; `(1/2, 1.6)`: no claim | sound |
| §7.1 continuation | Burgers, `u₀ = −e^{−x²}` | `min u₀′ = −√2e^{−1/2}`, `T* = e^{1/2}/√2 ≈ 1.1658` | sound |
| §7.2 Euler (headline) | `p = ρ³/3` simple wave; `I = (0.9, 2)`, `ρ_* = 1` | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* ≈ 1.1658`, `ρ ∈ [1, 3/2]`; `ρ > 0.9 > ρ_*/2` | sound; the bound `ρ ≥ ρ_*/2` holds whether or not `ρ_*/2 ∈ I` |
| §7.3 uniformly local | `F = u/(1−u)`; cone `(1, 3)` at `ζ = (−2, 1)`; gluing | exit times `0.0721`, `0.00365`, `0.0000484`; cone `1 ≥ 1`, added entry `−2`; `(t, x) ∈ C_x` for `t ≤ 1/(2m)` | sound |
| §8.1 developments | `{|x| < 1 + t}`, `{|x| < 1 − t/2}`; `T = 1/2`, `T = 0` | both have `D⁺_D(S) = {|x| < 1 − t} ≠ D`; slices `{0} × S`, `∅` | sound |
| §8.2 (headline) | counter-flow, `p = ρ²`, `ρ = 1/2` | `c = 1`; `T_L = {x < −1 + t}`, `T_R = {x > 1 − t}`; `(2, 0)` in both, `v = 2 ≠ −2`; `W₁₂`: past of a point of `T_L ∩ T_R` meets `t = 1` at `x < 0`, outside `T_R` | sound; `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}` |
| §8.2 `W₁₂ = W₂₁`, uniqueness criterion | first-exit argument; global `U_*` | `W₁₂` is relatively open (compact pasts, upper semicontinuity), so a `U₂`-curve stays `U₁`-causal up to its exit; with `O = H_{t₀}`, `W = D` | sound |
| §8.3 (headline) | `S = E`; two extensions | `J⁻_{D₁}(p) ⊆ {t ≤ t_p} ⊆ O`; `D ∩ {t < T′} = D′ ∩ {t < T}` | sound |
| §8.4 (headline) | constant state; expanding flow at `t = 1`; `φ = t − 0.9x`, `M = 5`, `1.05` | `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071 = c`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `−18.18ε < x < 0.514ε` | sound |

### Sources (seeded sample and flagged locators)

No locator is flagged unverified by the author. All fifteen sampled sections were checked at the cached texts; every locator into a certified source resolves to the stated object:

- ChristodoulouMiao2014 lines 488 (1.4), 529 (1.10), 530–544 (adiabatic condition and (1.13)), 606 (1.24), 672–676 (1.39)–(1.40), 685 (`√(−det g) = η`), 816–822 (Galilean invariance), 833–838 (2.1)–(2.3), 864–880 (developments, the uniqueness claim), 880–886.
- Christodoulou2019 lines 124–138; LuoYu2023a lines 84–95; LuoYu2023b lines 417–419 and 910 (Definition 2.13); AbbresciaSpeck2022 lines 149–152, 158–171, 172–179, 408–414; LukSpeck2018 lines 1999–2008 (Definition 3.3, normalised `c⁻²g` as the README says).
- Minguzzi2019 lines 1359–1364 (Theorem 2.12, Remark 2.13), 1917 (§2.11), 3576–3582, 3718; MinguzziCone2019 lines 680–718, 1737–1740; Chrusciel2011 lines 534, 1169, 1352, 1843–1848, 1859; BarGinouxPfaffle2007 lines 1006, 3664–3668.
- EperonReallSbierski2019 lines 767, 1129–1144, 1178–1189, 1338–1343, 1603; LukNotes lines 679, 724, 1158 (proof by Hahn–Banach, lines 1111–1188), 1210, 1239, 1612, 1620; Nirenberg1959 line 318.

Remark, no change needed: §1.2 cites (1.4), which the source writes in conservative form, at the display of the material form; the next sentence cites lines 481–529 for the equivalence, so the locator is sound.

### Pinned declarations opened (file and line at the pins)

Mathlib: `Matrix.PosDef`, `Matrix.PosSemidef` (`LinearAlgebra/Matrix/PosDef.lean:176,62`); `Matrix.IsHermitian`, `Matrix.isHermitian_iff_isSymm` (`Hermitian.lean:45,69`); `Matrix.IsSymm` (`Symmetric.lean:33`); `LipschitzOnWith.ae_differentiableWithinAt_of_mem`, `LipschitzWith.integral_lineDeriv_mul_eq` (`Analysis/Calculus/Rademacher.lean:362,170`); `LipschitzOnWith.absolutelyContinuousOnInterval` (`AbsolutelyContinuous.lean:310`); `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` (`AbsolutelyContinuousFun.lean:227`, real-valued); `BoundedContinuousFunction.arzela_ascoli` (`ArzelaAscoli.lean:113`); `zorn_le_nonempty₀` (`Order/Zorn.lean:126`); `IsPicardLindelof` (`PicardLindelof.lean:80`); `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`, `ODE_solution_unique_of_mem_Icc` (`ExistUnique.lean:57,252`); `TemperedDistribution.MemSobolev` (`Distribution/Sobolev.lean:153`); `MeasureTheory.Lp.fourierTransformₗᵢ` (`Fourier/LpSpace.lean:51`); `MeasureTheory.norm_integral_le_integral_norm` (`Bochner/Basic.lean:970`); `Real.young_inequality` (`MeanInequalities.lean:547`); `LocallyLipschitzOn` (`Topology/EMetricSpace/Lipschitz.lean:72`).

Tau Ceti: `TauCeti.Wkp` (`Wkp/Basic.lean:145`, norm docstring read); `TauCeti.HasWeakFDerivOn` (`WeakDeriv/Basic.lean:251`); `memSobolev_natCast_iff_exists_wkp_value_eq` (`BesselPotential/Basic.lean:133`); `exists_zeroAtInftyContinuousMap_ae_eq`, `TauCeti.Wkp.toZeroAtInfty` (`Embedding.lean:81,194`); the difference-quotient criterion (`DifferenceQuotient.lean:152`); `dense_contDiff_representatives` (`SmoothDensity.lean:92`); the five `normedBumpL` declarations (`ApproximateIdentity.lean:52,67,107,118,132`); `TauCeti.W1p.normedBumpL` (`W1p/Mollification.lean:87`); the six translation declarations (`Translation.lean:104,137,130,182,193,229`); the three Leibniz rules (`Leibniz.lean:112,168,317`); `TauCeti.CircleSobolev`, `norm_sq_eq_tsum` (`Circle/Basic.lean:197,375`); `toLpₗᵢ` (`Circle/Lp.lean:59`); `TauCeti.le_mul_exp_of_le_add_mul_integral` (`ODE/Gronwall.lean:59`). 45 declarations, none missing.

### Duplication and supplier-order audit

Cross-roadmap citations resolved now, at the heads of the open pull requests that add the two folders:

- LorentzianGeometry: §6.1 (`minkowskiForm E`), §6.3 (hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`; timelike = index one), §7.3 (form, `B`, `g⁻¹`, causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff `|Y − v| ≤ |c|`, time orientation `[B]`), §8.2 (locally Lipschitz causal curves, restriction, concatenation, piecewise `C¹`), §8.3, §11.4 (arc-length limit curves in a spacetime), §12.6 (`TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, monotonicity, time functions and the reduction to `t`-parametrised curves, the slab identity, `futureDomainOfDependenceIn_self`, coverings). Each statement the contract assumes is there as stated. Its Downstream consumers hands the fluid side, developments and well-posedness to the hyperbolic-PDE roadmap, and it consumes nothing here: one direction, no cycle. Not in §12.6: existence of past-inextendible extensions, causal pasts in a subset, compact pasts, openness, the Galilean boost statement; these stay here.
- SymmetricHyperbolicSystems: §1.2 (`LinearSystem`, `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic` in its `Suggested.lean`, lines 73–92; the predicate has no regularity clause, so the constant extension in time keeps it), Conventions (speed), §2.1 (pointwise identity, same `K`), §2.2, §2.3, §7.3. Its scope excludes quasilinear systems and the `Hˢ` theory and names the quasilinear Cauchy problem as consumer.
- The lead of the citation tool, "`LinearSystem.IsSymmetricHyperbolic` occurs nowhere in the pinned sources", is refuted: it is a supplier declaration (above), and the README presents it as such.
- RelativisticQuantumFieldTheory RQFT1 (boundary only), IncompressibleFlows Layer 0 (boundary only; not cited as a supplier), PDE §1.3–§1.4 and Layer 7 on main: resolved; R02 is the one inaccurate sentence.
- By object: Moser, commutator and composition estimates, Friedrichs mollifiers on `Hᵏ_Λ`, quasilinear symmetric hyperbolic systems, developments: searched in the roadmaps on main and at the open heads; no other owner. IncompressibleFlows plans torus `W^{k,p}`, `H^s` and its own bilinear estimates for the Leray-projected nonlinearity, which the Scope already bounds; YangMillsConnectionsAndCaloricGauge owns homogeneous `L²` product estimates on `ℝ⁴`, a different object.
- Overlap facts (`scratch/overlaps.md`): no other open pull request changes this roadmap, no dropped id, no id defined only by an open revision, no second copy (the roadmap is not on main and no open pull request adds its folder).

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, YangMillsConnectionsAndCaloricGauge, PDE (main and its open revision), SobolevPolynomialApproximation, OptimalTransport; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; the linear carrier, predicate and pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for arbitrary rank owned here and the full-rank agreement a Check (R02); nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 207 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD or CYCLE line. LorentzianGeometry and SymmetricHyperbolicSystems are not in `merge-order/ORDER.txt`, so the check draws no edge to them; both are other authors' open pull requests adding new roadmap folders, which the rules allow as suppliers, and neither consumes this roadmap. No `*Needs:*` line cites a roadmap on the never-cite list. No notion was moved down this round.

### Shape, style and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Checks per definition: §1.1 5, §1.2 3, §1.3 3, §2.1 5, §2.2 6, §3.1 4, §3.2 3, §3.3 4, §4.1 7, §4.4 6, §5.1 4, §5.2 5, §6.1 4, §7.3 9, §8.1 4. Every theorem carries a locator or "proved here".
- Organisation: the layers are worked back from the developments theorems; no layer is named after a source's chapter and the README does not say it follows a source.
- Headline theorems (README lines 349–356): §7.2, §6.1, §8.2–§8.3, §8.4, with the definitions they need named. There is no `Suggested.lean` at this stage.
- Style: no LaTeX delimiters, no process words, no pull-request numbers, no machine paths (searched); "later Part II" at line 107 names a roadmap, not a deferral.
- `design/plan.json`: 53 targets, every definition with at least three tests, prerequisites `roadmap:LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §12.6` and `roadmap:SymmetricHyperbolicSystems §1.2, §2.1` only, `gaps: []`; statements of 5.2, 5.4, 6.2, 7.2, 8.4.1 agree with the README.

### Copyright

Wording: twelve passages set beside their sources (the development definition against ChristodoulouMiao2014 lines 866–872; the classical uniqueness claim against lines 875–880; the equation of state against AbbresciaSpeck2022 lines 165–171; the well-posedness sentence against lines 175–179; `D⁺_D(S)` against Minguzzi2019 line 3578 and MinguzziCone2019 lines 1737–1740; the causal-curve definition against MinguzziCone2019 lines 680–683; the regular boundary against Christodoulou2019 lines 130–138; the embedding against LukNotes lines 1210–1212; the composition estimate against lines 1612–1615; the rarefaction configuration against LuoYu2023b lines 417–419; local uniqueness against EperonReallSbierski2019 lines 1178–1189). Longest shared run: five words ("the union of all developments"), a standard name. No table, figure, exercise or data set is taken over.

Arrangement: ChristodoulouMiao2014 and Majda1984 have 17 locators each of 108. ChristodoulouMiao2014's contents (lines 340–450: Euler equations and acoustical metric; null foliation; structure equations; curvature; error integrals; …) share only its §1.1 with Layer 1; Layers 2–8 have no counterpart in its chapter order.

Source independence: 12 passages compared with 8 sources, none shared; largest share ChristodoulouMiao2014 and Majda1984, 17 of 108 locators each; contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1, Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they are cited for (§§4.2–4.4, 5.1–5.4, 6.1–6.2, 7.1–7.3) were checked mathematically, not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators not checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The proof routes of §3.3 (compact pasts, openness), §6.2 (the sweep) and §8.4 (b) (the extension lens) were checked for consistency on the instances above and step by step by hand; they are proved here, with no source theorem at this generality to compare with.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Scope/ownership.** Two texts are named LorentzianGeometry: the open roadmap pull request (sections §7.3, §12.6, cited here) and the board design `packages/LorentzianGeometry/design/README.md` (lines 17, 204: acoustical form at its §1.9, §2.5). This README follows the former's numbering.
- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are open pull requests of other authors and are absent from `merge-order/ORDER.txt`; the dependency check draws no edge to them.
- **Not tested.** Majda1984 ties for the largest share of locators (17 of 108) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f1547594a3750caea2a6ba21708f701de921349d", "job": "REV-DESIGN-CompressibleEulerEquations~5", "model": "fable", "worker": "chris-x51"} -->
