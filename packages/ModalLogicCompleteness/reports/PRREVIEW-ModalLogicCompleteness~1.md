# Review of ModalLogicCompleteness (pull request #2703 at 38a6f66)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed by hand or in Lean on its degenerate and convention-fixing instances (Geach parameters, convergence conditions, subformula counts, the filtration examples, the empty frame and the empty variable type) and all agree with the text; `Suggested.lean` elaborates with `sorry` as its only warning and no theorem closes in one tactic. There are two small corrections and two format notes, none blocking. One thing is left for the humans: neither cited text (Zach's book, Garson's encyclopedia entry) could be read through the sources service, so no source locator was checked against its text, and the wording and arrangement comparison with Zach was not made.

## C01 — The Check of 2.1 points at the wrong Check of 1.2

In the second Check of 2.1 (README line 191) the frame `0 → 1` with `p` true only at `0` is called "the countermodel for the third Check of 1.2". The third Check of 1.2 is the one about a one-element type of variables and substitution instances, which has no countermodel; the frame refutes `Derives ∅ {p} (□p)`, which is the fourth Check of 1.2 (line 118). A reader following the pointer lands on an unrelated statement. Write "the fourth Check of 1.2", or "the last Check of 1.2".

## C02 — "Gives the same set" in the route of 3.1 has no referent

The route of 3.1 ends (line 307): "the enumeration of Zach, Theorem 4.3, pp. 63–64, gives the same set without choice". Zorn's lemma produces some maximal consistent extension, not a particular one, so there is no set for the enumeration to reproduce; the two constructions may give different extensions of the same `Γ`. What is meant is that for countably many variables the enumeration produces a maximal consistent extension without Zorn's lemma. Writing "gives a maximal consistent extension without Zorn's lemma" says that.

## N01 — Three Checks report a test campaign instead of an instance

The second Check of 4.2 ("On random models with up to six worlds … were checked"), the last clause of the second Check of 2.3 ("this was checked on all relations on at most three points") and "(checked on at most four worlds)" in 4.3 describe what was run, not something a reader can recompute; the 4.2 one also uses "the coarsest" filtration, which the section never defines. A definite instance in each place (as the first Check of 4.2 already gives) would serve; the exhaustive count in 2.2 is fine as it stands, since it says exactly what was enumerated.

## N02 — The References entry for Lemmon and Scott narrates how the roadmap was written

"the book was not consulted and no locator into it is given" (line 562) is a statement about the drafting, not about the mathematics. "Cited as Garson attributes it" carries the same information.

## Questions for the author

- The correspondence and canonicity of the general Geach schema (2.2, 3.3, 3.4) are two of the headline results, and their only locator is §9 of an encyclopedia entry, with the primary book named but not opened. Does that entry prove them, or only state them? I could not read it (see below), so I could not tell. If it only states them, a text that proves the general `(h, i, j, k)` case, cited with theorem and page, would give these targets a locator of the same kind as the others; the routes written in 2.2 and 3.3 are correct as they stand (I checked both).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `subformulas` | `□p → p`; `◇p → □◇p`; `p → p`; `□p → □□p` | Lean evaluation of the card: 3, 7, 2, 4; README says 3, 7, 2 and bound `2^4` | agree | none |
| 1.2 `IsTautology`, `Proves`, `Derives` | `□p → p` with `v(□p)=⊤, v(p)=⊥`; `□(p→p)`; one-element `α`, `□p → (□□p → □p)`; `Γ={p}`, `□p` | evaluation false; atom, so not tautology; antecedent forces `p ↦ □p`, consequent forces `p ↦ □□p`; frame `0→1` refutes `p → □p` at 0 | Checks true | none |
| 1.3 schemas as Geach instances | `(0,1,0,0)`, `(0,1,2,0)`, `(0,0,1,1)`, `(1,0,1,1)`, `(0,1,0,1)`, `(0,0,0,0)` | `geachFormula` reduces by `rfl` to `□φ→φ`, `□φ→□□φ`, `φ→□◇φ`, `◇φ→□◇φ`, `□φ→◇φ`, `φ→φ`; `axT = geachAxioms 0 1 0 0` by `rfl` | agree | none |
| 1.4 `proves_axT_union_ax5_iff` | frame `0→1, 1→1`; one-world frame, no arrow | euclidean (only pairs `(1,1)`), `0→1` without `1→0`; `□ψ` all true, `◇ψ` all false, `□⊥→⊥` false | Checks true; statement standard, both sides complete for equivalence relations | none |
| 2.1 `Sat`, `FrameValid`, `Entails` | dead-end world; empty frame; `W` in universe of `α` | `□⊥` true, `◇(⊥→⊥)` false; validity vacuous; canonical worlds have type `Type u` as `Entails` requires | consistent | C01 (pointer) |
| 2.2 `Convergent`, `relPow` | the four named tuples, proved in Lean from the definitions | `∀x, R x x`; transitivity; symmetry; `R x y → R x z → R z y`; `(0,1,0,1)`: `∃u, R x u` | agree with README | none |
| 2.2 `frameValid_geachFormula_var_iff` | converse with `V p = {u : y Rⁱ u}`; `i`,`k` swapped at `(0,1,2,0)` on `0→1→2, 0→2` | `◇ʰ□ⁱp` true at `x`, gives `u` with `z Rᵏ u`, `y Rⁱ u`; swapped condition needs `R 2 0`, absent | route sound; convention pinned | none |
| 2.2 `forall_frameValid_geachAxioms_iff` | `α` empty, 3-cycle, tuple `(0,1,0,0)` | rotation is a model automorphism, so `□φ ↔ φ` at each world; frame irreflexive | `[Nonempty α]` necessary and present | none |
| 2.3 `entails_equivalence_iff_universal` | both directions; empty `W`; equality on two points | universal ⇒ `Equivalence`; restriction to the class of `w` is universal and keeps truth at `w`; two-point equality not universal | true | none |
| 2.3 `not_exists_frameValid_iff_universal` | `φ` valid on universal frames; `ULift Bool` with `=` | then valid on all equivalence frames in `Type u`, so on equality, where `∀ x y, R x y` fails | true, also for empty `α` | none |
| 2.4 `entails_of_derives`, `frameClass` | `nec` on theorems only; reflexive closure of `0→1→2`, `p` at 0,1 | `FrameValid` closed under `nec`; `□p` true at 0, `□p` false at 1 (sees 2), so `□□p` false at 0 | Checks true | none |
| 3.1 `exists_isMaxConsistent_of_consistent` | chain union; `{□p, ◇¬p}`; inconsistent `Γ` | finite list lies in one chain member; `◇¬p = ¬□¬¬p`, `□p → □¬¬p` by rk; hypothesis excludes it | true for any `α` | C02 (wording) |
| 3.2 `sat_canonical_iff` | `Ax ⊢ ⊥`; `{□p, ¬p}` in K | no worlds, vacuous; true at dead-end world with `p` false, so extension has `□p`, not `p` | true; no substitution closure needed | none |
| 3.3 `convergent_canonicalRel` | `Ax = axT`; `Ax = ∅`, tuple `(0,1,0,0)` | reflexivity; `□p → p` not a K theorem, canonical frame irreflexive | hypothesis is used, not vacuous | none |
| 3.4 `derives_geachSystemAxioms_iff` | `S = ∅`; `Γ = ∅`; soundness with empty `α` | all frames (K); weak completeness; convergence ⇒ schema valid needs no variable | true | none |
| 3.4 `ModalSystem.derives_iff_entails` | six systems against convergence classes | K4 class equals `Convergent 0 1 2 0`; S5: reflexive + euclidean equals `Equivalence` | classes match axioms | none |
| 4.1 `IsFiltration`, `sat_filtration_iff` | frame `1→0, 1→2, 2→0`, `Φ={p}`; `Φ={□□p}` on dead-end world | classes `{0,1}`, `{2}`; loop is a filtration (`□p` true), filtered `□□p` false, original true | closure hypothesis necessary | none |
| 4.1 `card_quotient_agreeSetoid_le` | same example; `Φ = ∅` | 2 classes, bound `2^1 = 2`; one class at most, bound `2^0 = 1` (0 classes if `W` empty) | true | none |
| 4.2 filtrations keeping frame conditions | finest filtration of the 4.1 example; Lemmon's | arrows `{0,1}→{0,1}`, `{0,1}→{2}`, `{2}→{0,1}`, no `{2}→{2}`: not transitive; Lemmon's relates all pairs | Checks true; each filtration verified from definitions | N01 |
| 4.3 `ModalSystem.proves_iff_forall_fin` | `□p → □□p` on path `0→1→2`, `p` at 1; `n = 0` | `□p` true at 0, `□p` false at 1; 3 worlds ≤ 16; `Fin 0` validates everything | true; route's filtration choice per system checked | none |
| 4.3 `proves_S5_iff_forall_fin_universal` | filtration of a universal model | `R x y` for all gives `R' [x] [y]` for all; universal ⇒ equivalence | true | none |

- Source locators checked against the text: 0 of 54 (49 into Zach, 5 into Garson §9); neither text could be read through the sources service.
- Library declarations opened at the pin: 7 (`Relation.Comp`, Logic/Relation.lean:144; `zorn_subset_nonempty`, Order/Zorn.lean:152; `Finite.of_injective`, Data/Fintype/EquivFin.lean:182; `Nat.card_le_card_of_injective`, SetTheory/Cardinal/Finite.lean:96; `Finset.card_powerset`, Data/Finset/Powerset.lean:102; `FirstOrder.Language.Theory.IsMaximal`, ModelTheory/Satisfiability.lean:456; Tau Ceti `ConsistencyProperty`, ModelTheory/ModelExistence).
- Duplication by object: no Kripke model, modal formula, necessitation rule or tautology predicate in the pinned Mathlib or Tau Ceti; no other roadmap, on main or open, mentions Kripke semantics or modal logic.
- Cross-roadmap citations resolved: 7 names of the scope section, all found (InfinitaryModelExistence Layer 7 is "projective classes and interpolation" on main); no supplier roadmap.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` gives 15 `sorry` warnings and nothing else; all 15 theorems tried with `rfl`, `simp`, `infer_instance` and `tauto` on a copy of the file, none closes. The 48 elaborated signatures were compared with the README statements: none lost a binder, generality agrees.
- Headline theorems (strong completeness for the six systems and for Geach systems, the correspondence in both forms, the finite model property with the bound and its universal form for S5, non-definability of universality) are all stated; the description's count of 15 theorems, 29 definitions and 3 inductive types is right.
- The automatic checks all passed on this head; none was set aside.

Overlap check: read PropositionalSatisfiability, HanfNumbers, InfinitaryModelExistence, SatisfiabilityComplexity (the third list is empty); nothing shared. PropositionalSatisfiability owns `PropForm`, propositional formulas without `□`, and clause sets; the modal `Formula` and its tautological instances are owned here.

Source independence: 0 passages compared with 0 sources, because neither Zach nor Garson could be read; largest share Zach, 49 of 54 locators; contents not compared with Zach's table of contents. By the README's own locators, Layers 1 and 2 each draw on Zach's chapters 1, 2 and 3, Layer 3 on chapters 3 and 4, Layer 4 on chapter 5 alone; the order of Layers 3 and 4 is forced by the *Needs* line of 4.3 (it uses 3.4).

Research link: The headline targets are the Geach-schema correspondence and canonicity of Lemmon and Scott (1977) and the filtration method of Segerberg (1971), as the README's References name them; the line rests on the README alone, no source was read.

## Not verifiable

- Zach, *Boxes and Diamonds* (all 49 locators, including the whole seeded sample 1.1–4.3): the sources service refused the Open Logic Project's host as being in no licence class, refused it as an author page, and resolved the citation by title to an unrelated page.
- Garson, "Modal Logic", §9 (5 locators: the Geach schema, hijk-convergence, correspondence, canonicity): the sources service refused the encyclopedia's host as being in no licence class.
- Lemmon and Scott (1977): named without locator; not looked for.

## Source issues

- none

## For the human reviewers

- **Not tested.** Zach's book carries 49 of the README's 54 locators and could not be read through the sources service (host `bd.openlogicproject.org`, in no licence class); wording and arrangement were not compared with it, and no locator was checked.
- **Licence.** The README (References, lines 554–559) gives Zach as Creative Commons Attribution on the Open Logic Project's site and Garson as the Stanford Encyclopedia's site; neither host's status could be settled by the service.
- **Scope.** The sources are an open textbook and an encyclopedia entry; the one research monograph named (Lemmon and Scott 1977) was not consulted and has no locator (References, lines 560–564). The headline theorems are the standard completeness and finite-model results for K, T, K4, S4, KTB, S5.
- **Licence.** `Suggested.lean` was not compared with public Lean formalisations of modal logic; the description says no outside formalisation was used.
