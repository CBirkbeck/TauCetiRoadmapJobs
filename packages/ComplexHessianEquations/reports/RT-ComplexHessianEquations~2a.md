<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17935#issuecomment-6907551591 -->
Red team round 2 pass a (claude) of d1d49b5

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.6: the sentence on an unnormalized right-hand side has the wrong locator and omits which entropy enters

   **Location.** `packages/ComplexHessianEquations/README.md:763`: "For an unnormalized right-hand side
   `e^{F̃}`, as in gpt2023 (1.1), `c^n = V⁻¹ ∫ e^{nF̃} ω_X^n ≤ Ent_p(F̃) + e^n` (§3.4) supplies `c̄`."

   **Claim.** gpt2023 (1.1) has an unnormalized right-hand side, and the bound on `c^n` is what the
   unnormalized case needs.

   **Witness.** gpt2023 line 67–70 states (1.1) with `F` normalized; the unnormalized reading is (3.1),
   line 443–447. The estimate needs `Ent_p(F)` for `F = F̃ − log c`, which `Ent_p(F̃)` does not bound:
   `n = 1`, `V = 1`, `p = 2`, `F̃ = 0` on measure `e^{−10}`, `−30` elsewhere gives `c ≈ e^{−10}`,
   `Ent_2(F̃) ≈ 8.4·10⁻¹¹`, `Ent_2(F) ≈ 100`.

   **Repair.** Replace the sentence by: "For a right-hand side `e^{F̃}` with `F̃` not normalized, as in
   the proof of gpt2023 Theorem 1 ((3.1), line 443–447), write `e^{F̃} = c·e^F` with `F = F̃ − log c`
   normalized. Then `c^n = V⁻¹ ∫ e^{nF̃} ω_X^n ≤ Ent_p(F̃) + e^n` (§3.4) supplies `c̄`. The entropy in the
   bound is `Ent_p(F)`, which `Ent_p(F̃)` does not control (see the Checks)." Add to the §8.6 Checks: "The
   entropy of the normalized function is the one that enters: for `n = 1`, `V = 1`, `p = 2` and the
   two-valued `F̃ = 0` on a set of measure `e^{−10}`, `F̃ = −30` elsewhere, `c = e^{−10} + (1 − e^{−10})e^{−30}
   ≈ e^{−10}` and `Ent_2(F̃) = (1 − e^{−10})·e^{−30}·900 ≈ 8.4·10⁻¹¹`, while `F = F̃ − log c` equals `≈ 10`
   on the small set, where `e^F ≈ e^{10}`, so `Ent_2(F) ≈ e^{−10}·e^{10}·100 = 100`." Tested on the
   instance: the repaired sentence asserts only `c^n ≤ Ent_p(F̃) + e^n`, here `e^{−10} ≤ 8.4·10⁻¹¹ + e`.

2. **F02** (P3) `isHyperbolic_and_gardingCone_eq_of_mem` carries a hypothesis `1 ≤ m` that it does not need

   **Location.** `packages/ComplexHessianEquations/Suggested.lean:164–166`: "`(hp : IsHyperbolic p m a)
   (hm : 1 ≤ m) (hb : b ∈ gardingCone p a) : IsHyperbolic p m b ∧ gardingCone p b = gardingCone p a`".

   **Claim.** The independence of the direction needs degree `m ≥ 1`.

   **Witness.** `m = 0`: `p` is a constant `C c` with `c > 0`. For every `b`, `p` is homogeneous of degree
   `0`, `eval b p = c > 0` and `lineRestriction p x b = C c` splits; both cones are the whole space.
   `README.md:254` says only "the conclusions … that involve the degree assume `m ≥ 1`".

   **Repair.** In `Suggested.lean` delete `(hm : 1 ≤ m)` from `isHyperbolic_and_gardingCone_eq_of_mem` and
   in its docstring replace "A hyperbolic polynomial of degree `m ≥ 1` is hyperbolic" by "A hyperbolic
   polynomial is hyperbolic". In `README.md:256`, after "(`garding` and
   `isHyperbolic_and_gardingCone_eq_of_mem` in `Suggested.lean`)", add: "The independence of the direction
   holds also for `m = 0`, where every cone is `ℝ^N`, and `isHyperbolic_and_gardingCone_eq_of_mem` does not
   assume `m ≥ 1`; the other clauses need it (Checks)." Tested on the instance `N = 2`, `p = 1`, `m = 0`,
   `a = (1, 1)`, `b = (−1, 0)`: the statement without `hm` gives `IsHyperbolic 1 0 b` and `univ = univ`,
   both true. `garding` keeps `hm` (at `m = 0` its derivative clause reads `0 < 0`).

Two P3 findings (S01, S02). All seven findings of round 1 are repaired at this head, and no repair
introduced a false statement.

## Round 1 findings at this head

| Finding | Status | Witness at `d1d49b5` |
| --- | --- | --- |
| 1a/F01 (P1) §7.1 Green–Riesz, Jensen and general subharmonic functions unowned | repaired | `packages/ComplexHessianEquations/README.md:657`: "Let `c ∈ ℂ`, `ρ > 0`, and let `v` be `C²` on a neighbourhood of the closed disc"; the representation is a target with a route through pinned declarations only; line 659 restates the one-variable estimate for `C²` `v` with `Δv ≥ 0`; the `*Needs:*` of line 661 lists all 19 pinned names of the route. Checked at the pin: `planarGreenKernelDisk c R a z` has pole `a` and variable `z`, is positive, vanishes for `z` on the circle, and `w ↦ G(a, w) − N(R⁻¹(w − a))` is harmonic on the disc, as the route uses them. Recomputed: `v = |w|²`, `v(0) = 1 − 1`, `v(1/2) = 1 − 3/4`. |
| 1a/F02 (P3) generalized Young inequality unowned | repaired | `README.md:722`: "The pointwise inequality is `y^p·e^{nF_t} ≤ e^{nF_t}(1 + n|F_t|)^p + (p/e)^p·e^{2y}` for `y ≥ 0`", with a two-case proof. Recomputed: `log(1 + e^x) ≤ 1 + |x|`; `sup y^p e^{−y} = (p/e)^p`. |
| 1a/F03 (P3) `convex_spectralDomain` padding | repaired | The declaration is absent from `Suggested.lean` (31 declarations) and from the README; `README.md:194` says "`concaveOn_spectralFunction` … states the second item, and with it the first at `f = 0`". |
| 1a/F04 (P3) uniqueness narrower in "How to read the build" | repaired | `README.md:108`: "for every admissible pair with a convex cone, in particular every concave admissible pair". |
| 1a/F05 (P3) docstring `L^q` norm | repaired | `Suggested.lean:443`: "(the `q`-th power of the `L^q` norm of `e^{nF}`)". |
| 1b/F01 (P2) fixed-background estimate vacuous for `k < n` | repaired | `Suggested.lean:429–436`: `∀ (c : ℝ) (F φ : X → ℝ)`, `IsNormalizedSolution P κ κ F c φ →`, `c ^ finrank ℂ E ≤ K₁ →`; `README.md:763` states the theorem with `c` and `c̄ ≥ c^n`. Instance: Laplace pair, `n = 2`, flat torus, `F = 0`, `φ = 0`, `c = 2`, `K₁ = 4`: all hypotheses hold, conclusion `0 ≤ C`. The route's rescaled pair `(σ_1/2, Γ_1)` has `∏∂_j = 1/4 = γ/c²`. See S01 for one sentence of the new text. |
| 1b/F02 (P2) gap not minimal | repaired in the README | `README.md:541` gives the barrier route; `README.md:69` cites `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` with the hypotheses of the pin (read at `TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`: `(card ι − 2)·s < card ι`, `ball x₀ (8·√(card ι)·r) ⊆ Ω`, conclusion almost everywhere on `ball x₀ r`). Recomputed: `Δ_ω v = −Δ_ω φ − (A/c_B)·tr_ω(i∂∂̄|z|²) ≤ A − A`. The README names no `gap:` slug. The entry `weak-harnack-supersolutions` of `design/plan.json` remains, with `neededBy` 5.4.2, 8.5, 8.6, 8.7; the repair report records that the gate refused its removal. It is not raised here (see Verified sound, Declared gap). |

## Verified sound

**Dependency check** (run as the brief gives it):

```
depcheck: 246 roadmaps, 2298 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The pull request changes only `packages/ComplexHessianEquations/`
(README.md, Suggested.lean, metadata.toml, sources.toml and three reports).

**Counts.** 31 declarations read (all 466 lines of `Suggested.lean`); all 824 README lines read, every
target of the 35 numbered sections; 38 source locators verified against the cached texts (gpt2023 19,
lewis1996 5, spruck2005 5, pss2012 3, tosatti-weinkove2010 2, dinew-kolodziej2014 2, demailly2012 1,
guedj-zeriahi2005 1); 52 Checks recomputed (values below); 18 sibling citations resolved on main; 90
pinned names located at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, of which the 14 statements that the
round 1 repairs rely on were read in full.

**Elaborated signatures.** No Lean was run (the brief gives no elaboration command for this pass). The 31
elaborated types of the job's `signatures.md` were compared with the README. The five flagged
definitions (`hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow`,
`IsNormalizedSolution`) lack only `[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]`, which their
bodies do not use; every theorem carries both. `exists_abs_le_of_entropy_le` elaborates with `K₁ K₂`,
`∀ (c : ℝ)` and `c ^ finrank ℂ E ≤ K₁`, as README §8.6 states. Nothing changes.

**The pass, one row per declaration.**

| Declaration (line) | Instances tried and values computed | Result |
| --- | --- | --- |
| `hermitianMatrices` (65) | `n = 0`: zero space; `[[0,1],[0,0]]` not self-adjoint | ok |
| `eigenvalueVector` (71) | `[[2,1],[1,2]]` ↦ `(3,1)`; `[[1,i],[−i,1]]` ↦ `(2,0)`, Frobenius `2 = √(4 + 0)` | ok |
| `differentiableAt_spectralFunction_iff` (77) | `f = max`, `A = Id₂`: `λ_1(Id + t·diag(1,0)) = 1 + max(t,0)`, both sides false; `f = σ_1`: both true; `n = 0`: both true; lewis1996 line 77–81 | ok |
| `fderiv_spectralFunction_apply` (88) | `f = μ_1² + μ_2²`, `A = [[0,1],[1,0]]`, `H = A`: `U*HU = diag(1,−1)`, sum `2·1·1 + 2·(−1)(−1) = 4 = tr(2A·A)`; Lewis's `U*·U` and the README's `U·U*` agree after `U ↔ U*` | ok |
| `contDiffOn_spectralFunction_iff` (103) | `f = F_f ∘ diag` gives the converse; `Ω` open symmetric so the domain is open; lewis1996 line 468–469 states the pointwise form | ok |
| `concaveOn_spectralFunction` (114) | `det^{1/2}`: `2, 2` at `diag(4,1)`, `diag(1,4)`, `5/2` at the midpoint; ordering `∂_1 f = 1/4 ≤ ∂_2 f = 1` at `(4,1)`; `f = 0` gives convexity of the domain; non-convex cone: midpoint `diag(1,−0.15)` outside, excluded by `hΓc` | ok |
| `lineRestriction` (130) | `p = xy`, `a = (1,1)`, `x = (2,−1)`: `(2 + t)(−1 + t)` | ok |
| `IsHyperbolic` (137) | `x² + y²`, `a = (1,0)`, `x = (0,1)`: `t² + 1` does not split; `p = 1`, `m = 0`: holds for every `a` | ok |
| `gardingCone` (141) | `xy`: open quadrant; `x + y`: half-plane; `p = 1`: whole space | ok |
| `hessianCone` (145) | `k = 0`: whole space; `(3,3,−1)`: `σ = (5,3,−9)`, in `Γ_2 ∖ Γ_3` | ok |
| `garding` (152) | `m = 0`: derivative clause `0 < 0`, excluded by `hm`; `N = 0`, `m ≥ 1`: `p = 0`, vacuous; `p = 2xy − 0.9(x² + y²)`: `p(1, 0.1) = −0.709`, `∂_x p(1, 0.7) = −0.4` with `e_1` outside the cone, no contradiction | ok |
| `isHyperbolic_and_gardingCone_eq_of_mem` (164) | `p = xy`, `b = (1,2)`: roots `−x_1`, `−x_2/2`, same quadrant; `m = 0`: true without `hm` | true; S02 |
| `isHyperbolic_esymm_and_gardingCone_eq` (172) | `eval 1 σ_k = binom(n,k) > 0`; `n = 3`, `k = 2`: `σ_2 + 2σ_1 t + 3t²`; `−e`: `3(t − 1)²`, root `1 ≥ 0`, outside both sides; `n = 1`, `k = 2` excluded by `hkn` | ok |
| `concaveOn_hessianQuotient` (180) | `(n,k,l) = (2,2,1)`: `0.8, 0.8`, midpoint `1.25`; `∂_1 = λ_2²/σ_1² > 0`; `l = 0`: `σ_0 = 1`; exponent uses real subtraction | ok |
| `AdmissiblePair` (193) | `n = 0`: `pos_mem_cone` puts the empty vector in the cone and `sum_pos_of_mem_cone` gives `0 < 0`, no pair; `σ_1 − ε‖λ‖` on `Γ_1` qualifies with a negative value at `(1, −1 + δ)` | ok |
| `AdmissiblePair.IsStructural` (210) | `σ_2/σ_1`, `n = 2`: `λ_1²λ_2²/σ_1⁴ ≈ ε²` at `(ε, 1)`; `σ_n^{1/n}`: `n^{−n}` | ok |
| `exists_hessianPair` (217) | `∂_j f(e) = (1/k)·binom(n,k)^{1/k − 1}·binom(n−1,k−1) = binom(n,k)^{1/k}/n`; `(3,2)`: `3^{−3/2}`; Lemma 4 form: `nγ^{1/n} = binom(n,k)^{1/k}` by Maclaurin | ok |
| `hermitianForm` (239) | `H(Ju, v) = α(u,v) − i·α(u,Jv) = −i·H(u,v)` for invariant `α`; `ω = dx ∧ dy`: `H(1,1) = ω(1,i) = 1` | ok |
| `ddbarHermitianForm` (245) | `α = 0`, `φ = ‖z‖²`: `2h`; with `D²u = 2⟨·,·⟩`, `Re L = ⟨v,w⟩`, `Im L = ⟨Jv,w⟩ = ω(v,w)` | ok |
| `IsRelEigenvalueVector` (252) | `h = diag(2,1)`, `a = diag(2,3)`: `(1,3)` and `(3,1)`, not `(2,3)`; `n = 0`: empty vector | ok |
| `formPow` (257) | `m = 0`: constant `1`; `ℂ²`: `ω²(∂x_1,∂y_1,∂x_2,∂y_2) = 2` | ok |
| `formPowIntegral` (264) | torus `ℂ/(ℤ + iℤ)`: `1`; point: `g(pt)` | ok |
| `IsNormalizedSolution` (270) | `χ = ω`, `F = 0`, `φ = 0`: `c = f(e)`; `φ = −1` excluded by the zero; `c ≤ 0` excluded | ok |
| `eq_of_isNormalizedSolution` (290) | at a maximum of `ψ − φ`: `c'e^F = f(λ[χ_ψ]) ≤ f(λ[χ_φ]) = ce^F`; two components fail, excluded; non-convex cone: `f(1,−0.4) = 6 > f(1.01, 0.1) = 1.11`, excluded by `hΓ`; `n = 0` vacuous | ok |
| `existsUnique_yau` (315) | `F = a`: `(−a, 0)`; `n = 0`: `∏ = 1` forces `b = −F(pt)`, `φ = 0`; tosatti-weinkove2010 line 38–47, 52–59 | ok |
| `exists_lintegral_exp_le_of_plurisubharmonic` (333) | route constants: `1/4 + 7/4 = 2`, `R/R' = 12/11`, `αM/2π ≤ 1`, `∫ (2R'/|t − w|)^s ≤ 2π(2R')²/(2 − s)`, `C = (5/4)^{2n−2}·vol(S^{2n−1})·C_1/2π` free of `A`; `u_ε = c·log((|z|² + ε)/(4 + ε))` forces `αc < n`; `n = 0`: `α = 1/A`, `C = e` | ok |
| `exists_formPowIntegral_exp_le` (351) | `ψ = 0`: `V`; `ψ + A|z|² − sup ψ − 4A ≤ 0` on `B(0,2)`; `ℂP¹`: `α < 1` forced, `α` is existential; `n = 0`: `1 ≤ C` | ok |
| `exists_abs_le_of_degenerating` (377) | `χ = κ`, `F = 0`: `φ = 0`, `c = 1 + t`, `c^n/V_t = 1/V`; `δ_0 = (p − n)/(pn)` from the Hölder exponent `p(n+1)/n`; gpt2023 line 120–130 | ok |
| `exists_abs_le_mongeAmpere_degenerating` (400) | `c^n V = V_t` forced; `χ = 0`, `t = 1`, `F = 0`: `φ = 0`; `φ = −M` excluded by the zero; `n = 0`: `C = 0` | ok |
| `exists_abs_le_of_entropy_le` (426) | Laplace `n = 2`: `c = 2`, real instance at `K₁ = 4`; Hessian `(3,2)`: `c = √3`; Monge–Ampère: `c = 1`; `K₁ ≤ 0`: no instance since `c > 0`; follows from gpt2023 Theorem 1 for `(f/c, Γ)` with constant `γ/c^n ≥ γ/K₁` | ok |
| `exists_abs_le_hessian_degenerating` (446) | `q > n/k ⇔ q' < n/(n − k)`; entropy bound at `n = 1`, `p = q = 2`: `0.5413·(1 + 1.421) = 1.310 ≥ 0.398`; `K₁ ≤ 0` vacuous; gpt2023 line 948–952 | ok |

**README targets recomputed** (those of the round 1 repairs in full, the others by instance).

| Target | Instances and values | Result |
| --- | --- | --- |
| §1.2 | lower bound from `−B`: `−3 ≤ 2·0 + 1·(−3)`; `κ_2(diag(3,1,1) + t·diag(0,1,−1)) = 4 + |t|` | ok |
| §1.4 | transposition argument: `(μ_j − μ_i)(∂_i f − ∂_j f) ≥ 0`; `⟨y↑, λ(T)⟩ = min_U Re tr(U diag(y) U* T)` | ok |
| §1.5 | `tr(AB) = 5 ≥ 4`; `σ_2`: `tr(∇F·T) = 8 = 2F` | ok |
| §2.1 | `(1,2,3)`: `S = (2, 11/3, 6)`, `12 ≤ 121/9`, `18/11 ≤ 11/6`; `(2,0,2,1)`: `1.915 ≤ 1.833` false, excluded by `l ≤ s`; shift expansion at `e`, `t = 1`: `3 + 6 + 3 = 12`; spruck2005 line 11279–11282 has `r ≥ k`, `s ≥ l` | ok |
| §2.2 | `p = 2xy − 0.9(x² + y²)`: `p(e) = 0.2`, discriminant `0.04(x_1 + x_2)² − 0.8p = 0.76(x_1 − x_2)²`; `σ_k = D_e^{n−k}σ_n/(n−k)!` from `D_eσ_k = (n − k + 1)σ_{k−1}` | ok |
| §2.3–2.5 | tangent inequality `2 ≤ 4·1 + 1·(1/4)`; Lemma 4 with `μ_i = (∏∂_j f)^{1/n}/∂_i f`; quotient pair `∂_j f ≥ c·∂_jσ_p^{1/p}` | ok |
| Conventions, §3.1 | `L_{x²}(1,1) = 2/4 = 1/2 = γ''·|∂u(1)|² = 2·(1/4)`; `H_{i∂u∧∂̄u}(1,1) = 1/2` for `u = x`; `|∂u|²_ω = (1/2)|du|²_g` | ok |
| §3.2–3.4 | `α^k ∧ ω^{n−k}/ω^n = S_k`; `c^n V = ∫ f^n`; `Ent_q ≤ 1 + Ent_p` for normalized `F`, `q ≤ p` | ok |
| §4 | wedge cone `6 > 1.11`; `f(λ(h_1)) − f(λ(h_0)) = Re tr(a·H_{i∂∂̄w})` | ok |
| §5.2 | Schauder Check: quotient `8π²·2^α`, `‖Lu_j‖ ≤ 2π²(1 + 2π^α)ε`, `C ≥ 4·2^α/((1 + 2π^α)ε)` | ok |
| §5.4 | barrier `Δ_ω v ≤ 0`, `0 ≤ v + φ ≤ AR²/c_B`; `(2n − 2)·1 < 2n`; torus `c_B = 2`, `Δ_ω v = −A/2` | ok |
| §6.2, 6.4–6.6 | `∫ ψ(e^F − 1)ω^n = ∫ i∂ψ∧∂̄ψ∧T ≥ (1/n)∫|∂ψ|²`; torus `ψ̄ = 1 + ε`; `∂_{z_1}h_{11} = 2π³ε sin 2πx_1`; `|mean φ| ≤ osc φ` when `sup φ = 0`; `Δ_ω(tF + b_t) = tΔ_ω F` | ok |
| §7.1 Green representation | `∫(v − h + q)Δχ = ∫χΔv − 0 − ∫χΔv = 0`; `v = |w|²`: `0` and `1/4`, opposite sign `2` and `7/4`; kernel bound `|1 − conj(w−c)(a−c)/ρ²| < 2` | ok |
| §7.1 Jensen | `v_ε = (1/2)log(|w|² + ε)`: `2π∫_0^1 s/(s² + ε) ds = π·log((1 + ε)/ε)`, right side `(1/2)log ε` | ok |
| §7.1 one-variable Checks | `233/64 < 4`; total mass `2π`; `α_1 = log(8/7)/log 4 = 0.0963`; recentred: `233/256 < 1`, `α_1 c = log(4/3)/log 4 = 0.2075`; `ℝ⁴`: Laplacian `(r² + 4ε)(r² + ε)^{−5/2}`, radial Levi eigenvalue `(1/4)(2ε − s)(s + ε)^{−5/2}` | ok |
| §8.2 | `r < 2B_0φ(s_j)^{δ_0} ≤ 2^{−jδ_0}`; hypothesis extends to `s = 0` by right-continuity; `φ = (1/4)·1_{[0,1/4)}`: `r/4 < 1/16` | ok |
| §8.3 | `25e^{10} = 5.5·10⁵`, `(2/e)²e^{10} = 1.2·10⁴`, `121e^{10} = 2.7·10⁶`; Chebyshev strictness on the open set `Ω_{s_0}^∘` | ok |
| §8.4 | `αE_t ≤ log(C/V) + n·V⁻¹∫F e^{nF} ≤ log(C/V) + n·Ent_1` | ok |
| §8.6 | Jensen for `x^{k/n}`: `∫e^{kF} ≤ V`, `c ≥ binom(n,k)^{1/k}`; `n = 1` Laplace: `V = cV` | ok; S01 |
| §8.7 | two-valued `F`: `4.633 > 4.184`, `4.725 ≥ 4.633`; `u = φ/a_0` reduces the background `a_0ω_X` to `ω_X` | ok |

**Suppliers.** Resolved on main: PDE §3.2 (C13) (strong maximum principle with Gilbarg–Trudinger 3.5 and
the Aleksandrov–Bakelman–Pucci estimate with 9.1, as the contract restates them), §3.4 (C15), §5.4 (E23),
§5.6 (E25) (`holderOnWith_iteratedFDeriv_two_of_schauder`, same constants); RiemannianGeometry R5c with
`exists_pos_laplaceBeltrami_eigenvalue_isLeast`; DifferentialGeometry Layers 0, 5, 12 with
`integralTopForm_mextDeriv_eq_zero`, `integral_mul_laplaceBeltrami`, `riemannianVolumeForm`;
ComplexManifolds Milestones 1–2; PseudodifferentialOperators §§5.4, 6.2; AffineMorseLefschetz §1.1;
OperatorTheory PD-A51 (in its PolarDecomposition part); ComplexComparisonPartII C5.4; OptimalTransport
Layer 6; ComplexKahlerGeometry K5a, K6.0, whose conventions `g(u,v) = ω(u,Jv)` and `h = g + iω`,
conjugate-linear in the first slot, are those of this README. All suppliers are on main. K3Surfaces,
NumberFieldEnumeration and ShimuraVarieties are named for delimitation only. The worker's citation check
lists no cross-roadmap citation found nowhere; its nine Lean names are the fields of `AdmissiblePair`,
declared in `Suggested.lean`.

**Declared gap.** The README states no gap. `design/plan.json` still lists `weak-harnack-supersolutions`
(supplier PDE §5.4), which round 1 showed is not needed and which no README target consumes. The repair
report explains why the entry stays (the gate refuses its removal while plan targets name it) and tells
the maintainer that PDE need not supply it. The reason holds, so it is not raised again.

**Ownership.** Searched by object with `roadmaps grep` on main and at the open heads: Calabi conjecture
and Yau's theorem, Monge–Ampère, hyperbolic polynomials and Gårding cones, Maclaurin, spectral
functions, exponential integrability and the α-invariant, Jensen's formula and Green–Riesz, Ky Fan,
Aubin–Yau and Calabi estimates, quasi-plurisubharmonic functions, and the declaration names. The only
neighbours are those the README delimits (K3Surfaces §2.1, ShimuraVarieties §7.0g, NumberFieldEnumeration
§1.1, OptimalTransport Layer 6, PDE §3.4, OperatorTheory). PDE's exponential integrability is the
Trudinger and John–Nirenberg forms, a different statement. The pins have no Maclaurin, Gårding or
hyperbolicity statement, no Green representation of a given function, and only the strict
plurisubharmonicity predicates `TauCeti.IsStrictlyPlurisubharmonicAt` and
`TauCeti.IsManifoldStrictlyPlurisubharmonicAt`. No declaration of `Suggested.lean` has the fully
qualified name of a declaration in another roadmap.

**Headlines and padding.** Headlines: Lewis's theorem (three forms); concavity of spectral functions;
Gårding's theorem with independence of the direction; `Γ(σ_k, e) = Γ_k`; concavity of Hessian
quotients; the Hessian pair with its sharp constant; uniqueness; Yau's theorem; the local and the global
exponential integrability; gpt2023 Theorems 2, 4, 1 and 5. All are stated, none through a stand-in, and
the module docstring says that all are statable. No declaration follows by one tactic or one library
lemma, restates a definition or mirrors a Check.

**Policy.** No process words, pull-request numbers, `lemma`, `set_option`, `#eval`, `#check`, sorry'd
data or `True` placeholder in the README or the Lean file; every numbered section has a locator; every
definition has at least three Checks.

**Notes that are not findings.** `hΓo` and `hf1` in `concaveOn_spectralFunction` are not needed for
truth; the README states the same generality and its route uses them. `cns1985` and `ckns1985` occur only
in the reference list.

Source independence: 16 passages compared with 8 sources, none shared beyond formulas and hypothesis lists that can be written in one way only; largest share gpt2023, 46 of 131 locators; contents compared with gpt2023 (§1 introduction, §2 proof of Theorem 2, §3 proof of Theorem 1, §4 Monge–Ampère, §5 other equations): independent. Layer 8 takes them as §§8.1–8.3 ↔ §2, §8.4 ↔ §4, §§8.5–8.6 ↔ §3, §8.7 ↔ §5, an order its `*Needs:*` lines force (§8.6 needs §§8.3 and 8.5; §8.7 needs §§8.3–8.4), and Layers 1–7 have no counterpart there.

## Not verifiable

- `cns1985`, `ckns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`,
  `tian1987`, `hormander1990`: uncertified; no text was read. The README gives `hormander1990` as
  "Chapter IV" and `tian1987` with no internal locator; I could not confirm a theorem number in either.
- The truth of the Lean statements as elaborated was read from the elaborated signatures, not
  re-elaborated. The repair of S02 changes one signature and was not elaborated.
- gpt2023 (2.6)–(2.15): the constants `ε`, `Λ` and `B_0` are cited by number; only `δ_0` was recomputed.
- The curvature identities of §6.1 in general dimension: checked on the `n = 1` torus witnesses and on
  `ω_φ = sω` only.
- spruck2005 is an OCR text; the displayed formulas of Lemma 2.10 are partly garbled, and its index
  conditions were read from line 11279–11282.

## Source issues

- **Error** in gpt2023 at (1.1) and Theorem 1, printed page 2–3: the source says the equation has right-hand side the exponential of a normalized function, with no constant; it should carry a positive constant, as its proof introduces at (3.1), since Hessian pairs below top degree admit no such solution; affects a stated result.
- **Gap** in gpt2023 at (3.3), printed page 11: the source says the energy is bounded by Hölder's inequality with the exponent `n/(n − 1)`; it should treat dimension one separately, where that exponent is undefined; affects the proof.
- **Misprint** in gpt2023 at Theorem 5, printed page 20: the source says the constant depends on the dimension, the index, the exponent, the two forms, the `L^q` norm and the relative volume; it should also list the structural constant, on which Theorem 2 depends; affects nothing.
- **Misprint** in gpt2023 at the paragraph after Lemma 4, printed page 17: the source says the quotient example allows equal indices; it should require the upper index strictly larger, since the exponent is the reciprocal of their difference; affects nothing.
- **Misprint** in gpt2023 at (5.4), printed page 21: the source says the Hessian equation for the `k`-th root of the elementary symmetric function has no binomial factor; it should carry the factor `binom(n, k)⁻¹` on the right, or a rescaled constant; affects nothing.
- **Error** in spruck2005 at Corollary 2.4, printed page 289: the source says the cone of every symmetric polynomial hyperbolic in the all-ones direction contains the positive cone, with positive partial derivatives; it should assume the coordinate vectors lie in the closed cone (`2xy − 0.9(x² + y²)` fails); affects a stated result.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from its author's page (`packages/ComplexHessianEquations/sources.toml`, entry `demailly2012`, `licence_class = "author-page"`); the README cites it for Proposition 4.22 and Corollary VI.6.5.
- **Licence.** `spruck2005` is recorded as `institutional` (`sources.toml`, entry `spruck2005`); it is an article of an AMS/Clay proceedings volume, and 16 README locators point into it.
- **Licence.** `lewis1996` is recorded as `author-page` (`sources.toml`); its extracted text carries a per-page stamp "Copyright 2001 All Rights Reserved" (lewis1996 line 150).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d1d49b528662ab92e6fa21c28e8e45bce53fc5e7", "job": "RT-ComplexHessianEquations~2a", "model": "fable", "worker": "chris-x29"} -->
