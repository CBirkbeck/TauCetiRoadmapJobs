# Review of HanfNumbers (pull request #1319 at 774a18b)
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 29 lines changed since `5def5c2`: the three remarks of the previous review are repaired and the repairs introduce no new problem. The restated start condition of 3.3 is true as written (it was proved on a copy of the file), is not closed by any one tactic, and now instantiates to the condition the construction of 3.4 starts from. There are no findings, no small corrections and no format notes; the two points left for the human reviewers (the 2013 notes as the located source, the port from the author's own formalization) stand as before.

## Previous findings

- C01 — repaired: `isCofinallyApproximated_start {σ ψ}` assumes models with "SentenceInf.Realize σ N ∧ SentenceInf.Realize ψ N ∧ ℶ_ α ≤ #N" and concludes `IsCofinallyApproximated σ {⟨0, ψ⟩, ⟨2, disEq⟩} ∅`; the README bullet of 3.3 applies it at `σ*`, `φ'`.
- C02 — repaired: the docstrings now read "It is the `n = 0` case of `erdos_rado`, kept as the base of the README's Erdős–Rado induction" and "It is the countable-language specialization of `morley_omitting_types`, kept as the README's corollary of 3.4".
- N01 — repaired: the module docstring says "Three interface definitions occur in no statement here: `IsIndiscernibleOn`, `morleySeed` and `hanfNumber`, which the README uses in 1.1, 1.3 and 3.1 and in their Checks."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| `isCofinallyApproximated_start` (3.3), as restated | full proof on a copy; `σ := σ*`, `ψ := φ'`; `ψ := σ`; one-tactic probes | `H = univ`, `#H = #N ≥ ℶ_α`; unique 0-tuple gives `ψ`; injective `t` gives `t 0 ≠ t 1`; copy elaborates with 23 `sorry` warnings | True; yields `{φ', disEq}` in models of `σ*`; `ψ := σ` recovers the earlier form; `simp`, `rfl`, `infer_instance`, `simpa using h` all fail |
| README 3.3 bullet: "the hypothesis holds because every model of `σ*` satisfies `φ'`" | `σ* = φ' ∧ sk(Γ₀)` (3.2) | a model of the conjunction satisfies its first conjunct; 3.2 supplies models of `σ*` of size `≥ ℶ_α` on the carrier of `M` | True |
| `partitionRel_succ_one` docstring: the `n = 0` case of `erdos_rado` | `n = 0` in `erdos_rado` | `iteratedTwoPow κ 0 = κ`, exponent `0 + 1 = 1`: `PartitionRel (succ κ) (succ κ) 1 κ` on both sides | True |
| `morley_omitting_types_of_countable` docstring: specialization of `morley_omitting_types` | countable symbols | `T` and each `p.2` are sets of first-order formulas over countably many symbols, hence countable; remaining hypotheses and conclusion identical | True |
| Module docstring: three definitions occur in no statement | search of the file for each name | `IsIndiscernibleOn`: docstring and line 112 only; `morleySeed`: docstring and line 141; `hanfNumber`: docstring and line 293; README 1.1, 1.3, 3.1 each define one and carry Checks | True |

The rows for the untouched statements stand as in the previous review, of `5def5c2`.

- Source locators checked against the text: 1 (the proof of Theorem 5.2, MarkerNotes2013 lines 1896–1916, beside the changed bullet of 3.3); the diff adds or changes no locator, and no target of the seeded sample has a changed source claim (0.2's change is a docstring cross-reference).
- Library declarations opened at the pin: `SentenceInf.Realize` (`TauCeti/ModelTheory/Infinitary/Semantics.lean:248`, satisfaction under the empty valuation, which is what makes the arity-0 member of `pos` agree with the hypothesis) and `exists_wellFoundedLT` (used in the proof on the copy).
- Cross-roadmap citations: the diff adds none; the overlap report lists no dropped id, no second copy and no conflicting open pull request.
- Automatic checks at this head: all passed. Elaboration rerun: 24 `declaration uses sorry` warnings, nothing else; no `set_option`, no sorry'd data; imports unchanged.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Pull request text: the title and description agree with this head (a new roadmap, 24 warnings, four Tau Ceti imports); the description names this change ("a second sentence for the start condition of 3.3, docstrings for two specializations and three interface definitions").
- Headlines: unchanged; the diff adds or removes no declaration (47 declarations, as before).

Overlap check: read InfinitaryModelExistence, InfinitaryLogic and CountableModelCounting as in the previous review; nothing shared, and the change adds no object.

Source independence: changed passages only; 3 passages compared with 1 source (the start-condition bullet of 3.3 and the two docstrings of the start condition and the module, beside MarkerNotes2013 lines 1896–1916), none shared; largest share MarkerNotes2013, 25 of 28 locators; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: The headlines are Morley's computation of the Hanf number of Lω₁ω as ℶ_ω₁ (Morley 1965; Hanf 1964), stated as Theorem 1.6.2 of Keisler–Knight 2004, and the small-model and complete-sentence results of Marker's lectures (2013 notes, 2016 book), on Ehrenfeucht–Mostowski 1956 and Erdős–Rado 1956; rests on the README's references and the two texts read.

## Not verifiable

- Marker's 2016 book, Keisler 1971, Morley 1965, Hanf 1964, Erdős–Rado 1956 and Kanamori: not opened; the README cites them without theorem locators.
- The statements about `cameronfreer/infinitary-logic` in the Provenance section and the description's integration run on the author's fork: outside the pull request's head, not opened.

## Source issues

- **Error** in MarkerNotes2013 at Theorem 5.11, printed page 59: the source says a sentence with arbitrarily large models has a model of every cardinality κ realizing countably many types; it should be every infinite κ, since "infinitely many elements" has no finite model; affects a stated result.
- **Error** in MarkerNotes2013 at Exercise 5.12, printed page 59: the source says every cardinal κ carries a linear order that is n-transitive for all n; it should be every infinite κ (or κ ≤ 1), since a finite order has only the identity automorphism; affects a stated result.

## For the human reviewers

- Scope: 25 of the README's 28 source locators go to Marker's 2013 lecture notes on the author's page (MarkerNotes2013), not to the refereed 2016 book, whose numbering was not compared (README, References section).
- Licence: the README's Provenance section says the Lean is ported from `cameronfreer/infinitary-logic`, Apache-2.0, by the pull request's author; an earlier review matched `HighlyOrderTransitive` in `Suggested.lean` to that repository. Attribution is yours to assess.
