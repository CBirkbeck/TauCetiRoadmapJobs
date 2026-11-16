# Review of ComplexHessianEquations (pull request #2440 at f6e02cc)

**Verdict:** accepted

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.2 Ky Fan sums, trace bounds | `F = diag(2,1)`, `B = diag(0,3)`; `T = diag(3,1,1)`, `m = 1, 2` | `tr(FB) = 3`, lower `2·0+1·3 = 3`, upper `2·3+0 = 6`; `m=1` gap `3>1`; `m=2`: `κ₂ = 4+|t|`, kink | holds; gap needed and assumed | none |
| §1.3 Lewis (README) | `σ₂` at `[[2,1],[1,2]]`; `μ₁²+μ₂²` at `[[0,1],[1,0]]` | `det·T⁻¹ = [[2,−1],[−1,2]]` against wrong `diag(1,3)`; `2(P₊−P₋) = 2T` | holds; lewis1996 line 77–81 gives `U*(Diag f')U` for `X = U*(Diag λ)U` | none |
| `differentiableAt_spectralFunction_iff` | `f = max` at `Id₂`; `f = σ₁`; `n = 0` | `λ₁(Id+t·diag(1,0)) = 1+max(t,0)`, `max` kinked at `(1,1)`: both false; trace linear: both true; point: both true | holds both directions | none |
| `fderiv_spectralFunction_apply` | `f = xy`, `A = diag(3,1)`, `U = I` | `∇f(3,1) = (1,3)`, formula `H₁₁+3H₂₂`; `tr(adj A·H) = H₁₁+3H₂₂` | holds | none |
| `contDiffOn_spectralFunction_iff` | `f(μ) = F(diag μ)`; `f = max`, `Ω = ℝ²` | `diag μ` in domain iff `μ ∈ Ω` (symmetry), `diag` linear, so `F ∈ C¹ ⇒ f ∈ C¹`; `max`, `λ₁` both not `C¹` | holds | none |
| `concaveOn_spectralFunction` | `min`, `max` at `diag(1,0)`, `diag(0,1)`; `log det(Id+T)` | `min`: `0, 0`, midpoint `1/2`; `max`: `1, 1`, midpoint `1/2 < 1`; `0, 0`, midpoint `2·log(5/4) > 0` | holds; convexity of `Γ` inside `ConcaveOn` | none |
| §1.5 determinant, Euler, trace | `σ₂^{1/2}`, `T = diag(1,4)`; `σ₂`; `A = diag(1,4)`, `B = Id, A⁻¹` | `∇F = diag(1,1/4)`, `det = 1/4 = 2⁻²`, `tr(∇F·T) = 2 = F`; `8 = 2F`; `5 ≥ 4`, `2 = 2` | holds; degree one used | none |
| §2.1 Newton, Maclaurin, generalized | `(1,2,3)`; `(2,2,−1)`; `(r,s,k,l) = (3,2,2,1)`, `(2,0,2,1)`; shift `n=3,k=2` | `12 ≤ 121/9`; `σ₂ = 0`, `σ₂(λ+εe) = 6ε+3ε²`; `18/11 ≤ 11/6`; `1.915 ≤ 1.833` false; `12 = 12` | holds; `l ≤ s` needed, as spruck2005 line 11279–11282 | none |
| `garding` | `p = xy`, `a = (1,1)`; `p = 1`; `N = 0` | roots `−x₁, −x₂`; `D_b p = b₁x₂+b₂x₁ > 0`; `p^{1/2}`: `2, 2`, midpoint `5/2`; `D_b 1 = 0`; no `p` with `p(a) > 0` | holds; `m ≥ 1` needed and assumed | none |
| `isHyperbolic_and_gardingCone_eq_of_mem` | `p = xy`, `b = (1,2)`; `2xy − 0.9(x²+y²)`; `p = 1` | roots `−x₁, −x₂/2`, same quadrant; `0.2t²+0.2(x₁+x₂)t+p(x)`, discriminant `0.76(x₁−x₂)²`; `ℝᴺ` both | holds, also at `m = 0` | none |
| `isHyperbolic_esymm_and_gardingCone_eq` | `n=3, k=2`: `(3,3,−1)`, `(2,2,−1)`; `k = 0`; `n = k = 0` | `3+10t+3t²`, roots `−1/3, −3`, `σ₁ = 5, σ₂ = 3`: in both; `σ₂ = 0`, root `0`: out of both; `univ = univ` | holds | none |
| `concaveOn_hessianQuotient` | `σ₂/σ₁` on `ℝ²`; `n = k = 1, l = 0`; `σ₂/σ₁` at `(M,1,1)` | `0.8, 0.8`, midpoint `1.25`; identity, derivative `1`; `∂₁ = 3/(M+2)²`, `∂₂ = (M²+M+1)/(M+2)²`, both positive | holds | none |
| `exists_hessianPair` | `n=3, k=2`; `k = 1`; `k = n`; route through gpt2023 Lemma 4 | `∂ⱼf(e) = 3^{−1/2} = binom(3,2)^{1/2}/3`, `γ = 3^{−3/2}`; `1`; `n⁻ⁿ`; Maclaurin gives `f ≥ nγ^{1/n}σₙ^{1/n}`, then `n(∏∂ⱼf)^{1/n} ≥ nγ^{1/n}` | holds; constant attained at `e` | none |
| §3.2 form identities | `n = 2`, `λ = (λ₁,λ₂)`; `λ[β] = (4,1)`, `k = 1`; `ω²` on `ℂ²` | `α∧ω = ((λ₁+λ₂)/2)ω²`, `α² = λ₁λ₂ω²`; `5/2 ≥ 2`; `ω²(∂x₁,∂y₁,∂x₂,∂y₂) = 2 = 2!`, Alt convention `1/3` | holds; wedge normalization as `TauCeti.RoughForm.wedge` | none |
| §4.1 comparison | `ψ = −|z|²/4`, `φ = 0` at `0`; wedge cone, `f = σ₁` and `10σ₁` | `1/2 ≤ 1`; `(1,−0.4) ≤ (1.01,0.1)`, `f = 6 > 1.11` | holds; `Γ+Γₙ ⊆ Γ` needed and assumed | none |
| `eq_of_isNormalizedSolution` | `n = 0`; two components; `φ+1`; convex cone | no `AdmissiblePair 0` (`0 < Σ_∅ = 0`); `ψ = −1` on `X₂` also solves; no zero; `x+y = 2·(x+y)/2 ∈ Γ` | holds; connectedness and normalization used | none |
| §5.2 Hölder invertibility, Schauder | torus `u_j = j^{−2−α}cos 2πjx`, `L = εΔ_ω`; circle `j^{−α}sin jx` | `[∂ₓ²u_j]_α = 8π²·2^α`, `‖Lu_j‖ ≤ 2π²(1+2π^α)ε`, so `C ≥ 4·2^α/((1+2π^α)ε)`; quotient `(2/π)^α` | holds; dependence on `θ` stated | none |
| §5.3 Poincaré, Sobolev | torus `u = cos 2πx`; `n = 2`; `n = 1` | `∫u² = 1/2 = 2π²/4π²`; `−4Δ_ω` reading gives `1/2 ≤ 1/4` false; exponent `4`, `2 < 4`; `2 < 2` fails | holds; matches `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean:185` | none |
| §5.4 `L¹` bounds | torus `n = 1`, `φ = −(A/2)x²`; weak Harnack at `s = 1`; `ℂP¹`, `ψ_ε` | `c_B = 2`, `Δ_ω v = A/2 − A = −A/2 ≤ 0`, `Δ_ω(−φ) = A/2 > 0`; `(2n−2)·1 < 2n`; `sup ψ_ε = 0` at `∞` | holds; barrier removes the forcing term | none |
| §6.1 curvature identities | torus `q = 1 − a cos 2πx` at `x = 0, 1/4`; `ℂP¹`; `ω_φ = sω` | `q''/(2q) = 2π²a/(1−a) = Δ_ωF`; `0 = −2π²a² + 2π²a²`; `Δ'S = 8π⁴a²/(1−a)⁴`; `Ric = 2ω`, `B ≡ 2`; `0 = −s_ω+s_ω` | holds; pss2012 (6.2)–(6.6) at line 994–1016 | none |
| §6.3 `C²` estimate | `λ = (4,1/4)`; `λ = e`; `n = 1` | `tr h = 17/4`, `λ₂ = e^F/λ₁ = 1/4`; `4/17 ≤ 17/4`; `1/n ≤ n`; `ω_φ = e^F ω` | holds; dependence as pss2012 line 981–986 | none |
| §6.4 `C³` estimate | torus at `x = 1/4`, `n = 1` | `s_{ω_φ} = 2π²a²`, `S = q'²/2 = 2π²a²`, `⟨T,Q(T)⟩ = −4π⁴a⁴`, linear in `S` | holds; pss2012 (7.5)–(7.7) at line 1070–1077 | none |
| §6.6, `existsUnique_yau` | `n = 0`; `F = a`; `n = 1`; path `tF + b_t` | point: `φ = 0`, `∏_∅ = 1` forces `b = −F(x)`; `b = −a`, `φ = 0`; `Δ_ωφ = e^{F+b} − 1`; `|b_t| ≤ t·sup|F|` | holds, also at `n = 0` | none |
| §7.1, `exists_lintegral_exp_le_of_plurisubharmonic` | `n = 0`; constants of the route; `|w|²` on `D(0,1)`; `c·log((|z|²+ε)/(4+ε))`; `−(|x|²+ε)^{−1/2}` | `e^{−αu(0)} ≤ e` at `α = 1/A`; `αM/2π ≤ 1`, `C₁ = 2π(2R')²(R/R')^{C_H}`; `v(1/2) = 1 − 3/4`; finite iff `αc < n`; radial eigenvalue `(2ε−s)/4·(s+ε)^{−5/2} < 0` | holds; order `∃C ∀A ∃α` right; pole argument first as in `TauCeti/Analysis/PDE/GreenFunction/Disk.lean:35` | none |
| `exists_formPowIntegral_exp_le` | `ψ = 0`; `ℂP¹`, `ψ_ε`; `2ω̂`; `n = 0` | `V`; `∫(|z|²+ε)^{−α}` bounded iff `α < 1`; optimal `α` halves; value `e⁰` | holds | none |
| §8.2, `exists_abs_le_of_degenerating` | Stampacchia at `α = 1`, `β = 1+δ₀`; pointwise inequality `p = 2`; `Φ = e^{−s}`; `n = 0` | level `B₀Φ(s₀)^{δ₀}·2^{(1+δ₀)/δ₀} ≤ 2^{1/δ₀}`; `25e¹⁰ ≈ 5.5·10⁵ ≤ 2.7·10⁶`, second term `1.2·10⁴`; never zero; no pair | holds; statement as gpt2023 line 120–130 | none |
| `exists_abs_le_mongeAmpere_degenerating` | `χ = ω_X`, `F = 0`; `χ = 0`, `φ = −M`; `n = 0` | `cⁿV = V_t = (1+t)ⁿV`; `E = M = ‖φ‖_∞`, excluded by the zero of `φ`; `φ = 0` | holds | none |
| `exists_abs_le_of_entropy_le` | Hessian `k < n`, `F = 0`; `σ₁/2`, `n = 2`; two-valued `F̃`, `n = 1`; `c → 0` | `c = 2`, `√3`; `∏∂ⱼ = 1/4 = γ/cⁿ`; `Ent₂(F̃) ≈ 8.4·10⁻¹¹`, `Ent₂(F) ≈ 100`; `cⁿ|log c|ᵖ → 0` | holds; free `c` and normalized entropy needed | none |
| `exists_abs_le_hessian_degenerating` | entropy bound `n = 1`, `p = q = 2`; `q' = n/(n−k)`; `n = k = 1`, `φ = −M` | `0.398 ≤ (2/e)²(1+1.421) = 1.310`; `4.633 ≤ 4.725`, one term `4.184`; `q = n/k`; Hölder bound `M`, excluded | holds; general `f` with `λ ∈ Γ_k` as gpt2023 line 948–952 | none |
| Conventions `i∂∂̄`, `H_α`, orientation | `|z|²` on `ℂ`; `ω = dx∧dy` | `Re L = Re(v̄w)`, `Im L = Im(v̄w)`, so `H = 2h`, `λ = 2`; `H_ω(1,1) = ω(1,i) = 1`; `H(iu,v) = −iH(u,v)` | consistent with `TauCeti/Analysis/Complex/LeviForm.lean:119` | none |

- Previous review (same head): it has no finding to repair; its two earlier findings stay repaired at `README.md:57`, `:143`, `:153` and in the description's dependency sentence.
- Source locators: 88 of the README's 132 opened at their lines, among them every readable locator of the 15 sampled sections; none wrong.
- Library at the pins: 107 cited declarations and the scope `Matrix.Norms.Frobenius` located in the pinned sources, 55 cited files exist. Read in source: `TauCeti/Analysis/SpecificLimits/Stampacchia.lean:56`, `TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`, `TauCeti/Analysis/Convex/Majorization.lean:212` and `:338`, `TauCeti/Geometry/Manifold/DifferentialForm/Integration/TopForm.lean:518`, `TauCeti/Geometry/Manifold/Complex/Orientation.lean:216`, `Mathlib/Algebra/Polynomial/Splits.lean:35`, `Mathlib/Analysis/Calculus/Implicit.lean:450`.
- Duplication by object: no Newton or Maclaurin inequality, hyperbolic polynomial, concavity of eigenvalue functions, non-strict plurisubharmonicity predicate or planar disc Green identity at the pins (`TauCeti/Analysis/PDE/GreenFunction/DistributionalLaplacian.lean:42` is `n ≥ 3` only).
- Cross-roadmap citations resolved (27) on main `2b655a8` or at open heads: PDE §§3.2, 3.4, 5.4, 5.6; RiemannianGeometry R5c item 4 with `exists_pos_laplaceBeltrami_eigenvalue_isLeast`; ComplexKahlerGeometry K1, K2, K4, K5a, K6.0; ComplexManifolds Milestones 1–2; PseudodifferentialOperators §§5.4, 6.2; DifferentialGeometry Layers 0, 1, 5, 12; AffineMorseLefschetz §1.1; ComplexComparisonPartII C5.4; OptimalTransport Layer 6; PD-A51–A53, PA-B32, MAJ-A27; K3Surfaces §2.1, ShimuraVarieties §7.0g, NumberFieldEnumeration §1.1.
- Gate rerun: every check 0, `OK`. Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. No file changed outside the folder. The description agrees with the head: it adds the roadmap, names the six suppliers and the 17 headline theorems.
- Elaboration: `lake env lean` on `Suggested.lean` gives 17 `sorry` warnings and nothing else. The 31 elaborated types match the README; the 5 definitions without `[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]` have bodies that do not use them, and every theorem carries both. One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `trivial`, `norm_num`, `aesop`): none closes any of the 17 theorems.
- Overlap check: read ComplexKahlerGeometry, PDE, Yamabe, CalibratedGeometry, DiracScatteringAndNonlinearFourierTransform, SchrodingerOperatorsAndSpectralTypes, OperatorTheory/Majorization; nothing shared. Majorization's Ky Fan sums are singular-value sums. Yau's theorem is owned here (§6.6); K3Surfaces §2.1 and NumberFieldEnumeration §1.1 are later in the merge order and state special cases. The open PDE revision was not readable; PDE is cited as on main.
- Source independence: 22 passages compared with 9 sources, and a scan for shared runs of 8 words over 11 texts, none shared beyond reference titles and one 9-word standard phrase; largest share gpt2023, 47 of 132 locators; contents compared with gpt2023: independent (its sections 2, 2, 4, 3, 3, 5 against §§8.1–8.6, an order the *Needs:* lines of §§8.3–8.5 force; Layers 1–7 have no counterpart).

## Not verifiable

- yau1978 §2 (§§6.2, 6.6): uncertified, cited by locator only.
- szekelyhidi2014 Theorem 3.1 (§6.6): uncertified.
- tian1987 (§7.2) and hormander1990 Chapter IV (§7.1): uncertified.
- kolodziej1998 §1 (§8.3 Check): uncertified.
- gilbarg-trudinger2001 Theorems 3.5, 6.2, 9.1 and Lemma 17.16: uncertified; the contracts were read against PDE §§3.2 and 5.6 on main.
- cns1985 and ckns1985 (References): uncertified, cited only for the boundary with Part II.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, p. 289: the source says the cone of every symmetric polynomial hyperbolic in `e` contains the positive orthant, with positive partial derivatives; it should require each `e_i` in the cone's closure (`2xy − 0.9(x² + y²)` fails both); affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, p. 290: the source says Newton's inequality on all of `ℝⁿ` is an equality only for equal components; it should restrict this, for example to the positive orthant (`λ = (1, 0, 0)` gives `0 = 0`); affects a stated result.
- **Misprint** in gpt2023 at the proof of Lemma 1, p. 7: the source says `det G ≥ γ f(λ)^n`; it should be `γ f(λ)^{−n}`, as the identity on the same line gives; affects nothing.
- **Gap** in gpt2023 at the proof of Theorem 2, p. 9: the source calls the closed-sublevel function continuous; it is only left-continuous when a level set has positive measure, while Lemma 2 assumes right-continuity; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 1, (3.3), p. 11: the source bounds the energy by Hölder with exponent `n/(n−1)`, undefined at `n = 1`; it should apply Theorem 3(c) at `N = 1` directly; affects the proof.
- **Error** in gpt2023 at the proof of Theorem 3, p. 16: the source says `V⁻¹∫F e^{nF} ω^n ≤ Ent_p(F)` for `p ≥ 1`; it should be `≤ 1 + Ent_p(F)` (`n = 3`, `e^{3F} = 1 − 0.03 cos 2πx₁` refutes it); affects the proof.
- **Misprint** in gpt2023 at Lemma 8, p. 19: the source gives the constant as `C(n, p, ω_X)`; it should be `C(n, k, p, ω_X)`, as its proof shows; affects a stated result.

## For the human reviewers

- `packages/ComplexHessianEquations/design/plan.json` declares `gap:weak-harnack-supersolutions` (PDE §5.4 (E23)) for targets 5.4.2 and 8.5–8.7. The README never names the gap; §5.4 uses the pinned homogeneous weak Harnack inequality with a barrier.
- Ownership against the open PDE revision was not checked: its files were not available to this review.
