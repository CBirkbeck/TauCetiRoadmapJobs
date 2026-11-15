<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6896190742 -->
Review (claude) of 8e67ddb

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.7's Hessian estimate does not state the range of `k`, and its route stops at `k = n`

   **Location.** `packages/ComplexHessianEquations/design/README.md:710`: "The Hessian estimate (gpt2023 Theorem 5): if `λ[ω_{t,φ_t}] ∈ Γ_k` for all `t` and `q > n/k`, then … The `L^{p'}` bound is applied with background `a_0ω_X`". Line 712, the `*Needs:*` line. Plan target 8.7.

   **Claim.** The bullet states its hypotheses, and its route covers every `k` it allows.

   **Witness.** gpt2023 line 950 fixes `1 ≤ k ≤ n`; the bullet gives no range. At `k = n` the `L^{p'}` bound of line 709 is stated for `1 ≤ k < n` only; the Check at line 716 supplies §7.2, which line 712 does not list.

   **Exact repair.** In the bullet write "for a fixed `k` with `1 ≤ k ≤ n`, if `λ[ω_{t,φ_t}] ∈ Γ_k` for all `t` and `q > n/k`", and after "by §1.4" add: "For `k = n` the bound for `‖φ_t‖_{L^{q'}}`, `q' < ∞`, is §7.2 with `ω̂ = a_0ω_X`, since `a_0ω_X + i∂∂̄φ_t ≥ ω_{t,φ_t} > 0`." Add §7.2 to the `*Needs:*` line. In `plan.json` target 8.7: prerequisite `target:7.2`, hypothesis "`1 ≤ k ≤ n` for the Hessian estimate". Tested at `n = k = 2`, `q = 3/2`: `q' = 3`, §7.2 gives `∫(−φ_t)³ω_X² ≤ C_3`, and the Hölder bound gives `E_t ≤ (c_t²/V_t)‖e^{2F_t}‖_{L^{3/2}}C_3^{1/3}`; at `n = k = 1` the same with `q > 1`.

2. **F02** (P3) §§5.1 and 5.2 carry no source locator in the README

   **Location.** `packages/ComplexHessianEquations/design/README.md:449` (§5.1) and line 459 (§5.2).

   **Claim.** Every theorem has a locator at the claim.

   **Witness.** These are the only two of the 35 numbered subsections whose statement names no source id. The plan records them: target 5.1 "pss2012 line 871–875; twwy2015 line 75", target 5.2 "pss2012 §2.2, line 229–231".

   **Exact repair.** In §5.1, after "`Δ_d u = −2Δ_ω u`" add "(twwy2015 line 75–77 for `Δ_ω u = n·i∂∂̄u ∧ ω^{n−1}/ω^n`; pss2012 line 871–875 for `tr h = n + Δφ` in its normalization)". In §5.2, after the first sentence add "(pss2012 §2.2, line 229–231, which uses this invertibility for openness without proof; the interior estimate is gilbarg-trudinger2001 Theorem 6.2)". Both passages were read: twwy2015 line 77 is the stated formula, pss2012 line 875 is `Tr h = n + Δϕ`, pss2012 line 229–231 invokes the implicit function theorem. The plan needs no change.

Two findings, both P3: each is a repair to the text, so the verdict asks for changes. All seven round-6 findings are repaired, and every repaired statement holds on the instances I computed. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is precise, minimal and declared in both files; it is no finding. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md`.

| Round-6 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01 (P2), Poincaré owned by RiemannianGeometry R5c | Line 469: "is RiemannianGeometry R5c (item 4) applied to `u − ū`; it is consumed, not re-proved"; line 92, the new contract; lines 15, 23, 499, 530, 589. R5c item 4 read on main (`TauCetiRoadmap/RiemannianGeometry/README.md:3892–3903`, headline at `Suggested.lean:534`: `lam·∫g² ≤ ∫‖∇g‖²` for smooth `g` of mean zero, compact, connected, `Nontrivial E`). Torus `ℂ/(ℤ+iℤ)`, `u = cos 2πx`: `Δ⁺u = 4π²u`, `∫u² = 1/2 = 2π²/4π²`. Plan 5.3 and 6.2 carry `roadmap:RiemannianGeometry R5c`. | Repaired |
| F02 (P3), `n = 1` in §§6.3, 6.5 | Line 540: "for `n = 1` the equation itself is `ω_φ = e^F ω`"; line 559: "For `n = 1` the equation is `Δ_ω φ = e^F − 1` … §5.2 bounds `φ − mean(φ)`". Torus, `e^F = 1 − a cos 2πx`: `φ = (a/2π²)(cos 2πx − 1)`, `osc = a/π²`. | Repaired |
| F03 (P3), `χ ≤ ω_X` | Line 668: "§7.2 with `ω̂ = a_0ω_X`, where `χ ≤ (a_0 − 1)ω_X` as in §8.1". `χ = 3ω_X`, `t = 1`: `4 − 2.5 > 0`, `2 − 2.5 < 0`. No other `χ ≤ ω_X` remains. | Repaired |
| F04 (P3), §3.4 Needs, Layer 5 dependencies | Line 389 ends "*Needs:* §§3.2–3.3; Layer 2 §2.4."; line 499 begins "Layer 3;". Plan 3.4.1 has `target:3.2`. | Repaired |
| F05 (P3), Aubin–Yau owner | Lines 26 and 731 name ShimuraVarieties §7.0g; the section exists at its open head (README line 1993, target `TauCeti.Shimura.compact_negative_ke_metric`). | Repaired |
| F06 (P3), locator of §1.4 | Line 169: "stated there for a smooth concave `f` with positive partial derivatives on an open convex symmetric cone … the routes below need neither the cone, nor more than `C¹`, nor `𝕜 = ℝ`, nor positive partial derivatives for the concavity clause". Check line 185: `det(Id + A) = (1/2)·2 = 1`, midpoint `(5/4)²`, `2 log(5/4) > 0`. | Repaired |
| F07 (P3), source lemma numbers as names | Lines 708–710 head the bullets by their mathematics with "(gpt2023 Lemma 7)", "(gpt2023 Lemma 8)", "(gpt2023 Theorem 5)"; lines 673, 716, 718 and 275 follow. A search for "Lemma N" without a source key finds none. | Repaired |

Patterns searched in the rest of the design: F01 (an object owned elsewhere): no further instance (searches below). F06 (locator narrower than the statement): none new. F04 (a subsection without `*Needs:*`): none, all 35 have one. F02 (a route silent at a boundary value of a parameter) recurs once, at `k = n`: R01.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜`, hyperbolic polynomials of every positive degree, every admissible pair; Layers 3–4 with no Kähler hypothesis; Yau's theorem for `n ≥ 1`. No algorithm, no copied passage, no `set_option`, no sorry'd data.
- Not a re-plan: no ComplexHessianEquations on main (head `1a19c9f`), in the open-pull-request list or as a second board package; `scratch/overlaps.md` reports no second copy, no other pull request changing it, no dropped id.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape: every layer ends with Examples and Dependencies; all 35 subsections have a `*Needs:*` line; Checks per subsection range from 2 (§6.4, a theorem) to 10, and every definition has at least three (§1.1: 7, §1.3: 3, §2.2: 10, §2.4: 7, §3.1: 4, §3.3: 3, §3.4: 4). A search for LaTeX delimiters, pull-request numbers, machine paths, "repair", "handoff", "optional", "deferred" and `lemma` declarations finds nothing. The README advertises no Lean name of its own.
- Plan: 47 targets, every `target:` prerequisite points backwards, every definition has at least three tests, one gap.
- Declared gap `gap:weak-harnack-supersolutions`: same slug at README line 99 and in the plan, supplier PDE §5.4 (E23), which exists on main (line 1965) and plans the weak Harnack inequality (line 1997). The pin has only the homogeneous case (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`). The `needs` sentence is one statement with its hypotheses. Not a finding.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems and every passage the repairs changed. Rows of round 6 that carry computed values and whose text is unchanged (§§1.2, 1.3, 2.3, 2.5, 3.2, 5.4, 7.1, 7.2, 8.5) are relied on.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 relative eigenvalues | `⟨u,v⟩ = 2ū₁v₁ + ū₂v₂`, `a = diag(2,3)`; `−a`; `⟨u,v⟩' = ⟨u,Pv⟩`; `T = [[0,ε],[ε,0]]` | `g⁻¹a = diag(1,3)`, `λ = (3,1)` against `(3,2)`; `(−1,−3)`; `⟨u,Av⟩ = ⟨u,P⁻¹Av⟩'`; `λ = (ε,−ε)`, `‖T‖ = ε` | Holds |
| §1.4 convexity, concavity, monotonicity (changed locator, new Check) | `Γ = {μ_i > −1}`, `A = diag(−1/2,1)`, `B = diag(1,−1/2)`; rearrangement `min_σ⟨y_σ,μ⟩`; `f = −σ_1`; `λ(S) = λ(T)`, `S ≤ T` | `F(A) = F(B) = log 1 = 0`, midpoint `2 log(5/4) ≈ 0.446`; minimum is `⟨y↑,μ↓⟩`; `F(S) = −1 > −2 = F(T)`; `tr(T − S) = 0` forces `S = T` | Holds |
| §1.5 determinant, Euler, trace | `σ_2^{1/2}`, `T = diag(1,4)`; `A = diag(1,4)`, `B = Id`, `B = A⁻¹`; `σ_2` | `∂f(4,1) = (1/4,1)`, `∇F = diag(1,1/4)`, `det = 1/4 = 2⁻²`, `tr(∇F·T) = 2 = F(T)`; `5 ≥ 4`, `2 = 2`; `8 = 2·4` | Holds |
| §2.1 Newton–Maclaurin | `(1,2,3)`; indices `(3,2,2,1)`, `(3,1,2,0)`, `(2,0,2,1)`; chord slopes of `j ↦ log S_j`; `n = 3`, `k = 2` shift | `S = (2,11/3,6)`, `12 ≤ 121/9`; `18/11 ≤ 11/6`, `1.732 ≤ 1.915`, `1.915 > 1.833`; slope `[l,k] ≥ [l,r] ≥ [s,r]`; `3t² + 2σ_1t + σ_2`, `12 = 12` at `e`, `t = 1` | Holds |
| §2.2 Gårding cones | `p = 2xy − 0.9(x²+y²)`; `p_c`; `Γ(σ_k,e) ⊇ Γ_k` | `p(x+te) = 0.2t² + 0.2(x_1+x_2)t + p(x)`, discriminant `0.76(x_1−x_2)²`; `p(1,0.1) = −0.709`, roots `1.41`, `−2.51`; `p(1,0.7) = 0.059`, roots `−0.196`, `−1.504`, `∂_xp = −0.4`; sector `0.627 < x_2/x_1 < 1.595`; `p = p_19/20` (`p_19 = 40xy − 18(x²+y²)`), `√19 = 1.627/0.373`; shift coefficients `binom(n−j,k−j)σ_j > 0` | Holds in both directions |
| §2.4 admissible pairs, structural constant | `μ_j = (∏∂_if)^{1/n}/∂_jf`; `σ_1 − ε|λ|` at `(1,−1+δ)`; wedge cone; `∩_ε` cones; `f_1 = f_2 = σ_1` | `nγ^{1/n} ≤ f(μ) ≤ n(∏∂_jf)^{1/n}`; `δ − ε√(1+(1−δ)²) < 0`; `(1,−0.4)`, `(1,0.1)` in, `(1,−0.15)`, `(1.01,−0.15)` out; `{λ ≥ 0, λ ≠ 0}` not open; `2^n = (1+1)^n` | Holds |
| §2.5 Hessian constant | `∂_jσ_k^{1/k}(e)`; Maclaurin form | `(1/k)binom(n,k)^{1/k−1}binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `S_k^{1/k} ≥ S_n^{1/n}` is the hypothesis of the constant lemma | Holds |
| §3.1 `i∂∂̄`, Laplacian | `x_1²`; `|z|²`; `Re z_1²`; `cos 2πx` on `ℂ/(ℤ+iℤ)` | `dx_1 ∧ dy_1`, `Δ_ω = 1`; `H = 2h`, `λ = 2e`; `0`; `Δ_ω = −2π² cos`, `∫uΔ_ωu = −π² = −∫|∂u|²` with `g^{11̄} = 2` | Holds; locator of §5.1: R02 |
| §3.3 the equation | `χ = ω`, `F = 0`; `ℂP¹`, `χ = 2ω` | `c = f(e)`: `1`, `binom(n,k)^{1/k}`, `n`; `c·1 = 2` | Holds |
| §3.4 energy, entropy | `χ = 0`; `χ = ω_X`, Monge–Ampère; `F = a`; `q ≤ p` | `V_t = t^nV`; `c_t^n/V_t = (1+t)^n/((1+t)^nV) = 1/V`; `e^{na} ≤ e^{na}|a|^p + e^n`; `|F|^q ≤ 1 + |F|^p` | Holds |
| §4.2 uniqueness | maximum and minimum of `ψ − φ`; wedge pair `σ_1`, `10σ_1`; two components | `c' ≤ c ≤ c'`; `f(1,−0.4) = 6 > f(1.01,0.1) = 1.11`; `ψ = (0,−1)` | Holds |
| §5.2 Hölder invertibility | `cos 2πx`; `(u,β)` map | `Δ_ω⁻¹cos = −cos/(2π²)`; `β = −mean_{ω'}(v)`, `u` fixed by `∫uω^n = 0` | Holds; locator: R02 |
| §5.3 Poincaré, Sobolev (rewritten) | circle; torus; wrong factor `−4Δ_ω`; `n = 1, 2` | `π = π`; `1/2 = 2π²/4π²`; `1/2 ≤ 1/4` false; `2 < 2` false, exponent `2·4/2 = 4` | Holds |
| §6.1 curvature identities | `ℂP¹`; `ω_φ = sω`; `K` in a unitary frame | `g_{1̄1} = (1+|z|²)⁻²`, `R_{1̄1} = 2g_{1̄1}`, `s = 2`, `B = 2`; `0 = −s_ω + 0 + s_ω + 0`; `Σλ_j/λ_p = tr h·tr h⁻¹`, so `K ≥ −Λ tr h tr h⁻¹`; round 6's torus values (`2π²a/(1−a)`, `8π⁴a²/(1−a)⁴`) unchanged | Holds |
| §6.2 `C⁰` estimate | torus `ℂ²/ℤ⁴`, `φ = ε cos 2πx_1`, `ε = 1/(4π²)` | `i∂∂̄φ = −2π²ε cos·dx_1∧dy_1`; `λ = (1,1/2)` at `0`, `(3/2,1)` at `1/2`; `∫e^F = 1`; `osc = 2ε` | Holds |
| §6.3 `C²` estimate | `Δ_{ω_φ}φ = n − tr h⁻¹`; maximum of `log tr h − Aφ`; `n = 1` | `Δ'(log tr h − Aφ) ≥ (A − C_1 − Λ)tr h⁻¹ − An`, so `tr h⁻¹ ≤ An/(A − C_1 − Λ)` there; `λ_i = e^F/∏_{j≠i}λ_j`; `tr h = e^F` | Holds |
| §6.4 `C³` estimate | torus of §6.2 | `∂_{z_1}h_{11} = (1/2)·4π³ε sin = 2π³ε sin 2πx_1` | Holds |
| §6.5 regularity (changed) | `n = 1` torus; `sup φ = 0` | `osc φ = a/π²`; `mean φ ∈ [−osc φ, 0]` | Holds |
| §6.6 Yau | `F = a`; linearization; pair form | `b = −a`; `(u,β) ↦ Δ_{ω_φ}u − β`; `nF + log(ω_X^n/χ^n)` smooth under the layer's standing `F ∈ C^∞`, `c^n = ∫χ^n/V` | Holds |
| §8.1 comparison lemma | `φ_t ≡ 0`; `s = −inf φ_t`; `G = ∇log F_f` | `Ω_s = ∅`; `A_s = 0` excluded; `det G = f^{−n}det∇F_f ≥ γf^{−n}`, `tr(G·h) = 1` | Holds |
| §8.2 De Giorgi | `s_{j+1} − s_j`; `1_{[0,1)}`; `e^{−s}`; `s_0 = 0` | `r·φ(s_j)/2 < B_0φ(s_j)^{1+δ_0}` gives `r < 2B_0φ(s_0)^{δ_0}2^{−jδ_0} < 2^{−jδ_0}`, sum `< 1/(1−2^{−δ_0})`, `φ(lim s_j) ≤ 2^{−j}φ(s_0) → 0`; `r ≤ 1`; `re^{−r}e^{δ_0s}/B_0 → ∞`; right-continuity extends the hypothesis to `s = 0` | Holds, with `≥` in the conclusion |
| §8.3 degenerating backgrounds | Chebyshev on `Ω_s^∘`; `s_0 = (2B_0)^{1/δ_0}Ē` | `sΦ(s) < E_t` unless `Φ(s) = 0`, so `Φ(s_0)^{δ_0} < 1/(2B_0)`; `A_s ≥ rΦ(s+r)` | Holds |
| §8.4 Monge–Ampère case (changed) | `χ = 3ω_X`, `t = 1`; Jensen for `V⁻¹e^{nF_t}ω_X^n` | `4 − 2.5 > 0`, `2 − 2.5 < 0`; `αE_t ≤ log(C/V) + n·V⁻¹∫F_te^{nF_t} ≤ log(C/V) + n·Ent_1` | Holds |
| §8.6 fixed background | `χ = 0`, `t = 1` | `c_1 = 1`, `V_1 = V`, `Ent_n ≤ 1 + Ent_p` | Holds |
| §8.7 Hessian equations | integration by parts; Maclaurin form; tail integral; `a_0`-rescaling; `k = n` | `∫(−u)ω_v^k∧ω^{n−k} ≤ ∫(−u)ω_v^{k−1}∧ω^{n−k+1} + C_0`, using `ω_u∧ω_v^{k−1}∧ω^{n−k} ≥ 0`; `S_k^{1/k} ≥ S_n^{1/n}`, `5/2 ≥ 2`; exponent `→ −n/(n−k)`, integrable iff `p' < n/(n−k)`; `λ[ω_X + i∂∂̄(φ_t/a_0)] = λ[a_0ω_X + i∂∂̄φ_t]/a_0 ∈ Γ_k`; `n/(n−k)` infinite | Holds for `1 ≤ k ≤ n`; R01 |
| Contract RiemannianGeometry R5c | `f = u − ū`, real dimension `2n ≥ 2` | `∫f = 0`, `∇f = ∇u`; `Nontrivial E` holds | Hypotheses met |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 1.5 | gpt2023 line 241–255 (linearization `G`, Euler identity at 249–250, arithmetic–geometric step at 255). Supported. |
| 2.1 | spruck2005 line 11257–11293 (Lemma 2.6, Proposition 2.7, Corollary 2.8, Lemma 2.10 with `r ≥ k`, `s ≥ l`); dinew-kolodziej2014 line 152–159. Supported; the equality clause is restricted as the README says. |
| 2.2 | spruck2005 line 11182–11235 (Definition 2.1, Theorem 2.2, Proposition 2.3, Corollary 2.4); dinew-kolodziej2014 line 139–164. Supported; the README adds the condition Corollary 2.4 omits. |
| 2.4 | guo-phong2024 line 76–90 and 103–104; gpt2023 line 71–76, 84–86, 744–769; szekelyhidi2018 line 29–31 and 183–185. Supported. |
| 3.1 | gpt2023 line 62–66; szekelyhidi2018 line 17–24. Supported. |
| 3.4 | gpt2023 line 82–83 ((1.3)), 101–119 ((1.6)–(1.9)), 450–451 ((3.2), for `p ≥ 1`), 785–803 (Lemma 5). Supported. |
| 5.2 | No locator in the README (R02). The plan's pss2012 line 229–231 was read: it invokes the implicit function theorem for openness. gilbarg-trudinger2001 Theorem 6.2 is uncertified. |
| 6.1 | pss2012 line 163–164 ((2.2)), 837–840 ((5.4)), 874–875, 994–1016 ((6.2)–(6.6)), 1046–1064 ((7.1)–(7.4)). Supported. |
| 6.2 | pss2012 line 245–308 (Moser iteration, (3.5)–(3.6), Poincaré at 299–303, Theorem 3); tosatti-weinkove2010 line 104–106. Supported. yau1978 is uncertified. |
| 6.3 | pss2012 line 981–990 (Theorem 8) and 994–1031 ((6.8)–(6.10)). Supported. |
| 6.4 | pss2012 line 1070–1081 ((7.5)–(7.7), Theorem 9); twwy2015 line 132–136. Supported. |
| 8.1 | gpt2023 line 197–302 (Lemma 1, `τ_k`, (2.3)–(2.11)); constants depend on `n, ω_X, χ, γ`; `a_0` at line 280–281. Supported. |
| 8.2 | gpt2023 line 412–426 (Lemma 2 and its proof). Supported; the README states the vanishing threshold `s_0 + 1/(1 − 2^{−δ_0})` explicitly. |
| 8.7 | gpt2023 line 861–952 (Lemmas 7 and 8, Theorem 5 with `1 ≤ k ≤ n`). Supported; R01. |

Also read: gpt2023 line 404–441 and 770–776; tosatti-weinkove2010 line 21–59 and 93–99; pss2012 line 170–179 and 216–233.

### Pins, duplication and suppliers

- Pins: the checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, the commits of README lines 44 and 56.
- Tau Ceti declarations opened at the pin, all present: `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `HoffmanWielandt/Basic.lean:78`; `KyFan.lean:99` (`kyFanSum`), `489`; `Harmonic/MeanValue/Basic.lean:464` (`C²` on the ball, continuous on the closed ball, `0 ≤ Δf`); `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`2 < finrank ℝ E`, `ContMDiff 1`, `riemannianVolume`); `Geometry/Manifold/Complex/LeviForm.lean:156`, `165`, `172`, `179`, `206`, `241`, `292`, `343`; `Analysis/Complex/LeviForm.lean:142`, `150`, `270`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Analysis/Complex/Wirtinger/LeviForm.lean:79`; `Analysis/MeanInequalities.lean:68` (weights `≥ 0` summing to `1`, `a, b ≥ 0`); `Analysis/Matrix/MinkowskiDeterminant.lean:159` (on `{A | A.IsPositive}`); `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231`; `Geometry/Manifold/TwoForm/Basic.lean:37`; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `Geometry/Manifold/Riemannian/Laplacian.lean:238`; `Analysis/PDE/Regularity/Harnack.lean:284`.
- Mathlib declarations opened at the pin, all present: `Analysis/InnerProductSpace/Spectrum.lean:277`, `297`, `309`, `314`, `384`; `Analysis/Matrix/Spectrum.lean:143`, `193`, `240`; `RingTheory/MvPolynomial/Symmetric/Defs.lean` (`esymm`); `Analysis/Calculus/LocalExtr/Polynomial.lean:64`; `Analysis/MeanInequalities.lean:129`; `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:118`; `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`; `Analysis/Calculus/Implicit.lean:465` (`implicitFunction`, in the `FiniteDimensional 𝕜 F` section, as line 49 says).
- Supplier sections resolved on main: PDE §3.2 (C13) line 1344 (strong maximum principle for variable `a`, Gilbarg–Trudinger 3.5, at 1356–1361; Aleksandrov–Bakelman–Pucci with the contract's hypotheses at 1403–1408), §5.4 (E23) line 1965, §5.6 (E25) line 2097 (the scaled estimate quoted in the contract); PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440–1948, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3892; OptimalTransport Layer 6 at 2421; OperatorTheory PD-A51, PD-A53, PA-B32, MAJ-A27; AffineMorseLefschetz §1.1 at 315. Open heads: K3Surfaces §2.1 (line 528, the equation `(ω+i∂∂̄φ)² = cV` with `∫φω² = 0`), ShimuraVarieties §7.0g (1993), ComplexComparisonPartII C5.4, NumberFieldEnumeration §1.1 (172, Maclaurin's bound at 195). The open revisions of PDE and ComplexKahlerGeometry keep the cited tags (C13, E23, E25; K1, K2, K4, K5a), as `scratch/overlaps.md` reports.
- By object, on main and at the open heads (`roadmaps grep`): "hyperbolic polynomial", "Calabi conjecture / Yau's theorem", "Aubin–Yau / Calabi's estimate": no match. "Newton's inequalities": ClassicalArithmeticCompletion cites them for log-concavity, does not state them. "Monge–Ampère": ShimuraVarieties §7.0g, K3Surfaces §2.1 (both named in Scope), ArithmeticDynamics and ArakelovGeometryAndAbelianHeightsPartII (measures, a different object). "plurisubharmonic": AffineMorseLefschetz (strict, at the pin), ComplexComparisonPartII C5.4 (currents, named in Scope). "exponential integrability": PDE (Trudinger and John–Nirenberg, different statements). "spectral function": OperatorTheory (measurability for random matrices, no derivative). "Maclaurin": NumberFieldEnumeration §1.1, settled in Scope line 17.
- Manifest: 19 entries, one per cited work, 11 certified and 8 uncertified; the References list the same 19. Nothing was fetched; `needs-references.toml` was not created.

Overlap check: read ComplexKahlerGeometry, PDE, ManifoldOptimization, YangMillsConnectionsAndCaloricGauge (open); PDE, Yamabe, RiemannianGeometry (main); the third list is empty. Shared objects: the Poincaré inequality on a closed Riemannian manifold, owner RiemannianGeometry R5c, now consumed; the Levi form, owner the pinned Tau Ceti; the eigenvalue variational inequalities, owner OperatorTheory at the pin (ManifoldOptimization consumes the same, and states no derivative of spectral functions); Yamabe owns the sharp Euclidean Sobolev inequality, not the closed-manifold `H¹` form consumed here from the pin. Nothing else is shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage, so there is nothing to probe for padding and no signature to compare.

### Copyright and arrangement

- Wording: 24 passages set beside their sources (gpt2023 Theorems 1, 2 and 5, Lemmas 1, 2, 4, 7 and 8, (1.3), (1.6)–(1.9); pss2012 Theorems 3, 8 and 9, (6.2)–(6.8), §2.2; spruck2005 Definition 2.1, Theorem 2.2, Corollary 2.4, Proposition 2.7, Lemma 2.10; guo-phong2024 conditions (1)–(4); szekelyhidi2018 line 17–31; tosatti-weinkove2010 Corollary 1; dinew-kolodziej2014 properties 1–3). Shared text is formulas and parameter lists only; the longest shared run is the dependence list of gpt2023 Theorem 2, which is forced.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §3 ↔ §§8.5–8.6, §4 ↔ §2.4 (one lemma) and §8.4, §5 ↔ §8.7. The design's order is the source's §2, §4, §3, §5, and Layers 1–7 have no counterpart in it; the edges 8.1 → 8.3, 8.3 → 8.4, 8.5 → 8.6 and 8.4 → 8.7 are in the `*Needs:*` lines.
- Reuse: no table, figure or list is taken over.

Source independence: 24 passages compared with 7 sources, none shared; largest share gpt2023, 43 of 143 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread. This covers the contracts quoted from gilbarg-trudinger2001 (Theorems 3.5, 6.2, 8.18, 9.1, Lemma 17.16).
- Displayed formulas of spruck2005 are partly garbled by OCR (Corollary 2.8, Lemma 2.10, the proof of Theorem 2.2); the hypotheses were legible and the statements were recomputed.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. The pinned declarations were read, not elaborated.
- Open pull requests were read through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15; the open roadmaps of the closest list were compared by scope and by object search, not target by target.
- Sections outside the seeded sample whose text no repair touched (§§1.2, 1.3, 2.3, 3.2, 5.4, 7.1, 7.2, 8.5) rely on round 6's rows with computed values; their locators were not read again.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, printed p.289: the source says the cone of every symmetric polynomial hyperbolic in `(1, …, 1)` contains the positive cone and has positive partial derivatives; it should assume the coordinate vectors lie in the closed cone, as `2xy − 0.9(x² + y²)` shows; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates for every real tuple; it should restrict the equality clause to positive tuples, since `(1, 0, 0)` gives equality; affects a stated result.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Misprint** in gpt2023 at the proof of Lemma 1, arXiv v1 p.7: the source bounds the determinant of the linearization of `log f` below by `γ` times `f^n`; it should be `γ` times `f^{−n}`, as its own preceding equality gives; affects nothing.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevels, which give right-continuity when a level set has positive measure; affects the proof.
- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every `s > 0`; it should require `inf φ_t < −s`, since otherwise the normalizing energy `A_s` is zero; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 3(c), arXiv v1 p.16: the source bounds the signed moment of `F` by the entropy alone; it should add a constant, since `|F| ≤ 1 + |F|^p` is what holds; affects the proof.
- **Gap** in gpt2023 at the proof of Lemma 6, arXiv v1 p.18: the source assumes `χ ≤ ω_X` without loss of generality; it should take `a_0` with `χ ≤ (a_0 − 1)ω_X`, as in its Lemma 1, the constant then depending on `χ`; affects the proof.
- **Gap** in gpt2023 at (3.3), arXiv v1 p.11: the source applies Hölder's inequality with exponent `n/(n − 1)`; it should treat `n = 1` separately, where part (c) of its Theorem 3 at `N = 1` gives the bound directly; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 5, arXiv v1 p.20: the source applies its Lemma 8, stated for the background `ω_X`, to `ω_t`-admissible functions; it should rescale by `a_0` with `ω_t ≤ a_0ω_X` and use monotonicity of the cone; affects the proof.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`); it is cited for one proposition in §7.1. `lewis1996` and `spruck2005` are read from an author page and an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8e67ddbd982ce5aaf8a7e7753c820738970e8964", "job": "REV-DESIGN-ComplexHessianEquations~7", "model": "fable", "worker": "chris-x80"} -->
