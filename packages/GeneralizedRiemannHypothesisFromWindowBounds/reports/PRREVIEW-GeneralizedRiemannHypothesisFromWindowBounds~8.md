# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #2887 at 885e625)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the seven lines changed since `cfcb276`: 6.26 now restates `SieveApplications.linnik_exceptional` as SieveMethodsAndPrimePatterns §2.9 states it, and gives the pointwise statement as a separate consequence; both follow from the bound `leastNonresidue p ≤ C (log p)²`. The title and description agree with this head. There is one format note, carried from the previous review, not blocking. This review does not confirm the Riemann hypothesis: the headline rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on a formal proof whose source could not be read, which, with its licence and the scope, is left to the human reviewers.

## N01 — The family index still dates the announcement

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (lines 10–11) says the proof was "announced on 20 November 2026"; this folder's References and the description give the year alone. The text at the cited address carries no date of its own, so the index would read the same as the roadmap with "announced in 2026".

## Deferred findings

- D01 — stands

## Previous findings

The previous report (of `cfcb276`) had no finding; its two small corrections and its format note are accounted for here.

- C01 — repaired: 6.26 (lines 2127–2130) now reads "for each `ε > 0` there is `C_ε` such that for every `N ≥ 2` at most `C_ε` odd primes `p ≤ N` have `leastNonresidue p > N^ε`", the supplier's statement; the pointwise form is a separate consequence.
- C02 — not repaired: deferred (D01). The description now says the copies of the index are not identical and names pull request #2954, so its own sentences are true; the order of the entry across the copies is outside this folder.
- N01 — not repaired: the index still reads "announced on 20 November 2026" (N01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.26, pointwise consequence (changed) | `C (log p)² < p^ε` for large `p`; odd `p ≤ 10⁶` | `sup q(p)/(log p)² = 1.657` at `p = 3` (`q = 2`); with `C = 1.657`: last crossing `3.7·10¹²` (`ε = 1/4`), `7.5·10⁴¹` (`ε = 1/10`) | finitely many exceptions; true | none |
| 6.26, `linnik_exceptional` as restated (changed) | supplier text (SieveMethodsAndPrimePatterns README on main, line 2364); `ε ≥ 1`; `N = 2`; `N ≤ 10⁶` | identical quantifiers (`∀ε ∃C_ε ∀N ≥ 2`, `p ≤ N`, `N^ε`); `p ≤ N` gives `q(p) ≤ C (log N)² < N^ε` for `N ≥ N₀(ε)`, so `C_ε = π(N₀)`; `ε ≥ 1`: `q(p) < p ≤ N^ε`, count 0; `N = 2`: no odd prime; counts at `ε = 1/4`: 3, 5, 66, 15 for `N = 10, 10², 10⁴, 10⁶` | follows from the bound; restatement equals the supplier's | none |
| 6.26, `leastNonresidue` (cited by the change) | supplier definition (line 2339); `p = 3, 7`; `p = 2` | `q(3) = 2`, `q(7) = 3`, `q(2) = 0` by convention; statement is over odd primes, so the junk value is not used | consistent | none |

The rows for the untouched statements stand as in the previous review, of `cfcb276`.

- Source locators checked against the text: none in the changed passage (it cites a roadmap section, no outside source).
- Library declarations opened at the pins: none needed by the change; `SieveApplications.leastNonresidue` and `SieveApplications.linnik_exceptional` are names of SieveMethodsAndPrimePatterns §2.9 (on main, heading at line 2285, items at lines 2339, 2364), not library declarations, and the README's supplier contract (line 2710) says so.
- Cross-roadmap citations resolved: 1 section (SieveMethodsAndPrimePatterns §2.9 on main; no open pull request changes or drops it); QuasiRiemannHypothesis §§11.2, 11.3 are untouched by the change.
- Title and description read against the head: 11 theorems and 3 definitions in `Suggested.lean` (14 declarations) as stated; the seven named declarations exist; the FrobeniusRestrictedRieszSums entry stands after ThetaLiftsForDefiniteUnitaryGroups in this index (line 139) and after QuadraticTwistSelectionOverPrimes in 31 of the 40 other copies read; pull request #2954 is open; the suppliers named agree with the supplier contracts (lines 2473–2725). No sentence is contradicted and no change is left unstated.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 170 roadmaps, 1994 edges, 0 problem(s)`. No change outside the folder and the family index; the diff since `cfcb276` touches the README only.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else; the file is unchanged since `cfcb276`, so the signatures and the one-tactic probe stand.
- Duplication: the change adds no statement of its own; it cites the supplier's theorem by name and section.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitNumberFields, QuasiRiemannHypothesis, RieszSumsOverPrimesAndExceptionalZeros, ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitMultiplicativeFunctions (as in the previous review; for this change, SieveMethodsAndPrimePatterns §2.9); shared objects and owners unchanged: the predicates, the bundled primitive Dirichlet character and the Riesz remainder (RiemannHypothesisStatementsAndConsequences), `HasWindows` and the windowed Landau theorem (PositivityOfDirichletSeriesWithKernels), the cyclic family (FrobeniusRestrictedRieszSums), the window bounds (ThetaChainsAndFrobeniusPrimeSums), the least nonresidue and Linnik's theorem (SieveMethodsAndPrimePatterns), the conditional explicit theorems (their roadmaps).

Source independence: changed passages only: 1 passage compared with 1 text (SieveMethodsAndPrimePatterns §2.9, a roadmap), the shared wording is the statement's quantifiers, which the mathematics forces; largest share FormalProof, 31 of the 33 locators into non-roadmap sources; contents compared with FormalProof: not possible, its text and table of contents could not be read; no layer added, removed or reordered.

Research link: Layers 1–3 are Landau's theorem (Landau 1905) and localized oscillation (Kaczorowski–Pintz 1986–87); Layer 6 feeds explicit estimates such as Schoenfeld's, Büthe's and Bach–Sorenson's (1996); the headline rests on Alpöge's announcement of 2026, unrefereed. From the README's references and the announcement read.

## Not verifiable

- `[FormalProof]`: no text of the Lean source was available to read; every file path, declaration name and "binder for binder" attribution is unchecked.
- ThetaChainsAndFrobeniusPrimeSums §10.11 and PositivityOfDirichletSeriesWithKernels §§6.4, 6.8, 6.9: read as statements at their open heads in the previous review; their proofs are those roadmaps'.
- Whether the heads of this pull request and of #2954 still conflict in the family index was not recomputed; the description says they do, as the previous review found.
- The date of the announcement: not in its text (N01).

## Source issues

- none

## For the human reviewers

- **Scope.** The headline targets are `RiemannHypothesis` and its Dirichlet form. Their support is `[FormalProof]` and an announcement (Announcement lines 9–13, 76: Lean only, no written proof); no refereed source states them.
- **Scope.** `Suggested.lean` line 190 states `theorem riemannHypothesis : RiemannHypothesis` with `sorry`. Its route is ThetaChainsAndFrobeniusPrimeSums §10.11 through 4.2; the reviews checked that deduction, not §10.11.
- **Licence.** `[FormalProof]` is an unpublished formalisation; the announcement (line 53) gives archive parts on the author's site and states no licence; the README names a repository `leanprover-community/riemann-hypothesis` that the announcement does not mention.
- **Licence.** The module docstring of `Suggested.lean` (lines 18–20) says three declarations are "binder for binder" theorems of the formal proof; the file there was not read.
- **Not tested.** `[FormalProof]` has the largest share of the source locators; wording and arrangement were not compared with it. The description and the family index `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 9) say "The family follows the formal Lean proof".
