<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6901283986 -->
Review (claude) of 8904f28

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.5 Check calls `σ_n` non-homogeneous

   **Location.** `packages/ComplexHessianEquations/design/README.md:201`: "For the non-homogeneous `f = σ_n` on `ℝ²` at `T = diag(1, 4)`, `tr(∇F·T) = 4 + 4 = 8 = 2·F(T)`, so the Euler identity carries the degree."

   **Claim.** `σ_n` on `ℝ²` is not homogeneous.

   **Witness.** `σ_2(rλ) = r²σ_2(λ)`: at `λ = (1, 4)`, `r = 2`, `σ_2(2, 8) = 16 = 2²·4`. It is homogeneous of degree two, and the Check's own value `8 = 2·F(T)` is Euler's identity for degree two.

   **Exact repair.** Write: "For `f = σ_n` on `ℝ²`, which is homogeneous of degree two and not of degree one, at `T = diag(1, 4)`, `tr(∇F·T) = 4 + 4 = 8 = 2·F(T)`: the Euler identity carries the degree, so the degree-one hypothesis is used." Tested on the instance: `∇F(T) = det(T)·T⁻¹ = diag(4, 1)`, `tr(diag(4, 1)·diag(1, 4)) = 8`, `F(T) = 4`, degree `2`.

2. **F02** (P3) §6.4 route: the size of `Q(T)`

   **Location.** `packages/ComplexHessianEquations/design/README.md:551`: "Calabi's identity of §6.1 gives `Δ_{ω_φ} S ≥ −C_1S − C_2`, since `Θ` is of order `1 + S^{1/2}` and `Q(T)` of order `S`".

   **Claim.** With `Θ` measured as a tensor (`1 + S^{1/2}`), `Q(T)` has size `S`.

   **Witness.** §6.1 defines `Q(T)(v) = [Ric(ω_φ)^♯, T(v)] − T(Ric(ω_φ)^♯v)`, linear in `T`: `Q(2T) = 2Q(T)` while `S(2T) = 4S`. For `n = 1`, `Q(T) = −r·T`, `|Q(T)|² = r²S`. Size `S` would make `⟨T, Q(T)⟩` of order `S^{3/2}`.

   **Exact repair.** Write: "since `Θ` is of order `1 + S^{1/2}` and `Q(T)`, which is linear in `T`, of order `S^{1/2}`, so that `2 Re⟨Θ, T⟩` is at least `−C(S + 1)` and `⟨T, Q(T)⟩` is of order `S`". Tested on the instance: `n = 1`, `Q(T) = −r·T` gives `⟨T, Q(T)⟩ = −r·S`, linear in `S`, and `(1 + S^{1/2})·S^{1/2} ≤ 2S + 1`, so `Δ_{ω_φ}S ≥ −C_1S − C_2` follows. The statement of §6.4 and plan target 6.4 need no change.

Two findings, both P3 (wording of one Check and of one proof-route sentence); no P1 or P2. Each carries a repair to apply, so the verdict asks for changes; nothing else stands in the way of acceptance. Both round-13 findings are repaired. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is precise, minimal and declared in both files, and is no finding. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and their repairs

| Round-13 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), workflow vocabulary in Scope | Line 15 now reads "No other roadmap owns any of these objects." The rest of the paragraph still names the owners (RiemannianGeometry R5c, the pinned Tau Ceti declarations, K3Surfaces §2.1, ComplexComparisonPartII C5.4, OptimalTransport Layer 6). | Repaired |
| F02 (P3), §8.6 locator after a claim its lines do not make | Line 698: "gpt2023 (line 442–457) makes the same reduction but bounds the energy through Hölder's inequality with the exponent `n/(n−1)`, which is undefined at `n = 1`; applying §8.5(c) at `N = 1` directly needs no Hölder step and covers every `n ≥ 1`." gpt2023 line 455 has that Hölder step; line 443–447 the reduction. | Repaired |

Pattern search. Process vocabulary: a search of the README for pull-request numbers, "so far", "checkpoint", "handoff", "round", machine paths, "optional", "deferred", "for later", LaTeX delimiters and HTML anchors finds nothing. A locator after a claim the source does not make: the other sentences where the README departs from a source (§1.4 "the routes below need neither the cone…", §2.2 on spruck2005 Corollary 2.4, §2.5 on the quotient cone, §5.4 and §7.2 "needs neither closedness of `ω̂` nor the Kähler condition", §8.3 on the closed sublevel function, §8.7 "implicit in gpt2023") each say what the source states and what the README adds; none attributes the addition to the cited lines.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜` and for every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem for every `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data (no Lean file), no copied passage.
- No second copy and no re-plan: main has no `ComplexHessianEquations` folder; `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Counts: 35 numbered subsections, 35 `*Needs:*` lines, 35 `**Checks.**` blocks, 8 `### Examples`, 8 `### Dependencies`. The README attributes no Lean name to this roadmap.
- Plan: parses; 47 targets (34 theorems, 12 definitions, 1 example); no `target:` prerequisite points forward; every definition has at least three tests; every target has a locator; one gap with `supplier` PDE, `section` §5.4 (E23) and a one-statement `needs`, the slug the same as README line 99.
- Manifest: 19 entries (11 certified, 8 uncertified and settled), one per work of the References; unchanged by this review; no text was missing, so no `needs-references.toml` was written.
- Declared gap. Precise: one inequality with `m ≥ 1`, `r > 0`, `q` finite, `q ≥ 1`, `q > m/2`, `u ∈ H¹`, `u ≥ 0` a.e., the essential infimum, `C(m, q, λ, Λ)`. Recomputed control at `m = 1`: `u_ε'' = ε²(x² + ε²)^{−3/2}`, `∫_{−4}^{4} f_ε = [x(x² + ε²)^{−1/2}] → 2`, `‖u_ε‖_{L¹(−2,2)} → ∫|x| = 4`, `inf = 0`. Minimal: the pinned `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`) is the homogeneous case. Not a finding.

### Adversarial table

All values were computed in this round. Rows cover the fifteen sampled targets, the headline theorems, the two repaired passages and the targets of R01–R02.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 (sampled) | weighted inner product on `ℂ²`; change of inner product; `λ[−a]` | `g⁻¹a = diag(1, 3)`, `λ = (3, 1)` against Euclidean `(3, 2)`; `⟨u, P⁻¹A v⟩' = ⟨u, A v⟩`; `−(3, 1)` reversed is `(−1, −3)` | Holds |
| §1.2 | `F = diag(2, 1)`, `B = diag(0, 3)`; `κ_2` at `diag(3, 1, 1)` | lower `2·0 + 1·3 = 3 = tr(FB)`, upper `6`; eigenvalues `3, 1 + t, 1 − t`, `κ_2 = 4 + abs(t)`; `tr(PT) = Σ λ_j‖Pe_j‖²` | Holds |
| §1.3 Lewis (headline) | Abel summation of `Σ c_iλ_i` with `c` constant on clusters | `Σ_m (c_m − c_{m+1})κ_m`, nonzero only at gaps; `det(T)·T⁻¹ = [[2, −1], [−1, 2]]` at `[[2, 1], [1, 2]]` | Holds |
| §1.4 (sampled, headline) | concavity chain; monotonicity; strictness; shifted quadrant | `tr(∇F(S)T) ≥ Σ ∂_if(λ(S))λ_i(T)` (decreasing against increasing), so `dF(S)(T − S) ≥ f(λ(T)) − f(λ(S))`; `λ(T) = λ(S) + d`, `d ≥ 0`; `λ(S) = λ(T)` gives `tr(T − S) = 0`, `T = S`; `log(1/2) + log 2 = 0 < 2 log(5/4)`; `−σ_1`: `−1 > −2` | Holds |
| §1.5 | `σ_2^{1/2}` at `diag(1, 4)`; `σ_2` | `∇F = diag(1, 1/4)`, `det = 1/4`, `tr = 2 = F`; `tr(diag(4, 1)·diag(1, 4)) = 8 = 2·4`, degree `2` | Statement holds; Check wording: R01 |
| §2.1 | `(1, 2, 3)`; shift `n = 3`, `k = 2`; `(2, 2, −1)`; index sets | `S = (2, 11/3, 6)`, `12 ≤ 121/9`; `3t² + 2σ_1t + σ_2`, `12 = 12` at `e`, `t = 1`; `σ_2 = 4 − 2 − 2 = 0`; `18/11 ≤ 11/6`, `√3 ≤ 1.915`, `(2, 0, 2, 1)`: `1.915 ≤ 1.833` false | Holds |
| §2.2 Gårding (headline) | `p = 2xy − 0.9(x² + y²)`; `p_c`; derivative route | `p(x + te) = 0.2t² + 0.2(x_1 + x_2)t + p(x)`, discriminant `0.76(x_1 − x_2)²`; cone ratio roots `(2 ± 0.8718)/1.8 = 0.627, 1.595`; `p(1, 0.1) = −0.709`, roots `1.41, −2.51`; `p(1, 0.7) = 0.059`, roots `−0.196, −1.504`, `∂_xp = −0.4`; `p_19/20 = p`; `c = 1/4`: `∂_1p_c > x_1 + x_2` | Holds |
| §2.3 (sampled) | `σ_2/σ_1`; tangent at `λ = (1, 4)`, `μ = (4, 1)`; `σ_k^{1/k}` form | `0.8, 0.8`, midpoint `1.25`; `∂g(1, 4) = (1, 1/4)`, `4 + 1/4 = 4.25 ≥ 2`; `∂_ig = (1/k)σ_k^{1/k−1}σ_{k−1;i}` gives `Σ μ_iσ_{k−1;i}(λ) ≥ kσ_k(μ)^{1/k}σ_k(λ)^{(k−1)/k}` | Holds |
| §2.4 (sampled) | Lemma 4 with `μ_i = (∏∂_jf)^{1/n}/∂_if`; `σ_1 − ε·norm(λ)`; wedge cone; infinite intersection | `nγ^{1/n} ≤ f(μ) ≤ n(∏∂_jf)^{1/n}`; value `δ − ε√(1 + (1 − δ)²) < 0`; `(1, −0.4) + (0.01, 0.25) = (1.01, −0.15)` outside; intersection `{λ_i ≥ 0, λ ≠ 0}` not open at `(1, 0)` | Holds |
| §2.5 (headline) | Hessian constant by Maclaurin; `n = 3`, `k = 2` at `e`; `σ_2/σ_1` at `(M, 1, 1)` and `n = 2` | `σ_k^{1/k} ≥ binom(n, k)^{1/k}(∏μ)^{1/n}`, so `γ = (binom^{1/k}/n)^n`; `3^{−1/2} = √3/3`; `∂_1 = 3/(M + 2)²`, `∂_2 = (M² + M + 1)/(M + 2)²`; `λ_1²λ_2²/(λ_1 + λ_2)⁴ = 1/16` at `e` | Holds |
| §3.1 | `x_1²`; composition rule at `γ(s) = s²`, `u = x` | `(1/2)(D²u(J∂_x, ∂_y) − D²u(∂_x, J∂_y)) = (1/2)(0 + 2) = 1`; `γ''·2·abs(∂u(∂_x))² = 2·2·(1/4) = 1` | Holds |
| §3.3 (sampled) | Hessian constant; `χ = ω`, `F = 0`; `ℂP¹`, `χ = 2ω` | `χ_φ^k ∧ ω^{n−k} = binom⁻¹c^ke^{kF}ω^n`, so `c^k = binom·∫χ^k ∧ ω^{n−k}/∫e^{kF}ω^n`; `c = binom^{1/k}`; `c·1 = ∫χ = 2` | Holds |
| §4.2 (headline) | maximum and minimum; `ψ = −abs(z)²/4`; wedge pair | `c'e^F ≤ ce^F` and the reverse; `λ = 1 − 1/2 = 1/2`; `f(1, −0.4) = 6 > f(1.01, 0.1) = 1.11` | Holds |
| §5.1, §5.2, §5.3 | conformal `n = 2`; Schauder Check; torus Poincaré | `Δ_g = e^{−ρ}(Δ_0 + ⟨∇ρ, ∇·⟩)`, difference `−e^{−x_1}`; quotient `8π²·2^α`, `[cos 2πj·]_α ≤ 2(πj)^α`, `C ≥ 4·2^α/((1 + 2π^α)ε)`; `1/2 = 2π²/4π²` | Holds |
| §6.1 (sampled) | `ℂP¹`; torus `q = 1 − a cos 2πx` at `0` and `1/4`; `ω_φ = sω` | `R_{1̄1} = 2g_{1̄1}`; `S = (2/q)(q'/2q)² = q'²/(2q³)`; at `0`: `q''/(2q) = 2π²a/(1 − a) = (1/2)(log q)''`; at `1/4`: `−2π²a² + 2π²a² = 0`; `Δ_{ω_φ}S(0) = q''²/(2q⁴) = 8π⁴a²/(1 − a)⁴ = 2·(2/q)²(q''/4q)²`; `0 = −s_ω + s_ω` | Holds |
| §6.2 (sampled) | identity at exponent `0`; torus `ℂ²/ℤ⁴`, `ε = 1/(4π²)` | `∫ψ(e^F − 1)ω^n = ∫i∂ψ ∧ ∂̄ψ ∧ Σ ≥ (1/n)∫abs(∂ψ)²ω^n`; `i∂∂̄φ = −2π²ε cos·dx_1 ∧ dy_1`, `q = 1/2` and `3/2`; `∫(sup φ − φ)ω² = 2ε`, `∫ω² = 2`, `ψ̄ = 1 + ε` | Holds |
| §6.3 (sampled) | maximum of `log tr h − Aφ`; `λ = (4, 1/4)` | `Δ'(log tr h − Aφ) ≥ (A − C_1 − Λ)tr h⁻¹ − An − C_2`; `K ≥ −Λ Σλ_j Σλ_p⁻¹`; `4/17 ≤ 17/4` | Holds |
| §6.4 (sampled) | torus; sizes of `Θ`, `Q(T)` | `∂_{z_1}h_{11} = q'/2 = 2π³ε sin 2πx_1`; `Q(2T) = 2Q(T)`, `S(2T) = 4S` | Statement holds; route wording: R02 |
| §6.5 (sampled) | `n = 1` torus; regularity count | `φ = (a/2π²)(cos 2πx − 1)`, `Δ_ωφ = −a cos 2πx`, `osc = a/π²`; `φ ∈ C^{k+2,α}`, `F ∈ C^{k+1,α}` give `φ ∈ C^{k+3,α}`, within `m = max(3, k + 1)` | Holds |
| §6.6 Yau (sampled, headline) | pair form; path constants; openness map; Bessel | `e^b = ∫χ^n/∫e^{nF}ω_X^n = ∫χ^n/V`; `abs(b_t) ≤ t·sup abs(F)`; derivative `(u, β') ↦ Δ_{ω_φ}u − β'`; `−log I_0(ε) = −ε²/4 + O(ε⁴)` | Holds |
| §7.1 (sampled) | Jensen mass bound; Green bound; integral; polar formula at `g = 1`; point mass; recentred logarithm; `ℝ⁴` control | `M·log(R/R')/2π ≤ A`; `abs(R'² − tw̄) ≤ 2R'²`; `∫_{D(w,2R')}(2R'/abs(t − w))^s = 2π(2R')²/(2 − s)`; both sides `vol(S^{2n−1})ρ^{2n}/(2n)`; `α_1 = log(8/7)/log 4 = 0.096`; `α_1c = log(4/3)/log 4 = 0.21`; `Δ = (s + 4ε)(s + ε)^{−5/2}`, radial eigenvalue `(1/4)(2ε − s)(s + ε)^{−5/2}` | Holds |
| §7.2 (sampled, headline) | `u = ψ − sup ψ + A·abs(z)² − 4A` on `B(0, 2)` | `u ≤ 0`, `e^{−α(ψ − sup ψ)} ≤ e^{−αu}`; `∫(abs(z)² + ε)^{−α}` bounded in `ε` iff `α < 1` | Holds |
| §8.2 (sampled) | `s_0 = 0`; `(1/4)·1_{[0,1/4)}`; `e^{−s}`, `δ_0 = 0`; conclusion at `s = S_∞` | hypothesis extends to `s = 0` by right-continuity; `r/4 < 1/16`; step `r < 2B_0φ(s_j)^{δ_0} < 2^{−jδ_0}`, sum `1/(1 − 2^{−δ_0})`; `re^{−r} ≤ 1/e`; `φ(S_∞) = lim φ(s) = 0` | Holds |
| §8.3 (headline) | strictness at `s_0`; `Ē = 0`; the `C¹` pair | `s_0Φ(s_0) < Ē`; `Ē = 0` forces `Φ(0) = 0`; `∂_jf ≥ 1 − δ(3/2 + 1/2) = 1 − 2δ` | Holds |
| §8.5 (sampled) | Jensen step for (c); `N ≤ 1`; torus `n = 3` | `c∫(−φ)^Ndμ ≤ log(C/V) + n∫F dμ`; `(−φ)^N ≤ 1 + (−φ)^{N'}`; `(1/3)·0.03²/4 = 7.5·10⁻⁵` against `(1/27)·0.03³·4/(3π) = 4.24·10⁻⁷` | Holds |
| §8.6 (repaired, headline) | `n = 1` | `p' = n = 1` allows `N = 1`; `c_1 = 1`, `V_1 = V`; `Ent_n ≤ 1 + Ent_p`; source exponent `n/(n − 1) = 1/0` | Holds |
| §8.7 (headline) | entropy bound, both two-valued `F`; exponents | `(2/e)² = 0.5413`; `Ent_2 = (0.4122 + 0.3845)/2 = 0.398 ≤ 0.5413·2.421 = 1.310`; `0.4872 + 4.1457 = 4.633 > 0.5413·7.7288 = 4.184`, full `4.725`; `q' = n/(n − k)` gives `q = n/k` | Holds |
| Scope sentence (repaired) | owners named in the paragraph against the list of owned objects | none of the six named objects is in the owned list | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators in this round.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 1.4 | spruck2005 line 11066–11100 (Theorem 1.4, Lemma 1.5 and the concavity proof). Supported; the README's weaker hypotheses are stated as its own. |
| 2.3 | spruck2005 line 11295, 11303–11320, 11347–11348, 11364–11365; gpt2023 line 751–756; dinew-kolodziej2014 line 165–172. Supported. |
| 2.4 | guo-phong2024 line 76–80, 83–90, 103–104; gpt2023 line 71–76, 84–86, 744–769; szekelyhidi2018 line 29–31, 183–185; spruck2005 line 11314. Supported. |
| 3.3 | gpt2023 line 66–70, 107–111, 974–981; guo-phong2024 line 108–113; tosatti-weinkove2010 line 21–31; dinew-kolodziej2014 line 56–64. Supported, with the normalization of the Conventions. |
| 6.1 | pss2012 line 163–164, 837–840, 994–1016, 1046–1064. Supported. |
| 6.2 | pss2012 line 245–308; tosatti-weinkove2010 line 104–106. Supported. |
| 6.3 | pss2012 line 981–990, 994–1031. Supported. |
| 6.4 | pss2012 line 1067–1081; twwy2015 line 132–135. Statement supported; route wording: R02. |
| 6.5 | twwy2015 line 134–136; tosatti-weinkove2010 line 93–99. Supported. |
| 6.6 | tosatti-weinkove2010 line 36–59; pss2012 line 170–179, 216–233. Supported. |
| 7.1 | demailly2012 line 1534, 1717–1731 (printed p. 37); pss2012 line 2943–2945; gpt2023 line 287–289. Supported. |
| 7.2 | pss2012 line 2946–2955; gpt2023 line 280–289. Supported. |
| 8.2 | gpt2023 line 412–426. Supported; the explicit threshold is the one in the source's proof. |
| 8.5 | gpt2023 line 458–529, 687–700, 725–736. Supported; the additive `1` in the signed-moment bound corrects the source (Source issues). |

Also read: gpt2023 line 82–135, 404–457, 855–985 (Theorems 1, 2, 5, Lemmas 7–8), for §§8.3, 8.6, 8.7. Each supports the statement it is cited for.

### Pins, duplication and suppliers

- Pins: `lake-manifest.json` has Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, as README lines 44 and 56 say.
- Declarations opened at the pins this round. Tau Ceti: `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `HoffmanWielandt/Basic.lean:78`; `KyFan.lean:99`, `489`; `Harmonic/MeanValue/Basic.lean:464`; `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`2 < finrank ℝ E`, compact); `Analysis/Complex/LeviForm.lean:142`, `150`, `270`; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Analysis/Complex/Wirtinger/LeviForm.lean:79`; `Geometry/Manifold/Complex/LeviForm.lean:106`, `156`, `165`, `172`, `179`, `206`, `241`, `292`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231`; `Geometry/Manifold/TwoForm/Basic.lean:37`; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `Analysis/MeanInequalities.lean:68`; `Analysis/Matrix/MinkowskiDeterminant.lean:159`; `Analysis/PDE/Regularity/Harnack.lean:284`. Mathlib: `Analysis/InnerProductSpace/Spectrum.lean:277`, `297`, `309`, `314`, `384`; `Analysis/Matrix/Spectrum.lean:67`, `143`, `193`, `240`; `RingTheory/MvPolynomial/Symmetric/Defs.lean:69`; `Analysis/Calculus/LocalExtr/Polynomial.lean:64`; `Analysis/MeanInequalities.lean:129`; `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`; `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:22`; `Analysis/Calculus/Implicit.lean:30`. Each exists where the README cites it. No non-strict plurisubharmonicity predicate was found at the pin, as the README says.
- Supplier sections on main: PDE §3.2 (C13) at line 1344, with the Aleksandrov–Bakelman–Pucci statement at 1403–1408 as the contract states it; §5.4 (E23) 1965; §5.6 (E25) 2097; PseudodifferentialOperators §5.4 1337, §6.2 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a 1440 and 1651, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3893–3901, `exists_pos_laplaceBeltrami_eigenvalue_isLeast` at `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534`; OperatorTheory PD-A51–A53 (`PolarDecomposition/README.md:254–260`), PA-B32, MAJ-A27 (`Majorization/README.md:176`); AffineMorseLefschetz §1.1 at 315; OptimalTransport Layer 6 at 2421.
- At open heads: K3Surfaces §2.1 (line 528: the equation `(ω+i∂∂̄φ)² = cV` with `∫φω² = 0`, its own estimates); ShimuraVarieties §7.0g (line 1993); NumberFieldEnumeration §1.1 (Maclaurin's bound for nonnegative reals, line 195); ComplexComparisonPartII C5.4 (positive currents and regularization, line 3760–3773). All four appear only in Scope and Downstream consumers. `scratch/citations.md`: nothing found nowhere.
- By object, `roadmaps grep -i --readme-only` for "complex hessian", "Gårding cone", "hyperbolic polynomial", "Calabi conjecture", "quasi-plurisubharmonic": one match, a strictly plurisubharmonic exhaustion in ComplexComparisonPartII, a different object. Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15.

Overlap check: read ComplexKahlerGeometry, PDE, Yamabe, RiemannianGeometry (main), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge (open), the third list being empty; shared objects: the Poincaré inequality on a closed manifold (owner RiemannianGeometry R5c), the eigenvalue variational inequalities and the Levi form (owner the pinned Tau Ceti), the strong maximum principle, the Aleksandrov–Bakelman–Pucci and interior Schauder estimates (owner PDE §§3.2, 5.6), the weak Harnack inequality for supersolutions (owner PDE §5.4, by the declared gap); ManifoldOptimization's eigenvalue statements are Rayleigh-quotient optimization, YangMills §1.5 is the Poincaré inequality on balls and Yamabe's estimates are for its conformal Laplacian, different objects; nothing else shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited.

### Headline theorems and padding

Headlines from the Summary: Lewis's theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, Hessian quotients and structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: no probe, no signature and no `#check` comparison.

### Copyright and arrangement

- Wording: 30 passages set beside their sources at the locators above (gpt2023 Theorems 1, 2, 3, 5 and Lemmas 2, 4, 7, 8; pss2012 Theorems 1, 3, 8, 9, 31, §2.2 and (6.2)–(6.9), (7.5)–(7.7); spruck2005 Theorems 1.4, 2.11, 2.16, Lemmas 1.5, 2.12, Proposition 2.15; guo-phong2024 conditions (1)–(4); szekelyhidi2018 introduction; tosatti-weinkove2010 Corollary 1 and the first paragraph of §2; dinew-kolodziej2014 properties 1–3; twwy2015 line 75–77, 132–136; demailly2012 Proposition 4.22). What is shared is formulas and hypothesis lists the statements force; no sentence or proof plan follows a source clause by clause.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §4 ↔ §8.4 and one bullet of §2.4, §3 ↔ §§8.5–8.6, §5 ↔ §8.7, in the order §2, §4, §3, §5 and inside one layer of eight; Layers 1–7 have no counterpart. The `*Needs:*` lines force 8.1, 8.2 → 8.3 → 8.4; 8.3, 8.5 → 8.6; 8.3, 8.4 → 8.7.
- Reuse: no table, figure, list of examples or numerical data is taken over.

Source independence: 30 passages compared with 10 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread.
- spruck2005 is an OCR text: several displays at line 11076–11078, 11090–11091, 11307–11312 and 11350–11362 are garbled. Those statements were recomputed, not read.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. Pinned declarations were read, not elaborated.
- The index-level signs of `Θ` and `Q` in Calabi's identity (§6.1) were compared with pss2012 (7.3)–(7.4) by reading; the computed torus instance has `T(0) = 0` and tests only the two squared terms.
- The sections outside the sample that were not reread against their sources this round (§§1.3, 2.1–2.2, 2.5, 3.2, 5.4, 8.1, 8.4: lewis1996, spruck2005 §2 before Theorem 2.11, guedj-zeriahi2005, gpt2023 Lemmas 1, 5, 6) rest on the round-13 source table; their statements were recomputed above.

## Source issues

- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p. 9: the source says the closed-sublevel mass function is continuous; it should be the strict-sublevel function, which is right-continuous as its Lemma 2 requires; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 1, (3.3), arXiv v1 p. 11: the source bounds the energy by Hölder's inequality with an exponent undefined in dimension one; it should apply its Theorem 3(c) with first power directly there; affects the proof.
- **Error** in gpt2023 at the end of the proof of Theorem 3, arXiv v1 p. 16: the source bounds the signed first moment of the density by the entropy of order p alone; it should add one, since small values of the exponent contribute; affects the proof.
- **Gap** in gpt2023 at Lemma 3, arXiv v1 p. 12: the source says its exponent is the reciprocal of the power and lies strictly between zero and one, so powers at most one are not covered; it should derive them from larger powers; affects the proof.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p. 17: the source allows equal indices in the quotient and names the cone of one index only; it should require the lower index strictly smaller and use the smaller cone; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1; `lewis1996` is read from an author page and `spruck2005` from an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8904f2815ef33a7c9f9c4d89efc8c5df48aece50", "job": "REV-DESIGN-ComplexHessianEquations~14", "model": "fable", "worker": "chris-x52"} -->
