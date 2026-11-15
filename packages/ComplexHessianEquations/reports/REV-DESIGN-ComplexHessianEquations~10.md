<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6898650256 -->
Review (claude) of 199ef23

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §4.1 cites lines that state uniqueness, not the comparison at a maximum

   **Location.** `packages/ComplexHessianEquations/design/README.md:417`: "§1.4 gives monotonicity of `f`, using the ellipticity `∂_j f > 0` of the admissible pair (tosatti-weinkove2010 line 38–47 for the Monge–Ampère case)". Plan target 4.1, `locator.where`: "line 38–47".

   **Claim.** The cited lines contain the pointwise comparison `f(λ[χ_ψ](x_0)) ≤ f(λ[χ_φ](x_0))` at a local maximum of `ψ − φ`, for the Monge–Ampère pair.

   **Witness.** tosatti-weinkove2010 line 38–47 is Corollary 1: existence of a unique `b` and a unique `φ`. No inequality at a maximum point is stated there; a search of the text for "unique" and "maximum" finds only lines 36, 38, 39 and 414.

   **Exact repair.** Replace the parenthesis by "(this is the maximum-principle step behind the uniqueness that tosatti-weinkove2010 Corollary 1, line 38–47, states for the Monge–Ampère pair; the source does not state the comparison itself)". In plan target 4.1 set `locator.where` to "Corollary 1, line 38–47 (states the uniqueness this step yields; the comparison is not stated in the source)". Tested on the witness: the new wording claims of line 38–47 only what Corollary 1 says.

2. **F02** (P3) §§8.4 and 8.7 leave the solution hypotheses to the layer preamble

   **Location.** `packages/ComplexHessianEquations/design/README.md:710`: "for a fixed `k` with `1 ≤ k ≤ n`, if `λ[ω_{t,φ_t}] ∈ Γ_k` for all `t` and `q > n/k`, then `‖φ_t‖_{L^∞} ≤ C(…)`"; line 708 (the Hölder bound); line 668 (§8.4). Plan targets 8.4 and 8.7, `hypotheses`.

   **Claim.** Each statement carries its exact hypotheses.

   **Witness.** Read alone the bullet at 710 is false: `n = k = 1`, `χ = 0`, `t = 1`, `φ_t = −M` has `λ = 1 ∈ Γ_1` and `sup|φ_t| = M` for every `M`. §§8.1 and 8.3 say "`φ_t ∈ C²` solves the degenerating equation with normalized smooth `F_t`"; gpt2023 line 948–950 states the same in Theorem 5.

   **Exact repair.** Begin §8.7's first and third bullets, and §8.4's statement, with "Let `φ_t ∈ C²` solve the degenerating equation of §3.4 (so `sup φ_t = 0`) with normalized smooth `F_t`, for `t ∈ (0, 1]`;" and add "φ_t ∈ C² solves the degenerating equation, sup φ_t = 0, F_t smooth normalized" to the `hypotheses` of plan targets 8.4 and 8.7. Tested on the witness: `φ_t = −M` has `sup φ_t = −M ≠ 0` for `M > 0`, so it is excluded, and `M = 0` gives the bound `0`.

Two findings, both P3 (a locator in §4.1 and implicit hypotheses in §§8.4 and 8.7), no P1 or P2; each has a written repair, so the verdict asks for changes and a fix round applies them. The round-9 finding is repaired. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is no finding: it is precise, minimal and declared under the same slug in `packages/ComplexHessianEquations/design/README.md` (line 99) and in the `gaps` list of `packages/ComplexHessianEquations/design/plan.json`. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and repairs

Quotation from `packages/ComplexHessianEquations/design/README.md`.

| Round-9 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01 (P3), §8.3 fourth Check: `F_t` smooth only for a pair with smooth `f` | Line 664: "for the Monge–Ampère pair take `φ_t = −ε·ρ` … (possible since `ω_t ≥ tω_X`). It solves the equation with `sup φ_t = 0`, `c_t^n = V_t/V` (§3.4) and `e^{nF_t} = c_t^{−n}·ω_{t,φ_t}^n/ω_X^n`, a smooth positive function". Recomputed: `χ ≥ 0` gives `ω_t − ε·i∂∂̄ρ ≥ (t − εC)ω_X > 0` for `ε < t/C`; `∫e^{nF_t}ω_X^n = c_t^{−n}V_t = V`; `sup(−ερ) = 0` since `ρ ≥ 0` vanishes somewhere; `Ω_ε = {ρ = 1} ⊇ U`, `Ω_s = ∅` for `s > ε`, `Ω_ε^∘ = {ρ > 1} = ∅`. Witness pair: `∂_1 f = 1 + δ(±(3/2)u^{1/2} − (1/2)u^{3/2})`, `u = |λ_1 − λ_2|/σ_1 < 1` on `Γ_2`, so `∂_j f > 1 − 2δ > 0`; `(d/da)²|a|^{3/2} = (3/4)|a|^{−1/2}` is unbounded at `0`. The plan test `degenerating_right_continuity` carries the same data. | Repaired |

The diff from the round-9 head changes one line of the README and one string of the plan, as the repair report says. Pattern search (Check data that does not meet a hypothesis of the statement tested): I re-evaluated the Checks of the fifteen sampled sections and of §§6.6, 8.3 and 8.4 against their statements (table below); no further instance.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜`, hyperbolic polynomials of every positive degree, every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- Not a re-plan and no second copy: main (head `1a19c9f`) has no `ComplexHessianEquations` folder and no folder whose name contains Hessian, Monge–Ampère or Calabi; `scratch/overlaps.md` lists no second copy, no other pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape, counted: 35 `*Needs:*` lines and 35 `**Checks.**` blocks for 35 subsections; 8 `### Examples` and 8 `### Dependencies` headings. A search of the README for LaTeX delimiters, pull-request numbers, machine paths, HTML anchors, round labels, "optional", "deferred", "removed" and `lemma` finds only "De Giorgi's iteration lemma" and "the lemma" as mathematics. The README advertises no Lean name of its own.
- Plan: parses; 47 targets in 8 layers; every `target:` prerequisite resolves to an earlier target (0 forward, 0 unresolved); every definition has at least three tests; one gap, whose slug matches the README.
- Manifest: 19 entries, one per work in the References (each key occurs in the README and once in `packages/ComplexHessianEquations/sources.toml`), no local path. Not changed by this review.
- Declared gap: `needs` is one statement with all its hypotheses. PDE §5.4 (E23) on main (`TauCetiRoadmap/PDE/README.md:1965`, read to line 2003) plans the weak Harnack and Harnack inequalities for nonnegative weak solutions of the homogeneous equation and an inhomogeneous Hölder estimate; the word "supersolution" occurs in that README only at lines 433, 1390, 1430, 2262 and 2291, none in §5.4. The pin has the homogeneous form (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`). The gap asks for nothing already provided.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems, the repaired passage and the targets of R01 and R02. All values were computed in this round.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Conventions: `h`, `H_α`, `i∂∂̄`, pss2012 dictionary | `h(Ju, v)`; `u = x_1²`; `φ_PSS`, `Δ_PSS` | `g(Ju,v) = ω(u,v)`, `ω(Ju,v) = −g(u,v)`, so `h(Ju,v) = −i·h(u,v)`; `u_{11̄} = 1/2`, `i·(1/2)dz∧dz̄ = dx∧dy`; `g_PSS = 2g`, so `Δ_PSS = Δ_ω/2`, `φ_PSS = 2φ`, `n + Δ_PSSφ_PSS = n + Δ_ωφ` | Holds |
| §1.1 relative eigenvalues (sampled) | Gram `diag(2,1)`, `a = diag(2,3)`; `P`-twisted inner product; `[[0,1],[−1,0]]`; `diag(3,0) ≤ diag(3,1)`; `T = [[0,ε],[ε,0]]` | `g⁻¹a = diag(1,3)`, `λ = (3,1)` against `(3,2)`; `⟨u,Av⟩ = ⟨u,P⁻¹Av⟩'`; eigenvalues `±i`; `(3,0) ≤ (3,1)`, cross pairing `3 > 1`; `λ(T) = (ε,−ε)`, `‖T‖ = ε` | Holds |
| §1.4 convexity and monotonicity (used by §§4.1–4.2) | half-space description; segment `λ(S) + td` | `min_π⟨πy, μ⟩ = ⟨y↑, μ↓⟩` (rearrangement), a minimum of linear functionals of `T`; `λ(S) + td = (λ(S) − εe) + (td + εe) ∈ Γ + Γ_n` | Holds |
| §2.1 generalized Newton–Maclaurin | chord slopes of the concave `j ↦ log S_j` | slope over `[l,k]` ≥ over `[l,r]` (uses `k ≤ r`) ≥ over `[s,r]` (uses `l ≤ s`) | Holds |
| §2.2 Gårding, symmetric cones (sampled) | `p = 2xy − 0.9(x² + y²)`; `p_c`; `σ_k` as a derivative; derivative of `p` along `b`; `−se` | `p(x+te) = 0.2t² + 0.2(x_1+x_2)t + p(x)`, discriminant `0.04(x_1+x_2)² − 0.8p(x) = 0.76(x_1−x_2)²`; sector roots of `0.9r² − 2r + 0.9`: `0.627`, `1.595`; `p(1,0.1) = −0.709`, roots `(−0.22 ± 0.7846)/0.4 = 1.41, −2.51`; `p(1,0.7) = 0.059`, roots `−0.196, −1.504`, `∂_xp = 1.4 − 1.8 = −0.4`; `p_c = (1−c)(x_1²+x_2²) + (2+2c)x_1x_2`, at `c = 19` divided by `20`: `−0.9`, `2`; at `c = 1/4`, `∂_1p_c > 2(x_1+x_2) − (x_1+x_2) > 0` on the cone; `(d/dt)^{n−k}σ_n(λ+te)|_0 = (n−k)!σ_k(λ)`; `(d/dt)p(x+tb)|_0 = p(b)Σ_i∏_{j≠i}μ_j > 0` for roots `−μ_j < 0`; `p((t−s)e) = (t−s)^mp(e)` vanishes at `t = s ≥ 0` | Holds |
| §2.4 admissible pairs, structural condition (sampled) | Lemma 4 choice `μ_j = (∏∂_if)^{1/n}/∂_jf`; `σ_1 − ε|λ|` at `(1, −1+δ)`; wedge cone; cones `λ_i > −ε(λ_1+λ_2)` | `∏μ_j = 1`, `nγ^{1/n} ≤ f(μ) ≤ Σμ_j∂_jf = n(∏∂_jf)^{1/n}`; value `δ − ε√(1+(1−δ)²) < 0`; `−0.4 ∈ (−1/2, −1/3)`, `−0.15/1.01 = −0.149 ∉`, wedge point has `μ_1+μ_2 > μ_1/2`; intersection `{λ_i ≥ 0, λ ≠ 0}` contains `(1,0)` without a neighbourhood | Holds |
| §2.5 structural constants | Hessian pair at `e`; `σ_2/σ_1` at `(M,1,1)` | `(1/k)binom(n,k)^{1/k−1}binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `∂_1 = (2(M+2) − (2M+1))/(M+2)² = 3/(M+2)²`, `∂_2 = ((M+1)(M+2) − (2M+1))/(M+2)² = (M²+M+1)/(M+2)²` | Holds |
| §3.3 constants | Hessian instance, `χ = ω`, `F = 0` | `α^k∧ω^{n−k} = binom(n,k)⁻¹σ_kω^n`, so `σ_k = c^ke^{kF}`; `c = binom(n,k)^{1/k}` | Holds |
| §3.4 backgrounds, energy, entropy (sampled) | `χ = 0`; `χ = ω_X`; mass bound; `Ent_q ≤ 1 + Ent_p` | `ω_t^n = Σ_j binom(n,j)χ^j∧(tω_X)^{n−j} ≥ t^nω_X^n`; `V_t = (1+t)^nV`, `c_t^n = (1+t)^n`, quotient `1/V`; `e^{nF} ≤ e^{nF}|F|^p` on `|F| ≥ 1`, `< e^n` on `|F| < 1`; on `|F| < 1` the integrand is `≤ e^{nF}`, of mean `1` | Holds |
| §4.1 comparison at a maximum | disc, `ψ = −|z|²/4`; two-valued `f` on the wedge cone | `λ[χ_ψ](0) = 1 − 1/2`; `f(1,−0.4) = 10·0.6 = 6 > f(1.01,0.1) = 1.11` | Holds; locator: R01 |
| §4.2 uniqueness (sampled, headline) | maximum and minimum of `ψ − φ`; linearization; two components | `c'e^F ≤ ce^F` and the reverse; `F_f(h_ψ) − F_f(h_φ) = Re tr(a·(h_ψ − h_φ))`, `a = ∫_0^1∇F_f(h_s)ds`, `h_s ∈ Sym_Γ` by convexity, `a > 0` from `∂_jf > 0`, no first-order term; `ψ = (0, −1)` has `sup = 0` and the same `c = f(e)` | Holds |
| §5.2 Hölder invertibility (sampled) | solving `Δu − β = v`; torus mode; circle sequence | `β = −mean_{ω'}(v)`, `u` fixed by `∫uω^n = 0` since constants have nonzero `ω^n`-integral; `Δ_ω cos 2πx = (1/2)(−4π²)cos 2πx`; quotient `j^{−α}/(π/2j)^α = (2/π)^α`, and `|sin jx − sin jy| ≤ 2^{1−α}(j|x−y|)^α` | Holds |
| §5.3 Poincaré and Sobolev (sampled) | circle; torus `u = cos 2πx`; exponent; pinned hypothesis | `∫sin² = π = ∫cos²`; `∫u² = 1/2`, `∫|du|² = 2π²`, `λ_1 = 4π²`, `1/2 = 2π²/4π²`; `2·2n/(2n−2) = 2n/(n−1)`; `2 < finrank ℝ E` is `2 < 2n`, false at `n = 1` | Holds |
| §5.4 `L¹` bounds | divergence form; `ψ_ε` at `∞` | `u = −φ`: `∂_i(√g g^{ij}∂_ju) = 2√gΔ_ωu ≤ 2A√g`; in `w = 1/z` the quotient is `(1+ε|w|²)/(1+|w|²)`, smooth, `= 1` only at `w = 0` | Holds |
| §6.3 `C²` estimate | terms of the logarithmic form | `−s_ω/tr h ≥ −sup s_ω⁺·tr h⁻¹`, `Δ_ωF/tr h ≥ −|inf Δ_ωF|·tr h⁻¹`, `K/tr h ≥ −Λ·tr h⁻¹`; `4/17 ≤ 17/4` | Holds |
| §6.4 `C³` estimate (sampled) | torus solution; dependence | `∂_{z_1}h_{11} = (1/2)∂_x(1 − 2π²ε cos 2πx_1) = 2π³ε sin 2πx_1`; pss2012's "lower bound for `F`" is `inf` of this roadmap's `F`, its density being `e^F` | Holds |
| §6.5 higher regularity (sampled) | `n = 1`; mean normalization; index `m` | `∫(e^F − 1)ω = 0`; solution `(a/2π²)(cos 2πx − 1)`, `osc = a/π²`; mean zero gives `sup φ ≥ 0 ≥ inf φ`, so `0 ≤ sup φ ≤ osc φ`; step `k` needs `∂F ∈ C^{k−1,α}`, and `k ≤ max(3, k+1)` | Holds |
| §6.6 Yau (headline) | pair form; `F = a` | `F' = nF + log(ω_X^n/χ^n)`, `e^b = ∫χ^n/∫e^{nF}ω_X^n = ∫χ^n/V = c^n`; `b_t = −ta`; smoothness of `F` is the layer's standing hypothesis | Holds |
| §7.2 global estimate (sampled, headline) | `u = ψ + A|z|² − sup ψ − 4A` on `B(0,2)`; `ℂP¹` family; moments | `u ≤ 0` since `|z|² < 4`; `e^{−α(ψ − sup ψ)} = e^{−αu}e^{α(A|z|² − 4A)} ≤ e^{−αu}`; `∫_0^1 r^{1−2α}dr` finite iff `α < 1`; `x^p ≤ C_{p,α}e^{αx}` | Holds |
| §8.1 comparison lemma (sampled) | dependence; `A_s`; `φ_t ≡ 0` | constants `C, β_0` of `n, ω_X, χ, γ` as gpt2023 line 198 and 296; `A_s > 0` iff `inf φ_t < −s`; `Ω_s = ∅` for `s > 0` | Holds |
| §8.2 De Giorgi (sampled) | proof; `s_0 = 0`; three Checks | for `s_j ≤ s < s_{j+1}`, `r = s − s_j ≤ 1`: `rφ(s_j)/2 < B_0φ(s_j)^{1+δ_0}`, `r < 2B_0φ(s_0)^{δ_0}2^{−jδ_0} < 2^{−jδ_0} ≤ 1`, and `r = 1` would give `1 < 1`; sum `< 1/(1 − 2^{−δ_0})`; at `s = 0` the hypothesis is the limit `ε ↓ 0` by right-continuity; indicator: `r/4 < 1/16`, threshold `2 ≥ 1/4`; `re^{−r} ≤ e^{−1}`, `e/2 = 1.359 > 1` | Holds |
| §8.3 degenerating estimate (headline; Check repaired) | `s_0 = (2B_0)^{1/δ_0}Ē`; `Ē = 0`; trivial levels | `Φ(s_0) ≤ Ē/s_0 = (2B_0)^{−1/δ_0}`, strict since `−φ_t > s_0` on the open set `Ω_{s_0}^∘`; `Ē = 0` forces `Φ(0) = 0`; if `inf φ_t ≥ −s` then `Φ(s) = Φ(s+r) = 0` and the hypothesis of §8.2 is `0 ≤ 0`; Check 4 as in the repair table | Holds |
| §8.4 Monge–Ampère case | Jensen step | `αE_t − n∫F dμ ≤ log(V⁻¹∫e^{−αφ}ω_X^n)`, `∫F dμ = V⁻¹∫F_te^{nF_t}ω_X^n ≤ Ent_1` | Holds; hypotheses: R02 |
| §8.5 energy, Trudinger (sampled) | determinant; Jensen; torus Check | `Ĝ = I`: `Σ∂_j∂_j̄ = Δ/4`, `det a = 4^{−2n}`; `c∫(−φ)^Ndμ ≤ log(C/V) + n∫F dμ`; `mean(q log q) ≈ a²/4 = 2.25·10⁻⁴`, a third is `7.5·10⁻⁵`; `Ent_3 ≈ (a³/27)(4/3π) = 4.24·10⁻⁷`; eigenvalue `1 + φ''/2 = 1 − 0.03 cos 2πx_1` | Holds |
| §8.6 fixed background (sampled, headline) | `χ = 0`, `t = 1` | `c_1 = 1`, `V_1 = V`, `c_1^n/V_1 = 1/V`; `Ent_n ≤ 1 + Ent_p` as `n < p`; at `n = 1`, `p' = n = 1` is in the range of §8.5(c) | Holds |
| §8.7 Hessian estimate (sampled, headline) | conjugates; entropy bound; two two-valued `F`; rescaling | `q > n/k ⇔ 1/q' > (n−k)/n`; `x^pe^{−δx} ≤ (p/eδ)^p` with `δ = n` on `F < 0`, `δ = n(q−1)` on `F ≥ 0`; `(1.6487 + 0.3513)/2 = 1`, `Ent_2 = (0.4122 + 0.3845)/2 = 0.398`, `1.421`, bound `1.310`; `0.9e^{−2} + 0.1·8.782 = 1`, `Ent_2 = 0.4872 + 4.1457 = 4.633 > 0.5413·7.7288 = 4.184`, full bound `4.725`; `u = φ_t/a_0` has `ω_X + i∂∂̄u = (a_0ω_X + i∂∂̄φ_t)/a_0`, in `Γ_k` since `Γ_k + Γ̄_n ⊆ Γ_k` | Holds; hypotheses: R02 |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators in the certified texts.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 2.2 | spruck2005 line 11182–11185 (Definition 2.1), 11186–11224 (Theorem 2.2, Proposition 2.3; proofs partly garbled by OCR, statements legible), 11225–11235 (Corollary 2.4); dinew-kolodziej2014 line 139–164. Supported; the README states where it corrects Corollary 2.4. |
| 2.4 | guo-phong2024 line 76–80, 83–90, 103–104; gpt2023 line 71–76, 84–86, 744–769; szekelyhidi2018 line 29–31, 183–185; spruck2005 line 11314. Supported. |
| 3.4 | gpt2023 line 82–83 ((1.3)), 101–119 ((1.6)–(1.9)), 450–451 ((3.2), for `p ≥ 1`), 785–803 (Lemma 5). Supported. |
| 4.2 | tosatti-weinkove2010 line 36–47 (Corollary 1). Supported for the Monge–Ampère pair, as the README says. |
| 5.2 | pss2012 line 216–233 (§2.2; openness by the implicit function theorem at 229–231). Supported; gilbarg-trudinger2001 Theorem 6.2 is uncertified, and PDE §5.6 on main (`TauCetiRoadmap/PDE/README.md:2097`) quotes the same theorem for the same estimate. |
| 5.3 | pss2012 line 278–288 (Sobolev, squared form), 299–303 (Poincaré for the `L²` bound). Supported. |
| 6.4 | pss2012 line 1067–1081 ((7.5)–(7.7), Theorem 9, with the dependence at 1071–1072); twwy2015 line 132–136. Supported. |
| 6.5 | twwy2015 line 134–136; tosatti-weinkove2010 line 93–99. Supported; gilbarg-trudinger2001 Lemma 17.16 is uncertified. |
| 7.2 | pss2012 line 2942–2955 (Theorem 31); gpt2023 line 280–289, with its references [12] and [19] at 1128 and 1143 (Hörmander, Tian). Supported; both for a Kähler form, as the README says. |
| 8.1 | gpt2023 line 197–215 and 275–302 (Lemma 1, (2.3), (2.8)–(2.11)). Supported. |
| 8.2 | gpt2023 line 412–426. Supported; the README makes the threshold explicit. |
| 8.5 | gpt2023 line 458–480 (Theorem 3), 687–692. Supported. |
| 8.6 | gpt2023 line 84–89 (Theorem 1), 62–70, 442–457. Supported. |
| 8.7 | gpt2023 line 861–871 (Lemmas 7, 8), 900–952 (proof, Theorem 5), 971–981. Supported; the README adds `γ` to the dependence. |

Also read: gpt2023 line 120–130 (Theorem 2), 375–441 (its proof), 845–852 (Theorem 4); guo-phong2024 line 91–107; pss2012 line 168–179 (Theorem 1), 304–306 (Theorem 3).

### Pins, duplication and suppliers

- Pins: the manifest of the content repository and the two checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- All 52 qualified library names in the README were searched at the pins and found; all cited file paths exist. Opened this round: Tau Ceti `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231` (`Tames`, `Invariant`, the structure `Compatible` under `TauCeti.SmoothTwoForm`); `Analysis/Complex/LeviForm.lean:119`, `142`, `150`, `270`; `Geometry/Manifold/Complex/LeviForm.lean:106`, `156`, `165`, `172`, `179`, `206`, `241`, `292`, `343`; `Analysis/Matrix/MinkowskiDeterminant.lean:159` (`LinearMap.concaveOn_det_rpow`, on `{A | A.IsPositive}`); `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`[CompactSpace M]`, `2 < finrank ℝ E`, `ContMDiff I 𝓘(ℝ) 1 u`, `riemannianVolume`; no connectedness, no orientation); `Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464` (`ContDiffOn ℝ 2` on the ball, continuous on the closed ball, `0 ≤ Δ f`); `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `HoffmanWielandt/Basic.lean:78`; `KyFan.lean:99`, `489`; `Analysis/MeanInequalities.lean:68`; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Analysis/Complex/Wirtinger/LeviForm.lean:79`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `Geometry/Manifold/Riemannian/Laplacian.lean:238`; `Analysis/PDE/Regularity/Harnack.lean:284`. Mathlib `Analysis/InnerProductSpace/Spectrum.lean:277`, `297`, `309`, `314`, `384`; `Analysis/Matrix/Spectrum.lean:143`, `193`, `240`; `RingTheory/MvPolynomial/Symmetric/Defs.lean:69`, `202`; `Analysis/Calculus/LocalExtr/Polynomial.lean:64`; `Analysis/MeanInequalities.lean:129`; `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:118`; `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`; `Analysis/Calculus/Implicit.lean:465` (in the section with `[FiniteDimensional 𝕜 F]`, line 454, as the README says).
- By object at the pins: a search of both pinned libraries for hyperbolic polynomials and for Newton's or Maclaurin's inequalities finds only unrelated files (Fuchsian triangle groups, hyperbolic space, matrix traces, Fitting ideals); neither library has them.
- Supplier sections resolved on main: PDE §3.2 (C13) line 1344 (strong maximum principle for variable coefficients at 1356–1360, Aleksandrov–Bakelman–Pucci with the contract's hypotheses at 1403–1408), §5.4 (E23) line 1965, §5.6 (E25) line 2097–2103; PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440, 1651 and 1948, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796, with `integral_mul_laplaceBeltrami` at 432; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3893–3901, headline at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534`; OperatorTheory PD-A51, PD-A53 (`PolarDecomposition/README.md:254`, `260`), PA-B32 (`PrincipalAngles/README.md:272`), MAJ-A27 (`Majorization/README.md:176`); AffineMorseLefschetz §1.1 at 315; OptimalTransport Layer 6 at 2421. Open heads, read through `roadmaps show`: K3Surfaces §2.1 (line 528, the equation at 532 with `∫φω² = 0`), ShimuraVarieties §7.0g (1993), ComplexComparisonPartII C5.4 (155–156), NumberFieldEnumeration §1.1 (172; Maclaurin's bound for nonnegative reals at 195). The worker's `roadmaps resolve` lists no citation found nowhere.
- By object, on main and at the open heads (`roadmaps grep -i --readme-only`): "hyperbolic polynomial", "Hessian equation", "Calabi conjecture", "Yau's theorem", "Calabi–Yau theorem", "quasi-plurisubharmonic": no match anywhere. "complex Monge": ShimuraVarieties only (§7.0g, named in Scope). "Newton's inequalit": main only, inside a proof plan, as round 9 recorded. "Gårding": the Gårding inequality and Gårding domains of operator theory and PDE, a different object. "De Giorgi's iteration": one hit, the open PDE revision (its README line 341), as a route to the elliptic Harnack inequality, not the one-variable lemma of §8.2. "exponential integrability": seven hits (Trudinger–Moser and John–Nirenberg in PDE, lines 823 and 1269 on main; moment generating functions in StandardDistributions; AdelicAlgebraicGroups; NoncompactQuantumSymmetry), none for quasi-plurisubharmonic functions.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15, by the object searches above; no declaration name is involved, as there is no Lean file.

Overlap check: read ComplexKahlerGeometry (main; `scratch/overlaps.md` lists no id its two open revisions drop), PDE (main, and its open revision through the object searches), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge, Yamabe, RiemannianGeometry; the third list is empty. Shared objects: the Poincaré inequality on a closed Riemannian manifold, owner RiemannianGeometry R5c, consumed here; the Levi form, owner the pinned Tau Ceti (AffineMorseLefschetz §1.1); the eigenvalue variational inequalities, owner OperatorTheory at the pin; the closed-manifold Sobolev inequality, owner the pin; the weak Harnack inequality for supersolutions, owner PDE §5.4 by the declared gap. Nothing else is shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited. K3Surfaces, ShimuraVarieties and NumberFieldEnumeration appear only in Scope and Downstream consumers, as statements this roadmap does not import.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: nothing to probe for padding, no signature to compare, no `#check` comparison.

### Copyright and arrangement

- Wording: 21 passages set beside their sources at the locators above (gpt2023 Theorems 1, 2, 3, 5, Lemmas 1, 2, 4, 7, 8 and line 280–289; guo-phong2024 conditions (1)–(4); szekelyhidi2018 line 17–31; tosatti-weinkove2010 Corollary 1 and line 93–99; pss2012 §2.2, Theorems 3, 9, 31; spruck2005 Definition 2.1, Theorem 2.2, Corollary 2.4; dinew-kolodziej2014 line 152–172). Shared text is formulas and parameter lists; the longest shared run is the dependence list of gpt2023 Theorem 2, which the statement forces. No sentence, list or proof plan follows a source clause by clause.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7. The design's order is the source's §2, §4, §3, §5, inside one layer of eight; Layers 1–7 have no counterpart in it. The `*Needs:*` lines carry the edges 8.1, 8.2 → 8.3; 8.3 → 8.4; 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 21 passages compared with 8 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread.
- Displayed formulas in the proofs of spruck2005 Theorem 2.2 and Proposition 2.3 are partly garbled by OCR; the statements are legible and were recomputed.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. The pinned declarations were read, not elaborated.
- Sections outside the seeded sample that no repair touched (§§1.2, 1.3, 1.5, 2.3, 3.1, 3.2, 5.1, 6.1, 6.2, 7.1) were not read against their sources again this round; round 9's table carries computed values for each of them, and their Checks that this round's sampled sections reuse were recomputed above.
- The open revisions of ComplexKahlerGeometry and PDE were not read in full; `scratch/overlaps.md` lists no id they drop, and both roadmaps are cited as they are on main.

## Source issues

Only what was read in this round is listed.

- **Error** in spruck2005 at Corollary 2.4, printed page 289: the source says every symmetric polynomial hyperbolic in `(1, …, 1)` has a cone containing the positive cone and positive partial derivatives; it should assume the coordinate vectors lie in the closed cone; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.10: the source picks the starting level by Chebyshev's non-strict bound; it should note the bound is strict for continuous solutions, as its Lemma 2 uses a strict inequality; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevel sets, which give the right-continuity its Lemma 2 assumes; affects the proof.
- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every positive level; it should require the infimum of the solution to lie strictly below minus the level, as otherwise the normalizing energy vanishes; affects a stated result.
- **Gap** in gpt2023 at (3.3), arXiv v1 p.11: the source applies Hölder's inequality with exponent `n/(n − 1)`; it should treat `n = 1` separately, where its Theorem 3(c) at `N = 1` gives the bound directly; affects the proof.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Gap** in gpt2023 at Theorem 5, arXiv v1 p.20: the source lists the constant's dependence without the structural constant and does not restate the structural condition; it should include both, as its Theorem 2 does; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1. `lewis1996` and `spruck2005` are read from an author page and an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "199ef23832d7c29bea0cbaccb0ca6005b519da77", "job": "REV-DESIGN-ComplexHessianEquations~10", "model": "fable", "worker": "chris-x82"} -->
