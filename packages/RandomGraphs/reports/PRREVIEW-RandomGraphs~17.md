# Review of RandomGraphs (pull request #1223 at 99192ce)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the nine lines changed since `1481b8d` (all in `Suggested.lean`) finds both format notes of the previous review repaired, with no new problem and no finding. The two quantifier-elimination definitions now stand under the Layer 5 section comment, and the docstring of the theory-level theorem now states the universe its definition quantifies over. One format note on the matching README sentence, not blocking. Left to the human reviewers, as before: the requirement that the two decision maps be executable definitions, the link to a third-party copy of Fagin's paper, the provenance repositories, and the four sources whose texts could not be read.

## N01 — "Every formula" in 5.2, `{α : Type}` in the definition

The README sentence on the theory-level property (5.2, lines 702–703) says "every formula is `Language.Theory.IsQFEquivalent` modulo `T_R`", while `HasQuantifierElimination` (`Suggested.lean:258`) quantifies over variable types in `Type` only, as the theorem's docstring now says. "Every formula whose free variables form a type in `Type`" would match; the statement for other universes follows by the reduction to finite variable types the sentence already names.

## Previous findings

- N01 — repaired: the comment "Finite-rank agreement and genuine QE targets (Layer 5)" is at `Suggested.lean:248`, before `IsQFEquivalent` (line 252) and `HasQuantifierElimination` (line 258).
- N02 — repaired: "for formulas whose free variables form any type in `Type`" (`Suggested.lean:503–506`), agreeing with `∀ {α : Type}` at line 260.

## Verified sound

| Statement | Instances tried | Left / computed | Right / claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 5.2 `radoAxioms_hasQuantifierElimination` (docstring changed; statement unchanged) | `α = Empty`; `α = Fin 1` with `∃y Adj(x₀,y)`; `α = ℕ`; elaborated type | Over `Empty` QF formulas are Boolean in `⊥`, so the claim is completeness of `T_R`; `⊤` by `E_{1,0}`; finitely many variables occur, reduce to `Fin m`; type is `HasQuantifierElimination radoAxioms` | holds for all `α : Type`, as docstring says | true | none |
| 5.2 `HasQuantifierElimination`, `IsQFEquivalent` (moved under the Layer 5 comment; bodies unchanged) | `T_R`; `simpleGraph` with `∃y Adj(x₀,y)` on `K₁`, `K₂`; an unsatisfiable theory | has it; formula false on `K₁`, true on `K₂`, QF formulas in `x₀` constant (only atoms `x₀ = x₀`, `Adj(x₀,x₀)`); every formula ⇔ `⊥` | has it; fails; has it (README Checks, lines 730–743) | true | N01 |

The rows for the untouched statements stand as in the previous review, of `1481b8d`.

- Source locators checked against the text: 0 this round (the diff changes a section comment's place and one docstring; no locator and no statement). The sample's section 5.2 is touched only in that docstring; its other sections are untouched.
- Library declarations opened at the pins: 0 new; `IsQFEquivalent` and `HasQuantifierElimination` still occur in neither pinned library.
- Section comments of `Suggested.lean` at this head, in order: Layer 0, Layers 1–3, Layer 4, Layer 5, Layers 6–7, Layer 8, Layer 8.2, Layer 9, Layer 10, Layer 11; README order.
- Cross-roadmap citations: none added or changed; none unresolved.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder (3 files, all in `TauCetiRoadmap/RandomGraphs/`).
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, 75 `sorry` warnings, no other message.
- Pull request text against the head: adds a roadmap; the last revision line names "layer order in `Suggested.lean`"; the count of 75 and the pins agree; nothing to correct.
- Headline theorems: unchanged (zero–one law, rank-uniform error bound, joint stabilization, Fraïssé existence and rooted comparison; all stated).

Overlap check: no layer, statement or citation changed, so SaturationAndQuantifierElimination, AxKochenErshov, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, QuasirandomGraphs, InfinitaryLogic, CountableStructureSpaces and CountableStructureSpacesPartII stand as read in the previous reviews. `IsQFEquivalent`, `HasQuantifierElimination` and the finite-variable reduction: shared with SaturationAndQuantifierElimination, owner RandomGraphs as the earlier roadmap. The effective formula coding: owner RandomGraphs. Nothing else shared.

Source independence: changed passages only; 1 passage (the rewritten docstring) compared with 0 sources, since it describes this file's own definition and cites no source; none shared. Largest share cameron2013, 8 of 24 page locators in the layers, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again. The texts of Spencer, Hodges, Bollobás and Fagin could not be read.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976; Cameron 2013, Theorem 6), with Spencer's (2001) dense varying-parameter laws, Fraïssé's theorem as in Hodges (1993) and the Erdős–Rényi (1960) and Bollobás (2001) Poisson limits as boundary cases; rests on the README and on the Cameron and Erdős–Rényi texts.

## Not verifiable

- Spencer 2001 (Theorems 0.1.2, 0.1.5, 2.2.3, 2.3.1–2.3.2, 9.1.3–9.1.4, Definition 2.3): Springer book, paywalled; only its public contents page was read (earlier review; not reopened).
- Hodges 1993 (Theorems 7.1.2, 7.1.7, Lemmas 7.1.3–7.1.6) and Bollobás 2001 (Theorems 1.21–1.22, 4.1, Corollary 4.9): Cambridge books, no open copy.
- Fagin 1976 (Theorems 1–2, Corollaries 3, 5): the DOI resolves to a paywalled publisher page; the copy the README links is on a third party's course page and was not read.

Automatic checks set aside as false positives: the lead that four backticked names occur nowhere in the libraries (they are this roadmap's own declarations in `Suggested.lean`), and the lead that seven graphon theorems lost a probability-measure binder (the binder is in each elaborated type).

## Source issues

- none

## For the human reviewers

- **Scope (policy).** `TauCetiRoadmap/RandomGraphs/README.md:659–663` requires the quantifier-elimination and decision maps as explicit executable Lean definitions, beyond the existence theorems `Suggested.lean` states; whether a roadmap may require an implementation is yours to decide.
- **Licence.** `TauCetiRoadmap/RandomGraphs/README.md:1670` links Fagin's 1976 JSL paper to a copy on another person's university course page, not the publisher or an author's page.
- **Licence.** `TauCetiRoadmap/RandomGraphs/README.md:1539–1550` lists the author's repositories `cameronfreer/computable-model-theory` and `cameronfreer/vaught-conjecture-counterexample` as provenance; their licences were not read.
- **Not tested.** Spencer (5 of 24 page locators), Hodges (4), Bollobás (3) and Fagin (3) could not be read: their locators and wording were not compared; only Cameron and Erdős–Rényi were.
