# Review of FrobeniusRestrictedRieszSums (pull request #2920 at 2d95aff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: this is an incremental re-review of the 5 lines changed since `763038a`, which make the reference to the formal proof name the commit and the directory its file paths refer to, and change no statement. The three small corrections of the previous review are repaired: the family index again describes 1.9 as an implication to a square-root bound, the description agrees with it, and the title and description, read in full against this head, contain no sentence the head contradicts. There are no small corrections and four format notes, none blocking. The humans who approve have the same seven things to decide as before.

## N01 — Layer 1 has no 1.3

The subsections run 1.1, 1.2, 1.4, …; other roadmaps cite 1.4–1.9 by number, so a line saying that the number is unused would serve better than renumbering.

## N02 — The display of 1.9 has `4o·x^{1/2+ε}` where its route gives `3o·x^{1/2+ε}`

Line 1037 against line 1059. Both are true; one of the two could be aligned.

## N03 — "the three statements on zeros" in the locator of 1.4 refers to nothing the README names

Lines 900–901: the README never says which three statements `Formalism.MainNotions.LitThin` bundles. Either name them in a clause or write "from the statements on zeros bundled in".

## N04 — The generated block `depends-on` of the description lists one open supplier; the README has three

The supplier contracts name RieszSumsOverPrimesAndExceptionalZeros and QuadraticTwistSelectionOverPrimes as sub-roadmaps of the family beside RiemannHypothesisStatementsAndConsequences; both are open (carried by the aggregate pull request #2954) and neither is in the blocks `depends-on` and `merge-order`, which list #2885 only. The prose sentence above the blocks is right; the blocks would list all three when next generated.

## Questions for the author

- Does `Formalism.MainNotions.ShortIntervalPrimes.Conclusion6` state 1.4 (b) in the form (b′) of RieszSumsOverPrimesAndExceptionalZeros §1.4i (constant depending on `c_ex`), as the last sentence of the Route of 1.4 says of "the form of the formal proof"? The file could not be opened here: its host is in no class of legal places this review reads from, and the index says the source carries no license.

## Previous findings

The previous report (of `763038a`) had no finding (no R01, …). Its small corrections and format notes, at this head:

- C01 — repaired: the index entry ends "and the implication from the averaged inequality at every translate on a host to the square-root bound for the cyclic family" (index lines 96–100).
- C02 — repaired: the description's sentence on the index entry is true again, and the description now states the index's record on the licence of the formal proof and its section "When a roadmap is wrong".
- C03 — repaired: [FormalProof] now reads "The files cited are those of the source as published, the repository's first commit … and their paths are relative to its directory `src/`" (README lines 1237–1242), the same commit as the index (lines 13–20).
- N01, N02, N03 — not repaired: format notes N01–N03 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 (iii), a *NEW* target whose reference the diff changes | `E = K = ℚ(i)`, constant weight; `n = 3, 5, 2^i` | mean of `2·𝟙[g ∉ Φ]` over `Fr(n)`: `Fr(3) = {c}` gives 2 = 1 − (−1); `Fr(5) = {1}` gives 0 = 1 − 1; `Fr(2^i) = {1, c}` gives 1 = 1 − 0 | holds | none |
| `frobRieszSum` against 1.1 | Lean body, lines 199–204 | `Λ(n)·|Fr(n)|⁻¹·Σ_{g∈Fr(n)} [g ∉ Φ]·2·max(a/n − w(c·g·τ), 0)`: same as the second display of 1.1 | agrees | none |
| 1.9 against the repaired index entry | statement lines 1030–1037; `C = 0, o = 1, x^ε = 5` | one implication, to `≤ x^{1/2+(C+4)ε}` at the scale `x`; last step: `x^{3ε} + 4x^ε = 145 ≤ x^{4ε} = 625`; in general `x^{(C+3)ε}(1 + 4o) ≤ x^{(C+4)ε}` once `x^ε ≥ 1 + 4o`, `C ≥ 0` | index entry now right | none |
| [FormalProof] entry against the index | commit and directory | README: `40e56bab026552e089d7afcfeff08d2defb9c005`, `src/`; index lines 13–20: the same commit, `src/` | consistent; the repository itself not opened | none |

The rows for the untouched statements stand as in the previous review, of `763038a`.

- Source locators checked against the text: 0. The diff adds no locator into a readable source; no target of the sample falls in the changed passage.
- Library declarations opened: none; the diff changes no Lean statement and names no library declaration. `Suggested.lean` is unchanged since `801a05b`.
- Cross-roadmap citations resolved: the diff adds none. The three family suppliers were located again (RiemannHypothesisStatementsAndConsequences at #2885; RieszSumsOverPrimesAndExceptionalZeros and QuadraticTwistSelectionOverPrimes in the aggregate #2954); Multiquadratic is under `Completed/` on main.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration of `Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 109, 232, 362), nothing else. The file is unchanged, so the one-tactic probe and the `#check` comparison of the earlier review stand.
- Outside the folder the pull request changes only the family index (`README.md`, `Suggested.lean`, `metadata.toml` of `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/`), which is its own; since `763038a` two lines of its README changed (the entry for this roadmap), read and correct.
- Headlines: three (1.2, 1.9, 0.8), all stated, as before.
- Title and description read in full against this head: adds a new roadmap (1623 lines, 41 headings, 28 declarations: 3 theorems and 25 definitions, as stated); the three headline names, the note on split ramification at 1.2 (README lines 820, 849), the docstring's sentence on the other targets, the index's three files, its licence record and its section "When a roadmap is wrong", the commit named in References, and the validation sentence all agree with the head. No sentence contradicted, no change left unstated.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, LocalGainOfThetaChains, RiemannHypothesisStatementsAndConsequences, ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts (open) and QuadraticCharactersAndReduction, ExplicitNumberFields, QuasiRiemannHypothesis (main) as far as the diff bears on them; nothing shared: the diff adds a bibliographic sentence and no object. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 1 changed passage of the folder and the 2 changed lines of the index read, compared with 0 sources (the one source they cite, [FormalProof], could not be read); largest share [FormalProof]; no layer added, removed or reordered, so the arrangement was not compared again; wording and arrangement against [FormalProof] remain untested.

Research link: 1.9 is the analytic frame of the proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026): chains of theta lifts of length `√X` for the normalised von Mangoldt sum (Announcement lines 32–38, 125; README Summary). 0.8 extends Behrend (1946) and Ruzsa (1993); 1.4 rests on Landau–Page. Rests on the README and the Announcement.

## Not verifiable

- [FormalProof], all its locators, and the sentence added at this head (that the commit named is the repository's first and that the cited paths lie under its `src/`): the repository is on a host in no class of legal places this review reads from, and it is not the author's page.
- The index's sentences about that repository (that the proof belongs to its author, has no license, and is mirrored unmodified at its first commit): same reason.
- Behrend 1946, Ruzsa 1993, Washington, Neukirch, Davenport, Chebyshev 1852: as in the earlier reviews; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: targets 1.1 and 1.7–1.9 rest on [FormalProof] alone, a Lean formalisation announced on 20 November 2026 (Announcement, 4 pages), with no written exposition; no refereed source states them.
- Licence: the family index (lines 16–18) says the repository states that the proof belongs to its author and was published without a license, mirrored for verification only. The roadmap cites its files and declaration names throughout.
- Licence: docstrings of `Suggested.lean` say five definitions are "as in [FormalProof]" (lines 77, 88, 100, 136, 149). The agreement of names and statements with that source could not be read.
- Licence: the index and, at this head, this README's References name the first commit of the GitHub repository as the source as published; the Announcement (line 53) gives a 14-part archive on the author's page, which neither names.
- Not tested: [FormalProof], the source with the largest share of the locators, could not be read; wording, arrangement and the declaration names were not compared with it.
- Scope: the third Check of 1.4 rests on AnalyticNumberTheoryPartI §0.34 on main, an unconditional exclusion of Landau–Siegel zeros; no target here depends on it.
- Policy: the index has a section "When a roadmap is wrong" (lines 46–76) that says what a review of a contribution carrying out these roadmaps may not block. Whether a family index may set review policy is not a referee's question.
