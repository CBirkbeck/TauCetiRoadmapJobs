# Review of ConvexAnalysisAndDuality (pull request #2498 at 28da477)

**Verdict:** needs changes

**Summary.** Changes are needed: four findings. The polarity theorem of 3.7 is false as stated, because Mathlib's `tangentConeAt ℝ` admits negative scalars and is not the tangent cone of convex analysis (checked in Lean on `[0, 1] ⊆ ℝ`); a prose target of 2.3 has the wrong qualification and a false attainment claim; and two objects have a second owner (Minkowski–Weyl for cones is on main in ScatteringDiagrams §1.1, essential smoothness is also defined by the open LargeDeviations roadmap). There are four small corrections and four format notes, none blocking. Seven of the nine cited books could not be read legally, so most locators are unverified, and one question on the simplex definition of 6.2 is left open; two points are for the human reviewers.

## R01 (P1) — The tangent cone of 3.7 is not Mathlib's `tangentConeAt ℝ C x`, so all three conclusions of the polarity theorem fail

An implementer cannot prove `tangentConeAt_eq_and_normalCone_polar`, and every later use of "the tangent cone" (Conventions, line 152; 3.7, lines 678–681; `Suggested.lean`, lines 227–232) is about the wrong set. At the pin, `tangentConeAt R s x` is the set of cluster points of `(⊤ : Filter R) • 𝓝[(x + ·) ⁻¹' s] 0` (`Mathlib/Analysis/Calculus/TangentCone/Defs.lean`, line 66): the scalars range over all of `R`, negative ones included. The proof route's own description (line 688, "limits of `cₙ (yₙ - x)`") has no sign condition either.

Take `H = ℝ`, `C = [0, 1]`, `x = 0`. By `tangentConeAt_eq_univ` (`Mathlib/Analysis/Calculus/TangentCone/DimOne.lean`, line 31) the left side is all of `ℝ`, while `closure {t • (c - 0) | t > 0, c ∈ C} = [0, ∞)`; I checked the negation of the first conjunct for this instance in Lean at the pins (it compiles with no `sorry`). The other two conjuncts fail on the same instance: `normalCone` is `(-∞, 0]`, the polar of `ℝ` is `{0}`, and the polar of `(-∞, 0]` is `[0, ∞) ≠ ℝ`.

The smallest repair is to use Mathlib's one-sided cone `posTangentConeAt C x`, which is `tangentConeAt NNReal C x` (same file, line 132), in the Conventions, in 3.7 and in the Lean statement, and to add this instance as a negative-control Check ("`tangentConeAt ℝ [0, 1] 0 = ℝ`, but the tangent cone is `[0, ∞)`"). Rockafellar–Wets, Thm 6.9, pp. 203–204, which the target cites, has the one-sided cone.

## R02 (P2) — Minkowski–Weyl for cones (1.3) is already a target of ScatteringDiagrams §1.1 on main, under the same name

Two roadmaps would each build the same theorem. On main, `TauCetiRoadmap/ScatteringDiagrams/README.md`, lines 601–606, plans "a pointed cone in `V`, lineality allowed, is finitely generated … iff it is `PointedCone.DualFG`" and `TauCetiRoadmap/ScatteringDiagrams/Suggested.lean`, line 101, states `PointedCone.fg_iff_dualFG` for a finite-dimensional real space and the pairing with `Module.Dual ℝ V`. This README (line 306) declares `PointedCone.fg_iff_dualFG` again, for a perfect pairing over an ordered field, and neither the scope section nor 1.3 mentions the roadmap on main; the summary's "Neither has … the Minkowski–Weyl theorem" (line 43) reads as if nobody plans it.

A roadmap on main is the earlier owner. Either cite ScatteringDiagrams §1.1 for the real case and keep in 1.3 only what it lacks, saying so in one clause (an arbitrary ordered field and an arbitrary perfect pairing; the polyhedral form `isConvexPolyhedron_iff_convexHull_add_hull`, which is not on main, stays), or drop the cone statement and cite. In both cases list the deferral under "Not owned here" and give the kept variant a name that is not the one main already uses.

## R03 (P2) — The prose target of 2.3 on attainment and the conjugate of a sum has the wrong qualification, and its attainment claim is false

The third bullet of 2.3 (lines 435–439) says that if "`g` is continuous at a point of `x - dom f`", or `ri dom f ∩ (x - ri dom g)` is nonempty, "the infimum is attained", and that the conjugate of a sum is the infimal convolution of the conjugates. On `ℝ` take `f = exp`, `g = 0`, `x = 0`: `g` is continuous everywhere and `ri dom f ∩ (x - ri dom g) = ℝ`, yet `infConv f g 0 = inf_y exp y = 0` is attained at no `y`. The qualification written is the one for the sum `y ↦ f y + g (x - y)`; it says nothing about the conjugate of `f + g`, whose qualification is on `dom f ∩ dom g`.

What the cited theorem and 3.5–3.6 support is: if `g` is finite and continuous at a point of `dom f` (normed tier), or `ri dom f ∩ ri dom g` is nonempty (finite dimension), then `(f + g)* = infConv f* g*`, and the infimum defining `infConv f* g* u` is attained whenever the value is finite. Rewrite the bullet in that form.

## R04 (P2) — Essential smoothness has two owners: 4.3 here and 5.3 of the open LargeDeviations roadmap

Two open roadmaps each define `IsEssentiallySmooth` for `E → EReal`, with different bodies and no citation either way, so the library would get two predicates for one notion. Here (4.3, lines 810–813; `Suggested.lean`, line 450) the third clause is "no subgradient outside the interior of the domain". In pull request #2499, `TauCetiRoadmap/LargeDeviations/README.md`, lines 749–751, and its `Suggested.lean`, line 373, the third clause is steepness, `‖∇Λ‖ → ∞` at the frontier of the interior. The two agree for proper closed convex functions only; 4.3 says so in a subordinate clause (line 813) but does not make it a target.

Convex analysis is the natural owner. In this roadmap: make the equivalence of the two forms for proper closed convex functions a prose target of 4.3 with its locator, and name LargeDeviations 5.3 under "Downstream consumers" as using the steep form. LargeDeviations should then cite 4.3 rather than define the predicate again; that change belongs to its own pull request.

## C01 — Ekeland's variational principle is already in Tau Ceti, so 4.6 should cite it, not prove it "on the way"

The proof route of 4.6 (line 899) says "Ekeland's principle is proved on the way; it is not in Mathlib", and the boundary list repeats it (line 1170). True of Mathlib, but the pinned Tau Ceti has `LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist` (`TauCeti/Topology/MetricSpace/Ekeland.lean`, line 46), and uses it for Bishop–Phelps (`TauCeti/Analysis/Normed/Module/Dual/BishopPhelps.lean`). Add it to the *Needs:* line of 4.6 and to the Tau Ceti contracts, and change the two sentences.

## C02 — The scope section does not place three neighbouring targets of other roadmaps

A reader cannot tell how these differ from what is planned elsewhere; one clause each under "Not owned here" would do.

- Farkas (1.4): TensorProductCombinatorics §1.3 on main plans "the finite matrix Farkas certificate" among its rational polyhedron adapters (its README, lines 551–553). Say that 1.4 is the real matrix form and how the two relate.
- Strongly convex minimizers (4.1): the open FirstOrderOptimization roadmap, 1.3, proves existence, uniqueness and quadratic growth for continuous real-valued strongly convex functions; 4.1 is the extended-real closed case.
- Nearest points (3.8): the same roadmap, 3.1, owns the variational inequality for the projection onto a closed convex set; `mem_normalCone_iff_isMinOn` is that inequality in normal-cone form, and by the README's own proof route a rewriting of Mathlib's `norm_eq_iInf_iff_real_inner_le_zero`.

## C03 — The convexity hypotheses of `isMinOn_of_kkt` are not used

Sufficiency in 5.2 follows from the subgradient inequalities alone: for feasible `x`, `f x ≥ f x* + ⟪u, x - x*⟫ = f x* - ∑ λᵢ ⟪vᵢ, x - x*⟫ - ⟪y, A x - A x*⟫ ≥ f x* - ∑ λᵢ gᵢ x ≥ f x*`, using only `u ∈ ∂f x*`, `vᵢ ∈ ∂gᵢ x*`, `λᵢ gᵢ x* = 0` and feasibility. So `hf` and `hg` (`Suggested.lean`, line 501) can be dropped, or the README can say they are kept for symmetry with necessity.

## C04 — The proof route of 3.6 passes over the step that carries the theorem

The route (lines 667–672) restricts "to the affine spans; there the relative interiors are interiors". When `dom f` and `dom g` have different affine spans there is no common subspace in which both relative interiors are interiors (the indicators of the two coordinate axes of `ℝ²`). After restricting to `L = aff dom g`, the sum rule 3.5 gives subgradients of `f` restricted to `L`, and extending them to subgradients of `f` on the whole space is the inclusion `∂(f + δ_L) ⊆ ∂f + L^⊥` under `L ∩ ri dom f ≠ ∅`, which needs a proper-separation argument of its own; "adding any element of the orthogonal complement" does not supply it. Name that step, or route through the conjugate identity the bullet already cites.

## N01 — A pull-request number and a "when it lands" sentence in the README

Lines 1217–1220 name a Mathlib pull request by number and say what happens "when it lands"; a reader a year on cannot use either. State the fact timelessly (Mathlib has no subgradient of a real convex function at the pin; a bridge from `subdifferential (innerₗ E)` belongs to 3.1).

## N02 — `Suggested.lean` ends with a section heading over sixty `#check` lines and no declaration

The block "Suppliers named in the README" (line 626 on) sits outside the namespace and is a catalogue of names; the supplier contracts of the README already carry them.

## N03 — "CKMA" is used before it is introduced

It appears in 3.8 (line 701) and in the Layer 5 examples (line 1065), and is explained only under "Prior formalization" (line 1186).

## N04 — The Boyd–Vandenberghe locator for linear-programming duality

On printed p. 227 the paragraph on the dual of a linear program stands under §5.2.4, not §5.2.3 (5.3, line 1008); §5.2.3 on that page is the remark on dual attainment.

## Questions for the author

- 6.2 defines `IsChoquetSimplex` by greatest lower bounds only, with lower bounds taken inside `coneOver K`. The usual definition asks that the cone be a lattice in its own order, equivalently that `P - P` be a vector lattice; least upper bounds in `P` are least upper bounds in `P - P`, but a lower bound in `P - P` of two elements of `P` need not lie in `P`, so I could not derive the Riesz decomposition from the stated property (it needs `glb(a + q, b + q) = glb(a, b) + q`). Is the glb-only form the definition at Simon, p. 174, and is the equivalence with the lattice property proved there? Simon's text could not be read, and I found neither a proof nor a counterexample; the square and the disc do fail the stated property, as the Checks say.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 support at frontier points | segment `[0,1]×{0}` at `(1/2,0)`; `C = ∅`; `dim E = 0` | `y=(0,1)`: `⟪c,y⟫=0≤0`; frontier of `∅` and of a point space empty | true | none |
| 1.1 nontrivial support | `C={x}`; segment at `(1,0)` | `ri {x}={x}`, hypothesis false; `y=(1,0)`: `0<1` at `c=0` | true | none |
| 1.2 Minkowski–Carathéodory | point; square centre; triangle in `ℝ³` | `finrank vectorSpan`: 0, 2, 2; bounds 1, 3, 3; centre uses 2 | true | none |
| 1.3 cones | compared with main | ScatteringDiagrams `Suggested.lean` line 101: same name, real case | duplicate | R02 |
| 1.3 polyhedra | `s=∅`; half-line; strip | `∅ = convexHull ∅ + hull D`; half-line unbounded, not a hull of finite `P` | true | none |
| 1.4 Farkas | `A=(1 1)`, `b=±1`; `n` empty | `b=-1`: `y=1` gives `-1<0`; `n=∅`: both sides `b=0` | true | C02 |
| 2.1 indicator–support | `C=∅`; `C={-1,1}` | `σ_∅=⊥`, conjugate `ℝ-⊥=⊤=δ_∅`; `σ=|y|`, conjugate `δ_[-1,1]` | true | none |
| 2.2 bipolar | `C=∅`; `C=[1,2]` | polar `H`, bipolar `{0}`; polar `(-∞,1/2]`, bipolar `[0,2]` | true | none |
| 2.3 conjugate of `infConv` | `f≡⊥,g≡⊤`; `sup a=⊤, sup b=⊥` | without hypothesis `⊤` vs `⊥`; with it `sup(a_y+b_z)=⊥=⊤+⊥` | true | none |
| 2.3 prose bullet 3 | `f=exp`, `g=0`, `x=0` | infimum `0`, attained nowhere; qualification holds | false | R03 |
| 2.4 slopes and support | `exp`; `d=0`; empty domain | `0` for `d≤0`, `⊤` for `d>0` on both sides; `0`; `⊥` | true | none |
| 2.4 bounded sublevels | `exp`, `d=-1`; `dim E=0` | `f^∞(-1)=0`, `{exp≤1}=(-∞,0]` unbounded; both sides true | true | none |
| 2.5 perspective | `x²`; convention `0·f(x/0)=0` | `(1,0)`: `⊤`; wrong convention gives `0,0` and midpoint `1/4` | true | none |
| 3.1 limit; subgradient test | `|·|` at 0; `x²` at 1; `√|x|` | `|d|`; `2d`; infimum `0` but limit `⊤`; `t=1` quotient gives converse | true | none |
| 3.2 max formula | `|·|` at 0; `-√x` at 0 | `max{ud: |u|≤1}=|d|`; `dirDeriv=⊥`, no subgradient | true | none |
| 3.3 singleton; monotone gradient | `x²/2`; `|·|`; `x³` | `{x}`; `[-1,1]`; `(0-3)(0+1)=-3<0` | true | none |
| 3.4 Danskin | `φ=tx`, `K=[-1,1]`, `x=0,2` | hull of all `t` is `[-1,1]`; only `t=1` active, `{1}` | true | none |
| 3.5, 3.6 sum and chain rules | `|·|+δ_[0,∞)` at 0; disc and axis | `(-∞,1]` both sides; unqualified: `ℝ²` vs `{0}×ℝ` | true | C04 (route) |
| 3.7 polarity | `C=[0,1]⊆ℝ`, `x=0` | `tangentConeAt ℝ = ℝ`; closure of cone `[0,∞)`; `N=(-∞,0]` | false | R01 |
| 3.7 intersections | disc and axis at 0 (control) | `N_{C∩D}=ℝ²`, sum `{0}×ℝ`; relative interiors disjoint | true | none |
| 3.8 nearest points; Moreau | `C=[0,1]`, `x=1`, `u=3`; quadrant, `(1,-2)` | nearest to `4` is `1`; `a=(1,0)`, `b=(0,-2)`, `⟪a,b⟫=0` | true | C02 |
| 4.1 strong convexity | `x²/2+|x|`; `δ_(0,1]+x²` | minimizer `0`, `f≥x²/2`; not closed, infimum `0` unattained | true | C02 |
| 4.2 smooth conjugate | `x²/2+|x|`; `|·|` | `f*(2)=0.5`, `f*(-3)=2`, gradient 1-Lipschitz; `δ_[-1,1]` not finite | true | none |
| 4.3 Legendre | `-log`; `x²/2+δ_[0,∞)`; `dim E=0` | `f*(y)=-1-log(-y)`; `∂f(0)=(-∞,0]`; constants pass both sides | true | R04 |
| 4.4 monotone, cyclic | rotation `J`; `Γ=∅`; `H=0` | costs `0` vs `-4` on the 4-cycle; `∅` not maximal; `{(0,0)}` | true | none |
| 4.5 Mazur, separable dual | `U=∅`; `ℓ¹` | `G=∅`; dual `ℓ^∞` not separable, no contradiction | true | none |
| 4.6 Brøndsted–Rockafellar | `x²/2` at 0; `|·|` at 1 | `[-√(2ε),√(2ε)]`; `[1-ε,1]` from `x'=0` and `x'→±∞` | true | C01 |
| 5.1 Fenchel–Rockafellar | `x²/2`, `(x-1)²/2`; `δ_(-∞,0]`, `-√x` | `1/4=1/4`; dual `1/(4u)`, supremum `0` unattained | true | none |
| 5.2 KKT | `f=x`, `g=1-x`; `g=x²` | `λ=1`; `1+λ·0≠0`; sufficiency chain needs no convexity | true | C03 |
| 5.3 LP | `min x₁+2x₂`; `m` empty | `1=1`, slack `x₂·1=0`; `c≥0`, both values `0` | true | none |
| 5.4 conic | `K={xz≥y²}`, `min 2y`, `x=0` | primal `0`; `4·(-t)·0=0<4`, dual `⊥`; Slater fails | true | none |
| 6.1, 6.2 Choquet | `K=∅`; square; disc | vacuous; `r₁,r₂` lower bounds of `r₁+r₃`, `r₁+r₂`, no glb; ridge of maximal bounds | true as checked | question |

- Source locators checked against the text: 14 (Boyd–Vandenberghe §2.5.2 pp. 50–51, §3.2.6 p. 89, §5.2.3 p. 227, §5.5.2 p. 242, §5.5.3 p. 243, §5.8 p. 263, §5.9 p. 265, Example 5.12 p. 266; Rockafellar–Wets Thm 3.26 p. 91, Cor 3.27 p. 92, Thm 3.52 p. 102, Thm 6.9 p. 203, Thm 11.5 p. 477, Thm 11.13 p. 483); all agree except the section number in N04.
- Library declarations opened at the pin: `tangentConeAt` and `posTangentConeAt` (`Mathlib/Analysis/Calculus/TangentCone/Defs.lean`, 66 and 132), `tangentConeAt_eq_univ` (`.../TangentCone/DimOne.lean`, 31), `PointedCone.DualFG` (`Mathlib/Geometry/Convex/Cone/DualFinite.lean`, 45), `TauCeti.fenchelConjugate` (`Conjugate.lean`, 119), `TauCeti.subdifferential` (`Subdifferential.lean`, 89), `IsConvexPolyhedron` (`Polyhedron/Basic.lean`, 56), `IsCyclicallyMonotone`, `pairingCost`, the Fenchel–Moreau statements, Tau Ceti's Ekeland principle.
- Cross-roadmap citations resolved on main: VariationalMethods §1.2, §1.4, §2.1; BanachSpaceTheory B2, B7; OptimalTransport §5.1, §5.2, §5.4; OperatorAlgebraDynamics D7; MarkovDecisionProcesses Layer 5; RegretMinimizationAndEquilibria. All exist.
- Dependency check: `depcheck: 213 roadmaps, 2281 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only supplier roadmap, VariationalMethods, is on main. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates at the pins with `sorry` as the only warning (45 theorems, 15 definitions). `#check` types compared with the README: eight definitions drop unused section instances, no theorem loses a hypothesis.
- One-tactic probe: none of the 45 theorems closes with `rfl`, `simp` or `infer_instance`.
- Automatic checks: two form rules flagged (N01, N02), both real; none set aside.
- Overlap check: read FirstOrderOptimization, LargeDeviations, BoundedConicHulls, OperatorMonotoneFunctionsAndMatrixMeans, OptimalTransport, ConvexLifting, VariationalMethods, and by object ScatteringDiagrams, TensorProductCombinatorics, LocallyConvexDuality, CooperativeGames; Minkowski–Weyl for cones: ScatteringDiagrams §1.1 (R02); essential smoothness: unsettled between this roadmap and LargeDeviations (R04); indicator and normal cone: VariationalMethods §2.1, cited; projection inequality and real-valued strongly convex minimizers: FirstOrderOptimization (C02); rational Farkas certificate: TensorProductCombinatorics §1.3 (C02).

Source independence: 9 passages compared with 2 sources (Boyd–Vandenberghe, Rockafellar–Wets), none shared; largest share Borwein–Lewis, 18 of 77 page locators, whose text and contents page could not be read; by the chapter numbers of its locators Layer 1 draws on its Chs. 2, 4, 5, Layer 2 on 3, 4, Layer 3 on 2, 3, Layer 5 on 3, 5, so no layer maps to one chapter: independent as far as checked.

Research link: The headlines are the standard theorems (Rockafellar's maximal and cyclic monotonicity, Fenchel–Rockafellar duality, Choquet–Meyer) used by OptimalTransport §5 for quadratic-cost potentials, OperatorAlgebraDynamics D7 for the KMS simplex and first-order optimization theory; rests on the README's "Downstream consumers" and Rockafellar–Wets 1998.

## Not verifiable

- Bauschke–Combettes 2017, Borwein–Lewis 2006 (Springer): only a paywalled page; every locator into them is unchecked.
- Borwein–Vanderwerff 2010, Schneider 1993, Simon 2011 (Cambridge): no legal copy found; unchecked.
- Hiriart-Urruty–Lemaréchal I and II 1993: no legal copy found; unchecked.
- Sampled targets with no readable locator: 2.2, 2.3, 3.1, 3.3, 3.4, 4.1, 4.2, 4.5, 4.6; partly readable: 1.1, 1.3, 2.4, 3.7, 5.2, 5.4.
- The licence and contents of the lean-CKMA repository named under "Prior formalization" were not opened.

## Source issues

- none

## For the human reviewers

- **Not tested.** Borwein–Lewis has the largest share of locators (18 of 77) and could not be read, as could six other books; wording and arrangement were compared with Boyd–Vandenberghe and Rockafellar–Wets only.
- **Licence.** The README ("Prior formalization", lines 1185–1193) says several targets are formalized in the author's public lean-CKMA repository; whether `Suggested.lean` is adapted from it, and that repository's licence, were not checked.
