# Review of ApproximateNashEquilibria (pull request #3132 at 2dcbeb3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of 1.1–3.2 was recomputed, including the size-free tolerance `ε²/8` of 2.1, the constants of 3.1 and 3.2 and all the counterexample Checks, and each holds as written in the README and in `Suggested.lean`. There are two small corrections (hypotheses of 1.2 that the statement does not need; a missing `ε > 0` in one sentence of the overview) and no format note, none blocking. Two cited texts could not be read legally, and the human reviewers are asked to look at one unidentified preprint and at the scope.

## C01 — The equivalence of 1.2 needs neither nonempty action sets nor decidable equality on them

In 1.2 (README line 141) the text says that `ι` and `κ` "are nonempty, as the instances of `IsNash` require", and `isApproxNash_zero_iff_isNash` (`Suggested.lean` line 121) inherits `[DecidableEq ι] [DecidableEq κ] [Nonempty ι] [Nonempty κ]` from its section. The elaborated `IsNash` takes only `[Fintype N] [DecidableEq N] [∀ i, Fintype (A i)]`: as a definition it keeps only the binders its body uses. The statement `IsApproxNash A B 0 x y ↔ IsNash (biUtility A B) (biProfile x y)` elaborates with `[Fintype ι] [Fintype κ]` alone (tried on a copy), and it is true there: if `ι` or `κ` is empty, both sides fail because the simplex is empty, and otherwise the proof route never uses the instances. A consumer with an empty action type, or without decidable equality, is asked for instances the result does not need.

The smallest change: state the theorem with `[Fintype ι] [Fintype κ]` only (the universe condition stays), and replace the clause by one saying that nonemptiness is needed only where `exists_isNash` is applied, in the second item of 3.2.

## C02 — The overview states the sampling theorem without `ε > 0`

The third paragraph of the overview (README lines 30–31) says that some `k`-uniform strategy loses at most `ε` on all the functions "as soon as `log |J| < 2 k ε²`". The Conventions let `ε` be any real number, and the last Check of 3.1 shows that the sentence fails for `ε = −1`, one function and `k = 1` (`0 < 2`, and the conclusion `x ⬝ᵥ f + 1 ≤ x ⬝ᵥ f` is false). Section 3.1 and the Lean statement carry `ε > 0`; adding "for `ε > 0`" to the sentence makes the overview agree with them.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 item 1 (well-supported ⇒ approximate), all payoffs | one column `A = [[1],[0]]`, `x = (9/10, 1/10)` | row regret `1 − 9/10 = 1/10`; row 2 worse by `1 > 1/10` | holds; converse fails as the Check says |
| 1.1 item 4 (affine change) | `A = 0`, `B = [[0,0],[0,1]]`, `x = (1/2,1/2)`, `y = (1,0)`; `c = 10`; `c = 0` | `x ᵥ* B = (0, 1/2)`, regret `1/2`; scaled `5`; `c = 0` gives regret `0` for all pairs | holds; `c > 0` needed |
| 1.1 negative `ε` | `x' = x`; `a' = a` on the support | `0 ≤ ε` fails in both definitions | no pair, as Conventions say |
| 1.2 `0`-approximate ⇔ `IsNash` | battle of the sexes; empty `ι` | mixed equilibrium `x = (2/3,1/3)`, `y = (1/3,2/3)` from `x₁ = 2x₂`, `2y₁ = y₂`; empty: both sides false | holds; C01 |
| 1.3 closeness | matching pennies; `B = [[0, t]]`; `ε = 0`; no equilibrium in `E` | regrets sum to `\|p − 1/2\| + \|q − 1/2\|`; `y = (1,0)` has regret `t`, distance `1`; `E = ∅` makes `K = S`, claim vacuous | holds; `δ` depends on game |
| 2.1 `ε²/8` ⇒ `ε`-well-supported | route recomputed; all `2×2` games over `{0,1/2,1}`, grid `1/4` (467991 triples); `A = [[0,31],[1,0]]` | deleted mass `≤ (ε²/8)/(ε/2) = ε/4`; shift `≤ 2m' ≤ ε/2`; 0 failures; counterexample: `A v = (31/32, 31/32)`, column regret `1/32` | holds; normalisation needed |
| 2.2 `1/2`-approximate | all `2×2` games over `{0,1/2,1}`; `A = 0`, `B = [[0,0],[0,1]]`; `A = [[0],[2]]` | 23328 admissible triples, maximal regret exactly `1/2`; unnormalised gain `1` | holds; bound attained |
| 3.1 sampling theorem | parameter chain; `k = 0`; `f = (4,0),(0,4)`; `ε = −1` | `(1/2)² = 1/4` per draw, `exp(−(kε)²/(2·k/4)) = exp(−2kε²)`; `k = 0`: `1/2 ≤ 0` false; loss `2 > 1` | holds; strictness, range, `ε > 0` needed; C02 |
| 3.2 near a Nash equilibrium | `J = ι ⊕ ι`, accuracy `ε/2`; `m = n = 2`; `A = 7·I` | `log(2m) < 2k(ε/2)²` ⇔ `2 log(2m) < kε²`; least `k`: 3, 4, 12 (`2 log 4 ≈ 2.7726`); `7\|2j − 13\|/13 ≥ 7/13 > 1/2` | holds |
| 3.2 unconditional | supplier `exists_isNash` at `N = Bool` | nonempty gives `max(m,n) ≥ 1`, `log 2 > 0`, so `k ≥ 1` | holds |
| 3.2 Check counts | pure and completely mixed equilibria | `6561·16/9 + 18² = 11988`; `256·4·9/16 + 4 = 580` | agree |
| Elaborated signatures | all 20 declarations against the README | casts: `↑(max (card ι) (card κ))`, `↑(card J)`, `↑k`; theorems keep their section instances | agree with the README |

- Source locators checked against the text: 6 (ChenDengTeng2006 lines 690–697, 704–722; LiptonYoung1994 lines 78, 138–139, 227–228, 234–260).
- Library declarations opened at the pin: 26 in Mathlib, among them `Mathlib/Probability/Moments/SubGaussian.lean` 772 and 851, `Mathlib/Probability/Independence/Basic.lean` 895, `Mathlib/MeasureTheory/Measure/Real.lean` 156, `Mathlib/Data/Fintype/BigOperators.lean` 46, `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean` 111; every cited name and file exists as cited.
- Duplication by object: no approximate, well-supported or `k`-uniform equilibrium, and no bimatrix game, in the pinned Mathlib or Tau Ceti (the Tau Ceti files named Nash are Nash functions).
- Cross-roadmap citations resolved on main: 6, all to RegretMinimizationAndEquilibria (Conventions `simplex`; 2.1 `Matrix.payoff`; 2.2; 3.1 `expectedUtility`, `IsNash`, `exists_isNash` and the battle-of-the-sexes Check); the three copied definitions agree with it character for character.
- Supplier order: the dependency check reports 0 problems (122 roadmaps, 1385 edges); the only roadmap supplier is on main; no change outside the folder.
- Automatic checks: all passed. Elaboration: `sorry` is the only warning. One-tactic probe (`rfl`, `simp` with the definitions unfolded, `infer_instance`): none of the 8 theorems closes.
- Headline theorems: 1.1, 1.2, 1.3, 2.1, 2.2, 3.1 and both items of 3.2 are all stated in `Suggested.lean`; none is padding.
- Pull request text: title and description agree with the head (a new roadmap, 8 theorems, 12 declarations of data, one supplier).

Overlap check: read FictitiousPlay, PotentialGamesAndPriceOfAnarchy, RegretMinimizationAndEquilibria; nothing shared (FictitiousPlay writes exact bimatrix equilibria unfolded and excludes approximate equilibria; RegretMinimizationAndEquilibria owns `simplex`, `Matrix.payoff`, `IsNash` and `exists_isNash`, cited here).

Source independence: 8 passages compared with 2 sources, none shared beyond what the mathematics forces; largest share ChenDengTeng2006, 4 of 8 locators; contents compared with ChenDengTeng2006: independent (only its §4.1.1 is used, and no layer follows its sections). DaskalakisMehtaPapadimitriou2006 could not be read, so the wording of 2.2 was not compared with it.

Research link: Layer 1 and 2.1 are the equivalence of approximate and well-supported equilibria that Chen, Deng and Teng (2006) use for hardness of approximation; 2.2 is Daskalakis, Mehta and Papadimitriou (2006); Layer 3 is the sampling method of Lipton and Young (1994) and Lipton, Markakis and Mehta (2003). Rests on the README's references and the two texts read.

## Not verifiable

- Daskalakis, Mehta and Papadimitriou, §2 and §3 Theorem 1 (cited in 1.1 and 2.2): the published version is paywalled and no author's page was reached; the statements were checked as mathematics, the locators were not.
- Lipton, Markakis and Mehta (2003), credited in 3.2 without a locator: the publisher's page refused access.
- The instance count 28840 in the first Check of 3.1 was not recomputed; the statement it tests was checked through its proof.

## Source issues

- **Gap** in ChenDengTeng2006 at Lemma 5, part 1, p. 18: the source says an `ε²/(8n)`-approximate equilibrium yields an `ε`-well-supported one, with no bound on the entries in the statement; it should be stated for entries in `[0, 1]`, as its proof assumes; affects a stated result.
- **Gap** in LiptonYoung1994 at Theorem 2, p. 3: the source says the bound holds for `k ≥ ln(c)/(2ε²)`, while its proof takes `k` strictly larger; it should be the strict inequality, since one column admits `k = 0`, where no `k`-uniform strategy exists; affects a stated result.

## For the human reviewers

- **Licence.** The Scope section (README lines 471–473) names a 2026 preprint by "Google Research, cogentic_research_papers" as context; it has no entry in the References, was not located, and no statement rests on it.
- **Scope.** The sources are theoretical computer science papers (arXiv cs, WINE, STOC, ACM EC); the README states existence theorems only and proves all of them itself with elementary arguments and Hoeffding's inequality.
- **Not tested.** DaskalakisMehtaPapadimitriou2006 and Lipton–Markakis–Mehta (2003) could not be read legally; wording and locators of 2.2 and the attribution in 3.2 were not compared with them.
