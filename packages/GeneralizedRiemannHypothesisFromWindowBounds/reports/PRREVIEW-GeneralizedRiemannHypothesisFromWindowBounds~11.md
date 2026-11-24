# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** This is an incremental re-review of the 15 lines changed since `71bbefa`. All of them rewrite the `*Corollary of:*` convention, and the rewrite is sound. It no longer describes an interim proof to be replaced later, and it agrees with the two sections that carry the line: 0.6 follows from ZerosOfLFunctions §8.6a, whose normalisation I recomputed at `x = 2`, and 3.4 follows from AnalyticNumberTheoryPartI §1.6. The one finding is carried over and still blocks: the revision deletes Layer 6 (§§6.1–6.32) and §§5.4–5.6 of the README on `main`, with four Lean statements, instead of keeping them under their ids. There are three small corrections (two carried over, one new), no format notes, and three questions for the human reviewers: the record rule, the scope, and the licence of the formal proof.

## R01 (P1) — The revision still removes Layer 6 and §§5.4–5.6 of the README on `main` instead of keeping them under their ids

This roadmap's progress record (its `STATUS.md` and the structure page) is keyed by the layer and section ids of the README on `main`. After the merge, "Layer 6" and items 5.4–5.6 no longer exist here. Their 35 items reappear in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions under other numbers (5.4–5.6 there are §§0.1–0.3), with no table of the former numbering. At the merge base the README has 5.4 (line 891), 5.5 (line 908), 5.6 (line 935) and Layer 6, with §§6.1–6.32, Examples and Dependencies (lines 1024–2365). At this head Layer 5 ends with 5.3 (line 1083) and is followed by `## Downstream consumers` (line 1132). `Suggested.lean` still lacks `re_eq_half_of_meromorphicOrderAt_completedLFunction_pos`, `meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois`, `meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois` and `psiAP_isBigO`. The change since the previous review touches only the convention paragraph, not this. No roadmap on `main`, and none at an open head, cites the removed ids, so no citation breaks. The loss is to this roadmap's record.

The smallest repair has not changed. Restore §§5.4–5.6 and Layer 6 here under their ids and with their statements, together with the conventions, supplier contracts and four declarations they use. ConsequencesOfTheRiemannHypothesisForDirichletLFunctions then cites them by these ids. Whether the family's owner may instead hand a layer of a roadmap on `main` to a new roadmap under new numbers is a question for the human reviewers (below); this review cannot waive the rule.

## C01 — The parenthesis on the weights in 4.2's method label still reads as a false statement about cyclic families

In the `*Method of the formal proof:*` line of 4.2 (line 967), "`1` on at most one distinguished real odd member; a cyclic family has none" most naturally says that a cyclic family has no real odd member. That is false: by 0.2's Check `𝒦(χ₋₄) = {1, χ₋₄}`, and `χ₋₄` is real with `χ₋₄(−1) = −1`. If the meaning is that no member is distinguished when the theorem is applied to a cyclic family, then "applied to a cyclic family, no member is distinguished" says exactly that.

## C02 — The description still leaves out that §§5.4–5.6 also leave this roadmap, and that the moved sections are renumbered

Part 2 of the description says "Section numbers are unchanged, since the roadmaps cite one another by section." Part 3 says only that the family's last roadmap "ended with a layer of consequences", and that the new roadmap's `Suggested.lean` "keeps the four statements of the last roadmap's file unchanged". At this head the folder also loses §§5.4–5.6, which were not part of that layer (completed L-functions, Dedekind zeta functions of abelian fields, Hecke characters of abelian extensions of `ℚ`). Three of the four moved declarations belong to them, and every moved section takes a new number. Text that would be right: "GeneralizedRiemannHypothesisFromWindowBounds loses its Layer 6 (§§6.1–6.32) and its §§5.4–5.6. They become Layers 0–4 of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions, renumbered (§§5.4–5.6 are its §§0.1–0.3), and the declarations of 5.4, 5.5, 5.6 and 6.5 move with them unchanged."

## C03 — Two dependency records leave out the general theorems from which the rewritten convention now deduces 3.4 and 0.6

The new convention says that what a `*Corollary of:*` line covers "is deduced from" the general theorem, and that "the deduction needs the section that the `*Corollary of:*` line names". The deduction is now the proof, no longer a later replacement, so a reader who plans from the dependency lists misses one input each time. 3.4's line names AnalyticNumberTheoryPartI §1.6 (line 853), but Layer 3's Dependencies (lines 918–919) list only RiemannHypothesisStatementsAndConsequences, FrobeniusRestrictedRieszSums, PositivityOfDirichletSeriesWithKernels and ZerosOfLFunctions §§7.5, 7.6. Likewise, the ZerosOfLFunctions contract (lines 1247–1249) gives §8.6a only "for the bound `C′ y` of 0.4", not for 0.6. Layer 0's Dependencies do list §8.6a, and the AnalyticNumberTheoryPartI contract does name 3.4. Adding "AnalyticNumberTheoryPartI §1.6 (for the deduction of 3.4)" to Layer 3's Dependencies and "and for the deduction of 0.6" to the §8.6a item would close both gaps.

## Previous findings

- R01 — not repaired: Layer 5 ends with "### 5.3 Values and the critical strip" (line 1083), followed by `## Downstream consumers` (line 1132). There are no §§5.4–5.6 and no Layer 6, and the four declarations are still absent from `Suggested.lean`.
- C01 — not repaired: line 967 still reads "(and `1` on at most one distinguished real odd member; a cyclic family has none)".
- C02 — not repaired: description part 2 still reads "Section numbers are unchanged, since the roadmaps cite one another by section."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention paragraph (changed), lines 152–161 | its claims against 0.6, 3.4 and the family index lines 200–205 | ZerosOfLFunctions §8.6a (line 2286) and AnalyticNumberTheoryPartI §1.6 (line 982) state and prove their theorems; index states the same convention | true, timeless | none |
| 0.6 deduced from ZerosOfLFunctions §8.6a | `K = ℚ`, trivial character, `x = 2` | direct `G(2) = 1.7681370`; formula `1.8388397 − 0.0461914 − 0.0221527` (30 zeros) `= 1.7704956`; tail `≤ 0.012` | normalisation consistent | none |
| 0.6 residue | first zero `1/2 + 14.134725i` | term `m_ρ x^ρ/(ρ(1−ρ))` gives residue `1/(1/4 + t²) = 0.00499899` | true | none |
| 0.6 route vs deduction | route through RiemannHypothesisStatementsAndConsequences §8.4a(b) | §8.4a is itself `*Corollary of:*` §8.6a for poles and residues; label does not say the route differs | consistent with convention | none |
| 3.4 deduced from AnalyticNumberTheoryPartI §1.6 | principal `χ` mod 2; Euler factor at `p = 2`, `σ = 1/2` | zeros `9.0647k·i`, `Re = 0`, outside `Re s > 1/2`; `|1 − χ*(2)2^{−s}| ≥ 1 − 0.70711 = 0.29289` | (←) follows with `ψ ∈ 𝒦(ψ)` and §9.4 | none |
| 3.4, 0.6 dependency records (C03) | Layer 3 Dependencies lines 918–919; contract lines 1247–1249 | AnalyticNumberTheoryPartI §1.6 absent; §8.6a listed for 0.4 only | omission | C03 |
| 5.1 route through 3.4 | `generalizedRiemannHypothesis_primitiveCharacter_iff` | declared in RiemannHypothesisStatementsAndConsequences `Suggested.lean` line 138, README line 794 | resolves | none |
| 4.2 Method (C01) | `ψ = χ₋₄` | `𝒦(χ₋₄) = {1, χ₋₄}`; `χ₋₄(−1) = χ₋₄(3) = −1`, real | literal reading still false | C01 |
| R01 removed items | merge-base lines 891, 908, 935, 1024–2365 against head line 1083 | 35 sections and 4 declarations absent; new roadmap §§0.1–0.3 at its lines 243, 266, 301; no former-numbering table | record broken | R01 |

The rows for the statements the change leaves untouched stand as in the previous review, of `71bbefa`.

- Change since `71bbefa`: 15 lines of the README, all in the convention paragraph; `Suggested.lean` unchanged (empty diff).
- Supplier sections resolved at this head: ZerosOfLFunctions §§6.5, 8.6a; AnalyticNumberTheoryPartI §1.6 (also at the head of its other open revision); RiemannHypothesisStatementsAndConsequences §§8.4a, 9.4. §8.6a is this pull request's own addition to ZerosOfLFunctions: it is absent on `main` and at the head of that roadmap's other open revision.
- Outside the folder: the diff against the merge base, with this pull request's own folders and the two family indexes excluded, is empty.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only; the file is unchanged since the previous review, whose `#check @name` comparison stands.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels and RieszSumsOverPrimesAndExceptionalZeros (on `main`), and ZerosOfLFunctions and AnalyticNumberTheoryPartI (open revisions), where the change bears on them. The change moves no ownership, so each shared object keeps the single owner the previous review found: the explicit formula (ZerosOfLFunctions §8.6a), primitive induction (AnalyticNumberTheoryPartI §1.6), the one-character remainder and the predicates (RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.5), and Landau's theorem (ArithmeticDirichletSeriesPartII §0.1b, PositivityOfDirichletSeriesWithKernels Layer 6). The former §§5.4–5.6 and Layer 6 now sit in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (R01).

Source independence: changed passages only. One passage was compared: the `*Corollary of:*` convention, lines 152–161. It states this roadmap's own convention, paraphrases no source, and cites only FormalProof, which is not readable here. The largest share of locators is FormalProof's, 31 of about 55, as before. No layer was added, removed or reordered since `71bbefa`, so the contents were not compared again.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 restate the Landau–Ingham equivalences (Landau 1905; Ingham 1932) in windowed form, whose nearest published relatives are Pintz (1980) and Kaczorowski (1984), both read in the previous review.

## Not verifiable

- FormalProof: its file and declaration locators and every `*Method of the formal proof:*` label; the archive parts and the repository could not be read through the sources service (as before).
- Ihara–Murty–Shimura (2009), Ihara (2006), Landau (1905): no open copy read (as before).
- Ingham (1932), Davenport (2000), Montgomery–Vaughan (2007): books with no legal open copy; Knapowski–Turán (1962): publisher paywall (as before).

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review (so that no edit escapes a review), run on this folder alone, lists 117 files as such changes. Every one is in another roadmap folder that this pull request adds or revises and that has its own review; the same check, told of those folders, passed.

## Source issues

- none

## For the human reviewers

- Record rule (R01): description part 3 presents moving Layer 6 and §§5.4–5.6 into ConsequencesOfTheRiemannHypothesisForDirichletLFunctions as deliberate. You decide whether a roadmap on `main` may hand items to a new roadmap under new numbers. If you allow it, R01 lapses.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13, 45–49). No refereed source states it, and this review did not read the formal proof.
- Licence: the README cites about 31 file and declaration locators of an external Lean formalisation (FormalProof: archives on the author's site and a GitHub repository), and `Suggested.lean` says three declarations match it binder for binder. Its licence was not read.
- Not tested: FormalProof, the source with the largest share of locators, could not be read, so wording and arrangement were not checked against it.
