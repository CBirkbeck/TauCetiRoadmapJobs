<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6898064829 -->
Review (claude) of 506f988

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.3, fourth Check: `F_t` is smooth only for a pair with smooth `f`

   **Location.** `packages/ComplexHessianEquations/design/README.md:664`: "take `φ_t = −ε·ρ` with `ρ` a smooth function … it solves the equation for the smooth normalized `F_t` and the constant `c_t` that the equation defines". Plan target 8.3, the test on right-continuity.

   **Claim.** For the standing admissible pair `(f, Γ)` of Layer 8, the function `F_t = log(f(λ[ω_{t,φ_t}])/c_t)` is smooth, so the example meets the hypothesis "normalized smooth `F_t`" of §8.3.

   **Witness.** An admissible pair has `f` only `C¹` (§2.4). On `Γ_2 ⊂ ℝ²`, `f = σ_1 + δ|λ_1 − λ_2|^{3/2}σ_1^{−1/2}`, `0 < δ < 1/2`, is elliptic with `∏∂_jf ≥ (1 − 2δ)²`; at `λ = (1 + a, 1)`, `f = 2 + a + δ|a|^{3/2}(2 + a)^{−1/2}` is not `C²` in `a` at `0`.

   **Exact repair.** In that Check write "for the Monge–Ampère pair take `φ_t = −ε·ρ` …", and replace "the smooth normalized `F_t` and the constant `c_t` that the equation defines" by "`e^{nF_t} = c_t^{−n}·ω_{t,φ_t}^n/ω_X^n` with `c_t^n = V_t/V` (§3.4), a smooth positive function since `ρ` is smooth, so `F_t` is smooth and normalized". The plan's test follows. Tested on the witness: for `σ_n^{1/n}` the same `λ = (1 + a, 1)` gives `e^{2F_t} = (1 + a)/c_t²`, smooth in `a`; `∫ω_{t,φ_t}^n = V_t` (§3.2) gives `∫e^{nF_t}ω_X^n = V`.

One finding, P3 (a Check of §8.3 whose data need not meet the theorem's smoothness hypothesis); it is not blocking, but its repair is written below and a repair, whatever its priority, asks for changes. Both round-8 findings are repaired, and every passage the repair changed or added holds on the instances computed below. Nothing else is to repair. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is not a finding: it is precise, minimal and declared under the same slug in `packages/ComplexHessianEquations/design/README.md` (line 99) and in the `gaps` list of `packages/ComplexHessianEquations/design/plan.json`. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md`.

| Round-8 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01 (P3), two Checks of §8.2 never met the smallness hypothesis | Line 651: "`φ = (1/4)·1_{[0,1/4)}` with `B_0 = δ_0 = 1` meets every hypothesis and reaches the conclusion"; line 653: "with `B_0 = 1/e`, since `re^{−r} ≤ 1/e` on `[0, 1]` … `φ(s_0)^0 = 1 < 1/(2B_0) = e/2`". Recomputed: `s + r < 1/4` forces `s < 1/4`, `φ(s)² = 1/16`, `rφ(s + r) = r/4 < 1/16`; `φ(0) = 1/4 < 1/2`; threshold `0 + 1/(1 − 1/2) = 2 ≥ 1/4`. `d/dr(re^{−r}) = (1 − r)e^{−r} ≥ 0` on `[0, 1]`, maximum `e^{−1}` at `r = 1`; `e/2 = 1.359 > 1`. Plan tests `deGiorgi_indicator`, `deGiorgi_delta_zero` carry the same data. | Repaired |
| F02 (P3), §6.6 path exponent is `tF + b_t` | Line 574: "for the equations `ω_{φ_t}^n = e^{tF + b_t} ω^n` with `b_t = log(∫ ω^n/∫ e^{tF} ω^n)`" and "`‖tF + b_t‖ ≤ ‖F‖ + sup|F|·‖1‖` in every `C^k` and `C^{k,α}` norm"; line 578 adds `b_t = −ta`. Recomputed: `e^{−t sup|F|}∫ω^n ≤ ∫e^{tF}ω^n ≤ e^{t sup|F|}∫ω^n`, so `|b_t| ≤ t sup|F|`; `F = a`: `b_t = −ta`, exponent `0`; pss2012 line 220–224 (its (2.6)) has the same normalizing quotient. | Repaired (in a form that holds for norms with `‖1‖ ≠ 1`) |

Patterns searched in the rest of the design, and the passages the repair added:

- F01 pattern (Check data that does not meet a hypothesis of the statement tested). I evaluated the Checks of all 35 subsections against their statements. One further instance: R01. The repair's change to §5.4 (second Check, `sup ψ_ε = 0` attained at `∞`) and the strict-smallness clause added to §8.3 are recomputed in the table and hold.
- F02 pattern (a path or auxiliary equation whose constant is dropped). §6.6 is the only continuity path; §8.1 and §8.5 solve auxiliary equations through §6.6's statement, which carries `b`. The admissible-pair form of §6.6: `b = n·log c = log(∫χ^n/∫e^{nF}ω_X^n) = log(∫χ^n/V)`, in agreement with `c^n = ∫χ^n/V`.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜`, hyperbolic polynomials of every positive degree, every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- Not a re-plan and no second copy: no `ComplexHessianEquations` folder on main (head `1a19c9f`); the name is absent from the 240-line open-pull-request list and occurs once in the board-packages index; `scratch/overlaps.md` lists no second copy, no other pull request changing it, no dropped id.
- Organisation: eight layers named by their mathematics, no sentence saying the roadmap follows a source.
- Shape: 35 `*Needs:*` lines for 35 subsections; eight layers each ending with `### Examples` and `### Dependencies` (16 headings); every definition has at least three Checks (§1.1: 7, §1.2: 3, §1.3: 3, §2.2: 10, §2.4: 7, §3.1: 4, §3.3: 3, §3.4: 4). A search of the README for LaTeX delimiters, pull-request numbers, machine paths, HTML anchors, `lemma` as a keyword and process words finds nothing (the only hits are "De Giorgi's iteration lemma" and "the lemma" as mathematics). The README advertises no Lean name of its own.
- Plan: parses; 47 targets in 8 layers; every `target:` prerequisite points to an earlier target (0 forward edges); one gap. The diff from the round-8 head changes four strings of the plan (three tests, the statement of 8.3) and twelve lines of the README, as the repair report says.
- Manifest: 19 entries (11 certified, 8 uncertified), one per work in the References, no local path. Not changed by this review.
- Declared gap: `needs` is one statement with all its hypotheses (`m ≥ 1`, `r > 0`, `u ∈ H¹(B_{4r})`, `u ≥ 0` a.e., measurable uniformly elliptic `a`, finite `q ≥ 1`, `q > m/2`). PDE §5.4 (E23) on main (`TauCetiRoadmap/PDE/README.md:1965`, text at 1997–2002) plans the weak Harnack and Harnack inequalities for nonnegative weak solutions of the homogeneous equation; the pin has the homogeneous supersolution form (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`, read: `(⨍_{B(x₀,r)} u^s)^{1/s} ≤ C·u(x)` a.e., no forcing term). The supersolution form with `f ∈ L^q` is in neither: the gap asks for nothing already provided.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems, every passage the round-8 repair changed or added, the sections the earlier review relied on from older rounds (§§2.2, 2.3, 6.1, 6.4, 8.1), and the target of R01. All values were computed in this round.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: `h`, `H_α`, `i∂∂̄` | `h(Ju, v)`; `u = x_1²` on `(∂_x, ∂_y)`; `|z|²` | `h(Ju,v) = ω(u,v) − i·g(u,v) = −i·h(u,v)` (conjugate-linear in the first slot); `Re H = (2 + 0)/2 = 1`, `Im H(∂_x,∂_y) = (0 + 2)/2 = 1 = dx∧dy(∂_x,∂_y)`; `g = 1/2`, `a = 1`, `λ = 2` | Holds |
| §1.1 relative eigenvalues (sampled) | Gram `diag(2,1)`, `a = diag(2,3)`; `−a`; `det(Id + t·diag(1,2,3))` | `g⁻¹a = diag(1,3)`, `λ = (3,1)` against Euclidean `(3,2)`; `(−1,−3)`; `1 + 6t + 11t² + 6t³` | Holds |
| §1.2 trace bounds, Ky Fan derivative (sampled) | `F = diag(2,1)`, `B = diag(0,3)`; upper derivative bound; `T = diag(3,1,1)`, `m = 2` | `3 ≤ tr(FB) = 3 ≤ 6`; `κ_m(T+H) = tr(P_{T+H}T) + tr(P_{T+H}H) ≤ κ_m(T) + tr(P_{T+H}H)`; `κ_2 = 4 + |t|` | Holds |
| §1.4 convexity, concavity, monotonicity (sampled) | pairing in the concavity route; `det^{1/2}` at `diag(4,1)`, `diag(1,4)`; `f = −σ_1`; `S ≤ T`, `λ(S) = λ(T)` | decreasing list of `∇F_f(S)` is `∂_nf ≥ … ≥ ∂_1f`, paired with `λ_n(T) ≤ … ≤ λ_1(T)`: lower bound `Σ∂_if·λ_i(T)`; `2, 2, 5/2`; `−1 > −2`; `tr(T − S) = 0`, so `S = T` | Holds |
| §1.5 determinant, Euler | `σ_2^{1/2}` at `T = diag(1,4)` | `∂f(4,1) = (1/4, 1)`, `∇F = diag(1, 1/4)`, `det = 1/4 = 2^{−2}`, `tr(∇F·T) = 2 = F(T)` | Holds |
| §2.1 Newton–Maclaurin | `(1,2,3)`; `(r,s,k,l) = (3,2,2,1)`, `(2,0,2,1)`; chord slopes | `S = (2, 11/3, 6)`, `12 ≤ 121/9`; `18/11 ≤ 11/6`; `1.915 ≤ 1.833` false, and `l = 1 > s = 0`; slope over `[l,k]` ≥ over `[l,r]` ≥ over `[s,r]` uses `k ≤ r`, `l ≤ s` | Holds |
| §2.2 Gårding, symmetric cones | `p = 2xy − 0.9(x² + y²)`; derivative route; `p_c` | `p(x+te) = 0.2t² + 0.2(x_1+x_2)t + p(x)`, discriminant `0.76(x_1−x_2)²`; sector roots of `r² − (20/9)r + 1`: `0.627`, `1.595`; `p(1, 0.1) = −0.709`, roots `1.41`, `−2.51`; `p(1, 0.7) = 0.059`, `∂_xp = −0.4`; `p_19/20`: `(1−19)/20 = −0.9`, `(2+38)/20 = 2`; bounded polynomial on a half-line is constant, line leaves `σ_1 > 0` | Holds |
| §2.3 quotients, tangent inequality | `σ_2/σ_1` at `(4,1)`, `(1,4)`, midpoint; `σ_2^{1/2}`, `λ = (1,4)`, `μ = (4,1)` | `0.8`, `0.8`, `1.25`; `∂g(1,4) = (1, 1/4)`, `4·1 + 1/4 = 4.25 ≥ 2`; general form: `σ_k(μ)^{1/k} ≤ (1/k)σ_k(λ)^{(1−k)/k}Σμ_iσ_{k−1;i}(λ)` | Holds |
| §2.4 admissible pairs, structural condition (sampled) | choice `μ_j = (∏∂_if)^{1/n}/∂_jf`; combination; wedge cone | `∏μ_j = 1`, `nγ^{1/n} ≤ f(μ) ≤ n(∏∂_jf)^{1/n}`; `∏(a∂_jf_1 + b∂_jf_2)^{1/n} ≥ aγ_1^{1/n} + bγ_2^{1/n}`; wedge point has `μ_1 + μ_2 > μ_1/2 > 0`; `(1.01, −0.15)` has ratio `−0.149 ∉ (−1/2, −1/3)` and `μ_2 < 0` | Holds |
| §2.5 structural constants | Hessian at `e`; quotient plus `cσ_p^{1/p}`; `σ_2/σ_1` at `(M,1,1)` | `(1/k)binom(n,k)^{1/k−1}binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `f ≥ cσ_p^{1/p} ≥ c·binom(n,p)^{1/p}(∏μ)^{1/n}` on `Γ_n`; `∂_1 = (2(M+2) − 2M − 1)/(M+2)² = 3/(M+2)²`, `∂_2 = (M² + M + 1)/(M+2)²` | Holds |
| §3.2 form and integration identities (sampled) | `k = 1`, `n = 2`; mixed inequality; Maclaurin form `λ = (4,1)`; Stokes | `α∧ω = (σ_1/2)ω²`; `M_k(α,β,…,β) = (1/k)D(σ_k∘λ)(β)(α) ≥ σ_k(α)^{1/k}σ_k(β)^{(k−1)/k}`; `5/2 ≥ 2`, constant `1` since both sides are `S_k^{1/k}`, `S_n^{1/n}`; `∫Δ_ωu·ω^n = n∫u·i∂∂̄ω^{n−1}` | Holds |
| §3.3 constants | `χ = ω`, `F = 0`; Hessian, Kähler; `ℂP¹`, `χ = 2ω` | `c = 1`, `binom(n,k)^{1/k}`, `n`; `c^k = binom(n,k)∫χ^k∧ω^{n−k}/∫e^{kF}ω^n`; `c = 2` | Holds |
| §4.2 uniqueness (headline) | maximum and minimum of `ψ − φ`; two components | `c' ≤ c ≤ c'`; `ψ = (0, −1)` solves with the same `c` | Holds |
| §5.1 Kähler Laplacian (sampled) | `|z|²`; integration by parts; `ω = e^ρω_0` on `ℂ²` | `2Δ_ω = 4n` = Euclidean; `d(v∂u∧ω^{n−1})` gives `∫vΔ_ωu·ω^n = −n∫i∂u∧∂̄v∧ω^{n−1}`; real dimension `4`: `Δ_g = e^{−ρ}(Δ_0 + ⟨∇ρ,∇·⟩)`, so `2Δ_ωu − Δ_gu = −e^{−ρ}⟨∇ρ,∇u⟩ = −e^{−x_1}` at `ρ = u = x_1` | Holds |
| §5.3 Poincaré and Sobolev (sampled) | torus, `u = cos 2πx`; exponent | `Δ⁺u = 4π²u`, `1/2 = 2π²/4π²`; `2·2n/(2n − 2) = 2n/(n−1)`; pinned hypothesis `2 < finrank ℝ E` reads `2 < 2n`, false at `n = 1` | Holds |
| §5.4 `L¹` bounds (sampled; Check changed) | divergence form; `ψ_ε` on `ℂP¹`, chart `w = 1/z` | `∂_i(√g g^{ij}∂_ju) = √gΔ_gu = 2√gΔ_ωu ≤ 2A√g` for `u = −φ`; `(|z|²+ε)/(1+|z|²) < 1` on `ℂ` for `ε < 1`, `= (1+ε|w|²)/(1+|w|²) = 1` at `w = 0`; `−ψ_ε ≤ log(1 + |z|^{−2})`, integrable | Holds |
| §6.1 curvature identities (sampled) | torus `n = 1`, `g = 1/2`, `ω_φ = qω`; `ω_φ = sω`; `ℂP¹` | `Δ_{ω_φ}tr h = q''/(2q)`; `Δ_ωF + G = (1/2)(q''/q − q'²/q²) + q'²/(2q²) = q''/(2q)` at every `x`; `S = (2/q)(q'/2q)² = q'²/(2q³)`; at `x = 0`: `Δ_{ω_φ}S = q''²/(2q⁴) = 8π⁴a²/(1−a)⁴`, `|∇'T|² = (4/q²)(q''/4q)² = 4π⁴a²/(1−a)⁴`, twice; `K = Σ_{p,j}B(e_p,e_j) = s_ω`; `−i∂∂̄log(1+|z|²)^{−2} = 2ω` | Holds |
| §6.2 `C⁰` estimate (sampled) | torus `ℂ²/ℤ⁴`, `φ = ε cos 2πx_1` | `i∂∂̄φ = (φ''/2)dx_1∧dy_1 = −2π²ε cos(2πx_1)dx_1∧dy_1`; `q > 0` iff `ε < 1/(2π²)`; `∫q = 1`; at `ε = 1/(4π²)`: `q(0) = 1/2`, `q(1/2) = 3/2` | Holds |
| §6.3 `C²` estimate | maximum of `log tr h − Aφ` | `Δ_{ω_φ}φ = n − tr h⁻¹`; `0 ≥ (A − C_1 − Λ)tr h⁻¹ − An`; `tr h ≤ (tr h⁻¹)^{n−1}e^F`; `(tr h)(tr h⁻¹) ≥ n² ≥ 1` | Holds |
| §6.4 `C³` estimate (sampled) | torus solution of §6.2 | `∂_{z_1}h_{11} = (1/2)q' = 2π³ε sin 2πx_1`; `S = 0` iff `ε = 0` or `sin = 0` | Holds |
| §6.6 Yau (headline; route changed) | `F = a`; uniform bounds along the path; wrong exponent `ta`; pair form | `b_t = −ta`; `sup|tF + b_t| ≤ 2 sup|F|`, `Δ_ω(tF + b_t) = tΔ_ωF`, `‖tF + b_t‖ ≤ ‖F‖ + sup|F|·‖1‖`; `∫e^{ta}ω^n = e^{ta}∫ω^n ≠ ∫ω_{φ_t}^n`; `b = n log c` | Holds |
| §7.1 local estimate (sampled) | Jensen bound; Green bound; polar formula at `g = 1`; radii; point mass; `u_ε = −(|x|²+ε)^{−1/2}` on `ℝ⁴` | `M ≤ 2πA/log(R/R')`; `|R'² − tw̄| ≤ 2R'²`, `∫_{D(w,2R')}(2R'/ρ)^s = 2π(2R')²/(2 − s)`, `s ≤ 1`; `vol(S^{2n−1})ρ^{2n}/(2n)`; `1/4 + 7/4 = 2`, `(3/2)/(11/8) = 12/11`; `α_1 = log(8/7)/log 4 = 0.0963`; `Δu_ε = (r² + 4ε)(r² + ε)^{−5/2}`, radial Levi eigenvalue `(1/4)(2ε − s)(s + ε)^{−5/2}` | Holds |
| §7.2 global estimate (headline) | `ψ + A|z|² − sup ψ − 4A` on `B(0,2)`; `ℂP¹` family | `≤ 0` since `|z|² < 4`; `∫|z|^{−2α}` over a disc finite iff `α < 1` | Holds |
| §8.1 comparison lemma | `G = ∇F_f/f` | `det G = ∏∂_jf/f^n ≥ γf^{−n}`, `tr(G·h) = 1` (Euler); `A_s > 0` iff `inf φ_t < −s`; constants `C, β_0` of `n, ω_X, χ, γ` as gpt2023 line 198 | Holds |
| §8.2 De Giorgi (sampled; Checks changed) | proof step; `s_0 = 0`; the three Checks | `rφ(s_j)/2 < B_0φ(s_j)^{1+δ_0}` gives `r < 2B_0φ(s_0)^{δ_0}2^{−jδ_0} < 2^{−jδ_0}`, sum `< 1/(1 − 2^{−δ_0})`; hypothesis at `s = 0` is the limit `ε ↓ 0` by right-continuity; Checks as in the repair table; `re^{−s−r}/(B_0e^{−(1+δ_0)s}) → ∞` | Holds |
| §8.3 degenerating estimate (headline; clause added) | `Φ(s_0) > 0`, `Ē > 0`; `Ē = 0`; lower bound for `A_s` | `s_0Φ(s_0) < (c_t^n/V_t)∫_{Ω_{s_0}^∘}(−φ_t)e^{nF_t} ≤ Ē`, so `Φ(s_0) < (2B_0)^{−1/δ_0}`; `0 < 0` impossible, so `Φ(0) = 0`; `−φ_t − s > r` on `Ω_{s+r}^∘` | Holds; Check 4: R01 |
| §8.5 energy, Trudinger | `n = 1` determinant; Jensen step | `a = (Ĝ/4)I_2`, `det a = 4^{−2}Ĝ²`; `c∫(−φ)^Ndμ ≤ log(C/V) + n∫F dμ`, `∫F dμ ≤ Ent_1 ≤ 1 + Ent_{p'}` for `p' ≥ 1` | Holds |
| §8.6 fixed background (sampled, headline) | `χ = 0`, `t = 1`, normalized `F` | `c_1 = 1`, `V_1 = V`; `Ent_n(F) ≤ 1 + Ent_p(F)`; gpt2023 line 68–70 normalizes `F` in the same way | Holds |
| §8.7 Hessian estimate (sampled, headline) | conjugates; entropy bound, `n = 1`, `p = q = 2`; rescaled background | `q > n/k ⇔ q' < n/(n−k)`; `x^pe^{−δx} ≤ (p/(eδ))^p`, `(2/e)² = 0.5413`, `0.5413·(1 + 1.421) = 1.310 ≥ 0.398`; `a_0ω_X + i∂∂̄φ_t = ω_{t,φ_t} + (a_0ω_X − ω_t)` with the second term `≥ 0`, and `Γ_k + Γ̄_n ⊆ Γ_k` | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators in the certified texts.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 1.2 | spruck2005 line 11089–11091 (Lemma 1.5, lower bound; OCR garbled, the pairing legible); lewis1996 line 145–148 and 154–159 (Theorem 2.1, statement garbled, the gradient and "vacuous for `m = n`" legible). Supported. |
| 1.4 | spruck2005 line 11066–11100 (Theorem 1.4, its hypotheses at 11069–11072, the ordering at 11095–11097, the concavity chain at 11098–11100). Supported; the README states what the source assumes and what its routes need. |
| 2.4 | guo-phong2024 line 76–80, 83–90, 103–104; gpt2023 line 71–76, 84–86, 744–769 (Lemma 4); szekelyhidi2018 line 29–31, 183–185; spruck2005 line 11314. Supported. |
| 3.2 | dinew-kolodziej2014 line 33–35, 165–172, 259–263; gpt2023 line 924–926. Supported. |
| 5.1 | demailly2012 line 15190–15191 (Corollary VI.6.5; page marker 306 at line 15185); twwy2015 line 75–77; pss2012 line 871–875. Supported. |
| 5.3 | pss2012 line 278–288 (Sobolev, in squared form) and 299–303 (Poincaré for the `L²` bound). Supported. |
| 5.4 | guedj-zeriahi2005 line 138–141 and 255–274 (Proposition 1.7); gpt2023 line 689–692. Supported; the README says where it is more general. |
| 6.1 | pss2012 line 163–164 ((2.2)), 837–840 ((5.4)), 994–1016 ((6.2)–(6.6)), 1046–1064 ((7.1)–(7.4)). Supported. |
| 6.2 | pss2012 line 245–308 (Theorem 3 at 304–306, its density `F` being `e^F` here); tosatti-weinkove2010 line 104–106. Supported. |
| 6.4 | pss2012 line 1070–1081 ((7.5)–(7.7), Theorem 9); twwy2015 line 132–135. Supported. |
| 7.1 | demailly2012 line 1717–1731 (Proposition 4.22 with (b); page marker 37 at line 1711), line 1534; pss2012 line 2943–2945; gpt2023 line 287–289. Supported. |
| 8.2 | gpt2023 line 412–426. Supported; the README makes the threshold explicit. |
| 8.6 | gpt2023 line 84–89 (Theorem 1), 62–70 (its normalization), 442–457. Supported. |
| 8.7 | gpt2023 line 861–870, 905–952 (Lemmas 7, 8, Theorem 5). Supported; the README adds `γ` to the dependence. |

Also read for the repaired passages: pss2012 line 216–233 (§2.2 and (2.6)); gpt2023 line 197–205, 280–302, 380–441.

### Pins, duplication and suppliers

- Pins: the checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- All 52 qualified library names in the README were searched at the pins and found, and all 24 cited file paths exist. Opened: Tau Ceti `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `HoffmanWielandt/Basic.lean:78`; `KyFan.lean:99`, `489`; `Harmonic/MeanValue/Basic.lean:464` (`ContDiffOn ℝ 2` on the ball, continuous on the closed ball, `0 ≤ Δ f`; conclusion `f x₀ ≤ ⨍`); `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`CompactSpace`, `2 < finrank ℝ E`, `ContMDiff I 𝓘(ℝ) 1 u`, `riemannianVolume`); `Geometry/Manifold/Complex/LeviForm.lean:106`, `156`, `165`, `172`, `179`, `206`, `241`, `292`, `343`; `Analysis/Complex/LeviForm.lean:119`, `142`, `150`, `270`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Analysis/Complex/QuadraticLeviForm.lean:187` (`leviForm (‖z‖²) x = innerₛₗ ℂ`); `Analysis/Complex/Wirtinger/LeviForm.lean:79`; `Analysis/MeanInequalities.lean:68`; `Analysis/Matrix/MinkowskiDeterminant.lean:159` (on `{A | A.IsPositive}`, the semidefinite cone); `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231` (`Compatible` is the structure with fields `invariant`, `tames`; no closedness); `Geometry/Manifold/TwoForm/Basic.lean:37`; `Geometry/Manifold/DifferentialForm/Smooth.lean:479`; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `Geometry/Manifold/Riemannian/Laplacian.lean:238`; `Analysis/PDE/Regularity/Harnack.lean:284`. Mathlib `Analysis/InnerProductSpace/Spectrum.lean:277`, `297`, `309`, `314`, `384`; `Analysis/Matrix/Spectrum.lean:143`, `193`, `240`; `RingTheory/MvPolynomial/Symmetric/Defs.lean:69`, `202`; `Analysis/Calculus/LocalExtr/Polynomial.lean:64`; `Analysis/MeanInequalities.lean:129`; `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:118` (under `[CompleteSpace E]`); `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`; `Analysis/Calculus/Implicit.lean:465`.
- By object at the pins: no file of the pinned Mathlib or Tau Ceti states Newton's or Maclaurin's inequalities for elementary symmetric functions (the files matching the words are about series and unrelated matrices) or defines hyperbolic polynomials.
- Supplier sections resolved on main: PDE §3.2 (C13) line 1344 (strong maximum principle with variable coefficients at 1356–1361, Aleksandrov–Bakelman–Pucci with the contract's hypotheses at 1403–1408), §5.4 (E23) line 1965, §5.6 (E25) line 2097–2105; PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523 (Schauder version at 1536–1542, Fredholm theory from 1551); ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440 and 1651, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796, with `integralTopForm_mextDeriv_eq_zero` at 451 and 1742 and `integral_mul_laplaceBeltrami` at 432; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3893–3901, headline at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534`; OperatorTheory PD-A51, PD-A53 (`PolarDecomposition/README.md:254`, `260`), PA-B32 (`PrincipalAngles/README.md:272`), MAJ-A27 (`Majorization/README.md:176`); AffineMorseLefschetz §1.1 at 315; OptimalTransport Layer 6 at 2421. Open heads: K3Surfaces §2.1 (line 527, the equation `(ω + i∂∂̄φ)² = cV` with `∫φω² = 0`, as Scope says), ShimuraVarieties §7.0g (1992), ComplexComparisonPartII C5.4 (cited at its lines 154–155), NumberFieldEnumeration §1.1 (172; Maclaurin's bound for nonnegative reals at 195, by averaging pairs on a simplex, as Scope says). The worker's `roadmaps resolve` lists no citation found nowhere.
- By object, on main and at the open heads (`roadmaps grep -i --readme-only`): "hyperbolic polynomial", "Calabi conjecture", "Yau's theorem", "Calabi–Yau theorem", "Aubin–Yau", "Hessian equation", "quasi-plurisubharmonic": no match anywhere. "complex Monge–Ampère equation": ShimuraVarieties only (§7.0g, named in Scope). "Newton's inequalities": ClassicalArithmeticCompletion on main uses them inside a proof plan (lines 4077, 4087) and states none. "Maclaurin": series expansions in several roadmaps, and NumberFieldEnumeration §1.1, whose special case Scope distinguishes; that roadmap is neither on main nor earlier in the merge order, so it cannot be a supplier. "spectral function": OperatorTheory (measurability for random matrices) and unrelated uses.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15, by the object searches above; no declaration name is involved, as there is no Lean file.

Overlap check: read ComplexKahlerGeometry (main; its two open revisions keep the K-tags, as round 8 recorded), PDE (main), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge, Yamabe, RiemannianGeometry; the third list is empty. Shared objects: the Poincaré inequality on a closed Riemannian manifold, owner RiemannianGeometry R5c, consumed here; the Levi form, owner the pinned Tau Ceti (AffineMorseLefschetz §1.1); the eigenvalue variational inequalities, owner OperatorTheory at the pin; the closed-manifold Sobolev inequality, owner the pin. Nothing else is shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited. K3Surfaces, ShimuraVarieties and NumberFieldEnumeration appear only in Scope and Downstream consumers, as statements this roadmap does not import.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: nothing to probe for padding, no signature to compare, no `#check` comparison.

### Copyright and arrangement

- Wording: 18 passages set beside their sources at the locators above (gpt2023 Theorems 1, 2, 5, Lemmas 1, 2, 4, 7, 8, line 280–289; pss2012 §2.2, Theorems 3, 9, 31, (6.2)–(6.6); spruck2005 Theorem 1.4 with its proof; guo-phong2024 conditions (1)–(4); szekelyhidi2018 line 17–31; guedj-zeriahi2005 Proposition 1.7; demailly2012 Proposition 4.22). Shared text is formulas and parameter lists; the longest shared run is the dependence list of gpt2023 Theorem 2, which the statement forces. No sentence, list or proof plan follows a source clause by clause.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7. The design's order is the source's §2, §4, §3, §5, inside one layer of eight; Layers 1–7 have no counterpart in it. The `*Needs:*` lines carry the edges 8.1, 8.2 → 8.3; 8.3 → 8.4; 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 18 passages compared with 8 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread. For gilbarg-trudinger2001 Theorems 3.5, 6.2, 8.18 and 9.1, PDE on main quotes the same theorem numbers for the same statements.
- Displayed formulas of spruck2005 and lewis1996 are partly garbled by OCR (spruck2005 Lemma 1.5, lewis1996 Theorem 2.1); the statements were recomputed.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. The pinned declarations were read, not elaborated.
- Locators outside the seeded sample that no repair touched (§§1.3, 2.1–2.3, 2.5, 3.1, 3.3, 3.4, 4.2, 5.2, 6.3, 6.5, 7.2, 8.1 beyond the statement, 8.4, 8.5) were not read again this round; their statements were recomputed above, and round 8 records the reading of most of them.
- The two open revisions of ComplexKahlerGeometry and the open pull request on PDE were not read again this round; `scratch/overlaps.md` (same index) lists no id they drop, and both roadmaps are cited as they are on main.

## Source issues

Only what was read in this round is listed; the issues in spruck2005 (Corollary 2.4, Proposition 2.7) and in the proof of gpt2023 Theorem 3(c) recorded by round 8 were not re-read.

- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.10: the source picks the starting level by Chebyshev's non-strict bound; it should note the bound is strict for continuous solutions, as its Lemma 2 needs a strict inequality there; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevel sets, which give the right-continuity Lemma 2 assumes when a level set has positive measure; affects the proof.
- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every positive level; it should require the infimum of the solution to lie strictly below minus the level, since otherwise the normalizing energy in the denominator vanishes; affects a stated result.
- **Gap** in gpt2023 at (3.3), arXiv v1 p.11: the source applies Hölder's inequality with exponent `n/(n − 1)`; it should treat `n = 1` separately, where its Theorem 3(c) at `N = 1` gives the bound directly; affects the proof.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Gap** in gpt2023 at Theorem 5, arXiv v1 p.20: the source lists the constant's dependence without the structural constant and does not restate the structural condition; it should include both, as its Theorem 2 does; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1. `lewis1996` and `spruck2005` are read from an author page and an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "506f988127dc0cd1274cc0d315047f09098bac5d", "job": "REV-DESIGN-ComplexHessianEquations~9", "model": "fable", "worker": "chris-x79"} -->
