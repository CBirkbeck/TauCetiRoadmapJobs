# Review of LogicAndDefinabilityInNumberTheoryPartII (pull request #2438 at cbf44f4)

**Verdict:** accepted

Incremental re-review of the 16 lines changed since `05885da`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean:66` "(Rumely, Introduction I, p. 195, and §2, Theorem 1, p. 204)"; `README.md:337` adds "§2, Theorem 1, p. 204" and limits Poonen's Theorem 2.2 to "(2), (4), (5) and the definitions of `ℤ` and `ℕ` in (3)".
- R02 — repaired: `README.md:3` "continues LogicAndDefinabilityInNumberTheory, whose theory of interpretations (its Layer 0, §§0.1–0.4) covers interpretations on definable quotients and their composition but neither homotopies of interpretations nor bi-interpretations".
- R03 — repaired: description, `roadmap-summary` block: "The earlier logic roadmap builds interpretations on definable quotients but no bi-interpretations, and never studies finitely generated fields as a class."

## Verified sound

| Target | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| `exists_formula_valuationSubring_ne_top` (docstring changed) and README 0.7(1) | `ℚ`; `𝔽₂(t)`; a finite field; a parameter choice where Rumely's predicate is not a ring | fibres `ℤ_(p)`, no archimedean fibre; the place at infinity occurs; `δ = 0 ≠ 1`, vacuous; Rumely's fibre is the whole field, the guard of 0.3 makes it empty, matching `= ∅ ∨ O ≠ ⊤` | holds; rumely lines 408–412 give both clauses, printed p. 204 (text page 10 of 195–217) |
| README 0.7, Poonen clause | items of Poonen's Theorem 2.2 set beside README (1)–(6) | Poonen (1) = README (2); (3), (4) = `ℤ`, `ℕ` of README (3), ring of integers absent; (5) = README (4); (6)–(8) = README (5); none for README (1), (6) | the clause is exact; poonen_uniform lines 113–125, printed p. 3 |
| README summary, first sentence | layers and sections of LogicAndDefinabilityInNumberTheory at its open head | Layer 0 = §§0.1–0.4; §0.2 is "Semantics and composition of interpretations"; no homotopy of interpretations or bi-interpretation anywhere; Layers 1–7 follow | the sentence is exact, and agrees with gap:biinterpretation-homotopy |
| Pull request title and description | each sentence against the head and the change against the base | adds a roadmap (1808 insertions, 0 deletions, nothing removed); end theorem, `H_d` exception in characteristic two above dimension three, imported Pfister forms, henselizations, surface resolution and interpretations, the two families of headlines left out of Lean: all as in `README.md:3–25` and the module docstring | no sentence contradicted, no change left unstated |

The rows of the previous review, of `05885da`, stand for every statement this change does not touch.

- **Gate.** Every check of the push gate passes at this head (the worker's run, build included). Dependency check, run again: "depcheck: 258 roadmaps, 2463 edges, 0 problem(s)". No change outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean`: the 9 `declaration uses sorry` warnings only. The change touches one docstring and no statement; the elaborated type of `exists_formula_valuationSubring_ne_top` in `signatures.md` equals README 0.7's statement.
- **Sources.** 4 locators read against the text: rumely Introduction I–III (lines 22–32, p. 195), rumely §2 Theorem 1 (lines 408–412, p. 204), poonen_uniform Theorem 2.2 (lines 113–125, p. 3), the references entry for rumely.
- **Cross-roadmap citations.** 1 resolved again: LogicAndDefinabilityInNumberTheory, Layer 0 and §§0.1–0.4, at its open head. The resolver lists no cross-roadmap citation as missing; the 5 Lean names it lists are supplier declarations of other roadmaps, as in the previous review.
- **Overlaps.** No other open pull request changes this roadmap; no cited id is dropped; no closest roadmap by results.
- **Declared gaps.** Unchanged by the diff; the new summary sentence states the same boundary as gap:biinterpretation-homotopy.
- **Padding and headlines.** No declaration added or removed; the previous probe stands.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations (scopes as in the previous review; the diff changes no ownership). Kronecker dimension: QuadraticFormInvariantsPartII §5.7 owns it. Threefold resolution: AdicCoefficientsAndComparisonsPartII §PA.0.12 owns the proper form, 1.3b here the projective form over fields. Nothing else shared.

Source independence: changed passages only; 3 passages compared with 2 sources (rumely, poonen_uniform), none shared; largest share dittmann_pop, 56 of 159 locator groups, as before; the diff adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

## Not verifiable

- kato_hasse, merkurjev_suslin, moret_bailly, lenstra_cm: uncertified, cited by locator only; untouched by this change.

## Source issues

- none

## For the human reviewers

- none
