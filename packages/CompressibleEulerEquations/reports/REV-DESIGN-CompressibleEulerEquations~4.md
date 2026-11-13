<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6849208179 -->
Review (claude) of d8d0163

Verdict: needs_changes

1. **F01** (P2) LorentzianGeometry owns the acoustical form and `D⁺_D(S)` at its open head; the README calls it a consumer and cites sections it does not have

   **Location:** `packages/CompressibleEulerEquations/design/README.md:71`–73, "LorentzianGeometry is a consumer, never a supplier: its §1.9 takes the acoustical form of §3.1 as an example … and its §2.5 owns the acoustical metric on manifolds"; also lines 38–45 (ownership), §3.1–§3.3 (lines 483, 533, 588), lines 1626–1630, and the `consumers` and empty `suppliers` of `design/plan.json`.

   **Claim:** this roadmap alone owns the acoustical form, its time-parametrised Lipschitz causal curves, past-inextendibility and `D⁺_D(S)`, and LorentzianGeometry §1.9 and §2.5 consume them.

   **Witness:** open pull request #2232, `TauCetiRoadmap/LorentzianGeometry/README.md`: §7.3 (line 1302) defines `g = −c² dt² + h(dx − v dt, dx − v dt)`, `g⁻¹` and `B`; §12.6 (line 2060) defines `futureDomainOfDependenceIn`; line 2343 has the Euler roadmap consume both. Layer 1 stops at §1.2; §2.5 (line 706) is curvature identities.

   The two texts agree on the object, so this is one object with two owners, each naming the other as consumer. Recomputed on both sides: for `c = 1`, `v = 2`, `n = 1` the Gram matrix is `[[3, −2], [−2, 1]]` with determinant `−1 = −c²` and `g(B, B) = 3 − 8 + 4 = −1` in both; for constant `(c, v)` and half-space data both give the domain bounded by `x¹ = (v¹ + c)t`; both characterise time-parametrised causal curves by `|ẋ − v| ≤ c` almost everywhere. #2232 takes `c`, `v` as given fields and consumes nothing of this roadmap, so importing from it creates no cycle. It adds a new roadmap folder, so it may be a supplier.

   This does not re-raise round 2's R12. That finding compared two board designs and was repaired here. The evidence now is the head of #2232, which the round-3 index did not contain.

   **Exact repair:**

   - Scope: replace the "consumer, never a supplier" sentence. LorentzianGeometry §7.3 owns the acoustical form on `ℝ × Σ` (form, inverse, `B`, causal vectors, time orientation); its §12.6 owns causal curves in subsets, past-inextendibility, `D⁺_D(S)`, monotonicity, the slice identity `D⁺_D(S) ∩ {t = t₀} = S ∩ D`, concatenation and covering invariance.
   - Add `### From TauCetiRoadmap.LorentzianGeometry` to the supplier contracts with those two sections. Change line 235 ("No roadmap is a supplier"), the *Needs:* lines of §3.1–§3.3, the Layer 3 Dependencies and the plan's `suppliers`, `consumers` and prerequisites to match.
   - §3.1–§3.3: delete the definitions and API bullets those sections state. Keep, each with one clause saying how it differs, what #2232 lacks: the determinant and the identification with the Euler symbol (§3.1); the integral characterisation; limit curves for fields continuous only on `D`; compact pasts; openness and idempotence for relatively open `S` (its "determination" bullet is for `S` closed in an open `U`); bounded slabs; past-closed restriction. Check each kept bullet against its §8.2, §10.3, §11.4 and §12.6–§12.7 before keeping it.
   - Keep the zero-vector bridge: §7.3 there has `dt(X) ≠ 0` for causal `X`, while the cone `g(X, X) ≤ 0` here contains `0`.
   - Downstream consumers: delete the LorentzianGeometry bullet (lines 1626–1630).

   If the maintainers prefer this roadmap as owner, that is their decision to record; no such note exists, so the default applies.

2. **F02** (P2) The linear symmetric hyperbolic carrier and its energy method have a second owner in SymmetricHyperbolicSystems

   **Location:** `packages/CompressibleEulerEquations/design/README.md:938`–954, "Define a *linear symmetric hyperbolic operator* on `[0, T] × E` … Prove the Friedrichs energy identity"; §5.2 (line 977); Scope lines 49–51; plan targets 5.1, 5.1.1, 5.2.

   **Claim:** this roadmap owns linear symmetric hyperbolic operators, their energy identity, the `L²` estimate and localised (finite-speed) energies, and no roadmap is a supplier.

   **Witness:** open pull request #2246, `TauCetiRoadmap/SymmetricHyperbolicSystems/README.md`: §1.2 (line 216) defines `LinearSystem n N` and `IsSymmetricHyperbolic`; §2.1 (line 281) the identity with `K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ`; §2.2 (line 304) finite propagation speed; §2.3 (line 343) uniqueness and the `L²` estimate.

   Both texts write the operator as `A⁰∂ₜu + Σ Aʲ∂ⱼu + Bu` and obtain the same `K`. Its "speed `c`" is this roadmap's "the round cone `(c, 0)` dominates": for `ζ₀ ≥ c|ζ′|`, `σ(ζ) ≥ (ζ₀ − c|ζ′|)A⁰ ≥ 0`, and `ζ₀ = c|ζ′|` gives the converse. For transport `a = 1` both get least speed `1`. Its §2.2 is the case `Λ = 0`, `w = 0`, smooth weight of §5.2 here. #2246 puts quasilinear systems and the `Hˢ` theory outside its scope (line 41) and names the quasilinear Cauchy problem as the consumer of its §2.1–§2.3 and §7.3 (lines 864–867). So Layers 2 and 6–8 here and the `Hᵏ_Λ` statements are not duplicated. It adds a new roadmap folder and consumes nothing here.

   **Exact repair:**

   - Scope: add a boundary bullet. SymmetricHyperbolicSystems owns the linear system carrier and the symmetric-hyperbolicity predicate (§1.2), the pointwise and integrated energy identity for classical solutions (§2.1, §2.3), finite propagation speed for a single speed (§2.2) and existence for smooth compactly supported data (§7.3).
   - §5.1: take the operator and the predicate from its §1.2 instead of defining them, with the coefficient bounds of §5.1 as hypotheses. Keep the identity and estimate for `W ∈ C¹([0, T]; L²_Λ) ∩ C([0, T]; H¹_Λ)`, saying in one clause that it differs by the Sobolev class and the quotient `E/Λ`.
   - §5.2: keep it, saying that it extends its §2.2 to Lipschitz characteristic-monotone weights, moving cones `(M, w)`, periodic lifts and the hypothesis `|LW| ≤ C₁|W|`. Add the bridge "a speed `c` there is a dominating cone `(c, 0)` here" with the transport Check.
   - §5.4: say in one clause that it differs from its §7.3 by the class (`Hᵏ_Λ` data and coefficients against smooth compactly supported data and `C_b^∞` coefficients).
   - Add `### From TauCetiRoadmap.SymmetricHyperbolicSystems` to the contracts. Update line 235, the *Needs:* lines of §5.1–§5.2, the Layer 5 Dependencies and the plan. Note that it uses `Matrix.IsSymm` where this README names `Matrix.IsHermitian`; for real matrices they agree.

3. **F03** (P3) The extension lens of §8.4 (b) needs an upper bound on `M`

   **Location:** `packages/CompressibleEulerEquations/design/README.md:1574`, "with `M > c̃ + |ṽ − ṽ(q)|` near `q`"; plan target 8.4.1.

   **Claim:** for every such `M` the lens `{φ ≥ 0} ∩ {ψ > 0}` is a small set near `q` inside `N`.

   **Witness:** `n = 1`, `c̃ = 1`, `ṽ = 0`, `q = 0`, `φ = t − 0.9x` (strictly spacelike: `1 > 0.9`), `M = 5`: at `(t, x) = (−100, −400)`, `φ = 260 ≥ 0` and `ψ = ε − 400 + 500 > 0`. The lens is unbounded.

   In the frame `ṽ(q) = 0`, with `a = ∂ₜφ(q)` and `b = ∇φ(q)`, the linearised lens is `{|x| − M(b·x)/a < ε}`. It is bounded exactly when `M|b| < a`.

   **Exact repair:** choose `M` with `c̃ + |ṽ − ṽ(q)| < M < (∂ₜφ(q) + ṽ(q)·∇φ(q))/|∇φ(q)|` near `q` (no upper bound when `∇φ(q) = 0`). The strict inequality at `q` and continuity make this possible on a smaller neighbourhood; then the lens lies in a ball of radius `O(ε)` inside `N`. On the witness, `M = 1.05` gives `|x| < ε/(1 − 0.945) ≈ 18.2ε`. Put the same bound in plan 8.4.1.

4. **F04** (P3) Time truncations need `T > t₀`

   **Location:** `packages/CompressibleEulerEquations/design/README.md:1460`, "time truncations `D ∩ {t < T}` are examples"; also lines 1521 and 1595.

   **Claim:** every time truncation of a development is a development below it.

   **Witness:** `t₀ = 0`, `S = (−1, 1)`, constant data, `T = 0`: `D ∩ {t < 0} = ∅`, whose initial slice `∅ ≠ {0} × S`. By line 1463 the empty set is a development only when `S = ∅`.

   **Exact repair:** write "for `T > t₀`" at the three places. With `T = 1/2` the truncation `{|x| < 1 − t, t < 1/2}` has initial slice `S` and is past-closed.

5. **F05** (P3) Inputs named in *Needs:* lines are missing from the supplier contracts, and one is not a pinned declaration

   **Location:** `packages/CompressibleEulerEquations/design/README.md:916`, "Young's inequality for convolution" (under Mathlib); lines 751, 416, 774, 1027.

   **Claim:** the contracts list every consumed declaration by name, and Mathlib supplies Young's convolution inequality.

   **Witness:** no declaration matching `young` with `convolution` or `eLpNorm` exists under `Mathlib/Analysis` at the pin; the nearest, `enorm_convolution_le` (`Mathlib/Analysis/Convolution.lean:557`), is the pointwise Hölder bound. The contracts omit four declarations the *Needs:* lines use.

   **Exact repair:**

   - §4.4: replace "Young's inequality for convolution" by the route already written there. The `L²` bound `‖φ_ε ⋆ w‖ ≤ ‖w‖` is the norm bound for the Bochner average `∫ φ(y) τ_{−εy}w dy` of isometries; no separate inequality is needed.
   - Add to the contracts, by name:
     - `TauCeti.exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le` (`TauCeti/Analysis/Sobolev/DifferenceQuotient.lean:152`), used in §4.2;
     - `Matrix.IsHermitian` (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45`), used in §2.1;
     - `MeasureTheory.Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean:51`), for "Plancherel" in §4.2;
     - `integral_lineDeriv_mul_eq` (`Mathlib/Analysis/Calculus/Rademacher.lean:170`), for "integration by parts for Lipschitz functions" in §5.2.

6. **F06** (P3) Corollary 4.68 is cited for a case outside its hypotheses

   **Location:** `packages/CompressibleEulerEquations/design/README.md:1516`–1518, "`D₁ ∩ D₂` is disconnected …, as EperonReallSbierski2019 line 1338, Corollary 4.68, requires of any disagreement".

   **Claim:** the corollary applies to the counter-flow example.

   **Witness:** EperonReallSbierski2019 lines 1338–1340: the corollary is for the quasilinear wave equation (4.61) with data on a connected hypersurface. Here the system is Euler and `S = (−∞, −1) ∪ (1, ∞)` is disconnected.

   **Exact repair:** write "in line with EperonReallSbierski2019, Corollary 4.68, which is stated for quasilinear wave equations and connected data and does not apply here". The computed fact stays: the slice of `D₁ ∩ D₂` at `t = 1` is empty.

Six findings: two P2 and four P3. The eight findings of round 3 are all repaired, and the repaired mathematics survives the adversarial pass. Both blocking findings are ownership overlaps with open roadmap pull requests that the overlap list names this round: LorentzianGeometry (#2232) and SymmetricHyperbolicSystems (#2246). No file of the design or the manifest was changed. Elaboration is **not available (this lane does not elaborate; say so in the report)**; the design has no `Suggested.lean`.

## Verified sound

### Round-3 findings, checked first

All eight are repaired. Quotations are from the present README.

| Round-3 finding | Repaired passage | Disposition and recomputation |
|---|---|---|
| R01 unweighted energy | §5.1, line 939: "`A⁰` … bounded and of class `C¹` with bounded first derivatives" | **Repaired.** `∫_{−R}^{R} √(1+x²)·(1+x²)⁻¹ = 2 asinh R → ∞` is excluded; with `A⁰ = 1`, `E = π`, both sides `0`. Plan 5.1, 5.1.1 agree. |
| R02 uniformly local data | §7.3, lines 1343–1346: "compact `K ⊆ G` … `2k > n + 2` … `0 ≤ χ ≤ 1`"; source-switched system, lines 1356–1366 | **Repaired.** `F_sw(Ū, 0) = (0·F(Ū), 0) = 0`; cutoff values `1 + θ/2 ∈ [1, 3/2]`; gluing checked below. Plan 7.3, 7.3.1 agree. |
| R03 order-zero composition | §4.3, lines 803–806: "derivatives of order at most `max(1, k)` on `K_δ`" | **Repaired.** `Φ_m = sin(ms)`: bound reads `sin 1 ≈ 0.8415 ≤ m·m⁻¹ = 1`. Secant bound checked in both cases `|a − b| ≤ δ` and `> δ`. |
| R04 summary uniqueness | Summary, lines 21–22: "if the data extend to a classical solution on the whole future half-space, the maximal development is unique" | **Repaired.** Counter-flow pair has no global extension; velocities `2 ≠ −2` at `(2, 0)`. |
| R05 sound sheet | Scope, lines 40–43: "the sound sheet of the characteristic variety" | **Repaired.** `ζ₀ + v·ζ′ = 0`, `ζ′ ≠ 0` gives `g⁻¹(ζ, ζ) = |ζ′|² > 0`; `n = 1` speeds `±1` only. Plan 2.2 Check agrees. |
| R06 dilation limit | §4.3 Check, lines 816–819: "unbounded as `λ → 0`" | **Repaired.** Exponents `1/2` and `3/4`; ratio `λ^{−1/4}` is `2` at `1/16`, `1/2` at `16`. |
| R07 locators | §3.2, lines 542–544: "MinguzziCone2019 lines 680–697, §2.1, p. 17 … Remark 2.3, lines 698–718" | **Repaired.** Both read at those lines; page marker for p. 17 is at line 673. Manifest has §2.5 for Minguzzi2019 Theorem 2.12. |
| R08 mollifier kernel class | §4.4, lines 867–868: "This section owns the extension of these three statements to every admissible kernel and every period group" | **Repaired.** Two-bump kernel: `φ(0) = 0`, `J_εu = ½(τ_{2ε} + τ_{−2ε})(η_ε ⋆ u)`. The six `Translation.lean` declarations opened at the pin. |

The repaired patterns were searched for in the untouched text. Coefficient bounds: §5.2–§5.4 and §7.1 have them. Composition constants: §5.3 and §7.1 use only `K`-dependent constants. Sheet multiplicity: §2.2 and §3.1 state it. The three P3 slips above are what the search found.

### Adversarial table

Rows cover the fifteen sampled targets, the headlines, the repaired passages and every target a finding touches. Unchanged text outside them rests on round 3's rows that carry computed values.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 sound speed | `p = ρ²/2` at `ρ = 4`; `p = −A/ρ`; `p = −ρ²`; `a = −1, 0` | `c = 2` (wrong `c = p′` gives `4`); `p′ = A/ρ² > 0`; `p′ = −2ρ < 0`; `c = 1`, `p′ = 0` rejected | Sound; no positive-pressure shortcut |
| §1.1 full law | `P = e^sρ²` at `(1, 0)` | `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | Sound |
| §1.2 Galilean rule | expanding flow boosted by `w = 1`, `t = 1` | correct rule: residual `0`; `ṽ = v ∘ φ⁻¹`: residual `−1/(1+t) = −1/2` | Sound |
| §2.1 dominance | transport `a = 3`, cone `(1, 0)`, `ζ = (1, −1)`; monotonicity | cone `1 ≥ 1`, symbol `−2`; `ζ₀ + w·ζ′ ≥ (c′ − |w − w′|)|ζ′| ≥ c|ζ′|` | Sound |
| §2.1 wave system | `n = 1`, `ζ = (0, 1)`; `ζ = (1/2, e₁)` | symbol `[[0, −1], [−1, 0]]`, eigenvalues `±1`; eigenvalue `1/2 − 1 = −1/2` | Sound |
| §2.1 `κ`, `N = 0` | empty matrix | `det = 1`, no root; `κ = (1, 0)` | Sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = [[12, 4], [4, 3]]`; `det(A¹ − λA⁰) = 4λ² − 24λ + 20 = 4(λ − 1)(λ − 5)` | Sound |
| §2.2 full symmetriser | `P = e^sρ²` at `(1, 0)`; `S Nⁱ` entries | minors `2, 2, 2`; `d = 1/2` gives `det = 0`; entries `(ρ, vⁱ) = (vⁱ, ρ) = ∂_ρP`, `(vⁱ, s) = (s, vⁱ) = ∂_sP` | Symmetric and positive definite |
| §2.2 material sheet | `n = 1`, `ζ = (−3, 1)`; `n = 2`, `ζ = (0, 1, 0)` | `σ = [[0, 4], [4, 0]]`, `det = −16`; `det = 0`, eigenvalues `−1, 0, 1`, `g⁻¹ = 1` | Sound |
| §2.2 least cone | `(1, 3)`, `c = 2`: `(2, 0)`, `(5, 0)` | `ζ = (2, −1)`: `2 − 3 − 2 = −3 < 0`; threshold `c + |v − w| = 5` | Sound |
| §3.1 form and inverse | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −4`; `(1, 3, 0)`: `0`; `(1, 4, 0)`: `5`; `g⁻¹(dt, dt) = −1/4` | Sound |
| §3.1 covectors | `ζ = (−3, 1, 0)`; `n = 1`, `ζ = dx` | `ζ₀ + v·ζ′ = −2`, `g⁻¹ = −1 + 1 = 0`, `ζ(1, 3, 0) = 0`; `g = −τ²` on `ker dx` | Sound |
| §3.1 against LorentzianGeometry §7.3 | `c = 1`, `v = 2`, `n = 1` | both: Gram `[[3, −2], [−2, 1]]`, `det = −1`, `g(B, B) = −1` | Same object: R01 |
| §3.2 integral characterisation | field `(1, 0)`: `t/2`, `2t`, `10·`Cantor | `Δ/2 ≤ Δ`; `2Δ > Δ`; `10 > 1 = ∫₀¹ c` with `ẋ = 0` a.e. | Both directions; Lipschitz needed |
| §3.3 domains of dependence | constant field, ball and half-space; expanding flow | `{|x − tv₀| < R − c₀t}`; `{x¹ > (v₀¹ + c₀)t}`; `ẏ = −(1+t)^{−3/2}`, `x = 2√(1+t) − (1+t)`, zero at `t = 3`, `2√2 − 2 ≈ 0.828` at `t = 1` | Sound; same sets as LorentzianGeometry §12.6 Check: R01 |
| §3.3 unbounded field | `(1, x²)`, through `(1/2, −4)` | `x(s) = 1/(1/4 − s)`: `ẋ = x²`, `x(1/2) = −4`, `→ −∞` as `s ↓ 1/4` | Slab hypothesis needed |
| §4.1 norms | `n = 2`, `e^{−|x|²}`, `k = 2`; `n = 1` | `π/2 + π + 7π/2 = 5π` against `(7/2 + 8e⁻²)π`; both `5√(π/2)` | Sound |
| §4.1 circle comparison | `1`, `cos x` on `2πℤ` | `CircleSobolev 1`: `1`, `2·2²·¼ = 2`; `H¹_Λ`: `2π`, `2π`; ratios `2π`, `π` | Equivalent, not proportional |
| §4.3 Gagliardo–Nirenberg | `n = 1`, `k = 2`, `i = 1`; `k = i = 1` | both sides `λ^{3/4}`; `‖Du‖₂ ≤ ‖u‖_{H¹}` with `C = 1` | Sound |
| §4.3 composition, linear bound | top order, `Σ i_l = k` | `Π ‖D^{i_l}u‖_{L^{2k/i_l}} ≤ C‖u − Ū‖_∞^{j−1}‖u − Ū‖_{Hᵏ}`, `‖u − Ū‖_∞ ≤ diam K` | Linear in `‖u − Ū‖_{Hᵏ}` |
| §4.4 translation route, `Λ ≠ 0` | `χτ_hu − χu` | `= τ_h(χu) − χu + τ_h((τ_{−h}χ − χ)u)`; second term `≤ C‖τ_{−h}χ − χ‖_{Cᵏ}‖u‖_{Hᵏ}` over finitely many cells | Continuity in `h` holds |
| §5.1 identity | `B = bI`; transport | `E(t) = e^{−2bt}E(0)`; `E′ = 0` | Sign as in #2246 §2.1: R02 |
| §5.1 against #2246 "speed" | transport `a = 1`; general `c` | least speed `1` both; `(c, 0)` dominates iff speed `c` | Same notion: R02 |
| §5.2 weights | `a = 1`: `(1 − |x| − t)₊`, `(1 − |x| − t/2)₊`; moving cone | `−1 − sign x ≤ 0`; `+1/2` for `x < 0`; `ζ₀ + w·ζ′ = M ≥ M|e|` | Sound |
| §5.4 against §5.1 | `A^μ − Ā^μ ∈ C(Hᵏ_Λ)`, `2k > n + 2` | `Aⁱ`, `∂ⱼAⁱ`, `∂ₜA⁰`, `B` bounded and continuous | Hypotheses of §5.1 hold |
| §6.1 non-periodic control | `u = g(t + 1/x)` | `g′ + x²·(−x⁻²)g′ = 0`; at `(0.9, −1/0.3)`: `g(0.6)` | Cone field `x²` unbounded, so no clash with §6.2 slabs |
| §6.2 | state `(1, 0)`, `S = (−2, 2)` | `(1/2, 1.4)`: `1.4 < 1.5`; `(1/2, 1.6)`: no claim | Sound |
| §7.1 continuation | Burgers, `u₀ = −e^{−x²}` | `min u₀′ = −√2e^{−1/2}`, `T* ≈ 1.1658` | Sound |
| §7.2 headline | `p = ρ³/3`, `v̄ = ρ̄ − 1` | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* ≈ 1.1658`, `ρ ∈ [1, 3/2]`; `n = 3`: `6 > 5` | Sound; `v` stays bounded by Grönwall |
| §7.3 switched cone | transport `a = 3`, `(1, 3)`, `ζ = (−2, 1)` | cone `1 ≥ 1`; symbol `1 ≥ 0`; added entry `−2 < 0` | `c ≥ |w|` needed, stated |
| §7.3 gluing | `p ∈ C_y ∩ C_{y′}`, speed `m` | `|x − y′| ≤ |x_p − y′| + m(t_p − s) < 1 − ms` | `J⁻_{C_y}(p) ⊆ C_{y′}` |
| §7.3 covering | `T ≤ 1/(2m)` | `1 − mt ≥ 1/2` | Each `(t, x)` lies in `C_x` |
| §8.1 developments | `S = ∅`; `{|x| < 1 − t/2}`; `T = 0` truncation | `D = ∅`; `1/2 < 1`, timelike; slice `∅ ≠ S` | Sound except R04 |
| §8.2 `W₁₂ = W₂₁` | fields agree on the open `W₁₂ ⊇ J⁻_{D₁}(p)` | a `U₂`-causal curve from `p` is `U₁`-causal while in `W₁₂`, so it stays in the compact `J⁻_{D₁}(p)` | Holds without Lipschitz fields |
| §8.2 counterexample | `p = ρ²`, `ρ = 1/2`; `(2, 0)` | `c = 1`; `T_L`: `0 < 1`; `T_R`: `0 > −1`; `v = 2 ≠ −2`; towers disjoint iff `t < 1` | Sound; wording R06 |
| §8.2 uniqueness criterion | constant data on `B(0, R)` | every development lies below `{|x − v₀(t − t₀)| < R − c₀(t − t₀)}` | Sound |
| §8.3 full data | `S = E`, `p ∈ D ∩ O` | `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O` | Compatible with the slab |
| §8.4 (a) | cone; truncation; `{|x| < 1 − t/2}` | `−e·v₀ + c₀ + v₀·e = c₀`; `1 > 0`; `1/2 < 1` | Sound |
| §8.4 (b) | expanding flow at `(1, 2√2 − 2)`; lens with `M = 5`, `1.05` | `0.2929 + 0.4142 = 0.7071 = c`; unbounded; `|x| < 18.2ε` | Statement sound; route R03 |

### Sources: the seeded sample

No locator is flagged as unverified by the author. The fifteen sampled sections were checked at the cited lines of the cached texts.

| Section | Locators read | Outcome |
|---|---|---|
| 1.1 | ChristodoulouMiao2014 line 606; AbbresciaSpeck2022 lines 165–171; LuoYu2023a line 88 | Sound speed as `∂p/∂ρ` at fixed entropy; `γ ∈ (1, 3)` is the source's special case. AbbresciaSpeck2022 excludes the Chaplygin gas for its own theorem; the definition here rightly admits it. |
| 2.1 | Christodoulou2019 lines 124–126 | Supports "quasilinear hyperbolic first-order system" only. Friedrichs1954, Majda1984, Dafermos2016 are settled and unread. |
| 2.2 | Majda1984, Dafermos2016 | Unread (settled). The symmetrisers and spectrum were computed directly. |
| 3.1 | ChristodoulouMiao2014 lines 672–676, 685; LuoYu2023a line 95; LukSpeck2018 lines 1999–2008; Christodoulou2019 lines 134–138 | Form, inverse and `√(−det g) = η` as cited; Luk–Speck's `c⁻²g` normalisation confirmed. |
| 3.2 | Minguzzi2019 lines 1359–1364, 1917; Chrusciel2011 lines 534, 1352; MinguzziCone2019 lines 680–718 | As cited. |
| 3.3 | Minguzzi2019 lines 3576–3583, 3716–3718; MinguzziCone2019 lines 1737–1740; BarGinouxPfaffle2007 line 1006; Chrusciel2011 lines 1169, 1843–1848, 1859; LuoYu2023b lines 417–419 | As cited; the closed-achronal and timelike-variant qualifications in the README match the texts. |
| 4.1 | AbbresciaSpeck2022 lines 149–152, 176–179 | `Σ = ℝ × 𝕋²` and `H³` data: background, as the README says. |
| 4.3 | Nirenberg1959 line 318; LukNotes line 1612 | Theorem of Lecture II; Lemma 6.8 with `F(0) = 0`. |
| 5.2 | LukNotes line 724 | Proposition 4.4, wave equation on shrinking balls; the general weight theorem is proved here. |
| 5.4 | LukNotes line 1158 | Theorem 5.3, wave analogue. Kato1975 and Majda1984 unread (settled). |
| 6.2 | ChristodoulouMiao2014 lines 872–878; EperonReallSbierski2019 lines 1178–1189 | As cited. |
| 8.1 | ChristodoulouMiao2014 lines 864–880; Christodoulou2019 lines 130–138; LuoYu2023b lines 417–419, 910; EperonReallSbierski2019 lines 1129–1144 | As cited. |
| 8.2 | EperonReallSbierski2019 lines 767, 1195–1210, 1338–1344; AbbresciaSpeck2022 lines 408–414 | As cited; Corollary 4.68's hypotheses are R06. |
| 8.3 | ChristodoulouMiao2014 lines 866–872; AbbresciaSpeck2022 lines 175–179 | As cited. |
| 8.4 | Christodoulou2019 lines 131–138; ChristodoulouMiao2014 lines 880–886; EperonReallSbierski2019 line 1603 | Regular boundary `C` null, as cited; the local theorem is proved here. |

All 21 cited works have one manifest key each. Nothing was fetched and no reference is requested.

### Pinned declarations

Pins: Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4` (`lake-manifest.json`). Every declaration the README cites with a file and line was opened there:

- Tau Ceti, 26 declarations: `Wkp/Translation.lean:104,130,137,182,193,229`; `Wkp/ApproximateIdentity.lean:52,67,107,118,132`; `Wkp/Basic.lean:145`; `WeakDeriv/Basic.lean:251`; `BesselPotential/Basic.lean:133`; `BesselPotential/Embedding.lean:81,194`; `Wkp/SmoothDensity.lean:92`; `W1p/Mollification.lean:87`; `Leibniz.lean:112,168,317`; `Circle/Basic.lean:197,375`; `Circle/Lp.lean:59`; `DifferenceQuotient.lean:152`; `ODE/Gronwall.lean:59`. `continuous_translate` carries `hp : p ≠ ∞`, as the README says.
- Mathlib, 15 declarations: `PosDef.lean:62,176`; `QuadraticForm/Real.lean:78`; `Rademacher.lean:362`; `AbsolutelyContinuous.lean:310`; `AbsolutelyContinuousFun.lean:227`; `ArzelaAscoli.lean:113`; `Zorn.lean:126`; `PicardLindelof.lean:80`; `ExistUnique.lean:57,252`; `Distribution/Sobolev.lean:153`; `TangentCone/Real.lean:80`; `Hermitian.lean:45`; `EMetricSpace/Lipschitz.lean:72`.

All exist with the cited names. The unnamed inputs are R05.

### Duplication and ownership

- **LorentzianGeometry (#2232):** scope, §7.3, §8.2, §11.4, §12.6–§12.7 and Downstream consumers read. Shared: the acoustical form, causal curves in subsets, `D⁺_D(S)`. R01.
- **SymmetricHyperbolicSystems (#2246):** whole scope, Layers 1–2 and Downstream consumers read. Shared: the linear carrier, energy identity, finite speed, `L²` estimate. R02. Its Lean names live in `TauCetiRoadmap.SymmetricHyperbolicSystems`; the plan's `SymmetricHyperbolic.*` names do not collide today.
- **PDE (main; revision #1614):** §1.3 (line 769), §1.4 (line 803), Layer 7 (line 2661) exist on main; the scalar restriction is at lines 117 and 183. Nothing shared.
- **IncompressibleFlows (#237):** Layer 0 (line 151) plans `W^{k,p}(UnitAddTorus d; F)`; not consumed, compared in §4.1. It is on the never-cite list and is cited only as a boundary.
- **YangMillsConnectionsAndCaloricGauge (#2164), SobolevPolynomialApproximation, OptimalTransport (main):** scopes read; gauge-valued Sobolev maps, polynomial approximation and transport. Nothing shared.
- **RelativisticQuantumFieldTheory:** RQFT1 (causal Green operators on Minkowski space) exists; not consumed.
- A search of the open heads and main for Gagliardo–Nirenberg, Moser estimates, Friedrichs mollifiers, maximal developments and uniformly local data found no further owner. The pins' Gagliardo–Nirenberg–Sobolev inequality is the first-order embedding, a different statement from §4.3.

The overlap facts list no dropped id, no revision-only id, no other pull request changing this roadmap and no second copy on main.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, YangMillsConnectionsAndCaloricGauge, PDE, SobolevPolynomialApproximation, OptimalTransport; acoustical form, causal curves in subsets and `D⁺_D(S)`: LorentzianGeometry (R01); linear symmetric hyperbolic carrier, energy identity, finite speed: SymmetricHyperbolicSystems (R02); nothing else shared.

### Supplier order

Every *Needs:* line and plan prerequisite was read: 54 targets, no prerequisite outside the plan, the pins or the named libraries, no cycle, no declared gap. Gate output:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD or CYCLE line. After R01 and R02 the roadmap has two suppliers, both open pull requests that add a new folder; neither consumes this roadmap.

### Principles, shape and headlines

- General library: general equation of state, any `n ≥ 1`, any period group, general symmetric hyperbolic systems. No route-specific shortcut found.
- No copied passage, no algorithm, no process residue, no LaTeX delimiters, no machine path in the README.
- Layers are named by their mathematics and ordered by their dependency lines; the README does not say it follows a source.
- All eight layers end with Examples and Dependencies; every definition has its API and at least three Checks.
- Headlines (README lines 248–252): local well-posedness of compressible Euler (§7.2); uniqueness on lens-shaped domains (§6.1); maximal common development, compatibility, existence of maximal developments and uniqueness under a global extension (§8.2–§8.3); nullity of the regular boundary (§8.4).
- There is no `Suggested.lean` at the design stage, so the padding probe, the `#check` comparison and the import check have nothing to run on.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report).
- Kato1975, Majda1984 and Dafermos2016 are uncertified; Christodoulou2007, HawkingEllis1973, Friedrichs1954 and ONeill1983 are waived. Their locators were kept and not read.
- #2232 is about 2,400 lines. Its scope, §7.3, §8.2, §11.4, §12.6, §12.7 and consumers were read; the bullet-by-bullet comparison of §3.2–§3.3 against its Layers 8–12 is left to the repair, as R01 says.
- Ownership against open pull requests was checked through the roadmaps service at the index of 2026-11-13; pull requests outside that index were not sought.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25 (lines 875–880): the source says two developments of the same data agree on the intersection of their domains, so the union of all developments is the unique maximal one; it should be agreement on the maximal common development, with global uniqueness needing further hypotheses; affects a stated result.
- **Error** in LukNotes at Lemma 6.9, printed p. 26 (lines 1616–1617): the source says `f` times a first derivative of `g` is bounded in `Hˢ` using only the `Hˢ` and sup norms of `g`; it should require one more derivative of `g` or be a commutator bound; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d8d0163d63eb3cccaf93d3894c5f2dd3e277c0a2", "job": "REV-DESIGN-CompressibleEulerEquations~4", "model": "fable", "worker": "chris-x26"} -->
