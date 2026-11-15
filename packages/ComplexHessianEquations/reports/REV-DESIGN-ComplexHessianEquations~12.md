<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6899928932 -->
Review (claude) of 24dc55d

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §6.2: the route does not bound the mean of `sup φ − φ + 1`

   **Location.** `packages/ComplexHessianEquations/design/README.md:530`: "The route is Moser iteration on `sup φ − φ + 1`, using … the Sobolev inequality, and the Poincaré inequality for the starting `L²` bound (pss2012 line 299–303)." The `*Needs:*` line and plan target 6.2 list §§3.2, 5.3, R5c, DifferentialGeometry Layer 5 and the Sobolev inequality.

   **Claim.** The integrated identity, the Sobolev inequality and the Poincaré inequality bound `ψ = sup φ − φ + 1` in `L²`, and Moser iteration then bounds `sup ψ = osc φ + 1`.

   **Witness.** At `α = 0` the identity gives `(1/n)∫|∂ψ|² ω^n ≤ e^{sup F}∫ψ ω^n`, and Poincaré gives `‖ψ − ψ̄‖²_{L²} ≤ C·ψ̄`. Nothing bounds the mean `ψ̄ = sup φ − φ̄ + 1`. pss2012 line 299–303 takes that bound from its Appendix A, or iterates on the mean-zero `φ` instead.

   **Exact repair.** In §6.2 replace "and the Poincaré inequality for the starting `L²` bound (pss2012 line 299–303)" by: "and, for the starting `L²` bound of `ψ = sup φ − φ + 1`, three inputs: the `L¹` bound `∫ (sup φ − φ) ω^n ≤ C(X, ω)` of §5.4 (first statement, with `ω̂ = ω`, applied to `φ − sup φ`, since `ω + i∂∂̄φ > 0`); the case `α = 0` of the integrated identity, `(1/n)∫ |∂ψ|²_ω ω^n ≤ e^{sup F} ∫ ψ ω^n`; and the Poincaré inequality for `ψ − ψ̄` (pss2012 line 299–303 names the two ways to start the iteration)". Add "§5.4 (first statement)" to the `*Needs:*` line of §6.2, and `target:5.4.1` to the prerequisites of plan target 6.2. Tested on the witness: now `ψ̄ ≤ 1 + C/V`, `‖ψ − ψ̄‖²_{L²} ≤ C'(V + C)`, so `‖ψ‖_{L²}` is bounded by `n`, `sup F` and `ω`, the dependence the statement claims; on the torus Check of §6.2, `∫ (sup φ − φ) = ε`. No cycle: target 5.4.1 needs only target 3.1.2 and the pinned `TauCeti.le_setAverage_ball_of_laplacian_nonneg`, not the declared gap. (Iterating on the mean-zero `φ − φ̄` with test functions `u|u|^α` also closes without §5.4, but those test functions are only `C¹`, which the present text avoids on purpose.)

2. **F02** (P3) §5.2: the global Schauder estimate does not say what `C` depends on

   **Location.** `packages/ComplexHessianEquations/design/README.md:459`: "Prove the global Schauder estimate `‖u‖_{C^{k+2,α}} ≤ C(‖Lu‖_{C^{k,α}} + ‖u‖_{C⁰})` for operators `Lu = Re tr(a·H_{i∂∂̄u})` with `a ∈ C^{k,α}` uniformly positive definite." Plan target 5.2 has the same sentence.

   **Claim.** One estimate for the class of operators named, with a constant `C`.

   **Witness.** On the torus `ℂ/(ℤ + iℤ)` take `L = ε·Δ_ω` and `u_j = j^{−2−α} cos 2πjx`: `‖u_j‖_{C^{2,α}} ≥ c_0 > 0` for all `j`, while `‖Lu_j‖_{C^{0,α}} + ‖u_j‖_{C⁰} ≤ c_1ε + j^{−2−α}`. So `C ≥ c_0/(c_1ε)`: no `C` serves the whole class, and the class of `u` is not stated.

   **Exact repair.** Write: "… `‖u‖_{C^{k+2,α}} ≤ C(‖Lu‖_{C^{k,α}} + ‖u‖_{C⁰})` for every `u ∈ C^{k+2,α}(X)` and every operator `Lu = Re tr(a·H_{i∂∂̄u})` with `a ∈ C^{k,α}`, `a ≥ θ·Id` and `‖a‖_{C^{k,α}} ≤ M`, with `C` depending only on `X`, `ω`, `k`, `α`, `θ > 0` and `M`." Put the same sentence in plan target 5.2. Tested on the witness: `θ = ε` is now an argument of `C`, and `C(θ) ≥ c_0/(c_1θ)` is allowed. The consumer, §6.5, applies the estimate to the fixed operator `Δ_ω` (`a = g⁻¹`), which the repaired statement covers.

Two findings, both P3, each with a repair to apply: the route of §6.2 omits one input that an earlier layer of this roadmap already proves (R01), and the global Schauder estimate of §5.2 does not say what its constant depends on (R02). No P1 or P2. Because each finding carries a repair, the verdict asks for changes: a fix round applies R01 and R02. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is precise, minimal and declared in both files, and is not a finding. The round-11 finding is repaired. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous finding and its repair

Quotations are from `packages/ComplexHessianEquations/design/README.md`.

| Round-11 finding | Repaired passage and what I read | Status |
| --- | --- | --- |
| F01 (P3), §1.2 cited lewis1996 line 145–148 for the maximum principle | Line 137 now ends "with equality at `P = P_T`." with no locator. Line 139: "`κ_m` is convex (Fan's theorem, recorded at lewis1996 line 145–148)" and "(lewis1996 Theorem 2.1, line 154–159, states the differentiability at diagonal `T`; the uniqueness is the first step of the route below)". lewis1996 line 145–148 defines the sum of the `m` largest eigenvalues and records Fan's convexity; line 154–159 is Theorem 2.1 (hypothesis line garbled by OCR, conclusion and the remark on `m = n` legible); lines 150–153 are a page break. Plan target 1.2 `locator.where` carries the same ranges. | Repaired |

Pattern search (a locator attached to a claim its lines do not make): every locator of the fifteen sampled sections was read against its claim (table below); no further instance.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜` and for every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- No re-plan and no second copy: main (head `1a19c9f`) has no `ComplexHessianEquations` folder; `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, no second copy.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape, counted: 35 numbered subsections, 35 `*Needs:*` lines, 35 `**Checks.**` blocks, 8 `### Examples`, 8 `### Dependencies`. A search for LaTeX delimiters, pull-request numbers, machine paths, round labels, "so far", "optional", "deferred", "for later", HTML anchors and `lemma` as a keyword finds nothing. The README attributes no Lean name to this roadmap.
- Plan: parses; 47 targets in 8 layers (34 theorems, 12 definitions, 1 example); every `target:` prerequisite is an earlier target; every definition has at least three tests; every target has a locator; one gap, with `supplier`, `section` and `needs`, slug identical in the README (line 99) and in `gaps`.
- Manifest: 19 entries, one per work of the References (11 certified, 8 uncertified and settled), no local path; not changed by this review. No text was missing, so no `needs-references.toml` was written.
- Declared gap `weak-harnack-supersolutions`: one statement with all hypotheses (`m ≥ 1`, `r > 0`, `q` finite, `q ≥ 1`, `q > m/2`, `u ∈ H¹`, `u ≥ 0` a.e., essential infimum, constants `λ, Λ`). Minimal: the pin has the homogeneous form only (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`, namespace `TauCeti.PDE`), and PDE §5.4 on main (`TauCetiRoadmap/PDE/README.md:1965`) plans the theory for `−div(a∇u) = 0`. It is no finding.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems, the repaired passage and the targets of R01 and R02. All values were computed in this round.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.2 (sampled, repaired) | `F = diag(2,1)`, `B = diag(0,3)`; `T = diag(3,1)`, `P` onto `(cos θ, sin θ)`; `T = diag(3,1,1)`, `m = 2` | lower `2·0 + 1·3 = 3 = tr(FB)`, upper `6`; `Re tr(PT) = 3cos²θ + sin²θ = 3` iff `sin θ = 0`; `κ_2(T + t·diag(0,1,−1)) = 4 + |t|` | Holds |
| §1.3 Lewis (sampled, headline) | Abel summation of `∇f(λ)·λ`; `σ_2` at `[[2,1],[1,2]]`; `max` at `(1,1)` | `Σa_iλ_i = Σ_m (a_m − a_{m+1})κ_m + a_nκ_n`, coefficient `≠ 0` only where `λ_m ≠ λ_{m+1}`; `det·T⁻¹ = [[2,−1],[−1,2]]` against `diag(1,3)`; `λ_1(Id + t·diag(1,0)) = 1 + max(t,0)` | Holds |
| §1.4 (headline) | `det^{1/2}` at `diag(4,1)`, `diag(1,4)`; wedge cone; `f = −σ_1` | `2, 2`, midpoint `5/2`; `−0.4 ∈ (−1/2, −1/3)`, midpoint ratio `−0.15 ∉`, not in `Γ_2`; `−1 > −2` for `diag(1,0) ≤ diag(2,0)` | Holds |
| §2.1 (sampled) | `(1,2,3)`; `(2,2,−1)`; `−e`; `(1,0,0)`; indices `(3,2,2,1)`, `(3,1,2,0)`, `(2,0,2,1)`; `k = 0` | `S = (2, 11/3, 6)`, `12 ≤ 121/9`, `2 ≥ 1.915 ≥ 1.817`; `σ_2 = 0`, `σ_2(λ + εe) = 6ε + 3ε²`; `S_1 = −1 < S_2^{1/2} = 1`; `S_1S_3 = 0 = S_2²`; `18/11 ≤ 11/6`, `1.732 ≤ 1.915`, and `1.915 ≤ 1.833` false when `l > s`; slopes of the concave `j ↦ log S_j`: `[l,k] ≥ [l,r] ≥ [s,r]`; truncated subtraction gives `1 = 2`, `0 = 1` | Holds |
| §2.2 Gårding (sampled, headline) | `p = 2xy − 0.9(x² + y²)`; `p_c = (x_1+x_2)² − c(x_1−x_2)²`; `σ_k = D_e^{n−k}σ_n/(n−k)!`; derivative route | `p(e) = 0.2`, discriminant `0.04s² − 0.8p = 0.76(x_1 − x_2)²`, sector `0.627 < x_2/x_1 < 1.595`; `p(1, 0.1) = −0.709`, roots `1.41`, `−2.51`; `p(1, 0.7) = 0.059`, roots `−0.196`, `−1.504`, `∂_xp = −0.4`; `c = 19` gives `20·p`; `D_eσ_k = (n−k+1)σ_{k−1}`; a polynomial bounded on a half-line is constant, and then `σ_1(x + te_i) < 0` for `t < −σ_1(x)` | Holds |
| §2.4 (sampled) | Lemma 4 with `μ_i = (∏∂_jf)^{1/n}/∂_if`; `σ_1 − ε|λ|`; `∩_ε` cones; `(1.01, −0.15)` | `Σμ_i∂_if = n(∏∂_jf)^{1/n} ≥ nγ^{1/n}`, `∏μ = 1`; value `δ − ε√(1 + (1−δ)²) < 0`; intersection `{λ ≥ 0, λ ≠ 0}` not open; ratio `−0.1485` outside the wedge | Holds |
| §2.5 (sampled, headline) | Hessian at `e`; `n = 3, k = 2`; `σ_2/σ_1` at `(ε,1)` and `(M,1,1)` | `(1/k)binom(n,k)^{1/k−1}binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `3^{−1/2}`, constant `3^{−3/2}`; `λ_1²λ_2²/(λ_1+λ_2)⁴ ≈ ε²`; `∂_1f = 3/(M+2)²`, `∂_2f = (M²+M+1)/(M+2)²`, product `≈ 3/M²` | Holds |
| §3.1 (sampled) | `u = x_1²`; `u = x` on `ℂ`; `|z|²` | `u_{11̄} = 1/2`, `i·(1/2)dz∧dz̄ = dx∧dy`, `Δ_ω = 1`; `i∂u∧∂̄u = (i/4)dz∧dz̄ = ω/2` and `2·conj(v/2)(w/2) = h(v,w)/2`; `(1/2)·4n = 2n` | Holds |
| §3.2 (sampled) | `k = 1`; `λ[β] = (4,1)`; mixed inequality | `1!(n−1)!/n! = 1/n`; `5/2 ≥ 2`; `M_k(α,β,…,β) = (1/k)Σμ_iσ_{k−1;i}(λ) ≥ σ_k(μ)^{1/k}σ_k(λ)^{(k−1)/k}` | Holds |
| §4.2 (headline) | maximum and minimum of `ψ − φ`; two components | `c'e^F ≤ ce^F` and the reverse; `ψ = (0, −1)` has `sup = 0` and the same `c = f(e)` | Holds |
| §5.2 (sampled) | pair map; circle `u_j = j^{−α}sin jx`; `L = εΔ_ω` | `β = −mean_{ω'}(v)`, kernel: `β = 0`, `u` constant of `ω^n`-mean `0`; quotient at `|x−y| = π/2j` is `(2/π)^α`; `C ≥ c_0/(c_1ε)` | Isomorphisms hold; estimate: R02 |
| §6.1 (sampled) | `ℂP¹`; torus `q = 1 − a cos 2πx` at `0`, `1/4` | `R_{1̄1} = 2g_{1̄1}`, `s = 2`, `B = 2`; `q''/(2q) = 2π²a/(1−a) = (1/2)(log q)''`; at `1/4`: `−2π²a² + 2π²a² = 0`; `S''(0) = q''²/q³`, `Δ_{ω_φ}S = q''²/(2q⁴) = 8π⁴a²/(1−a)⁴ = 2·(2/q)²(q''/4q)²`; `K = ΣB(e_p,e_j)λ_j/λ_p ≥ −Λ·tr h·tr h⁻¹` | Holds |
| §6.2 (sampled) | identity at `α = 0`; torus `ℂ²/ℤ⁴`; shift `ψ + M` | `∫ψ(e^F − 1)ω^n = ∫i∂ψ∧∂̄ψ∧Σ ≥ (1/n)∫|∂ψ|²ω^n`; eigenvalues `q, 1`, `(1, 1/2)` and `(3/2, 1)` at `ε = 1/4π²`, `osc = 2ε`; Poincaré bounds only `‖ψ − ψ̄‖` | Statement holds; route: R01 |
| §6.3 (sampled) | maximum of `log tr h − Aφ`; `λ = (4, 1/4)` | `0 ≥ (A − C_1 − Λ)tr h⁻¹ − An`; `λ_i ≤ e^{sup F}(tr h⁻¹)^{n−1}`; `4/17 ≤ 17/4` | Holds |
| §6.4 (sampled) | `S + A·tr h`; torus | `Δ_{ω_φ}(S + A·tr h) ≥ (AC_3 − C_1)S − C`; `∂_{z_1}h_{11} = q'/2 = 2π³ε sin 2πx_1` | Holds |
| §6.6 Yau (headline) | `F = a`; `F = ε cos 2πx`; pair form | `b = −a`; `∫e^F = I_0(ε)`, `b = −ε²/4 + O(ε⁴)`; `G = nF + log(ω_X^n/χ^n)` gives `e^b = ∫χ^n/V = c^n`, `c = 2` on `ℂP¹` | Holds |
| §7.2 (headline) | `u = ψ − sup ψ + A|z|² − 4A`; `ℂP¹` | `u ≤ 0` on `B(0,2)`, `e^{−α(ψ − sup ψ)} ≤ e^{−αu}`; `∫|z|^{−2α}` finite iff `α < 1` | Holds |
| §8.2 (used by §8.3) | iteration; `s_0 = 0` | `r·φ(s_j)/2 < B_0φ(s_j)^{1+δ_0}` gives `r < 2^{−jδ_0}`; `φ(s_j + 1) < φ(s_j)/2` excludes `r > 1`; with the hypothesis for `s > 0` only, right-continuity gives the case `s_0 = 0` | Holds |
| §8.3 (sampled, headline) | `p = 4`, `n = 2`; `B_0 = 1`, `Ē = 1`; `n = 1` | `δ_0 = 1/4`, `1 + δ_0 = 10/8` as gpt2023 line 381–383; `s_0 = 16`, `Φ(s_0) < 1/16`, `Φ^{1/4} < 1/2`; Hölder exponents `n/((n+1)p) + 1/q = 1` need only `p > n ≥ 1` | Holds |
| §8.6 (sampled, headline) | `χ = 0`, `t = 1`; `0 < n ≤ p` | `c_1 = 1`, `V_1 = V`; on `|F| ≥ 1`, `|F|^n ≤ |F|^p`; on `|F| < 1` the integrand is `≤ e^{nF}` of mean `1`; §8.5(c) at `p' = n ≥ 1`, `N = 1` | Holds |
| §8.7 (headline) | conjugates at `n = 3`, `k = 1`; entropy bound at `n = 1`, `p = q = 2` | `q > 3` iff `q' < 3/2`; `x^pe^{−δx} ≤ (p/eδ)^p`; `Ent_2 ≈ (0.412 + 0.3845)/2 = 0.398 ≤ 0.5413·2.421 = 1.310` | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators.

| Section | What I read |
| --- | --- |
| 1.2 | lewis1996 line 145–148, 154–159; spruck2005 line 11089–11091 (Lemma 1.5, lower bound). Supported. |
| 1.3 | lewis1996 line 77–81 (Theorem 1.1), 144, 165–166 (Lemma 2.2), 185–187 (Lemma 2.3), 199–217 (Theorem 2.4), 468–469; spruck2005 line 11072–11073 (Theorem 1.4(i), diagonal case). Supported. |
| 2.1 | spruck2005 line 11257–11265 (Lemma 2.6), 11268–11270 (Proposition 2.7), 11271–11275, 11279–11293 (Lemma 2.10, "provided `r ≥ k` and `s ≥ l`"); dinew-kolodziej2014 line 152–159. Supported; the README restricts the equality clause, correctly. |
| 2.2 | spruck2005 line 11182–11185, 11186–11224, 11225–11235; dinew-kolodziej2014 line 139–164. Supported; Corollary 2.4 is stated there without the condition the README adds (Source issues). |
| 2.4 | guo-phong2024 line 76–80, 83–84, 85–90, 103–104; gpt2023 line 71–76, 84–86, 744–769; szekelyhidi2018 line 29–31, 183–185; spruck2005 line 11314. Supported. guo-phong2024 takes `f` with values in `ℝ₊`; the README does not, and its targets use positivity only where `f = c·e^F`. |
| 2.5 | gpt2023 line 90–93, 770–776; guo-phong2024 line 91–104. Supported; the README's cone `Γ_{max(k,p)}` and `l < k` correct the source. |
| 3.1 | gpt2023 line 62–66; szekelyhidi2018 line 17–24. Supported. |
| 3.2 | dinew-kolodziej2014 line 33–35, 165–172, 259–263; gpt2023 line 924–926. Supported. |
| 5.2 | pss2012 line 216–233. Supported as described (the source asserts openness without proof). gilbarg-trudinger2001 is uncertified. |
| 6.1 | pss2012 line 163–164, 837–840, 994–1016, 1046–1064. Supported. |
| 6.2 | pss2012 line 245–252, 278–308 (Theorem 3 at 304–306: dependence on `n`, an upper bound for its `F = e^F`, and `ω_0`); tosatti-weinkove2010 line 104–106. Statement supported; route: R01. yau1978 is uncertified. |
| 6.3 | pss2012 line 981–990, 994–1031. Supported (the source assumes a `C⁴` solution; the layer assumes smooth). |
| 6.4 | pss2012 line 1067–1081; twwy2015 line 132–136. Supported. |
| 8.3 | gpt2023 line 120–130, 303–441. Supported; the README's strict sublevel sets and strict Chebyshev step repair the source (Source issues). |
| 8.6 | gpt2023 line 62–70 (the normalization of `F`), 84–89, 442–457. Supported. |

### Pins, duplication and suppliers

- Pins: `lake-manifest.json` of the content repository gives Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- All 52 qualified library names of the README were searched at the pins and found; all 24 cited file paths exist. Opened this round: Tau Ceti `Analysis/InnerProductSpace/KyFan.lean:489` (orthonormal family, the `card ι` largest eigenvalues); `Analysis/InnerProductSpace/HoffmanWielandt/Basic.lean:78`; `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `Analysis/Complex/Wirtinger/LeviForm.lean:79` (the `(k, j)` entry is `∂²f/∂z_j∂z̄_k`); `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`2 < finrank ℝ E`, compact, `ContMDiff … 1 u`); `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231`; `Analysis/Matrix/MinkowskiDeterminant.lean:159` (positive operators, `𝕜 = ℝ`); `Analysis/MeanInequalities.lean:68`; `Analysis/PDE/Regularity/Harnack.lean:284`; Mathlib `Analysis/Calculus/Implicit.lean:450–465` (`implicitFunction` in a section with `[FiniteDimensional 𝕜 F]`, as the README says); `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`. The pin has only strict plurisubharmonicity predicates (`Analysis/Complex/Pseudoconvex.lean:82`, `Geometry/Manifold/Complex/LeviForm.lean:343`), as the README says.
- By object at the pins: no Newton or Maclaurin inequality for `esymm`, no hyperbolic polynomial, no derivative of eigenvalue functions, no weak Harnack inequality with forcing, no Aleksandrov–Bakelman–Pucci or Schauder estimate. `TauCeti/Analysis/Convex/MongeAmpere/` is the real Monge–Ampère measure of convex functions, a different object.
- By object on main and at the open heads (`roadmaps grep -i --readme-only`): "Hessian equation", "hyperbolic polynomial", "quasi-plurisubharmonic", "Calabi conjecture / Yau's theorem", Calabi's third-order identity: no match. "Gårding" matches only the coercivity inequality of elliptic theory. "spectral function" matches functional-calculus statements, not symmetric functions of the spectrum. "admissible cone" matches toroidal compactifications.
- Supplier sections on main (head `1a19c9f`): PDE §3.2 (C13) line 1344 with the Aleksandrov–Bakelman–Pucci statement at 1403–1408, identical in hypotheses to the contract; §5.4 (E23) 1965; §5.6 (E25) 2097; PseudodifferentialOperators §5.4 1337, §6.2 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440 and 1651, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c at 3715, item 4 at 3893–3901, with `exists_pos_laplaceBeltrami_eigenvalue_isLeast` at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534`; OperatorTheory PD-A51–A53, PA-B32, MAJ-A27; AffineMorseLefschetz §1.1 at 315; OptimalTransport Layer 6 at 2421. At open heads: K3Surfaces §2.1 (the equation `(ω+i∂∂̄φ)² = cV` with `∫φω² = 0`), ShimuraVarieties §7.0g, NumberFieldEnumeration §1.1 (Maclaurin's bound for nonnegative reals), ComplexComparisonPartII C5.4; the two open revisions of ComplexKahlerGeometry keep the labels K1, K2, K4, K5a, K6.0. `scratch/citations.md`: no citation and no Lean name found nowhere.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15, by the object searches above. No declaration name is involved.

Overlap check: read ComplexKahlerGeometry, PDE, Yamabe, RiemannianGeometry (main), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge (open), the third list being empty; shared objects: the Poincaré inequality (owner RiemannianGeometry R5c), the Ky Fan and eigenvalue variational inequalities and the Levi form (owner the pinned Tau Ceti, from OperatorTheory and AffineMorseLefschetz), the weak Harnack inequality for supersolutions (owner PDE §5.4, by the declared gap); nothing else shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited. K3Surfaces, ShimuraVarieties and NumberFieldEnumeration appear only in Scope and Downstream consumers, as statements this roadmap does not import.

### Headline theorems and padding

Headlines from the Summary: Lewis's theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: nothing to probe, no signature and no `#check` comparison.

### Copyright and arrangement

- Wording: 31 passages set beside their sources at the locators above (gpt2023 Theorems 1–2, Lemmas 2 and 4, the proof of Theorem 2 and the examples; spruck2005 Definition 2.1, Theorems 1.4, 2.2, 2.11, Propositions 2.3, 2.7, Corollaries 2.4, 2.8, Lemmas 1.5, 2.6, 2.10, 2.12; lewis1996 Theorems 1.1, 2.1, 2.4, Lemmas 2.2, 2.3; pss2012 Theorems 1, 3, 8, 9, §2.2 and (5.4); dinew-kolodziej2014 properties 1–3 and Proposition 1.7; guo-phong2024 conditions (1)–(4); szekelyhidi2018 §§1–2; tosatti-weinkove2010 line 104–106; twwy2015 line 132–136). What is shared is formulas and lists of constants that the statements force. No sentence or proof plan follows a source clause by clause.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7, all inside one layer of eight and in the order §2, §4, §3, §5; Layers 1–7 have no counterpart in it. The `*Needs:*` lines force 8.1, 8.2 → 8.3; 8.3 → 8.4; 8.3, 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 31 passages compared with 9 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread.
- lewis1996 and spruck2005 are OCR texts: the hypothesis line of lewis1996 Theorem 2.1 (line 154), the first line of Theorem 2.4 (line 200) and several displays of spruck2005 §2 are garbled. Those statements were recomputed, not read.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. Pinned declarations were read, not elaborated.
- The index-level signs of the terms in `Θ` and `Q` of Calabi's identity (§6.1) were compared with pss2012 (7.3)–(7.4) by reading; the computed torus instance has `T(0) = 0` and tests only the two squared terms.
- The open pull request that revises PDE carries a much shorter README than main's, without the labels C13, E23 and E25; `scratch/overlaps.md` reports no dropped id, and PDE is cited as it is on main. I did not establish how that branch relates to main.

## Source issues

Only what was read in this round is listed.

- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p. 9: the source says the closed-sublevel mass function is continuous; it should be the strict-sublevel function, which is right-continuous as its Lemma 2 requires; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p. 10: the source picks the starting level from Chebyshev's non-strict bound; it should note that the bound is strict for a continuous solution, since its Lemma 2 needs a strict inequality; affects the proof.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p. 17: the source allows equal indices in the quotient and names the cone of the larger index only; it should require the lower index strictly smaller and use the smaller of the two cones; affects a stated result.
- **Misprint** in spruck2005 at Proposition 2.7, printed page 290: the source states Newton's inequalities up to the top index, with equality only for equal components at every point; it should stop one index earlier and restrict the equality clause to the positive cone; affects a stated result.
- **Error** in spruck2005 at Corollary 2.4, printed page 289: the source says every symmetric polynomial hyperbolic in the all-ones direction has a cone containing the positive cone, with positive partial derivatives; it should assume the coordinate vectors lie in the closed cone; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1; `lewis1996` is read from an author page and `spruck2005` from an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "24dc55d52c379aef930103dd43b947020403c8dc", "job": "REV-DESIGN-ComplexHessianEquations~12", "model": "fable", "worker": "chris-x79"} -->
