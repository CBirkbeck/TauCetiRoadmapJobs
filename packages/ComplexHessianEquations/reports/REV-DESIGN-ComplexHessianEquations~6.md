<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13754#issuecomment-6895099046 -->
Review (claude) of b17d842

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §5.3 plans the Poincaré inequality that RiemannianGeometry R5c on main owns

   **Location.** `packages/ComplexHessianEquations/design/README.md:463`: "Prove the Poincaré inequality `‖u − ū‖_{L²} ≤ C ‖du‖_{L²}` for `u ∈ H¹(X)` on a compact connected Riemannian manifold … with `C = λ_1^{−1/2}`". Line 15: "No roadmap on the content repository and no board package owns any of these objects." Plan target 5.3.

   **Claim.** The inequality is a target of this roadmap, and no roadmap on main owns it.

   **Witness.** `TauCetiRoadmap/RiemannianGeometry/README.md:3893–3903` on main (R5c, item 4): on a closed connected `M`, `∫(f−a)² ≤ λ₁(Δ⁺)⁻¹∫|∇f|²` for `f ∈ C^∞(M)`, "owned here"; headline `exists_pos_laplaceBeltrami_eigenvalue_isLeast`, `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:534`. The design does not name RiemannianGeometry.

   The only consumer is §6.2 (line 523, plan target 6.2), which applies the inequality to the smooth function `φ` of mean zero, so the `C^∞` form on main suffices and the `H¹` form is used nowhere.

   **Exact repair.**

   1. In §5.3 replace the sentence "Prove the Poincaré inequality … for the first positive eigenvalue `λ_1`." by: "The Poincaré inequality `‖u − ū‖_{L²} ≤ λ_1(Δ⁺)^{−1/2}‖du‖_{L²}` for smooth `u` on a compact connected Riemannian manifold, `ū` the `g`-mean and `λ_1(Δ⁺)` the first positive eigenvalue of the nonnegative Laplace–Beltrami operator `Δ⁺ = −2Δ_ω`, is RiemannianGeometry R5c (item 4); it is consumed, not re-proved." Change the `*Needs:*` line to "RiemannianGeometry R5c; Tau Ceti `TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`" (ComplexKahlerGeometry K5a is then unused in §5.3). Keep the three Checks as Checks of the consumed statement. Rename the heading to "5.3 The Poincaré and Sobolev inequalities consumed" or keep it.
   2. Add `### From TauCetiRoadmap.RiemannianGeometry`: "R5c, item 4: on a closed connected Riemannian manifold the first positive eigenvalue `λ₁(Δ⁺)` exists, and `∫(f − a)² ≤ λ₁(Δ⁺)⁻¹∫|∇f|²` for `f ∈ C^∞(M)` with `a` its mean. Applied to smooth functions only (§6.2)."
   3. In Scope (line 15) add RiemannianGeometry R5c to the list of consumed owners, and in "This roadmap leaves" name it beside PDE.
   4. Add "RiemannianGeometry R5c" to the `*Needs:*` line of §6.2 and to the Dependencies of Layers 5 and 6.
   5. `plan.json`: target 5.3 takes the prerequisite `roadmap:RiemannianGeometry R5c`, loses `roadmap:ComplexKahlerGeometry K5a`, and its statement says the Poincaré inequality is consumed; `suppliers` gains RiemannianGeometry with section `R5c`.

   Tested on the instances of the present Checks: the circle of length `2π` has `λ₁(Δ⁺) = 1` and `u = sin` gives `π ≤ π`; on the torus `ℂ²/ℤ⁴` of §6.2, `φ = ε cos 2πx_1` has `∫φ² = ε²/2` and `λ₁⁻¹∫|∇φ|² = (4π²)⁻¹·4π²ε²/2 = ε²/2`. RiemannianGeometry is on main, so the edge is allowed.

2. **F02** (P3) §§6.3 and 6.5 take the `C⁰` bound from §6.2, which is stated for `n ≥ 2` only

   **Location.** `packages/ComplexHessianEquations/design/README.md:552`: "`‖φ‖_{C⁰} = osc_X φ` is bounded by §6.2"; line 533: "Combined with §6.2 and the equation it gives `C⁻¹ω ≤ ω_φ ≤ Cω`". Line 523: "Prove, for `n ≥ 2`, that `osc_X φ ≤ C(n, sup_X F, ω)`".

   **Claim.** The routes of §§6.3 and 6.5 cover the layer's standing dimension `n ≥ 1`.

   **Witness.** Layer 6 (line 496) sets no bound on `n`, and §6.6 states the estimates for `n ≥ 1`. At `n = 1`, §6.2 gives nothing (its Check at line 529 says so), so the cited input of §6.5 is missing. The statements are true at `n = 1`.

   **Exact repair.** In §6.3 write "Combined with §6.2 for `n ≥ 2` and the equation it gives …; for `n = 1`, `ω_φ = e^F ω` directly." In §6.5 after "is bounded by §6.2" add "for `n ≥ 2`; for `n = 1` the equation is `Δ_ω φ = e^F − 1`, and §5.2 bounds `φ − mean(φ)` in `C^{k+2,α}` by `C‖e^F − 1‖_{C^{k,α}}`, hence `osc φ` and both quantitative bounds". Instance: torus `ℂ/(ℤ + iℤ)`, `F = log(1 − a cos 2πx)`: `φ = (a/2π²)cos 2πx − a/2π²`, `osc φ = a/π²`, bounded by `‖e^F − 1‖_{C⁰}/(2π²)·2 = a/π²`.

3. **F03** (P3) §8.4 takes `χ ≤ ω_X`, which the hypotheses do not give

   **Location.** `packages/ComplexHessianEquations/design/README.md:661`: "The energy bound uses §7.2 for the `2ω_X`-quasi-plurisubharmonic `φ_t` (taking `χ ≤ ω_X`)".

   **Claim.** `φ_t` is `2ω_X`-quasi-plurisubharmonic.

   **Witness.** `χ = 3ω_X`, `t = 1`: `ω_t = 4ω_X`, and a function with `i∂∂̄φ = −2.5·ω_X` at a point is `ω_t`-admissible there (`4 − 2.5 > 0`) but `2 − 2.5 < 0`. The wording is the reduction of gpt2023 line 809–811.

   **Exact repair.** Replace the clause by "uses §7.2 with `ω̂ = a_0ω_X`, where `χ ≤ (a_0 − 1)ω_X` as in §8.1, so that `ω_t ≤ a_0ω_X` and `a_0ω_X + i∂∂̄φ_t ≥ 0`". On the instance, `a_0 = 4` gives `4 − 2.5 > 0`. The stated dependence `C(n, ω_X, χ, Ent_1(F_t))` already carries `χ`.

4. **F04** (P3) §3.4 has no `*Needs:*` line, and Layer 5 names a layer it does not use

   **Location.** `packages/ComplexHessianEquations/design/README.md:381–397` (§3.4) and line 492: "Layers 3–4; ComplexKahlerGeometry K5a, K6.0; …".

   **Claim.** Every target lists its needs; every layer's dependencies are those of its targets.

   **Witness.** §3.4 is the only subsection without a `*Needs:*` line. Its API bullet `c_t^n/V_t = 1/V` (line 388) uses the Kähler invariance of §3.2, and plan target 3.4.1 lists only `target:3.3.1`. No `*Needs:*` line of §§5.1–5.4 names Layer 4.

   **Exact repair.** Add to §3.4 "*Needs:* §§3.2–3.3; Layer 2 §2.4." and to plan target 3.4.1 the prerequisite `target:3.2`. In the Layer 5 Dependencies write "Layer 3" for "Layers 3–4". Check: with `χ = ω_X`, `∫ω_{t,φ}^n = ∫ω_t^n = (1 + t)^n V` is the §3.2 identity the bullet needs.

5. **F05** (P3) the Aubin–Yau equation is handed to Part II without its existing owner

   **Location.** `packages/ComplexHessianEquations/design/README.md:723`: "Further Part II directions are subsolution theory, Hessian-equation existence and the Kähler–Einstein (Aubin–Yau) equation `(ω + i∂∂̄φ)^n = e^{φ+F}ω^n`".

   **Claim.** The Part II named here is the owner of that equation.

   **Witness.** ShimuraVarieties §7.0g at its open head (README line 1993–1995, target `TauCeti.Shimura.compact_negative_ke_metric`) constructs the Kähler–Einstein metric of a variety with ample canonical bundle "by the negative-first-Chern-class complex Monge–Ampère argument". ShimuraVarieties is line 105 of the merge order, earlier than this roadmap.

   **Exact repair.** Add to that bullet: "ShimuraVarieties §7.0g owns the existence and uniqueness of the Kähler–Einstein metric for an ample canonical bundle; a Part II that treats the Aubin–Yau equation cites that target and states only what it adds." Add one clause to the Scope sentence at line 25 naming the same section. Nothing of this roadmap's own changes.

6. **F06** (P3) the locator of §1.4 covers a narrower setting than the statement

   **Location.** `packages/ComplexHessianEquations/design/README.md:164`: "Prove, for an open convex symmetric `Γ ⊆ ℝⁿ` and a symmetric `C¹` function `f : Γ → ℝ` (spruck2005 Theorem 1.4 and its proof, line 11066–11100)".

   **Claim.** The source supports the statement as written.

   **Witness.** spruck2005 line 11069–11072 assumes a symmetric open convex cone with vertex at the origin, a smooth `f`, and real symmetric matrices. Open convex sets that are not cones, `C¹` functions and `RCLike 𝕜` are the roadmap's own, by the route given. This is the pattern of round 5's F04.

   **Exact repair.** Write the locator as "(spruck2005 Theorem 1.4 and its proof, line 11066–11100, for a smooth `f` on a symmetric convex cone and real symmetric matrices; the routes below need neither the cone, nor more than `C¹`, nor `𝕜 = ℝ`)". Plan target 1.4 takes the same qualifier. Instance outside the source's setting: `Γ = {μ ∈ ℝ² : μ_1, μ_2 > −1}`, `f = log(1 + μ_1) + log(1 + μ_2)`, `𝕜 = ℂ`: `F_f = log det(Id + T)` is concave on `{T > −Id}`, as the first two bullets give.

7. **F07** (P3) statements of §8.7 and Checks of §§8.4 and 8.7 are named by the source's lemma numbers

   **Location.** `packages/ComplexHessianEquations/design/README.md:700–702`: "- Lemma 7: …", "- Lemma 8: …", "- Theorem 5: …"; line 666: "so Lemma 6 applies"; lines 708 and 710: "excluded from Lemma 8", "Lemma 8 gives".

   **Claim.** Each statement is named by its mathematics, the source being a locator.

   **Witness.** The three bullets of §8.7 have no name but gpt2023's numbering, and three Checks refer to "Lemma 6" and "Lemma 8" with no source key. Round 4's F04 removed the labels T1–T4 for the same reason.

   **Exact repair.** Head the bullets "The Hölder bound for the energy (gpt2023 Lemma 7):", "The `L^{p'}` bound for `Γ_k`-admissible functions (gpt2023 Lemma 8):" and "The Hessian estimate (gpt2023 Theorem 5):". In the Checks write "the energy bound of this section" (line 666) and "the `L^{p'}` bound" (lines 708, 710), and in line 702 "The `L^{p'}` bound is applied with background `a_0ω_X`".

Seven findings: one P2 and six P3; one blocking. All four round-5 findings are repaired, and the repaired statements hold on every instance I computed. The blocking finding is new: §5.3 plans the Poincaré inequality on a closed Riemannian manifold, which RiemannianGeometry R5c on main already owns and which the design never cites. The repair is local to §5.3, the Scope paragraph, one supplier subsection and plan target 5.3; no section number moves. This is a design review: there is no `Suggested.lean`, and no Lean command was run.

## Previous findings and repairs

Quotations are from `packages/ComplexHessianEquations/design/README.md` unless `plan.json` is named.

| Round-5 finding | Repaired passage and what I recomputed | Status |
| --- | --- | --- |
| F01, Levi form at the pin | Line 32: "Put `H_{i∂∂̄u} = 2·L_u`, and let `i∂∂̄u` be the real (1,1)-form `(i∂∂̄u)(v, w) = Im H_{i∂∂̄u}(v, w)`"; line 65, the Tau Ceti bullet; line 323: "The sum, composition and pullback rules … are the pinned …". With `α = i Σ a_{jk̄} dz^j ∧ dz̄^k` and `A(v, w) = Σ a_{jk̄} v̄^k w^j`: `α(v, w) = 2·Im A(v, w)`, so `H_α = 2A`, and the pinned matrix entry `(k, j)` is `u_{jk̄}`: `H = 2L`. `x_1²`: `(D²u(Jv, w) − D²u(v, Jw))/2 = (0 + 2)/2 = 1`. Composition rule at `u = |z|²`, `γ = t²`: `4|z|² = 2|z|² + 2|z|²`, with the pinned factor `1/4` on `conj(2∂u(v))·2∂u(w)`. Plan target 3.1.3 is gone, 3.1.2 carries the Tau Ceti prerequisites. | Repaired |
| F02, superadditivity | Line 270: "(Tau Ceti `Real.prod_rpow_add_prod_rpow_le_prod_add_rpow` at the weights `1/n`; spruck2005 line 11314)"; lines 252, 272, 317, 66; line 175 for `LinearMap.concaveOn_det_rpow`. Pin: weights `≥ 0` summing to `1`, `a, b ≥ 0`. `(1,4)`, `(4,1)`: `2 + 2 ≤ 5`. | Repaired |
| F03, §2.1 and §2.2 | Line 209 ends "*Needs:* Mathlib `MvPolynomial.esymm`, `Polynomial.card_roots_le_derivative`."; line 216: "`σ_2(λ + εe) = 0 + 2·3ε + 3ε² > 0`". `(2,2,−1)`: `σ = (3, 0)`; `ε = 1`: `σ_2(3,3,0) = 9`. | Repaired |
| F04, locator of §5.4 | Line 475: "for a closed form `ω̂` with continuous local potentials on a compact Kähler manifold, line 138–141; the route below needs neither closedness of `ω̂` nor the Kähler condition"; line 606 the same for §7.2. guedj-zeriahi2005 line 138–141 and pss2012 line 2946 read. | Repaired |

The repaired patterns were searched in the rest of the design. F01's pattern (an object owned elsewhere and planned again) recurs once, against a roadmap on main: R01. F04's pattern recurs once: R06. F03's pattern does not recur: the plan's prerequisites have no forward edge.

## Verified sound

### Principles and shape

- General library: Layers 1–2 over `RCLike 𝕜`, every hyperbolic polynomial of positive degree, every admissible pair; Layers 3–4 without a Kähler hypothesis; Yau's theorem for `n ≥ 1`. No algorithm, copied passage, `set_option` or sorry'd data.
- Not a re-plan: no ComplexHessianEquations on main (head `1a19c9f`), at an open head or among the two board packages listed; `scratch/overlaps.md` reports no second copy, no pull request changing this roadmap, no dropped id.
- Organisation: eight layers named by their mathematics. No sentence says the roadmap follows a source.
- Shape: every layer ends with Examples and Dependencies. Checks per definition: §1.1 (7), §1.2 (3), §1.3 (3), §2.2 (10), §2.4 (7), §3.1 (4), §3.3 (3), §3.4 (4). A search for LaTeX delimiters, pull-request numbers, dates, machine paths, "round", "repair", "removed", "optional" and "deferred" finds nothing. The README advertises no Lean name of its own.
- Plan: 47 targets; every `target:` prerequisite exists and points backwards; every definition has at least three tests; baseline commits equal the pins.
- Declared gap `gap:weak-harnack-supersolutions`: same slug in the README (line 94) and the plan; supplier PDE §5.4 (E23). Precise and minimal: the pin (`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`) and E23 on main (line 1965–2003) have the homogeneous weak Harnack inequality only; `Regularity/Inhomogeneous.lean` treats solutions, not supersolutions. Counterexamples recomputed: `‖f_ε‖_{L^{3/4}} = c·ε^{1/3}`, `‖u_ε‖_{L¹(−2,2)} → 4`, and at `q = 1` the norm tends to `2`. Not a finding.

### Adversarial table

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 relative eigenvalues | `⟨u,v⟩ = 2ū₁v₁ + ū₂v₂`, `a = diag(2,3)`; `−a`; change of inner product | `g⁻¹a = diag(1,3)`, `λ = (3,1)` against `(3,2)`; `(−1,−3)`; `⟨u, Av⟩ = ⟨u, P⁻¹Av⟩'` | Holds |
| §1.2 Ky Fan sums | `F = diag(2,1)`, `B = diag(0,3)`; `T = diag(3,1,1)`, `m = 2` | `3 ≤ 3 ≤ 6`; `κ_2(T + t·diag(0,1,−1)) = 4 + |t|` | Holds; gap needed |
| §1.3 Lewis's theorem | `σ_2` at `[[2,1],[1,2]]`; `max`; `μ_1² + μ_2²` | `det·T⁻¹ = [[2,−1],[−1,2]]` against `diag(1,3)`; `1 + max(t,0)`; `2T` | Holds |
| §1.4 concavity, monotonicity | `σ_2^{1/2}` at `(4,1)`; wedge cone | `∂ = (1/4, 1)`; `(1,−0.4)`, `(1,0.1)` in, `(1,−0.15)` out | Holds; locator: R06 |
| §1.5 | `σ_2^{1/2}`, `T = diag(1,4)`; `σ_2` | `∇F = diag(1,1/4)`, `det = 1/4`, `tr(∇F·T) = 2`; `8 = 2·4` | Holds |
| §2.1 | `(1,2,3)`; `(3,2,2,1)`, `(3,1,2,0)`, `(2,0,2,1)`; `k = 0` | `12 ≤ 121/9`; `18/11 ≤ 11/6`, `1.732 ≤ 1.915`, `1.915 > 1.833`; `1 ≠ 1·1 + 1` | Holds |
| §2.2 | `p = 2xy − 0.9(x²+y²)`; `p_c` | `p(x+te) = 0.2t² + 0.2(x_1+x_2)t + p(x)`, discriminant `0.76(x_1−x_2)²`; `p(1,0.1) = −0.709`; `p(1,0.7) = 0.059`, `∂_x p = −0.4`; sector `0.627 < x_2/x_1 < 1.595`; `p_19/20 = p` | Holds in both directions |
| §2.3 tangent inequality | `σ_2^{1/2}`, `λ = (1,4)`, `μ = (4,1)`; `min` at `(1,2)` | `2 ≤ 4.25`; `1 ≤ 2` | Holds |
| §2.4 Lemma on the structural constant | `μ_i = (∏∂_jf)^{1/n}/∂_if`; `f_1 = f_2 = σ_1` | `nγ^{1/n} ≤ f(μ) ≤ n(∏∂_jf)^{1/n}`; `2^n = (1+1)^n` | Holds |
| §2.5 | Hessian `n = 3`, `k = 2`; quotient `(M,1,1)`; `n = 2` | `3^{−1/2} = binom(3,2)^{1/2}/3`; `∂_1 = 3/(M+2)²`, `∂_2 = (M²+M+1)/(M+2)²`; `λ_1²λ_2²/(λ_1+λ_2)⁴ → 0` | Holds |
| §3.1 | `x_1²`, `|z|²`, `Re z_1²`; `γ = t²` | `1`; `H = 2h`, `λ = 2e`; `0`; `4|z|²` on both sides | Holds |
| §3.2 mixed inequality | `n = k = 2`, `α = diag(4,1)`, `β = diag(1,4)` | `M_2 = (16 + 1)/2 = 8.5 ≥ 2·2` | Holds |
| §3.4 | `χ = ω_X`; `F = a`; `q ≤ p` | `c_t^n/V_t = (1+t)^n/((1+t)^nV)`; `e^{na} ≤ e^{na}|a|^p + e^n`; `|F|^q ≤ 1 + |F|^p` | Holds; Needs line: R04 |
| §4.2 uniqueness | two components; `φ + 1`; wedge pair `σ_1`, `10σ_1` | `ψ = (0, −1)`; same `c`; `f(1,−0.4) = 6 > f(1.01,0.1) = 1.11` | Holds |
| §5.1 | `∫vΔ_ωu ω^n` by Stokes; `ω = e^ρω_0` on `ℂ²` | `−n∫i∂u∧∂̄v∧ω^{n−1}`; difference `−e^{−ρ}⟨∇ρ,∇u⟩` at `m = 4` | Holds |
| §5.2 | `cos 2πx`; `j^{−α}sin jx`; `(u, β)` map | `Δ_ω⁻¹ = −cos/(2π²)`; quotient `(2/π)^α`; `β = −mean(v)` | Holds |
| §5.3 | circle; torus; `n = 1, 2` | `π ≤ π`; `ε²/2 ≤ ε²/2`; `2 < 2` false, `8/2 = 4` | Holds; ownership: R01 |
| §5.4 | chart identity; `ψ_ε` on `ℂP¹` | `∂_i(√g g^{ij}∂_ju) = 2√gΔ_ωu`; `ω' + i∂∂̄ψ_ε = i∂∂̄log(|z|²+ε) ≥ 0`, `sup = 0` at `∞` | Holds |
| §6.1 | torus `n = 1`, `q = 1 − a cos 2πx` | `S = q'²/(2q³)`; `x = 0`: `2π²a/(1−a)` both sides; `x = 1/4`: `0 = −2π²a² + 2π²a²`; `Δ'S = 8π⁴a²/(1−a)⁴`, `32π⁴` at `a = 1/2` | Holds |
| §6.3 | `A = C_1 + Λ + 1`; `n = 1` | `tr h⁻¹ ≤ An` at the maximum, `tr h ≤ (An)^{n−1}e^{sup F}`; `tr h = e^F` | Holds; route at `n = 1`: R02 |
| §6.4 | `ω_φ = ω`; torus of §6.2 | `S = 0`; `∂_{z_1}h_{11} = 2π³ε sin 2πx_1` | Holds |
| §6.5 | `n = 1` torus | `osc φ = a/π²` from §5.2, §6.2 silent | Statement holds; R02 |
| §6.6 Yau | `F = a`; `n = 1`, `F = ε cos 2πx`; pair form | `b = −a`; `b = −log I_0(ε)`; `e^{F'}χ^n = e^{nF}ω_X^n`, `c^n = ∫χ^n/V` | Holds |
| §7.1 | Green bound; `α ≤ α_1`; polar formula at `g = 1`; `u_ε` in `ℝ⁴` | `|R'² − tw̄| ≤ 2R'²`; `αM/2π ≤ 1`; `vol(S)ρ^{2n}/(2n)`; `Δ = (s+4ε)(s+ε)^{−5/2}`, radial `(1/4)(2ε − s)(s+ε)^{−5/2}` | Holds |
| §7.2 | `u = ψ + A|z|² − sup ψ − 4A`; `ℂP¹` | `u ≤ 0` on `B(0,2)`; `∫|z|^{−2α}` finite iff `α < 1` | Holds |
| §8.1 | `φ_t ≡ 0`; `s = −inf φ_t` | `Ω_s = ∅`; `A_s = 0` excluded | Holds |
| §8.2–8.3 | `s_{j+1} − s_j < 2B_0Φ(s_j)^{δ_0}`; Chebyshev on `Ω_s^∘` | sum `≤ 1/(1 − 2^{−δ_0})`; `sΦ(s) < E` unless `Φ(s) = 0`; `(1+n)/(qn) = 1 + (p−n)/(pn)` | Holds |
| §8.4 | `χ = 3ω_X`; Jensen | `2 − 2.5 < 0`, `4 − 2.5 > 0`; `αE_t ≤ log(C/V) + n·Ent_1` | Statement holds; R03 |
| §8.5 | `n = 1`; `q = 1 − 0.03 cos`, `n = 3` | `det a = Ĝ²/16`; `mean(q log q)/3 ≈ 7.5·10⁻⁵`, `Ent_3 ≈ 4.24·10⁻⁷` | Holds |
| §8.6 | `χ = 0`, `t = 1`; `p' = n`, `N = 1` | `c_1 = 1`, `V_1 = V`; `Ent_n ≤ 1 + Ent_p` | Holds |
| §8.7 | `ω_t ≤ a_0ω_X`; conjugates | `χ + tω_X ≤ (a_0 − 1 + 1)ω_X`; `q' = n/(n−k)` gives `q = n/k` | Holds; labels: R07 |
| Contract, Aleksandrov–Bakelman–Pucci | `m = 1`, `u = 1 − x²` on `(−1,1)` | `1 ≤ 0 + C·2·2` | Holds |

### Source sample

The author flagged no locator as unverified. All fifteen seeded sections were read at their locators.

| Section | What I read |
| --- | --- |
| 1.1 | szekelyhidi2018 line 17–24; gpt2023 line 62–66; guo-phong2024 line 108–111. Supported. |
| 1.3 | lewis1996 line 77–81 (Theorem 1.1), 144, 185–187 (Lemma 2.3), 165–166 (Lemma 2.2), 199–217 (Theorem 2.4), 468–469; spruck2005 line 11072–11073. Supported; the source states continuous differentiability pointwise. |
| 2.1 | spruck2005 line 11257–11293 (Lemma 2.6, Proposition 2.7, Corollary 2.8, Lemma 2.10 with `r ≥ k`, `s ≥ l`). Supported. |
| 2.2 | spruck2005 line 11182–11235 (Definition 2.1, Theorem 2.2, Proposition 2.3, Corollary 2.4). Supported; the README corrects Corollary 2.4. |
| 2.5 | gpt2023 line 90–93 and 770–776; guo-phong2024 line 76–104. Supported. |
| 3.1 | gpt2023 line 62–66; szekelyhidi2018 line 17–24. Supported. |
| 3.4 | gpt2023 line 82–83 ((1.3)), 101–119 ((1.6)–(1.9)), 450–451 ((3.2)), 785–803 (Lemma 5). Supported. |
| 5.2 | No readable source is cited beyond the supplier sections, which resolve; gilbarg-trudinger2001 Theorem 6.2 is uncertified. |
| 5.3 | pss2012 line 278–288 ((3.5)–(3.6)), 299–303. Supported. |
| 5.4 | guedj-zeriahi2005 line 138–141 and 255–274; gpt2023 line 689–692. Supported with the qualifier now stated. |
| 6.4 | pss2012 line 1046–1081 ((7.1)–(7.7), Theorem 9); twwy2015 line 132–136. Supported. |
| 7.2 | pss2012 line 2943–2955 (Theorem 31); gpt2023 line 280–289. Supported with the qualifier now stated. |
| 8.1 | gpt2023 line 197–302 (Lemma 1, `τ_k`, (2.3)–(2.11)); constants depend on `n, ω_X, χ, γ`. Supported. |
| 8.3 | gpt2023 line 120–130 (Theorem 2), 303–441 ((2.12)–(2.19), Lemma 2). Supported; the README repairs the continuity claim of line 407. |
| 8.5 | gpt2023 line 458–476 (Theorem 3), 488–500 (Lemma 3), 546 ((3.13)), 619, 689–692, 713–736. Supported. |

Also read: gpt2023 line 740–769 (Lemma 4), 804–850 (Lemma 6, Theorem 4); pss2012 line 245–308 (Theorem 3).

### Pins, duplication and suppliers

- Pins: the checkouts are at Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`, the commits of README lines 43 and 55.
- Tau Ceti declarations opened at the pin, all present: `Analysis/Complex/LeviForm.lean:119` (`leviForm`), `128`, `135`, `142` (`leviForm_apply_self`), `150` (`re_leviForm_nonpos_of_isLocalMax`), `223`, `248`, `270`; `Geometry/Manifold/Complex/LeviForm.lean:106` (`manifoldLeviForm`), `156`, `165`, `172`, `179`, `206`, `241`, `292` (under `[IsManifold 𝓘(ℂ, E) 2 M]`), `343`; `Geometry/Manifold/Complex/MaximumPrinciple.lean:64`; `Analysis/Complex/QuadraticLeviForm.lean:187`; `Analysis/Complex/Wirtinger/LeviForm.lean:79`; `Analysis/MeanInequalities.lean:68`; `Analysis/Matrix/MinkowskiDeterminant.lean:159`; `Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464`; `Geometry/Manifold/Riemannian/Sobolev.lean` (`exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`); `Analysis/PDE/Regularity/Harnack.lean:284`. The pinned composition rule carries the factor `1/4` on the complex-linear extension `2∂u`, as line 65 says. The pin has no non-strict plurisubharmonicity predicate, as line 65 says.
- By object at the pins: no Newton or Maclaurin inequality for `esymm`, no hyperbolic polynomial, no derivative of eigenvalue functions, no `i∂∂̄` as a section, no Poincaré inequality on a manifold, no weak Harnack inequality with a forcing term. The pinned strong maximum principles are for `−Δ − b·∇ + c` (`Analysis/InnerProductSpace/Laplacian/StrongMaximumPrinciple.lean`) and for divergence-form weak subsolutions (`Analysis/PDE/MaximumPrinciple/Strong.lean`); §4.2 needs a continuous variable principal part in non-divergence form and cites PDE §3.2 (C13), which plans it (main, line 1355–1361). The pin also has interior Schauder estimates (`Analysis/PDE/Regularity/Hessian/Schauder/`); the design cites their roadmap owner PDE §5.6 (E25), which is allowed.
- Supplier sections resolved on main: PDE §3.2 (C13) line 1344, §5.4 (E23) line 1965, §5.6 (E25) line 2097; PseudodifferentialOperators §5.4 line 1337, §6.2 line 1523; ComplexKahlerGeometry K1 line 370, K2 line 558, K4 line 1091 (Chern connections line 1134), K5a lines 1440–1948, K6.0 line 2321; DifferentialGeometry Layers 0, 1, 5, 12 at lines 691, 862, 1644, 2796, with `integral_mul_laplaceBeltrami` (line 432); ComplexManifolds Milestones 1–2 lines 172, 197; OptimalTransport Layer 6 line 2421; OperatorTheory PD-A51, PA-B32, MAJ-A27; AffineMorseLefschetz §1.1 line 315. Open heads: K3Surfaces §2.1 (line 528), ComplexComparisonPartII C5.4 (line 3718, with positive currents and the regularization of plurisubharmonic functions), NumberFieldEnumeration §1.1 (line 172, Maclaurin's bound at line 195).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Manifest: 19 entries, one per cited work; the References list the same 19 works. Nothing was fetched; `needs-references.toml` was not created.

Overlap check: read PDE, ComplexKahlerGeometry, ManifoldOptimization, YangMillsConnectionsAndCaloricGauge (open); PDE, Yamabe, RiemannianGeometry (main); the third list is empty. Shared objects: the Poincaré inequality on a closed Riemannian manifold, owner RiemannianGeometry R5c (R01); the Levi form, owner the pinned Tau Ceti (settled in round 6); Maclaurin's inequality, shared with NumberFieldEnumeration §1.1 and settled in the Scope paragraph; the Kähler–Einstein metric for an ample canonical bundle, owner ShimuraVarieties §7.0g, not owned here (R05). ManifoldOptimization consumes OperatorTheory's Ky Fan theory for extremal values and states no derivative of spectral functions.

Dependency check, run on the candidate (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Headline theorems and padding

Headlines from the Summary: Lewis's derivative theorem and spectral concavity (§§1.3–1.4); Gårding's theorem and Hessian-quotient concavity with the structural constants (§§2.2–2.5); uniqueness (§4.2); Yau's theorem (§6.6); uniform exponential integrability (§7.2); the Guo–Phong–Tong estimates (§§8.3, 8.6, 8.7). Elaboration: not available (this lane does not elaborate). There is no `Suggested.lean` at the design stage, so there is nothing to probe for padding and no signature to compare.

### Copyright and arrangement

- Wording: 17 passages set beside their sources (the statements of gpt2023 Theorems 1–3, Lemmas 1, 2, 4 and 6; lewis1996 Theorem 1.1; spruck2005 Definition 2.1, Theorem 2.2, Corollary 2.4 and Lemma 2.10; pss2012 Theorems 3, 9 and 31; guedj-zeriahi2005 Proposition 1.7; guo-phong2024 conditions (1)–(4)). Shared text is formulas and parameter lists only; the longest shared run is the dependence list of gpt2023 Theorem 2, which is forced.
- Arrangement: gpt2023 has the largest share. Its sections against the design: §2 ↔ §§8.1–8.3, §3 ↔ §§8.5–8.6, §4 ↔ §2.4 (one lemma) and §8.4, §5 ↔ §8.7. The design's order is §2, §4, §3, §5 of the source, and Layers 1–7 have no counterpart in it; the edges 8.1 → 8.3, 8.5 → 8.6 and 8.4 → 8.7 force the order within Layer 8.
- Reuse: no table, figure or list is taken over.

Source independence: 17 passages compared with 6 sources, none shared; largest share gpt2023, 40 of 138 locator mentions; contents compared with gpt2023: independent.

### Maintainer notes

None were left for this roadmap.

## Not verifiable

- The eight uncertified works (`cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`) are settled and were not requested; their locators are unread. This covers the contracts quoted from gilbarg-trudinger2001 (Theorems 3.5, 6.2, 8.18, 9.1, Lemma 17.16).
- Displayed formulas of spruck2005 and lewis1996 are partly garbled by OCR (Corollary 2.8, Lemma 2.10, Lemma 2.12; lewis1996 Theorem 2.1); the hypotheses were legible and the statements were recomputed.
- Lean elaboration, the one-tactic probe and `#check` comparison: no Lean file exists and this lane does not elaborate. The pinned declarations were read, not elaborated.
- Open pull requests were read through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-15; the open roadmaps of the closest list were compared by scope and by object search, not target by target.
- Sections outside the seeded sample (§§1.4, 1.5, 6.3, 8.4, 8.6, 8.7 and others) were recomputed, and their locators were read where a finding or a headline touches them; for the rest the locators rely on round 5's reading.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, printed p.289: the source says the cone of every symmetric polynomial hyperbolic in `(1, …, 1)` contains the positive cone and has positive partial derivatives; it should assume the coordinate vectors lie in the closed cone, as `2xy − 0.9(x² + y²)` shows; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates for every real tuple; it should restrict the equality clause to positive tuples, since `(1, 0, 0)` gives equality; affects a stated result.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source places the quotient plus `cσ_p^{1/p}` on `Γ_k` for every `p`; it should use `Γ_{max(k,p)}`, where `σ_p` is positive; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17: the source allows `k = ℓ` in the exponent `1/(k − ℓ)`; it should require `ℓ < k`; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass function continuous; it should use strict sublevels, which give right-continuity when a level set has positive measure; affects the proof.
- **Gap** in gpt2023 at Lemma 1, arXiv v1 p.5: the source states the estimate for every `s > 0`; it should require `inf φ_t < −s`, since otherwise the normalizing energy `A_s` is zero; affects a stated result.
- **Gap** in gpt2023 at the proof of Theorem 3(c), arXiv v1 p.16: the source bounds the signed moment of `F` by the entropy alone; it should add a constant, since `|F| ≤ 1 + |F|^p` is what holds; affects the proof.
- **Gap** in gpt2023 at the proof of Lemma 6, arXiv v1 p.18: the source assumes `χ ≤ ω_X` without loss of generality; it should take `a_0` with `χ ≤ (a_0 − 1)ω_X`, as in its Lemma 1, the constant then depending on `χ`; affects the proof.
- **Gap** in gpt2023 at (3.3), arXiv v1 p.11: the source applies Hölder's inequality with exponent `n/(n − 1)`; it should treat `n = 1` separately, where part (c) of its Theorem 3 at `N = 1` gives the bound directly; affects the proof.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from the author's page (`packages/ComplexHessianEquations/sources.toml`, `licence_class = "author-page"`); it is cited for one proposition in §7.1. `lewis1996` and `spruck2005` are read from an author page and an institutional copy.
- **Scope.** The main sources are refereed (Ann. of Math. 2023 and 2024, J. Amer. Math. Soc. 2010, Math. Oper. Res. 1996); nothing observed places the subject outside published research mathematics.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b17d8424c99a88e82f84423f97b1f58d2a05fe0b", "job": "REV-DESIGN-ComplexHessianEquations~6", "model": "fable", "worker": "chris-x30"} -->
