<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6901928130 -->
Review (claude) of 41c134c

Verdict: accepted
Conditional on the announced gaps: `weak-harnack-supersolutions`

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. Both round-14 findings are repaired, the passages the repairs changed hold under recomputation, and nothing else in the design needs a change. The acceptance is conditional on the declared supplier gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23), which is precise, minimal and declared in both `packages/ComplexHessianEquations/design/README.md` and `packages/ComplexHessianEquations/design/plan.json`. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and their repairs

| Round-14 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), §1.5 Check called `σ_n` non-homogeneous | README line 201: "For `f = σ_n` on `ℝ²`, which is homogeneous of degree two and not of degree one, at `T = diag(1, 4)`: `∇F(T) = det(T)·T⁻¹ = diag(4, 1)` and `tr(∇F·T) = 4 + 4 = 8 = 2·F(T)`." Plan test `euler_degree_two` of target 1.5 is present. | Repaired |
| F02 (P3), §6.4 route gave `Q(T)` the size `S` | README line 551: "`Q(T)`, which is linear in `T` with the bounded coefficient `Ric(ω_φ)^♯ = ω_φ⁻¹(Ric(ω) − i∂∂̄F)`, of order `S^{1/2}` … so that `2 Re⟨Θ, T⟩_{ω_φ} ≥ −C(S + 1)` and `|⟨T, Q(T)⟩_{ω_φ}| ≤ CS`". A Check on the size of `Q(T)` was added (line 557), with plan test `c3_Q_size`. | Repaired |

Adversarial pass on the changed text. §1.5: `σ_2(2, 8) = 16 = 2²·4`; `det(T)·T⁻¹ = 4·diag(1, 1/4) = diag(4, 1)`; `tr(diag(4, 1)·diag(1, 4)) = 8 = 2·4`. §6.4 route: `(1 + S^{1/2})·S^{1/2} ≤ 1/2 + 3S/2`, so `Δ_{ω_φ}S ≥ −C_1S − C_2` follows. §6.4 new Check, torus `n = 1` at `x = 1/4`: `q = 1`, `q' = 2πa`, `q'' = 0`, `(log q)'' = −4π²a²`, `s_{ω_φ} = −(log q)''/(2q) = 2π²a²`, `S = q'²/(2q³) = 2π²a²`, `⟨T, Q(T)⟩ = −s_{ω_φ}·S = −4π⁴a⁴`. It agrees with the §6.1 Check at the same point (`Δ_ω F = −2π²a²`, `G = 2π²a²`).

Pattern search in the rest of the design. Homogeneity claims: §1.4 (`σ_n` not concave), §2.3 (`min(x, y)` of degree one), §2.4 (`max_j λ_j`, `σ_1 − ε|λ|`), §8.3 Check (`σ_1 + δ|λ_1 − λ_2|^{3/2}σ_1^{−1/2}`, degree `3/2 − 1/2 = 1`): all correct. Size claims: line 551 is the only one, and the degree paragraph of §6.1 agrees with it.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜` and for every admissible pair; Layers 3–4 with no Kähler hypothesis; Yau's theorem for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- No second copy and no re-plan: main has no `ComplexHessianEquations` folder; the overlap file lists no other pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape: 35 numbered subsections, each with a `*Needs:*` line and a `**Checks.**` block; every layer ends with `### Examples` and `### Dependencies`. The README attributes no Lean name to this roadmap.
- Process residue: a search for pull-request numbers, round labels, machine paths, "so far", "checkpoint", "handoff", "optional", "deferred", "for later", "removed", LaTeX delimiters and HTML anchors finds nothing.
- Plan: parses; 47 targets (34 theorems, 12 definitions, 1 example); no `target:` prerequisite is missing or points forward; every definition has at least three tests (3 to 7); every target has a locator; one gap, prerequisite of targets 5.4.2, 8.5 and 8.7.
- Manifest: 19 entries, one per work of the References (11 certified, 8 uncertified and settled); unchanged by this review. No text was missing, so no `needs-references.toml` was written.
- Declared gap. Precise: one inequality with `m ≥ 1`, `r > 0`, `q` finite, `q ≥ 1`, `q > m/2`, `u ∈ H¹`, `u ≥ 0` a.e., the essential infimum and `C(m, q, λ, Λ)`; the `needs` sentence of the plan and README line 99 agree. Minimal: PDE §5.4 on main (line 1997–2001) plans the weak Harnack inequality for weak solutions of the homogeneous equation only, and the pinned `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`) is the supersolution case with zero forcing. Not a finding.

### Adversarial table

All values were computed in this round. The rows cover the fifteen sampled sections, the headline theorems and the repaired passages.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 (sampled) | weighted inner product on `ℂ²`; `λ[−a]`; Lipschitz constant | `g⁻¹a = diag(1, 3)`, `λ = (3, 1)` against Euclidean `(3, 2)`; reversal of `−(3, 1)` is `(−1, −3)`; `T = [[0, ε], [ε, 0]]` has `λ = (ε, −ε)`, norm `ε` | Holds |
| §1.2 (sampled) | `F = diag(2, 1)`, `B = diag(0, 3)`; uniqueness under the gap; `κ_2` at `diag(3, 1, 1)` | lower `2·0 + 1·3 = 3 = tr(FB)`, upper `6`; `Σ λ_jc_j` with `c_j < 1` for some `j ≤ m` moves mass to `λ ≤ λ_{m+1} < λ_m`, so strictly smaller; eigenvalues `3, 1 + t, 1 − t`, `κ_2 = 4 + abs(t)` | Holds |
| §1.3 Lewis (headline) | `σ_2` at `[[2, 1], [1, 2]]`; `tr(T²)` | `det·T⁻¹ = [[2, −1], [−1, 2]]`, wrong model `diag(1, 3)`; `2(P_+ − P_−) = 2T` | Holds |
| §1.4 (headline) | concavity chain; half-space route; shifted quadrant; `−σ_1` | `∂_if` nondecreasing against `λ_i(T)` nonincreasing gives `tr(∇F(S)T) ≥ Σ ∂_if·λ_i(T)`; `min_π⟨y, πμ⟩ = ⟨y↑, μ↓⟩`; `log(1/2) + log 2 = 0 < 2 log(5/4)`; `−1 > −2` | Holds |
| §1.5 (sampled, repaired) | `σ_2^{1/2}` and `σ_2` at `diag(1, 4)`; trace inequality | `∇F = diag(1, 1/4)`, `det = 1/4 = (1/4)·1`, `tr = 2 = F`; `8 = 2·4`; `5 ≥ 4`, `B = A⁻¹`: `2 = 2` | Holds |
| §2.1 (sampled) | `(1, 2, 3)`; index sets; shift `n = 3`, `k = 2`; `(2, 2, −1)`; `n = k = 1` | `S = (2, 11/3, 6)`, `12 ≤ 121/9`; `18/11 ≤ 11/6`, `1.732 ≤ 1.915`, `(2, 0, 2, 1)`: `1.915 ≤ 1.833` false; `3t² + 2σ_1t + σ_2`, `12 = 12` at `e`, `t = 1`; `σ_2 = 4 − 2 − 2 = 0`, `σ_2(λ + εe) = 6ε + 3ε²`; `1 = 1·1 + 0` | Holds |
| §2.2 Gårding (headline) | `p = 2xy − 0.9(x² + y²)`; `p_c`; `σ_k` as derivative | `p(x + te) = 0.2t² + 0.2(x_1 + x_2)t + p(x)`, discriminant `0.76(x_1 − x_2)²`; ratio roots `(2 ± 0.8718)/1.8 = 0.627, 1.595`; `p(1, 0.1) = −0.709`; `p(1, 0.7) = 0.059`, `∂_xp = −0.4`; `p_19 = −18(x² + y²) + 40xy = 20p`; `c = 1/4`: `∂_1p_c > x_1 + x_2`; `D_e^{n−k}σ_n = (n − k)!σ_k` | Holds |
| §2.3 (sampled) | `σ_2/σ_1`; tangent at `λ = (1, 4)`, `μ = (4, 1)`; `σ_k^{1/k}` form; `min(x, y)` | `0.8`, `0.8`, midpoint `1.25`; `∂g(1, 4) = (1, 1/4)`, `4 + 1/4 = 4.25 ≥ 2`; `Σ μ_iσ_{k−1;i}(λ) = kσ_k(λ)^{1−1/k}Σ μ_i∂_ig(λ) ≥ kσ_k(λ)^{(k−1)/k}σ_k(μ)^{1/k}`; `∇g(1, 2) = (1, 0)`, `1 ≤ 2` | Holds |
| §2.4, §2.5 (headline) | Lemma 4 with `μ_i = (∏∂_jf)^{1/n}/∂_if`; Hessian constant; `σ_2/σ_1` at `(M, 1, 1)`; wedge cone | `nγ^{1/n} ≤ f(μ) ≤ n(∏∂_jf)^{1/n}`; `∂_jσ_k^{1/k}(e) = binom^{1/k}/n`, `3^{−1/2}` at `n = 3`, `k = 2`; `∂_1 = 3/(M + 2)²`, `∂_2 = (M² + M + 1)/(M + 2)²`; `(1, −0.4) + (0.01, 0.25) = (1.01, −0.15)` outside | Holds |
| §3.1 | `x_1²`; composition rule at `u = x`; Laplacian | `(1/2)(D²u(J∂_x, ∂_y) − D²u(∂_x, J∂_y)) = (1/2)(0 + 2) = 1`; `H_{i∂u∧∂̄u}(∂_x, ∂_x) = 1/2 = 2·abs(1/2)²`; `2 tr_h L_u = (1/2)Σ(u_xx + u_yy)`, `Δ_ω abs(z)² = 2n` | Holds |
| §3.2 (sampled) | `n = 2` form identity; mixed inequality; Maclaurin form at `λ[β] = (4, 1)`; Stokes identity | `α ∧ ω = ((λ_1 + λ_2)/2)ω²`, `α² = λ_1λ_2ω²`; `M_k(α, β, …) = (1/k)D_α(σ_k∘λ)(β) ≥ σ_k(α)^{1/k}σ_k(β)^{(k−1)/k}`; `S_1 = 5/2 ≥ S_2^{1/2} = 2`; `∫ Δ_ωu·ω^n = n∫ i∂∂̄u ∧ ω^{n−1} = n∫ u·i∂∂̄ω^{n−1}` | Holds |
| §3.3, §3.4 | Hessian constant; `ℂP¹`, `χ = 2ω`; mass bound; `χ = ω_X` | `c^k = binom·∫χ^k ∧ ω^{n−k}/∫e^{kF}ω^n`; `c·1 = ∫χ = 2`; `e^{nF} ≤ e^{nF}abs(F)^p` where `abs(F) ≥ 1`, `< e^n` elsewhere; `V_t = (1 + t)^nV = c_t^nV` | Holds |
| §4.1 (sampled) | `ψ = −abs(z)²/4`; wedge pair with `f = σ_1` on `Γ_2`, `10σ_1` on the wedges | `λ[χ_ψ] = 1 − 1/2 = 1/2 ≤ 1`; `f(1, −0.4) = 10·0.6 = 6 > f(1.01, 0.1) = 1.11`, with `∂_jf > 0` and degree one on each component | Holds |
| §4.2 (sampled, headline) | maximum and minimum; the linearized operator; two components | `c'e^F ≤ ce^F` and the reverse; `0 = F_f(h_1) − F_f(h_0) = Re tr(a·(h_1 − h_0))` on a segment inside `Sym_Γ` (convexity); `φ = 0` and `ψ = 0, −1` both solve | Holds |
| §5.1–§5.3 | conformal `n = 2`; Schauder Check; torus Poincaré; Sobolev exponent | `Δ_g = e^{−ρ}(Δ_0 + ⟨∇ρ, ∇·⟩)`, difference `−e^{−x_1}`; quotient `8π²·2^α`, `[cos 2πj·]_α ≤ 2(πj)^α`, `C ≥ 4·2^α/((1 + 2π^α)ε)`; `1/2 = 2π²/4π²`; `2·2n/(2n − 2) = 2n/(n − 1)` | Holds |
| §5.4 (sampled) | divergence form; chain step; `ψ_ε` on `ℂP¹`; `φ = −M` | `∂_i(√g g^{ij}∂_ju) = √g·Δ_gu = 2√g·Δ_ωu ≤ 2A√g` for `u = −φ`; `ess inf_{B_r(x')}u ≤` average over the overlap; quotient `< 1` on `ℂ`, tends to `1`; integral `M·V` unbounded | Holds |
| §6.1 | `ℂP¹`; torus `q = 1 − a cos 2πx` at `0` and `1/4`; `ω_φ = sω` | `R_{1̄1} = 2g_{1̄1}`, area `2π`; `S = (2/q)(q'/2q)² = q'²/(2q³)`; at `0`: `q''/(2q) = 2π²a/(1 − a) = (1/2)(log q)''`; at `1/4`: `−2π²a² + 2π²a² = 0`; `Δ_{ω_φ}S(0) = q''²/(2q⁴) = 8π⁴a²/(1 − a)⁴`; `0 = −s_ω + 0 + s_ω + 0` | Holds |
| §6.2 | identity at exponent `0`; torus `ℂ²/ℤ⁴`, `ε = 1/(4π²)` | `∫ψ(e^F − 1)ω^n = ∫ i∂ψ ∧ ∂̄ψ ∧ Σ ≥ (1/n)∫abs(∂ψ)²ω^n`; `i∂∂̄φ = −2π²ε cos·dx_1 ∧ dy_1`, `q = 1/2` and `3/2`; `∫(sup φ − φ)ω² = 2ε`, `∫ω² = 2`, `ψ̄ = 1 + ε` | Holds |
| §6.3 (sampled) | maximum of `log tr h − Aφ`; `λ = (4, 1/4)`; `n = 1` | `Δ'φ = n − tr h⁻¹`, so `Δ'(log tr h − Aφ) ≥ (A − C_1 − Λ)tr h⁻¹ − An − C_2`; `tr h = 17/4`, `4/17 ≤ 17/4`; `ω_φ = e^Fω` | Holds |
| §6.4 (repaired) | sizes of `Θ`, `Q(T)`; torus | `Q(2T) = 2Q(T)`, `S(2T) = 4S`; `∂_{z_1}h_{11} = q'/2 = 2π³ε sin 2πx_1`; `−4π⁴a⁴` as above | Holds |
| §6.5 | `n = 1` torus; regularity count | `φ = (a/2π²)(cos 2πx − 1)`, `Δ_ωφ = −a cos 2πx`, `osc = a/π²`; `k = 1`: coefficients in `C^{0,α}`, `∂F ∈ C^{0,α}` give `∂φ ∈ C^{2,α}` | Holds |
| §6.6 Yau (sampled, headline) | pair form; path constants; openness map; Bessel; constant `F` | `e^b = ∫χ^n/∫e^{nF}ω_X^n = ∫χ^n/V = c^n`; `abs(b_t) ≤ t·sup abs(F)`; derivative `(u, β') ↦ Δ_{ω_φ}u − β'`; `−log I_0(ε) = −ε²/4 + O(ε⁴)`; `b_t = −ta`, exponent `0` | Holds |
| §7.1 (sampled) | Jensen mass bound; Green bound; Harnack; disc integral; polar formula at `g = 1`; point mass; recentred logarithm; `ℝ⁴` control | `M·log(R/R')/2π ≤ A`; `abs(R'² − tw̄) ≤ 2R'²`; `−h ≤ ((R' + r)/(R' − r))·A`; `∫_{D(w,2R')}(2R'/abs(t − w))^s = 2π(2R')²/(2 − s)`, `s ≤ 1` for `α ≤ α_1`; both sides `vol(S^{2n−1})ρ^{2n}/(2n)`; `α_1 = log(8/7)/log 4 = 0.096`; `α_1c = log(4/3)/log 4 = 0.21`; `Δ = (s + 4ε)(s + ε)^{−5/2}`, radial eigenvalue `(1/4)(2ε − s)(s + ε)^{−5/2}` | Holds |
| §7.2 (headline) | `u = ψ − sup ψ + A·abs(z)² − 4A` on `B(0, 2)`; `ℂP¹` | `u ≤ 0`, `e^{−α(ψ − sup ψ)} ≤ e^{−αu}`; `∫(abs(z)² + ε)^{−α}` bounded in `ε` iff `α < 1` | Holds |
| §8.2 | iteration; `(1/4)·1_{[0,1/4)}`; `e^{−s}` at `δ_0 = 0` | `φ(s_j + 1) ≤ B_0φ(s_j)^{δ_0}φ(s_j) < φ(s_j)/2`, step `< 2B_0φ(s_j)^{δ_0} < 2^{−jδ_0}`, sum `1/(1 − 2^{−δ_0})`; `r/4 < 1/16`; `re^{−r} ≤ 1/e` | Holds |
| §8.3 (headline) | strictness at `s_0`; `Ē = 0`; the `C¹` pair | `s_0Φ(s_0) < Ē` gives `Φ(s_0)^{δ_0} < 1/(2B_0)`; `Ē = 0` forces `Φ(0) = 0`; `∂_jf ≥ 1 − (3/2)δ − δ/2 = 1 − 2δ` since `abs(λ_1 − λ_2) < σ_1` on `Γ_2` | Holds |
| §8.4 (sampled) | Lemma 5; Jensen step; background `a_0`; `φ_1 = −M` | `c_t^nV = ∫ω_{t,φ_t}^n = V_t`; `α_0E_t ≤ n∫F dμ + log c_t^n + log C − log V_t = n∫F dμ + log(C/V)`, `∫F dμ ≤ Ent_1`; `4 − 2.5 > 0`, `2 − 2.5 < 0`; `E_1(−M) = M` | Holds |
| §8.5 (sampled) | Jensen step for (c); determinant comparison; torus `n = 3` | `c∫(−φ)^Ndμ ≤ log(C/V) + n∫F dμ`; `n = 1`: `a = (Ĝ/4)I_2`, `det a = 4^{−2}Ĝ²`; `(1/3)·0.03²/4 = 7.5·10⁻⁵ ≥ 0.03²/(12·1.03) = 7.28·10⁻⁵` against `(1/27)·0.03³·4/(3π) = 4.24·10⁻⁷ ≤ 0.010153³ = 1.047·10⁻⁶` | Holds |
| §8.6 (sampled, headline) | `χ = 0`, `t = 1`; `n = 1` | normalized `F` gives `c_1 = 1`, `V_1 = V`; `p' = n` allows `N = 1`; `Ent_n ≤ 1 + Ent_p`; source exponent `n/(n − 1) = 1/0` at `n = 1` | Holds |
| §8.7 (headline) | entropy bound on both two-valued `F`; exponents; rescaled background | `(2/e)² = 0.5413`; `Ent_2 = (0.4122 + 0.3845)/2 = 0.398 ≤ 0.5413·2.421 = 1.310`; `0.4872 + 4.1457 = 4.633 > 0.5413·7.7288 = 4.184`, full `4.725`; `q' = n/(n − k)` gives `q = n/k`; `λ[ω_X + i∂∂̄(φ_t/a_0)] = λ[a_0ω_X + i∂∂̄φ_t]/a_0 ∈ Γ_k` | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators in this round.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 1.2 | spruck2005 line 11089–11091 (Lemma 1.5, the lower bound); lewis1996 line 145–148 (Fan's convexity) and 154–159 (Theorem 2.1, at diagonal matrices). Supported; the README states the uniqueness as its own step. |
| 1.5 | gpt2023 line 241–250 (Euler step) and 255 (arithmetic–geometric step). Supported. |
| 2.1 | spruck2005 line 11257–11265, 11268–11275, 11279–11293; dinew-kolodziej2014 line 152–159. Supported; the index conditions of Lemma 2.10 (`r ≥ k`, `s ≥ l`) are those of the README. |
| 2.3 | spruck2005 line 11295, 11303–11320, 11347–11348, 11364–11365; gpt2023 line 751–756; dinew-kolodziej2014 line 165–172. Supported. |
| 3.2 | dinew-kolodziej2014 line 33–35, 165–172, 259–263; gpt2023 line 923–926. Supported, with the normalization of the Conventions. |
| 4.1, 4.2 | tosatti-weinkove2010 line 36–47 (Corollary 1). Supported for the Monge–Ampère pair; the README says the comparison itself is not in the source. |
| 5.4 | guedj-zeriahi2005 line 138–141 and 255–274; gpt2023 line 689–692. Supported. |
| 6.3 | pss2012 line 981–990 and 994–1031, with (5.4) at line 837–840. Supported. |
| 6.6 | tosatti-weinkove2010 line 52–59; pss2012 line 170–179 and 216–233. Supported. |
| 7.1 | demailly2012 line 1534 and 1717–1731 (printed p. 37); pss2012 line 2943–2945; gpt2023 line 287–289, whose references [12] and [19] are Hörmander and Tian. Supported. |
| 8.4 | gpt2023 line 785–850 (Lemmas 5–6, Theorem 4). Supported. |
| 8.5 | gpt2023 line 458–475, 500–502, 687–701, 720–736. Supported; the additive `1` in the signed-moment bound corrects the source (Source issues). |
| 8.6 | gpt2023 line 84–89 and 442–457. Supported. |

Also read: gpt2023 line 101–130, 198–205, 380–441, 861–952, 956–981 (Theorems 2 and 5, Lemmas 1, 2, 7, 8, (5.5)); spruck2005 line 11066–11100 and 11182–11235; lewis1996 line 77–81, 185–187, 468–469; guo-phong2024 line 76–104; szekelyhidi2018 line 29–31 and 183–185; pss2012 line 245–308, 1067–1081, 2946–2955; demailly2012 line 15190–15191 (printed p. 306); twwy2015 line 75–77 and 132–136. Each supports the statement it is cited for.

### Pins, duplication and suppliers

- Pins: `lake-manifest.json` has Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- Tau Ceti declarations opened at the pin: `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `HoffmanWielandt/Basic.lean:78` (`Re tr(T∘S) ≤ Σ λ_i(T)λ_i(S)`); `KyFan.lean:99`, `489`; `Harmonic/MeanValue/Basic.lean:464`; `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`2 < finrank ℝ E`, compact, `C¹` functions); `Analysis/Complex/LeviForm.lean:119`, `142`, `150`, `270`, with the real and imaginary parts at `re_leviForm_apply` and `im_leviForm_apply` as the Conventions state them; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Analysis/Complex/Wirtinger/LeviForm.lean:79` (the `(k, j)` entry is `∂²f/∂z_j∂z̄_k`); `Geometry/Manifold/Complex/LeviForm.lean:106`, `156`, `165`, `172`, `179`, `206`, `241`, `292`, `343`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231`; `Geometry/Manifold/TwoForm/Basic.lean:37`; `Geometry/Manifold/DifferentialForm/Smooth.lean:479`; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `Analysis/MeanInequalities.lean:68`; `Analysis/Matrix/MinkowskiDeterminant.lean:159` (on `{A | A.IsPositive}`); `Analysis/PDE/Regularity/Harnack.lean:284`.
- The composition rule at the pin (`Geometry/Manifold/Complex/LeviForm.lean:206`) has the factor `1/4` on the complex-linear extension of the real differential, which is `2∂u`; that is `conj(∂u(v))·∂u(w)`, as the README reads it.
- No non-strict plurisubharmonicity predicate exists at the pin (only `IsStrictlyPlurisubharmonicAt` and `IsManifoldStrictlyPlurisubharmonicAt`), as the README says.
- Mathlib declarations opened at the pin: `Analysis/InnerProductSpace/Spectrum.lean:277`, `297`, `309`, `314`, `384`; `Analysis/Matrix/Spectrum.lean:67`, `143`, `193`, `240`; `RingTheory/MvPolynomial/Symmetric/Defs.lean:69`, `202`; `Analysis/Calculus/LocalExtr/Polynomial.lean:64`; `Analysis/MeanInequalities.lean:129`; `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`; `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:118`; `Analysis/Calculus/Implicit.lean:450–454` (the finite-dimensional section, `[FiniteDimensional 𝕜 F]`).
- Supplier sections on main: PDE §3.2 (C13) at line 1344, where line 1356–1360 plans the strong maximum principle for variable symmetric principal coefficients (Gilbarg–Trudinger Theorem 3.5) and line 1403–1408 the Aleksandrov–Bakelman–Pucci estimate in the form of the contract; §5.4 (E23) at 1965; §5.6 (E25) at 2097, with the scaled interior estimate of the contract. PseudodifferentialOperators §5.4 at 1337 and §6.2 at 1523. ComplexKahlerGeometry K1 370, K2 558, K4 1091 (Chern connection at 1134), K5a 1440–1948, K6.0 2321 (`Δ_d = 2Δ_∂̄` at 2381). DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796. ComplexManifolds Milestones 1–2 at 172, 197. RiemannianGeometry R5c item 4 at 3892–3901, with `exists_pos_laplaceBeltrami_eigenvalue_isLeast` at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534` (smooth mean-zero functions, as the contract states). OperatorTheory PD-A51–A53 (`PolarDecomposition/README.md:254–260`), PA-B32 (`PrincipalAngles/README.md:272`), MAJ-A27 (`Majorization/README.md:176`). AffineMorseLefschetz §1.1 at 315. OptimalTransport Layer 6 at 2421.
- At open heads, cited in Scope and Downstream consumers only: K3Surfaces §2.1 (line 528; the equation `(ω+i∂∂̄φ)² = cV` with `∫φω² = 0` and its own estimates); ShimuraVarieties §7.0g (line 1993); NumberFieldEnumeration §1.1 (line 195, `e_k/C(n,k) ≤ (e_1/n)^k` for nonnegative reals, by averaging pairs); ComplexComparisonPartII C5.4. The citation resolver lists nothing as found nowhere.
- The open pull request that changes PDE carries an older text of that roadmap without the section labels; PDE is cited as it is on main, as the rules require, and the overlap file lists no dropped id.
- By object, `roadmaps grep -i --readme-only` over main and the open heads: "Calabi conjecture", "Yau's theorem", "hyperbolic polynomial", "Gårding cone" find nothing outside this roadmap; "Monge–Ampère" finds ShimuraVarieties §7.0g and K3Surfaces §2.1 (both named in Scope) and non-Archimedean measures in ArithmeticDynamics and ArakelovGeometryAndAbelianHeightsPartII, different objects; "Newton/Maclaurin inequality" finds a log-concavity remark in ClassicalArithmeticCompletion and NumberFieldEnumeration §1.1 (named in Scope); "spectral function" finds measurability statements in OperatorTheory and unrelated uses; "complex Hessian" finds a strictly plurisubharmonic exhaustion in ComplexComparisonPartII. Ownership against open pull requests was checked through these searches and `roadmaps show` at the heads of the index of 2026-11-15.

Overlap check: read ComplexKahlerGeometry, PDE, ManifoldOptimization, SymmetricHyperbolicSystems (open, by vocabulary), PDE, Yamabe, RiemannianGeometry (main), the third list being empty; shared objects: the Poincaré inequality on a closed manifold (owner RiemannianGeometry R5c), the eigenvalue variational inequalities and the Levi form (owner the pinned Tau Ceti), the strong maximum principle, the Aleksandrov–Bakelman–Pucci and interior Schauder estimates (owner PDE §§3.2, 5.6), the weak Harnack inequality for supersolutions (owner PDE §5.4, by the declared gap), the type calculus, Chern connections and Kähler identities (owner ComplexKahlerGeometry K1–K6.0); nothing else shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited.

### Headline theorems and padding

Headlines from the Summary: Lewis's theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, Hessian quotients and structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: no one-tactic probe, no signature and no `#check` comparison.

### Copyright and arrangement

- Wording: the passages at every locator of the source sample, and further prose from seven sections (§1.4 against spruck2005 line 11066–11100; §2.2 against line 11182–11235; §2.4 against guo-phong2024 line 76–90; §6.2 route against pss2012 line 246–303; §7.2 against line 2946–2955; §8.2 against gpt2023 line 412–426; §8.7 against line 861–952), were set beside the sources. What is shared is formulas and hypothesis lists that the statements force; no sentence or proof plan follows a source clause by clause.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7, in the order §2, §4, §3, §5 and inside one layer of eight; Layers 1–7 have no counterpart. The `*Needs:*` lines force 8.1, 8.2 → 8.3 → 8.4; 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 32 passages compared with 10 sources, none shared; largest share gpt2023, 43 of 148 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread.
- spruck2005 is an OCR text: the displays at line 11076–11078, 11090–11091, 11272–11274, 11281–11286 and 11307–11312 are garbled. Those statements were recomputed, not read.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. Pinned declarations were read, not elaborated.
- The index-level signs of `Θ` and `Q` in Calabi's identity (§6.1) were compared with pss2012 (7.3)–(7.4) by reading only; the computed torus instances test the two squared terms at `x = 0` and the term `⟨T, Q(T)⟩` at `x = 1/4`, not `Θ`.
- The parts of the Layer 8 routes taken from inside the proofs of gpt2023 Lemma 1 and Lemma 3 (line 206–302 and 510–719) were read for their inputs and constants, not recomputed line by line.

## Source issues

- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p. 9: the source says the closed-sublevel mass function is continuous; it should be the strict-sublevel function, which is right-continuous as its Lemma 2 requires; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 1, (3.3), arXiv v1 p. 11: the source bounds the energy by Hölder's inequality with an exponent undefined in dimension one; it should apply its Theorem 3(c) with first power directly there; affects the proof.
- **Error** in gpt2023 at the end of the proof of Theorem 3, arXiv v1 p. 16: the source bounds the signed first moment of the density by the entropy of order p alone; it should add one, since small values of the exponent contribute; affects the proof.
- **Gap** in gpt2023 at Lemma 3, arXiv v1 p. 12: the source takes its exponent as the reciprocal of the power, strictly between zero and one, so powers at most one are not covered; it should derive them from larger powers; affects the proof.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p. 17: the source allows equal indices in the quotient and names the cone of one index only; it should require the lower index strictly smaller and use the smaller cone; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed p. 290: the source says equality in Newton's inequalities holds, for every real vector, only when all entries are equal; it should restrict that clause to positive entries; affects a stated result.
- **Error** in spruck2005 at Corollary 2.4, printed p. 289: the source says the cone of every symmetric hyperbolic polynomial contains the positive cone and has positive partial derivatives; it should assume the coordinate vectors lie in its closure; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1; `lewis1996` is read from an author page and `spruck2005` from an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "41c134c545c5fbd991804f8d7bdc874b9384f1ab", "job": "REV-DESIGN-ComplexHessianEquations~15", "model": "fable", "worker": "chris-x89"} -->
