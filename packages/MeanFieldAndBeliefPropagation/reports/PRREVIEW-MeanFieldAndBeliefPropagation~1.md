# Review of MeanFieldAndBeliefPropagation (pull request #3005 at faee14f)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated result was recomputed at degenerate parameters and on the README's own numerical Checks (the gain identity, the two-spin saddle, the Curie–Weiss product-law value, the forest factorisation with zeros, the path example of belief propagation, the triangle counterexamples, both directions of the fixed-point correspondence at degree one), and the locators into Blei–Kucukelbir–McAuliffe, Wainwright–Jordan and the Mézard–Montanari draft were read at the text. There are no small corrections and two format notes, neither blocking. Left to the human reviewers: the Yedidia–Freeman–Weiss report could not be read from a classified host, and all five suppliers are still open pull requests.

## N01 — The scope section carries a pull-request number and link

In "Scope and ownership", the bullet on StatisticalLearningTheory (line 627) ends with "(pull request [#2515](…))". A reader a year from now gets a process reference where the roadmap's name and its section "Beyond this roadmap", both already in the sentence, suffice. Dropping the parenthesis is enough.

## N02 — The triangle Check of 3.1 uses other values than the example it cites

The Check of 3.1 (line 429) is headed "(Wainwright–Jordan, Example 4.1, pp. 79–81)" and then takes `β₁₂ = β₂₃ = 9/20`, `β₁₃ = 1/20` with a union-bound argument; the source's example has `0.4, 0.4, 0.1` and argues through the cycle inequalities (4.10). Both are correct (here `1/10 + 1/10 < 9/10`). A reader comparing with the source would be helped by "after Wainwright–Jordan, Example 4.1, with other values".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `elbo_caviUpdate_sub_elbo` (formula, gain, uniqueness) | `p = (1,1,1,4)`, `q` uniform, `v = 1`; `p ≡ 1`; `V` empty; `p = (1,1,1,0)` | expected logs `0, log 2`; update `(1/3, 2/3)`; gain `½log(3/2)+½log(3/4) = log 3 − (3/2)log 2 ≈ 0.059`; `p≡1`: `2 log 2`; `V=∅`: `log p(x)` both sides; non-positive `p`: derivative `log 2 − ½ > 0` | holds; positivity Check true | none |
| 1.1 general identity | arbitrary `q_v`, `c_a = expectedLog`, `S = Σ e^{c_a}` | `elbo = log S − KL(q_v‖q*) + Σ_{w≠v} H(q_w)`; at `q*`: `log S + R`; difference `KL(q_v‖q*)`, zero iff `q_v = q*` | holds | none |
| 1.2 `caviSweep_iterate` | `l = []`; two spins `p = exp(2σ₁σ₂)` from uniform; `t = ½` | `l=[]`: identity, fixed-point clause fails without `hl`; bound `2m₁m₂ + s(m₁)+s(m₂)`; `(t,t)`: `+t²`; `(t,−t)`: `−3t²`; at `½`: `0.238` and `−0.762` | holds; saddle Check true | none |
| 1.2 bound `≤ log Z` | finite sum | `Σ_{Q>0} Q log(p/(ZQ)) ≤ Σ_{Q>0}(p/Z − Q) ≤ 1 − 1 = 0` | holds | none |
| 1.3 `caviCoord_ising_eq_iff` | `J = 0`; two spins `J₁₂=J₂₁=−1`; `ι` empty; diagonal `J_ii` | update `∝ exp(−spin(b)·c_i)`, mean `(e^{−c}−e^{c})/(e^{−c}+e^{c}) = −tanh c`; `J=0`: `q(true) = σ(2h)`; two spins: `m₁ = tanh(2m₂)`; diagonal term constant (`spin² = 1`) | holds | none |
| 1.3 `tendsto_sSup_elbo_productLaw_cwEnergy_div` | `β = 0`; `β < 0`; `N = 0` | product law of mean `m`: `E[M²] = N²m²+N(1−m²)`, `elbo = N g(m) + β(1−m²)/2 ≥ N g(m) − |β|/2`; upper bound `log Z_N`; `β=0`: `N log(2cosh h)` both; `N=0` only one term of the sequence | holds for all real `β`, `h`, given CurieWeissModel 3.1 | none |
| 1 Examples: outer solutions are local maxima | `m = tanh 2m` | Hessian diag `−1/(1−m²)`, off-diag `2`; negative definite iff `1−m² < ½`; `tanh √3 ≈ 0.939 > 0.866` so `m* > √3/2`, `1−m*² < ¼` | true | none |
| 2.1 `margin_mul_prod_pow_eq_prod` | path with `p = ¼` on `x₂ = 0`; two isolated vertices `p ≡ 1`; triangle law `1+[x₁≠x₂]+2[x₂≠x₃]x₁`; one vertex; `V` empty | path at `000`: `¼·1 = ½·½`; at `x₂=1`: `0 = 0`; unnormalised: `1 ≠ 4`; triangle at `000`: `384/16⁴` vs `288/16⁴`; one vertex: `p = p_v`; empty: `1 = 1` | holds; three negative controls true | none |
| 2.1 induction step | leaf `v`, neighbour `u` in subtree `W` | `p_u·m_W = p_uv·m_{W∖v}`; `LHS_W = m_W·p_u·Π_{W'}p_w^{d'−1} = p_uv·Π_{e⊂W'}p_e` using `deg_{W'}u ≥ 1`; no division | route sound | none |
| 2.2 `belief_bpStep_iterate_eq_margin` | path `0−1−2`, `ψ=(1,2)`, potentials `[[2,1],[1,2]]`; one vertex; `φ₀₁ ≡ 0` | leaf messages `(4,5)`; middle→end after 2 steps `(18,24)`; belief at `0`: `(4,10)` then `(18,48)`; middle after one step `(16,50)`; `Z = 66`; edge belief `8+10+8+40 = 66`; zero model: all beliefs `0` | holds; `diam − 1` fails as claimed | none |
| 2.2 depth count | `h(u→v) = 1 + max dist(u,·)` on `T(u→v)` | farthest vertex at distance `k` from `u` is `k+1` from `v`, so `h ≤ diam`; leaf: `h = 1` | third clause holds | none |
| 3.1 `exists_margin_eq_of_isLocallyConsistent` | triangle `β = 9/20, 9/20, 1/20`; edge with `τ₁ = (1,0)`; empty `X v` | `P(x₁≠x₂) = P(x₂≠x₃) = 1/10`, `P(x₁≠x₃) = 9/10 > 1/5`; zero rows: `σ₁₂` itself is the law; empty state space excluded by `Σ τ = 1` | holds on trees; fails on the cycle as claimed | none |
| 3.2 `betheFreeEntropy_le_log_and_eq_iff` | one vertex; triangle, potentials `1/8`, `1`; `ψ = (1,0)`, `τ = (0,1)`; path example | one vertex: Gibbs inequality; triangle `Z = 2/512+6/8 = 193/256`, Bethe value `3log2 − 3log2 = 0 > log Z`; non-positive: `0 = log 1` at a non-margin; path: `log 66` | holds; tree and positivity needed as claimed | none |
| 3.2 definition against sources | WJ (4.15), MM (14.53) | `Σ_e H(σ_e) − Σ_v (deg−1)H(τ_v)` plus energy in all three; `½` over ordered pairs equals edge sum by symmetry of `edgePot` and `σ` | same object | none |
| 3.3 first direction | general graph, isolated vertex, triangle with unit potentials | `Σ_b b_uv(a,b) = c_vu·b_u(a)`; derivative: `Σ_{u∈N(v)}A_{v,u} = deg·logψ + (deg−1)Σ log m` equals vertex bracket up to constants; triangle: exact fixed point would need `c = 8c` | holds | none |
| 3.3 second direction | `deg v ≥ 2`; leaf `v`; single edge; isolated vertex | `deg ≥ 2`: system matrix `J − I` invertible; leaf: `λ_uv + log ψ_v` constant from `τ_v`-stationarity, message `bpStep m u v`, `c = 1`; leaf-to-hub fixed-point from marginalisation; single edge: `σ ∝ ψ_uψ_v·pot`; isolated: `τ ∝ ψ` | holds at every degree | none |
| 3.3 Checks | one vertex `ψ = (1,0)`; empty `X v`; tree | belief `(1,0)` not interior; empty sum `0 ≠ 1`; iterates of a fixed point are positive multiples, so 2.2 gives the margins | true | none |
| Copied definitions | eleven against supplier heads | `margin`, `CondIndep`, `Separates`, `IsGlobalMarkov`, `isWeight`, `elbo`, `spin`, `ising`, `cwEnergy`, `freeEnergy`, `pressure`: bodies identical | agree | none |

- Source locators checked against the text: 21 (Blei–Kucukelbir–McAuliffe 4, Wainwright–Jordan 12, Mézard–Montanari draft 5); the draft's printed pages 295, 296, 298, 299, 309 match the README.
- Library declarations opened at the pin: 23 Mathlib names of the supplier contracts (among them `integral_fintype` at `Mathlib/MeasureTheory/Integral/Bochner/SumMeasure.lean:206`, `haveLebesgueDecomposition_add` at `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:115`, `IsAcyclic.subsingleton_path` at `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean:191`, `dist_le_diam` at `Mathlib/Combinatorics/SimpleGraph/Diam.lean:271`, `range_dualMap_eq_dualAnnihilator_ker` at `Mathlib/LinearAlgebra/Dual/Lemmas.lean:824`) and `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log` at `TauCeti/InformationTheory/KullbackLeibler/Tilted.lean:72`; all exist with the stated content. Neither library has belief propagation, the Bethe free entropy or mean-field updates.
- Cross-roadmap citations resolved at the suppliers' open heads: 13 (GraphicalModelsAndConditionalIndependence 1.1, 2.1, 2.2, 2.3 with `Factorizes.isGlobalMarkov`; ImportanceSamplingAndVarianceReduction 1.1; EvidenceLowerBound 1.3; QuantumOptimization 1.1; CurieWeissModel 1.1, 1.2, 3.1 with `tendsto_log_partitionFunction_div` and `partitionFunction`). The two names the citation scan could not find are both declared in the supplier's Lean file.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with 9 `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, no sorry'd data.
- Signatures: the 39 elaborated types were compared with the README; the 9 theorems carry every hypothesis (measurable singletons in 1.1 and 1.2, nonempty state spaces in 3.3); the binders the definitions drop are not needed by their bodies. Nothing changed.
- One-tactic probe (`first | rfl | simp | infer_instance` on a scratch copy): 0 of 9 theorems close. No padding.
- Headline theorems of the README: 9 (1.1, 1.2, 1.3 twice, 2.1, 2.2, 3.1, 3.2, 3.3); all stated in `Suggested.lean`; the module docstring says none is unstatable.

Overlap check: read CurieWeissModel, GraphicalModelsAndConditionalIndependence, EvidenceLowerBound, GlauberDynamicsOfTheIsingModel, HopfieldNetworks (and HiddenMarkovModels, GibbsMeasuresAndTheIsingModel, StatisticalLearningTheory, which the scope names); nothing shared. The eleven copied definitions stay owned by their suppliers; GraphicalModelsAndConditionalIndependence places message passing outside its scope, CurieWeissModel computes the product-law value only in a Check, and EvidenceLowerBound does not state `elbo ≤ log Z` as a target.

Source independence: 13 passages compared with 3 sources, none shared; largest share Wainwright–Jordan, 14 of 22 locators in the layers; contents compared with Wainwright–Jordan (§2.5 exact inference, §4.1 sum-product and Bethe, §5.3 naive mean field): independent, the layers run mean field, trees, Bethe. The Yedidia–Freeman–Weiss report could not be read.

Research link: Layer 3 is the correspondence of Yedidia–Freeman–Weiss (2004 report, Theorem 2) between sum-product fixed points and Bethe stationary points, in the variational framework of Wainwright–Jordan (2008, Theorem 4.2) and Mézard–Montanari (2009, Proposition 14.6); Layers 1–2 are the mean-field and tree results those texts build on. Rests on the README's references and the two texts read.

## Not verifiable

- Yedidia–Freeman–Weiss, MERL TR2004-040, Theorem 2 (cited in 3.3): the report's host is in no licence class for the sources service, and no other legal copy was looked for. The statement of 3.3 was verified independently by computation and against Wainwright–Jordan, Theorem 4.2(a), and Mézard–Montanari, Proposition 14.6.
- Mézard–Montanari, the published Oxford edition: only the draft of 9 November 2007 on A. Montanari's page was read; the README cites that draft's numbering.

## Source issues

- **Error** in Wainwright–Jordan at Example 5.2, printed page 136: the source says every sequence of naive mean-field coordinate updates converges to a local optimum; it should be that limit points are coordinatewise fixed points, which can be saddles (two spins, uniform start); affects nothing.
- **Error** in Blei–Kucukelbir–McAuliffe at Section 2.4, printed pages 10–11: the source says coordinate ascent is guaranteed to reach a local optimum of the bound; it should be a fixed point of every coordinate update, possibly a saddle; affects nothing.
- **Misprint** in Mézard–Montanari (draft of 9 November 2007) at (14.54), printed page 309: the source indexes the normalisation sum of the Lagrangian by factor nodes while the summand depends on a variable node; it should be a sum over variable nodes; affects nothing.

## For the human reviewers

- **Licence.** The Yedidia–Freeman–Weiss report (cited once, in 3.3, README line 517) sits on merl.com, a host the sources service does not classify; its text was not read.
- **Licence.** Mézard–Montanari is cited by the page numbers of an unpublished draft of Part D on A. Montanari's own page (README lines 713–718), not of the published book.
- **Scope.** All five suppliers (GraphicalModelsAndConditionalIndependence, EvidenceLowerBound, ImportanceSamplingAndVarianceReduction, QuantumOptimization, CurieWeissModel) are open pull requests of the same author, none on main; the citations resolve at their present heads and this roadmap merges after them.
