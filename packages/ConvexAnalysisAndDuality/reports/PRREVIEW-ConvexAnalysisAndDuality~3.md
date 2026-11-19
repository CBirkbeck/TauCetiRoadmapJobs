# Review of ConvexAnalysisAndDuality (pull request #2498 at 3de4017)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one finding of the previous review (the homogenization in the route of 1.3) is repaired, as are its five small corrections, and all 48 statements of `Suggested.lean` survived the adversarial pass; the file elaborates with `sorry` as the only warning. There are one small correction (the route of the Karush–Kuhn–Tucker theorem applies 3.4 to constraint functions that are not differentiable) and two format notes, none blocking. Seven of the nine cited books could not be read legally, so most locators remain unverified; two points are left for the human reviewers.

## C01 — The route of 5.2 computes the normal cone of the feasible set with "Danskin 3.4 for `max gᵢ`", but 3.4 is stated for differentiable functions and the `gᵢ` of 5.2 are only convex

An implementer who follows the route of 5.2 (README, lines 1081–1084) has two steps that no target supplies. The route says the normal cone of the feasible set at `x*` "is computed by the sum rule 3.6 and Danskin 3.4 for `max gᵢ`". Target 3.4 (lines 648–653) assumes each `φ (·) t` "convex and differentiable" and returns the convex hull of gradients; in 5.2 the `gᵢ` are real convex functions and the conclusion is in subgradients `∂gᵢ x*`, so for `g₁ = |·|` on `ℝ` 3.4 says nothing. The route also passes from `∂(max gᵢ)(x*)` to the normal cone of `{max gᵢ ≤ 0}`, which is the statement `N_{h ≤ 0}(x*) = {t • u | t ≥ 0, u ∈ ∂h(x*)}` for `h(x*) = 0` under Slater's point; it is not a target either. The theorem itself is unaffected (it carries its three locators, and the sufficiency chain was recomputed).

The smallest repair is in the route and the *Needs:* line: replace "Danskin 3.4" by the max rule for finitely many finite convex functions, `∂(max gᵢ)(x) = convexHull (⋃ over active i of ∂gᵢ x)`, which follows from 3.1, 3.2 and 2.1 because the directional derivative of a finite maximum is the maximum of the active directional derivatives; and name the sublevel-set normal cone formula as a step, with its hypothesis (some point has `h < 0`). Both would sit naturally as prose targets in 3.4 and 3.7.

## N01 — `Suggested.lean` still ends with a section heading over `#check` lines and no declaration

The block "Suppliers named in the README" (line 675 on) is outside the namespace and has 75 `#check` lines; the supplier contracts of the README already carry the names.

## N02 — Two dependency lines of Layer 5 do not match its routes

"How to read the build" (line 275) and the Dependencies of Layer 5 (line 1159) say Layer 5 needs Layers 1 and 3, but the *Needs:* line of 5.1 lists 2.3 for `infConv`, so Layer 2 is needed as well. The *Needs:* line of 5.3 lists 1.3, while its route uses only 1.4 and the closedness of finitely generated cones from ScatteringDiagrams §1.1.

## Earlier findings

- R01 (the homogenization in the route of 1.3): repaired. The route now reads "Homogenize the inequalities, not the points" and uses `Ĉ = {(x, t) | t ≥ 0, ∀ i, ℓᵢ x ≤ t bᵢ}`. Recomputed: `s = [0, ∞)` gives the closed quadrant with `P = {0}`, `D = {1}`; `s = ∅` (`0 ≤ -1`) gives `Ĉ = V × {0}`, `P = ∅`, and `convexHull ∅ + hull D = ∅`.
- C01 (polar cones in 2.2): repaired. "the polar cone is `-ProperCone.innerDual K`, and the bipolar is `ProperCone.innerDual (ProperCone.innerDual K)`"; for `K = [0, ∞)` this gives `(-∞, 0]` and `[0, ∞)`.
- C02 (quadratic programs): repaired. "A convex quadratic program is an instance of 5.1 directly".
- C03 (what the first-order-methods roadmap owns): repaired. The list is now its 1.2, 1.3, 3.1, 3.2 and the methods of its Layers 2–4, which that roadmap has at its open head; Moreau envelopes and the other splitting methods are in the boundary list.
- C04 (bold targets without a Lean statement): repaired. The conjugate of a sum, the relative interior of a linear image and the steepness equivalence are stated (four new theorems), and the docstring says every bold headline is stated.
- C05 (finite transport duality): repaired. The summary says "beyond the finite transport problem" and the scope names `TauCeti.exists_cost_eq_finiteDualValue` as the transport instance of 5.3.
- N01: not repaired, stands as N01 above. N02, N03, N04: repaired (the `⊥` and continuity hypotheses of the two Checks; the *Needs:* lines of 4.1 and 6.1, with `RealRMK.rieszMeasure` now in the Mathlib contracts; "for differentiable data" at the Boyd–Vandenberghe locator of 5.2).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 support at frontier; nontrivial support | segment `[0,1]×{0}` at `(1/2,0)`, `(1,0)`; `C=∅`; `dim 0` | `y=(0,1)`: `0≤0`; `y=(1,0)`: `0<1`; frontiers empty, vacuous | true | none |
| 1.2 Minkowski–Carathéodory | `K=∅`; a point; square centre; triangle in `ℝ³` | `conv ∅=∅`; `finrank 0`, 1 point; 2 points; `finrank vectorSpan=2`, bound 3 | true | none |
| 1.3 polyhedra, statement and route | `s=∅`; `[0,∞)`; strip | `Ĉ=V×{0}`, `P=∅`, sum `∅`; quadrant, `P={0}`, `D={1}`; `D={e₁,-e₁}` | true | none |
| 1.4 Farkas | `A=(1 1)`, `b=±1`; `n` empty | `y=1`: `-1<0`; `y≥0` gives `b·y≥0`; both sides `b=0` | true | none |
| 2.1 indicator–support | `C=∅`; `C={-1,1}` | `σ=⊥`, conjugate `ℝ-⊥=⊤=δ_∅`; `σ=|y|`, conjugate `δ_[-1,1]` | true | none |
| 2.2 bipolar; cone sentence | `C=∅`; `[1,2]`; `K=[0,∞)` | `H` then `{0}`; `(-∞,1/2]` then `[0,2]`; polar `(-∞,0]`, bipolar `[0,∞)` | true | none |
| 2.3 `infConv` conjugate | `g≡⊤`, `sup a=⊤`; `f≡⊥,g≡⊤`; Huber at `0.3` | `⊥=⊤+⊥`; `⊤` vs `⊥` without hypothesis; `0.045` both | true under hypotheses | none |
| 2.4 slopes, support, sublevels | `exp`; `|·|`; `d=0`; `dim 0` | `0` for `d≤0`, `⊤` for `d>0`, both sides; `|d|`; `0`; both true | true | none |
| 2.5 perspective | `x²`; maximality at `t=0` along `(x+t x₀, t)`; convention `0·f=0` | `(1,0)↦⊤`; values `→ f^∞(x)`, so `g(x,0)≤f^∞(x)`; midpoint `1/4>0` | true | none |
| 3.1 limit; subgradient test | `|·|` at 0; `√|x|`; `f(x+d)=⊥` | `|d|`; inf `0`, limit `⊤`; both sides false | true | none |
| 3.2 max formula; relative interior | `|·|` at 0; `-√x` at 0; `δ_{[0,1]×{0}}` | `|d|`; `dirDeriv=⊥`, no subgradient; `{0}×ℝ` | true | none |
| 3.3 differentiability | `x²/2`; `|·|`; `x³`; `x²/2+δ_[0,∞)` at 0 | `{x}`; `[-1,1]`; `-3<0`; `toReal` differentiable but `∂=(-∞,0]`, interior needed | true | none |
| 3.4 Danskin | `φ=tx`, `K=[-1,1]`, `x=0,2` | hull `[-1,1]`; only `t=1`, `{1}` | true | none |
| 3.5 sum and chain rules | `|·|+δ_[0,∞)` at 0; `x∉dom` | `(-∞,1]` both sides; both empty | true | none |
| 3.6 sum, chain, image rule | disc and axis; `C=∅`; `L=0` | `ℝ²` vs `{0}×ℝ` unqualified; both `∅`; `ri{0}={0}=L(ri C)` | true | none |
| 3.7 polarity; intersections | `[0,1]` at 0; pinned definition | `posTangentConeAt=[0,∞)`, normal cone `(-∞,0]`; `tangentConeAt NNReal`, two-sided gives `ℝ` | true | none |
| 3.8 nearest points; Moreau | `C=[0,1]`, `x=1`, `u=3`; quadrant, `(1,-2)` | nearest to 4 is 1; `(1,0)+(0,-2)`, `⟪a,b⟫=0` | true | none |
| 4.1 strong convexity | `x²/2+|x|`; `δ_(0,1]+x²` | minimizer 0, `f≥x²/2`; inf 0 unattained | true | none |
| 4.2 smooth conjugate | `x²/2+|x|`; `|·|` | `f*(2)=1/2`, `f*(-3)=2`; `δ_[-1,1]` not finite | true | none |
| 4.3 steepness; duality; Legendre | `-log`; `x²/2+δ_[0,∞)`; `δ_(0,1)`; `dim 0`; domain `ℝⁿ` | `1/x→∞`; gradient `→0`, `∂f(0)≠∅`; smooth, gradient 0, closedness needed; both true; frontier empty | true | none |
| 4.4 monotone, cyclic, potential | rotation on a 4-cycle; `Γ=∅` | costs `0` vs `-4`; `∅` not maximal, not a subdifferential graph | true | none |
| 4.5 Mazur; separable dual | `U=∅`; `ℓ¹` | `G=∅`; dual nonseparable, no conflict | true | none |
| 4.6 Brøndsted–Rockafellar | `x²/2` at 0; `|·|` at 1 | `[-√(2ε),√(2ε)]`; `[1-ε,1]` | true | none |
| 5.1 Fenchel–Rockafellar | two parabolas; `δ_(-∞,0]`, `-√x`; `f≡⊤` | `1/4=1/4`; dual `1/(4u)`, sup `0` unattained; `⊤` both | true | N02 |
| 5.1 conjugate of a sum | value `⊤`; `f*`, `g*` at `⊥` | weak inequality gives inf `⊤`; `f*,g*≥ v x₀ - f x₀ > ⊥`, no `⊥+⊤` | true | none |
| 5.2 KKT; route | `f=x`, `g=1-x`; `g=x²`; `ι` empty; `g=|·|` in route | `λ=1`; `1+λ·0≠0`; `u∈-range Aᵀ`; 3.4 not applicable | theorem true; route incomplete | C01 |
| 5.2 sufficiency | chain for feasible `x` | `f x ≥ f x* - ∑λᵢ gᵢ x ≥ f x*`, `⟪x-x*, Aᵀy⟫=0` | true | none |
| 5.3 LP | `min x₁+2x₂`; unbounded `min -x₁`; `n` empty | `1=1`, slack `0`; dual `y≤-1, y≥0` infeasible; values `0` | true | N02 |
| 5.4 conic | rotated cone, `min 2y`, `x=0` | `K*`: `4ac≥b²`; `4(-t)0=0<4`, gap `0` vs `⊥`; `ri{b}={b}`, no surjectivity needed | true | none |
| 6.1 Choquet | `K=∅`; square centre | no `x : K`; two vertex measures | true | none |
| 6.2 simplices | square; `K=∅`; segment | upper bounds of height 2 differ by `±((0,1),0)`, no lub; vacuous both sides; `{0≤s≤t}` lattice | true | none |

- Source locators checked against the text: 15, all agreeing. BoydVandenberghe2004: §2.5.2 pp. 50–51 (line 2009), §3.2.6 p. 89 (line 3598), §5.2.4 p. 227 (line 9367), §5.5.2 p. 242 (line 10022), §5.5.3 pp. 243–244 (line 10071, differentiable data), Farkas p. 263 (line 10997, an equivalent transposed form), §5.9 p. 265 (line 11113), Example 5.12 p. 266 (line 11150). RockafellarWets1998: Prop 2.44(a) p. 66 (line 3641), Thm 3.26 p. 91 (line 4875), Cor 3.27 p. 92 (line 4921), Thm 3.52 p. 102 (line 5454), Thm 6.9 p. 203 (line 10293), Thm 11.5 p. 477 (line 25673), Thm 11.13 p. 483 (line 25987).
- Library declarations opened at the pin: `TauCeti.subdifferential` (`Subdifferential.lean`, 89), `TauCeti.fenchelConjugate` (`Conjugate.lean`, 119), `TauCeti.IsConvexPolyhedron` (`Polyhedron/Basic.lean`, 56), `tangentConeAt` and `posTangentConeAt` (`TangentCone/Defs.lean`, 66 and 132), `TauCeti.IsCyclicallyMonotone` (`Cost/CyclicalMonotonicity.lean`, 76), `isCyclicallyMonotone_pairingCost_iff_exists_fenchelConjugate` (`CTransform/Rockafellar.lean`, 87), `PointedCone.DualFG` (`DualFinite.lean`, 45), `intrinsicInterior_prod_eq` and the three `intrinsicInterior_image` (`Intrinsic.lean`, 220, 298, 330, 376; equivalences and isometries only, so the linear-image rule of 3.6 is new).
- Cross-roadmap citations resolved: on main, ScatteringDiagrams §1.1 (README line 601, `PointedCone.fg_iff_dualFG` in its `Suggested.lean`, line 101), VariationalMethods §1.2, §1.4, §2.1 (lines 299, 355, 415), OptimalTransport §2.3 (line 1542), OperatorAlgebraDynamics (line 3229), MarkovDecisionProcesses (line 49); at open heads, FirstOrderOptimization 1.2, 1.3, 3.1, 3.2 and LargeDeviations 5.3, which cites §4.3 of this roadmap for essential smoothness. All exist.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. Both supplier roadmaps are on main. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates at the pins with `sorry` as the only warning (48 theorems, 15 definitions). Elaborated types compared with the README: eight definitions drop section instances their bodies do not use; no theorem loses a hypothesis.
- One-tactic probe on a copy (`rfl`, `simp` with the roadmap's definitions unfolded, `infer_instance`): none of the 48 theorems closes.
- Duplication by object: support functions, infimal convolution, Farkas, Fenchel–Rockafellar, Karush–Kuhn–Tucker, Danskin, Brøndsted–Rockafellar, maximal monotone sets, Moreau's decomposition, conic and linear-programming duality and Choquet simplices were searched in all roadmaps on main and at the open heads and in the pinned libraries; no second owner.
- Automatic checks: one form rule flagged (N01), real.

Overlap check: read FirstOrderOptimization, LargeDeviations, BoundedConicHulls, OperatorMonotoneFunctionsAndMatrixMeans, OptimalTransport, VariationalMethods, ConvexLifting, and by object ScatteringDiagrams; indicator, normal cone and the indicator sum rule: VariationalMethods §2.1, cited; Minkowski–Weyl for cones: ScatteringDiagrams §1.1, cited; essential smoothness: this roadmap (LargeDeviations owns only the steep predicate and cites §4.3); projection inequality, proximal maps and real-valued strongly convex minimizers: FirstOrderOptimization, listed as not owned here; finite transport duality: OptimalTransport §2.3, listed as not owned here; nothing else shared.

Source independence: 13 passages compared with 2 sources (BoydVandenberghe2004, RockafellarWets1998), none shared; largest share Bauschke–Combettes, 21 of 88 citations, whose text and contents page could not be read; by the chapter numbers of its locators Layer 2 draws on its Chs. 9 and 13, Layer 3 on 6, 16, 17, Layer 4 on 11, 18, 20, 22, Layer 5 on 15, so no layer maps to one chapter and the order differs: independent as far as checked.

Research link: The headlines are Rockafellar's maximal and cyclic monotonicity theorems, Fenchel–Rockafellar duality, the Karush–Kuhn–Tucker theorem and Choquet–Meyer, used by OptimalTransport §5 for quadratic-cost potentials, OperatorAlgebraDynamics D7 for the KMS simplex and the open LargeDeviations roadmap for Gärtner–Ellis; rests on the README's "Downstream consumers" and Rockafellar–Wets 1998.

## Not verifiable

- Bauschke–Combettes 2017, Borwein–Lewis 2006, Hiriart-Urruty–Lemaréchal I and II 1993 (Springer): only paywalled copies; every locator into them is unchecked.
- Borwein–Vanderwerff 2010, Schneider 1993, Simon 2011 (Cambridge): no legal copy found; every locator into them is unchecked, including Simon p. 174 for the simplex definition of 6.2 and Borwein–Vanderwerff Thm 7.3.8(a) for the steepness equivalence of 4.3.
- Sampled targets with no readable locator: 1.2, 2.1, 2.2, 2.3, 3.1, 3.2, 3.4, 3.5, 4.1, 4.2, 4.5, 5.1; partly readable: 1.1, 5.2, 5.3. Their statements were checked by computation, as in the table.
- The licence and contents of the lean-CKMA repository named under "Prior formalization" were not opened.

Automatic checks set aside as false positives: none.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bauschke–Combettes has the largest share of locators (21 of 88) and could not be read, nor could six other books; wording and arrangement were compared with Boyd–Vandenberghe and Rockafellar–Wets only.
- **Licence.** The README ("Prior formalization", lines 1292–1302) says several targets are formalized in the author's public lean-CKMA repository; whether `Suggested.lean` is adapted from it, and that repository's licence, were not checked.
