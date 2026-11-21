# Review of InteriorPointMethods (pull request #2860 at 2753be4)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the five layers was re-derived or recomputed (the central point bound and the centering gap from convexity alone, the calculus of self-concordance, the Hessian comparison, the two function bounds, the Dikin ellipsoid, the constant in `λ₊ ≤ 2λ²` on the whole range of `λ`, the two-phase count), every numerical Check was recomputed, and every Boyd–Vandenberghe locator was read in the text; none is wrong. There is one small correction and one format note, neither blocking. The thirteen locators into Nemirovski's lecture notes could not be read against the text, which is left to the human reviewers together with two questions of scope.

## C01 — The route of 3.1 rests on a fact about symmetric trilinear forms that the text calls classical and gives no owner

An implementer of 3.1 cannot tell whether the diagonal-supremum fact (a symmetric trilinear form bounded by `2|h|³` on the diagonal is bounded by `2|h₁||h₂||h₃|` for a Euclidean norm) is to be proved inside this target or taken from a library. It is the whole content of the step from the definition of 2.1 to the basic inequality, and the pinned Mathlib and Tau Ceti do not have it: a search of both for a polarization bound on symmetric multilinear forms returns only the polarization identities of inner products (`Mathlib/Analysis/InnerProductSpace/Basic.lean`, `Mathlib/Analysis/InnerProductSpace/Symmetric.lean`). The *Needs:* line of 3.1 (line 315) lists only 2.1 and `ContDiffAt.isSymmSndFDerivAt`.

The smallest change is one clause in the route of 3.1 (line 305), saying that this fact is proved here as part of 3.1, in the finite-dimensional inner product space spanned by `h₁, h₂, h₃`, with the locator already given for it.

## N01 — The results of 3.1, 3.4 and the bound `λ₊ ≤ 2λ²` of 4.2 are located only in lecture notes

The basic inequality, the Dikin ellipsoid and the decrement bound of the damped step carry locators into Nemirovski's 1996 notes alone; the monograph of Nesterov and Nemirovski is named under References without a locator. A locator into a published text for these three would let a reader check them without the notes.

## Not verifiable

- Nemirovski's 1996 lecture notes (13 of the README's 29 locators: Definition 2.0.1, Proposition 2.1.1, Corollary 2.1.1, §2.2 items 0, I, IV, IVa, V, VIII, IX, X, statement (P) and its exercises): the address given in the README was not accepted as a legal place by the sources service, because it does not spell the author's name, and no other legal copy was looked for. The statements they are cited for (2.1 to 2.4, 3.1 to 3.5, 4.1 to 4.3) were checked by derivation and computation instead, and where Boyd–Vandenberghe states the same result, against that text.
- The contents page of the same notes: the arrangement of Layers 2 to 4 was not compared with it.

## Source issues

- none

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 central point bound | `[0,1]`, `f₀ = x`, `t = 10`; `|x|` on `[−1,1]`; `m = 0`; `t = 0` | `x = 0.0900980`, `λ₁ − λ₂ = 1`, gap `0.2 = 2/10`; `−2/t = −2/t` at `z = 0`; `t = 0`: `1/2 ≤ 0` false | true; `t > 0` needed | none |
| 1.3 centering gap | `t = 10`, `μ = 2`, `y = 0.0475062`; `μ = 1`; `y = x` | left `0.257545`, right `2(1 − log 2) = 0.613706`; `μ = 1`: `0`; chain re-derived: `μm − m − m log μ` | true | none |
| 1.4 outer iterations | `m = 0`; `m/(ε t₀) < 1`; `μ = 1 + 1/√m`, `m = 1, 2, 5, 100` | `m = 0`: hypothesis `0 ≤ k`; `√m log μ = 0.693, 0.756, 0.827, 0.953 ≥ log 2` | true | none |
| 2.1 definition | `−log`; `x log x − log x`; `x log x` at `0.2`; `exp`; `(−log)/4`; `−x²` | ratio `1`; `0.530` at `1`; `25 > 22.36`; fails iff `x < −1.386`; `1/(2x³) > 1/(4x³)`; `(−2)^(3/2) = 0` in `Real.rpow` | determines the object; convexity field needed | none |
| 2.2 affine substitution | `A = 0`, `b ∈ U`; `b ∉ U`; `F = 0` | constant on `F`; empty domain; preimage open and convex, `D^k` pulls back by `A` | true | none |
| 2.3 weighted sums | `s = ∅`; weight `1/4` on `−log`; `α ≥ 1` | `0` on `E`; `1/(2x³) > 1/(4x³)`; `α b^(3/2) ≤ (αb)^(3/2)`, then superadditivity | true; weight bound needed | none |
| 2.4 polyhedral barrier | `m = 0`; `aᵢ = 0` with `bᵢ > 0` and `bᵢ ≤ 0`; `(0,1)` | frontier empty; constant term or empty set; `−log x − log(1−x) → +∞` at `0, 1` | true | none |
| 2.5 log-determinant | `X = I₂`, `V = diag(1,−1)`, `t = 1/2`; nonsymmetric `V`; nonsymmetric `X`; `n = 0` | `g″ = 40/9`, `g‴ = 416/27 = 15.407 ≤ 18.739`; set `{0}` not open; set empty; `0` on `ℝ` | true; symmetry of `V` needed | none |
| 3.1 basic inequality | `−log` on `(0,∞)`; `−log x₁ − log x₂` at `(1,1)`, `h = (1,1)`; singular Hessian | equality `2|h₁h₂h₃|/x³`; `4 ≤ 5.657`; `δ`-regularisation keeps the diagonal bound | true | C01 |
| 3.2 Hessian comparison | `−log` at `1`, `h = ∓r`; `g = (1,0), (0,1)`, `r = 1/2`; `r = 0` | `1/(1−r)²` attained; `1/(1+r)² ≥ (1−r)²`; `4 = 4`, `1 ∈ [1/4, 4]`; derivative signs of `(1−rs)^(±2)ψ` rechecked | true | none |
| 3.3 function bounds | `−log` at `1`, `h = 0.5, −0.5, 3` | `−log 1.5 = −0.40547` both sides; `log 2 = 0.69315` both; `−log 4` both; double integral `r − log(1+r)` | true | none |
| 3.4 Dikin ellipsoid | `−log` on `(0,∞)`; `−log` on `(0,1)`, `x = 0.8`, `h = 0.4`; `U = E` | `h = −x` reaches the boundary at `|h|ₓ = 1`; `|h|ₓ = 0.5`, `x + h = 1.2 ∉ U`; frontier empty | true; barrier property needed | none |
| 3.5 suboptimality | `x − log x` at `0.5`; `−log`; `−log x₁ + x₂`; `λ = 0.68, 0.69` | `0.19315` both sides; `λ ≡ 1`; junk `λ = 0` with `f` unbounded; `0.45943 ≤ 0.4624`, `0.48118 > 0.4761`; root `0.683803` | true; `λ < 1`, definiteness, finite dimension needed | none |
| 4.1 damped Newton map | `x − log x` from `x > 1` and `1/2`; a minimizer | lands on `1`; `2/3` with `λ = 1/3`; fixed point | definition has the intended value | none |
| 4.2 one damped step | `x − log x` at `1/2`; `F = 20x − log x − log(1−x)` at `0.090098`; `−log` on `(0,1)` | decrease `0.12102 ≥ 0.09453`, `1/3 ≤ 1/2`; `λ = 0.89660`, `0.257536 ≥ 0.256535`, `λ₊ = 4.346·10⁻³ ≤ 1.608`; `x₊ = 1.2` | true; remainder `λ²/(1+λ)` re-derived for all `λ` | none |
| 4.3 two phases | `F` as above; `ε = 10⁻¹⁰`; `ε ∈ (1/2, 1)`; `−log` on `(0,1)` | `γ = 0.0268564`, `1/γ = 37.235`; bound `9.590`, actual `k₀ = 1`; `5.054`; `λ ≡ 1` | true | none |
| 5.1 centering | `[0,1]`, `t = 10`, `μ = 2`; `μ = 1 + 1/√m`; `m = 0` | `2(1 − log 2)/γ = 22.851`; `0.307, 0.345, 0.388, 0.469 ≤ 1/2`, `1/(2γ) = 18.618`; `m = 0`: `k₀ = 0`, `λ = 0` | true | none |

- Source locators checked against the text: 16 of 16 into BoydVandenberghe2004 (lines 20300, 20350, 20357–20389, 20451, 20472, 20486, 20504–20512, 20553–20571, 23124–23131, 23166–23168, 23220–23256, 23677–23685, 24091, 24201–24290, 24366–24387), all correct, printed pages included; 0 of 13 into Nemirovski's notes.
- Library declarations opened at the pinned Mathlib: 24, all present in the files the README names (for example `ConvexOn.comp_affineMap` at `Analysis/Convex/Function.lean` 974, `NNReal.add_rpow_le_rpow_add` at `Analysis/MeanInequalitiesPow.lean` 145, `ContDiffAt.isSymmSndFDerivAt` at `Analysis/Calculus/FDeriv/Symmetric.lean` 538, `ContinuousLinearMap.inverse` at `Topology/Algebra/Module/ContinuousLinearMap/Invertible.lean` 45, `Matrix.PosDef` at `LinearAlgebra/Matrix/PosDef.lean` 176).
- Cross-roadmap citations resolved: 4 (NewtonAndQuasiNewtonMethods 1.1, whose `newtonMap` and `variable` line agree word for word with the copy and whose scope excludes the Newton decrement, self-concordance and damped steps; NonlinearProgrammingOptimality Layers 2 and 3; ConvexAnalysisAndDuality 5.2 to 5.4; MathematicalStatisticsHighDimensional 7.4).
- Duplication by object: no self-concordance, Newton decrement, logarithmic barrier or central path in the pinned Mathlib or Tau Ceti, on main or in the open roadmaps; `Polynomial.newtonMap` of Mathlib is a different object.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/InteriorPointMethods/Suggested.lean`: 15 `sorry` warnings and nothing else; no `set_option`, no sorry'd data, single `import Mathlib`. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) closes none of the 15 theorems. `#check @name` on the declarations: every theorem keeps its binders (`FiniteDimensional` is explicit in 3.5, 4.2, 4.3, 5.1); only the two definitions of 1.1 shed unused instance binders, which their bodies do not need.
- Pull request text read against the head: 15 theorems and 8 definitions as stated, one open supplier named; nothing contradicted.
- All automatic checks passed at this head; none set aside.

Overlap check: read NonlinearProgrammingOptimality, NewtonAndQuasiNewtonMethods, ConvexAnalysisAndDuality, BoundedConicHulls, ExactPenalties, ConvexLifting, FiniteAffineBoundTightening; one shared object, the Newton map, owned by NewtonAndQuasiNewtonMethods 1.1 and cited here; nothing else shared.

Source independence: 9 passages compared with 1 source, none shared; largest share BoydVandenberghe2004, 16 of 29 locators; contents compared with BoydVandenberghe2004: independent (Layer 1 draws on its §11.2 to §11.3, Layer 2 on §9.6.1 to §9.6.2, Layers 3 and 4 on §9.6.3 to §9.6.4, Layer 5 on §11.5, in an order the dependencies 1.3 → 5.1 and 3.x → 4.x force). Nemirovski's notes and their contents page could not be read.

Research link: Layers 2 to 4 are the self-concordance theory of Nesterov and Nemirovski (1994) that underlies polynomial-time interior-point methods; Layers 1 and 5 are the barrier-method analysis of Boyd and Vandenberghe (2004), §11.5. Rests on the README's References and BoydVandenberghe2004 §9.6 and §11.5.

## For the human reviewers

- **Not tested.** Nemirovski's 1996 lecture notes carry 13 of the 29 locators; the sources service did not accept the address in the README's References as an author's page, so wording and arrangement were not compared with them.
- **Licence.** The same notes are unpublished lecture notes read from a personal page (README, References); their host could not be classified.
- **Scope.** The targets are theorems about the damped Newton map and barrier central points as recursively defined sequences, with step counts as bounds on indices (README, Conventions, "Methods"); whether this is mathematics of an algorithm or an algorithm is yours to decide.
