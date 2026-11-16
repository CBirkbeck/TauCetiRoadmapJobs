# Package report: ComplexHessianEquations

The package is `packages/ComplexHessianEquations/README.md`,
`packages/ComplexHessianEquations/Suggested.lean`,
`packages/ComplexHessianEquations/metadata.toml` and
`packages/ComplexHessianEquations/sources.toml`. The top-level `gaps` list of
`packages/ComplexHessianEquations/design/plan.json` is unchanged: its one entry,
`weak-harnack-supersolutions` (supplier PDE, section §5.4 (E23)), is still needed and still open
(below), and no other gap arose. Nothing else in `plan.json` was touched.

The accepted design was already written in the upstream shape (eight layers, 35 numbered
subsections, each with `*Needs:*`, API where a definition is made, `**Checks.**`, and every layer
ending with Examples and Dependencies). It was compared against `plan.json` (47 targets) and against
the shape of PDE, Yamabe and ComplexKahlerGeometry on main. Every target, Check and worked example
of the design is kept. The README adds the Lean carriers, the names of the `Suggested.lean`
declarations at the targets they state, API lists and Checks for the new definitions, an API list
for the Ky Fan sums of §1.2, and the gap contract in the required form. `topic = "math.DG"` follows
the one-field metadata of the roadmaps on main (PDE `math.AP`, ComplexKahlerGeometry `math.CV`,
Yamabe `math.DG`); most of the sources (Guo–Phong–Tong, Tosatti–Weinkove, Székelyhidi) are
differential geometry.

## Headline theorems, listed before Suggested.lean was written

| Headline | README | Status |
| --- | --- | --- |
| Lewis's theorem: differentiability of spectral functions | §1.3 | stated, `differentiableAt_spectralFunction_iff` |
| Lewis's theorem: the gradient formula | §1.3 | stated, `fderiv_spectralFunction_apply` |
| Lewis's theorem: the `C¹` criterion | §1.3 | stated, `contDiffOn_spectralFunction_iff` |
| Convexity of spectral domains | §1.4 | stated, `convex_spectralDomain` |
| Concavity of spectral functions | §1.4 | stated, `concaveOn_spectralFunction` |
| Gårding's theorem (open convex cone, positivity, concavity of `p^{1/m}`, positive directional derivatives) | §2.2 | stated, `garding` |
| Gårding's theorem: independence of the direction | §2.2 | stated, `isHyperbolic_and_gardingCone_eq_of_mem` |
| `σ_k` is hyperbolic with Gårding cone `Γ_k` | §2.2 | stated, `isHyperbolic_esymm_and_gardingCone_eq` |
| Concavity and monotonicity of Hessian quotients | §2.3 | stated, `concaveOn_hessianQuotient` |
| The Hessian pair is a concave admissible pair with sharp structural constant | §2.5 | stated, `exists_hessianPair` |
| Uniqueness for admissible pairs with convex cone on compact connected Hermitian manifolds | §4.2 | stated, `eq_of_isNormalizedSolution` |
| Yau's theorem | §6.6 | stated, `existsUnique_yau` |
| Local exponential integrability of plurisubharmonic functions | §7.1 | stated, `exists_lintegral_exp_le_of_plurisubharmonic` |
| Uniform exponential integrability of quasi-plurisubharmonic functions | §7.2 | stated, `exists_formPowIntegral_exp_le` |
| Guo–Phong–Tong estimate on degenerating backgrounds | §8.3 | stated, `exists_abs_le_of_degenerating` |
| Monge–Ampère equation on degenerating backgrounds (Kołodziej's bound at `χ = 0`, `t = 1`) | §8.4 | stated, `exists_abs_le_mongeAmpere_degenerating` |
| Guo–Phong–Tong estimate on a fixed background | §8.6 | stated, `exists_abs_le_of_entropy_le` |
| Hessian equations on degenerating backgrounds | §8.7 | stated, `exists_abs_le_hessian_degenerating` |

No headline is unstatable at the pins, and the module docstring says so. The pins carry every
carrier: the Levi form (`TauCeti.manifoldLeviForm`, `TauCeti.leviForm`), rough and smooth forms
with continuity at order `0` (`TauCeti.RoughForm`, `TauCeti.IsSmoothForm`), compatibility and
closedness (`TauCeti.SmoothTwoForm.Compatible`, `TauCeti.SmoothForm.IsClosed`), the almost complex
structure of a complex manifold, the wedge product, the canonical orientation and the integral of
top forms. The definitions added to state the headlines are short and have real bodies:
`hermitianMatrices`, `eigenvalueVector`, `lineRestriction`, `IsHyperbolic`, `gardingCone`,
`hessianCone`, the structure `AdmissiblePair` with `AdmissiblePair.IsStructural`,
`hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow`, `formPowIntegral` and
`IsNormalizedSolution`. There is no sorry'd data, no `set_option`, no proved or admitted `example`.

The README targets that are not headlines stay in the README only: the Ky Fan derivative (§1.2),
the determinant and trace inequalities (§1.5), the Newton–Maclaurin inequalities (§2.1), the form
and integration identities (§3.2), the comparison principle (§4.1), the linear analysis of
Layer 5, the `C⁰`, `C²`, `C³` and higher estimates (§§6.1–6.5), De Giorgi's lemma (§8.2), the
auxiliary comparison (§8.1) and the Trudinger estimates (§8.5). The formula for `b` and the `C^k`
bounds of §6.6, the moment bound of §7.2 and the energy bound of §8.4 are also README content only.

## Corrections and what changed against the design

1. **Gap contract form.** The PDE subsection's contract now opens
   `What PDE must provide (gap:weak-harnack-supersolutions): …` with the `needs` sentence of
   `plan.json`, followed by the design's detail and its two negative controls, unchanged.
2. **`Γ_0` Check (§2.2).** The design said that no `Γ_0` is defined. `hessianCone n 0` is defined
   in Lean (the empty conjunction, all of `ℝⁿ`), so the Check now says that it is `ℝⁿ`, that
   `hessianCone n 0 ⊆ hessianCone n 1` fails at `−e`, and that this is why every statement about
   `Γ_k` assumes `k ≥ 1`.
3. **Ky Fan sums (§1.2).** The design defined `κ_m` without an API list. Added: `κ_1 = λ_1`,
   `κ_n = tr`, `κ_m(T + t·Id) = κ_m(T) + m·t`, positive homogeneity, Lipschitz constant `m`,
   unitary invariance and `κ_m − κ_{m−1} = λ_m`.
4. **Lewis's `C¹` criterion.** The design cited it by line (lewis1996 line 468–469). It is the
   remark after Lewis's Corollary 3.15 (strict differentiability), which the manifest's locator for
   `lewis1996` now names, and the Lean docstring cites.
5. **Lean carriers.** A Conventions bullet, a Mathlib bullet and a Tau Ceti bullet record the
   carriers of `Suggested.lean`. New prose, API lists and Checks were added in §§1.1, 3.1, 3.2 and
   3.3 for `hermitianMatrices`/`eigenvalueVector`, `hermitianForm`/`ddbarHermitianForm`/
   `IsRelEigenvalueVector`, `formPow`/`formPowIntegral` and `IsNormalizedSolution`; §§1.3, 1.4,
   2.2–2.5, 4.2, 6.6, 7.1, 7.2, 8.3, 8.4, 8.6 and 8.7 name the declarations that state them and say
   how the Lean form reads the README statement (matrix form of Layer 1, `f` on all of `ℝⁿ` in
   Lewis's theorem, the eigenvalue form of Yau's equation, lower Lebesgue integrals in §7.1, the
   energy through gpt2023 (1.9) in §8.3, the `L^q` norm through `∫ e^{nqF} ω_X^n` in §8.7).
6. **`n = 0`.** The Lean statements do not assume `n ≥ 1`; the Conventions now say that they hold
   trivially at `n = 0` (a compact connected manifold modelled on a point is a point, and
   `Γ_1 = ∅` in `ℝ⁰`, so no admissible pair exists).

No mathematical error was found in the design's statements; the adversarial pass below recomputed
the statements written or changed here. What the README could not support: nothing. Eight works
are settled as `uncertified` and cited by locator (`cns1985`, `kolodziej1998`,
`gilbarg-trudinger2001`, `yau1978`, `szekelyhidi2014`, `ckns1985`, `tian1987`, `hormander1990`);
none was requested and no `needs-references.toml` was written. Notions moved down from later
roadmaps: none.

## Duplication and ownership sweep

By object, with `roadmaps grep -i --readme-only` over main and the 452 open roadmap pull requests
of the index of 2026-11-16, over the board's packages, and over the pinned Mathlib and Tau Ceti:

- Monge–Ampère: ShimuraVarieties §7.0g (Kähler–Einstein metric, cited in Scope and Downstream
  consumers), K3Surfaces §2.1 (the case `n = 2`, cited in Scope), and non-Archimedean or Bedford–
  Taylor objects in ArithmeticDynamics and ArakelovGeometryAndAbelianHeightsPartII (pluripotential
  theory, outside this roadmap's scope). No other owner.
- "Calabi conjecture", "Yau's theorem", "Kołodziej": no match outside this roadmap.
- Hyperbolic polynomials, Gårding cones, Gårding's theorem: no match (the many "Gårding" hits are
  Gårding's inequality for elliptic operators, a different object).
- Spectral functions, Lewis's theorem: OperatorTheory (measurability of spectral functions of random
  matrices, MatrixSpectralStatistics B09–B10), a different object. No owner of the derivative or
  concavity theorems.
- Newton and Maclaurin inequalities: NumberFieldEnumeration §1.1 (the case `S_k ≤ S_1^k` on the
  orthant, cited in Scope with how §2.1 differs) and ClassicalArithmeticCompletion (a log-concavity
  remark). Not at the pins.
- Plurisubharmonic functions: AffineMorseLefschetz and ComplexComparisonPartII (strict
  plurisubharmonicity, exhaustions, regularization of positive currents, cited in Scope). The pins
  have only the strict predicates `TauCeti.IsStrictlyPlurisubharmonicAt` and
  `TauCeti.IsManifoldStrictlyPlurisubharmonicAt`; the Lean statements write plurisubharmonicity as
  nonnegativity of the Levi form.
- Exponential integrability: PDE's Trudinger inequality and John–Nirenberg, different objects.
- De Giorgi's iteration lemma (§8.2): the pinned `TauCeti.le_geom_of_le_mul_pow_mul_rpow`
  (`TauCeti/Analysis/SpecificLimits/FastGeometric.lean:74`) is the sequence form
  `Y_{n+1} ≤ C·b^n·Y_n^{1+α}`; §8.2 is the continuous-parameter form with vanishing past an explicit
  level, a different statement, so it is kept.
- The objects the design already cites as supplied stay supplied: Poincaré (RiemannianGeometry R5c,
  item 4), the eigenvalue inequalities, the Levi form, the sub-mean-value and Sobolev inequalities
  and the superadditivity of the geometric mean (pinned Tau Ceti), the strong maximum principle,
  ABP and the interior Schauder estimate (PDE §§3.2, 5.6), the type calculus, Chern connections
  and Kähler identities (ComplexKahlerGeometry K1–K6.0).

**Removals: none.** No definition or theorem of the design exists elsewhere; the design had
already deleted and cited what does. No declaration of `Suggested.lean` shares a fully qualified
name with a declaration of a readable roadmap (its namespace is
`TauCetiRoadmap.ComplexHessianEquations`).

Ownership against open pull requests was checked through the searches above and `roadmaps show`.
The overlap file lists no open pull request that changes this roadmap, no dropped id and no id that
only an open revision defines; its closest roadmaps (ComplexKahlerGeometry, PDE, ManifoldOptimization,
SymmetricHyperbolicSystems open; PDE, Yamabe, RiemannianGeometry on main) were read for their scope:
the shared objects are the supplier contracts above, with one owner each.

**Supplier gap.** PDE §5.4 (E23) on main still plans the weak Harnack and Harnack inequalities for
weak solutions of the homogeneous equation only (`harnack_of_isWeakSolution_ball`), and the pinned
`TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value`
(`TauCeti/Analysis/PDE/Regularity/Harnack.lean:284`) is the case of zero forcing; the
supersolution inequality with a forcing term is still missing, so `gap:weak-harnack-supersolutions`
stays.

## Supplier and pin audit

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5` (`lake-manifest.json`), as the README says.

All suppliers (ComplexKahlerGeometry, PseudodifferentialOperators, PDE, DifferentialGeometry,
RiemannianGeometry, ComplexManifolds) are on main. K3Surfaces, ShimuraVarieties and
NumberFieldEnumeration are open roadmaps cited only in Scope and Downstream consumers, never as
suppliers.

Every backticked Mathlib and Tau Ceti name of the README was checked mechanically (131
identifier-like backticked spans were extracted, among them sub-scripted symbols such as `B_0`). Those in built modules were elaborated with `#check @name` in a
scratch copy of `Suggested.lean` with extra Tau Ceti imports (CourantFischer, KyFan,
MeanInequalities, Riemannian Laplacian, Integration Positivity, Harmonic MeanValue, VolumeDensity
Volume): no error. Seven names in modules without object files were confirmed by their declaration
lines: `LinearMap.IsSymmetric.re_trace_comp_le_sum_eigenvalues_mul_eigenvalues`
(`HoffmanWielandt/Basic.lean:78`), `LinearMap.concaveOn_det_rpow` (`MinkowskiDeterminant.lean:124`),
`TauCeti.Manifold.exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add` (`Riemannian/Sobolev.lean:185`),
`TauCeti.PDE.exists_ae_setAverage_rpow_rpow_inv_le_mul_value` (`PDE/Regularity/Harnack.lean:284`),
`TauCeti.leviForm_norm_sq` (`Complex/QuadraticLeviForm.lean:187`), `TauCeti.toMatrix₂_leviForm`
(`Complex/Wirtinger/LeviForm.lean:79`), `TauCeti.re_leviForm_mfderiv_nonpos_of_isLocalMax`
(`Manifold/Complex/MaximumPrinciple.lean:64`). `roadmaps resolve` lists no cross-roadmap citation
and no Lean name found nowhere.

What the native definitions say and do not include, quoted at the pin and recorded in the README:
`Polynomial.Splits f` is membership in the submonoid generated by the constants and the monic linear
polynomials; `Matrix.IsHermitian.eigenvalues` is indexed through `Fintype.equivOfCardEq` and need
not be sorted, so `eigenvalueVector` uses the sorted `LinearMap.IsSymmetric.eigenvalues`;
`TauCeti.RoughForm.wedge_apply` has the factor `(k!·l!)⁻¹`, the determinant normalization;
`TauCeti.integralTopForm` is `0` for a nonintegrable form; `TauCeti.ComplexManifold.isManifold_real`
is a scoped instance; `TauCeti.SmoothForm.IsClosed` is `mextDeriv = 0`.

## Elaboration and mechanical verification

Command: `lake env lean <Suggested.lean>` from the content checkout. Two Tau Ceti modules had no
object file and were built first with `lake build TauCeti.Geometry.Manifold.Complex.LeviForm
TauCeti.Analysis.Complex.LeviForm` (exit 0).

Outcome: exit code 0; exactly **18** warnings `declaration uses 'sorry'`, one for each theorem; no
other message.

The `#check @name` comparison was run on every declaration (32 names) in one scratch file and each
elaborated type was compared with its README statement. Every hypothesis is in the signature
(`[T2Space X] [CompactSpace X] [ConnectedSpace X]`, `[FiniteDimensional ℂ E]`, the compatibility,
closedness, invariance and nonnegativity hypotheses, `0 < γ`, `n < p`). What changed because of the
mechanical checks: `hermitianForm` and `ddbarHermitianForm` take `E` explicitly (the coercion from
`TauCeti.SmoothTwoForm` to `TauCeti.RoughForm` needs the model space, as Tau Ceti's own
`manifoldLeviForm E` does); `formPow` and `formPowIntegral` take a `TauCeti.SmoothTwoForm`, so that
`formPowIntegral κ (fun _ ↦ 1)` elaborates with no ascription; `hermitianMatrices` is
`noncomputable`; the metric is named `κ` because `ω` is the analytic-smoothness notation of
`open scoped ContDiff`. No section variable is dropped from any statement.

## Adversarial mathematics pass

Every row was computed in this job.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `eigenvalueVector`, `hermitianMatrices` (§1.1) | `[[2,1],[1,2]]`; `[[1,i],[−i,1]]`; `[[0,1],[0,0]]`; `n = 0` | `(3, 1)` sorted against a possible unsorted `(1, 3)`; eigenvalues `2, 0`, Frobenius norm `2 = (4 + 0)^{1/2}`; conjugate transpose `[[0,0],[1,0]] ≠` itself; zero space, empty vector | Holds; Checks added |
| `differentiableAt_spectralFunction_iff` | `f = max(μ_1, μ_2)` at `Id`; `f = σ_1`; `n = 0` | `λ_1(Id + t·diag(1,0)) = 1 + max(t, 0)`, both sides not differentiable; trace, both differentiable; one-point space, both true | Holds |
| `fderiv_spectralFunction_apply` | `𝕜 = ℂ`, `A = [[1,i],[−i,1]]`, `f = μ_1² + 3μ_1μ_2 + μ_2²`, `H = [[0.3, 0.2−0.5i],[·, −0.7]]` | central difference `−1.000000`; formula with `U` columns `(1, −i)/√2`, `(1, i)/√2`: `−1.000000`; wrong model `Σ ∂_if·H_ii = −3.0` | Holds |
| `contDiffOn_spectralFunction_iff` | `f = max`, `Ω = ℝ²` and `Ω = {μ_1 ≠ μ_2}` | both sides false on `ℝ²`; both true off the diagonal (`f` locally a coordinate, `λ_1` smooth where simple) | Holds |
| `convex_spectralDomain` | non-convex wedge cone of §1.4 | `diag(1, −0.4)`, `diag(1, 0.1)` in, midpoint `diag(1, −0.15)` out: convexity of `Γ` is used | Holds; existing Check |
| `concaveOn_spectralFunction` | `f = σ_2^{1/2}` on `Γ_2`, `A = diag(4,1)`, `B = [[1, 1.5i],[−1.5i, 4]]`; `f = σ_2` | `F(A) = 2`, `F(B) = 1.3229`, `F((A+B)/2) = 2.3848 ≥ 1.6614`; `det(t·Id) = t²` convex | Holds |
| `lineRestriction`, `IsHyperbolic`, `gardingCone` (§2.2) | `x² + y²` at `(1, 0)`; `xy` at `(1,1)`; constant `1` | `t² + 1` does not split although `p(a) = 1`; roots `−x_1, −x_2`; cone `ℝ^N` with `D_bp = 0` | Holds |
| `garding` | `p = 2xy − 0.9(x² + y²)`, `e`; points `(1, 1.2)`, `(1, 0.8)` | both in the cone; `p^{1/2}`: `0.4517`, `0.3521`, midpoint `0.4472 ≥ 0.4019`; `D_b p((1,1.2)) = 0.472 > 0` for `b = (1, 0.8)`; `m = 0` excluded (`D_bp = 0`) | Holds |
| `isHyperbolic_and_gardingCone_eq_of_mem` | `xy`, `a = (1,1)`, `b = (2,1)`; `b = (1, −1)` | roots at `x = (1,−1)`: `(−1, 1)` for `a`, `(−0.5, 1)` for `b`, outside both cones; `p(1, −1) = −1 < 0`, not hyperbolic: membership is needed | Holds |
| `isHyperbolic_esymm_and_gardingCone_eq` | `n = 3`, `k = 2`, `λ = (1, 1, −0.4)`; `(2, 2, −1)` | `σ = (1.6, 0.2, −0.4)`; roots of `3t² + 3.2t + 0.2`: `−0.0667`, `−1.0`, both negative, in both sets; `σ_2 = 0`, on the boundary of both | Holds |
| `hessianCone` at `k = 0` | `−e` | `hessianCone n 0 = ℝⁿ ∋ −e`, `σ_1(−e) = −n < 0` | Check rewritten (correction 2) |
| `concaveOn_hessianQuotient` | `n = 3`, `k = 2`, `l = 1`, segment from `(1, 1, −0.4)` to `(3, 0.5, 0.5)` | `q = 0.125`, `0.5848`, `0.8125`, midpoint `0.5848 ≥ 0.4688`; partials `0.2969, 0.2969, 1.1719 > 0` | Holds |
| `AdmissiblePair`, `AdmissiblePair.IsStructural` | `σ_1 − ε|λ|`; `max_j λ_j`; shifted quadrant; pure quotient `σ_2/σ_1`, `n = 2` | value `δ − ε√(1 + (1−δ)²) < 0`; not `C¹` at `e`; `(−3/2, 3)` missing; `∏∂_jf = λ_1²λ_2²/(λ_1+λ_2)⁴ → 0` | Holds; existing Checks |
| `exists_hessianPair` | `n = 3`, `k = 2` at `(1,1,1)`, `(1,1,0)`, `(1,1,−0.4)`, `(5,1,1)`, `(0.1,0.1,1)`; `n = 2`, `k = 1, 2` | `∏∂_j σ_2^{1/2}`: `0.19245`, `0.25`, `1.00623`, `0.24669`, `0.31434`, against `3^{−3/2} = 0.19245`; constants `1` and `1/4` | Holds; sharp at `e` |
| `hermitianForm` (§3.1) | `ℂ`, `ω = dx ∧ dy`, `u = 1 + 2i`, `v = 3 − i` | `H(u, v) = 1 − 7i = ū·v`; swapped parts give `−7 + i`, and `H(1,1) = i` | Holds; Check added |
| `ddbarHermitianForm` | `ℂⁿ`, `α = 0`, `φ = |z|²`; constant `φ` | `2·L = 2h`, eigenvalues `2e` (`TauCeti.leviForm_norm_sq`); without the `2`, `e`; constant: `0` | Holds |
| `IsRelEigenvalueVector` | `ℂ²`, `h = diag(2,1)`, `a = diag(2,3)`; `a = h`; `a = s·h` | family `(e_1/√2, e_2)`: `μ = (1, 3)` or `(3, 1)`; Euclidean basis has `h(e_1,e_1) = 2`, excluded (it would give `(2, 3)`); `μ = e`; `μ = s·e` | Holds; API refined |
| `formPow`, `formPowIntegral` (§3.2) | `ℂ²` standard `ω`; torus `ℂ/(ℤ+iℤ)`; `ℂP¹`, `χ = 2ω` | `ω²(∂_{x_1},∂_{y_1},∂_{x_2},∂_{y_2}) = 2 = 2!` against `1/3` for the `Alt` normalization; area `1`, opposite orientation `−1`; `2` | Holds; Checks added |
| `IsNormalizedSolution` (§3.3) | `χ = ω`, `F = 0`, `φ = −1`; `c ≤ 0` with `σ_1 − ε|λ|` | equation holds, no zero, excluded; `c > 0` excludes the pair's negative values | Holds; Check added |
| `eq_of_isNormalizedSolution` (§4.2) | two components; `φ + 1`; Kähler Monge–Ampère, `F = 0` | `φ = 0` and `ψ = (0, −1)` both solve; `sup = 1`, excluded; `(1, 0)` unique | Holds; connectedness and normalization in the signature |
| `existsUnique_yau` (§6.6) | `F = a`; torus `n = 1`, `F = 0.5·cos 2πx`; `n = 0` | `b = −a`, `φ = 0`; `b = −log I_0(0.5) = −0.06155` against `−ε²/4 = −0.0625`; point: `b = −F(x_0)`, `φ = 0` | Holds |
| `exists_lintegral_exp_le_of_plurisubharmonic` (§7.1) | `u_ε = c·log((|z|²+ε)/(4+ε))`, `n = 1`; `n = 0` | limit integrable exactly when `αc < 1`, so `α` must shrink like `1/A`; point with unit mass: `−u(0) ≤ A`, `e^{−αu(0)} ≤ e` at `α = 1/A` | Holds; `C` before `A` |
| `exists_formPowIntegral_exp_le` (§7.2) | `ℂP¹`, `ψ_ε`; `ψ = 0`, `θ ≥ 0` | unbounded for `α ≥ 1`; value `V`; `⨆` is a maximum on compact nonempty `X` | Holds |
| `exists_abs_le_of_degenerating` (§8.3) | Monge–Ampère pair from `exists_hessianPair` at `k = n`, `χ = κ`, `F = 0`, `φ = 0`, `c = 1 + t` | hypotheses hold with `K_1 ≥ (1+t)^n/((1+t)^nV)`, `K_2, K_3 ≥ 0`; conclusion `0 ≤ C` (not vacuous) | Holds |
| `exists_abs_le_mongeAmpere_degenerating` (§8.4) | `χ = 0`, `t = 1`, `F = 0`, `φ = −M` | `∏μ = 1 = c^n` with `c = 1`, entropy `0`, `|φ| = M` unbounded, excluded by `sup φ = 0` in the signature | Holds |
| `exists_abs_le_of_entropy_le` (§8.6) | Laplace pair `n = 1`; `γ ≤ 0` | `1 + Δ_ωφ = e^F`; with `γ ≤ 0` every pair would qualify, which the source's `γ > 0` excludes | Holds; `0 < γ` kept |
| `exists_abs_le_hessian_degenerating` (§8.7) | `n = 2`, `k = 1`; `n = k = 1`; two-valued entropy test | `q > 2`; `q > 1`; `F = (1/2, −1.0462)` on halves: `Ent_2 = 0.3983 ≤ (2/e)²(1 + 1.4211) = 1.3105`; `F = (−2, 2.1727)` on `9/10, 1/10`: `Ent_2 = 4.6329 > 4.1839` (second term alone) and `≤ 4.7253` (both terms) | Holds |
| Ky Fan API (§1.2) | `T = diag(3,1,1)`, `t = 0.7`; perturbation `diag(0, 0.1, −0.1)` | `κ_2(T + t·Id) = 5.4 = κ_2(T) + 2t`; `|Δκ_2| = 0.1 ≤ 2·0.1` | Holds; API added |
| Conventions, `n = 0` | `ℝ⁰` | `Γ_1 = {λ : 0 > 0} = ∅`; no `AdmissiblePair 0` (fields `pos_mem_cone` and `sum_pos_of_mem_cone` contradict) | Holds |
| Gap contract | `u = 1` except `u(0) = 0` on `B_4 ⊂ ℝ²`; `u_ε` on `(−4, 4)` | ordinary infimum gives `4π ≤ C·0`; `‖f_ε‖_{L^{3/4}} = O(ε^{1/3})`, `‖u_ε‖_{L¹(−2,2)} → 4` | Holds; unchanged except form |

Unused hypotheses (P3, kept to match the README): `IsOpen Γ` in `convex_spectralDomain` and
`concaveOn_spectralFunction` (Davis's theorem holds for every convex symmetric `Γ`), and the `C¹`
hypothesis in `concaveOn_spectralFunction`, which the route uses and the theorem does not need.

## Dependency check

```text
depcheck: 240 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is in the merge order right after
ComplexComparisonPartII, and all its suppliers are on main.

## Suspicious text

None found in the files, sources and roadmaps read.
