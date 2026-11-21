# Review of SocialChoice (pull request #2855 at e9d6733)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on degenerate cases (no voters, one voter, two alternatives, infinite sets of voters and of alternatives) and every Check holds; the locators into Endriss and into Elkind–Lackner–Peters agree with the texts, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction (for infinitely many outcomes the two theorems of Layer 4 say that no such rule exists, which the text does not tell the reader) and one format note, neither blocking. Geanakoplos's paper could not be read here, so the two locators of 2.1 and 2.4 into it are unverified, and the humans are asked to look at the kind of sources and at the topic.

## C01 — For infinitely many possible outcomes, 4.1 and 4.2 are non-existence statements, and the text presents them as dictatorship theorems

In 4.1 (lines 355–359) and 4.2 (lines 389–391) the hypothesis reads "at least three possible outcomes … (finitely or infinitely many)", and the conclusion is that `F` is dictatorial on its range. A rule that is dictatorial on its range has a finite range: if `Set.range F` is infinite, well-order it in the order type of its cardinal, a limit ordinal, and read "later is better"; the resulting linear preference, completed arbitrarily on the other alternatives, has no best element in the range, and at a profile where the dictator casts it, `IsDictatorialOnRange` asks `F p` to be strictly above every other possible outcome. So for an infinite range the two theorems are true (Endriss's proof of Theorem 4 uses no top element until its last line), but what they say is that no strongly monotone, respectively strategy-proof, resolute rule on all linear ballots has infinitely many outcomes when the voters are finitely many. The case of one voter shows it directly: if `p` has no best element in the range and `F p = y`, some `y' = F b` in the range is above `y`, and the voter gains by reporting `b`. A reader of "finitely or infinitely many" expects dictatorial rules with infinite range, as Arrow's theorem has for infinitely many alternatives, and an implementer may look for one as a test case.

The smallest change is one Check in 4.1, repeated by reference in 4.2: a rule dictatorial on its range has finitely many possible outcomes, since linear preferences on an infinite set need not have a best element; so for an infinite range the theorem says that no such rule exists, and on infinitely many alternatives the rule "voter 1's best among `a`, `b`, `c`" is the typical example. The Check of 3.2 already takes this care ("on finitely many alternatives").

## N01 — The scope section could name the owner of what it excludes

The scope section sets aside auctions and mechanism design with quasi-linear utilities (Vickrey, Clarke–Groves, Myerson) without naming a roadmap. MechanismDesign states exactly these, and its own scope section excludes Arrow's and the Gibbard–Satterthwaite theorems and social choice functions without money; naming it beside BooleanFunctionAnalysis and CooperativeGames would give the reader both sides of the boundary.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `LinPref.map` | transposition `(a b)`; 3-cycle `a→b→c→a` on `a b c` | `b a c`; `b c a`; other reading gives `c a b`; 6 linear and 13 weak orders on 3 points | Checks true, convention pinned |
| 1.2 majority, Condorcet winners | cyclic profile; no voters; 2 alternatives with 4 voters split 2–2 and 3–1 | each pair 2–1, winners ∅; all weak winners, strict only if one alternative; `{a,b}`, `{a}` | true |
| 2.1 axioms | dictatorship; lexicographic rule; inverse dictatorship; constant rule; majority on 2 alternatives, 3 voters; no voters | both axioms; dictator 1 with `F p ≠ p 1` at ties; IIA without Pareto (twice); no dictator; Pareto then demands `P x x` | true |
| 2.2 ultrafilter form | reverse direction; no voters; 2 alternatives with 3 voters; nonprincipal `U` on ℕ; `x = y`; weak-valued `F` in the contraction step | `rel x y ↔ {y above x} ∉ U`; both sides false; `{1,2} ∩ {2,3} = {2}` not winning; no singleton in `U`; both sides false; `¬P x z` gives `P y x` | true in both directions |
| 2.3 Arrow, linear ballots | one voter; `U = pure i` | Pareto forces `F p = p i`; `{j : P x y} ∈ pure i ↔ (p i).P x y` | true |
| 2.4 Arrow, weak ballots | 2 alternatives, 2 voters rule of the Check; tie-breaking reduction to 2.3 | voters opposed gives indifference, no dictator; refined rule keeps Pareto and IIA and agrees on linear ballots | true; source statement not read |
| 3.1 May | 0, 1, 2 voters; odd margin-one case; even tie; the three rules of the "each needed" Check; empty rule; `q = p` allowed | `{a,b}` by neutrality; `{x}`; mirror profile contradicts `{y}`; both chosen; each rule has exactly two properties; all three, not majority; resolute at ties, contradiction | iff true in both directions |
| 3.2 Sen | four distinct alternatives; pairs sharing one alternative; equal pairs; one voter | `y₁,y₂` by rights, `x₁,x₂` and rest by Pareto; `i: x y z`, `j: y z x` excludes all three; opposite ballots exclude both; top-of-`i` rule consistent | true |
| 4.1 Muller–Satterthwaite | constant rule; unanimity-for-`b` rule; best-of-`{a,b,c}` on 4; reduction to range; infinite range, one voter | 1 outcome; 2 outcomes, no dictator; dictatorial on range only; `F p = G(p|Y)`, `G` onto and monotone; contradiction, so no rule | true; C01 |
| 4.2 Gibbard–Satterthwaite | plurality profile of the Check; one-voter-at-a-time step; ultrafilter rule on ℕ; no voters | `a` wins, third voter obtains `b`; gain by earlier or later ballot in the two cases; membership in `U` unchanged; range has 1 element | true; C01 |
| 5.1 single-peaked, median voter | `abc, cba`; `abc, bac`; `abc, bca`; `n = 1..4` for position `⌈(n+1)/2⌉`; no voters | half the peaks each side, ties; 2 and 1 of 2, tie with `a`; winners `a`, `b`; at least `n/2` each side; `0 < 0` false | true |
| 5.2 transitivity | supposed failure with `x ≠ y ≠ z`; `abc, bca` weak relation; `x = z` | voters `x y z`, `z x y`, `y z x`, each alternative last once; `c~a`, `a~b`, `b` beats `c`; hypotheses contradictory | true |
| 5.3 Condorcet rule | `i` prefers `c` to `a` | supporters of `a` over `c` do not shrink, of `c` over `a` do not grow, `a` still beats `c` | true, no single-peakedness needed |
| Scope: 2.3 implies BooleanFunctionAnalysis 6.3 | common order `a b c` | points `(s, s, s̄)`, so `f(0) ≠ f(1)`; `±f` Paretian, linear-valued, independent | derivation correct |

- Source locators checked against the text: 21 into Endriss (pp. 4–14, Theorems 1–5, the definitions, the ultrafilter remark p. 8, Fishburn p. 7) and 7 into Elkind–Lackner–Peters (Proposition 3.1, Definition 4, Proposition 3.4, Corollary 3.5 and the remark after it, Example 7); all agree. 2 into Geanakoplos not read.
- Library declarations opened at the pin: `Ultrafilter.eq_pure_of_finite` (`Mathlib/Order/Filter/Ultrafilter/Basic.lean:56`), `Ultrafilter.mem_pure` (`Mathlib/Order/Filter/Ultrafilter/Defs.lean:235`), `IsTrans`, `IsLinearOrder` (`Mathlib/Order/Defs/Unbundled.lean:24, 43`), `Set.encard`, `Set.ncard`, `Set.ncard_univ` (`Mathlib/Data/Set/Card.lean:68, 643, 702`), `ENat.card` (`Mathlib/SetTheory/Cardinal/Finite.lean:282`). No file of the pinned Mathlib or Tau Ceti mentions Condorcet, Arrow's theorem, Gibbard or single-peaked preferences.
- Cross-roadmap citations resolved: BooleanFunctionAnalysis 6.2 and 6.3 (open, read at its head; cube with entries 0 and 1, as the derivation assumes), CooperativeGames (simple games, weighted voting, both indices in its scope). Neither is a supplier.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; the roadmap names no roadmap supplier.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/SocialChoice/Suggested.lean`: 11 `sorry` warnings and nothing else. `#check @name` on all 31 declarations: every binder of the README statement is present (`[Finite ι]`, `[DecidableEq ι]`, `[LinearOrder α]`, `[Nonempty α]`, `[Fintype α]`); nothing changed.
- One-tactic probe on the 11 theorems (`rfl`, `simp` with the definitions unfolded, `infer_instance`, `tauto`, `exact?`): none closes. All 11 headline theorems of the README are stated; none is forced through a stand-in.
- The pull request's description was read against the head: its counts (11 theorems, 18 definitions, 2 structures), its suppliers and its boundaries agree with the files; no change outside the folder.

Overlap check: read MechanismDesign, BooleanFunctionAnalysis, CooperativeGames; nothing shared (BooleanFunctionAnalysis keeps the one-rule Fourier form of Arrow's theorem for three candidates and states that the form with different rules is not stated there; MechanismDesign excludes Arrow, Gibbard–Satterthwaite and social choice without money; CooperativeGames keeps simple games and power indices). No roadmap on main treats preference aggregation.

Source independence: 19 passages compared with 2 sources, none shared (the profiles of the proofs of Sen and of the contraction step coincide with Endriss's, as the mathematics forces); largest share Endriss2011, 23 of 34 citations; contents compared with Endriss2011 §2.1–2.3: independent, since its §2.2 is divided between Layers 3 and 4, Layer 4 joins it to §2.3, and the ultrafilter equivalence, the weak-ballot form, the range forms and Layer 5 are not from it, though the topics come in the same sequence; Geanakoplos1996 was not read.

Research link: Arrow (1951), Kirman–Sondermann (1972), May (1952), Sen (1970), Gibbard (1973), Satterthwaite (1975), Muller–Satterthwaite (1977) and Black (1948) are the theorems stated; Elkind–Lackner–Peters (arXiv:2205.09092, §3) builds current work on restricted domains on Layer 5. Rests on the README's references and on the two texts read.

## Not verifiable

- Geanakoplos, Cowles Foundation Discussion Paper 1123R, p. 1 (the statement with ties, the wording of independence and of the dictator, cited in 2.1 and 2.4) and pp. 1–2 (the first proof, the route of 2.4): the sources service found no copy in a recognised legal place; the series page of the author's institution is not one it knows. The statement of 2.4 was checked mathematically, not against this text.
- No public Lean formalisation of Arrow's theorem was compared with `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- **Scope.** The three texts with locators are expository: a handbook chapter (Endriss2011), a discussion paper (Geanakoplos1996) and an arXiv survey (ElkindLacknerPeters). The primary papers are named without locators (`TauCetiRoadmap/SocialChoice/README.md` lines 604–610).
- **Scope.** The subject is axiomatic social choice, a refereed literature in economic theory; the folder's metadata gives the topic `math.OC`. Whether it belongs in the project is yours to decide.
- **Not tested.** Geanakoplos1996 could not be read: wording and locators of 2.1 and 2.4 were not compared with it. Its host is the Cowles Foundation's own paper series; a human may classify it.
