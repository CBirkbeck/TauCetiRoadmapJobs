<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17935#issuecomment-6906629248 -->
Red team round 1 pass b (claude) of 46a4340

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The fixed-background estimate is vacuous for the Hessian pairs with `k < n`

   **Location.** `packages/ComplexHessianEquations/Suggested.lean:430–440` (`exists_abs_le_of_entropy_le`): "`formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x)) = formPowIntegral κ (fun _ ↦ 1) → IsNormalizedSolution P κ κ F 1 φ →`". The same hypotheses are in `packages/ComplexHessianEquations/README.md:754` (§8.6) and `README.md:737` (§8.5): "solve `f(λ[ω_{X,φ}]) = e^F` … with smooth `F` normalized by `∫ e^{nF} ω_X^n = V`".

   **Claim.** The statement is presented as the Guo–Phong–Tong `L^∞` estimate "for every admissible pair satisfying the structural condition" (Summary, `README.md:3`), with the constant `c` fixed to `1` and `F` normalized.

   **Witness.** For the Hessian pair `(σ_k^{1/k}, Γ_k)`, `1 ≤ k < n`, no `(F, φ)` meets both hypotheses. If `σ_k(λ)^{1/k} = e^F`, Jensen for `x ↦ x^{n/k}` and the Kähler invariance of §3.2 (`∫ σ_k(λ[ω_φ]) ω^n = binom(n, k)·V`) give `V⁻¹ ∫ e^{nF} ω^n ≥ binom(n, k)^{n/k} > 1`.

   Values computed:

   | Instance | `V⁻¹ ∫ e^{nF} ω_X^n` forced by `c = 1` | Required by normalization | Result |
   |---|---|---|---|
   | Laplace pair `(σ_1, Γ_1)`, `n = 2`, flat torus, `φ = 0` | `e^F = 2`, so `4` | `1` | no instance |
   | Laplace pair, `n = 2`, any `φ ∈ C²` | `≥ (V⁻¹∫(2 + Δ_ω φ))² = 4` | `1` | no instance |
   | Hessian pair, `(n, k) = (3, 2)` | `≥ 3^{3/2} ≈ 5.196` | `1` | no instance |
   | Monge–Ampère pair, any `n` | `V⁻¹∫ ω_φ^n = 1` | `1` | holds (the only standard pair that does) |
   | Rescaled pair `S_k^{1/k} = (σ_k/binom(n, k))^{1/k}`, `k < n` | `≥ 1`, with equality only if `S_k(λ) ≡ 1` | `1` | only `F ≡ 0`, `φ = 0` |

   The README's own Check at `README.md:437` agrees: with `χ = ω`, `F = 0`, `φ = 0` the constant is `c = binom(n, k)^{1/k}` for the Hessian pair and `c = n` for the Laplace pair, not `1`. The Check at `README.md:759` tests the Laplace pair only at `n = 1`, where `binom(1, 1) = 1`.

   The source proves more than its statement says: gpt2023 line 443–452 writes `e^F = c_1 e^{F_1}` with `F_1` normalized and bounds `c_1^n` by the entropy, so its proof treats a free constant (see Source issues).

   **Repair.** State the theorem with a constant `c` and a bound for it. It is then §8.3 at `χ = 0`, `t = 1` with the energy supplied by §8.5.

   README §8.6, replace the statement and route by:

   > Prove the Guo–Phong–Tong estimate on a fixed background (gpt2023 Theorem 1, line 84–89, in the form its proof establishes, line 443–457): let `φ ∈ C²(X)` and `c > 0` solve `f(λ[ω_{X,φ}]) = c·e^F`, `sup φ = 0`, `λ ∈ Γ`, with smooth normalized `F`. Then `sup |φ| ≤ C(n, p, γ, ω_X, Ent_p(F), c̄)` for every upper bound `c̄ ≥ c^n`. Route: §8.3 with `χ = 0` and `t = 1`, where `V_1 = V` and the relative volume is `c^n/V ≤ c̄/V`. The energy is `E(φ) = (c^n/V)·∫ (−φ) e^{nF} ω_X^n`, and the integral is bounded by §8.5(c) at `p' = n`, `N = 1`, applied to the admissible pair `(f/c, Γ)`, which solves `(f/c)(λ) = e^F` and has structural constant `γ/c^n ≥ γ/c̄`. With `c = 1` and the Monge–Ampère pair this is the source's statement; for the Hessian pair `c = binom(n, k)^{1/k}` at `F = 0`.

   Add to the §8.6 Checks: "Hessian pair, `1 ≤ k < n`: `c = 1` is impossible for normalized `F`, since `V⁻¹∫ e^{nF} ω_X^n = c^{−n}·V⁻¹∫ σ_k(λ)^{n/k} ω_X^n ≥ c^{−n}·binom(n, k)^{n/k}`; at `(n, k) = (2, 1)`, `F = 0`, `φ = 0` the constant is `c = 2`." Add one sentence to §8.5 saying that it is applied in §8.6 to the rescaled pair `(f/c, Γ)`, and that for the unscaled Hessian pairs with `k < n` its hypotheses have no instance.

   `Suggested.lean`, replace the binders `(K : ℝ)` by `(K₁ K₂ : ℝ)` and the body of the statement by:

   ```lean
       ∃ C : ℝ, ∀ P : AdmissiblePair (finrank ℂ E), P.IsStructural γ → ∀ (c : ℝ) (F φ : X → ℝ),
         ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ F → ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) 2 φ →
         formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x)) = formPowIntegral κ (fun _ ↦ 1) →
         IsNormalizedSolution P κ κ F c φ →
         c ^ finrank ℂ E ≤ K₁ →
         (formPowIntegral κ (fun _ ↦ 1))⁻¹ *
             formPowIntegral κ (fun x ↦ Real.exp (finrank ℂ E * F x) * |F x| ^ p) ≤ K₂ →
         ∀ x, |φ x| ≤ C
   ```

   and the docstring's last sentence by "…every smooth normalized `F` with entropy `≤ K₂`, and every normalized `C²` solution `(c, φ)` of `f(λ_κ[κ + i∂∂̄φ]) = c·e^F` with `c^n ≤ K₁`, `|φ| ≤ C`."

   Tested on the refuting instance: flat torus, `n = 2`, Laplace pair (`γ = 1`), `F = 0`, `φ = 0`, `c = 2`. `IsNormalizedSolution` holds (`μ = (1, 1)`, `f(μ) = 2 = c·e^0`), the normalization holds, `c² = 4 ≤ K₁` for `K₁ ≥ 4`, entropy `0 ≤ K₂`, and the conclusion `0 ≤ C` is a real instance. For `K₁ ≤ 0` the hypothesis `c^n ≤ K₁` contradicts `c > 0`, so the statement stays true.

2. **F02** (P2) The declared gap asks for more than the roadmap needs; the pin already suffices

   **Location.** `packages/ComplexHessianEquations/README.md:102` ("What PDE must provide (gap:weak-harnack-supersolutions): the weak Harnack inequality … `div(a∇u) ≤ f` weakly"), used at `README.md:539` (§5.4, second statement) and through it in §§8.5–8.7.

   **Claim.** The `L¹` bound for `Δ_ω`-subsolutions needs the inhomogeneous weak Harnack inequality, which no pin provides.

   **Witness.** The forcing term can be absorbed by a barrier, after which the pinned homogeneous theorem applies. On a holomorphic chart ball `B = {|z| < R}` with compact closure, `c_0 = inf_B tr_ω(i∂∂̄|z|²) > 0`. For `φ` with `Δ_ω φ ≥ −A`, put `v = −φ + (A/c_0)(R² − |z|²)`.

   | Quantity | Value |
   |---|---|
   | `Δ_ω v` | `−Δ_ω φ − (A/c_0)·tr_ω(i∂∂̄|z|²) ≤ A − A = 0` |
   | sign of `v` on `B` | `−φ ≥ 0` and `R² − |z|² > 0`, so `v ≥ 0` |
   | `v − (−φ)` | between `0` and `AR²/c_0` |
   | divergence form (`dω = 0`, §5.1) | `∂_i(√g g^{ij} ∂_j v) = 2√g·Δ_ω v ≤ 0` |
   | Flat torus, `n = 1`, `φ = (A/2)(−x²)` locally, `c_0 = 2` | `Δ_ω φ = −A/2 ≥ −A`; `Δ_ω v = A/2 − A = −A/2 ≤ 0` |

   So `v` is a nonnegative `C²` supersolution of the homogeneous equation, and `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`) at `s = 1` gives `⨍_{B(x₀, r)} v ≤ C·v(x)` for almost every `x ∈ B(x₀, r)` whenever `B(x₀, 8√m·r) ⊆ B`. Its hypothesis `(m − 2)·s < m` reads `2n − 2 < 2n` at `m = 2n`, `s = 1`. Since `v` is continuous, the bound holds at every `x`. The gap is therefore not minimal.

   **Repair.** Replace the route of the second bullet of §5.4 by:

   > Route: `Δ_ω = (1/2)·laplaceBeltrami` is in divergence form in charts (§5.1), `∂_i(√g g^{ij}∂_j u) = 2√g·Δ_ω u`. On a holomorphic chart ball `B = {|z| < R}` with compact closure put `c_0 = inf_B tr_ω(i∂∂̄|z|²) > 0` and `v = −φ + (A/c_0)(R² − |z|²)`. Then `v ≥ 0`, `Δ_ω v ≤ 0`, and `0 ≤ v + φ ≤ AR²/c_0`, so `v` is a nonnegative weak supersolution of `div(a∇v) = 0` with `a = √g g^{ij}`, measurable and uniformly elliptic on `B`. The pinned weak Harnack inequality `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` at `s = 1` gives `⨍_{B(x₀, r)} v ≤ C·inf_{B(x₀, r)} v` for `B(x₀, 8√(2n)·r) ⊆ B`, the infimum being the ordinary one because `v` is continuous. At a ball containing a maximum point of `φ`, `inf v ≤ AR²/c_0`, which bounds `∫_{B(x₀, r)} (−φ)`; on an overlapping ball the infimum is at most the average over the overlap, and a finite chain of balls covers `X` by connectedness.

   Then: change the `*Needs:*` line of §5.4 to "§§3.1, 5.1; Tau Ceti `TauCeti.le_setAverage_ball_of_laplacian_nonneg` for the first statement and `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` for the second"; add that declaration to the Tau Ceti supplier contract with its file; delete the gap paragraph at `README.md:102`, the scope clause "the weak Harnack inequality for supersolutions" at `README.md:22`, and the gap mentions in the Dependencies and `*Needs:*` lines of Layers 5 and 8 (`README.md:541, 555, 743, 770, 786`). Add a §5.4 Check: "The barrier: on the flat torus with `n = 1`, `tr_ω(i∂∂̄|z|²) = 2`, so `c_0 = 2`; for `φ = −(A/2)x²` near `0`, `Δ_ω φ = −A/2` and `Δ_ω v = A/2 − A = −A/2 ≤ 0`. Without the barrier, `−φ` has `Δ_ω(−φ) = A/2 > 0` and is not a supersolution." The `gaps` entry of `design/plan.json` then has no consumer; whether it is withdrawn there is the worker's bookkeeping.

Two findings, both P2. No P1.

## Verified sound

Dependency check, run on the package README:

```
depcheck: 242 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Counts: 32 declarations read (14 definitions and structures, 18 theorems); all targets of §§1.1–8.7 read (every line of the README); about 65 source locators verified in 11 sources; about 70 README Checks recomputed (the tables below give the values); 31 sibling citations and 55 pinned declarations resolved. The locator and Check counts are tallies made while reading, not a mechanical count.

Elaborated signatures: compared `scratch/signatures.md` with the README for all 32 declarations; nothing changed. The five flagged definitions (`hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow`, `IsNormalizedSolution`) lack `[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]` because their bodies do not use them; every theorem that uses them carries both. I ran no Lean.

### Adversarial table: `Suggested.lean`

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `eigenvalueVector` | `[[2,1],[1,2]]`; `[[1,i],[−i,1]]`; `n = 0` | `(3,1)`; `(2,0)`, Frobenius `2 = √(4+0)`; empty vector | sound |
| `differentiableAt_spectralFunction_iff` | `f = max`, `A = Id`; `f = σ_1`; `n = 0` | `λ_1(Id + t·diag(1,0)) = 1 + max(t,0)`, both sides false; both true; both true | sound; lewis1996 line 77–81 |
| `fderiv_spectralFunction_apply` | `f = μ_1² + μ_2²`, `A = [[0,1],[1,0]]`; Lewis's `U*·U` against the README's `U·U*` | `2(P_+ − P_−) = 2A`; `Re tr(U D U* H) = Σ d_i Re(U*HU)_ii` in both conventions | sound |
| `contDiffOn_spectralFunction_iff` | `μ ↦ diag μ` for the converse; `Ω` symmetric | `diag μ` in the domain iff `μ ∈ Ω`; `f = F_f ∘ diag` | sound; lewis1996 line 468–469 |
| `convex_spectralDomain` | non-convex cone of §1.4 | `diag(1,−0.4)`, `diag(1,0.1)` in, midpoint `diag(1,−0.15)` out | sound; `hΓo` is not needed for truth (note, P3) |
| `concaveOn_spectralFunction` | `det^{1/2}` at `diag(4,1)`, `diag(1,4)`; `σ_2` | `2, 2`, midpoint `5/2`; `det(t·Id) = t²` convex, excluded by `hf` | sound; `hΓo`, `hf1` not needed for truth (note) |
| `IsHyperbolic`, `gardingCone` | `xy`, `x²+y²`, `x+y`, constant `1`, zero polynomial, `N = 0` | roots `−x_1, −x_2`; roots `±i`; root `−(x+y)/2`; cone `ℝ^N` at `m = 0`; `p(a) = 0` fails; `N = 0`, `m ≥ 1` forces `p = 0` | sound |
| `garding` | `p = 2xy − 0.9(x²+y²)`, `a = e`; `m = 0` | discriminant `0.76(x_1−x_2)²`; `D_b p > 0` for `b` in the cone (not for `b = e_1`, which is outside); `m = 0` excluded by `hm` | sound |
| `isHyperbolic_and_gardingCone_eq_of_mem` | `p = xy`, `b = (1,2)` | `(x_1+t)(x_2+2t)`, roots `−x_1`, `−x_2/2`, same quadrant | sound |
| `isHyperbolic_esymm_and_gardingCone_eq` | `(n,k) = (1,1)`, `(3,2)` at `(3,3,−1)`, `(2,2,−1)`, `−e` | `σ = (5,3,−9)` in `Γ_2`; `σ_2 = 0` boundary; `σ_2(−e+te) = 3(t−1)²` root `1 ≥ 0`, out | sound |
| `concaveOn_hessianQuotient` | `(2,2,1)` at `(4,1)`, `(1,4)`; `l = 0`; strict positivity | `0.8, 0.8`, midpoint `1.25`; `σ_0 = 1`; numerator `σ_{k−1;j}σ_{l;j} − σ_{k;j}σ_{l−1;j} > 0` by Newton on `(λ|j)` | sound |
| `AdmissiblePair`, `IsStructural` | `σ_1 − ε|λ|`; shifted quadrant; `n = 0` | negative at `(1,−1+δ)`; fails dilation and `Γ_1`; fields `pos_mem_cone` and `sum_pos_of_mem_cone` contradict, no pair | sound |
| `exists_hessianPair` | `(3,2)`, `(2,1)`, `k = n` | `3^{−3/2}`; `1`; `n^{−n}` | sound |
| `hermitianForm`, `ddbarHermitianForm` | `ω = dx∧dy` on `ℂ`; `|z|²` | `H(1,1) = ω(1,i) = 1`; `H(Ju,v) = −i·H(u,v)`; `2·L_{|z|²} = 2h` | sound |
| `IsRelEigenvalueVector` | `h = diag(2,1)`, `a = diag(2,3)` | `(1,3)` and `(3,1)` qualify, `(2,3)` does not | sound |
| `formPow`, `formPowIntegral` | `ℂ²` standard; degree | `ω²(∂x_1,∂y_1,∂x_2,∂y_2) = 2`; degree `2·finrank ℂ E` matches `complexManifoldOrientation` | sound |
| `eq_of_isNormalizedSolution` | two components; no `sup` normalization; convex cone without concave `f`; `n = 0` | `ψ = −1` on `X_2`; `φ + 1`; route uses only `Γ + Γ_n ⊆ Γ`, convexity of `Sym_Γ` and `C¹`; no pair | sound |
| `existsUnique_yau` | `F = a`; `n = 0`; `n = 1` torus | `b = −a`, `φ = 0`; `X` a point, `∏ = 1`, `b = −F(x)`; `b = −log I_0(ε)` | sound |
| `exists_lintegral_exp_le_of_plurisubharmonic` | `c·log((|z|²+ε)/(4+ε))`; `n = 0`; order of `C`, `A`, `α` | bound forces `αc < n`; point mass, `α = 1/A`, `C = e`; `C = (5/4)^{2n−2}vol(S^{2n−1})C_1/2π` free of `A` | sound |
| `exists_formPowIntegral_exp_le` | `ψ_ε` on `ℂP¹`; two components | `α < 1` forced; excluded by `ConnectedSpace` | sound |
| `exists_abs_le_of_degenerating` | `χ = ω_X`, `F = 0`; `φ = −M` | `c = 1+t`, `φ = 0`; excluded by the zero of `φ` | sound; gpt2023 line 120–130 |
| `exists_abs_le_mongeAmpere_degenerating` | `χ = 0`, `t = 1`; `n = 0` | `c^n = V_t/V` forced, so no relative-volume hypothesis is missing; `C = 0` | sound; gpt2023 line 847–850 |
| `exists_abs_le_of_entropy_le` | Laplace `n = 2`; Hessian `(3,2)`; Monge–Ampère | `4 ≠ 1`; `≥ 5.196 ≠ 1`; `1 = 1` | vacuous off the Monge–Ampère pair: R01 |
| `exists_abs_le_hessian_degenerating` | `k = n`; `q' = q/(q−1)` against `n/(n−k)`; two-valued `F` | §7.2 route; `q > n/k`; `0.398 ≤ 1.310`, `4.633 ≤ 4.725` | sound; gpt2023 line 948–952 |

### Adversarial table: README targets

| Target | Instances and values | Result |
|---|---|---|
| §1.1 | `g⁻¹a = diag(1,3)`; `det(Id + tA) = 1 + 6t + 11t² + 6t³`; `P⁻¹A_a` under `⟨u,Pv⟩` | sound |
| §1.2 | `F = diag(2,1)`, `B = diag(0,3)`: `3 ≤ 3 ≤ 6`; `κ_2 = 4 + |t|` | sound |
| §1.4–1.5 | `f = −σ_1` control; `tr(∇F·T) = 2 = F(T)`; `tr(AB) = 5 ≥ 4` | sound |
| §2.1 | `(1,2,3)`: `12 ≤ 121/9`; `(2,0,2,1)`: `1.915 ≤ 1.833` false as stated; shift `12 = 12`; slope argument for `l ≤ s`, `k ≤ r` | sound |
| §2.2 | `p_c` family: `c = 19` gives `p_19/20 = 2xy − 0.9(x²+y²)`, sector `0.627 < x_2/x_1 < 1.595`; `∂_x p(1, 0.7) = −0.4` | sound |
| §2.3–2.5 | tangent inequality `2 ≤ 4.25`; `σ_2/σ_1` at `(M,1,1)`: `3/(M+2)²`, `(M²+M+1)/(M+2)²`; Lemma 4 route with `μ_i ∝ 1/∂_i f` | sound |
| Conventions, §3 | `Δ_ω|z|² = 2n`; `i∂∂̄(x_1²) = dx_1∧dy_1`; `α∧ω = (σ_1/2)ω²`; PSS dictionary `φ_PSS = 2φ`, `Ric_PSS = ω` on `ℂP¹`; `c_GPT^k = c^k/binom(n,k)` | sound |
| §4 | wedge cone: `f(μ) = 6 > f(ν) = 1.11` | sound |
| §5 | `2Δ_ω u − Δ_g u = −e^{−ρ}⟨∇ρ,∇u⟩` at `m = 4`; Schauder constant `≥ 4·2^α/((1+2π^α)ε)`; Poincaré `1/2 = 2π²/4π²`; gap counterexample `‖f_ε‖_{L^{3/4}} = O(ε^{1/3})` | sound; route of §5.4(2): R02 |
| §6 | torus witness: `S = q'²/(2q³)`, `Δ_{ω_φ}tr h(0) = 2π²a/(1−a)`, `Δ_{ω_φ}S(0) = 8π⁴a²/(1−a)⁴`; `∫ψ(e^F−1) ≥ (1/n)∫|∂ψ|²`; `|b_t| ≤ t·sup|F|` | sound |
| §7 | Jensen `M ≤ 2πA/log(R/R')`; `−G ≤ (1/2π)log(2R'/|t−w|)`; `∫(2R'/|t−w|)^s ≤ 2π(2R')²/(2−s)`; polar formula factor `1/2π`; `Δ_t v_ξ = 2H(ξ,ξ)`; `ℝ⁴` control Laplacian `(|x|²+4ε)(|x|²+ε)^{−5/2}` | sound |
| §8.1–8.4 | De Giorgi: step `< 2^{−jδ_0}`, sum `1/(1−2^{−δ_0})`; `δ_0 = 0` control `re^{−r} ≤ 1/e`; `Φ(s_0)^{δ_0} < 1/(2B_0)`; `∂_j f ≥ 1 − 2δ` for the `C¹` pair | sound |
| §8.5–8.6 | torus `n = 3`: `7.50·10⁻⁵` against `Ent_3 ≈ 4.24·10⁻⁷` | computation sound; hypotheses: R01 |
| §8.7 | entropy bound `x^p e^{−δx} ≤ (p/(eδ))^p`; `(2/e)² = 0.5413` | sound |

Ownership. No roadmap on main or at an open head owns hyperbolic polynomials, Gårding cones, Newton–Maclaurin inequalities on `Γ_k`, derivatives of spectral functions, Yau's theorem in every dimension, or exponential integrability of quasi-plurisubharmonic functions (searched by object with `roadmaps grep` and in both pins). The pins have no non-strict plurisubharmonicity predicate and no De Giorgi lemma of the §8.2 form (`TauCeti/Analysis/SpecificLimits/DecayIteration.lean` is the Campanato iteration, a different statement). K3Surfaces §2.1 (open, later in the merge order) proves the case `n = 2` by its own method; this roadmap is earlier and is the owner of the general theorem, as the README says. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap; `Matrix.IsHyperbolic` in Mathlib is a different namespace and object.

Supplier citations resolved at main: PDE §3.2 (C13) with Gilbarg–Trudinger 3.5 and 9.1, §5.4 (E23), §5.6 (E25); RiemannianGeometry R5c item 4 and `exists_pos_laplaceBeltrami_eigenvalue_isLeast`; DifferentialGeometry Layers 0–1, 5, 12 with the three named declarations; ComplexKahlerGeometry K1, K2, K4, K5a, K6.0; PseudodifferentialOperators §§5.4, 6.2; ComplexManifolds Milestones 1–2; ComplexComparisonPartII C5.4; OptimalTransport Layer 6; AffineMorseLefschetz §1.1; OperatorTheory PD-A51–A53, PA-B32, MAJ-A27. At open heads: K3Surfaces §2.1, NumberFieldEnumeration §1.1, ShimuraVarieties §7.0g. PDE §5.4 states the weak Harnack inequality for solutions of the homogeneous equation only, so the gap is not already planned there.

Policy. The pull request changes only the package folder. No process words, pull-request numbers, `lemma`, `set_option`, `#eval`, sorry'd data or `True` placeholder. Every Lean name is in the README and every backticked own name is declared. Each definition has at least three Checks. No padding found: no declaration follows from one library lemma or restates a definition. Every headline the README lists is stated.

Source independence: 8 passages compared with 6 sources (gpt2023, guo-phong2024, lewis1996, spruck2005, pss2012, tosatti-weinkove2010), none shared; largest share gpt2023, 44 of 147 citations; contents compared with gpt2023: independent (Layer 8 takes its §2, §4, §3, §5 in that order, forced by §8.6 needing §8.5, inside one of eight layers; Layers 1–7 have no counterpart in it).

## Not verifiable

- The locators into the eight uncertified sources (cns1985, ckns1985, kolodziej1998, gilbarg-trudinger2001, yau1978, szekelyhidi2014, tian1987, hormander1990): no text. The `hormander1990` locator is "Chapter IV" only; a theorem number could not be confirmed.
- Whether the published versions of gpt2023 and guo-phong2024 keep the arXiv theorem numbering: the README and manifest cite the arXiv versions read, which is consistent.
- Elaboration of the R01 repair: I ran no Lean; the new statement reuses only binders and terms of the existing one.
- spruck2005 is an OCR of a scan; formulas at line 11076–11083 and 11281–11292 are partly garbled, so the index conditions of Lemma 2.10 were read from line 11279–11282 only.

## Source issues

- **Error** in gpt2023 at (1.1) and Theorem 1, printed page 2–3: the source says the equation is `f = e^F` with `F` normalized to total mass `V`; it should carry a constant `c`, as its own proof does at (3.1)–(3.2), since for `σ_k^{1/k}`, `k < n`, no normalized solution exists; affects a stated result.
- **Error** in gpt2023 at the proof of Theorem 2, after (2.18), printed page 9: the source says the closed-sublevel mass function is continuous; it should be the strict-sublevel function, which is right-continuous, because level sets can have positive measure; affects the proof.
- **Gap** in gpt2023 at (3.3), printed page 11: the source bounds the energy by Hölder with exponent `n/(n−1)`; it should apply Theorem 3(c) at `N = 1` directly, since the exponent is undefined at `n = 1`; affects the proof.
- **Misprint** in gpt2023 at the paragraph after Lemma 4, printed page 17: the source says the quotient example allows `k ≥ ℓ`; it should be `k > ℓ`, since the exponent `1/(k−ℓ)` is undefined at `k = ℓ`; affects nothing.
- **Misprint** in gpt2023 at (5.4), printed page 21: the source says the Hessian equation for `f = σ_k^{1/k}` has right-hand side `c^k e^{kF} ω_X^n`; it should carry the factor `binom(n, k)⁻¹`; affects nothing.
- **Error** in spruck2005 at Corollary 2.4, printed page 289: the source says the cone of every symmetric polynomial hyperbolic in `(1,…,1)` contains the positive cone, with positive partial derivatives; it should assume each `e_i` in the closed cone (`2xy − 0.9(x²+y²)` fails); affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed page 290: the source says equality in Newton's inequalities forces equal components for every real vector; it should restrict the equality clause to positive vectors (`(1,0,0)` gives `0 = 0`); affects nothing.
- **Misprint** in spruck2005 at Proposition 2.7, printed page 290: the source says the range is `1 ≤ r ≤ n`; it should be `1 ≤ r ≤ n − 1`, since `H_{n+1}` is not defined; affects nothing.

## For the human reviewers

- **Licence.** `lewis1996` is recorded as `author-page` in `packages/ComplexHessianEquations/sources.toml`; the extracted text carries a per-page stamp "Copyright 2001 All Rights Reserved" (lewis1996 line 150, 196, 472), which suggests a database scan hosted on the author's page.
- **Licence.** `spruck2005` was read from the Clay Mathematics Institute's download of the whole proceedings volume (`sources.toml`, `version_note`), recorded as `institutional`; the article is an AMS/Clay publication.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "46a43403aba94575f5755ba6da3201a187e2f7c5", "job": "RT-ComplexHessianEquations~1b", "model": "fable", "worker": "chris-x89"} -->
