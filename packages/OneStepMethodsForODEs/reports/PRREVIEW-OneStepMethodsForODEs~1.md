# Review of OneStepMethodsForODEs (pull request #2494 at 4274b34)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of `Suggested.lean` and every Check of the README was recomputed (constants of the defect bounds, the eight order conditions on the named tableaux, the stability functions and regions, the contractivity factors, Cooper's identity) and all agree; the sampled locators into the four sources hold, and the cited Mathlib and Tau Ceti declarations exist at the pins with the hypotheses the README states. There is one small correction and two format notes, none blocking. Two points are left for the human reviewers: the kind of sources the roadmap rests on, and the classification of two hosts.

## C01 — The scope sentence "Every theorem of this roadmap takes a solution of the differential equation as a hypothesis" is false as written

In "Scope and ownership", under "Already in the libraries" (README line 39): the discrete stability theorem 1.3, all of Layer 2, 5.1 to 5.3 and all of Layer 6 mention no solution at all (1.3 compares two arbitrary sequences; 6.2 takes a stage vector only). A reader looking for what 1.3 or 6.2 assume is told something they do not assume. What is meant is the second half of the sentence. It would be true as: "No theorem of this roadmap constructs a solution of the differential equation; those that concern one take it as a hypothesis."

## N01 — The route of 4.2 uses symmetry of the higher derivatives of `f`, which its *Needs:* line does not name

For `p = 4` the exact side produces `f''(f'f, f) + 2 f''(f, f'f)` and the numerical side the two orders with equal weight, so the tree-by-tree cancellation needs `f''` (and `f'''`) symmetric. Mathlib has it without completeness: `ContDiffAt.isSymmSndFDerivAt` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`, line 538). Naming it in the *Needs:* line of 4.2 and in the supplier contracts would spare an implementer the search.

## N02 — The arXiv topic in `metadata.toml` is `math.CA`; `math.NA` may fit better

The one cited source that carries an arXiv class in the copy read, Sanz-Serna 2015, is filed under `math.NA`, and the subject is the numerical analysis of ODEs. `math.CA` (which includes ordinary differential equations) is defensible; this is offered, not required.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `meshNode` | `t₀ = 2`, steps `1, 1/2, 1/4`; steps `1, −1`; all `0` | nodes `2, 3, 7/2, 15/4`; shifted index gives `2, 5/2, 11/4`; `t₂ = t₀` | agrees | none |
| 1.2 `oneStepSeq`, `oneStepDefect` | `Φ = u`; `Φ = t`, `y = t²/2` | `Y n = (1+η)^n y₀`; `Y n = η² n(n−1)/2`; defect `h²/2` (sign: exact minus numerical) | agrees | none |
| 1.3 `norm_sub_le_gronwallBound_of_oneStep` | `Φ = Lu`, `ηL = 1`, `n = 2`; `L = 0`; `τ < 0`; steps `1, −1` | `4 ≤ e² = 7.389`; equality `τ(t_n − t₀)`; `τ < 0` forces `h n = 0`, bound `δ`; negative steps: `Y 2 = 4 > 1` | true; nonnegativity of steps needed and present | none |
| 1.3 source | Süli2022 lines 486–498, (25) | scalar, uniform mesh, `ρ = 0`, bound `e^{LΦ(x_n−x₀)}|e₀| + ((e^{…}−1)/LΦ) T` | README generalises as it says | none |
| 1.4 `norm_sub_oneStepSeq_le` | `Φ = t`, `y = t²/2`; `p = 0`; `C < 0`; `hmax < 0`; steps `1, η, …` | error `η t_n/2` = bound; `p = 0`: error `t_n − t₀` = bound; `C < 0` or `hmax < 0`: both sides `δ`; error `1/2 > η/2` | true | none |
| 1.4 source | Süli2022 lines 486–498 and 613–617 (Theorem 4, Definition 3) | Definition 3 names the largest `p` with `|T_n| ≤ K h^p` | supports the citation | none |
| 1.5 consistency ⇒ convergence | `Φ = 2u` vs `f = u`; `Φ` discontinuous at `s = 0`; `a > b`, `a = b` | `(1 + 2/N)^N → e² ≠ e`; same limit; vacuous / error `0` | true; continuity and consistency both needed | none |
| 2.1 stage equations | `s = 0`; `A = (1)`, `f = λu`, `hλ = 1`; `f = sin`, `h = 3/2` | increment `0`; no solution (`y ≠ 0`) or all `k` (`y = 0`); three roots of `k = sin(3k/2)` | junk value `0` as stated | none |
| 2.1 source | Butcher2007 lines 137–139; SanzSerna2015 lines 150–166; Mirzaei2024 line 1376 | `F_i = f(x₀ + h c_i, y₀ + h Σ a_ij F_j)`, `y₁ = y₀ + h Σ b_i F_i` | same object, row convention agrees | none |
| 2.2 `explicitLipschitzConst` | Euler; midpoint; Heun; RK4; `s = 0` | `L`; `L(1 + hL/2)` twice; `L(1 + x/2 + x²/6 + x³/24)`; `0` | agrees; Mirzaei2024 line 928 gives `L + (h/2)L²` | none |
| 2.3 `existsUnique_isStage`, `norm_increment_sub_le` | `A = (1)`, `f = Lu`; trapezoid; `c₀₀` with shift; `s = 0`, `α < 0` | constant `L/(1 − hL)` attained; unique for `hL < 2` though `α = 1`; fixed point `(1, 1/2, 1/4, …)` not in `E`; trivial | true; completeness needed and present | none |
| 3.1 `explicitEuler_error_le` | `f = t`; `y = exp`, two steps `1/2`; `arctan` | error `η t_n/2` = bound; `e − 9/4 = 0.468 ≤ (e/4)(e−1) = 1.168`; `M₂ = π/2` (Süli2022 line 529) | true; matches Süli (20), line 438 | none |
| 3.2 `heun_defect_le`, `explicitMidpoint_defect_le` | `f = t²`, `t = 0`; `y = exp`; `h < 0` | `−h³/6 = M₃h³/12`, `h³/12 = M₃h³/24` (equalities); bounds `e^h h³/3`, `e^h h³/6`; fails for `h < 0` | true; constants rederived: residual + `(h/2)L·M₂h²/2`, `hL·M₂h²/8` | none |
| 3.3 implicit defects | `f = t`; `f = t²`; `exp`, `h = 1/2` | `−h²/2` equality; `−h³/6`, `h³/12` equalities; `√e − 2 = −0.351`, bound `0.412` | true; `‖e‖(1 − hL/2) ≤ (M₃/24 + LM₂/8)h³` rederived | none |
| 4.1 `OrderConditions` | `rk4`; 3-stage Kutta; Heun, midpoint; row `(1/10, 0, 9/10, 0)` | all eight: `1, 1/2, 1/3, 1/6, 1/4, 1/8, 1/12, 1/24`; `bAc = 1/6`; `bc² = 1/2, 1/4`; `19/120` | agrees with Butcher2007 (2)–(9), lines 290–320 | none |
| 4.2 `HasOrder`, sufficiency | `p = 0`; `s = 0`; `b = (1/2,1/2)`, `c = (0,1)`, `A₂₁ = 1/2` | `p = 0`: Lipschitz bound; `s = 0`: defect `h`; step `1 + h + h²/4`, not order 2 | true; row-sum condition needed and present | N01 |
| 4.3 `hasOrder_iff_orderConditions` | `f = t^{k−1}`; `f = u + t^q`; `f = tu`; `implicitMidpoint`, `f = u²` | `bc^{k−1} = 1/k`; `bA^m c^q = q!/(q+m+1)!` gives `1/6, 1/12, 1/24`; `h⁴` coefficient `1/8`; discriminant `1 − 2hy > 0` | all eight conditions recovered; explicitness needed and present | none |
| 4.4 `rk4_hasOrder` | `f = t³`, `t⁴`, `u` | `h⁴/4` exact; `5h⁵/24`, defect `−h⁵/120`; `R = Σ_{k≤4} h^k/k!` | order exactly 4 | none |
| 5.1 `stabilityFunction` | Euler; Heun; RK4 at `−ih`; implicit Euler at `z = 1`; `s = 0` | `1 + z`; `|R|² = 1 + h⁴/4`; `1 − h⁶/72 + h⁸/576`; junk `R(1) = 1`; `R = 1` | agrees with Butcher2007 line 452 | none |
| 5.2 regions, A- and L-stability | Euler; midpoint; implicit Euler; `A = diag(1, −1)`, `b = (1, 0)` | `|1 + z| ≤ 1`; `|1 + z/2| ≤ |1 − z/2| ⇔ Re z ≤ 0`; `|1 − z| ≥ 1`, `R → 0`; det vanishes at `−1` | true; determinant clause does real work | none |
| 5.2 values | 3-stage at `−5/2`, `−13/5`; RK4 at `−27/10`, `−14/5` | `−47/48`, `−431/375`; `70307/80000`, `639/625` | bracket `−2.51`, `−2.78` (Süli2022 lines 940, 947) | none |
| 5.3 bounded region | `b = 0`; `s = 0` | `R = 1`, region `ℂ`; hypothesis `∑ b = 1` fails for `s = 0` | true; Butcher2007 line 467, `Polynomial.tendsto_abv_atTop` needs degree `> 0` | none |
| 5.4 `not_hasOrder_of_isExplicit` | `f = u`, `d = 1` | coefficient of `h^{s+1}`: `0` against `1/(s+1)!` | true; Butcher2007 Table 2 lines 235–288 | none |
| 6.1 contractivity | `f = μu`; `f = −u³`, `h = 1`; `f = −6u`, `μ = −1`; `h < 0` | equalities; `z = 1`, `z' = 0`; step `−y/2` against `1/3`; factors `2`, `3` against `1` | true; `μ ≥ 0` (midpoint) and `h ≥ 0` needed and present | none |
| 6.1 source | Süli2022 lines 2828–2838 (Definitions 15, 16) | `⟨f(x,u) − f(x,v), u − v⟩ ≤ 0`, resp. `≤ ν(x)‖u − v‖²` | supports the citation | none |
| 6.2 Cooper | identity expanded for nonsymmetric `B`; midpoint; Gauss-2; Euler, Heun, RK4, implicit Euler, trapezoid | residual `h² Σ (b_i b_j − b_i a_ij − b_j a_ji) B(k_i,k_j)`; `1 = 1`; `1/4 = 1/4`; `0=1, 0=1/4, 0=1/36, 2=1, 0=1/4` | true; SanzSerna2015 lines 221–229 | none |
| 6.3 symplecticity | midpoint on `H = (q²+p²)/2` | matrix `(1 − h²/4, h; −h, 1 − h²/4)/(1 + h²/4)`, det `1`; Euler det `1 + h²` | true; convention `ω(X_H, v) = dH v` at `TauCeti/Geometry/Symplectic/Hamiltonian/Basic.lean:59` | none |
| Scope sentence, line 39 | 1.3, Layer 2, 5.1–5.3, Layer 6 | none takes a solution | sentence false as written | C01 |

- Source locators checked against the text: 31 (Süli2022 15, Mirzaei2024 7, Butcher2007 6, SanzSerna2015 3); all hold.
- Library declarations opened at the pins: 28 (22 Mathlib, 6 Tau Ceti), each in the file the README names; none needs completeness where the README says none is needed (`Taylor.lean:390`, `MeanValue.lean:299`, `PicardLindelof.lean:116`).
- Cross-roadmap citations resolved on main: 3 (StochasticCalculus 9.6, MathematicalStatisticsFoundations 9.4, OptimalTransport 10.4); all boundaries, none a supplier; the leapfrog sign claim checked on `(1, 0) ↦ (0.5, −0.75)`.
- Duplication: no declaration on Runge–Kutta methods, Butcher tableaux, one-step methods or stability functions in the pinned Mathlib or Tau Ceti; Tau Ceti's `Analysis/SpecificLimits/DiscreteGronwall.lean` states two different estimates.
- Dependency check: `depcheck: 217 roadmaps, 2335 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 27 `sorry` warnings and nothing else; no `set_option`, no sorry'd data, imports as required.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, and `simp` with the definitions unfolded for the three stability-region statements): none of the 27 theorems closes.
- `#check` of the declarations with instance binders: `[CompleteSpace E]` and `[FiniteDimensional ℝ V]` are kept; signatures agree with the README.

Overlap check: read SymmetricHyperbolicSystems (the only roadmap in the three closest-roadmap lists); nothing shared (it treats difference schemes for PDE and excludes the ODE case `n = 0`).

Source independence: 14 passages compared with 4 sources, none shared beyond formulas; largest share Suli2022, 18 of 40 locators; contents compared with Suli2022 (and Mirzaei2024): independent (the roadmap puts the general one-step theory first, then tableaux, named methods, order conditions, linear stability, structure preservation; Suli2022 runs Euler and θ-method, general one-step, Runge–Kutta, absolute stability, then multistep).

Research link: Layer 6 states Cooper's 1987 theorem and the Lasagni–Sanz-Serna–Suris symplecticity theorem, which Sanz-Serna 2015 (SanzSerna2015 lines 221–255) takes as the basis for adjoint equations and optimal control; rests on that source. Layers 1 to 5 are classical convergence and stability theory.

## Not verifiable

- The Isabelle AFP entry named under "Provenance" was not opened; it is cited as reference material only and no statement depends on it.
- Attributions of B-stability to Butcher and Dahlquist in 6.1 carry no locator and were not checked against a text.

## Source issues

- none

## For the human reviewers

- Scope: 28 of 40 locators point to lecture notes (Suli2022, unpublished Oxford notes; Mirzaei2024, arXiv lecture notes) and 9 to a Scholarpedia article; the headline theorems are classical textbook results of numerical analysis. Only SanzSerna2015 is a research article.
- Licence: the Scholarpedia page (Butcher2007) is on a host whose licence class is not established (the page states its own terms); it was read from the public page. Suli2022 is an unpublished PDF on the author's university page.
- Licence: the README's "Provenance" names the Isabelle AFP entry *Ordinary Differential Equations* (Immler, Hölzl) as reference material; it was not opened, so `Suggested.lean` was not compared with it.
