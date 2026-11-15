<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6900741835 -->
Review (claude) of f68605c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) workflow vocabulary in Scope and ownership

   **Location.** `packages/ComplexHessianEquations/design/README.md:15`: "No roadmap on the content repository and no board package owns any of these objects."

   **Claim.** The roadmap text is timeless and uses no process vocabulary.

   **Witness.** "board package" occurs in no README under `TauCetiRoadmap/` on main (0 files); it names a stage of the workflow, which a reader of the merged roadmap cannot resolve.

   **Exact repair.** Replace the sentence by: "No other roadmap owns any of these objects." The rest of the paragraph (the named owners of the Poincaré inequality, the eigenvalue inequalities, the Levi form, K3Surfaces §2.1, ComplexComparisonPartII C5.4 and OptimalTransport Layer 6) stays as it is.

2. **F02** (P3) §8.6: the locator follows a claim its lines do not make

   **Location.** `packages/ComplexHessianEquations/design/README.md:698`: "This holds also for `n = 1`, where no Hölder step is needed (gpt2023 line 442–457)." Plan target 8.6 has "proof line 442–457".

   **Claim.** gpt2023 line 442–457 supports the reduction at `n = 1` without a Hölder step.

   **Witness.** gpt2023 line 455 bounds the energy by Hölder's inequality with the exponent `n/(n−1)`, undefined at `n = 1`, and says nothing about `n = 1`. Lines 442–457 give only the reduction to `χ = 0`, `t = 1` and to its Theorem 3(c).

   **Exact repair.** Write: "… using `Ent_n(F) ≤ 1 + Ent_p(F)`. gpt2023 (line 442–457) makes the same reduction but bounds the energy through Hölder's inequality with the exponent `n/(n−1)`, which is undefined at `n = 1`; applying §8.5(c) at `N = 1` directly needs no Hölder step and covers every `n ≥ 1`." Tested on the instance: at `n = 1`, `p' = n = 1` and §8.5(c) allows every `N > 0`, so `N = 1` gives `∫ (−φ) e^F ω_X ≤ C` with no exponent `n/(n−1)`. The plan locator needs no change.

Two findings, both P3, each with a repair to apply, so the verdict asks for changes: one sentence of workflow vocabulary in the Scope section (R01) and one locator placed after a claim its lines do not make (R02). No P1 or P2. Both round-12 findings are repaired. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is precise, minimal and declared in both files, and is not a finding. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and their repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md`.

| Round-12 finding | Repaired passage and what I checked | Status |
| --- | --- | --- |
| F01 (P3), §6.2: the route did not bound the mean of `sup φ − φ + 1` | Line 531: "The iteration starts from a bound for `‖ψ‖_{L²}`, which takes three inputs. First, the `L¹` bound `∫ (sup φ − φ) ω^n ≤ C(X, ω)` of §5.4 (first statement, with `ω̂ = ω` …". The `*Needs:*` line has "§5.4 (first statement) for the starting `L¹` bound"; plan target 6.2 has `target:5.4.1`, which precedes it and needs only `target:3.1.2` and the pinned sub-mean-value inequality, not the gap. Recomputed below. | Repaired |
| F02 (P3), §5.2: the Schauder constant's dependence | Line 459: "there is `C` depending only on `X`, `ω`, `k`, `α`, `θ` and `M` such that … for every `u ∈ C^{k+2,α}(X)` and every operator `Lu = Re tr(a·H_{i∂∂̄u})`, where `a` is a `C^{k,α}` field of `h`-self-adjoint endomorphisms … with `a ≥ θ·Id` and `‖a‖_{C^{k,α}} ≤ M`". Plan target 5.2 carries the same statement and the test `schauder_constant_depends_on_theta`; §6.5 (line 560) says "`a = Id`, `θ = 1`". Recomputed below. | Repaired |

Pattern search. A route with an unbounded quantity: every other iteration or bootstrap of the design was followed to its starting bound (§6.5 from §§6.2–6.4, §6.6 closedness from `|b_t| ≤ t·sup|F|`, §8.3 from Chebyshev with the strict inequality, §8.5(c) from the signed moment, §8.7 from the Hölder and entropy bounds); none is open. A constant over a class of operators without its dependence: the PDE contracts state `C(m)`, `C(m, α, λ, Λ, M)` and `C(m, q, λ, Λ)`; §5.4 states `C(X, ω, A)`; §7.1 states `α(n, A)`, `C(n)`; no further instance.

## Verified sound

### Principles and shape

- General library: Layers 1–2 are over `RCLike 𝕜` and for every admissible pair; Layers 3–4 assume no Kähler condition; Yau's theorem is for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- No re-plan and no second copy: main (head `f4d95c3`) has no `ComplexHessianEquations` folder; `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines and no second copy.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape, counted: 35 numbered subsections, 35 `*Needs:*` lines, 35 `**Checks.**` blocks, 8 `### Examples`, 8 `### Dependencies`. A search for LaTeX delimiters, pull-request numbers, machine paths, round labels, "so far", "optional", "deferred", "for later", HTML anchors and job ids finds nothing; the three matches of "lemma" are prose (De Giorgi's iteration lemma). The README attributes no Lean name to this roadmap.
- Plan: parses; 47 targets in 8 layers (34 theorems, 12 definitions, 1 example); no `target:` prerequisite points forward; every definition has at least three tests; every target has a locator; one gap with `supplier`, `section` and `needs`, the slug identical in the README (line 99) and in `gaps`.
- Manifest: 19 entries, one per work of the References (11 certified, 8 uncertified and settled), no local path. It was not changed by this review; no text was missing, so no `needs-references.toml` was written.
- Declared gap `weak-harnack-supersolutions`. Precise: one statement with `m ≥ 1`, `r > 0`, `q` finite, `q ≥ 1`, `q > m/2`, `u ∈ H¹`, `u ≥ 0` a.e., the essential infimum and constants `λ, Λ`. I recomputed its `m = 1` control: `∫ f_ε^{3/4} = ε^{3/2}∫(x² + ε²)^{−9/8} ≈ c·ε^{1/4}`, so `‖f_ε‖_{L^{3/4}} ≈ c'·ε^{1/3} → 0`, while `‖u_ε‖_{L¹(−2,2)} → 4` and `∫ f_ε → 2`. Minimal: at the pin the weak Harnack statements carry no forcing term (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`, hypothesis `0 ≤ energyFormH1 a 0 0 u v`; `Regularity/Supersolution/Basic.lean` and `Lp.lean` likewise), and PDE §5.4 on main (`TauCetiRoadmap/PDE/README.md:1997`) states the inequality for the homogeneous equation. It is no finding.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems, the two repaired passages, the targets of R01–R02 and the sections the round-12 table did not carry. All values were computed in this round.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §6.2 route (repaired) | identity at exponent `0`; Stokes sign; mean of `ψ`; torus `ℂ²/ℤ⁴`, `φ = ε cos 2πx_1` | `∫ψ·i∂∂̄φ∧Σ = −∫i∂ψ∧∂̄φ∧Σ = +∫i∂ψ∧∂̄ψ∧Σ ≥ (1/n)∫|∂ψ|²_ω ω^n`; `ψ̄ = 1 + ∫(sup φ − φ)ω^n/∫ω^n ≤ 1 + C/∫ω^n`; torus: `∫(ε − ε cos)·2 dvol = 2ε`, `∫ω² = 2`, `ψ̄ = 1 + ε`; `|dψ|²_g = 2|∂ψ|²_ω` (`u = x`: `1` and `1/2`) | Holds |
| §6.2 torus Check | `ε = 1/(4π²)` | `i∂∂̄φ = (1/2)φ_{xx} dx∧dy = −2π²ε cos`; `q = 1/2` at `0`, `3/2` at `1/2`: `(1, 1/2)`, `(3/2, 1)`; `osc = 2ε` | Holds |
| §5.2 Schauder (sampled, repaired) | `L = εΔ_ω`, `u_j = j^{−2−α}cos 2πjx` | quotient of `∂_x²u_j` between `0` and `1/(2j)`: `4π²j^{−α}·2·(2j)^α = 8π²·2^α`; `max_d min(2, 2πjd)/d^α = 2(πj)^α` at `d = 1/(πj)`; `‖Lu_j‖ ≤ 2π²ε(j^{−α} + 2π^α)`; limit `4·2^α/((1 + 2π^α)ε)` | Holds; `θ = ε` is an argument of `C` |
| §5.2 isomorphisms | pair map; `a = Id` | `β = −mean_{ω'}(v)`, then `u = u_0 + const` with `∫uω^n = 0`; kernel: `β = 0`, `u` constant of mean `0`; `tr(H) = Σλ_j = Δ_ω u` | Holds |
| §1.3 Lewis (sampled, headline) | `σ_2` at `[[2,1],[1,2]]`; `μ_1² + μ_2²` at `[[0,1],[1,0]]`; `max` at `(1,1)` | `3·T⁻¹ = [[2,−1],[−1,2]]` against `diag(1,3)`; `2(P_+ − P_−) = 2T`; `λ_1(Id + t·diag(1,0)) = 1 + max(t,0)` | Holds |
| §1.4 (headline) | wedge cone; `log det(Id + T)`; rearrangement | `−0.5 < −0.4 < −1/3`, midpoint `−0.15` outside; `log(1/2) + log 2 = 0`, midpoint `2log(5/4) > 0`; `min_σ⟨σy, μ⟩ = ⟨y↑, μ↓⟩` | Holds |
| §1.5 | `σ_2^{1/2}` at `diag(1,4)`; `σ_2` | `∂f(4,1) = (1/4, 1)`, `∇F = diag(1, 1/4)`, `det = 1/4 = 2^{−2}`, `tr(∇F·T) = 2 = F`; `tr(diag(4,1)·T) = 8 = 2·4` | Holds |
| §2.1 | `(1,2,3)`; shift at `e`, `t = 1`; slopes | `18/11 ≤ 11/6`; `3 + 6 + 3 = 12 = σ_2(2e)`; slope `[l,k] ≥ [l,r] ≥ [s,r]` for a concave sequence | Holds |
| §2.2 Gårding (headline) | `p = 2xy − 0.9(x² + y²)`; `p_19` | `p(e) = 0.2`; discriminant `0.04s² − 0.8p = 0.76(x_1 − x_2)²`; `p(1, 0.1) = −0.709`; `p(1, 0.7) = 0.059`, `∂_xp = −0.4`; `p_19 = 20p` | Holds |
| §2.3 | `σ_2/σ_1`; tangent at `λ = (1,4)`, `μ = (4,1)` | `0.8`, midpoint `1.25`; `∂g(1,4) = (1, 1/4)`, `4·1 + 1/4 = 4.25 ≥ 2` | Holds |
| §2.4 (sampled) | Lemma 4 with `μ_i = (∏∂_jf)^{1/n}/∂_if`; `σ_1 − ε|λ|`; combination | `nγ^{1/n} ≤ f(μ) ≤ n(∏∂_jf)^{1/n}`; value `δ − ε√(1 + (1−δ)²) < 0`; `∏(a∂_jf_1 + b∂_jf_2)^{1/n} ≥ aγ_1^{1/n} + bγ_2^{1/n}` | Holds |
| §2.5 (sampled, headline) | Hessian at `e`; `σ_2/σ_1` at `(M,1,1)` | `(1/k)binom(n,k)^{1/k−1}binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `∂_1 = (2(M+2) − (2M+1))/(M+2)² = 3/(M+2)²`, `∂_2 = (M² + M + 1)/(M+2)²`; quotient-plus-`cσ_p` product `≥ c^nγ_p` | Holds |
| §3.3 (sampled) | Hessian constant; `χ = ω`, `F = 0`; `ℂP¹`, `χ = 2ω` | `χ_φ^k∧ω^{n−k} = binom(n,k)⁻¹c^ke^{kF}ω^n`, so `c^k = binom(n,k)∫χ^k∧ω^{n−k}/∫e^{kF}ω^n`; `c = binom(n,k)^{1/k} = σ_k(e)^{1/k}`; `c·∫e^Fω = ∫χ = 2` | Holds |
| §3.4 | `χ = ω_X`; mass bound | `V_t = (1+t)^nV`, `c_t^n = (1+t)^n`; `e^{nF} ≤ e^{nF}|F|^p` on `|F| ≥ 1`, `< e^n` on `|F| < 1` | Holds |
| §4.1 | `ψ = −|z|²/4` on `ℂ`; wedge pair | `λ[χ_ψ](0) = 1 − 1/2 = 1/2 ≤ 1`; `f(1, −0.4) = 10·0.6 = 6 > f(1.01, 0.1) = 1.11` | Holds |
| §4.2 (sampled, headline) | maximum and minimum of `ψ − φ`; linearization; two components | `c'e^F ≤ ce^F` and the reverse; `F_f(h_1) − F_f(h_0) = Re tr(a·(A_ψ − A_φ))` with `a = ∫_0^1∇F_f(h_s)ds > 0`, `h_s ∈ Sym_Γ` by convexity; `ψ = (0, −1)` has `sup = 0` and the same `c` | Holds |
| §5.1 (sampled) | integration by parts; torus; conformal `ω = e^ρω_0`, `n = 2` | `∫v·i∂∂̄u∧ω^{n−1} = −∫i∂v∧∂̄u∧ω^{n−1}`, real, so equal to its conjugate with `u, v` exchanged; `Δ_ω cos 2πx = −2π²cos`; `Δ_g = e^{−ρ}(Δ_0 + ⟨∇ρ, ∇·⟩)` in real dimension `4`, difference `−e^{−ρ}⟨∇ρ, ∇u⟩ = −e^{−x_1}` | Holds |
| §5.3 | torus `u = cos 2πx` | `∫u² = 1/2`, `∫|du|² = 2π²`, `λ_1 = 4π²`: `1/2 = 2π²/4π²` | Holds |
| §5.4 | second statement in divergence form | `∂_i(√g g^{ij}∂_ju) = √g·Δ_gu = 2√g·Δ_ωu ≤ 2A√g` for `u = −φ` | Holds |
| §6.1 (sampled) | `ℂP¹`; torus `q = 1 − a cos 2πx` at `0` and `1/4` | `R_{1̄1} = 2g_{1̄1}`; `S = (2/q)(q'/2q)² = q'²/(2q³)`; at `0`: `q''/(2q) = 2π²a/(1−a) = (1/2)(log q)''`; at `1/4`: `−2π²a² + 2π²a² = 0`; `Δ_{ω_φ}S(0) = q''²/(2q⁴) = 8π⁴a²/(1−a)⁴ = 2·(4/q²)(q''/4q)²`; `a = 1/2`: `32π⁴`, doubled metrics `8π⁴` | Holds |
| §6.3 (sampled) | maximum of `log tr h − Aφ`; `λ = (4, 1/4)` | `(−s_ω + Δ_ωF)/tr h ≥ −C_1·tr h⁻¹`, so `0 ≥ (A − C_1 − Λ)tr h⁻¹ − An − C_2`; `λ_i ≤ e^{sup F}c^{−(n−1)}`; `4/17 ≤ 17/4` | Holds |
| §6.4 (sampled) | torus | `∂_{z_1}h_{11} = q'/2 = 2π³ε sin 2πx_1`; `Δ_{ω_φ}(S + A·tr h) ≥ (AC_3 − C_1)S − C` | Holds |
| §6.5 | `n = 1` torus; orders | `Δ_ωφ = −a cos 2πx`, `φ = (a/2π²)(cos 2πx − 1)`, `osc = a/π²`; `φ ∈ C^{k+2,α}` needs `F ∈ C^{k,α}`, less than the stated `m = max(3, k+1)` | Holds |
| §6.6 Yau (headline) | pair form; path constants; Bessel | `G = nF + log(ω_X^n/χ^n)` gives `e^b = ∫χ^n/∫e^{nF}ω_X^n = ∫χ^n/V`; `|b_t| ≤ t·sup|F|`; `−log I_0(ε) = −ε²/4 + O(ε⁴)` | Holds |
| §7.1 | one-variable constants; polar formula; point mass; `ℝ⁴` control | `M ≤ 2πA/log(R/R')`; `−G_{R'} ≤ (1/2π)log(2R'/|t−w|)`; `∫_{D(w,2R')}(2R'/|t−w|)^s = 2π(2R')²/(2−s)`; `αM/2π ≤ 1` at `α_1`; `2π∫_B g` from the `θ`-integral; `α_1 = log(8/7)/log 4 ≈ 0.096`; `Δ = (s + 4ε)(s + ε)^{−5/2}`, radial Levi eigenvalue `(1/4)(2ε − s)(s + ε)^{−5/2}` | Holds |
| §7.2 (headline) | `u = ψ − sup ψ + A|z|² − 4A`; `ℂP¹` | `u ≤ 0` on `B(0,2)`; `∫(|z|² + ε)^{−α}` bounded in `ε` iff `α < 1` | Holds |
| §8.2 (sampled) | proof with `s_0 = 0`; `(1/4)·1_{[0,1/4)}`; `e^{−s}`, `δ_0 = 0` | `r·φ(s_j)/2 < B_0φ(s_j)^{1+δ_0}` gives `r < 2^{−jδ_0}`, sum `1/(1 − 2^{−δ_0})`; `r/4 < 1/16`; `re^{−r} ≤ 1/e`, `e/2 ≈ 1.359 > 1` | Holds |
| §8.3 (sampled, headline) | strictness at `s_0`; `Ē = 0`; the `C¹` pair of the Check | `s_0Φ(s_0) < Ē` on the open set `Ω_{s_0}^∘`; `Ē = 0` forces `Φ(0) = 0`; `∂_jf ≥ 1 − δ(3/2 + 1/2) = 1 − 2δ`, `f(1+a, 1) = 2 + a + δ|a|^{3/2}(2+a)^{−1/2}` not `C²` at `0` | Holds |
| §8.4 (sampled) | Jensen; `χ = 3ω_X` | `(1/V_t)∫(−αφ)ω_φ^n ≤ log(c_t^n/V_t) + n(c_t^n/V_t)∫Fe^{nF}ω_X^n + log C ≤ −log V + n·Ent_1 + log C`; `a_0 = 4`, `4 − 2.5 > 0 > 2 − 2.5`; `E_1(−M) = M` | Holds |
| §8.5 | Jensen step; determinant; torus `n = 3` | `c∫(−φ)^Ndμ ≤ log(C/V) + n∫F dμ`; `det a = 4^{−2n}(det Ĝ)²` (`n = 1`: `(Ĝ/4)²`); `(1/3)·0.03²/4 = 7.5·10⁻⁵`, `(1/27)·0.03³·4/(3π) = 4.24·10⁻⁷` | Holds |
| §8.6 (sampled, headline) | `χ = 0`, `t = 1`; `n = 1` | `c_1 = 1`, `V_1 = V`; `Ent_n ≤ 1 + Ent_p`; §8.5(c) at `p' = n = 1` allows `N = 1` | Statement holds; locator: R02 |
| §8.7 (sampled, headline) | entropy bound; both two-valued `F`; scaling of the `L^{p'}` bound | `x^pe^{−δx} ≤ (p/eδ)^p`; `Ent_2 = (0.4122 + 0.3845)/2 = 0.398 ≤ 0.5413·2.421 = 1.310`; `0.4872 + 4.1456 = 4.633 > 0.5413·7.7288 = 4.184`, full bound `4.725`; `λ[ω_X + i∂∂̄(u/a_0)] = λ[a_0ω_X + i∂∂̄u]/a_0 ∈ Γ_k`; `1/q + (n−k)/n = 1` gives `q = n/k` | Holds |
| Scope sentence, line 15 | search of main | "board package" in 0 READMEs under `TauCetiRoadmap/` | R01 |

A remark that needs no change: the §5.2 Check computes its Hölder quotients in the flat coordinate, and the finite-atlas norm differs from that by a fixed equivalence constant, which does not affect the conclusion `C ≳ 1/ε`.

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators in this round.

| Section | What I read |
| --- | --- |
| 1.3 | lewis1996 line 77–81 (Theorem 1.1), 144, 165–166 (Lemma 2.2), 185–187 (Lemma 2.3), 199–217 (Theorem 2.4), 468–469; spruck2005 line 11072–11073. Supported. |
| 2.4 | guo-phong2024 line 76–80, 83–84, 85–90, 103–104; gpt2023 line 71–76, 84–86, 744–769; szekelyhidi2018 line 29–31, 183–185; spruck2005 line 11314. Supported. |
| 2.5 | gpt2023 line 90–93, 770–776; guo-phong2024 line 91–104. Supported; the README's `l < k` and the cone `Γ_{max(k,p)}` correct the source. |
| 3.3 | gpt2023 line 66–70, 107–111, 974–981; guo-phong2024 line 108–113; tosatti-weinkove2010 line 21–31; dinew-kolodziej2014 line 56–64. Supported, with the normalization of the Conventions. |
| 4.2 | tosatti-weinkove2010 line 36–47 (Corollary 1, the Monge–Ampère pair). Supported as the README describes it. |
| 5.1 | demailly2012 line 15190–15191 (Corollary VI.6.5, p. 306); twwy2015 line 75–77; pss2012 line 871–875. Supported. |
| 5.2 | pss2012 line 216–233 (the source asserts openness by the implicit function theorem without proof, as the README says). gilbarg-trudinger2001 is uncertified. |
| 6.1 | pss2012 line 163–164, 837–840, 994–1016, 1046–1064. Supported. |
| 6.3 | pss2012 line 981–990, 994–1031. Supported (the source assumes a `C⁴` solution; the layer assumes smooth). |
| 6.4 | pss2012 line 1067–1081; twwy2015 line 132–136. Supported. |
| 8.2 | gpt2023 line 412–426 (Lemma 2). Supported; the README's explicit threshold is the one in the source's proof. |
| 8.3 | gpt2023 line 120–130, 376–441. Supported; the strict sublevel sets and the strict Chebyshev step repair the source (Source issues). |
| 8.4 | gpt2023 line 785–850 (Lemmas 5–6, Theorem 4). Supported; the README's `a_0ω_X` replaces the source's "without loss of generality `χ ≤ ω_X`". |
| 8.6 | gpt2023 line 62–70, 84–89, 442–457. Statement supported; locator placement: R02. |
| 8.7 | gpt2023 line 861–952 (Lemmas 7–8, Theorem 5). Supported; the README adds `γ` to the constants and the background step. |

Also read, for the sections outside the sample: gpt2023 line 198–302 (Lemma 1), 458–476 (Theorem 3), 689–692; spruck2005 line 11064–11100, 11295–11320, 11347–11365; guedj-zeriahi2005 line 138–141, 255–274; demailly2012 line 1534, 1717–1731; pss2012 line 245–308, 2942–2955; tosatti-weinkove2010 line 52–59, 93–106. Each supports the statement it is cited for.

### Pins, duplication and suppliers

- Pins: the checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- All 61 library names of the README were searched at the pins and found, and all 24 cited file paths exist. Opened this round: Tau Ceti `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`2 < finrank ℝ E`, compact, `ContMDiff … 1 u`); `Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464`; `Analysis/Complex/LeviForm.lean:142`, `150`; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231`; `Analysis/InnerProductSpace/KyFan.lean:489`; `Analysis/InnerProductSpace/HoffmanWielandt/Basic.lean:78`; `Analysis/MeanInequalities.lean:68`; `Analysis/PDE/Regularity/Harnack.lean:284`. Each says what the README says of it.
- By object at the pins: `Analysis/PDE/MaximumPrinciple/NonDivergence.lean` has the weak maximum principle for non-divergence operators only, so the strong one remains PDE §3.2's; no Aleksandrov–Bakelman–Pucci or Schauder estimate (`holderOnWith_iteratedFDeriv_two_of_schauder` is absent); no weak Harnack inequality with forcing. `Analysis/Convex/MongeAmpere/` is the real Monge–Ampère measure of convex functions, a different object.
- By object on main and at the open heads (`roadmaps grep -i --readme-only`): "Hessian equation", "hyperbolic polynomial", "quasi-plurisubharmonic", "Calabi conjecture / Yau's theorem", "Aubin–Yau": no match. "Newton's inequalities" matches only a log-concavity remark in ClassicalArithmeticCompletion. "complex Monge" matches only ShimuraVarieties §7.0g, which the Scope names. "exponential integrability" matches the Trudinger–Moser and John–Nirenberg statements of PDE, not quasi-plurisubharmonic functions.
- Supplier sections on main (head `f4d95c3`): PDE §3.2 (C13) at line 1344, with the strong maximum principle for variable coefficients (line 1356–1361) and the Aleksandrov–Bakelman–Pucci statement (line 1403–1408) as the contract states them; §5.4 (E23) 1965; §5.6 (E25) 2097, with the constant `C(n, α, λ, Λ, M)`; PseudodifferentialOperators §5.4 1337, §6.2 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440 and 1651, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3893–3901, with `exists_pos_laplaceBeltrami_eigenvalue_isLeast` at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534`; OperatorTheory PD-A51, PD-A53, PA-B32, MAJ-A27; AffineMorseLefschetz §1.1 at 315; OptimalTransport Layer 6 at 2421. At open heads: K3Surfaces §2.1 (the equation `(ω+i∂∂̄φ)² = cV` with `∫φω² = 0`), ShimuraVarieties §7.0g, NumberFieldEnumeration §1.1 (Maclaurin's bound for nonnegative reals), ComplexComparisonPartII C5.4 (positive currents). `scratch/citations.md`: no citation and no Lean name found nowhere.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15, by the object searches above. No declaration name is involved.

Overlap check: read ComplexKahlerGeometry, PDE, Yamabe, RiemannianGeometry (main), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge (open), the third list being empty; shared objects: the Poincaré inequality (owner RiemannianGeometry R5c), the Ky Fan and eigenvalue variational inequalities and the Levi form (owner the pinned Tau Ceti, from OperatorTheory and AffineMorseLefschetz), the strong maximum principle, the Aleksandrov–Bakelman–Pucci and interior Schauder estimates (owner PDE §§3.2, 5.6), the weak Harnack inequality for supersolutions (owner PDE §5.4, by the declared gap); Yamabe §1.3 states local estimates for its conformal Laplacian, a different operator; nothing else shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited. K3Surfaces, ShimuraVarieties and NumberFieldEnumeration appear only in Scope and Downstream consumers, as statements this roadmap does not import.

### Headline theorems and padding

Headlines from the Summary: Lewis's theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: nothing to probe, no signature and no `#check` comparison.

### Copyright and arrangement

- Wording: 28 passages set beside their sources at the locators above (gpt2023 Theorems 1–5 and Lemmas 1, 2, 4–8; pss2012 Theorems 1, 3, 8, 9, 31 and §2.2; lewis1996 Theorem 1.1 and Lemmas 2.2–2.3; spruck2005 Theorems 1.4, 2.11, 2.16 and Lemma 2.12; guo-phong2024 conditions (1)–(4); tosatti-weinkove2010 Corollary 1; dinew-kolodziej2014 properties 1–3 and Proposition 1.7; demailly2012 Corollary VI.6.5 and Proposition 4.22; guedj-zeriahi2005 Proposition 1.7; twwy2015 line 75–77). What is shared is formulas and hypothesis lists that the statements force. No sentence or proof plan follows a source clause by clause.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7, all inside one layer of eight and in the order §2, §4, §3, §5; Layers 1–7 have no counterpart in it. The `*Needs:*` lines force 8.1, 8.2 → 8.3; 8.3 → 8.4; 8.3, 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 28 passages compared with 10 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread.
- lewis1996 and spruck2005 are OCR texts: the hypothesis line of lewis1996 Theorem 2.1 (line 154), the first line of Theorem 2.4 (line 200) and several displays of spruck2005 §§1–2 (line 11076–11078, 11307–11312, 11350–11362) are garbled. Those statements were recomputed, not read.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. Pinned declarations were read, not elaborated.
- The index-level signs of the terms `Θ` and `Q` of Calabi's identity (§6.1) were compared with pss2012 (7.3)–(7.4) by reading; the computed torus instance has `T(0) = 0` and tests only the two squared terms.
- The open pull request that revises PDE: `scratch/overlaps.md` reports no dropped id, and PDE is cited as it is on main. I did not read that branch.

## Source issues

Only what was read in this round is listed.

- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p. 9: the source says the closed-sublevel mass function is continuous; it should be the strict-sublevel function, which is right-continuous as its Lemma 2 requires; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p. 10: the source picks the starting level from Chebyshev's non-strict bound; it should note that the bound is strict for a continuous solution, since its Lemma 2 needs a strict inequality; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 1, (3.3), arXiv v1 p. 11: the source bounds the energy by Hölder's inequality with an exponent undefined in dimension one; it should apply its Theorem 3(c) with first power directly there; affects the proof.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p. 17: the source allows equal indices in the quotient and names the cone of the larger index only; it should require the lower index strictly smaller and use the smaller of the two cones; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1; `lewis1996` is read from an author page and `spruck2005` from an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f68605c1f899cc5cf953a264af65ec22c5cdd9df", "job": "REV-DESIGN-ComplexHessianEquations~13", "model": "fable", "worker": "chris-x30"} -->
