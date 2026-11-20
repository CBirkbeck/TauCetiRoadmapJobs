# Review of KakutaniFixedPointAndContinuousGames (pull request #2761 at 5bf7ab1)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, every Check and every worked example was recomputed and holds at the stated generality (the closed graph theorem and Berge's theorem without a metric, the intersection theorems in every real normed space), all eighteen source locators agree with the texts, and every named library declaration exists at the pins with the statement the README gives it. There is one small correction and one format note, neither blocking. Two questions are left to the human reviewers: the sources are lecture notes, one of them marked for course use only.

## C01 — The Check of 4.3 on Fan's lemma states its convexity hypothesis on a set that is never convex

In the first Check of 4.3 (line 307) the hypothesis reads "with `{x | (x, y) ∉ D}` convex for each `y`". With `D ⊆ K × K` and `x` ranging over the whole space, that set contains everything outside `K` and omits the point `y` (the diagonal lies in `D`), so it is the complement of a nonempty bounded set and is not convex in any space of positive dimension: read literally, the Check has no instance. The source restricts the set to `K` (Border, *Fixed point theory*, Corollary 4.4, p. 8), and the verification that the indicator is quasiconcave on `K` uses exactly that set. Writing `{x ∈ K | (x, y) ∉ D}` makes the Check say what is meant.

## N01 — Three phrases date the text

"(a roadmap not on main)" and "(an open roadmap, not on main)" in the scope section (lines 423 and 427) and "they were not consulted" in the references (line 495) describe the state of the repository and of the drafting; a reader a year from now is better served by the roadmap names alone and by "cited without locator".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 closed graph ⇔ uhc + closed values (`isClosed_graph_iff_upperHemicontinuous`) | `φ 0={0}, φ x={1/x}` on `ℝ`; cofinite `ℕ`; `φ 0={0}`, else `∅`; `φ 0=[0,1]`, else `{0}` | `(−1,1)⊇φ 0`, `1/x∉(−1,1)` for `0<|x|<1`; `(1/n,n)→(0,1)`, `1∉φ 0`; graph `{(0,0)}` closed, uhc; lhc fails on `(1/2,2)` | iff holds both ways; each hypothesis needed | none |
| 1.1 metric versus topological Check | quadrant correspondence, `G` of Border Ex. 13 | `G` open at `(0,b)`: needs `b+r<1/r`; `(a,δ/2)∉G` for `a<−2/δ` since `1/|a|<δ/2` | true | none |
| 2.1 `argmaxCorr` | `[0,1]`, `f=xy`; `[0,1)`, `f=y`; `φ x=∅` | `{1}`, `{0}`, `[0,1]` for `x>0, <0, =0`; `∅`; `∅` | definition is the maximizer set; wrong variant (sup not attained) excluded by second Check | none |
| 2.2 Berge (`berge_maximum_theorem`) | `φ 0=[0,1]`, else `{0}`; `φ 0={0}`, else `[0,1]`; constant `[0,1]`, `f=xy`; budget set | `V 0=1`, `V x=0`; `V 0=0`, `V x=1`; `V=max(x,0)`, argmax `{0}→[0,1]→{1}`; `V p=min(1,1/p)` | proof re-derived with no separation axiom; both hemicontinuities needed | none |
| 3.1 Kakutani (`kakutani_fixedPoint`) | `[1−x,1]`; two-valued jump at `1/2`; step at `1/2`; circle `x↦−x`; `ℝ`, `x+1`; `K=∅`; `dim E=0`; `[0,1−y]×{x}` | fixed set `[1/2,1]`; none; none; none; none; none; `K={0}`, `φ 0={0}` fixed; `(x,x)`, `x≤1/2` | true; every hypothesis separated | none |
| 4.1 KKM (`knaster_kuratowski_mazurkiewicz`) | `F 0=[0,1/2)`, `F 1=[1/2,1]`; `ι` empty; `[0,2/3]`, `[1/3,1]`; `A=∅`; dependent points | cover holds, intersection `∅`; hull `∅`; `[1/3,2/3]`; `∅⊆∅`; route never uses independence | true in any normed space | none |
| 4.2 Fan (`fan_kkm`) | `X=ℕ`, `F n=[n,∞)`; `t={x}`; `X=∅` | hull `[min t,max t]⊆F(min t)`, `⋂=∅`; `x∈F x`; excluded by the compact-value hypothesis | true | none |
| 4.3 Ky Fan (`kyFan_minimax_inequality`) | `|x−y|`; `(y−Ty)²−(x−Ty)²`; `x−y` on `[0,∞)`; indicator of `D`; `‖y−hy‖²−‖x−hy‖²` | superlevel at `1/4` has `0,1` not `1/2`; `f 1 (1/2)=1/4`, right limit `−3/4`; `f(y+1,y)=1`; superlevels `K`, `{x∈K|(x,y)∉D}`, `∅`; at `x=hy`: `‖y−hy‖²≤0` | true; C01 on the indicator Check's wording | C01 |
| 5.1 `IsPureNashEquilibrium` | matching pennies; no players; Cournot | four profiles each have a gaining deviation; unique profile is one; replies `(1−s_j)/2`, fixed at `1/3`, payoff `1/3·1/3=1/9` | definition correct, maximizing convention pinned | none |
| 5.2 Debreu–Glicksberg–Fan (`exists_isPureNashEquilibrium`) | `s₁s₂−sᵢ²/2`; `∓(s₁−s₂)²`; `u=s` on `[0,1)`, `u 1=0`; `[0,1)`; pennies; `ι` empty | reply `t`, all `(t,t)`; replies `t` and `1`/`0`/`{0,1}`, none; superlevels `[r,1)` convex, no max; no max; `{0,1}` superlevel not convex; trivial profile | true; route via 2.2, 1.1, 3.1 closes; fixed point of `B` is an equilibrium since `update s i (s i)=s` | none |
| Convention: quasiconcave carrier is convex | `x³`; `min(f a,f b)` level | monotone hence quasiconcave, `(x³)''` changes sign; level set contains `a,b` | true (`QuasiconcaveOn.convex`, `Mathlib/Analysis/Convex/Quasiconvex.lean:86`) | none |
| One-tactic probe, 7 theorems | `rfl`, `simp`, `simp_all`, `infer_instance`, `exact?` | none closes any of the seven | no padding | none |

- Source locators checked against the text: 18 of 18 (BorderCorrespondences: Definition 14, the conventions on p. 6, Examples 13 and 18, Proposition 19, Corollary 22, Propositions 33 and 34, the Berge theorem; BorderFixPt: 2.1, 2.3, 2.5, 4.4, §6.1; OzdaglarLec5 slides 14 and 20–24; OzdaglarLec6Notes §4 and Example 3).
- Library declarations opened at the pins: 24 (Mathlib `Topology/Semicontinuity/Defs.lean:281,629,653,671`, `Hemicontinuity.lean:53,348,385`, `Topology/Compactness/Compact.lean:293,746,1172`, `Topology/Order/Compact.lean:273,439,504`, `PartitionOfUnity.lean:626`, `Analysis/Convex/Caratheodory.lean:106`, `Hull.lean:68`, `Topology.lean:367`, `Basic.lean:108`, `Quasiconvex.lean:54,86`, `Topology/Sion.lean:545`, `Topology/Sequences.lean:288`; Tau Ceti `AlgebraicTopology/Singular/BrouwerFixedPoint.lean:140,159`); all exist with the statements the README gives.
- Cross-roadmap citations resolved: 3 (RegretMinimizationAndEquilibria 3.1 `exists_isNash` on main; PotentialGamesAndPriceOfAnarchy 1.1 at its open head; ConvexAnalysisAndDuality's out-of-scope list at its open head, line 1268).
- Duplication by object: no closed graph theorem for correspondences, maximum theorem beyond `IsCompact.continuous_sSup`, Kakutani, KKM, Ky Fan inequality or pure equilibrium existence in the pinned Mathlib or Tau Ceti, on main, or at any open head.
- Overlap check: read RegretMinimizationAndEquilibria (main and its open revision), PotentialGamesAndPriceOfAnarchy, CooperativeGames; nothing shared (mixed equilibria of finite games stay with RegretMinimizationAndEquilibria, potential-game pure equilibria with PotentialGamesAndPriceOfAnarchy; this roadmap owns the continuous case).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; suppliers are Mathlib and Tau Ceti only; no change outside the folder.
- Elaboration of `TauCetiRoadmap/KakutaniFixedPointAndContinuousGames/Suggested.lean`: seven `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, no sorried data. The nine elaborated types were compared with the README statements and agree; the definition of a pure equilibrium keeps only `DecidableEq`, which is all it uses.
- Automatic checks: all passed. Headline theorems (Kakutani, Berge, Debreu–Glicksberg–Fan, Ky Fan, with KKM, Fan's form and the closed graph theorem) are all stated.

Source independence: 24 passages compared with 4 sources (18 locators and 6 further routes and docstrings), none shared beyond runs of four words; largest share BorderCorrespondences, 7 of 16 locator sites; contents compared with BorderCorrespondences: independent (only Layers 1 and 2 have counterparts there, Layers 3 to 5 none).

Research link: The headline targets are Kakutani (1941), Knaster–Kuratowski–Mazurkiewicz (1929), Berge (1959), Fan (1961, 1972) and Debreu, Glicksberg and Fan (1952), as the README's references give them; RegretMinimizationAndEquilibria's existence of mixed equilibria is the simplex case of 5.2. Rests on the README.

## Not verifiable

- The original papers (Knaster–Kuratowski–Mazurkiewicz, Kakutani, Debreu, Glicksberg, Fan, Berge): the README gives them no locator, so none was opened; the attributions were read only as Border and Ozdaglar report them.
- The author's exact-rational scripts were not rerun; every value they are quoted for was recomputed by hand.

## Source issues

- **Gap** in OzdaglarLec5 at slide 20: the source asks for continuity of each payoff separately in the own strategy and in the others'; it should be joint continuity in the profile, as OzdaglarLec6Notes p. 6-7 restates; affects nothing.
- **Gap** in BorderFixPt at Theorem 4.2 and Corollary 4.4, p. 8: the source takes `K` compact and convex and concludes existence; it should also take `K` nonempty; affects nothing.
- **Misprint** in BorderCorrespondences at Example 13, p. 5: the source says to let `n = 2`; it should be `m = 2`, the dimension in the definition just above; affects nothing.
- **Misprint** in BorderCorrespondences at the proof of Proposition 34, p. 12: the source invokes compactness of the value at a general parameter; it should be the value at `p0`; affects nothing.

## For the human reviewers

- **Scope.** All locators go to lecture notes (two sets of Caltech notes, MIT OpenCourseWare slides and notes); the refereed originals are named in the README's references without locators. The theorems themselves are standard textbook results.
- **Licence.** BorderFixPt line 46 marks the notes "for course use only" and as excerpted from a 1985 book; the README takes five locators from it, and the route of 4.1 follows its §6.1 step for step, attributed, in different words.
