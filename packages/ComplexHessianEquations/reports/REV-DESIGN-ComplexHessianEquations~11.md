<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6899316761 -->
Review (claude) of 3e8b662

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.2 cites lewis1996 line 145–148 for the maximum principle, which those lines do not state

   **Location.** `packages/ComplexHessianEquations/design/README.md:137`: "Ky Fan's maximum principle, `κ_m(T) = max Re tr(PT)` over orthogonal projections `P` of rank `m`, is `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues` evaluated … with equality at `P = P_T` (lewis1996 line 145–148)". Plan target 1.2, `locator.where`: "line 145–148 and Theorem 2.1, line 150–158; …".

   **Claim.** The cited lines state the variational formula for the sum of the `m` largest eigenvalues, with its equality case.

   **Witness.** lewis1996 line 145–148 defines the sum of the `m` largest eigenvalues and records, after Fan (1949), that it is convex. No maximum over projections and no equality case appears there; the formula in the README is the pinned Tau Ceti declaration.

   **Exact repair.** In line 137 delete "(lewis1996 line 145–148)". In line 139 write "Prove: `κ_m` is convex (lewis1996 line 145–148, after Fan) and `κ_m(S + T) ≤ κ_m(S) + κ_m(T)`, as a maximum of linear functionals." In plan target 1.2 set `locator.where` to "line 145–148 (the sum of the m largest eigenvalues and its convexity) and Theorem 2.1, line 150–158; spruck2005 Lemma 1.5, line 11089–11091 for the lower trace bound". Tested on the witness: the locator then claims of line 145–148 only the definition and the convexity, which is what the lines contain.

One finding, P3 (a locator in §1.2); no P1 or P2. The finding carries a repair, so the verdict asks for changes: a fix round applies R01, and nothing else stands in the way of acceptance. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is precise, minimal and declared in both files; it is no finding. Both round-10 findings are repaired. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md`.

| Round-10 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01 (P3), §4.1 locator claims a comparison the source does not state | Line 417: "(this is the maximum-principle step behind the uniqueness that tosatti-weinkove2010 Corollary 1, line 38–47, states for the Monge–Ampère pair; the source does not state the comparison itself)". Read tosatti-weinkove2010 line 36–47: Corollary 1 gives a unique `b` and a unique `φ` with `sup φ = 0`; no inequality at a maximum. Plan 4.1 `locator.where` carries the same wording. | Repaired |
| F02 (P3), §§8.4 and 8.7 left the solution hypotheses to the layer preamble | Line 668: "let `φ_t ∈ C²`, for `t ∈ (0, 1]`, solve the degenerating equation of §3.4 for the Monge–Ampère pair (so `sup φ_t = 0` and `ω_{t,φ_t} > 0`) with constants `c_t > 0` and normalized smooth `F_t`". Line 711: "let `φ_t ∈ C²`, for `t ∈ (0, 1]`, solve the degenerating equation of §3.4 (so `sup φ_t = 0`) with constants `c_t > 0` and normalized smooth `F_t`". Line 709 (Hölder bound) assumes only the equation, `λ ∈ Γ`, `c_t > 0` and continuous `F_t`. Witness `n = k = 1`, `χ = 0`, `t = 1`, `F_1 = 0`, `φ_1 = −M`: `sup φ_1 = −M ≠ 0` for `M > 0`, so it is outside §8.4 and the Hessian estimate; in the Hölder bound both sides equal `M`. gpt2023 line 847–850 and 948–952 state the same hypotheses. Plan 8.4, 8.7 and 6.5 carry them. | Repaired (the Hölder bullet differently from the suggested text, correctly: its proof uses no normalization) |

Pattern search (a locator attached to a claim its lines do not make; a theorem whose hypotheses sit only in a preamble): every locator of the fifteen sampled sections was read against its claim, which produced R01 and no other instance. §§8.1, 8.3, 8.5, 8.6 state their solution hypotheses in the statement; Layer 6 statements are either invariant under `φ ↦ φ + M` or state `sup φ = 0`.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜` and for every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- No re-plan and no second copy: main (head `1a19c9f`) has no `ComplexHessianEquations` folder; `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, no second copy.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape, counted: 35 `*Needs:*` lines and 35 `**Checks.**` blocks for 35 subsections; 8 `### Examples` and 8 `### Dependencies`. A search for LaTeX delimiters, pull-request numbers, machine paths, round labels, "so far", "optional", "deferred", "for later", HTML anchors and `lemma` finds only "the lemma" and "De Giorgi's iteration lemma" as mathematics. The README attributes no Lean name to this roadmap.
- Plan: parses; 47 targets; every `target:` prerequisite is an earlier target; every definition has at least three tests; every target has a locator; one gap, slug identical in the README (line 99) and in `gaps`.
- Manifest: 19 entries, one per work of the References, no local path; not changed by this review. No text was missing, so no `needs-references.toml` was written.
- Declared gap `weak-harnack-supersolutions`: one statement with all hypotheses (`m ≥ 1`, `q` finite, `q ≥ 1`, `q > m/2`, `u ∈ H¹`, `u ≥ 0` a.e., essential infimum). Recomputed its two controls: `u_ε = (x² + ε²)^{1/2} − ε` has `u_ε'' = ε²(x² + ε²)^{−3/2}`, `‖u_ε‖_{L¹(−2,2)} → 4`, `‖f_ε‖_{L¹} → 2`, `‖f_ε‖_{L^{3/4}} = c·ε^{1/3}`. Minimal: the pin has only the homogeneous form (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`, energy form with zero forcing, conclusion almost everywhere), and PDE §5.4 on main (`TauCetiRoadmap/PDE/README.md:1965`) plans the homogeneous Harnack inequalities.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems, the passages the repair changed, the target of R01 and the sections round 10 did not re-read (§§1.3, 3.1, 3.2, 5.1, 6.2). All values were computed in this round.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.2 trace bounds (sampled) | `F = diag(2,1)`, `B = diag(0,3)`, `B' = diag(3,0)` | `γ = (2,1)`, `μ = (0,3)`: lower `2·0 + 1·3 = 3 = tr(FB)`, upper `2·3 + 1·0 = 6 = tr(FB')`; `tr(F(−B)) = −3 ≤ −3` | Holds |
| §1.2 derivative of `κ_m` (sampled) | route; `T = diag(3,1,1)`, `m = 1, 2` | `Re tr(PT) = Σλ_jc_j`, `c_j = ‖Pe_j‖² ∈ [0,1]`, `Σc_j = tr P = m`; `0 ≤ κ_m(T+H) − κ_m(T) − Re tr(P_TH) ≤ Re tr((P_{T+H} − P_T)H) = o(‖H‖)`; `κ_2(T + t·diag(0,1,−1)) = 3 + 1 + |t|` | Holds; locator: R01 |
| §1.3 Lewis's theorem | `σ_n` at `[[2,1],[1,2]]`; `max`; `μ_1² + μ_2²` | `det = 3`, `3·T⁻¹ = [[2,−1],[−1,2]]`, wrong model `diag(1,3)`; `λ_1(Id + t·diag(1,0)) = 1 + max(t,0)`; `2(P_+ − P_−) = 2T` | Holds |
| §1.4 (used by §§4.1, 4.2, 8.7) | open convex set as half-spaces; wedge cone; `log det(Id + T)` | separation of `x ∉ Γ` from open `Γ` is strict; `min_π⟨πy, μ⟩ = ⟨y↑, μ↓⟩`; `−0.4 ∈ (−1/2, −1/3)`, midpoint `−0.15 ∉`; `log(1/2·2) = 0`, midpoint `2 log(5/4) > 0` | Holds |
| §1.5 determinant, Euler, trace (sampled) | `σ_2^{1/2}` at `T = diag(1,4)`; `A = diag(1,4)` with `B = Id`, `A⁻¹`; `σ_2` | `λ = (4,1)`, `∂f = (1/4, 1)`, `∇F = diag(1, 1/4)` in the standard basis, `det = 1/4 = 2^{−2}`, `tr(∇F·T) = 1 + 1 = 2`; `5 ≥ 4`, `2 = 2`, equality iff `A^{1/2}BA^{1/2} = c·Id`; `∇F = diag(4,1)`, `tr = 8 = 2·4` | Holds |
| §2.1 generalized Newton–Maclaurin | `(1,2,3)`: `(3,2,2,1)`, `(2,0,2,1)` | `S = (2, 11/3, 6)`; `18/11 = 1.636 ≤ 11/6 = 1.833`; with `l > s`: `1.915 ≤ 1.833` false | Holds |
| §2.3 quotients, tangent inequality (sampled) | `σ_2/σ_1` at `(4,1)`, `(1,4)`; `σ_2^{1/2}` at `λ = (1,4)`, `μ = (4,1)`; `min(x,y)`; `l = 0` | `4/5`, midpoint `6.25/5 = 1.25`; `∂g(λ) = (1, 1/4)`, `Σμ_i∂_ig = 4.25 ≥ g(μ) = 2`; at `(1,2)`: `∇g = (1,0)`, `g(2,1) = 1 ≤ 2`; `∂_ig = (1/k)σ_k^{1/k−1}σ_{k−1;i}` gives `Σμ_iσ_{k−1;i}(λ) ≥ kσ_k(μ)^{1/k}σ_k(λ)^{(k−1)/k}`; `σ_k/σ_l = const·∏_{i=l+1}^{k} S_i/S_{i−1}`, each factor concave on `Γ_i ⊇ Γ_k` | Holds |
| §3.1 `i∂∂̄`, composition rule | `u = x_1²`; `u = x` on `ℂ` | `Im L_u(v,w) = (v_xw_y − v_yw_x)/2`, doubled: `dx∧dy(v,w)`; `i∂u∧∂̄u = (i/4)dz∧dz̄ = ω/2`, and `2·conj(v/2)(w/2) = h(v,w)/2` | Holds |
| §3.2 form identities | `k = 1`; mixed inequality; `λ[β] = (4,1)` | `n·α∧ω^{n−1} = σ_1ω^n`; `M_k(α,β,…,β) = (1/k)D_α(σ_k∘λ)(β) ≥ σ_k(α)^{1/k}σ_k(β)^{(k−1)/k}`; `S_1 = 5/2 ≥ S_2^{1/2} = 2` | Holds |
| §3.4 backgrounds, energy, entropy (sampled) | `χ = 0`; `χ = ω_X`; `F = a`; `0 < q ≤ p` | `V_t = t^nV`; `V_t = (1+t)^nV`, `c_t^n = (1+t)^n`, quotient `1/V`; `e^{na} ≤ e^{na}|a|^p` if `|a| ≥ 1`, `< e^n` otherwise; on `|F| < 1` the integrand is `≤ e^{nF}`, of mean `1` | Holds |
| §4.1 comparison (repaired locator) | `Γ + Γ_n ⊆ Γ`; disc example | `λ[χ_ψ] ≤ λ[χ_φ]` componentwise, segment in `Γ + Γ̄_n ⊆ Γ`; `1/2 ≤ 1` | Holds |
| §4.2 uniqueness (sampled, headline) | maximum and minimum of `ψ − φ`; convex `Γ`; two components | `c'e^F ≤ ce^F` and the reverse; a convex cone containing `Γ_n` has `Γ + Γ_n ⊆ Γ`; `F_f(h_ψ) − F_f(h_φ) = Re tr(a·(A_ψ − A_φ))` with `a = ∫_0^1∇F_f(h_s)ds > 0`; `ψ = (0, −1)` has `sup = 0`, same `c` | Holds |
| §5.1 Kähler Laplacian | `ℂⁿ`; `ω = e^ρω_0` on `ℂ²` | `2Δ_ω|z|² = 4n`; `Δ_g u = e^{−ρ}(Δ_0u + ⟨∇ρ,∇u⟩)` in real dimension 4, `2Δ_ωu = e^{−ρ}Δ_0u`, difference `−e^{−x_1}` for `ρ = u = x_1` | Holds |
| §5.4 `L¹` bounds (sampled) | mean value at a maximum point; divergence form; chaining | `0 ≤ avg_{B(x_0,r)}(ψ + A|z − x_0|²)`, so `avg(−ψ) ≤ Ar²`; `∂_i(√g g^{ij}∂_ju) = 2√gΔ_ωu ≤ 2A√g` for `u = −φ`; `ess inf_{B_r(x_1)}u ≤` mean of `u` on the overlap with the previous ball | Holds |
| §6.1 curvature identities (sampled) | `ℂP¹`; `ω_φ = sω`; torus `φ = (a/2π²)cos 2πx` at `x = 0`, `1/4`; doubling | `R_{1̄1} = 2g_{1̄1}`, `s = 2`, `B = 2`; `K = g^{pr̄}R_{r̄p} = s_ω`, identity `0 = −s_ω + s_ω`; `q = 1 − a cos 2πx`: `Δ_{ω_φ}tr h = q''/(2q) = 2π²a/(1−a) = (1/2)(log q)''` at `0`; at `1/4`: `0 = −2π²a² + 2π²a²` with `G = (2/q)(q'/2q)(q'/2)`; `S = (2/q)(q'/2q)² = q'²/(2q³)`, `S''(0) = q''²/q³`, `Δ_{ω_φ}S = q''²/(2q⁴) = 8π⁴a²/(1−a)⁴`, and `|∇'T|² = |∇̄'T|² = (2/q)²(q''/4q)² = 4π⁴a²/(1−a)⁴` each; `a = 1/2`: `32π⁴`, a quarter is `8π⁴` | Holds |
| §6.1 against pss2012 | signs and terms | `R_{k̄j}{}^l{}_m = −∂_k̄Γ^l_{jm}` (line 1060); `∇̄'T = Rm − Rm'` (line 997); trace identity (6.5) with `F_PSS = e^F`; (7.3) gives `Δ̄'T = Δ'T − Q(T)` with the README's `Q`; (7.4) first-order terms are `Θ` | Holds |
| §6.2 `C⁰` estimate | telescoping; torus `ℂ²/ℤ⁴` | `ω_φ^n − ω^n = i∂∂̄φ∧Σ_jω_φ^{n−1−j}∧ω^j`; `i∂∂̄φ = (φ''/2)dx_1∧dy_1 = −2π²ε cos 2πx_1·dx_1∧dy_1`; `ε = 1/4π²`: `(1, 1/2)` and `(3/2, 1)`; `∫q = 1` | Holds |
| §6.3 `C²` estimate (sampled) | maximum of `log tr h − Aφ` | `Δ_{ω_φ}φ = n − tr h⁻¹`; `−s_ω/tr h ≥ −sup s_ω⁺·tr h⁻¹`; `0 ≥ (A − C_1 − Λ)tr h⁻¹ − An − C_2` bounds `tr h⁻¹`; then `λ_i = e^F/∏_{j≠i}λ_j ≤ e^{sup F}C^{n−1}`; `4/17 ≤ 17/4` | Holds |
| §6.5 regularity (sampled; plan hypothesis added) | `n = 1` torus; flat torus `φ = M`; index `m` | `Δ_ωφ = e^F − 1`, solution `(a/2π²)(cos 2πx − 1)`, `osc = a/π²`; `‖φ‖ ≥ |M|` with `osc = 0`; `C^{k+2,α}` needs `∂F ∈ C^{k−1,α}`, and `k ≤ max(3, k+1)` | Holds |
| §6.6 Yau (sampled, headline) | linearization; path constants; `F = ε cos 2πx`; pair form | derivative `(u, β') ↦ Δ_{ω_φ}u − β'`; `|b_t| ≤ t·sup|F|`, `Δ_ω(tF + b_t) = tΔ_ωF`; `∫e^F = I_0(ε)`, `b = −ε²/4 + O(ε⁴)`; `e^b = ∫χ^n/∫e^{nF}ω_X^n = c^n` | Holds |
| §7.1 one-variable estimate (sampled) | Jensen; Harnack; Green bound; integral; point mass | `M·log(R/R')/2π ≤ m_R − v(0) ≤ A`; `−h ≤ ((R'+r)/(R'−r))·(−h(0))`, `−h(0) = −m_{R'} ≤ A`; `|R'² − tw̄| ≤ 2R'²`; `∫_{D(w,2R')}(2R'/|t−w|)^β = 2π(2R')²/(2−β)`, `β = αM/2π ≤ αA/log(R/R') ≤ 1`; `e^{αC_HA} ≤ (R/R')^{C_H}`; `α_1 = log(8/7)/log 4 = 0.0963`; recentred: `log(4/3)/log 4 = 0.2075` | Holds |
| §7.1 local estimate (sampled) | radii; polar formula at `g = 1`; slice Laplacian; two families | `1/4 + 7/4 = 2`, `5/4 < 11/8 < 3/2 < 7/4`, `(3/2)/(11/8) = 12/11`; right side `vol(S^{2n−1})(5/4)^{2n}/2n = vol(B(5/4))`; `Δ_tv_ξ = D²u(ξ,ξ) + D²u(Jξ,Jξ) = 4L_u = 2H`, `|t|² − 4` gives `4`; `(4+ε)/(|z|²+ε) ≤ 5/|z|²` for `ε ≤ 1`, limit finite iff `αc < n`; `Δ(−(ρ²+ε)^{−1/2}) = (ρ²+4ε)(ρ²+ε)^{−5/2}`, radial eigenvalue `F' + sF'' = (1/4)(2ε − s)(s+ε)^{−5/2}` | Holds |
| §7.2 global estimate (sampled, headline) | `u = ψ − sup ψ + A|z|² − 4A`; `ℂP¹` | `u ≤ 0` on `B(0,2)`, `e^{−α(ψ − sup ψ)} ≤ e^{−αu}`, `∫(−u) ≤ ∫(sup ψ − ψ) + 4A·vol`; `∫|z|^{−2α}` finite iff `α < 1` | Holds |
| §8.1 comparison lemma (sampled) | auxiliary masses; coefficient of `tr(G·ω_t)`; `A_s` | both sides of the auxiliary equation integrate to `V_t`; `1 − (εn/(n+1))Λ^{−1/(n+1)} = 0` at the constants of gpt2023 (2.6), and `tr(G·ω_t) ≥ 0` as `χ ≥ 0`; `a_0ω_X + i∂∂̄ψ ≥ ω_t + i∂∂̄ψ > 0`; `A_s ≤ E_t` since `−φ_t − s ≤ −φ_t` | Holds |
| §8.2 De Giorgi (sampled) | proof; indicator; `e^{−s}`; `δ_0 = 0` | `r·φ(s_j)/2 < B_0φ(s_j)^{1+δ_0}` gives `r < 2B_0φ(s_0)^{δ_0}2^{−jδ_0} < 2^{−jδ_0}`; `φ(s_j + 1) < φ(s_j)/2`; sum `< 1/(1 − 2^{−δ_0})`; `r/4 < 1/16`; `re^{−r} ≤ 1/e`, `e/2 = 1.359 > 1` | Holds |
| §8.3 degenerating estimate (headline) | `s_0 = (2B_0)^{1/δ_0}Ē` | `Φ(s_0) < Ē/s_0 = (2B_0)^{−1/δ_0}` on the open set `Ω_{s_0}^∘`; `δ_0 = (p−n)/(pn) > 0` iff `p > n` | Holds |
| §8.4 Monge–Ampère case (sampled, repaired) | Lemma 5; Jensen; `φ_1 = −M`; `χ = 3ω_X` | `c_t^nV = ∫ω_{t,φ_t}^n = V_t`; `αE_t ≤ log(V⁻¹∫e^{−αφ_t}ω_X^n) + n·V⁻¹∫F_te^{nF_t}ω_X^n ≤ … + n·Ent_1`; `E_1(−M) = M`, `sup = −M`; `4 − 2.5 > 0`, `2 − 2.5 < 0` | Holds |
| §8.6 fixed background (headline) | `χ = 0`, `t = 1` | `c_1 = 1`, `V_1 = V`; `Ent_n ≤ 1 + Ent_p`; §8.5(c) at `p' = n`, `N = 1` | Holds |
| §8.7 (repaired, headline) | Hölder bound at `φ_1 = −M`; conjugates; entropy bound; rescaled background; Lemma 8 step | `V⁻¹·V^{1/q}·M·V^{1/q'} = M = E_1`; `q' < n/(n−k)` iff `q > n/k`; `x^pe^{−δx} ≤ (p/eδ)^p` with `δ = n`, `n(q−1)`: `0.5413·(1 + 1.421) = 1.310 ≥ 0.398`, and `4.633 > 4.184`, `≤ 4.725`; `u = φ_t/a_0` has `λ[ω_X + i∂∂̄u] ∈ Γ_k`, `sup u = 0`; `∫(−u)i∂∂̄v_j∧T = ∫(−v_j)(ω_u − ω_X)∧T ≤ C_0∫ω_u∧T = C_0∫ω_X^n` | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators.

| Section | What I read |
| --- | --- |
| 1.2 | spruck2005 line 11089–11091 (Lemma 1.5, the lower bound); lewis1996 line 145–148 and 154–159 (Theorem 2.1; its hypothesis line is garbled by OCR, conclusion legible). Supported, except the placement of line 145–148 (R01). |
| 1.5 | gpt2023 line 241–250 (linearization, Euler), 255–260 (arithmetic–geometric step). Supported. |
| 2.3 | spruck2005 line 11295 (Theorem 2.11), 11303–11320 (Lemma 2.12), 11347–11348 (Proposition 2.15), 11364–11365 (Theorem 2.16, for `1 ≤ s < r`); gpt2023 line 751–756; dinew-kolodziej2014 line 165–172. Supported. |
| 3.4 | gpt2023 line 82–83, 101–119, 450–451 (for `p ≥ 1`, as the README says), 785–803. Supported. |
| 4.2 | tosatti-weinkove2010 line 36–47. Supported for the Monge–Ampère pair, as the README says. |
| 5.4 | guedj-zeriahi2005 line 138–141 and 255–274 (Proposition 1.7); gpt2023 line 689–692. Supported; the README states where its route is more general. |
| 6.1 | pss2012 line 163–164, 837–840, 994–1016, 1046–1064. Supported. |
| 6.3 | pss2012 line 981–990 (Theorem 8, for a `C⁴` solution; the layer assumes smooth), 994–1031. Supported. |
| 6.5 | twwy2015 line 132–136; tosatti-weinkove2010 line 93–99. Supported; gilbarg-trudinger2001 Lemma 17.16 is uncertified. |
| 6.6 | tosatti-weinkove2010 line 38–59; pss2012 line 170–179 (Theorem 1), 216–233 (§2.2, (2.6)). Supported; yau1978 and szekelyhidi2014 are uncertified. |
| 7.1 | pss2012 line 2942–2945; gpt2023 line 287–289; demailly2012 line 1534, 1717–1731 (Proposition 4.22, Harnack constant `(r + |x|)/(r − |x|)` at `m = 2`). Supported; hormander1990 is uncertified. |
| 7.2 | pss2012 line 2946–2955 (Theorem 31); gpt2023 line 280–289. Supported, both for a Kähler form, as the README says; tian1987 is uncertified. |
| 8.1 | gpt2023 line 197–302 (Lemma 1 and its proof). Supported. |
| 8.2 | gpt2023 line 412–426. Supported; the README makes the threshold explicit. |
| 8.4 | gpt2023 line 785–850 (Lemmas 5–6, Theorem 4). Supported. |

Also read: gpt2023 line 62–135, 303–441, 458–480, 744–776, 861–952; lewis1996 line 77–81, 165–217, 468–469; dinew-kolodziej2014 line 33–35, 54–66, 139–164, 259–263; twwy2015 line 72–77; demailly2012 line 15190–15191; spruck2005 line 11066–11100, 11257–11293.

### Pins, duplication and suppliers

- Pins: `lake-manifest.json` of the content repository gives Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- All 52 qualified library names in the README were searched at the pins and found; every cited file path exists. Opened this round: Tau Ceti `Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464` (`ContDiffOn ℝ 2` on the ball, continuous on the closed ball, `0 ≤ Δ f`); `Analysis/Complex/LeviForm.lean:142` and `150` (`ContDiffAt ℝ 2`, `IsLocalMax`); `Geometry/Manifold/Complex/LeviForm.lean:156`, `179`, `206` (the composition rule with the factor `1/4` on the extended differentials, which is the README's `conj(∂u(v))·∂u(w)`); `Analysis/MeanInequalities.lean:68` (weights `≥ 0` of sum `1`, `a, b ≥ 0`); `Analysis/InnerProductSpace/HoffmanWielandt/Basic.lean:78`; `Analysis/InnerProductSpace/KyFan.lean:489` (orthonormal family, the `card ι` largest eigenvalues); `Analysis/PDE/Regularity/Harnack.lean:284` (namespace `TauCeti.PDE`). The other declarations are as round 10 recorded them at the same pins.
- By object, on main and at the open heads (`roadmaps grep -i --readme-only`): "Hessian equation", "hyperbolic polynomial": no match. "Monge–Ampère": ShimuraVarieties §7.0g and K3Surfaces (both named in Scope), ArithmeticDynamics and ArakelovGeometryAndAbelianHeightsPartII (measures of metrized line bundles, a different object). "plurisubharmonic": AffineMorseLefschetz and RealAnalyticGeometry on main (strict plurisubharmonicity, exhaustions), ComplexComparisonPartII (named in Scope). "spectral function": OperatorTheory MatrixSpectralStatistics MSS-B09–B10 (continuity and measurability of the Hermitian functional calculus of one-variable `h`, not symmetric functions of the spectrum); no roadmap states Lewis's derivative or the concavity of §1.4. "Ky Fan": OperatorTheory Majorization, consumed at the pin; MathematicalStatisticsNonparametric (its own eigen-expansion form). "Maclaurin": NumberFieldEnumeration §1.1 (named in Scope) and unrelated series expansions. "exponential integrability": PDE (Trudinger–Moser), a different statement.
- Supplier sections on main (head `1a19c9f`, the head round 10 resolved against): PDE §3.2 (C13) line 1344 with the Aleksandrov–Bakelman–Pucci statement at 1403–1408, identical in hypotheses to the contract; §5.4 (E23) 1965; §5.6 (E25) 2097; PseudodifferentialOperators §5.4 1337, §6.2 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440 and 1651, K6.0 2321 (its conventions `dd^c = 2i∂∂̄` at 147 and `i∂∂̄|z|² = 2ω` at 2413 agree with the Conventions here); DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3893–3901 with `exists_pos_laplaceBeltrami_eigenvalue_isLeast` at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534` (compact, connected, smooth `g` of mean zero, as the contract says). `roadmaps resolve` on the README: no citation and no Lean name found nowhere.
- Ownership against open pull requests was checked through `roadmaps grep` at the heads of the index of 2026-11-15, by the object searches above. No declaration name is involved.

Overlap check: read ComplexKahlerGeometry, PDE, Yamabe, RiemannianGeometry (main), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge (open), the third list being empty; shared objects: the Poincaré inequality (owner RiemannianGeometry R5c), the Levi form and the eigenvalue variational inequalities (owner the pinned Tau Ceti), the weak Harnack inequality for supersolutions (owner PDE §5.4, by the declared gap); nothing else shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited. K3Surfaces, ShimuraVarieties and NumberFieldEnumeration appear only in Scope and Downstream consumers, as statements this roadmap does not import.

### Headline theorems and padding

Headlines from the Summary: Lewis's theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: nothing to probe, no signature and no `#check` comparison.

### Copyright and arrangement

- Wording: 30 passages set beside their sources at the locators above (gpt2023 Theorems 1–5, Lemmas 1, 2, 4–8; spruck2005 Theorem 1.4, Lemma 1.5, Proposition 2.7, Lemmas 2.10, 2.12, Theorems 2.11, 2.16; lewis1996 Theorems 1.1, 2.4, Lemmas 2.2, 2.3; pss2012 Theorems 1, 8, 9, 31 and §2.2; tosatti-weinkove2010 Corollary 1; guedj-zeriahi2005 Proposition 1.7; dinew-kolodziej2014 inequalities 1–3 and Proposition 1.7; demailly2012 Proposition 4.22). What is shared is formulas and lists of constants that the statements force. No sentence or proof plan follows a source clause by clause; the proofs of §§7.1, 8.3 and 8.4 are the design's own.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7, all inside one layer of eight and in the order §2, §4, §3, §5; Layers 1–7 have no counterpart in it. The `*Needs:*` lines force 8.1, 8.2 → 8.3; 8.3 → 8.4; 8.3, 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 30 passages compared with 10 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread.
- lewis1996 and spruck2005 are OCR texts: the hypothesis line of lewis1996 Theorem 2.1 (line 154) and several displayed formulas of spruck2005 §2 are garbled. The statements were recomputed, not read.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. Pinned declarations were read, not elaborated.
- The index-level signs of Calabi's identity in §6.1 were compared with pss2012 (7.2)–(7.4) term by term; the only computed instance (the torus at `x = 0`) has `T = 0`, so it tests the two squared terms and not the terms in `Θ` and `Q`.
- The open revisions of ComplexKahlerGeometry and PDE were not read in full; `scratch/overlaps.md` lists no id they drop, and both are cited as they are on main.

## Source issues

Only what was read in this round is listed.

- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every positive level; it should require the infimum of the solution to lie strictly below minus the level, since otherwise the normalizing energy vanishes; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevel sets, which give the right-continuity its Lemma 2 assumes; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.10: the source picks the starting level from Chebyshev's non-strict bound; it should note the bound is strict for continuous solutions, as its Lemma 2 needs a strict inequality; affects the proof.
- **Gap** in gpt2023 at the proof of Lemma 1, arXiv v1 p.6: the source solves the auxiliary equation by Yau's theorem with a right-hand side that is only twice differentiable; it should first approximate it by smooth positive functions; affects the proof.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows equal indices in a quotient with exponent one over their difference; it should require the lower index strictly smaller; affects a stated result.
- **Gap** in gpt2023 at Theorem 5, arXiv v1 p.20: the source lists the constant's dependence without the structural constant; it should include it, as its Theorem 2 does; affects a stated result.
- **Misprint** in spruck2005 at Proposition 2.7, printed page 290: the source states Newton's inequalities up to the top index and equality only for equal components at every point; it should stop one index earlier and restrict the equality clause to the positive cone; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1; `lewis1996` is read from an author page and `spruck2005` from an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e8b6622776c5472ba9b04c4b0c46040a0f48946", "job": "REV-DESIGN-ComplexHessianEquations~11", "model": "fable", "worker": "chris-x89"} -->
