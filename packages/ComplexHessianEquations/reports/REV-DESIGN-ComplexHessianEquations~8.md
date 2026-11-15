<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6897269160 -->
Review (claude) of d640bc2

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two Checks of §8.2 never meet the smallness hypothesis of the lemma

   **Location.** `packages/ComplexHessianEquations/design/README.md:651` and `:653`: "`φ = 1_{[0,1)}` satisfies the hypothesis with `B_0 = 1` and vanishes from `s = 1`" and "`δ_0 = 0` is excluded: `φ(s) = e^{−s}` satisfies `rφ(s + r) ≤ φ(s)` with `B_0 = 1`". Plan target 8.2, tests `deGiorgi_indicator` and `deGiorgi_delta_zero`.

   **Claim.** The Checks test the lemma, and the third shows that `δ_0 > 0` is needed.

   **Witness.** With `B_0 = 1` the lemma requires `φ(s_0)^{δ_0} < 1/2`. For `1_{[0,1)}` this forces `φ(s_0) = 0`; for `e^{−s}` at `δ_0 = 0` it reads `1 < 1/2`. Neither Check reaches the conclusion, so a wrong threshold passes both.

   **Exact repair.** Replace the first Check by: "`φ = (1/4)·1_{[0,1/4)}` with `B_0 = δ_0 = 1`: for `s < 1/4` and `s + r < 1/4`, `r/4 ≤ 1/16` since `r < 1/4`; `φ(0) = 1/4 < 1/(2B_0) = 1/2`; the lemma gives `φ = 0` from `s = 0 + 1/(1 − 1/2) = 2`, and `φ` vanishes from `1/4`." Replace the third by: "`δ_0 = 0` is excluded: `φ(s) = e^{−s}` satisfies `rφ(s + r) ≤ B_0·φ(s)` with `B_0 = 1/e`, since `re^{−r} ≤ 1/e`, and `φ(s_0)^0 = 1 < 1/(2B_0) = e/2` at every `s_0`; yet `φ` never vanishes, and the threshold `1/(1 − 2^0)` is undefined." The plan's two tests follow. Tested: `max_r re^{−r} = 0.3679 = 1/e` at `r = 1`; `e/2 = 1.359 > 1`.

2. **F02** (P3) §6.6: the path's right-hand side is `tF + b_t`, not `tF`

   **Location.** `packages/ComplexHessianEquations/design/README.md:574`: "It is closed by §§6.2–6.5, whose constants are uniform in `t` since `‖tF‖ ≤ ‖F‖` in every norm".

   **Claim.** The estimates of §§6.2–6.5 apply along the path with constants controlled by `‖tF‖`.

   **Witness.** The map `(φ, β) ↦ log(ω_φ^n/ω^n) − β` of the same paragraph solves `ω_φ^n = e^{tF + β_t} ω^n`; §§6.2–6.5 take the whole exponent as their `F`. For `F = a` constant, `tF = ta` while the exponent is `0`.

   **Exact repair.** Write: "It is closed by §§6.2–6.5 applied to the exponent `tF + b_t` of the path, `b_t = log(∫ ω^n/∫ e^{tF} ω^n)`; their constants are uniform in `t`, since `|b_t| ≤ t·sup|F|` gives `‖tF + b_t‖_{C^k} ≤ 2‖F‖_{C^k}` for every `k`, the derivatives being those of `tF`". Tested: `F = a` gives `b_t = −ta`, exponent `0`; torus, `n = 1`, `F = ε cos 2πx` gives `b_t = −log I_0(tε)`, and `1 ≤ I_0(tε) ≤ e^{tε}`, so `|b_t| ≤ tε`.

Two findings, both P3: neither is blocking, but each carries a repair, so a fix round applies them before the design goes on. Both round-7 findings are repaired, and every repaired or added statement holds on the instances computed below. The declared gap `gap:weak-harnack-supersolutions` (PDE §5.4, E23) is precise, minimal and declared in both files; it is no finding. This is a design review: there is no `Suggested.lean`, and no Lean command was run (elaboration: not available, this lane does not elaborate).

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md`.

| Round-7 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01 (P3), range of `k` and the case `k = n` in §8.7 | Line 710: "for a fixed `k` with `1 ≤ k ≤ n`, if `λ[ω_{t,φ_t}] ∈ Γ_k` for all `t` and `q > n/k`" and "For `k = n`, `q' < ∞` is arbitrary, and the bound for `‖φ_t‖_{L^{q'}}` is §7.2 with `ω̂ = a_0ω_X`"; line 712 lists §§3.4, 7.2. gpt2023 line 948–952 read: `1 ≤ k ≤ n`, `q > n/k`. The added entropy bound is recomputed in the table. Plan 8.7 carries `target:7.2`, `target:3.4.1`, `target:3.4.2` and four tests. | Repaired |
| F02 (P3), locators of §§5.1, 5.2 | Line 449: "(demailly2012 Corollary VI.6.5, line 15190–15191, p. 306 … twwy2015 line 75–77 … pss2012 line 871–875 …)"; line 459: "(pss2012 §2.2, line 229–231, which obtains openness along the continuity path from the implicit function theorem …)" and "(gilbarg-trudinger2001 Theorem 6.2, consumed as PDE §5.6 (E25))". All four certified passages read: demailly2012 line 15190–15191 is the Kähler identity for the three Laplacians on printed p. 306; twwy2015 line 77 the trace formula; pss2012 line 875 the trace of `h`; pss2012 line 229–231 the openness step. | Repaired |

Patterns searched in the rest of the design. F01 (a parameter range left open): §§3.2 and 3.3 now state `0 ≤ k ≤ n`, `1 ≤ k ≤ n` and `1 ≤ j ≤ k` (recomputed below); §§2.1, 2.2, 2.4, 2.5, 8.5 state theirs; none open. F02 (a subsection without a source id): all 35 numbered subsections name one. F01 (a route silent on a step) recurs once, mildly: R02.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜`, hyperbolic polynomials of every positive degree, every admissible pair; Layers 3–4 need no Kähler hypothesis; Yau's theorem for `n ≥ 1`. No algorithm, no `set_option`, no sorry'd data, no copied passage.
- Not a re-plan: no ComplexHessianEquations folder on main (head `1a19c9f`), none in the open-pull-request list (240 lines, searched by name) or as a second board package; `scratch/overlaps.md` reports no second copy, no other pull request changing it, no dropped id.
- Organisation: eight layers named by their mathematics; no sentence says the roadmap follows a source.
- Shape: every layer ends with `### Examples` and `### Dependencies`; all 35 subsections carry a `*Needs:*` line and a locator; each definition has at least three Checks (§1.1: 7, §1.2: 3, §1.3: 3, §2.2: 10, §2.4: 7, §3.1: 4, §3.3: 3, §3.4: 4). A search for LaTeX delimiters, pull-request numbers, machine paths and process words finds nothing. The README advertises no Lean name of its own.
- Plan: 47 targets in 8 layers, every `target:` prerequisite points backwards, every target has a locator, one gap. The manifest has 19 entries (11 certified, 8 uncertified), one per work in the References, no local path.
- Declared gap `gap:weak-harnack-supersolutions`: same slug at README line 99 and in the plan's `gaps`, supplier PDE §5.4 (E23). On main that section (`TauCetiRoadmap/PDE/README.md:1965`, text at 1997–2002) plans the weak Harnack inequality for weak solutions of the homogeneous equation; the pin has the homogeneous supersolution case (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`). The supersolution form with a forcing term is in neither, so the gap asks for nothing already provided; its `needs` is one statement with its hypotheses. Not a finding.

### Adversarial table

Rows cover the fifteen sampled targets, the headline theorems, every passage the round-8 repair changed, and the two findings. Rows of rounds 6–7 with computed values whose text is unchanged (§§2.2, 2.3, 6.1, 6.4, 8.1) are relied on; §§5.4, 7.1 and 7.2 were recomputed although unchanged.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 relative eigenvalues | `⟨u,v⟩ = 2ū₁v₁ + ū₂v₂`, `a = diag(2,3)`; `−a`; `diag(1,0) + diag(0,1)` | `g⁻¹a = diag(1,3)`, `λ = (3,1)` against Euclidean `(3,2)`; `(−1,−3)`; `(1,1)` against `(2,0)` | Holds |
| §1.2 trace bounds, Ky Fan derivative | `F = diag(2,1)`, `B = diag(0,3)`; `T = diag(3,1,1)`, `m = 2`; uniqueness of the maximiser | lower `2·0 + 1·3 = 3 = tr(FB)`, upper `2·3 + 0 = 6`; eigenvalues `3, 1 ± t`, `κ_2 = 4 + |t|`; `Σλ_jc_j` with `0 ≤ c_j ≤ 1`, `Σc_j = m` is maximal only at `c = (1,…,1,0,…,0)` under the gap | Holds |
| §1.3 Lewis's formula | `σ_2` at `[[2,1],[1,2]]`; `λ_1(Id + t·diag(1,0))` | `det·T⁻¹ = [[2,−1],[−1,2]]` against `diag(1,3)`; `1 + max(t,0)` | Holds |
| §1.4 convexity, concavity, monotonicity | wedge cone; `λ(S) = λ(T)`, `S ≤ T`; `f = −σ_1` | `(1,−0.4)`, `(1,0.1)` in, midpoint `(1,−0.15)` out; `tr(T − S) = 0` forces `S = T`; `−1 > −2` | Holds |
| §2.1, §2.5 | `(1,2,3)`; Hessian constant at `e` | `S = (2, 11/3, 6)`, `12 ≤ 121/9`; `(1/k)·binom(n,k)^{1/k−1}·binom(n−1,k−1) = binom(n,k)^{1/k}/n`; quotient at `(M,1,1)`: `∂_1 = 3/(M+2)²`, `∂_2 = (M²+M+1)/(M+2)²` | Holds |
| §2.4 structural constant | `μ_j = (∏∂_if)^{1/n}/∂_jf` | `∏μ_j = 1`, `nγ^{1/n} ≤ f(μ) ≤ Σμ_j∂_jf = n(∏∂_jf)^{1/n}` | Holds |
| Conventions, §3.1 `i∂∂̄`, `H = 2L` | `x_1²` on `(∂_x, ∂_y)`; `|z|²`; `i∂u ∧ ∂̄u` | `(1/2)(D²u(∂_y,∂_y) + D²u(∂_x,∂_x)) = 1 = dx∧dy(∂_x,∂_y)`; `L = h`, `λ = 2e`; coefficient `u_ju_k̄` gives `H(v,w) = 2·conj(∂u(v))·∂u(w)` | Holds |
| §3.2 form identities (ranges changed) | `k = 0`; `k = n = 2`; mixed at `k = 1`; Maclaurin form `λ = (4,1)`, `k = 1`; `M_k(α,β,…,β)` | `ω^n = ω^n`; `α² = λ_1λ_2ω²`; `α∧ω^{n−1} = (σ_1/n)ω^n`, equality; `5/2 ≥ 2`; `D(σ_k∘λ)(β)(α) = k·M_k` | Holds |
| §3.3 equation and constants (range changed) | `χ = ω`, `F = 0`; Hessian form; `ℂP¹`, `χ = 2ω` | `c = 1`, `binom(n,k)^{1/k}`, `n`; `χ_φ^k∧ω^{n−k} = binom(n,k)⁻¹σ_kω^n`, so Kähler `c^k = binom(n,k)∫χ^k∧ω^{n−k}/∫e^{kF}ω^n`, which is `binom(n,k)` at `χ = ω`, `F = 0`; `c·1 = 2` | Holds |
| §3.4 energy, entropy | `χ = ω_X` Monge–Ampère; `F = a`; `q ≤ p` | `c_t^n/V_t = (1+t)^n/((1+t)^nV)`; `e^{na} ≤ e^{na}|a|^p + e^n`; `|F|^q ≤ 1 + |F|^p` with mass `1` | Holds |
| §4.2 uniqueness | max and min of `ψ − φ`; wedge pair; two components | `c' ≤ c ≤ c'`; `f(1,−0.4) = 10·0.6 = 6 > f(1.01,0.1) = 1.11`; `ψ = (0,−1)` | Holds |
| §5.1 Kähler Laplacian (locators added) | `u = |z|²` on `ℂ`; `cos 2πx` on the torus | `Δ_ω u = 2u_{zz̄} = 2`, Euclidean `4`, `Δ_d = −4 = −2Δ_ω`; `∫uΔ_ωu = −π² = −∫|∂u|²` with `g^{11̄} = 2`, `|u_z|² = π² sin²` | Holds |
| §5.2 Hölder invertibility | `cos 2πx`; the map `(u,β)` | `Δ_ω⁻¹cos = −cos/(2π²)`; `β = −mean_{ω'}(v)`, `u` fixed by `∫uω^n = 0` | Holds |
| §5.4 `L¹` bounds | divergence form; `ℂP¹`, `ψ_ε` | `∂_i(√g g^{ij}∂_ju) = 2√gΔ_ωu ≤ 2A√g` for `u = −φ`; `ω' + i∂∂̄ψ_ε = i∂∂̄log(|z|²+ε) ≥ 0`, `sup = 0` at `∞` | Holds |
| §6.3 `C²` estimate | maximum of `log tr h − Aφ`; `λ = (4,1/4)`; `n = 1` | `Δ'φ = n − tr h⁻¹`, so `0 ≥ (A − C_1 − Λ)tr h⁻¹ − An`; `4/17 ≤ 17/4`; `tr h = e^F` | Holds; dependence as pss2012 Theorem 8 |
| §6.5 regularity | `n = 1` torus, `e^F = 1 − a cos 2πx`; exponent count | `φ = (a/2π²)(cos 2πx − 1)`, `osc = a/π²`; `φ ∈ C^{k+2,α}` needs `F ∈ C^{max(3,k),α}`, so `m = max(3, k+1)` suffices | Holds |
| §6.6 Yau | `F = a`; torus `F = ε cos 2πx`; pair form; path | `b = −a`; `b = −log I_0(ε)`; `c^n = ∫χ^n/V`; exponent `tF + b_t` | Holds; R02 |
| §7.1 local estimate | Jensen and Green bounds; polar formula at `g = 1`; radii | `M ≤ 2πA/log(R/R')`; `∫_{D(0,r)}(2R'/|t−w|)^s ≤ 2π(2R')²/(2 − s)`; `vol(S^{2n−1})ρ^{2n}/(2n)`; `1/4 + 7/4 = 2`, `R/R' = 12/11`; slice `Δ_t = 4 = 2·2` | Holds |
| §8.2 De Giorgi | `s_{j+1} − s_j`; the three Checks | `r·φ(s_j)/2 < B_0φ(s_j)^{1+δ_0}` gives `r < 2^{−jδ_0}`, sum `< 1/(1 − 2^{−δ_0})`; smallness reads `φ(s_0) = 0` and `1 < 1/2` in Checks 1 and 3 | Theorem holds; R01 |
| §8.5 energy, Trudinger | `n = 1` determinant; torus `ℂ³/ℤ⁶`, `q = 1 − 0.03cos` | `a = (Ĝ/4)I_2`, `det = 4⁻²Ĝ²`; `mean(q log q)/3 = 0.03²/12 = 7.5·10⁻⁵`; `Ent_3 = 0.03³·(4/3π)/27 = 4.24·10⁻⁷` | Holds |
| §8.6 fixed background | `χ = 0`, `t = 1` | `c_1 = 1`, `V_1 = V`, `Ent_n ≤ 1 + Ent_p` | Holds |
| §8.7 Hessian estimate (changed) | conjugates; `n = k = 2`, `q = 3/2`; Hölder | `q > n/k ⇔ q' < n/(n−k)`; `q' = 3`; `E_t ≤ (c_t^n/V_t)‖e^{nF_t}‖_{L^q}‖φ_t‖_{L^{q'}}` | Holds |
| §8.7 entropy from `L^q` (added) | `x^pe^{−δx}` maximal at `x = p/δ`; `F = 1/2`, `log(2 − e^{1/2}) = −1.0462` on halves; `F = −2` on `9/10`, `2.1727` on `1/10` | `e^{nF}|F|^p ≤ (p/(en))^p` where `F < 0`, `≤ (p/(en(q−1)))^pe^{nqF}` where `F ≥ 0`; `Ent_2 = (0.4122 + 0.3845)/2 = 0.398 ≤ 0.5413·2.4208 = 1.310`; `0.4872 + 4.1457 = 4.633`, against `0.5413·7.7288 = 4.184` and `4.725`; both `F` have mass `1` | Holds |
| §8.7 `L^{p'}` bound at background `a_0ω_X` | `u = φ_t/a_0`; `n = 2`, `k = 1` | `λ[ω_X + i∂∂̄u] = λ[a_0ω_X + i∂∂̄φ_t]/a_0 ∈ Γ_k` since `Γ_k + Γ̄_n ⊆ Γ_k`; `|x|^{−2p'}r³` integrable iff `p' < 2` | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators in the certified texts.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 1.2 | spruck2005 line 11089–11091 (Lemma 1.5, the lower bound); lewis1996 line 145–158 (sum of the `m` largest eigenvalues, Theorem 2.1; OCR partly garbled, the gradient formula legible). Supported. |
| 1.4 | spruck2005 line 11066–11100 (Theorem 1.4 and its proof, the ordering at 11095–11097). Supported; the README states the wider hypotheses its routes need. |
| 3.1 | gpt2023 line 62–66; szekelyhidi2018 line 17–24. Supported. |
| 3.2 | dinew-kolodziej2014 line 33–35, 165–172, 259–263; gpt2023 line 924–926. Supported. |
| 3.3 | gpt2023 line 66–70, 107–111, 974–981; guo-phong2024 line 108–113; tosatti-weinkove2010 line 21–31; dinew-kolodziej2014 line 56–64. Supported. |
| 3.4 | gpt2023 line 82–83, 101–119, 450–451 (for `p ≥ 1`). Supported. |
| 4.2 | tosatti-weinkove2010 line 36–47 (Corollary 1). Supported, for the Monge–Ampère pair as the README says. |
| 5.2 | pss2012 line 216–233. Supported as cited. gilbarg-trudinger2001 Theorem 6.2 is uncertified; PDE §5.6 (E25) on main quotes the same estimate (line 2097–2105). |
| 6.3 | pss2012 line 981–990 (Theorem 8) and 994–1031 ((6.2)–(6.10)). Supported. |
| 6.5 | twwy2015 line 132–136; tosatti-weinkove2010 line 93–99. Supported. gilbarg-trudinger2001 Lemma 17.16 is uncertified. |
| 6.6 | tosatti-weinkove2010 line 52–59; pss2012 line 170–179 and 216–233. Supported. yau1978 and szekelyhidi2014 are uncertified. |
| 8.2 | gpt2023 line 412–426. Supported; the README makes the threshold explicit. |
| 8.5 | gpt2023 line 458–500 (Theorem 3, the auxiliary equation, Lemma 3), 686–692, 720–736. Supported; the README corrects the last step (Source issues). |
| 8.7 | gpt2023 line 861–952. Supported; the README adds `γ` to the dependence and the two steps the source leaves out. |

### Pins, duplication and suppliers

- Pins: the checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, the commits of `lake-manifest.json` and of README lines 44 and 56.
- The 53 qualified library names the README cites were searched at the pins and all found. Opened: Tau Ceti `Analysis/InnerProductSpace/CourantFischer.lean:251`, `363`, `440`, `479`; `HoffmanWielandt/Basic.lean:78` (`Re tr(T∘S) ≤ Σλ_i(T)λ_i(S)`); `KyFan.lean:99`, `489` (orthonormal family, sum of the largest eigenvalues); `Harmonic/MeanValue/Basic.lean:464` (`C²` on the ball, continuous on the closed ball, `0 ≤ Δf`; no boundary regularity); `Geometry/Manifold/Riemannian/Sobolev.lean:185` (`CompactSpace`, `2 < finrank ℝ E`, `ContMDiff 1`, `riemannianVolume`); `Geometry/Manifold/Complex/LeviForm.lean:106`, `156`, `165`, `172`, `179`, `206`, `241`, `292`, `343`; `Analysis/Complex/LeviForm.lean:119`, `142` (diagonal value `(Hess(v,v) + Hess(Iv,Iv))/4`), `150`, `270`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Analysis/Complex/Wirtinger/LeviForm.lean:79`; `Analysis/MeanInequalities.lean:68`; `Analysis/Matrix/MinkowskiDeterminant.lean:159` (on `{A | A.IsPositive}`, the semidefinite cone); `Geometry/Symplectic/Manifold/TwoForm.lean:174`, `202`, `231`; `Geometry/Manifold/TwoForm/Basic.lean:37`; `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `Geometry/Manifold/Riemannian/Laplacian.lean:238`; `Analysis/PDE/Regularity/Harnack.lean:284`. Mathlib `Analysis/InnerProductSpace/Spectrum.lean:277`, `297`, `309`, `314`, `384`; `Analysis/Matrix/Spectrum.lean:143`, `193`, `240`; `RingTheory/MvPolynomial/Symmetric/Defs.lean:69`, `202`; `Analysis/Calculus/LocalExtr/Polynomial.lean:64`; `Analysis/MeanInequalities.lean:129`; `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:118`; `Analysis/Convex/Integral.lean:196`; `Topology/UniformSpace/Ascoli.lean:474`; `Analysis/Calculus/Implicit.lean:465`, inside `section FiniteDimensional` (line 450), as README line 49 says.
- Supplier sections resolved on main: PDE §3.2 (C13) line 1344 (strong maximum principle with variable coefficients at 1356–1361, Aleksandrov–Bakelman–Pucci with the contract's hypotheses at 1403–1408), §5.4 (E23) line 1965, §5.6 (E25) line 2097; PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523; ComplexKahlerGeometry K1 370, K2 558, K4 1091, K5a from 1440, K6.0 2321; DifferentialGeometry Layers 0, 1, 5, 12 at 691, 862, 1644, 2796; ComplexManifolds Milestones 1–2 at 172, 197; RiemannianGeometry R5c item 4 at 3892–3901 (headline `exists_pos_laplaceBeltrami_eigenvalue_isLeast`, `Suggested.lean:534`); OperatorTheory PD-A51, PD-A53, PA-B32, MAJ-A27; AffineMorseLefschetz §1.1 at 315; OptimalTransport Layer 6 at 2421. Open heads: K3Surfaces §2.1 (528), ShimuraVarieties §7.0g (1993), ComplexComparisonPartII C5.4, NumberFieldEnumeration §1.1 (172). `roadmaps resolve` lists no citation found nowhere.
- Open revisions of suppliers: the two open revisions of ComplexKahlerGeometry keep K1, K2, K4, K5a and K6.0 as heading tags. The open pull request on PDE is a branch from before main's sectioning (its headings are "Lane A–G", no C13, E23 or E25 anywhere); it adds a lane and removes no section that its base had, and `scratch/overlaps.md` lists no dropped id. PDE is cited as it is on main.
- By object, on main and at the open heads (`roadmaps grep`): "hyperbolic polynomial", "Hessian equation", "Yau's theorem / Calabi conjecture", "Aubin–Yau": no match outside this roadmap. "De Giorgi's iteration": PDE (the Harnack route) and CalibratedGeometry (a decay iteration lemma for Campanato estimates, a different statement). "exponential integrability": PDE (Trudinger–Moser, John–Nirenberg), AdelicAlgebraicGroups, StandardDistributions, none for quasi-plurisubharmonic functions. "Newton's inequalities": ClassicalArithmeticCompletion uses them, states none. "spectral function": OperatorTheory (measurability for random matrices). "Ky Fan": OperatorTheory Majorization and SpectralSubspacePerturbation (norm estimates, no derivative of eigenvalue sums), ManifoldOptimization (consumes Majorization). "Monge–Ampère / plurisubharmonic": K3Surfaces, ShimuraVarieties, ComplexComparisonPartII, AffineMorseLefschetz, OptimalTransport, all named in Scope; ArithmeticDynamics and ArakelovGeometryAndAbelianHeightsPartII (measures). A search for the derivative of eigenvalues or spectral functions on main finds nothing.

Overlap check: read ComplexKahlerGeometry (both open revisions), PDE (open and main), ManifoldOptimization, YangMillsConnectionsAndCaloricGauge, Yamabe, RiemannianGeometry; the third list is empty. Shared objects: the Poincaré inequality on a closed Riemannian manifold, owner RiemannianGeometry R5c, consumed here; the Levi form, owner the pinned Tau Ceti (AffineMorseLefschetz §1.1); the eigenvalue variational inequalities, owner OperatorTheory at the pin; the sharp Euclidean Sobolev inequality is Yamabe's, and the closed-manifold form consumed here is the pin's. Nothing else is shared.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and the concavity of spectral functions (§§1.3–1.4); Gårding's theorem, the concavity of Hessian quotients and the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). There is no `Suggested.lean` at the design stage: nothing to probe for padding, no signature to compare, no `#check` comparison.

### Copyright and arrangement

- Wording: 26 passages set beside their sources (gpt2023 Theorems 1, 2, 3 and 5, Lemmas 1, 2, 4, 7 and 8, (1.3), (1.6)–(1.9), (3.2); pss2012 Theorems 1 and 8, §2.2, (5.6), (6.2)–(6.10); spruck2005 Theorem 1.4, Lemma 1.5, Corollary 2.4, Proposition 2.7; lewis1996 Theorem 1.1; guo-phong2024 conditions (1)–(4); szekelyhidi2018 line 17–31; tosatti-weinkove2010 Corollary 1 and line 93–106; dinew-kolodziej2014 line 33–35 and properties 3, 1.7; twwy2015 line 75–77; demailly2012 Corollary VI.6.5). Shared text is formulas and parameter lists only; the longest shared run is the dependence list of gpt2023 Theorem 2, which the statement forces.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §3 ↔ §§8.5–8.6, §4 ↔ §8.4 and one bullet of §2.4, §5 ↔ §8.7. The design's order is the source's §2, §4, §3, §5, and Layers 1–7 have no counterpart in it; the edges 8.1 → 8.3, 8.3 → 8.4, 8.5 → 8.6 and 8.3, 8.4 → 8.7 are in the `*Needs:*` lines.
- Reuse: no table, figure or list is taken over.

Source independence: 26 passages compared with 10 sources, none shared; largest share gpt2023, 43 of 147 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

### Suspicious text

None found in the files, sources and sibling roadmaps read.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread. This covers gilbarg-trudinger2001 Theorems 3.5, 6.2, 8.18, 9.1 and Lemma 17.16; the first four agree with what PDE on main quotes from the same book.
- Displayed formulas of spruck2005 and lewis1996 are partly garbled by OCR (Lemma 1.5, Proposition 2.7, lewis1996 Theorem 2.1); the hypotheses were legible and the statements were recomputed.
- Lean elaboration, the one-tactic probe and the `#check` comparison: no Lean file exists and this lane does not elaborate. The pinned declarations were read, not elaborated.
- Open pull requests were read through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15; the closest open roadmaps were compared by scope and by object search, not target by target.
- Locators outside the seeded sample that no repair touched (§§2.1–2.3, 5.4, 6.1, 6.2, 6.4, 7.1, 7.2, 8.1, 8.4) were not read again this round; rounds 6–7 record them.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, printed p.289: the source says the cone of every symmetric polynomial hyperbolic in `(1, …, 1)` contains the positive cone, with positive partial derivatives; it should assume the coordinate vectors lie in the closed cone, as `2xy − 0.9(x² + y²)` shows; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates for every real tuple; it should restrict the equality clause to positive tuples, since `(1, 0, 0)` gives equality; affects a stated result.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every `s > 0`; it should require `inf φ_t < −s`, since otherwise the normalizing energy `A_s` is zero; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevels, which give right-continuity when a level set has positive measure; affects the proof.
- **Gap** in gpt2023 at (3.3), arXiv v1 p.11: the source applies Hölder's inequality with exponent `n/(n − 1)`; it should treat `n = 1` separately, where part (c) of its Theorem 3 at `N = 1` gives the bound directly; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 3(c), arXiv v1 p.16: the source bounds the signed moment of `F` by the entropy alone; it should add a constant, since `|F| ≤ 1 + |F|^p` is what holds; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 5, arXiv v1 p.20: the source applies its Lemma 8, stated for the background `ω_X` and meaningful for `k < n`, to `ω_t`-admissible functions and to `k = n`; it should rescale by `a_0` with `ω_t ≤ a_0ω_X`, and use the exponential estimate when `k = n`; affects the proof.
- **Gap** in gpt2023 at Theorem 5, arXiv v1 p.20: the source lists the constant's dependence without the structural constant and does not restate the structural condition; it should include both, as its Theorem 2, on which the proof rests, does; affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`), cited in §§5.1 and 7.1. `lewis1996` and `spruck2005` are read from an author page and an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d640bc27a17f902693a514aa2759112d1b0ba2aa", "job": "REV-DESIGN-ComplexHessianEquations~8", "model": "fable", "worker": "chris-x82"} -->
