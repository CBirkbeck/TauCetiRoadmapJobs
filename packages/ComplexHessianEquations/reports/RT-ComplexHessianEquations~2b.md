<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17935#issuecomment-6907538027 -->
Red team round 2 pass b (claude) of d1d49b5

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The concavity headline carries a `C¹` hypothesis it does not need

   **Location.** `packages/ComplexHessianEquations/Suggested.lean:114–120`: "`(hf1 : ContDiffOn ℝ 1 f Γ) (hf : ConcaveOn ℝ Γ f) : ConcaveOn ℝ {A : hermitianMatrices 𝕜 n | eigenvalueVector A ∈ Γ} (fun A ↦ f (eigenvalueVector A))`"; `README.md:194` and `README.md:197` (§1.4, second item, "a symmetric `C¹` function `f`").

   **Claim.** The spectral function of a symmetric concave `f` is concave on the spectral domain, for `f` of class `C¹`.

   **Witness.** The statement holds without `hf1`. Instance: `Γ = ℝ²`, `f(μ) = min(μ_1, μ_2)`, which is symmetric and concave and not differentiable at `e`. Then `F_f = λ_2`, and for `A = diag(1, 0)`, `B = diag(0, 1)`: `F_f(A) = F_f(B) = 0`, `F_f((A + B)/2) = 1/2 ≥ 0`. In general the first route of §1.4 already proves it (below).

   **Repair.**

   `Suggested.lean`: delete the binder `(hf1 : ContDiffOn ℝ 1 f Γ)`. In the docstring replace "a symmetric, concave `C¹` function `f` on `Γ`" by "a symmetric concave function `f` on `Γ`", and "(Spruck 2005, Theorem 1.4 and its proof)" by "(Spruck 2005, Theorem 1.4 and its proof, for smooth `f`; no differentiability is needed)".

   `README.md:194`: replace "nor more than `C¹`" by "nor more than `C¹`, and the concavity clause needs no differentiability at all".

   `README.md:197`: replace the item's first sentence and add the general route before the existing one:

   > If `f : Γ → ℝ` is symmetric and concave (differentiability is not assumed for this item), then `F_f` is concave on `Sym_Γ(E)`. Route: a concave function on the open convex set `Γ` has a supergradient at every point, so it is the infimum over `Γ` of affine functions `μ ↦ ⟨y, μ⟩ + s` that dominate it. Since `f` is symmetric, this family is closed under permuting the entries of `y`, so `f(μ) = inf (⟨y↑, μ↓⟩ + s)` on `Γ`. Hence `F_f(T) = inf (⟨y↑, λ(T)⟩ + s)` on `Sym_Γ(E)`, an infimum of the functions shown concave in the first item, on a convex set. For `C¹` `f` the same inequality has the gradient form: …

   (the existing route follows unchanged). Add to the §1.4 Checks: "Concavity without differentiability: `f(μ) = min(μ_1, μ_2)` on `ℝ²` gives `F_f = λ_2`; at `A = diag(1, 0)`, `B = diag(0, 1)` the values are `0`, `0` and `1/2` at the midpoint."

   Tested on the instance: `f = min` has the dominating affine functions `μ ↦ μ_1` and `μ ↦ μ_2`, both giving `⟨y↑, μ↓⟩ = μ↓_2`, so `F_f(T) = λ_2(T)`; the repaired Lean statement has `hfs`, `hf`, `hΓo`, `hΓc`, `hΓs` and applies. The other three items of §1.4 keep their `C¹` hypothesis, which they use.

One P3 finding (S01). All seven findings of round 1 are repaired at this head, and no repair introduced an error that I could find. No P1 or P2.

## Round 1 findings at this head

| Id | Status | Witness at `d1d49b5` |
|---|---|---|
| 1a/F01 (P1), §7.1 Green–Riesz unowned | repaired | `packages/ComplexHessianEquations/README.md:657`: "Then for every `a ∈ D(c, ρ)`, `v(a) = h(a) − ∫_{D(c,ρ)} G_ρ(w, a)·Δv(w) dλ(w)`", for `C²` `v`, with `G_ρ = TauCeti.planarGreenKernelDisk c ρ w a`. The pin has pole first, variable second (`TauCeti/Analysis/PDE/GreenFunction/Disk.lean:35`), and `harmonicAt_planarGreenKernelDisk_sub_newtonianKernel` is harmonic in the second argument, as the route uses it. Sign recomputed: `v = |w|²`, `a = 0`: `1 − 1 = 0`. Every input of the route is in the `*Needs:*` line of `README.md:661` and exists at the pin. |
| 1a/F02 (P3), Young inequality unowned | repaired | `README.md:722`: "The pointwise inequality is `y^p·e^{nF_t} ≤ e^{nF_t}(1 + n|F_t|)^p + (p/e)^p·e^{2y}` for `y ≥ 0`", with its two cases. Recomputed at `nF = 0`, `p = 2`, `y = 1`: `1 ≤ 1 + 4`. Locator gpt2023 line 303–321 holds. |
| 1a/F03 (P3), `convex_spectralDomain` padding | repaired | The declaration is absent from `Suggested.lean`; `README.md:194` reads "`concaveOn_spectralFunction` in `Suggested.lean` states the second item, and with it the first at `f = 0`". |
| 1a/F04 (P3), "How to read the build" narrower than §4.2 | repaired | `README.md:108`: "for every admissible pair with a convex cone, in particular every concave admissible pair". |
| 1a/F05 (P3), docstring calls `∫ e^{nqF}` a norm | repaired | `Suggested.lean:443–444`: "(the `q`-th power of the `L^q` norm of `e^{nF}`)". |
| 1b/F01 (P2), §8.6 vacuous for `k < n` | repaired | `Suggested.lean:429–436` quantifies `c` and assumes `c ^ finrank ℂ E ≤ K₁`; `README.md:763` states `C(n, p, γ, ω_X, Ent_p(F), c̄)`. Instance: Laplace pair, `n = 2`, `F = 0`, `φ = 0`, `c = 2`: hypotheses hold for `K₁ ≥ 4`. The route through the rescaled pair `(f/c, Γ)` is sound: `∏ ∂_j(f/c) = c^{−n}∏ ∂_j f ≥ γ/c̄`, and `(σ_1/2, Γ_1)` at `n = 2` gives `1/4`. |
| 1b/F02 (P2), gap not minimal | repaired in the README | `README.md:541` uses the barrier `v = −φ + (A/c_B)(R² − |z|²)` and the pinned `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`), whose hypothesis `(m − 2)s < m` reads `2n − 2 < 2n`. The README names no `gap:` slug. The `gaps` entry of `design/plan.json` remains; see `## For the human reviewers`. |

## Adversarial pass: `Suggested.lean`

Context of every manifold declaration: `E` a normed space over `ℂ` with `[FiniteDimensional ℂ E]`, `X` with `[ChartedSpace E X] [IsManifold 𝓘(ℂ, E) ∞ X]`; every theorem also carries `[T2Space X] [CompactSpace X] [ConnectedSpace X]` in its own signature. Second countability is not assumed and is automatic (a compact space covered by finitely many chart domains). The five definitions flagged in the job's elaborated signatures lost only `[FiniteDimensional ℂ E]` or `[IsManifold …]`, which their bodies do not use; every theorem carries both. I ran no Lean (this pass is read-only); the types are those of the job's elaborated signatures, read against the README.

| Declaration | Instances tried, values on each side | Result |
|---|---|---|
| `hermitianMatrices`, `eigenvalueVector` | `A = [[2,1],[1,2]]`: `(3, 1)`; `n = 0`: empty vector. `LinearMap.IsSymmetric.eigenvalues` is antitone at the pin | sound |
| `differentiableAt_spectralFunction_iff` | `f = max`, `A = Id`: neither side differentiable; `f = σ_1`: both; `n = 0`: both hold. lewis1996 line 77–81 | sound |
| `fderiv_spectralFunction_apply` | `f = μ_1² + μ_2²`, `A = [[0,1],[1,0]]`, `H = A`: left `2 tr(A·A) = 4`; right `2·1·1 + (−2)(−1) = 4` | sound |
| `contDiffOn_spectralFunction_iff` | `f = max` on `Ω = ℝ²`: neither side; `Ω = ∅`: both hold. lewis1996 line 468–469, which follows Corollary 3.15 as the docstring says | sound |
| `concaveOn_spectralFunction` | `σ_2^{1/2}` on `Γ_2`: `2, 2, 5/2`; `f = min` (not `C¹`): `0, 0, 1/2` | true; S01 |
| `lineRestriction`, `IsHyperbolic`, `gardingCone` | `p = xy`, `a = e`: roots `−x_1, −x_2`, cone the open quadrant; `x² + y²`, `a = (1,0)`: roots `±i`, not hyperbolic; `N = 0`, `m ≥ 1`: homogeneity forces `p = 0`, so `p(a) > 0` fails | sound |
| `hessianCone` | `(3,3,−1)`: `σ = (5, 3, −9)`, in `Γ_2 \ Γ_3`; `k = 0`: all of `ℝⁿ`, unused (every theorem has `1 ≤ k`) | sound |
| `garding` | `p = xy`: `p^{1/2}` at `(4,1)`, `(1,4)`, midpoint: `2, 2, 5/2`; `D_b p(x) = x_1b_2 + x_2b_1 > 0`; `m = 0` excluded by `hm` (`D_b 1 = 0`) | sound |
| `isHyperbolic_and_gardingCone_eq_of_mem` | `p = xy`, `b = (1, 2)`: roots `−x_1`, `−x_2/2`, same quadrant | sound |
| `isHyperbolic_esymm_and_gardingCone_eq` | `n = k = 1`: root `−x`, cone `x > 0`; `σ_2(−e) = 3 > 0` in `ℝ³` but root `t = 1 ≥ 0` of `3(t − 1)²`, so `−e ∉` cone, matching `σ_1(−e) < 0` | sound |
| `concaveOn_hessianQuotient` | `σ_2/σ_1`, `n = 2`: `0.8, 0.8, 1.25`; `∂_1 = λ_2²/(λ_1 + λ_2)² > 0`; `l = 0` gives `σ_k^{1/k}`; `n = k = 1`: the identity | sound |
| `AdmissiblePair`, `IsStructural` | `(σ_n^{1/n}, Γ_n)`, `n = 2`, `(1,4)`: partials `1, 1/4`, product `1/4 = 2^{−2}`; `n = 0`: `pos_mem_cone` and `sum_pos_of_mem_cone` contradict, no pair | sound |
| `exists_hessianPair` | `∂_j f(e) = (1/k)·binom(n,k)^{1/k − 1}·binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `(3,2)`: `3^{−1/2}` each, product `3^{−3/2}`; `k = 1`: `1`; `k = n`: `n^{−n}`; bound via Maclaurin `σ_k^{1/k} ≥ binom(n,k)^{1/k}σ_n^{1/n}` | sound |
| `hermitianForm` | `ω = dx ∧ dy` on `ℂ`: `H(1,1) = 1`, `H(i,1) = −i`, `H(1,i) = i`, so `H(v,w) = v̄w` | sound |
| `ddbarHermitianForm` | `φ = |z|²`, `α = 0`: `2h`; `φ = x_1²`: `H(1,1) = 2·(2 + 0)/4 = 1` | sound |
| `IsRelEigenvalueVector` | `h = diag(2,1)`, `a = diag(2,3)`: `μ = (1,3)` and `(3,1)` qualify, `(2,3)` does not; `n = 0`: holds for the empty vector | sound |
| `formPow`, `formPowIntegral` | `ω²(∂_{x_1},∂_{y_1},∂_{x_2},∂_{y_2}) = 2`; the pinned orientation is indexed by `Fin (2 * finrank ℂ E)`, the degree of `formPow α (finrank ℂ E)` | sound |
| `IsNormalizedSolution` | `χ = ω`, `F = 0`, `φ = 0`, `c = f(e)`: holds; `φ = −1`: no zero, excluded; `c ≤ 0` excluded | sound |
| `eq_of_isNormalizedSolution` | two components: `ψ = −1` on one, refuted without `ConnectedSpace`; non-convex cone of §1.4: `f(μ) = 6 > f(ν) = 1.11`, excluded by `hΓ`; `n = 0`: no pair. Note (no finding): `hF` follows from the other hypotheses, since `F = log(f(λ)/c)` | sound |
| `existsUnique_yau` | `F = a`: `b = −a`, `φ = 0`; torus `n = 1`, `F = ε cos 2πx`: `b = −log I_0(ε)`; `n = 0`: `X` a point, `1 = e^{F + b}` forces `b = −F`, `φ = 0` | sound |
| `exists_lintegral_exp_le_of_plurisubharmonic` | `u_ε = c log((|z|² + ε)/(4 + ε))`: bound uniform in `ε` iff `αc < n`, so `α` after `A`; scaling `u ↦ αu` shows `C` may precede `A`; `n = 0`: `e^{αA} ≤ e` at `α = 1/A` | sound |
| `exists_formPowIntegral_exp_le` | `ℂP¹`, `ψ_ε`: needs `α < 1`; two components with `ψ = −M` on one: `e^{αM}` unbounded, excluded by `ConnectedSpace` | sound |
| `exists_abs_le_of_degenerating` | Laplace pair, `n = 1`, `χ = 0`: `c = t`, `c/V_t = 1/V`, `φ_t = tφ_1`, bounded; `K_i < 0`: hypotheses unsatisfiable; `C` precedes `P`, `t`, `c`, `F`, `φ` as in gpt2023 line 126–130 | sound |
| `exists_abs_le_mongeAmpere_degenerating` | `χ = ω_X`, `F = 0`: `c = 1 + t`, `φ = 0`; `φ = −M` excluded by the zero; `n = 0`: `φ = 0` | sound |
| `exists_abs_le_of_entropy_le` | `(n,k) = (2,1)`, `F = 0`, `φ = 0`, `c = 2`, `K₁ ≥ 4`; `(3,2)`: `c = √3`; Monge–Ampère: `c = 1` | sound |
| `exists_abs_le_hessian_degenerating` | `q' = q/(q−1) < n/(n−k)` iff `q > n/k`: `(n,k,q) = (2,1,3)`: `3/2 < 2`; `k = n`: `q > 1`; `Real.exp (n·F) ^ q` is `e^{nqF}`; constant `φ = −M` excluded by the zero | sound |

## Adversarial pass: README targets

| Target | Instances and values | Result |
|---|---|---|
| Conventions | `i∂∂̄(x_1²)(∂_x, ∂_y) = (1/2)(0 + 2) = 1`; `Δ_ω|z|² = 2n`; `2Δ_ω = Δ` on `ℂ`; `α ∧ ω^{n−1} = (σ_1/n)ω^n` | consistent in §§3.1, 3.2, 5.1, 6.1, 7.1 |
| §1.1 | `g⁻¹a = diag(1,3)`; `λ[−a] = (−1,−3)`; `det(Id + tA) = 1 + 6t + 11t² + 6t³` | holds |
| §1.2 | `F = diag(2,1)`, `B = diag(0,3)`: `3 ≤ 3 ≤ 6`; `κ_2(diag(3,1,1) + t·diag(0,1,−1)) = 4 + |t|` | holds |
| §1.3 | `∇ det` at `[[2,1],[1,2]]`: `[[2,−1],[−1,2]]`; `tr(T²)`: `2T` | holds |
| §1.4 | half-space route: `min_P ⟨y, Pμ⟩ = ⟨y↑, μ↓⟩`; non-convex cone: midpoint `(1, −0.15)` outside; monotonicity control `−1 > −2` | holds; S01 on the second item |
| §1.5 | `σ_2^{1/2}` at `diag(1,4)`: `∇F = diag(1, 1/4)`, `det = 1/4`, trace `2`; `tr(AB) = 5 ≥ 4` | holds |
| §2.1 | `(1,2,3)`: `S = (2, 11/3, 6)`, `12 ≤ 121/9`; `(3,2,2,1)`: `18/11 ≤ 11/6`; `(2,0,2,1)`: `1.915 > 1.833`, excluded by `l ≤ s`; shift at `e`, `t = 1`: `12 = 12` | holds |
| §2.2 | `2xy − 0.9(x² + y²)`: discriminant `0.76(x_1 − x_2)²`; it is `(1/20)·p_19`; sector `0.627 < x_2/x_1 < 1.595`; `σ_k = D_e^{n−k}σ_n/(n−k)!` | holds |
| §2.3 | tangent inequality at `(1,4)`, `(4,1)`: `2 ≤ 4.25`; `min` control `1 ≤ 0` excluded | holds |
| §§2.4–2.5 | `σ_2/σ_1` at `(M,1,1)`: `3/(M+2)²`, `(M²+M+1)/(M+2)²`, product `≈ 3/M²`; quotient plus `cσ_p^{1/p}`: `∂_j ≥ c·∂_j σ_p^{1/p}`; combination constant by superadditivity | holds |
| §3.1–3.2 | `λ_{2ω} = λ_ω/2`; mixed inequality from `M_k(α,β,…) = (1/k)Σ α_iσ_{k−1;i}(β)`; Maclaurin form `5/2 ≥ 2` | holds |
| §3.3–3.4 | Hessian constant `c^k = binom(n,k)` at `χ = ω`, `F = 0`; `V_t ≥ t^nV`; `Ent_q ≤ 1 + Ent_p`; mass bound `e^{na} ≤ e^{na}|a|^p + e^n` | holds |
| §§4.1–4.2 | disc `ψ = −|z|²/4`: `1/2 ≤ 1`; linearisation `a = ∫_0^1 ∇F_f(h_s) ds`, segment in `Sym_Γ` by convexity | holds |
| §5.1 | `e^ρω_0` on `ℂ²`: `Δ_g u = e^{−ρ}(Δ_0u + ⟨∇ρ,∇u⟩)`, difference `−e^{−ρ}⟨∇ρ,∇u⟩` | holds |
| §5.2 | Schauder Check: quotient `8π²·2^α`, `‖Lu_j‖ ≤ 2π²(1 + 2π^α)ε`, so `C ≥ 4·2^α/((1 + 2π^α)ε)` | holds |
| §5.3 | torus: `1/2 = 2π²/4π²`; exponent `4` at `n = 2`; `2 < 2` fails at `n = 1` | holds |
| §5.4 | barrier: `v ≥ 0`, `Δ_ω v ≤ A − A`; weak form `∫ a∇v·∇w = −∫ 2√g Δ_ω v·w ≥ 0`; overlap step `inf v_2 ≤ ⨍_{overlap} v_2` | holds |
| §6.1–6.4 | `K = Σ B(e_p,e_j)λ_j/λ_p ≥ −Λ·tr h·tr h⁻¹`; torus `x = 1/4`: `s_{ω_φ} = S = 2π²a²`, `⟨T,Q(T)⟩ = −4π⁴a⁴`; `(tr h)⁻¹ ≤ tr h⁻¹`: `4/17 ≤ 17/4` | holds on the `n = 1` witnesses |
| §6.2 | `(1/n)∫|∂ψ|² ≤ ∫ψ(e^F − 1)` from the `j = n − 1` term; torus `ℂ²/ℤ⁴`: `q = 1 − 2π²ε cos`, `ψ̄ = 1 + ε` | holds |
| §§6.5–6.6 | `n = 1`: `φ = (a/2π²)(cos 2πx − 1)`, `osc = a/π²`; path exponent `tF + b_t`, `|b_t| ≤ t sup|F|`; derivative `(u,β) ↦ Δ_{ω_φ}u − β` | holds |
| §7.1 Green representation | `v = |w|²`: `0` at `0`, `1/4` at `1/2`; Jensen on `v_ε`: `(1/2)log ε`; kernel bound `|1 − conj(w−c)(a−c)/ρ²| < 2` | holds |
| §7.1 one-variable | `αM/2π ≤ αA/log(R/R') ≤ 1`; `∫_{D(0,r)} (2R'/|t−w|)^s ≤ 2π(2R')²/(2 − s)` since `r + R' < 2R'`; `α_1 ≈ 0.096`; `α_1c ≈ 0.2075` | holds |
| §7.1 local | `|x_0 + tξ| < 1/4 + 7/4`; `R/R' = 12/11`; polar identity with weight `|t|^{2n−2}/2π`; `Δ_t = 4` for `|t|² − 4`; `ℝ⁴` control: radial eigenvalue `(1/4)(2ε − |x|²)(|x|² + ε)^{−5/2}` | holds |
| §7.2 | `ψ − sup ψ ≥ ψ + A|z|² − sup ψ − 4A` on `B(0,2)` | holds |
| §8.2 | `s_{j+1} − s_j < 2B_0φ(s_0)^{δ_0}2^{−jδ_0}`; at `s_0 = 0` the hypothesis extends by right-continuity; `δ_0 = 0`: `e^{−s}` control | holds |
| §8.3 | two cases of the pointwise inequality; `s_0Φ(s_0) < Ē` strict on the open set `Ω_{s_0}^∘`; `Ē = 0` forces `φ = 0` | holds |
| §8.4 | Jensen: `(1/V_t)∫(−α_0φ)ω_φ^n ≤ n(c^n/V_t)∫Fe^{nF} + log(c^n/V_t) + log C`; `a_0 = 4` for `χ = 3ω_X` | holds |
| §§8.5–8.6 | `det a = 4^{−2n}(det Ĝ)²` at `n = 1`: `Ĝ/4` twice; `c ≥ binom(n,k)^{1/k}` by Jensen | holds |
| §8.7 | entropy bound on the two-valued `F`: `0.398 ≤ 1.310`, `4.633 ≤ 4.725`, `4.633 > 4.184`; Lemma 8 at background `a_0ω_X` by `u = φ/a_0` | holds |

## Dependency check

```
depcheck: 246 roadmaps, 2298 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** 31 of 31 (17 theorems, 13 definitions, one structure); 17 `sorry`, all in theorems; no sorry'd data, no `set_option`, no `lemma`, no `#check`/`#eval`; imports are `import Mathlib` and six `TauCeti.*` modules, all present at the pin.
- **Targets read:** every section of Layers 1–8 (35 numbered sections) and the Conventions; every Check evaluated against its section, the values above.
- **Headlines:** Lewis's theorem (three forms), concavity of spectral functions, Gårding's theorem (two forms), `Γ(σ_k, e) = Γ_k`, concavity of Hessian quotients, the Hessian pair, uniqueness, Yau's theorem, the local and global exponential integrability, and the four Guo–Phong–Tong estimates. All are stated; the module docstring claims no unstatable headline, and I found none. Padding probe: no declaration follows from another or from the pins in one step; the pins contain no hyperbolic polynomials, Newton or Maclaurin inequalities, spectral-function calculus or non-strict plurisubharmonicity predicate (only `TauCeti.IsStrictlyPlurisubharmonicAt` and `TauCeti.IsManifoldStrictlyPlurisubharmonicAt`).
- **README and Lean agree:** every Lean name occurs in the README; every backticked own name of the README is declared.
- **Pinned names:** all 104 backticked library names of the README were searched at the pins and found. Statements read in full: `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value`, `InnerProductSpace.HarmonicOnNhd.harnack_inequality_center`, `TauCeti.planarGreenKernelDisk` with its three lemmas, `TauCeti.planarGreenKernel`, `TauCeti.planarNewtonianKernel`, `TauCeti.integral_laplacian_mul_planarNewtonianKernel_sub`, `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`, `TauCeti.leviForm`, `TauCeti.manifoldLeviForm`, `TauCeti.leviForm_apply_self`, `TauCeti.re_leviForm_nonpos_of_isLocalMax`, `TauCeti.SmoothTwoForm.Tames` and `.Invariant`, `TauCeti.integralTopForm`, `TauCeti.IntegrableTopForm`, `TauCeti.complexManifoldOrientation`. Each agrees with its description in the supplier contract.
- **Sibling citations checked on main (14):** PDE §3.2 (C13) (strong maximum principle with variable coefficients, Aleksandrov–Bakelman–Pucci), §3.4 (C15), §5.6 (E25); RiemannianGeometry R5c item 4 with `exists_pos_laplaceBeltrami_eigenvalue_isLeast`; ComplexKahlerGeometry Layers K1, K2, K4, K5a, K6.0; PseudodifferentialOperators §§5.4, 6.2; DifferentialGeometry Layers 0, 1, 5, 12 with `integralTopForm_mextDeriv_eq_zero`, `riemannianVolumeForm`, `integral_mul_laplaceBeltrami`; ComplexManifolds Milestones 1–2; AffineMorseLefschetz §1.1; OperatorTheory PD-A51–A53, PA-B32, MAJ-A27; ComplexComparisonPartII C5.4. ShimuraVarieties §7.0g exists at its open head; it, K3Surfaces and NumberFieldEnumeration are named only to delimit scope, not as suppliers.
- **Ownership:** searched open heads and main by object (hyperbolic polynomials, Gårding cones, spectral functions, admissible cones, quasi-plurisubharmonic functions, Lewis's theorem) and by the Lean names. No second owner. `IsHyperbolic` and `AdmissiblePair` occur in other roadmaps under other namespaces and for unrelated objects; no fully qualified name is shared.
- **Locators verified against the texts (52):** gpt2023 line 62–66, 66–70, 71–76, 82–83, 84–89, 90–93, 101–119, 120–130, 198–302, 246–250, 255, 283–289, 303–321, 384–387, 407, 412–426, 437–441, 443–452, 455, 689–692, 744–769, 770–776, 785–803, 804–850, 851–852, 861–870, 924–926, 948–952, 959, 974–981; lewis1996 line 77–81, 144, 145–148, 154–159, 185–187, 468–469; spruck2005 line 11066–11075, 11089–11100, 11182–11190, 11225–11229, 11268–11270, 11295, 11364–11365; demailly2012 line 1717–1731, 15190–15191; pss2012 line 170–179, 2943–2955; tosatti-weinkove2010 line 36–47; guedj-zeriahi2005 line 255–262.
- **Package boundary:** the pull request changes only `packages/ComplexHessianEquations/`. No pull-request number, process word or machine path in the README, the Lean file or the manifest.
- **Arrangement:** gpt2023 has the largest share. Its sections are 2 (Theorem 2), 3 (Theorem 1), 4 (Monge–Ampère), 5 (Hessian), 6 (Trudinger). The roadmap's eight layers do not correspond to them; inside Layer 8 the order is §2, §2, §2, §4, §3, §3, §5 of the source, forced by `*Needs:*` (8.4 needs 8.3; 8.5 needs 6.6 and 7.2; 8.6 needs 8.3 and 8.5; 8.7 needs 8.3–8.4).
- **Wording:** ten passages set beside their sources: the admissible-cone definition (gpt2023 line 71–76), §8.3 (line 120–130), §8.2 (line 412–415), §8.7 (line 948–952), §2.4 structural constant (line 744–750), Lewis's theorem in the README and in the docstring (lewis1996 line 77–81), Gårding's theorem (spruck2005 line 11186–11188), §7.2 (pss2012 line 2946–2953), the Yau docstring (tosatti-weinkove2010 line 38–47), the Green representation (demailly2012 line 1717–1725). The longest shared run is the dependence list of gpt2023 line 126, eight words and five symbols, which the mathematics fixes. No table, figure or example list is taken over.

Source independence: 10 passages compared with 6 sources, none shared; largest share gpt2023, 43 of 121 locators; contents compared with gpt2023: independent.

## Not verifiable

- `cns1985`, `ckns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `tian1987`, `hormander1990`: uncertified, no text. Their locators (gilbarg-trudinger2001 Theorems 3.5, 6.2, 9.1 and Lemma 17.16; yau1978 §2; szekelyhidi2014 Theorem 3.1; kolodziej1998 §1; hormander1990 Chapter IV) were not checked.
- Elaboration: I ran no Lean. The types compared are the job's elaborated signatures of this head; the repair of S01 only removes one binder.
- The curvature identities of §6.1 in dimension `n ≥ 2`: checked on the `n = 1` torus witnesses, on `ω_φ = sω` and for homogeneity degrees only.
- gpt2023 (2.6)–(2.15): the constants `ε`, `Λ`, `B_0` are cited by number and were not recomputed; `δ_0 = (p − n)/(pn)` was (line 380–383).
- K3Surfaces §2.1 and NumberFieldEnumeration §1.1: the citation resolver finds both at their open heads; I did not reread their statements. Neither is a supplier.
- lewis1996 and spruck2005 are OCR of scans; lewis1996 line 154 and spruck2005 line 11076–11083 are garbled, so Theorem 2.1 of the first and part (iii) of Theorem 1.4 of the second were read from the surrounding lines.

## Source issues

- **Error** in gpt2023 at (1.1) and Theorem 1, printed page 2–3: the source says the equation has right-hand side the exponential of a normalized function, with no constant; it should carry a positive constant, as its proof does at (3.1); affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, line 407, printed page 9: the source says the weighted measure of the closed sublevel sets is continuous in the level; it should use strict sublevel sets, which give right-continuity; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, line 433, printed page 10: the source says the starting level may be the one Chebyshev's inequality gives; it should justify the strict smallness that Lemma 2's proof assumes; affects the proof.
- **Gap** in gpt2023 at (3.3), line 455, printed page 11: the source says the energy is bounded by Hölder's inequality with exponent `n/(n − 1)`; it should treat dimension one, where that exponent is undefined; affects the proof.
- **Misprint** in gpt2023 at the paragraph after Lemma 4, line 773, printed page 17: the source says the quotient example allows equal indices; it should require `k > ℓ`, since the exponent `1/(k − ℓ)` is otherwise undefined; affects nothing.
- **Gap** in gpt2023 at Theorem 5, line 951–952, printed page 20: the source says the constant depends on dimension, indices, the forms, the norm and the relative volume; it should also list the structural constant, on which Theorem 2's constant depends; affects a stated result.
- **Misprint** in gpt2023 at (5.4), line 959, printed page 21: the source says the Hessian equation for the `k`-th root has no binomial factor; it should carry `binom(n, k)⁻¹` on the right, or rescale the constant; affects nothing.
- **Error** in spruck2005 at Corollary 2.4, line 11225–11229, printed page 289: the source says the cone of every symmetric polynomial hyperbolic in the all-ones direction contains the positive cone, with positive partial derivatives; it should assume the coordinate vectors lie in the closed cone; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, line 11268–11270, printed page 290: the source says equality in Newton's inequalities forces equal components for every real vector; it should restrict the equality clause to positive vectors; affects a stated result.
- **Misprint** in spruck2005 at Proposition 2.7, line 11269, printed page 290: the source says the index runs up to `n`; it should run up to `n − 1`, since the inequality involves the mean of the next order; affects nothing.

## For the human reviewers

- **Declared gap with no consumer.** `packages/ComplexHessianEquations/design/plan.json` still lists `weak-harnack-supersolutions` (supplier PDE §5.4 (E23)); the README at `d1d49b5` no longer uses or states it (§5.4 uses the pinned homogeneous inequality). Whether the entry is withdrawn is a plan decision.
- **Licence.** `lewis1996` is recorded as `author-page` in `packages/ComplexHessianEquations/sources.toml`; its extracted text carries a per-page stamp "Copyright 2001 All Rights Reserved" (lewis1996 line 150, 472).
- **Licence.** `spruck2005` was read from the Clay Mathematics Institute's download of the whole proceedings volume, recorded as `institutional`; 16 README locators point into it.
- **Licence.** `demailly2012` is an unpublished book manuscript read from its author's institutional page; it is cited for Proposition 4.22 and Corollary VI.6.5 only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d1d49b528662ab92e6fa21c28e8e45bce53fc5e7", "job": "RT-ComplexHessianEquations~2b", "model": "fable", "worker": "chris-x52"} -->
