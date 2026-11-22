# Review of RandomGraphs (pull request #1223 at 1481b8d)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the nine lines changed since `0c208ea` finds the one small correction of the previous review repaired, with no new problem introduced, and no finding. The sentence on SaturationAndQuantifierElimination under "Downstream consumers" now agrees with that roadmap at its head. Two format notes on `Suggested.lean` are carried over unchanged; neither blocks. Left to the human reviewers, as before: the requirement that the two decision maps be executable definitions, the link to a third-party copy of Fagin's paper, the provenance repositories, and the four sources whose texts could not be read.

## N01 — The two quantifier-elimination definitions stand under the Layer 4 section comment of `Suggested.lean`

`Language.Theory.IsQFEquivalent` and `Language.Theory.HasQuantifierElimination` (lines 250, 256) come before the comment "Finite-rank agreement and genuine QE targets (Layer 5)" (line 260); the README states them in 5.2.

## N02 — "Any type of free variables" in a docstring, `{α : Type}` in the definition

The docstring of `radoAxioms_hasQuantifierElimination` (`Suggested.lean:503–505`) says "for formulas in any type of free variables"; `HasQuantifierElimination` (line 258) quantifies over `{α : Type}`, universe `0` only. "Any type in `Type`" would match.

## Previous findings

- C01 — repaired: "consumes the effective coding of first-order formulas of 5.2; it also states the two theory-level quantifier-elimination definitions (its Layer 2.1), which are owned here" (README lines 1560–1562).
- N01 — not repaired: the two definitions still precede the Layer 5 section comment (`Suggested.lean:250, 256, 260`); written again as N01.
- N02 — not repaired: the docstring at `Suggested.lean:503–505` still reads "any type of free variables"; written again as N02.

## Verified sound

| Statement | Instances tried | Left / computed | Right / claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| "Downstream consumers", sentence on SaturationAndQuantifierElimination (cites 5.2 coding and the QE definitions) | that roadmap at its open head: its Layer 2.1, its section "From RandomGraphs", its `Suggested.lean` | Layer 2.1 (its README lines 219–222) states `Theory.IsQFEquivalent`, `Theory.HasQuantifierElimination`; "From RandomGraphs" consumes §5.2 coding only; local copies at its `Suggested.lean:143, 147` in its own namespace | "consumes the coding of 5.2; also states the two definitions (its Layer 2.1)" | true; no shared fully qualified name | none |
| 5.2 `IsQFEquivalent`, `HasQuantifierElimination` (the definitions the sentence names) | `∃y Adj(x₀,y)` modulo `T_R`; modulo simple graphs on `K₁`, `K₂`; binder of `α` here and in the other roadmap's copy | `⊤` modulo `T_R`; formula F on `K₁`, T on `K₂` while QF formulas in `x₀` are constant; `{α : Type}` in both, `Type w` / `Type*` in `IsQFEquivalent` | QF-equivalent; not QF-equivalent; same shape | true | N02 |
| "Downstream consumers", sentence on AxKochenErshov | that roadmap at its open head, lines 116–117 and its section "From RandomGraphs" | translations "computable on the codes of formulas (RandomGraphs' `boundedCode` …)"; supplier section cites §5.2 | "uses the same §5.2 coding to state that its language translations are computable on formula codes" | true | none |

The rows for the untouched statements stand as in the previous review, of `0c208ea`.

- Source locators checked against the text: 0 this round (the diff adds or changes no locator and no sampled statement; the sample's sections 0.1–11.2 are untouched).
- Library declarations opened at the pins: 0 new; `IsQFEquivalent` and `HasQuantifierElimination` occur in neither pinned library, as the README's ownership sentence presumes.
- Cross-roadmap citations resolved: 2 at open heads (SaturationAndQuantifierElimination Layer 2.1 and "From RandomGraphs"; AxKochenErshov "From RandomGraphs" and its conventions); 0 unresolved. Both are consumers placed after this roadmap; neither is cited as a supplier.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder (3 files, all in `TauCetiRoadmap/RandomGraphs/`).
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, 75 `sorry` warnings, no other message; the file is unchanged since `0c208ea`.
- Pull request text against the head: adds a roadmap; the last revision line ("ownership of the quantifier-elimination definitions and the downstream consumers of the formula coding") covers this change; the count of 75 and the pins agree; nothing to correct.
- Headline theorems: unchanged since the previous review (zero–one law, rank-uniform error bound, joint stabilization, Fraïssé existence and rooted comparison; all stated).

Overlap check: read SaturationAndQuantifierElimination and AxKochenErshov at their heads again; HanfNumbers, InfinitaryModelExistence, CountableModelCounting, QuasirandomGraphs, InfinitaryLogic, CountableStructureSpaces and CountableStructureSpacesPartII stand as read in the previous review. `IsQFEquivalent`, `HasQuantifierElimination` and the finite-variable reduction: shared with SaturationAndQuantifierElimination, owner RandomGraphs as the earlier roadmap, and the README now says so in both places; the citation is owed in the later roadmap. The effective formula coding: owner RandomGraphs, cited by both. Nothing else shared.

Source independence: changed passages only; 1 passage (the rewritten sentence of "Downstream consumers") compared with 0 sources, since it describes other roadmaps and cites no source; none shared. Largest share cameron2013, 8 of 24 page locators in the layers, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again. The texts of Spencer, Hodges, Bollobás and Fagin could not be read.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976; Cameron 2013, Theorem 6), with Spencer's (2001) dense varying-parameter laws, Fraïssé's theorem as in Hodges (1993) and the Erdős–Rényi (1960) and Bollobás (2001) Poisson limits as boundary cases; rests on the README and on the Cameron and Erdős–Rényi texts.

## Not verifiable

- Spencer 2001 (Theorems 0.1.2, 0.1.5, 2.2.3, 2.3.1–2.3.2, 9.1.3–9.1.4, Definition 2.3): Springer book, paywalled; only its public contents page was read (previous review; not reopened).
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
