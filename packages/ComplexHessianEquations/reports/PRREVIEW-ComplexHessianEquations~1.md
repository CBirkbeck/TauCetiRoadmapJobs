# Review of ComplexHessianEquations (pull request #2440 at 7fbebb5)

**Verdict:** needs changes

## R01 (P3) — `eigenvalueVector` restates Mathlib's `eigenvalues₀` without citing it

**Location:** `TauCetiRoadmap/ComplexHessianEquations/README.md:57`, "whose `LinearMap.IsSymmetric.eigenvalues` are sorted decreasingly …, unlike `Matrix.IsHermitian.eigenvalues`, which is indexed through an arbitrary equivalence"; `Suggested.lean:71`.

**Claim:** The pinned Mathlib already has the decreasingly sorted eigenvalue vector of a Hermitian matrix. The supplier contract names only the unsorted one, so `eigenvalueVector` reads as a new object.

**Witness:** `Mathlib/Analysis/Matrix/Spectrum.lean:60` defines `Matrix.IsHermitian.eigenvalues₀ : Fin (Fintype.card n) → ℝ := (isSymmetric_toEuclideanLin_iff.mpr hA).eigenvalues finrank_euclideanSpace`, antitone at line 63. This is `eigenvalueVector`'s body, indexed by `Fin (Fintype.card (Fin n))`.

**Repair:** Replace the quoted clause with: "This is Mathlib's `Matrix.IsHermitian.eigenvalues₀` (`Mathlib/Analysis/Matrix/Spectrum.lean`, antitone by `Matrix.IsHermitian.eigenvalues₀_antitone`), reindexed from `Fin (Fintype.card (Fin n))` to `Fin n` because `Fintype.card (Fin n)` is not definitionally `n`; `Matrix.IsHermitian.eigenvalues` is indexed through an arbitrary equivalence." Then add a §1.1 Check: "`eigenvalueVector A` is `eigenvalues₀` along `Fintype.card_fin n`: for `[[2, 1], [1, 2]]` both are `(3, 1)`."

## R02 (P3) — The description's Dependencies paragraph names no supplier

**Location:** the pull request description, paragraph "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim:** The paragraph promises a list of dependencies but gives none. The six supplier roadmaps that this new roadmap depends on go unnamed.

**Witness:** README lines 80–109 hold the contracts `From TauCetiRoadmap.ComplexManifolds`, `.ComplexKahlerGeometry`, `.PseudodifferentialOperators`, `.DifferentialGeometry`, `.RiemannianGeometry` and `.PDE`. The description names none of them.

**Repair:** "Dependencies, all on main: ComplexManifolds (Milestones 1–2), ComplexKahlerGeometry (K1, K2, K4, K5a, K6.0), PseudodifferentialOperators (§§5.4, 6.2), DifferentialGeometry (Layers 0–1, 5, 12), RiemannianGeometry (R5c, item 4) and PDE (§3.2 (C13), §5.6 (E25)). The Lean imports none of them."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `eigenvalueVector` | `[[2,1],[1,2]]`; `[[1,i],[−i,1]]`; `n = 0` | `(3,1)`, also `eigenvalues₀`; `(2,0)`, Frobenius `2 = √(4+0)`; empty vector | holds | R01 |
| §1.2 Ky Fan derivative | `T = diag(3,1,1)`, `m = 1, 2` | `m=1`: gap `3>1`, gradient `diag(1,0,0)`; `m=2`: `κ₂(T+t·diag(0,1,−1)) = 4+|t|`, kink at `0` | gap hypothesis needed and assumed | none |
| §1.3 Lewis (`differentiableAt_…_iff`, `fderiv_…_apply`) | `f=σ₂`, `A=[[2,1],[1,2]]`; `f=max` at `Id`; `n=0` | `∇F = det·A⁻¹ = [[2,−1],[−1,2]]`, wrong model `diag(1,3)`; `1+max(t,0)` and `max` both nondifferentiable; both sides true | holds both directions | none |
| §1.5 det, Euler, AM–GM | `σ₂^{1/2}`, `T=diag(1,4)`; `σ₂`; `A=diag(1,4)`, `B=Id, A⁻¹` | `∇F=diag(1,1/4)`, det `1/4`, `tr(∇F·T)=2=F(T)`; `8=2F(T)`; `5 ≥ 4`, `2 = 2` | holds; degree one used | none |
| §2.3 `concaveOn_hessianQuotient` | `σ₂/σ₁` on `ℝ²`; `σ₂`; `min(x,y)` at `(1,1)` | `0.8, 0.8`, midpoint `1.25`; `σ₂(te)=t²` convex; `min` with zero derivative gives `1 ≤ 0` | holds; differentiability needed | none |
| §2.4 admissible pairs | `σ₁−ε|λ|` at `(1,−1+δ)`; wedge cone; `⋂_ε` of cones | `δ−ε√2 < 0`; `(1,−0.4)`, `(1,0.1)` in, midpoint `(1,−0.15)` out; `⋂` contains `(1,0)`, no neighbourhood | positivity, convexity separate as stated | none |
| §2.5 `exists_hessianPair` | `n=3,k=2`; `k=1`; `k=n`; quotients `(2,2,1)`, `(3,2,1)` | `∂ⱼσ₂^{1/2}(e)=3^{−1/2}=binom(3,2)^{1/2}/3`, `γ=3^{−3/2}`; `1`; `n^{−n}`; `∏∂f≈ε²`, `≈3/M²` | constant sharp; pure quotient rightly excluded | none |
| §3.3 `IsNormalizedSolution` | `χ=ω, F=0, φ=0`; `ℂP¹`, `χ=2ω`; `φ=−1` | `c=f(e)`: Monge–Ampère `1`, Hessian `binom(n,k)^{1/k}`, Laplace `n`; `c=2`; no zero, excluded | holds | none |
| §4.1 comparison | `ψ=−|z|²/4`, `φ=0` at `0`; wedge cone, `f=σ₁`/`10σ₁` | `λ: 1/2 ≤ 1`; `μ=(1,−0.4) ≤ ν=(1.01,0.1)`, `f(μ)=6 > f(ν)=1.11` | `Γ+Γₙ⊆Γ` necessary and assumed | none |
| §5.4 `L¹` bounds | torus `n=1`, `φ=−(A/2)x²`; weak Harnack at `s=1` | `c_B=2`, `Δ_ω v=−A/2 ≤ 0`, `Δ_ω(−φ)=A/2>0`; `(2n−2)·1 < 2n` | barrier route needs no forcing term | none |
| §6.6 `existsUnique_yau` | `F=a`; torus `F=ε cos 2πx`; two components; `n=0` | `b=−a`, `b_t=−ta`; `b=−log I₀(ε)≈−ε²/4`; no single `b`; point: `b=−F(x)`, `φ=0` | holds, also at `n=0` | none |
| §7.1 `exists_lintegral_exp_le_of_plurisubharmonic` | `c·log((|z|²+ε)/(4+ε))`; `n=0`; `−(|x|²+ε)^{−1/2}` on `ℂ²` | finite iff `αc<n`, so `α~1/A`; `e^{−αu(0)} ≤ e` at `α=1/A`; `∫e^{α/|x|}=∞` | order `∃C ∀A ∃α` right; psh used | none |
| §7.2 `exists_formPowIntegral_exp_le` | `ℂP¹`, `ψ_ε`; `2ω̂`; `ψ=0` | `∫(|z|²+ε)^{−α}` bounded iff `α<1`; optimal `α` halves; value `V` | holds; orientation `(b, I·b, …)` gives `∫κⁿ>0` | none |
| §8.3 `exists_abs_le_mongeAmpere_degenerating` | `χ=ω_X, F=0`; `χ=0`, `φ=−M`; `χ=3ω_X` | `V_t=(1+t)ⁿV=cₜⁿV`; `E=M=‖φ‖_∞`, excluded by `sup φ=0`; `a₀=4`: `4−2.5>0` | holds | none |
| §8.4 energy and Trudinger | `n=3`, `e^{3F}=1−0.03 cos 2πx₁` | `V⁻¹∫Fe^{3F}≈7.50·10⁻⁵ > Ent₃≈4.24·10⁻⁷`; `≤ 1+Ent₃` | README bound right; source's wrong | none |
| §8.5 `exists_abs_le_of_entropy_le` | Hessian `k<n`, `F=0`; `σ₁/2`; two-valued `F̃`, `n=1` | `c=2`, `√3`; `∏∂ⱼ=1/4=γ/cⁿ`; `Ent₂(F̃)≈8.4·10⁻¹¹`, `Ent₂(F)≈100` | free `c`, normalized entropy needed | none |
| §8.6 `exists_abs_le_hessian_degenerating` | two-valued `F`, `n=1, p=q=2`; `n=k=1`, `φ=−M` | `0.398 ≤ 1.310`; `4.633 ≤ 4.725`, second term alone `4.184`; Hölder bound `M`, excluded | holds; both entropy terms needed | none |
| `contDiffOn_spectralFunction_iff` | `f=max`, `Ω=ℝ²`; `f=σ₁`; `n=0` | `max` not `C¹` at `(1,1)`, `λ₁` not at `Id`; `σ₁`, `tr` both `C¹`; both true | holds | none |
| `concaveOn_spectralFunction` | `min`, `max`, `diag(1,0)`, `diag(0,1)`; `det^{1/2}`, closed orthant | `min`: `0,0`, midpoint `1/2`; `max`: `1,1`, midpoint `1/2 < 1`; `0,0`, midpoint `1/2` | holds; convexity inside `ConcaveOn` | none |
| `garding` | `p=xy`, `a=(1,1)`; `x²+y²`; `p=1` | roots `−x₁,−x₂`, quadrant, `D_b p=b₁x₂+b₂x₁>0`; roots `±i`; `D_b 1=0` | `m ≥ 1` needed and assumed | none |
| `isHyperbolic_and_gardingCone_eq_of_mem` | `p=xy`, `b=(1,2)`; `p=1`; `2xy−0.9(x²+y²)` | roots `−x₁, −x₂/2`, same quadrant; `ℝᴺ` both; discriminant `0.76(x₁−x₂)² ≥ 0` | holds, also at `m=0` | none |
| `isHyperbolic_esymm_and_gardingCone_eq` | `(3,3,−1)`, `(2,2,−1)`, `k=2`; `k=0` | `3+10t+3t²`, roots `−1/3, −3`, inside; `σ₂=0`, root `0`, outside; both `univ` | holds | none |
| `eq_of_isNormalizedSolution` | two components; `φ+1`; `n=0` | `ψ=−1` on `X₂` also solves; excluded by zero of `φ`; `AdmissiblePair 0` empty (`0<0`) | connectedness, normalization used | none |
| `exists_abs_le_of_degenerating` | Monge–Ampère `χ=ω_X, F=0`; `Φ=(1/4)·1_{[0,1/4)}`; `Φ=e^{−s}` | `cₜ=1+t`, `sup|φ|=0`; vanishing level `1 ≤ 2^{1/δ₀}=2`; `e^{−s}` never vanishes, so `β>1` needed | holds | none |
| Conventions `i∂∂̄`, `ωⁿ`, orientation | `|z|²` on `ℂⁿ`; `ω²` on `ℂ²` | `leviForm` of `|z|²` is `v̄w`, so `λ=2e`, `Δ_ω=2n`; `ω²(∂x₁,∂y₁,∂x₂,∂y₂)=2=2!` | consistent | none |

- Source locators: 90 of the README's 132 opened at their lines, among them every locator of the 15 sampled sections; none wrong.
- Library: `#check @` on 75 pinned Mathlib and Tau Ceti names and all 31 `Suggested.lean` declarations, with no error. The Stampacchia, Moser weak Harnack, Sobolev, planar Green kernel, Levi form, `integralTopForm`, `Polynomial.Splits` and `complexManifoldOrientation` statements were read in source.
- Cross-roadmap citations resolved (27): PDE §§3.2, 3.4, 5.4, 5.6; RiemannianGeometry R5c item 4; ComplexKahlerGeometry K1, K2, K4, K5a, K6.0; ComplexManifolds Milestones 1–2; PseudodifferentialOperators §§5.4, 6.2; DifferentialGeometry Layers 0, 1, 5, 12; AffineMorseLefschetz §1.1; ComplexComparisonPartII C5.4; OptimalTransport Layer 6; PD-A51–A53, PA-B32, MAJ-A27; K3Surfaces §2.1, ShimuraVarieties §7.0g, NumberFieldEnumeration §1.1 at their open heads.
- Gate: every check 0, `OK`. Dependency check: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` gives 17 `sorry` warnings and nothing else. Elaborated types match the README. The 5 definitions that drop `[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]` have bodies that do not need them, and every theorem carries both. The one-tactic probe (`rfl`, `infer_instance`, `simp`, `norm_num`, `aesop`) fails on all 17 theorems.
- Overlap check: read ComplexKahlerGeometry (main; the open revisions #1807 and #1808 drop no cited id), PDE, Yamabe, CalibratedGeometry, OperatorTheory/Majorization, ManifoldOptimization, SpectralSteepestDescent and SchrodingerOperatorsAndSpectralTypes; nothing shared. Yau's theorem belongs to ComplexHessianEquations §6.6. K3Surfaces §2.1 (open, later in the merge order) re-solves the `n = 2` case.
- Source independence: 24 passages compared with 9 sources, plus a scan for shared runs of 8 or more words over 12 texts; the only runs found are reference titles and standard phrases of at most 11 words. Largest share: gpt2023, 47 of 132 locators. Contents compared with gpt2023: independent. Its Lemma 1 and Theorems 1–5 are reordered within Layer 8, and Layers 1–7 have no counterpart in it. Layer 6's `C⁰ → C² → C³` order is forced by its *Needs:* lines.

## Not verifiable

- yau1978 §2 (§§6.2, 6.6): uncertified (paywalled); cited by locator only.
- szekelyhidi2014 Theorem 3.1 (§6.6): uncertified.
- tian1987 (§7.2) and hormander1990 Chapter IV (§7.1): uncertified.
- kolodziej1998 §1 (§8.3 Check): uncertified.
- gilbarg-trudinger2001 Theorems 3.5, 6.2, 9.1 and Lemma 17.16: uncertified. The contracts were checked against PDE §§3.2 and 5.6 on main instead.
- cns1985 and ckns1985 (References): uncertified; cited only for the boundary with Part II.

## Source issues

- **Error** in spruck2005 at Corollary 2.4, p. 289: the source says the cone of every symmetric polynomial hyperbolic in `e` contains the positive orthant, with positive partial derivatives; it should require each `e_i` in the cone's closure (`2xy − 0.9(x² + y²)` fails both); affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, p. 290: the source says Newton's inequality on all of `ℝⁿ` is an equality only for equal components; it should restrict this, e.g. to the positive orthant (`λ = (1, 0, 0)` gives `0 = 0`); affects a stated result.
- **Misprint** in gpt2023 at the proof of Lemma 1, p. 7: the source says `det G ≥ γ f(λ)^n`; it should be `γ f(λ)^{−n}`, as the identity on the same line and the proof of Lemma 3 give; affects nothing.
- **Gap** in gpt2023 at the proof of Theorem 2, p. 9: the source calls the closed-sublevel function `φ(s)` continuous; it is only left-continuous when a level set has positive measure, while Lemma 2 assumes right-continuity; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 1, (3.3), p. 11: the source bounds the energy by Hölder with exponent `n/(n−1)`, undefined at `n = 1`; it should apply Theorem 3(c) at `N = 1` directly; affects the proof.
- **Error** in gpt2023 at the proof of Theorem 3, p. 16: the source says `V⁻¹∫F e^{nF} ω^n ≤ Ent_p(F)` for `p ≥ 1`; it should be `≤ 1 + Ent_p(F)` (`n = 3`, `e^{3F} = 1 − 0.03 cos 2πx₁` refutes it); affects the proof.
- **Misprint** in gpt2023 at Lemma 8, p. 19: the source gives the constant as `C(n, p, ω_X)`; it should be `C(n, k, p, ω_X)`, as its proof shows; affects a stated result.
- **Misprint** in gpt2023 at Theorem 5, p. 20: the source lists the constant's dependence without `γ`; it should include the structural constant `γ`, which enters through Theorem 2; affects a stated result.

## For the human reviewers

- `packages/ComplexHessianEquations/design/plan.json` still declares `gap:weak-harnack-supersolutions` (PDE §5.4 (E23)) for targets 5.4.2 and 8.5–8.7. The README never names this gap; §5.4 uses the pinned homogeneous weak Harnack inequality with a barrier. Withdrawing the gap changes plan targets, which the package stage cannot do.
