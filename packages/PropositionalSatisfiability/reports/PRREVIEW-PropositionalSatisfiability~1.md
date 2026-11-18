# Review of PropositionalSatisfiability (pull request #2506 at 39b8a0c)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or worked example was found false. Every stated theorem was recomputed by brute force on small instances or re-derived by hand, and every source locator and library citation was opened and agrees with the text. There is one small correction (a Check in 4.1 that lists only part of a propagation closure) and one format note (six works credited by name and year have no bibliographic entry), neither blocking. Whether the subject, the correctness theory of abstract SAT-solving systems and clausal proof formats, is in the project's scope is left to the human reviewers.

## C01 — The first Check of 4.1 names two of the three literals that the added clause makes propagated

A reader who recomputes the closure gets a different set from the one the Check lists and cannot tell whether the definition or the Check is off. In the first Check of 4.1 (README line 491), after `{¬z, ¬x}` is added to `S = {{x}, {¬x, y}, {¬y, z}}` the text says this "makes `¬x` and `¬z` propagated as well". With `¬z` propagated, the clause `{¬y, z}` propagates `¬y` too (its only other literal `z` has its negation in the closure), so the closure is all six literals of `x, y, z`. The conclusion drawn (the closure is inconsistent and `∅` is unit derivable) is right.

Smallest change: "makes `¬x`, `¬z` and then `¬y` propagated as well: the closure is the set of all six literals".

## N01 — Six works credited by name and year are not in the References, and Layers 1 to 3 carry no locator

Tseitin 1968 (2.3), Plaisted and Greenbaum 1986 (2.4), Robinson 1965 (3.1, 3.3), Lee 1967 (3.3), Davis and Putnam 1960 (3.2) and Kullmann 1999 (6.2) are credited in the text but have no entry under References, so the credits cannot be followed. Adding the six entries would do; a textbook locator for the subsumption theorem and for completeness of resolution would also give Layers 1 to 3, which are all "proved here", one checkable reference each.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 models, entailment, tautology | `V` empty; `{∅}` vs `∅`; `{x,¬x}`; `{x,¬y}` at `x↦F, y↦T` | `V` empty gives exactly 2 formulas; `{x,¬y}` false at that assignment; non-tautology falsified by making its literals false | holds | none |
| 1.2 restriction, splitting | `F={{x,y},{¬x,y},{¬y}}`, `l=x`; 24000 (formula, literal) pairs on 2 variables | `F|x = F|¬x = {{y},{¬y}}`; sat(F) = sat(F|l) or sat(F|¬l) in all pairs | holds | none |
| 1.3 compactness | Check on `V=ℕ`; four-clause example | 3-clause subset unsat; each 3-subset of the four clauses has 1 model | holds | none |
| 2.2 `models_toCNF` | 2998 random formulas, both polarities, all assignments; disjunction of `n` conjunctions, `n=1..5` | iff holds in all; `2,4,8,16,32` clauses of `n` literals, sizes `1,3,5,7,9` | holds | none |
| 2.3 `models_tseitin_iff`, `card_tseitin_le` | 2998 random formulas incl. constants, repeated subformulas; all assignments of subformulas | iff holds in all; counts `4,10,16,22,28 = 3(2n−1)+1`; `and x x` gives 3; no tautological clause; all clauses ≤ 3 literals | holds | none |
| 2.4 Plaisted–Greenbaum | same 2998 formulas; `or x y`; `or (and x y) z` | model ⇒ `eval = true` in all; ≤ `2·size+1`; `or x y`: 2 clauses vs 4; name of `and x y` free | holds | none |
| 3.1 derivations | Checks; tree vs list size | `resolve {x,¬x} {¬x,y} x = {¬x,y}`; list of 7; tree bound `T(m) ≤ 2T(m−1)+1` | holds | none |
| 3.2 `models_eliminate_iff` | 12000 (formula, variable) pairs on 2 variables, tautological clauses included; three Checks | iff holds for every assignment; `v` absent from result; result ⊆ derivable; `{{x,¬x,y},{¬x,z}}` gives `∅` | holds | none |
| 3.3 completeness, tautology-free refutation, subsumption theorem | 6000 formulas on 2 variables, 48822 entailed non-tautological clauses | unsat ⇔ `∅` derivable; ⇔ `∅` derivable without tautologies; a derivable subset exists each time; `∅ ⊨ {x,¬x}` control fails as stated | holds | none |
| 3.4 Horn completeness, least model | 376 Horn formulas on 2 variables; four-clause non-Horn control | unsat ⇔ unit-derivable `∅`; unit-derivable positive units form the least model; non-Horn control derives nothing | holds | none |
| 3.5 `satisfiable_pigeonhole_iff` | `m=0..4`, `n=0..3` by enumeration | sat ⇔ `m ≤ n` in all 20; count `m + n·m(m−1)/2` for `n ≥ 1`; `n=0<m` gives `{∅}` (1 clause) | holds | none |
| 4.1 `propagated_iff_unitDerivable` and fourth bullet | 96000 (formula, `M`) pairs incl. inconsistent `M`, `∅ ∈ S` | both iffs hold for every literal and every clause; first Check's closure is 6 literals, text lists `x,y,z,¬x,¬z` | holds | C01 |
| 4.2 rules, structural invariants | rules set beside the source's five definitions; 98098 random steps | nine rules agree with source side conditions; trail duplicate-free and consistent at every visited state | holds | none |
| 4.3 `classicalDPLL_final` | all 16 formulas on 1 variable, 1500 on 2; every reachable final state | 3516 final states: `fail` ⇔ unsat; otherwise trail meets every clause; five-step Check reproduced | holds | none |
| 4.4 potential, `ncard_progress_steps_lt` | potential differences by rule; longest derivation over all six progress rules, `n=0,1,2` | decide −1, propagate −`2^(n−k)`, backtrack −(`2^(n−k+1)`−1); longest `1, 3, 7` < `2, 4, 8`; Check potentials `2,1,0` | holds | none |
| 5.1 `exists_step_fail_or_backjump`, `backjump_of_backtrack`, `eq_fail_iff_not_satisfiable`, `models_of_isFinal` | exhaustive on 1 variable (cdcl with backtrack); 4000 random walks on 2 variables | 10829 conflict states all admit fail or backjump; 5610 backtrack steps all backjumps; 78941 final states satisfy all three conclusions | holds | none |
| 5.1 `eventually_learn_or_forget` | hand derivation; two negative controls | finitely many restarts since counts strictly increase below `2^(n+1)`; decide/restart loop violates periodicity (1 = 1) | holds | none |
| 5.2 analysis: input resolution, termination, decisions clause, first UIP, backjump licence | 4000 random implication trails, ≤ 6 variables; worked example | weight `Σ 2^p` drops at every step; decisions clause and asserting clause always reached; unit clause at level 0; 7395 licences valid | holds | none |
| 6.1 `IsRUP.entails`, `InputDerivable.isRUP`, `isRUP_iff_exists_unitChain` | 96000 (formula, clause) pairs; 22629 input-derivation closures; 54000 non-tautological pairs | RUP ⇒ entailed; preserved along input resolution; chain ⇔ RUP off tautologies; `S=∅, C={x,¬x}` has no chain | holds | none |
| 6.2 `models_insert_or_models_update` | 10727 (formula, clause, literal, model) cases; two Checks | `τ` or the updated `τ` is a model each time; `{a}` RAT on `a`, not RUP, in the source's example | holds | none |
| 6.3 `satisfiable_applySteps` | Checks and the Layer 6 example by hand | `[add {y}, add ∅]` valid; after deleting `{x,y}`, `{y}` neither RUP nor RAT; remaining set satisfiable at `x,y↦F` | holds | none |
| 6.4 `sat_iff_models_ofStd` | core definitions opened: `Clause.literals`, membership, `Sat`, both lemmas | core membership is membership in `literals` by `Iff.rfl`; lemma statements match the README's paraphrase | holds | none |

- Source locators checked against the text: 32 of 32, in 6 sources (17 in Nieuwenhuis–Oliveras–Tinelli, 3 in Blanchette et al., 2 in Beame et al., 4 in Wetzler et al., 3 in Järvisalo et al., 3 in Cruz-Filipe et al.); all agree with the statements as written.
- Library declarations opened at the pins: 14, all present with the stated content: Mathlib `CompactSpace.iInter_nonempty` (`Topology/Compactness/Compact.lean` 819), `Function.compactSpace` (1178), `Finite.compactSpace` (1084), `continuous_apply` (`Topology/Constructions.lean` 783), `isClosed_discrete` (`Topology/Order.lean` 323), `Fintype.exists_ne_map_eq_of_card_lt` (`Data/Fintype/Pigeonhole.lean` 47), `FirstOrder.Language.Theory.isSatisfiable_iff_isFinitelySatisfiable` (`ModelTheory/Satisfiability.lean` 101), the `meta section` of `Tactic/Sat/FromLRAT.lean` (45); Lean core `Std.Sat.Literal`, `negate` (`Std/Sat/CNF/Literal.lean` 21, 29), `CNF.Clause` with `ByteArray` polarities (`Basic.lean` 31), `sat_iff_all_mem_sat`, `Clause.sat_iff_exists_mem_eq` (`Sat.lean` 207, 101), `exists_sat_add_of_rat` (`Redundancy.lean` 53), `LRAT.check_sound` (`Checker.lean` 32).
- Cross-roadmap citations: none made; object searches over main and the open heads (Tseitin, pigeonhole, propositional, resolution refutation, conjunctive normal form, Horn, DPLL/CDCL, unit propagation, `Std.Sat`) found no other owner.
- Dependency check: `depcheck: 211 roadmaps, 2260 edges, 0 problem(s)`; no change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/PropositionalSatisfiability/Suggested.lean`: 30 `sorry` warnings and nothing else.
- One-tactic probe: none of the 30 theorems closes with `rfl` or `simp`.
- Signatures: all 79 elaborated types compared with the README; `Clause.IsHorn` and `Propagated` do not carry `[DecidableEq V]` because they do not use it, which changes no statement.
- Headline theorems (resolution completeness and the subsumption theorem, the Tseitin characterisation and bound, soundness, completeness and the step bound for the systems with learning, RAT addition and DRAT soundness) are all stated in the Lean file, as its docstring says.

Overlap check: read InfinitaryModelExistence (main and its open revision), ComputabilityTheory; nothing shared.

Source independence: 12 passages compared with 6 sources, none shared beyond one attributed six-word quotation (Cruz-Filipe et al. 2017, Section 1); largest share Nieuwenhuis–Oliveras–Tinelli 2006, 17 of 32 locators; contents compared with its Sections 2.1 to 2.6: independent (only 4.2 to 5.1 draw on it, with the nine rules gathered in one section and a different termination argument).

Research link: Layers 4 and 5 are the abstract DPLL systems of Nieuwenhuis, Oliveras and Tinelli 2006, as formalised by Blanchette, Fleury, Lammich and Weidenbach 2018; 5.2 and 6.1 are the clause-learning versus resolution comparison of Beame, Kautz and Sabharwal 2004; Layer 6 is Järvisalo, Heule and Biere 2012 and Wetzler, Heule and Hunt 2014. Rests on the README's sources, read.

## Not verifiable

- The credits to Tseitin 1968, Plaisted and Greenbaum 1986, Robinson 1965, Lee 1967, Davis and Putnam 1960 and Kullmann 1999 were not checked against those texts: the README gives no locator or bibliographic entry for them, and the statements they are attached to are proved in the roadmap and were checked directly.

## Source issues

- **Gap** in Nieuwenhuis–Oliveras–Tinelli 2006 at Theorem 2.10, proof, p. 14 of the authors' copy: the source says its order on states is well founded as a lexicographic extension on bounded sequences; it should be justified separately, since a longer sequence extending a shorter one is the smaller here, unlike in the lexicographic order; affects nothing; corrected in print at Blanchette–Fleury–Lammich–Weidenbach 2018, Section 3.2, proof of Theorem 1.

## For the human reviewers

- Scope: the subject is propositional logic as used in automated reasoning; all six sources are refereed computer-science publications (J. ACM, JAIR, J. Automat. Reason., SAT, IJCAR, CADE), and the Wetzler–Heule–Hunt source is a tool description (README lines 986–1000).
- Scope: Layers 4 to 6 state search procedures and proof formats as relations and predicates, with no executable procedure (README lines 9–10 and 912–914); whether that meets the rule against computational algorithms is yours to decide.
- Licence: three sources were read from pages I classified as authors' or institutional copies (hosts `homepage.cs.uiowa.edu`, `www.cs.utexas.edu`, `cca.informatik.uni-freiburg.de`); the other three from arXiv and HAL.
- Reuse: `Suggested.lean` was not compared with public Lean developments of SAT outside the pinned libraries; its `models_insert_or_models_update` has the hypothesis shape of Lean core's `Std.Sat.CNF.exists_sat_add_of_rat`, which the README discloses (lines 939–941).
