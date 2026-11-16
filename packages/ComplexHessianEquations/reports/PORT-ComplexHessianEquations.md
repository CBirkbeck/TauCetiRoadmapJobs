# PORT-ComplexHessianEquations

- Branch: `roadmap/complex-hessian-equations`, created from `d23c53c`.
- Head commit: `7fbebb57b7fd8b9033d7fe136e3d29e6f2d1cbcb`, with the message `ComplexHessianEquations: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/ComplexHessianEquations/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder changed.

## Checks

- **Build.** `lake build TauCetiRoadmap.ComplexHessianEquations.Suggested` on the committed tree printed `Build completed successfully (18602 jobs).` There are 17 warnings, all `declaration uses sorry`, one per theorem, and nothing else.
- **Gate.** The gate printed `gate ComplexHessianEquations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency order.** The check (`gate --depcheck … --movable`) printed:

  ```
  depcheck: 251 roadmaps, 2383 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the ported README reports no cross-roadmap citation and no Lean name found nowhere. The nine field names that the worker's citation scan listed for the package (`AdmissiblePair.IsStructural`, `AdmissiblePair.contDiffOn_f`, …) are fields of `AdmissiblePair` in `Suggested.lean`. I checked each with `#check`.
- **Signatures.** I put a copy of `Suggested.lean` with `#check @name` for all 31 declarations and the 11 fields of `AdmissiblePair` into one scratch file and elaborated it once at the pins (exit 0).
  - Every theorem keeps `[FiniteDimensional ℂ E]`, `[IsManifold 𝓘(ℂ, E) ∞ X]`, `[T2Space X]`, `[CompactSpace X]` and `[ConnectedSpace X]` where its README statement needs them.
  - Five definitions lack some section binders: `hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow` and `formPowIntegral`. Their bodies need neither binder, and every theorem that uses them carries both.
  - Each elaborated type agrees with its README statement.
  - After that run I changed only docstrings in `Suggested.lean` (the Layer 8 renumbering below and one reflowed line). The diff against the package touches no statement, so the elaborated signatures are unchanged.
- **Library names.** The same scratch file also ran `#check` on every Mathlib and Tau Ceti name the README cites, 117 in all, at the manifest pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. These match the README's "Read at commit" lines.
  - All 117 elaborate.
  - Twenty names live in Tau Ceti modules that have no compiled object file in this workspace (planar kernels, Weyl, subharmonic comparison, planar Harnack, weak Harnack, closed-manifold Sobolev, `HoffmanWielandt`, `MinkowskiDeterminant`, `QuadraticLeviForm`, `Wirtinger/LeviForm`, `MaximumPrinciple`). For those I opened the pinned source and confirmed name, namespace, file and line, for example `TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` at `TauCeti/Analysis/PDE/Regularity/Harnack.lean` line 284. `LinearMap.concaveOn_det_rpow` is at `TauCeti/Analysis/Matrix/MinkowskiDeterminant.lean` line 159; the same file also has `Matrix.concaveOn_det_rpow` at line 124.

## Draft pull request body

Build the theory of fully nonlinear elliptic equations of complex Hessian type, `f(λ[χ + i∂∂̄φ]) = c·e^F`, on compact complex manifolds, in the eigenvalue form used by the modern a priori estimates. The roadmap starts from the eigenvalue inequalities already in Tau Ceti (Courant–Fischer, Weyl, von Neumann, Ky Fan) and proves Lewis's derivative formula and the concavity of spectral functions of Hermitian matrices over `ℝ` or `ℂ`. It then develops Gårding's theory of hyperbolic polynomials, the cones `Γ_k` and the concavity of Hessian quotients, and defines admissible pairs with the Guo–Phong–Tong structural condition, with the Monge–Ampère, Laplace, Hessian and quotient pairs as examples with explicit constants. On a compact Hermitian manifold it places the equation using Tau Ceti's Levi form, rough two-forms and top-form integration, and proves the comparison principle and uniqueness. On compact Kähler manifolds it proves Yau's theorem by the continuity method, the uniform exponential integrability of quasi-plurisubharmonic functions (from a Green representation on planar discs built on Tau Ceti's planar kernels), and the sharp `L^∞` estimates of Guo, Phong and Tong for every admissible pair satisfying the structural condition, on fixed and on degenerating backgrounds. `Suggested.lean` states the headline theorems on these carriers: Lewis's theorem, the concavity of spectral functions, Gårding's theorem, `Γ(σ_k, e) = Γ_k`, the concavity of Hessian quotients, the Hessian pair with its sharp structural constant, uniqueness, Yau's theorem, local and global exponential integrability, and the four `L^∞` estimates.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Dependencies still in pull requests

None. Every supplier is on main:

- ComplexManifolds Milestones 1–2.
- ComplexKahlerGeometry K1, K2, K4, K5a and K6.0.
- PseudodifferentialOperators §§5.4 and 6.2.
- DifferentialGeometry Layers 0–1, 5 and 12.
- RiemannianGeometry R5c item 4, with `exists_pos_laplaceBeltrami_eigenvalue_isLeast`.
- PDE §3.2 (C13) and §5.6 (E25).
- AffineMorseLefschetz §1.1, and the OperatorTheory targets PD-A51–A53, PA-B32 and MAJ-A27.

I read each section on main. Three open pull requests are cited, but only in "Scope and ownership" and "Downstream consumers", never as suppliers: K3Surfaces §2.1 ("Ricci-flat forms and the integral cup lattice"), ShimuraVarieties §7.0g ("Compact-case metric input") and NumberFieldEnumeration §1.1 ("The T₂ norm and coefficient bounds"). I read each at its head with `roadmaps show` or its checkout. All three are later than this roadmap in the merge order, and they are not dependencies.

The two open revisions of ComplexKahlerGeometry, #1807 and #1808, keep the cited labels K1, K2, K4 (§4.2), K5a (§§5.1, 5.4, 5.7) and K6.0 (§6.1), so no citation breaks when either merges.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already had the required form:

- headline theorems only, with the few definitions needed to state them;
- no sorried data, no `set_option`, and `import Mathlib` followed by six `TauCeti.*` modules, each used.

No headline that is statable at the pins is missing; the module docstring says every headline is stated. The only Lean edits are docstrings: the Layer 8 section numbers (§8.3→§8.2, §8.4→§8.3, §8.6→§8.5, §8.7→§8.6) and one reflowed line in the docstring of `exists_abs_le_hessian_degenerating`.

## Supplier replacements and duplication removals

- **De Giorgi's iteration lemma, formerly §8.2, is deleted.** It was gpt2023 Lemma 2, with gaps `r ∈ [0, 1]` and threshold `s_0 + 1/(1 − 2^{−δ_0})`. Its object is at the pin: Tau Ceti's Stampacchia lemma `TauCeti.apply_add_eq_zero_of_le_div_sub_rpow_mul_rpow` (`TauCeti/Analysis/SpecificLimits/Stampacchia.lean` line 56).
  - The level-set bound in the route of the degenerating-background estimate, `A_s ≥ r·Φ(s + r)`, holds for every `r ≥ 0`, so the pinned lemma applies with `α = 1`, `β = 1 + δ_0`, `M = B_0` and `k₀ = s_0 = (2B_0)^{1/δ_0}Ē`.
  - The route of the new §8.2 (formerly §8.3) now consumes the pinned lemma. Its explicit bound is `inf φ_t ≥ −(2B_0)^{1/δ_0}Ē − 2^{1/δ_0}`, and the README notes gpt2023's own constant `1/(1 − 2^{−δ_0})`. This removes the right-continuity and strict-smallness steps, which only GPT's form of the lemma needed, and the Check that guarded right-continuity.
  - Three Checks replace the deleted ones: the model `Φ = (1/4)·1_{[0,1/4)}` (lemma threshold `1`, route threshold `2`), the control `Φ = e^{−s}` at `β = 1`, and the two thresholds at `δ_0 = 1/2` (`4` against `3.41`).
  - Sections 8.4–8.7 are renumbered to 8.3–8.6 in the README and in the Lean docstrings. No roadmap on main or at an open head cites this roadmap, so no citation breaks.
  - The pinned lemma is listed in the Tau Ceti supplier contract, in the Layer 8 Dependencies and among the pinned material in "Scope and ownership".
- **DifferentialGeometry Layers 5 and 12 are cited through their pinned declarations.** The package named `laplaceBeltrami`, `riemannianVolumeForm`, `integral_mul_laplaceBeltrami` and `integralTopForm_mextDeriv_eq_zero` without a namespace, as DifferentialGeometry items.
  - All four are implemented at the pin. A new Tau Ceti contract bullet gives each with its full name, file and hypotheses: `TauCeti.Manifold.laplaceBeltrami`, `TauCeti.Manifold.integral_mul_laplaceBeltrami`, `TauCeti.riemannianVolumeForm` and `TauCeti.integralTopForm_mextDeriv_eq_zero`.
  - The DifferentialGeometry contract section points to them, and the *Needs:* lines of §§3.2, 5.1 and 6.2 name them.
  - The Conventions, §5.1 and §5.4 now write the Laplace–Beltrami operator as `TauCeti.Manifold.laplaceBeltrami` or `Δ_g` instead of the bare `laplaceBeltrami`.
- **One variant recorded in "Scope and ownership".** Mathlib's `MeromorphicOn.circleAverage_log_norm` (`Mathlib/Analysis/Complex/JensenFormula.lean` line 307) is Jensen's formula for `log‖g‖` with `g` meromorphic. The Jensen formula of §7.1 differs in being stated for `C²` functions. It is kept, with that one-clause difference.

The duplication sweep was by object, over main and the open heads (`roadmaps grep`), and over the pins. I searched for hyperbolic polynomials, Gårding (only Gårding's inequality of elliptic PDE turned up), spectral functions (only MatrixSpectralStatistics' functional calculus `h(A)`), Newton–Maclaurin, Monge–Ampère, Yau's theorem, Hessian equations, Kähler–Einstein metrics, Ky Fan sums, Jensen's formula, the Levi form and `i∂∂̄`, exponential integrability, and De Giorgi/Stampacchia. Apart from the item above:

- K3Surfaces §2.1 (open, later in the merge order) proves the `n = 2` case of §6.6 by its own continuity method. The README already records this. The cleanup belongs to K3Surfaces, which should cite §6.6 since this roadmap is earlier; I did not edit it.
- Nothing else is owned twice. That includes BallQuotientsAndComplexHyperbolicLattices (homogeneous Kähler–Einstein metrics), the Ky Fan items of ManifoldOptimization and SpectralSteepestDescent (singular values), and ArakelovGeometryAndAbelianHeightsPartII and ArithmeticDynamics (Bedford–Taylor and Chambert-Loir measures, outside this roadmap).

Ownership against open pull requests was checked through the 245 checkouts and `roadmaps grep` over 461 heads.

## Other fixes from the upstream-reviewer reread

- **§2.2, Check.** "the polynomial of the previous Check is `p_19/20`" was ambiguous: it reads as `p_{19/20}`, which is a different polynomial. It now reads `p_c/20` at `c = 19`, with the cone `{x_1 + x_2 > √19·|x_1 − x_2|}`. I checked that `p_19/20 = −0.9(x_1² + x_2²) + 2x_1x_2` and that the cone's ratio bounds are `0.6268` and `1.5954`, which are the sector of the previous Check.
- **§2.5, quotient pair.** The constant `γ ≥ (c·binom(n, p)^{1/p}/n)^n` was justified by §2.4's rule for positive combinations. That rule needs a structural constant for each summand, and the pure quotient has none (§2.5's own Checks show it fails). The bullet now derives the constant from the superadditivity directly, with `x_j = ∂_j(σ_k/σ_l)^{1/(k−l)} > 0`: `∏(x_j + y_j)^{1/n} ≥ ∏y_j^{1/n}`.
- **Scope boundary.** "Existence theorems for Hessian equations other than the complex Monge–Ampère equation" is added to the list of what is outside, so the boundary is definite. Downstream consumers loses the open-ended "Further Part II directions are subsolution theory, Hessian-equation existence and …". The Kähler–Einstein bullet now says that the equation is outside and that ShimuraVarieties §7.0g can consume Layers 4 and 6 for it.
- **Pinned material in Scope.** The list in "Scope and ownership" now also names Stampacchia's lemma, the Laplace–Beltrami operator with Green's first identity, and Stokes' theorem.

## Adversarial pass

One row per statement; values were computed by hand and rechecked with a script.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `differentiableAt_spectralFunction_iff` | `n = 0`; `f = max` at `(1,1)`; reduction `f = F ∘ diag` | `n = 0`: both sides hold; `λ_1(Id + t·diag(1,0)) = 1 + max(t,0)`, not differentiable; `f(μ) = F(diag μ)` with `diag(λ(A)) = U*AU` gives "only if" | true | none |
| `fderiv_spectralFunction_apply` | `f = σ_1`; `f = σ_2` on `T = [[2,1],[1,2]]` | `dF(H) = Σ Re(U*HU)_ii = Re tr H`; `∇F = det(T)T⁻¹ = [[2,−1],[−1,2]]`, against the wrong `diag(1,3)` | true | none |
| `contDiffOn_spectralFunction_iff` | `n = 0`; `Ω` symmetric open, `f` symmetric | `f = F ∘ diag` on `Ω` because `λ(diag μ)` is a permutation of `μ` | true | none |
| `concaveOn_spectralFunction` | `f = min` on `ℝ²`; closed orthant with `σ_2^{1/2}`; `f = max` | `0, 0, 1/2 ≥ 0`; `0, 0, 1/2`; `1, 1, 1/2 < 1`, excluded by `hf` | true | none |
| `garding` | `N = 0`; `p = x_1 + x_2`; `p = xy`, `x = (1,0.7)`, `b = e` | `N = 0`: `eval a p = 0`, vacuous; root `−(x_1+x_2)/2`; `D_e p = 1.7 > 0` | true | none |
| `isHyperbolic_and_gardingCone_eq_of_mem` | `m = 0`, `p = C 2`; `p = x+y`, `b = (2,−1)` | `univ = univ`; both cones `{x_1+x_2 > 0}` | true | none |
| `isHyperbolic_esymm_and_gardingCone_eq` | `k = 0`; `n = 3`, `k = 2` at `−e`; `n=1,k=2` | `ℝⁿ = ℝⁿ`; `3(t−1)²` has root `1 ≥ 0` and `σ_1 = −3`; `esymm = 0`, excluded by `hkn` | true | none |
| `concaveOn_hessianQuotient` | `n = 2`, `σ_2/σ_1` at `(4,1),(1,4),(2.5,2.5)` | `0.8, 0.8, 1.25`; `∂_1 = λ_2²/(λ_1+λ_2)² > 0` | true | none |
| `exists_hessianPair` | `(n,k) = (1,1),(2,1),(2,2),(3,2),(4,2)` | `∏∂_j f(e) = 1, 1, 0.25, 0.19245, 0.140625`, equal to `(binom^{1/k}/n)^n` in each case | true | none |
| §2.1 Newton–Maclaurin | `λ = (1,2,3)`; `(r,s,k,l) = (3,2,2,1),(3,1,2,0),(2,0,2,1)` | `σ = (6,11,6)`, `S = (2, 3.667, 6)`; `12 ≤ 13.44`; `2 ≥ 1.915 ≥ 1.817`; `1.636 ≤ 1.833`; `1.732 ≤ 1.915`; with `l > s`, `1.915 ≰ 1.833` | true; `l ≤ s` needed | none |
| §2.2 symmetric control `p_19/20` | `c = 19` | coefficients `−0.9, 2.0`; sector `0.62679 < x_2/x_1 < 1.59543` on both readings | true | notation fixed |
| §2.5 quotient pair | `n = 3`, `σ_2/σ_1` at `(M,1,1)`, `M = 10³` | `∏∂_j = 2.97·10⁻⁶ ≈ 3/M²`, so the pure quotient has no constant | true | derivation fixed |
| `hermitianForm`, `ddbarHermitianForm` | `ω = dx∧dy` on `ℂ`; `|z|²` | `H(1,1) = 1`; exchanging the parts gives `i`; `L_{|z|²} = h`, so `λ = 2e` | true | none |
| `formPow` normalization | standard `ω` on `ℂ²` | `ω²(∂x_1,∂y_1,∂x_2,∂y_2) = 2 = 2!`; the Alt normalization gives `1/3` | true | none |
| `eq_of_isNormalizedSolution` | `n = 0`; two components; cone of §1.4 | `AdmissiblePair 0` is empty; `ψ = −1` on `X_2` breaks uniqueness; non-convex cone gives `6 > 1.11` with `μ ≤ ν` | true; hypotheses needed | none |
| `existsUnique_yau` | `n = 0`; `F = a` | point: `b = −F`, `φ = 0`; `b = −a`, `φ = 0` | true | none |
| `exists_lintegral_exp_le_of_plurisubharmonic` | `n = 0`; `u_ε = c·log((|z|²+ε)/(4+ε))`; `−(|x|²+ε)^{−1/2}` | `C = e`, `α = 1/A`; bounded iff `αc < n`; radial eigenvalue `(2ε − r²)/4·(r²+ε)^{−5/2} < 0`, not psh | true | none |
| `exists_formPowIntegral_exp_le` | `ℂP¹`, `ψ_ε` | `∫(r²+ε)^{−α} r dr` bounded iff `α < 1` | true | none |
| `exists_abs_le_of_degenerating` (§8.2) | Stampacchia step on `(1/4)·1_{[0,1/4)}`, `B_0 = δ_0 = 1`; `e^{−s}`, `β = 1`; `δ_0 = 1/2` | `d = 1 ≤ 2^{1/δ_0} = 2`; `max x e^{−x} = 0.36788 = 1/e`, never vanishes; `4` against `3.414` | true | route rerouted |
| §8.2 pointwise inequality | `nF = 0`, `p = 2`, `y = log 2, 1, 3`; `nF = 10`, `y = 5` | `0.480 ≤ 1`; `1 ≤ 4`; `9 ≰ 1` with the first term alone; `5.51·10⁵` between `1.19·10⁴` and `2.67·10⁶`; `log(1+e^{10}) = 10.00005` | true | none |
| `exists_abs_le_mongeAmpere_degenerating` | `χ = ω_X`, `F = 0`; `φ = −M` | `c_t^n/V_t = (1+t)^n/((1+t)^nV) = 1/V`; `E = M`, excluded by the zero of `φ` | true | none |
| `exists_abs_le_of_entropy_le` (§8.5) | two-valued `F̃`, `n = 1`, `p = 2` | `c = 4.5400·10⁻⁵`, `Ent_2(F̃) = 8.42·10⁻¹¹`, `Ent_2(F) = 100.0000006` | true | none |
| §8.4 signed moment | `ℂ³/ℤ⁶`, `q = 1 − 0.03cos` | `V⁻¹∫F e^{3F} = 7.5008·10⁻⁵ > 7.2816·10⁻⁵`; `Ent_3 = 4.245·10⁻⁷ < 1.0466·10⁻⁶` | true | none |
| `exists_abs_le_hessian_degenerating` | entropy bound on two-valued `F`, `n = 1`, `p = q = 2` | `0.3983 ≤ 1.3105`; `4.6329 ≰ 4.1839` without the first term, `≤ 4.7253` with it | true | none |
| §6.1 identities | torus, `q = 1 − a cos 2πx`, `a = 1/2` | `Δ'S(0)/π⁴ = 32`, halved metrics give `8`, and a single degree `−1` would give `16` | true | none |
| §5.2 Schauder `θ`-dependence | `α = 1/2` | `C ≥ 4·2^α/((1 + 2π^α)ε) = 1.2447/ε` | true | none |
| §7.1 Green representation | `v = |w|²`, `a = 1/2`; `α_1` | `v(1/2) = 1 − 3/4 = 1/4`; `α_1 = 0.0963` and `0.2075` (times `c`) | true | none |

## Unresolved

- I did not edit K3Surfaces §2.1. It is open and later in the merge order, and it proves the `n = 2` case of §6.6 by its own continuity method. Once both are on main, it should cite §6.6.
- The 20 Tau Ceti names in modules not compiled in this workspace were checked by reading the pinned source, not by `#check`.
- No text read during the job asked for any action; there is nothing suspicious to report.


Pull request: #2440 (roadmap/complex-hessian-equations at 7fbebb5)
