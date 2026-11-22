# Review of ThresholdFunctionsAndMargins (pull request #2992 at d077c99)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false. Every theorem was recomputed at its degenerate parameters, every source locator was read in the text, and every supplier and library citation resolves where it is cited. There are no small corrections and two format notes, neither blocking. One point is left for the human reviewers: the margin theorems of Layer 4 are proved in the README and cite no published source.

## N01 — The scope section names another roadmap by a pull-request number

In "Scope and ownership" (`TauCetiRoadmap/ThresholdFunctionsAndMargins/README.md`, lines 438–443) the sentence on Cover's theorem links pull request #2515 and says "by another contributor". The README is meant to read the same after that pull request merges; "the roadmap StatisticalLearningTheory lists network capacity under 'Beyond this roadmap'" says the same without the number or the authorship.

## N02 — The margin theorems 4.1 and 4.2 carry no locator

4.1 and 4.2 are marked "Proved here" with complete routes, and both are classical (the maximum margin as the distance to a convex hull, and the affine margin as half the distance between the hulls). A reader who wants to compare the normalisation (closed unit ball, the factor `1/2`) with the literature has nothing to open. A locator into a standard text on convex analysis or support vector machines, beside "Proved here", would help.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 neuron, `IsLinearThreshold` | `n = 0, 2, 3`; output zero on the cube | `neuronOutput θ x = (W *ᵥ x + b) 0` closes by `simp`; script: 2, 4, 14, 104 functions for `n = 0..3`; bias `-1` and `-3/2` both give AND | sound | none |
| 1.2 `SignRepresents`, `thresholdDegree` | zero polynomial; constant `f`; `2p − 1` | zero polynomial fails strictness (`0 < 0`); constants: degree `0`; set nonempty, `≤ n` | sound | none |
| 1.3 LTF iff threshold degree ≤ 1 | `n = 0`; XOR; output with zeros | `n = 0`: both sides true; XOR: `p(10)+p(01) = p(00)+p(11)`, both sides false; `ℓ − ε` keeps signs | sound | none |
| 2.1 symmetric functions | `n = 0`; `n = 4`, `F = TFFTT`; `c = 0`; `F` beyond `n` | `n = 0`: `0 = 0`; values `5/4, −3/4, −3/4, 5/4, 21/4`, 2 changes; `t_r < n` so sign at `n` is `σ` | sound | none |
| 2.2 parity | `n = 0, 1, 2` | degrees `0, 1, 2`; `−(k−1/2)(k−3/2)` = `−3/4, 1/4, −3/4`; all terms `(−1)^|x| p` negative, sum `0` | sound | none |
| 3.1 `walsh`, `walshCoeff` | compared with supplier text | identical bodies and `variable` lines to BooleanFunctionAnalysis 1.1, 1.2 at its head | sound | none |
| 3.2 Chow, degree `k` | `ι` empty; `n = 3, k = 2`; `f` not `±1` | empty: `g(pt) = f(pt)`; script: 254 sign patterns; `f − g = ±2χ` forces parity pair; `(1/2, 3/2)` vs `1`: averages `1 = 1` | sound | none |
| 3.3 Chow for the neuron | `n ≤ 3`, zero outputs; `walsh {0,1}` | script: each of 2, 4, 14, 104 has unique Chow vector among `2^(2^n)`; Maj₃: `0; 1/2, 1/2, 1/2`; parity pair shares zeros | sound | none |
| 4.1 max margin = distance to hull | `((1,0),(0,1))`; `(1,−1)` in `ℝ`; `((1,0),(−1,0))`; `E = 0` | `γ⋆² = 1/2`, margin `1/√2`; ball `0` vs sphere `−1`; margin `−|w₁|`, non-unique at `γ⋆ = 0`; trivial `E`: `0 = 0` | sound | none |
| 4.2 affine margin = half hull distance | `P = {1,2}, N = {−1}`; one label; `P = {−1,1}, N = {0}` | `δ = 2`, margins `1, 2, 1`; one label: unbounded in `b`; `w = ±1`: `min(b−1, −b) ≤ −1/2`, max `0` | sound | none |
| 4.3 perceptron bound | two unit vectors; three points; label `3`; `γ⋆ = 0` | bound `2`, 2 updates; `R² = 5`, `γ⋆² = 2`, bound `5/2`, ≤ 1 update; bound `1/9` vs 1 update; `(R/0)² = 0` vs 1 update | sound | none |
| N01, N02 | README lines 438–443; 4.1, 4.2 | pull-request link present; no locator beside "Proved here" | form only | notes |

- Source locators checked against the text: 13 of 13 (BunThaler2022 lines 264–269, 461–471, 1154–1155, 1240–1248, 1327–1329; ODonnell2021 lines 4436–4439, 4454–4460, 4470–4482, 4548–4551, 5485).
- Library declarations opened at the pin: 17 in Mathlib (among them `Metric.le_infDist`, `Topology/MetricSpace/HausdorffDistance.lean:510`; `norm_eq_iInf_iff_real_inner_le_zero`, `Analysis/InnerProductSpace/Projection/Minimal.lean:145`; `convexHull_sub`, `Analysis/Convex/Combination.lean:490`; `Polynomial.card_le_degree_of_subset_roots`, `Algebra/Polynomial/Roots.lean:150`) and 5 in Tau Ceti (`MLPSpec`, `realize`, `realize_depth_one` at `Geometry/Neuromanifold/MLP/Basic.lean:56, 171, 194`, `linear` at `:234`, `dense` at `Geometry/Neuromanifold/Dense.lean:84`). All exist as cited.
- Cross-roadmap citations resolved at the suppliers' open heads: 12 (DecisionTreeComplexity 2.1, 4.1 with `boolVec`, `existsUnique_represents`, `exists_natDegree_le_eval_mul_choose`; BooleanFunctionAnalysis 1.1, 1.2, 1.3, 1.5; OnlineLearningAndLittlestoneDimension 2.2, 3.1, 3.2, 3.3; MathematicalStatisticsAsymptotic 3.5 on main). The five copied definitions agree character for character with their owners.
- Duplication: no threshold degree, Chow theorem, perceptron or margin-to-hull statement in the pinned Mathlib or Tau Ceti, nor in another roadmap on main or open.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (7 declarations); `#check @name` on the 7 theorems agrees with the README statements, no binder lost; none of the 7 closes under `simp`, `rfl`.
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. Automatic checks: all passed. No change outside the roadmap folder.
- Headline theorems (symmetric threshold degree with parity as its case, the neuron's functions, Chow in degree `k` and for the neuron, the two margin theorems, the perceptron bound): all stated; nothing is padding.
- Pull-request text read against the head: 13 definitions and 7 theorems as stated, three suppliers as listed; no sentence contradicted.

Overlap check: read BooleanFunctionAnalysis, DecisionTreeComplexity, OnlineLearningAndLittlestoneDimension, RobustnessCertificates, UniversalApproximation (and StatisticalLearningTheory for the capacity note); `boolVec` is owned by DecisionTreeComplexity, `walsh` and `walshCoeff` by BooleanFunctionAnalysis, the perceptron and Novikoff's bound by OnlineLearningAndLittlestoneDimension, each copied or cited here as such; nothing else shared.

Source independence: 11 passages compared with 2 sources, none shared; largest share BunThaler2022, 7 of 13 locators; contents compared with BunThaler2022 (§2.1, §3.1, §5.2 against Layers 1 and 2): independent.

Research link: Layers 1–2 state the threshold-degree results of Minsky–Papert (1969) as surveyed by Bun–Thaler (2022), used there for learning and circuit lower bounds; Layer 3 is Chow's theorem and Bruck's extension as in O'Donnell (2021), ch. 5; Layer 4 refines Novikoff's perceptron bound. Rests on the two sources read.

## Not verifiable

- The Check of 2.1 that an explicit dual weighting exists for every `F` and `n ≤ 5` was not rerun; its existence follows from divided differences at `c + 1` alternating weights, which was checked by hand.

## Source issues

- **Misprint** in BunThaler2022 at §3.1, sign argument after eq. (6), p. 12: the source says the polynomial is positive for weights from `t_(k−2) + 1` up to `t_k`; it should be up to `t_(k−1)`; affects nothing.
- **Misprint** in BunThaler2022 at §5.2, p. 28: the source says the symmetrized polynomial takes different values at `i − 1` and `i` for `k` values of `i`; it should be values of opposite sign; affects the proof.
- **Error** in BunThaler2022 at §3.1, p. 12 (remark after eq. (6)): the source says the interpolating polynomial is never below `1/2` in absolute value on the cube; it should be `2^(−k)` (two adjacent sign changes give `1/4`); affects nothing.

## For the human reviewers

- **Scope.** Layer 4 (4.1–4.3, three of the seven headline theorems) is marked "Proved here" and cites no published source; Layers 1–3 rest on Bun–Thaler (2022) and O'Donnell (2021), both read.
- **Licence.** Bun–Thaler was read in the authors' version on J. Thaler's own page, not in the published Foundations and Trends issue; page numbers are that version's.
