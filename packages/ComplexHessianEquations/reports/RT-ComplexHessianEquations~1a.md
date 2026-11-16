<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17935#issuecomment-6906644341 -->
Red team round 1 pass a (claude) of 46a4340

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §7.1: the Green–Riesz representation, Jensen's formula and general subharmonic functions have no owner

   **Location.** `packages/ComplexHessianEquations/README.md:654`: "every subharmonic `v : D(0, R) → [−∞, 0]` … The
   Green–Riesz representation on `D(0, R')` (demailly2012 Proposition 4.22 …) writes `v = ∫ G_{R'}(·, w) dμ(w) + h`";
   and the `*Needs:*` of line 656.

   **Claim.** The one-variable estimate is proved from Jensen's formula for the Riesz measure, the
   Green–Riesz representation on a disc and Harnack's inequality, all taken from demailly2012.

   **Witness.** A citation is not a supplier. The `*Needs:*` line names only `TauCeti.leviForm_apply_self`,
   `TauCeti.le_setAverage_ball_of_laplacian_nonneg` and `ConvexOn.map_integral_le`. At the pin the ball Green
   identity is `TauCeti.integral_laplacian_mul_ballGreenKernel (hn : 3 ≤ n)` only
   (`TauCeti/Analysis/PDE/GreenFunction/DistributionalLaplacian.lean:42`); no disc representation of a `C²`
   function exists, and no carrier for `[−∞, 0]`-valued subharmonic functions or Riesz measures (the pin has only
   continuous `SubharmonicOn`). Mathlib's `Mathlib/Analysis/Complex/JensenFormula.lean` is for meromorphic
   functions. PDE §3.4 (C15) plans the Green representation of the Dirichlet solution operator for smooth compactly
   supported data, not the representation of a given `C²` function. Harnack's inequality is pinned and not cited:
   `InnerProductSpace.HarmonicOnNhd.harnack_inequality_center` (`TauCeti/Analysis/PDE/Harnack/Planar.lean:116`) has
   exactly the constant `(R' + r)/(R' − r)` the route uses. The sign also differs: the README's `G_{R'} ≤ 0`,
   the pinned `TauCeti.planarGreenKernelDisk` is positive (`planarGreenKernelDisk_pos`, `…/GreenFunction/Disk.lean:76`).
   The only use of the estimate (line 656) is for `C²` slices, where `μ = Δv·λ`.

   **Repair.** (a) Restate the one-variable estimate at the generality that is used and owned: replace "every
   subharmonic `v : D(0, R) → [−∞, 0]` on the disc `D(0, R) ⊂ ℂ`, continuing subharmonically to a neighbourhood of
   the closed disc, with `v(0) ≥ −A`" by "every `v` that is `C²` on a neighbourhood of the closed disc `D̄(0, R) ⊂ ℂ`
   with `Δv ≥ 0` and `v ≤ 0` there and `v(0) ≥ −A`", and read `μ` as the measure `Δv·λ`.
   (b) Add, before the route, the target: "Prove the Green representation on a disc: for `ρ > 0`, `v` of class `C²`
   on a neighbourhood of `D̄(c, ρ)` and `a ∈ D(c, ρ)`, `v(a) = h(a) − ∫_{D(c,ρ)} G_ρ(a, w)·Δv(w) dλ(w)`, where
   `G_ρ = TauCeti.planarGreenKernelDisk c ρ ≥ 0` (normalized by `−(2π)⁻¹ log|w − a|` at the pole) and `h` is the
   harmonic function on `D(c, ρ)`, continuous on the closure, equal to `v` on the circle
   (`TauCeti.exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere`). At `a = c` it is Jensen's formula
   `v(c) = m_ρ − (2π)⁻¹ ∫_{D(c,ρ)} log(ρ/|w − c|)·Δv(w) dλ(w)`, with `m_ρ` the circle mean. Route: the pinned
   identity `TauCeti.integral_laplacian_mul_planarNewtonianKernel_sub` applied to a `C²` compactly supported
   extension of `v`, the harmonicity of the correction term of `planarGreenKernelDisk`
   (`TauCeti.harmonicAt_planarGreenKernelDisk_sub_newtonianKernel`), and Green's theorem on the disc
   (DifferentialGeometry Layer 5.6)." (c) In the route write `−G_{R'}` as `G_{R'} ≥ 0` of the pin, with
   `G_{R'}(t, w) ≤ (1/2π)·log(2R'/|t − w|)`, and cite Harnack as
   `InnerProductSpace.HarmonicOnNhd.harnack_inequality_center`. (d) Extend the `*Needs:*` of §7.1 and the Layer 7
   Dependencies, and the Tau Ceti supplier contract, by: `TauCeti.planarGreenKernelDisk`,
   `TauCeti.planarGreenKernelDisk_pos`, `TauCeti.integral_laplacian_mul_planarNewtonianKernel_sub`,
   `TauCeti.exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere`,
   `InnerProductSpace.HarmonicOnNhd.harnack_inequality_center`; DifferentialGeometry Layer 5.6; and, for the polar
   coordinates of the second step, Mathlib `MeasureTheory.Measure.toSphere` with
   `MeasureTheory.Measure.measurePreserving_homeomorphUnitSphereProd`
   (`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`). Keep demailly2012 Proposition 4.22 as the locator.
   (e) The Checks at lines 660 and 662 use `log|t − w_0|`, which is not `C²`: restate them on the smooth functions
   `v_ε = (1/2)·log((|t − w_0|² + ε)/(4R²))`, `ε ↓ 0` (Riesz density `2ε(|t − w_0|² + ε)^{−2}`, total mass `< 2π`,
   tending to `2π`), where the threshold `α < 2` appears as the uniformity in `ε`. Tested on the refuting instance:
   with (a)–(d) every input of the route is a target of §7.1, a pinned declaration or DifferentialGeometry Layer 5.6.

2. **F02** (P3) §8.3: "the generalized Young inequality" is an input with no owner

   **Location.** `packages/ComplexHessianEquations/README.md:714`: "The route is §8.1 with the generalized Young
   inequality for `η(x) = (log(1 + x))^p`, Hölder's inequality and §8.2".

   **Claim.** Young's inequality `ab ≤ ∫_0^a η + ∫_0^b η⁻¹` for an increasing `η` is available.

   **Witness.** `Mathlib/Analysis/MeanInequalities.lean` (section `Young`, line 532) has only the power form
   `ab ≤ a^p/p + b^q/q`; nothing in the pinned Tau Ceti states the integral form; `*Needs:*` is "§§3.4, 8.1–8.2".

   **Repair.** Replace "with the generalized Young inequality for `η(x) = (log(1 + x))^p`" by: "with the pointwise
   inequality `v^p·e^{nF} ≤ e^{nF}(1 + n|F|)^p + C(p)·e^{2v}` for `v ≥ 0`, proved by two cases: if
   `v ≤ log(1 + e^{nF})` then `v^p ≤ (log(1 + e^{nF}))^p ≤ (1 + n|F|)^p`; otherwise `e^{nF} < e^v − 1`, so
   `v^p e^{nF} ≤ v^p e^v ≤ C(p)e^{2v}` with `C(p) = sup_{v ≥ 0} v^p e^{−v} = (p/e)^p` (gpt2023 line 308–321 obtains
   it from Young's inequality for `η(x) = (log(1 + x))^p`)". Tested: `nF = 0`, `v = 1`, `p = 2`: `1 ≤ 1 + (2/e)²e²`;
   first case at `v = log 2`: `(log 2)² ≤ 1`.

3. **F03** (P3) Padding: `convex_spectralDomain` is a projection of `concaveOn_spectralFunction`

   **Location.** `packages/ComplexHessianEquations/Suggested.lean:113–116`.

   **Claim.** A separate headline: the spectral domain of an open convex symmetric `Γ` is convex.

   **Witness.** One term: `(concaveOn_spectralFunction hΓo hΓc hΓs (f := fun _ ↦ 0) (fun _ _ _ ↦ rfl)
   contDiffOn_const (concaveOn_const 0 hΓc)).1`; `ConcaveOn` carries the convexity of its domain as its first
   component, and the same hypotheses `hΓo`, `hΓc`, `hΓs` are in both signatures.

   **Repair.** Delete `convex_spectralDomain` from `Suggested.lean` (the README keeps the statement as the first
   item of §1.4). In `README.md:192` replace "`convex_spectralDomain` and `concaveOn_spectralFunction` in
   `Suggested.lean` state the first two items" by "`concaveOn_spectralFunction` in `Suggested.lean` states the
   second item, and with it the first, since `ConcaveOn` includes the convexity of the domain"; in the module
   docstring replace "the convexity of spectral domains and the concavity of spectral functions" by "the concavity
   of spectral functions on their convex spectral domains".

4. **F04** (P3) "How to read the build" states the uniqueness theorem at a narrower generality than §4.2 and the Lean

   **Location.** `packages/ComplexHessianEquations/README.md:106`: "Layer 4 proves the comparison principle and the
   uniqueness theorem for every concave admissible pair on a compact connected Hermitian manifold."

   **Witness.** `README.md:482` ("or more generally an admissible pair with `Γ` convex") and
   `Suggested.lean:297–298` (`hΓ : Convex ℝ P.cone`, no concavity of `f`); the Laplace-type pair
   `σ_1 − ε|λ|` on `Γ_1` (line 316) is covered by both and is not concave-relevant.

   **Repair.** Replace by "Layer 4 proves the comparison principle and the uniqueness theorem for every admissible
   pair with a convex cone, in particular every concave admissible pair, on a compact connected Hermitian manifold."

5. **F05** (P3) Docstring calls `∫ e^{nqF} κ^n` the `L^q` norm

   **Location.** `packages/ComplexHessianEquations/Suggested.lean:446`: "with `∫ e^{nqF} κ^n ≤ K₁` (the `L^q` norm
   of `e^{nF}`)".

   **Witness.** `F = a` constant, `V = 1`, `q = 2`, `n = 1`: `∫ e^{2a} = e^{2a}`, while `‖e^{a}‖_{L²} = e^{a}`.
   `README.md:768` says correctly "bounded through `∫ e^{nqF_t} ω_X^n`".

   **Repair.** Replace the parenthesis by "(the `q`-th power of the `L^q` norm of `e^{nF}`)".

One blocking finding (R01, an unowned prerequisite of §7.1) and four P3 findings. No false statement
was found in `packages/ComplexHessianEquations/Suggested.lean` or among the README targets and Checks.

## Verified sound

**Dependency check** (run as the brief gives it): `depcheck: 242 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD
or CYCLE line. The diff against `origin/main` changes only `packages/ComplexHessianEquations/` (README.md,
Suggested.lean, metadata.toml, sources.toml, two reports).

**Counts.** 32 declarations read (all of `Suggested.lean`, 468 lines); 813 README lines read, every target of
its 35 numbered sections; 66 source locators verified against the cached texts (lewis1996 8, spruck2005 10,
gpt2023 16, pss2012 10, tosatti-weinkove2010 5, dinew-kolodziej2014 5, guo-phong2024 3, szekelyhidi2018 2,
twwy2015 2, guedj-zeriahi2005 2, demailly2012 3); 157 Check bullets read against the theorems of their
sections, the numerical values of about 110 of them recomputed (those of Layers 1, 2, 6, 7 and 8 in full, a
sample in Layers 3–5; values in the table and below), none disagreeing; 21 cross-roadmap citations resolved on main or at the open heads (PDE §§3.2, 5.4, 5.6; RiemannianGeometry
R5c item 4 and `exists_pos_laplaceBeltrami_eigenvalue_isLeast`; ComplexKahlerGeometry K1, K2, K4, K5a, K6.0;
PseudodifferentialOperators §§5.4, 6.2; DifferentialGeometry Layers 0, 1, 5, 12 with
`integralTopForm_mextDeriv_eq_zero` and `integral_mul_laplaceBeltrami`; ComplexManifolds Milestones 1–2;
AffineMorseLefschetz §1.1; OperatorTheory PD-A51–A53, PA-B32, MAJ-A27; ComplexComparisonPartII C5.4;
OptimalTransport Layer 6; K3Surfaces §2.1; NumberFieldEnumeration §1.1; ShimuraVarieties §7.0g); 57 pinned
declarations and their files checked at Mathlib `1b1ccf4` and Tau Ceti `2fd255d` (all exist where cited).

**Elaborated signatures.** No Lean was run (the brief gives no elaboration command). The elaborated types of
the 32 declarations in the job's `signatures.md` were compared with the README. The five flagged definitions
(`hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow`, `IsNormalizedSolution`) lose only
`[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]`, which their bodies do not use; every theorem carries
both. Nothing changes.

**Conventions recomputed at the pin.** `TauCeti.leviForm : V →ₗ⋆[ℂ] V →ₗ[ℂ] ℂ` is conjugate-linear in the first
slot, as `hermitianForm` is on a `J`-invariant form: `H(Ju, v) = α(u, v) − i·α(u, Jv) = −i·H(u, v)`,
`H(u, Jv) = i·H(u, v)`. `Tames` is `0 < form x v (J v)`, which is `Re H(v, v) > 0`. On `ℂ` with `ω = dx ∧ dy`:
`H(1, 1) = 1`, `H(1, i) = i`, `H(i, 1) = −i`. `i∂∂̄(x²)(∂_x, ∂_y) = (1/2)(D²u(∂_y, ∂_y) + D²u(∂_x, ∂_x)) = 1`.
`RoughForm.wedge_apply` has the factor `(k!·l!)⁻¹`, so `ω²(∂_{x_1}, ∂_{y_1}, ∂_{x_2}, ∂_{y_2}) = 2`.
`complexManifoldOrientation : Manifold.Orientation 𝓘(ℝ, E) M (Fin (2 * finrank ℂ E))` matches the degree
`2 * finrank ℂ E` of `formPow`, and is the orientation of `(b₀, i·b₀, …)`, on which `ω^n > 0`.

**The pass, one row per declaration** (instances, values on each side, result; "ok" means no change).

| Declaration (line) | Instances tried and values | Result |
| --- | --- | --- |
| `hermitianMatrices` (65) | `n = 0`: zero space; `[[0,1],[0,0]]` excluded | ok |
| `eigenvalueVector` (71) | `[[2,1],[1,2]]` ↦ `(3, 1)`; `[[1,i],[−i,1]]` ↦ `(2, 0)`, Frobenius `2 = √(4+0)` | ok |
| `differentiableAt_spectralFunction_iff` (77) | `f = max`, `A = Id₂`: both sides false (`1 + max(t, 0)`); `f = σ_1`: both true; `n = 0`: both true | ok |
| `fderiv_spectralFunction_apply` (88) | `f = σ_2`, `A = [[2,1],[1,2]]`, `H = E₁₁`: `U*HU` has diagonal `(1/2, 1/2)`, sum `= 1·(1/2) + 3·(1/2) = 2`; directly `d det(H) = tr(adj(A)H) = 2` | ok |
| `contDiffOn_spectralFunction_iff` (103) | `Ω = ℝ²`, `f = μ₁² + μ₂²`: `tr(T²)`, both true; `f = max`: both false | ok |
| `convex_spectralDomain` (113) | `Γ = Γ_2 ⊂ ℝ²`: positive definite matrices, convex; non-convex cone of §1.4: midpoint `diag(1, −0.15)` outside | true; padding (R03) |
| `concaveOn_spectralFunction` (121) | `det^{1/2}`: `2, 2` at `diag(4,1), diag(1,4)`, `5/2` at the midpoint; `f = σ_2`: not concave, excluded by `hf` | ok |
| `lineRestriction` (137) | `p = xy`, `a = e`, `x = (2, −1)`: `(2 + t)(−1 + t)`, roots `−2, 1` | ok |
| `IsHyperbolic` (144) | `x² + y²`, `a = (1,0)`: `t² + 1` does not split; `m = 0`, `p = 1`: holds in every direction | ok |
| `gardingCone` (148) | `p = xy`: open quadrant; `p = x + y`: half-plane; `p = 1`: `ℝ^N` | ok |
| `hessianCone` (152) | `k = 0`: `ℝⁿ`; `k > n`: empty (`σ_k = 0`); `(3,3,−1) ∈ Γ_2 ∖ Γ_3` (`5, 3, −9`) | ok |
| `garding` (159) | `m = 0`: derivative clause `0 < 0` fails, excluded by `hm`; `p = xy`, `x = b = e`: `D_b p = 2 > 0`; `N = 0`: vacuous (`p(a) > 0` impossible for `m ≥ 1`) | ok |
| `isHyperbolic_and_gardingCone_eq_of_mem` (171) | `p = xy`, `b = (1, 2)`: `(x₁ + t)(x₂ + 2t)`, real roots, same quadrant | ok |
| `isHyperbolic_esymm_and_gardingCone_eq` (179) | `n = k = 1`: `x + t`; `n = 1, k = 2`: `σ_2 = 0`, excluded by `hkn`; `n = 3, k = 2`: `σ_2 + 2σ_1t + 3t²`, `−e` outside both sides | ok |
| `concaveOn_hessianQuotient` (187) | `n = k = 2, l = 1`: `0.8, 0.8`, midpoint `1.25`; `∂_1 = λ₂²/σ₁² > 0`; `n = 3, k = 2, l = 1`: `∂_1 = (λ₂² + λ₃² + λ₂λ₃)/σ₁² > 0` on `Γ_2`; `l = 0`: `σ_0 = 1` | ok |
| `AdmissiblePair` (200) | `n = 0`: empty (`pos_mem_cone` forces the point, `sum_pos` gives `0 < 0`); `max` not `C¹`; shifted quadrant fails dilation; `σ_1 − ε‖λ‖` on `Γ_1` qualifies with a negative value | ok |
| `AdmissiblePair.IsStructural` (217) | `σ_2/σ_1`, `n = 2`: `λ₁²λ₂²/σ₁⁴ → 0` at `(ε, 1)`, no `γ > 0`; `σ_n^{1/n}`: `n^{−n}` | ok |
| `exists_hessianPair` (224) | `n = 3, k = 2`: `∂_j f(e) = 3^{−1/2}`, product `3^{−3/2} = (√3/3)³`; lower bound: `(3σ_1 − σ_3)/(8·3^{3/2}) ≥ 8/(8·3^{3/2})` at `σ_2 = 3`; `k = 1`: `1`; `k = n`: `n^{−n}`; `n = k = 1`: `1` | ok |
| `hermitianForm` (246) | values above; exchanging the parts gives `H(1,1) = i` | ok |
| `ddbarHermitianForm` (252) | `ℂⁿ`, `α = 0`, `φ = ‖z‖²`: `2h`; constant `φ`: `H_α` | ok |
| `IsRelEigenvalueVector` (259) | `h = diag(2,1)`, `a = diag(2,3)`: `μ = (1,3)` and `(3,1)`, not `(2,3)`; `n = 0`: holds for the empty vector | ok |
| `formPow` (264) | `m = 0`: constant `1`; `m = 1`: `1 ∧ ω = ω`; `ℂ²`: `ω² = 2·dvol` | ok |
| `formPowIntegral` (271) | torus `ℂ/(ℤ + iℤ)`: `1`; `n = 0`, point: `g(pt)` | ok |
| `IsNormalizedSolution` (277) | `χ = ω, F = 0, φ = 0`: `c = f(e)`; `φ = −1`: no zero, excluded; `c ≤ 0` excluded | ok |
| `eq_of_isNormalizedSolution` (297) | two components: fails, excluded by `ConnectedSpace`; non-convex cone with `f = σ_1`, `10σ_1` on components: `f(1, −0.4) = 6 > f(1.01, 0.1) = 1.11`, excluded by `hΓ`; `n = 0`: vacuous | ok |
| `existsUnique_yau` (322) | `F = a`: `(−a, 0)`; `n = 0`: `b = −F(pt)`, `φ = 0`; `n = 1` torus, `F = ε cos 2πx`: `b = −log I_0(ε)` | ok |
| `exists_lintegral_exp_le_of_plurisubharmonic` (340) | `n = 0`: `α = 1/A`, `C = e`; `u_ε = c·log((‖z‖² + ε)/(4 + ε))`: needs `αc < n`, so `α ∼ 1/A`, as the quantifier order allows; `−(‖x‖² + ε)^{−1/2}` in `ℂ²`: radial Levi eigenvalue `(1/4)(2ε − s)(s + ε)^{−5/2} < 0`, excluded | ok (proof plan: R01) |
| `exists_formPowIntegral_exp_le` (358) | `ψ = 0`: `V`; `ℂP¹`, `ψ_ε`: `α < 1` forced, existential in `α`; `n = 0`: `1 ≤ C` | ok |
| `exists_abs_le_of_degenerating` (384) | Monge–Ampère, `χ = κ`, `F = 0`: `φ = 0`, `c = 1 + t`, `c^n/V_t = 1/V`; `φ = −M` excluded by the zero of `φ`; negative `K_i`: vacuous | ok; agrees with gpt2023 line 120–130 |
| `exists_abs_le_mongeAmpere_degenerating` (407) | `χ = 0, t = 1, F = 0`: `φ = 0`; `n = 0`: `φ = 0`; `φ = −M` excluded | ok; gpt2023 line 785–850 |
| `exists_abs_le_of_entropy_le` (430) | `c = 1` with `∫ e^{nF} = V`, as gpt2023 line 67–70 and 84–89; Laplace pair `n = 1`: `1 + Δ_ω φ = e^F` | ok |
| `exists_abs_le_hessian_degenerating` (448) | `k = n`: `q > 1`; `k = 1`: `q > n`; `n = k = 1`, `φ = −M` excluded; `1/q + 1/q' = 1`, `q' = n/(n − k)` gives `q = n/k` | ok (docstring: R05); gpt2023 line 948–952 |

**README targets recomputed** (values): §1.2 `κ_2(diag(3,1,1) + t·diag(0,1,−1)) = 4 + |t|`; von Neumann bounds
`3 ≤ 3 ≤ 6`. §2.1 `S(1,2,3) = (2, 11/3, 6)`, `12 ≤ 121/9`, `18/11 ≤ 11/6`, `(2,0,2,1)` fails as stated. §2.2
`p = 2xy − 0.9(x² + y²)`: `p(x + te) = 0.2t² + 0.2(x₁ + x₂)t + p(x)`, discriminant `0.76(x₁ − x₂)²`, cone
`0.627 < x₂/x₁ < 1.595`, `∂_x p(1, 0.7) = −0.4`; it is `p_19/20` of the family. §2.4 Lemma-4 form:
`μ_i = (∏∂_j f)^{1/n}/∂_i f` gives `n(∏∂_j f)^{1/n} ≥ nγ^{1/n}`. §3.2 `α ∧ ω = ((λ₁ + λ₂)/2)ω²`. §5.1 conformal
check `2Δ_ω u − Δ_g u = −e^{−ρ}⟨∇ρ, ∇u⟩` (`m = 4`). §5.2 Schauder check `C ≥ 4·2^α/((1 + 2π^α)ε)`. §6.1 torus:
`Δ_{ω_φ} tr h(0) = 2π²a/(1 − a) = Δ_ω F(0)`; at `x = 1/4`: `0 = −2π²a² + 2π²a²`; `Δ_{ω_φ}S(0) = 8π⁴a²/(1 − a)⁴`.
§6.4 `⟨T, Q(T)⟩ = −4π⁴a⁴`. §7.1 constants: `M ≤ 2πA/log(R/R')`, `C_1 = 2π(2R')²(R/R')^{C_H}`, `1/4 + 7/4 = 2`,
`B(x_0, 5/4) ⊇ B(0, 1)`, `Δ_t v_ξ = 4L_u(ξ, ξ)`. §8.2 with `s_{j+1} − s_j ≤ 2B_0φ(s_0)^{δ_0}2^{−jδ_0}`. §8.5 `det a =
4^{−2n}(det Ĝ)²`; torus `n = 3`: `7.50·10⁻⁵` against `Ent_3 ≈ 4.24·10⁻⁷`. §8.7 entropy bound `1.310 ≥ 0.398` and
`4.725 ≥ 4.633 > 4.184`.

**Declared gap.** `gap:weak-harnack-supersolutions` has the same slug in `design/plan.json` and in the README
(line 102), supplier PDE §5.4 (E23). It is precise and minimal: PDE §5.4 on main plans the weak Harnack
inequality only for nonnegative weak solutions of the homogeneous equation (PDE README line 1997–2002), and the
pin's `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` is the case `f = 0`.

**Ownership.** No roadmap on main or at an open head states Gårding cones, hyperbolic polynomials, Lewis's
theorem, admissible pairs, Yau's theorem in general dimension or the exponential integrability of
quasi-plurisubharmonic functions (searched by object with `roadmaps grep`; the only neighbours are those the
README already delimits: K3Surfaces §2.1, ShimuraVarieties §7.0g, NumberFieldEnumeration §1.1, OperatorTheory
Majorization, whose `LinearMap.kyFanSum` is the singular-value sum). No fully qualified name of
`Suggested.lean` occurs in another roadmap. The pinned libraries have no Newton, Maclaurin or hyperbolicity
statement and no non-strict plurisubharmonicity predicate.

**Headlines and padding.** Headlines: Lewis's theorem; concavity of spectral functions; Gårding's theorem and
`Γ(σ_k, e) = Γ_k`; concavity of Hessian quotients; the Hessian pair and its sharp constant; uniqueness; Yau's
theorem; local and global exponential integrability; gpt2023 Theorems 2, 4, 1 and 5. All are stated; none is
forced through a stand-in (the eigenvalue form of the Monge–Ampère equation is the roadmap's own formalism,
§3.2 at `k = n`). Padding: R03 only.

**Notes that are not findings.** `hΓo` in `convex_spectralDomain` and `hf1` in `concaveOn_spectralFunction` are
not needed for the truth of the statements (closed orthant: positive semidefinite matrices are convex), but the
README states the same generality and its routes use them.

**Source independence:** 17 passages compared with 11 sources, none shared beyond hypothesis lists that can be
written in one way only; largest share gpt2023, 43 of 130 locators; contents compared with gpt2023 (§2 proof of
Theorem 2, §3 proof of Theorem 1, §4 Monge–Ampère, §5 Hessian): Layer 8 takes them as §§8.1–8.3 ↔ §2,
§8.4 ↔ §4, §§8.5–8.6 ↔ §3, §8.7 ↔ §5, an order its `*Needs:*` lines give (§8.6 needs §8.5; §8.7 needs §8.4),
and Layers 1–7 have no counterpart there: independent.

## Not verifiable

- `cns1985`, `kolodziej1998`, `gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`,
  `hormander1990`: recorded as uncertified; their locators (gilbarg-trudinger2001 Theorems 3.5, 6.2, 8.18, 9.1
  and Lemma 17.16; yau1978 §2; szekelyhidi2014 Theorem 3.1; kolodziej1998 §1; hormander1990 Chapter IV) were
  not checked against a text.
- The truth of the Lean statements as elaborated: read from the elaborated signatures, not re-elaborated.
- gpt2023 (2.6)–(2.15), the constants `ε`, `Λ`, `B_0`: the README cites them by number; `δ_0 = (p − n)/(pn)` was
  checked (line 381–383), the other constants were not recomputed.
- The curvature identities of §6.1 in general dimension: checked on the `n = 1` torus witnesses and on
  `ω_φ = sω` only.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, printed page 289: the source says a symmetric polynomial hyperbolic in the direction of the all-ones vector has a cone containing the positive cone, with positive partial derivatives; it should be assumed that the coordinate vectors lie in the closure of the cone (counterexample `2xy − 0.9(x² + y²)`); affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, printed page 290: the source says equality in Newton's inequalities holds for arbitrary real vectors only when all components are equal; it should be restricted to positive vectors (`(1, 0, 0)` gives `0 = 0`); affects a stated result.
- **Misprint** in spruck2005 at Proposition 2.7, printed page 290: the source says the index runs up to `n`; it should be up to `n − 1`, since the inequality involves the mean of order one higher; affects nothing.
- **Gap** in gpt2023 at the proof of Theorem 2, line 407, printed page 9: the source says the weighted measure of the closed sublevel sets is a continuous function of the level; it should be the strict sublevel sets, which give right-continuity when a level set has positive measure; affects the proof.
- **Gap** in gpt2023 at the proof of Lemma 1, line 217, printed page 6: the source says the auxiliary equation has a smooth solution by Yau's theorem; it should first smooth the right-hand side, which is only twice differentiable because the solution is; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, line 433, printed page 10: the source says the starting level may be the one given by Chebyshev's inequality; it should justify the strict inequality the iteration lemma assumes, since Chebyshev gives only the non-strict one; affects the proof.
- **Gap** in gpt2023 at (3.3), line 455, printed page 11: the source says the energy is bounded by Hölder's inequality with the exponent `n/(n − 1)`; it should treat dimension one separately, where that exponent is undefined, by the first-power energy estimate; affects the proof.
- **Misprint** in gpt2023 at (5.4), line 959, printed page 21: the source says the Hessian equation for the `k`-th root of the elementary symmetric function has no binomial factor; it should carry the factor `binom(n, k)⁻¹` on the right, or rescale the constant; affects nothing.

## For the human reviewers

- **Licence.** `demailly2012` is an unpublished book manuscript read from its author's institutional page (`sources.toml`, entry `demailly2012`); it is cited for Proposition 4.22 and Corollary VI.6.5 only.
- **Licence.** `spruck2005` is read from the complete Clay Mathematics Proceedings volume 2 on claymath.org, recorded as `institutional` (`sources.toml`, entry `spruck2005`); 16 README locators point into it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "46a43403aba94575f5755ba6da3201a187e2f7c5", "job": "RT-ComplexHessianEquations~1a", "model": "fable", "worker": "chris-x79"} -->
