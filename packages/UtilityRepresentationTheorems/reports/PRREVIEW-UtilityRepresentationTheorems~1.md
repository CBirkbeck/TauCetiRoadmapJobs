# Review of UtilityRepresentationTheorems (pull request #2870 at 2b61475)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed at its degenerate cases (empty type, empty and one-point interval, all alternatives indifferent, one outcome, non-total and non-transitive relations, discontinuous utilities) and none fails; the four conventions tested in Lean (the utility convention, `lexPref` against `toLex`, `mix` on ℝ, `expectedUtility` at a point mass) come out as the README says. There is one small correction and one format note, neither blocking. Three sources (Debreu 1954, Herstein–Milnor 1953, Ouwehand 2010) could not be read through a legal channel, so their locators are unverified, and a human decides the points listed at the end.

## C01 — The scope paragraph on SocialChoice says nothing of that roadmap is restated, while the strict part is defined in both

In "Scope and ownership" (README line 605) the sentence "Nothing of that roadmap is restated or used" follows directly on "`strictPart R.rel` is `R.P` by definition". At its head, SocialChoice's `Suggested.lean` (1.1, `WeakPref.P`) has the body `R.rel x y ∧ ¬R.rel y x`, which is the body of `strictPart` here (`Suggested.lean` line 28) applied to `R.rel`. A reader deciding which roadmap owns the strict part of a preference is told two things at once.

The smallest change is to the sentence: say that the one-line strict part is defined in both, on different carriers (an arbitrary relation here, a bundled `WeakPref` there), and that nothing else is shared. Whether one of the two should cite the other is put to the human reviewers below.

## N01 — Two Checks justify a claim by a numerical test where a one-line reason is available

In the Check of 4.2 (line 468), "concave on `[0, 1]` (checked on a grid of points and weights)": a grid does not establish concavity, and the reason is short (for `0 < y ≤ 1` and `0 ≤ t ≤ 1`, `u(t y) = t y ≥ t y − (1 − t)`; on `(0, 1]` the function is linear). Likewise in the Check of 3.1 (line 347), "(checked for `α = 1/1000, 1/2, 999/1000`)" can go: the preceding clause already gives the reason for every `α > 0` (`p a = α > 0`).

## Questions for the author

- In the route of 3.1, does the argument of Herstein and Milnor on pp. 293–297 use, beyond their three mixture-set identities, the rule for mixing two mixtures of the same pair, `λ(μa + (1−μ)b) + (1−λ)(νa + (1−ν)b) = (λμ + (1−λ)ν)a + (1 − λμ − (1−λ)ν)b`? I recall a later note in the literature (Mongin, 2001) on whether the three identities imply it, and could read neither that note nor Herstein–Milnor. In a `Convexity.ConvexSpace` the rule follows from the associativity law, so the theorem is unaffected; if the route uses it, naming the law that supplies it would spare an implementer the search.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsUtility`, `strictPart` | ℝ with `R x y := y ≤ x`, `u = id`; `u = x²` at `1`, `−1`; reversed convention at `(1, 0)` | Lean: `IsUtility (fun x y => y ≤ x) id` by `Iff.rfl`. `x²`: `R 1 (−1)` true, `R (−1) 1` false, but `u` equal. Reversed: needs `1 ≤ 0`. | holds; wrong convention excluded | none |
| 1.2 `IsOrderDense` | chain `0 < 1` with `D = {0}`; strict variant; lexicographic plane | `1 ≻ 0`: `d = 0` gives `R 1 0 ∧ R 0 0`. Strict variant: no `d` with `0 < d < 1`. Lex: `(a,1) ≻ (a,0)` forces `d ∈ {a} × [0,1]`. | holds | none |
| 1.3 `IsContinuousPref` | lex at `(1, 0)`; graph-closed equivalence, both cases of the Check | `(1 + 1/n, −5) ≿ (1, 0)`, limit `(1, −5)`: first coordinates equal, `0 ≤ −5` false. No-`z` case: `u ≻ y` forces `u ≿ x`, `v ≺ x` forces `v ≾ y`, so `u ≻ v`. | holds | none |
| 1.4 `lexPref` | `(1,0)` vs `(0,5)`; agreement with `toLex` | `0 < 1` true; reverse `1 < 0` false and `0 = 1` false. Lean: `lexPref p q ↔ toLex q ≤ toLex p` by `simp`. | holds | none |
| 2.1 Cantor–Debreu | empty type; empty relation on one point; 3-cycle; route's `d₁`, `d₂` in all three cases | Empty: `u` exists, `D = ∅`. Empty relation: `∅` dense, `R x x` false but `u x ≤ u x`. Cycle: `u a > u b > u c > u a`. Route: `u y ≤ f d₂ < f d₁ ≤ u x` in each case. | holds; both class hypotheses needed | none |
| 2.2 no utility for `lexPref` | intervals `(u(a,0), u(a,1))`, `a < b` | `(b,0) ≻ (a,1)` gives `u(a,1) < u(b,0)`: disjoint; injection ℝ → ℚ. `(s,t) ↦ s`: `(0,1) ≻ (0,0)` with equal values. | holds | none |
| 2.3 Debreu, second countable | empty space; double arrow space; floor preference; the four cases of `{t < g(u x)}` | Double arrow: jump `(a,0) < (a,1)` forces `d` among the two, uncountably many. Floor: lower set at `0` is `(−∞, 1)`. Open gap `(a, b)` has `a, b` values by maximality; two-sided limit point gives a union. | holds | none |
| 2.4 Eilenberg–Debreu | empty space; `x ≻ y` in a connected space | `{w : R y w}` and `{w : R w x}` closed, disjoint, contain `y`, `x`; complement open nonempty, meets the dense set strictly between. | holds | none |
| 3.1 Herstein–Milnor, iff and uniqueness | all indifferent; two-point semilattice (`mix = max` for `0 < α < 1`); `min(p a, 1/2)`; lex on three outcomes | Semilattice: weights with `mix α 1 0 ≿ 1` are `(0, 1]`, not closed; affine `U` forces `U 1 = (U 1 + U 0)/2`. `3/5 ~ 4/5`, mixtures `3/10 < 2/5`. Lex: `(0, 1]`. Uniqueness: `λ = (U x − U r₀)/(U r₁ − U r₀)` gives `V x`. | holds | none |
| 3.2 von Neumann–Morgenstern, iff and uniqueness | `C` empty; one outcome; largest-weight ranking; `u ∈ {0,1,2}` with `exp ∘ u`; six shapes of the weight sets | Solving weight `(U y − U z)/(U x − U z) ∈ (0, 1)`. Largest weight: `1` vs `1/2`. `e ≈ 2.718 ≠ (1 + e²)/2 ≈ 4.195`. Weight sets: `∅`, `{1}`, `{0}`, `[0,1]`, `[α*, 1]`, `[0, α*]`. Lean: `expectedUtility u (single c) = u c` by `simp`. | holds | none |
| 4.1 certainty equivalent | `D = ∅`; `D` a point; `log`, `√`, `−e^(−x)`, `−e^(−2x)`, `−x²` | `∅`: no probability measure. `log`: `e^((log 4)/2) = 2`. `√`: `(3/2)² = 9/4`. `−log(0.68394) = 0.37989`. `−log(0.567668)/2 = 0.28311`. `−x²`: `c² = 1/2`, two roots. | holds; strict monotonicity needed | none |
| 4.2 risk aversion iff concave | `D = ∅`; mean at an endpoint; `x²` on `[0,1]`; `u 0 = −1`, `u x = x` | `∅`: both sides true. Endpoint mean: `μ` is a point mass, equality. `x²`: `1/2 > 1/4`. Jump function: `u(t y) = t y ≥ t y − (1 − t)`; `∫u = 0 ≤ 1/2`. | holds | none |
| 4.3 Pratt, global | `D = ∅`; `log` vs `√`; exponentials; `u = −x²`, `v = x` | `g y = 2 log y`; `2 ≤ 9/4`. `g y = −y²`; `0.2831 ≤ 0.3799`, premia `0.2169 ≥ 0.1201`. Non-monotone `u`: `1/√2 ≈ 0.707 > 1/2`. | holds; monotonicity of `u` needed | none |
| 4.4 Pratt, local | `D` a point; `log`, `√`, `−e^(−a x)`; `u` with a jump at an endpoint, `v = id` | `1/x`, `1/(2x)`, `a`. Identity `u″/u′ = (g″/g′) v′ + v″/v′` rederived. Jump up at `0`: coefficients equal on the interior, `u` not concave, so continuity on `D` is needed. | holds | none |
| C01 | `WeakPref.P` at the head of SocialChoice against `strictPart` | Both bodies: `rel x y ∧ ¬rel y x`. | sentence inexact | reword |

- Source locators checked against the text: 24 (Bosi–Estevan Corollary 3.2, p. 9, at BosiEstevan2024 line 307; Border's four notes, 11 locators, e.g. BorderChoice lines 338, 647, 652, BorderDemand0-Preferences lines 82, 109, BorderDecision line 551, BorderRiskAversion lines 28, 92, 117, 243; Rubinstein, 12 locators, e.g. Rubinstein2012 lines 789, 829, 901, 3535, 3547, 3568, 3604, 3623, 3646, 3974, 4024, 4063).
- Library declarations opened at the pinned Mathlib: 30, all present with the stated hypotheses, among them `Order.embedding_from_countable_to_dense` (`Mathlib/Order/CountableDenseLinearOrder.lean` line 227), `ConcaveOn.le_map_integral` (`Mathlib/Analysis/Convex/Integral.lean` line 205, with `ContinuousOn g s` and `IsClosed s`), `concaveOn_of_deriv2_nonpos` (`Mathlib/Analysis/Convex/Deriv.lean` line 224), `ConcaveOn.antitoneOn_deriv` (same file, line 950), `Convexity.ConvexSpace` (`Mathlib/Geometry/Convex/ConvexSpace/Defs.lean` line 384), `Convexity.IsAffineMap` (line 494), `MeasureTheory.integrable_map_measure` (`Mathlib/MeasureTheory/Function/L1Space/Integrable.lean` line 355).
- Duplication: no utility, preference, certainty-equivalent or Arrow–Pratt declaration in the pinned Mathlib or Tau Ceti; Tau Ceti's only Jensen statements use Mathlib's closed-set form.
- Cross-roadmap citations resolved: 4 (RegretMinimizationAndEquilibria conventions, on main, README line 104; StandardDistributions §7.13, on main, README line 1202; MeansMajorizationAndDiscreteInequalities §1.3 and SocialChoice 1.1 at their open heads). ConsumerTheoryDuality, open, cites 2.3 of this roadmap and owns none of its objects.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap names no supplier roadmap.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/UtilityRepresentationTheorems/Suggested.lean`: 12 `sorry` warnings, nothing else; single `import Mathlib`, no `set_option`, no sorried data.
- Signatures: the 26 elaborated types were compared with the README statements; no binder is lost (the mixture-section declarations carry `[ConvexSpace ℝ X]`, `half` carries nothing), and the generality agrees.
- One-tactic probe on a scratch copy: none of the 12 theorems closes with `rfl`, `simp` or `infer_instance`; no padding. All headline theorems of the README are stated.

Overlap check: read ConsumerTheoryDuality, SocialChoice, PotentialGamesAndPriceOfAnarchy, MechanismDesign, KakutaniFixedPointAndContinuousGames, RegretMinimizationAndEquilibria (no list by results had an entry); the strict part of a total preorder is defined both here (`strictPart`) and in SocialChoice (`WeakPref.P`), with no owner named (C01 and the human reviewers' list); utilities and the representation theorems: this roadmap; bundled preferences and their aggregation: SocialChoice; expected payoff of a strategy profile: RegretMinimizationAndEquilibria. Outside the three lists, MeansMajorizationAndDiscreteInequalities §1.3 owns the comparison of quasi-arithmetic means of finite data; 4.3 here is its extension to all probability measures and says so.

Source independence: 29 passages compared with 6 texts (24 locators and 5 routes: 2.2, 3.2, 4.1, 4.3 and the Check of 1.3), none shared beyond formulas; largest share Rubinstein2012, 12 of about 45 locators (Border's four notes together also 12); contents compared with Rubinstein2012: independent (Layers 1 and 2 both fall in its Lecture 2, the central theorem of Layer 3 is not in it, Lectures 3 to 6 are unused). Not read: Debreu 1954, Herstein–Milnor 1953, Ouwehand 2010.

Research link: The headline targets are the representation theorems of Debreu (1954, corrected 1964), Herstein and Milnor (1953) and Pratt (1964), as the README's references give them; Bosi and Estevan (2024), read here, derive Debreu's theorem as Corollary 3.2 of a current result on continuous representations of interval orders. Rests on the README and BosiEstevan2024.

## Not verifiable

- Debreu 1954 (Lemma II p. 161, Theorems I and II pp. 162–163, footnote 1 p. 164, the definitions on p. 160, the footnote on p. 159): the DOI leads to a publisher page and the Cowles Foundation scan and its Internet Archive capture are on hosts the sources service does not classify. Affects the locators of 1.1, 1.2, 1.3, 1.4, 2.1, 2.2, 2.3, 2.4.
- Herstein and Milnor 1953 (mixture sets p. 292, Axioms 2 and 3 p. 293, Theorems 1–8 pp. 293–297): the DOI leads to JSTOR; the Cowles scan as above. Affects the locators of 3.1; Border's Theorem 9 (read) gives existence only, under independence for all weights.
- Ouwehand 2010 (Theorem 1 p. 17, pp. 18–19, §3 p. 20): the journal's site is on an unclassified host and the direct link tried returned "not found". Affects the gap-lemma locators of 2.1 and 2.3.
- The mathematics of these sections was checked independently (table above); only the page and theorem numbers and the wording comparison are open.

## Source issues

- **Gap** in BorderRiskAversion at Lemma 1, p. 1: the source says the range of the utility contains the expected utility, with no argument; it should be shown that an integral of interval-valued values against a probability measure stays in the interval, an omitted endpoint included; affects the proof.

## For the human reviewers

- **Not tested.** Debreu 1954, Herstein–Milnor 1953 and Ouwehand 2010 could not be read legally through the sources service; wording and locators of 1.2, 2.1 and 3.1 rest on them alone. Rubinstein and Border, the largest shares, were read.
- **Licence.** The README's References say Debreu 1954 and Herstein–Milnor 1953 were read as Internet Archive captures (2010) of Cowles Foundation reprint scans; the status of those copies was not settled here.
- **Scope.** The subject is decision theory (topic `math.OC`). The headline theorems are attributed to refereed work (Debreu 1954, Herstein–Milnor 1953, Pratt 1964); 24 of about 45 locators point to unpublished lecture notes (Border) and a textbook (Rubinstein).
- **Ownership.** SocialChoice (open, same author) bundles the same total preorders as `WeakPref` and defines the strict part by the formula of `strictPart` here; neither cites the other as owner. Whether to keep two encodings is a design decision.
- **Ownership.** MeansMajorizationAndDiscreteInequalities §1.3 (open, another author) states the finite-data case of 4.3; this roadmap proves that case again inside 4.3 instead of citing it, and declares no dependency.
