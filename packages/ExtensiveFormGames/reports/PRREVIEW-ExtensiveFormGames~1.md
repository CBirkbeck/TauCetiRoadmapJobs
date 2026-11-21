# Review of ExtensiveFormGames (pull request #2886 at 7a8bb89)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, Check and worked value was recomputed by hand (Kuhn's theorem in both directions, the behavioural equilibria, both one-shot deviation principles, Zermelo–Kuhn and all the counterexample games) and each agrees with the text; every source locator was read at its place in the three cited texts, and every cited library and supplier declaration was opened at the pins or on main. There is one small correction and one format note, neither blocking. Two points are left for the human reviewers: the sources are a textbook and lecture slides, and five of the routes are the roadmap's own.

## C01 — The slides cited at 3.1 do not state the existence of a behavioural equilibrium

In 3.1 (README line 325) the parenthesis after the theorem cites "Manea, 'Extensive Form Games', slides 7 and 18" beside Karlin–Peres, Corollary 6.2.9, so a reader looking for the statement in the slides will not find it. Slide 7 (ManeaExtensive lines 76–80) defines a Nash equilibrium of the extensive form through its strategic form, and slide 18 (ManeaExtensive lines 234–239) is the convention that restricts to perfect recall so that mixed and behaviour strategies may be interchanged; neither states existence. Corollary 6.2.9 (KarlinPeres line 5384) does.

The smallest change is to say what each slide is cited for, for example "Manea, slides 7 and 18, for the strategic form and the interchange of mixed and behaviour strategies under perfect recall", as 1.4 already does for slide 7.

## N01 — Two instance sentences are narrower or wider than the statements they describe

The Conventions say `[DecidableEq H]` "appears where a profile is updated at one label" (README line 80); it also appears in 2.1 and 2.2, where nothing is updated, because the pure strategies are summed over. And `IsPerfectRecall.isNonAbsentMinded` and `expectedPayoff_eq_sum_outcomeProb` inherit `[∀ h, DecidableEq (A h)]` (the first also `[∀ h, Fintype (A h)]`) from the section although their statements use neither. This agrees with the standing conventions and changes no mathematics; a clause in the Conventions, or `omit` lines, would make the two match exactly.

## Verified sound

Adversarial table (values computed by hand on each side).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trees, nodes, subtrees | leaf; decision with two leaves; chance `(1,0)` | 0 nodes, 1 subtree; 1 node at `[]`, 3 subtrees; both branches kept | agrees with Checks | none |
| 1.2 payoff = sum against outcome distribution | leaf; chance `(1,0)` tree; weights `(1,1)` | `u z = u z`; `1 = 1`; mass 2 on both sides, `u₁+u₂ = u₁+u₂` | true, no validity needed | none |
| 1.3 perfect recall ⇒ non-absent-minded | driver; forgetful tree; matching pennies; chance to one label | experiences `[]` vs length 1; `[⟨0,f⟩]` vs `[⟨0,t⟩]`; `[]`,`[]`; `[]`,`[]` | implication and four Checks hold | none |
| 1.4 behavioural Nash; threat game | 8 pure profiles; driver, payoff 1 at exit 3 | NE: (G;n,E), (N;n,n), (N;E,n) = 3; `(2/3)²(1/3) = 4/27 > 0` | agrees | none |
| 2.1 behavioural → mixed | tree of the Check; extra label `b g = (1,1)`; driver; no label; `A h` empty | `(1/24,1/8,1/24,1/8,2/3)` both sides, weights `1/12,1/4,1/6,1/2`; RHS = 2·LHS; mass `4/27` vs `0`; hypothesis unsatisfiable | true; non-absent-mindedness needed | none |
| 2.2 mixed → behavioural | `μ = ½(L,c)+½(R,d)`; marginals; forgetful tree; `μ = (2,−1)` | `b h' = (1,0)`, `(1/4,0,1/4,0,1/2)` both; marginals give `(1/8,…,1/2)`; `1/4 ≠ 0`; mass `−1` | true; step holds also if `h ∈ e` | none |
| 3.1 behavioural equilibrium | matching pennies; forgetful zero-sum game; empty `A`; infinite `H`, `N` | `(1/2,1/2)` only; `f ≥ 1/2` and `f ≤ 1/4` (product ≤ 1/16); no valid profile; route restricts to finite label set | true; perfect recall and nonemptiness needed | none |
| 4.1 subgame perfection, one-shot test | threat game; leaf subgames; label above the root of a subtree | only (N;n,n) of 8; leaf forces validity; ancestor path fails `π <+: π'` | definition is Manea's Definition 1 | none |
| 4.2 one-shot principle on trees | chance tree payoffs `1,0;0,3`; driver; leaf with `(2,0)`; threat game | SPE iff `x = 0`, one-shot needs `x ≥ 1` and `x ≤ 0`; "always exit" one-shot ok, `4/27 > 0`; invalid ⇒ sides differ | true under perfect information and validity | none |
| 4.3 Zermelo–Kuhn | threat game; matching pennies; empty `A`; equal payoffs; zero-weight branch | (N;n,n) unique; no pure NE; no pure profile; all profiles SPE; construction optimises there | true | none |
| 5.1 plays, continuity at infinity | `t₀ = 0`; discounted payoffs; "all true" indicator; empty `N`; empty `A j` | play is `s`'s; tail `(1−δ)·2M·δ^T/(1−δ) = 2Mδ^T`; differ by 1 for every `T`; vacuous | agrees | none |
| 5.2 one-shot principle, infinite horizon | "always false" vs "all true" payoff; truncation with `T' = max T (t₀+1)`; each replacement step | one-shot `0 ≤ 0`, deviation gains 1; gain ≥ `ε/2`; step is one-shot change after history of length `k−1` | true for pure profiles, any `N` | none |
| Scope remark on Gale–Stewart games | win–lose tree; indicator of `{all true}` | Nash on whole tree ⇒ winner keeps 1; closed set, not continuous at infinity | consistent | none |

- Source locators checked against the text: 16 in KarlinPeres (Definitions 6.1.2, 6.2.2, 6.2.4, 6.2.6, Example 6.1.4, Theorem 6.1.7, Exercise 6.a, Remarks 6.2.3, 6.2.5, 6.2.7, Theorem 6.2.8 and proof, Corollary 6.2.9, Notes p. 134; printed pages 115–122, 134 agree), 14 slides of ManeaExtensive, 7 of ManeaBargaining.
- Library declarations opened at the pin: 16, each elaborated with `#check` (among them `Convexity.StdSimplex.range_toFun_comp_weights`, `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean` line 111; `Fintype.prod_sum`, `Mathlib/Algebra/BigOperators/Ring/Finset.lean` line 308; `Finite.exists_max`, `Mathlib/Data/Fintype/Lattice.lean` line 54; `Set.fintypeRange`, `Mathlib/Data/Set/Finite/Range.lean` line 43); the Ehrenfeucht–Fraïssé folder of Tau Ceti exists; no game tree, subgame or behavioural strategy in either library.
- Cross-roadmap citations resolved: RegretMinimizationAndEquilibria 1.1, 3.1, 4.1 and its scope paragraph on main (`simplex` body identical, `expectedUtility`, `IsNash`, `exists_isNash` as quoted); MarkovDecisionProcesses 2.1 on main; InfiniteGamesAndDeterminacy 1.2 and 1.3 at its open head.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and nothing else; no `set_option`, no sorried data, single `import Mathlib`.
- One-tactic probe: each of the 8 theorems tried with `rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`, `trivial`; none closes.
- Signatures: all 34 elaborated types compared with the README; the information conditions take no `player` where the README gives none; no hypothesis lost.
- Headlines: Kuhn (2.1, 2.2), behavioural equilibria (3.1), one-shot principle (4.2, 5.2), Zermelo–Kuhn (4.3) are all stated; none is declared not statable.
- Dependency check output: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`. The automatic checks all passed. Nothing outside the roadmap folder is changed. The title and description agree with the head (8 theorems, 20 definitions, 4 abbreviations, 1 inductive type counted).

Overlap check: read PotentialGamesAndPriceOfAnarchy, InfiniteGamesAndDeterminacy, KakutaniFixedPointAndContinuousGames, CooperativeGames, MechanismDesign, RegretMinimizationAndEquilibria; nothing shared (RegretMinimizationAndEquilibria excludes game trees with chance and information partitions in its scope; InfiniteGamesAndDeterminacy excludes finite games).

Source independence: 13 passages compared with 3 sources, none shared beyond formulae the mathematics forces; largest share ManeaExtensive, about 16 of 34 locators; contents compared with ManeaExtensive (slides 2–33): independent, the layer order being forced by 3.1 needing 2.1 and 2.2 and these needing 1.2 and 1.3.

Research link: Kuhn (1953) on mixed and behavioural strategies under perfect recall, Zermelo (1913) and Selten (1965) on backward induction and subgame perfection, as attributed in KarlinPeres Notes p. 134 and ManeaExtensive slides 12 and 20; the sequence-form results of RegretMinimizationAndEquilibria 4.1 presuppose this tree setting. Rests on the README and the sources read.

## Not verifiable

- Nothing: all three cited texts were read from legal copies (the authors' page for Karlin–Peres, MIT OpenCourseWare for both slide decks).

## Source issues

- none

## For the human reviewers

- **Scope.** The README's locators go only to a textbook (KarlinPeres) and two lecture slide decks (ManeaExtensive, ManeaBargaining); Kuhn 1953, Zermelo 1913 and Selten 1965 are named by attribution in the References, with no locator.
- **Scope.** Five routes (2.1 under non-absent-mindedness alone, 3.1's deduction, 4.2 with chance, 4.3, 5.2 for any player set) are proved in the README because no cited text proves the statement as stated; this review checked each by hand.
- **Licence.** The threat game (1.4) and the absent-minded driver (1.3) are adapted, with other payoffs and a cited locator, from ManeaExtensive slides 8–9 and 17, MIT OpenCourseWare material whose terms of use this review did not read.
