# Review of OnlineLearningAndLittlestoneDimension (pull request #2665 at 479a1f3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of Layers 1 to 3 was recomputed on degenerate and small instances (empty class, empty instance type, one- and two-member classes, thresholds, `T = 0`, `u = 0`, `γ = 0`, labels outside `±1`) and none failed; the seven theorems of `Suggested.lean` match the README and none closes with one tactic. There is one small correction and one format note, neither blocking. The locators into Mohri, Rostamizadeh and Talwalkar could not be read and are left to the human reviewers together with the status of that copy.

## C01 — With `x t = 0` a round is an update round although the weight does not change

In the Conventions, the Perceptron bullet (line 67) says the weights "change exactly on the rounds with `y t ⟪w t, x t⟫ ≤ 0`". A reader who takes this literally identifies the update rounds with the rounds where `w (t + 1) ≠ w t`, and the two differ: for `x t = 0` the condition `0 ≤ 0` holds, the round belongs to `perceptronUpdates`, and `w (t + 1) = w t + y t • 0 = w t`. The roadmap's own Check in 3.2 (line 317) uses exactly this case and counts every round as an update, so the theorems count the rounds satisfying the condition, not the rounds where the weight moves. Writing "are updated by `w (t + 1) = w t + y t • x t` exactly on the rounds with …" makes the sentence agree with 3.1 and with that Check.

## N01 — The scope paragraph headed "Open roadmaps (not on main)" states a status that will date

In Scope and ownership (line 384) the two neighbouring roadmaps are introduced by where they stand today. The comparisons themselves are accurate at both heads (StatisticalLearningTheory 3.1 defines the VC dimension of a class as the same composite and lists the Littlestone dimension as outside its scope; OnlineConvexOptimization has online gradient descent in Layer 2 and online-to-batch conversion in Layer 5). Naming the two roadmaps without the status would keep the paragraph true after either merges.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsShatteredTree`, `littlestoneDim` | `H = ∅`; `X` empty; `{h}`; `{h, not ∘ h}`; all classifiers on `n` points; point indicators `d = 1, 2` | `∅`: depth 0 fails, sup = 0. `X` empty: no tree, 0. `{h}`: 0. Two members: 1 (depth 2 needs 4). All: `n = n`. Indicators: 0, 1 | holds | none |
| 1.1 truncation, split characterization, dimension-0 criterion | `d = 0` of the split; one-member class; `X` empty | Split at `d = 0`: depth 1 shattered iff some `x` has both parts nonempty. Inequality form fails for `{h}`: `0 ≤ 0` both parts, depth 1 not shattered | holds; Check true | none |
| 1.1 negative control (level-labelled trees) | repeated instance on two levels; thresholds | `x_i = x_j`, `y_i ≠ y_j` unrealizable, so levels are distinct points: value is VC dimension; thresholds 1 against `⊤` | holds | none |
| 1.2 `vcDimSet_le_littlestoneDim` | `H = ∅`; all classifiers on `n` points; thresholds | `0 ≤ 0`; `n ≤ n`; `1 ≤ ⊤`. Shattered `s` of size `d` gives level tree of depth `d` | holds | none |
| 1.2 `littlestoneDim_le_log_ncard` | `H = ∅`; `|H| = 2^n`; thresholds on `{0..N−1}`, `N = 1, 2, 3, 7`; infinite thresholds | `0 ≤ log 0 = 0`; `n ≤ n`; `N + 1` members, dimension `1, 1, 2, 3` = `⌊log₂ (N+1)⌋`; infinite: `⊤` against `0`, so finiteness needed | holds | none |
| 1.2 `vcDimSet` copy | compared with MathematicalStatisticsAsymptotic `Suggested.lean` line 502 | bodies identical character for character | holds | none |
| 1.3 thresholds | `{x}`; `x < z`; tree on `{0,1,2}`, `d = 2`; `d = 0, 1` | `{x}`: `a = 0`, `a = x+1`. Pair: needs `a ≤ x < z < a`. Paths FF, FT, TF, TT followed by `a = 0, 1, 2, 3` | holds | none |
| 2.1 `mistakes`, `IsRealizable`, `mistakeBound` | always-`true` learner on `[(0,F),(1,T),(2,F)]`; `[]`; `H = ∅`; `{h}` | 2 (by `decide`); 0; no realizable sequence, bound 0; 0. Unrestricted supremum: `⊤` | holds | none |
| 2.2 `mistakeBound_halvingLearner_le` | `H = ∅`; `{h, not ∘ h}` on one point; all classifiers on `n` points; infinite thresholds | `0 ≤ 0`; tie `2 ≤ 2·1` predicts `true`, 1 mistake = `log 2`; `n = log 2^n`; infinite: `ncard = 0`, mistake on `[(0,F)]`, `log 0 = 0` | holds | none |
| 2.2 halving step | prediction `true`, then `false` | `|V_true| ≥ |V|/2` gives `|V_false| ≤ |V|/2`; `|V| > 2|V_true|` gives `|V_true| < |V|/2` | holds | none |
| 2.3 `isLeast_mistakeBound` | `H = ∅`; `X` empty; `{fun _ ↦ false}`; thresholds; infinite class of finite dimension | `0 = 0`; `0 = 0`; correct ranking gives 0, ranking by dimension gives `⊤`; `⊤` for every learner; at a mistake both parts shatter depth `k`, so `V` shatters `k + 1` | holds | none |
| 3.1 perceptron sequence | `x = 1, y = 1`; `x = 1, y = (−1)^t`; `x = 0` | `w 1 = 1`, updates `{0}`; `w 2 = 0`, `w 3 = 1` (by `simp`); `x = 0`: update round, weight fixed | holds; C01 | wording |
| 3.2 `card_perceptronUpdates_le` | `T = 0`; `T = 1` unit case; `γ = 0`, `x = 0`; `y 0 = 2`; `u = 0` | `0 ≤ ·²`; `1 ≤ 1`; `T` updates against `0`; 1 against `1/4`; forces `T = 0`. `γ M ≤ ‖u‖ R √M`, `R ≥ 0` when `T ≥ 1` | holds | none |
| 3.3 `card_perceptronUpdates_le_hinge` | alternating labels, `T = 4`, `u = 1`; `u = 0`; margin 1; `T = 0`, `R < 0` | hinge `0, 2, 0, 2`, `4 ≤ 4 + 2 + 1`; `M ≤ M`; `R²‖u‖²`; `0 ≤ R²‖u‖²`. Quadratic step: `M ≤ b²/2 + L + (b/2)√(b² + 4L) ≤ L + b√L + b²` | holds | none |

- Source locators checked against the text: 15 into ShalevShwartzBenDavid2014 (Definitions 21.1, 21.4, 21.5; Theorem 21.3 with its tie rule; Lemmas 21.6, 21.7; Corollary 21.8; Examples 21.2 to 21.4; Theorem 21.9 and the end of its proof; §21.4; Theorem 21.16 and its derivation from Theorem 21.15), pages 288 to 304, all as cited.
- Library declarations opened at the pin: `real_inner_le_norm` (`Mathlib/Analysis/InnerProductSpace/Basic.lean` 475), `norm_add_sq_real` (411), `inner_sum` (164); `Set.ncard_le_ncard` (`Mathlib/Data/Set/Card.lean` 688), `Set.ncard_le_ncard_of_injOn` (941), `Set.ncard_union_eq` (1051); `Nat.le_log_of_pow_le` (`Mathlib/Data/Nat/Log.lean` 166); `Finset.Shatters`, `Finset.vcDim` (`Mathlib/Combinatorics/SetFamily/Shatter.lean` 40, 186).
- Duplication by object: no Littlestone dimension, mistake tree, mistake bound or perceptron sequence in the pinned Mathlib or Tau Ceti (the only hits are `Mathlib/Combinatorics/SetFamily/DualVC.lean`, on finite families, and the multilayer network specifications of `TauCeti/Geometry/Neuromanifold/MLP/Basic.lean`); none in a roadmap on main or at an open head.
- Cross-roadmap citations resolved: MathematicalStatisticsAsymptotic 3.5 (`vcDimSet`, Sauer–Shelah for traces), RegretMinimizationAndEquilibria 1.1 and 1.2, StatisticalLearningTheory 3.1 and its out-of-scope list, OnlineConvexOptimization Layers 2 and 5; all say what the README says.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier, MathematicalStatisticsAsymptotic, is on main.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, no sorry'd data. Elaborated signatures compared with the README statements: no binder lost, same generality.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `simp` with all definitions unfolded, `infer_instance`, `exact le_rfl`): none of the seven theorems closes. Headlines of the README: Littlestone's theorem, the two comparisons, the thresholds, the halving bound, Novikoff's bound, the hinge-loss bound; all stated.
- Pull request text read against the head: 7 theorems, 11 definitions, 1 abbreviation, suppliers and boundaries as described; nothing changes outside the folder. All automatic checks passed.

Overlap check: read StatisticalLearningTheory, OnlineConvexOptimization, MultiArmedBandits, ComparisonSortingAndSelection; nothing shared (StatisticalLearningTheory names its own `vcDim` of a class in its 3.1, this roadmap declares no such name and applies `vcDimSet` directly; the Littlestone dimension is outside that roadmap's scope by its own text).

Source independence: 20 passages compared with 1 source (ShalevShwartzBenDavid2014), none shared beyond formulas and standard names; largest share ShalevShwartzBenDavid2014, 15 of 20 locators; contents compared with ShalevShwartzBenDavid2014 Chapter 21: independent (Layers 1 and 2 both cut across its §21.1 in another order, its §21.2 and §21.3 have no layer). MohriRostamizadehTalwalkar2018 could not be read.

Research link: The headline targets are Littlestone's (1988) dimension, halving argument and optimal learner and Novikoff's (1962) perceptron bound, per the README's References; the README's scope names agnostic online learnability and the equivalence of finite Littlestone dimension with private PAC learnability as the theory built on them.

## Not verifiable

- MohriRostamizadehTalwalkar2018, equations (8.2), (8.3), (8.23), Theorems 8.1, 8.2, 8.8, pp. 179, 180, 192: the publisher's page refused the request and the copy linked from the first author's page is served from a file-hosting domain the sources service does not classify. Every statement carrying one of these locators also carries a verified locator into ShalevShwartzBenDavid2014, except the substitution `ρ = γ / ‖u‖` in 3.2, which was recomputed.
- The remark in the Conventions that part of the literature gives the empty class the value `−1`: no source is cited for it and none was found in the text read.

## Source issues

- **Gap** in ShalevShwartzBenDavid2014 at Lemma 21.7, printed page 293: the source says the optimal learner compares the dimensions of the two parts of the version space, without a value for an empty part; it should rank an empty part below every nonempty one, or a tie can send the prediction to the empty part forever; affects the proof.
- **Misprint** in ShalevShwartzBenDavid2014 at Definition 21.1, printed page 288: the source says the labels of the sequence are the target hypothesis applied to the labels; it should be the target hypothesis applied to the instances; affects nothing.
- **Misprint** in ShalevShwartzBenDavid2014 at §21.1.1, printed pages 290 and 291: the source says the label `0` leads to the right child in the informal description and to the left child in the formal one; it should use one direction throughout; affects nothing.
- **Error** in ShalevShwartzBenDavid2014 at Example 21.3, printed pages 291 and 292: the source says the class of point indicators on `d` points has dimension 1; it should require `d ≥ 2`, since for `d = 1` the class has one member and dimension 0; affects nothing.

## For the human reviewers

- **Licence.** MohriRostamizadehTalwalkar2018: the first author's page links the open-access copy (stated there as CC BY-NC-ND, MIT Press) on a file-hosting domain; the host could not be classified and the text was not read.
- **Scope.** All 20 locators of `TauCetiRoadmap/OnlineLearningAndLittlestoneDimension/README.md` point into two textbooks; the primary papers (Littlestone 1988, Novikoff 1962, Rosenblatt 1958) are attributed in the References without locators. Topic tag `math.ST`.
