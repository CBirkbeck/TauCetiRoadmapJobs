# Review of FrobeniusRestrictedRieszSums (pull request #2920 at 763038a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: this is an incremental re-review of the 6 lines changed since `801a05b`, which add to 1.4 two file-and-declaration locators into the formal proof and change no statement. The same commit replaced the family index, and its entry for this roadmap again describes 1.9 as an equivalence with a window bound, which 1.9 does not state. There are three small corrections (that entry, the sentence of the description it contradicts, and the reference to the formal proof, which does not name the commit the index says it names) and three format notes, none blocking. The humans who approve have seven things to decide, two of them new: the index now records that the formal proof was published without a license, and it carries a section telling reviewers of later contributions what not to block.

## C01 — The family index describes 1.9 as an equivalence with a window bound; 1.9 is one implication, to a square-root bound

A reader of the index would look in this roadmap for a converse and for a bound on windows, and find neither. The entry in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (lines 96–100) now ends "and the equivalence of the averaged inequality on a host with the window bound for the cyclic family". Target 1.9 (README lines 1030–1037) is an implication: hypothesis (i) at every `u₀ ∈ A₀` and hypothesis (ii) give `G_1(x) + (3o + 1)^{−1} Σ Re G_κ(x) ≤ x^{1/2+(C+4)ε}` at the single scale `x`; no converse is stated, and the windowed consequence is drawn by the consumer named under Downstream consumers (ThetaChainsAndFrobeniusPrimeSums §10.7). The head `801a05b` had the right wording, and the commit that brought in the common index undid it.

The smallest change: restore "and the implication from the averaged inequality at every translate on a host to the square-root bound for the cyclic family" in the index (in the copy every pull request of the family carries, so that the next synchronisation does not undo it again).

## C02 — The description says the index entry describes 1.9 as an implication; at this head it does not

The description says: "In this pull request's copy, the entry for this roadmap describes 1.9 as it is stated: the implication from the averaged inequality at every translate on a host to the square-root bound for the cyclic family." At this head the entry says "equivalence … with the window bound" (C01). Repairing C01 makes the sentence true again; otherwise it is deleted. The description also leaves unstated that this head's index gained a section "When a roadmap is wrong" and a statement on the licence of the formal proof; one sentence would do.

## C03 — The index says each roadmap's reference to the formal proof names the commit of the source as published; this roadmap's does not

A reader who looks up `Formalism/SharpRestriction/GlobalSchurBounds/ShortIntervalPrimes.lean` (added to 1.4 at this head) from this README alone is sent to the repository's current state, where, by the index's own account, the files have been changed since and the paths lie under `src/`. The index (lines 18–20) says "the reference to the formal proof in each roadmap names that commit"; the entry [FormalProof] under References (README lines 1237–1239) gives only `https://github.com/leanprover-community/riemann-hypothesis`.

The smallest change: add to the [FormalProof] entry that the files cited are those of the first commit, `40e56bab026552e089d7afcfeff08d2defb9c005`, under its directory `src/`.

## N01 — Layer 1 has no 1.3

The subsections run 1.1, 1.2, 1.4, …; other roadmaps cite 1.4–1.9 by number, so a line saying that the number is unused would serve better than renumbering.

## N02 — The display of 1.9 has `4o·x^{1/2+ε}` where its route gives `3o·x^{1/2+ε}`

Line 1033 against line 1055. Both are true; one of the two could be aligned.

## N03 — "the three statements on zeros" in the locator of 1.4 refers to nothing the README names

Lines 900–901: the README never says which three statements `Formalism.MainNotions.LitThin` bundles. Either name them in a clause (for instance by the sections of RieszSumsOverPrimesAndExceptionalZeros or ZerosOfLFunctions that state them) or write "from the statements on zeros bundled in".

## Questions for the author

- Does `Formalism.MainNotions.ShortIntervalPrimes.Conclusion6` state 1.4 (b) in the form (b′) of RieszSumsOverPrimesAndExceptionalZeros §1.4i (constant depending on `c_ex`), as the last sentence of the Route of 1.4 says of "the form of the formal proof"? The file could not be opened here: its host is in no class the sources service reads, and the index says the source carries no license.

## Previous findings

The previous report (of `801a05b`) had no finding (no R01, …). Its format notes, and one correction of the review before it, at this head:

- N01 — not repaired: Layer 1 still runs 1.1, 1.2, 1.4 (format note N01 above).
- N02 — not repaired: `4o` at line 1033, `3o` at line 1055 (format note N02 above).
- C07 of the review of `cebce56` (index entry), repaired at `801a05b` — undone at this head: "and the equivalence of the averaged inequality on a host with the window bound for the cyclic family" (small correction C01 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.4 (b), whose locator the diff extends | Check instance: `α = 31/50`, `X = e^{x^{ε/3}}/3`, `log f_E ≤ 2x^{ε/5} log² x` | `(log X)^α ≈ x^{31ε/150}`, `31/150 = 0.2067 > 0.2`; saving `exp(−c₁x^{19ε/150})`, `19/150 = 0.1267 > 0.125`, so `≤ e^{−x^{ε/8}}` for large `x` | holds | none |
| 1.4 (b), passage from `y₀` to "beyond `X`" | `y ≥ X ≥ y₀`, `log f_E ≤ (log X)^α` | `(log y)^α ≥ (log X)^α`; `exp(−c₁(log y)^{1−α}) ≤ exp(−c₁(log X)^{1−α})`: the saving at `X` holds for all `y ≥ X` | holds | none |
| 1.4, new locator against the Route | "the form at the thin scales … from the three statements on zeros" beside the Route's (b′) | Route: (b′) has `c₁ = c₁(c_ex)` from no real zero in `(1 − c_ex, 1)`; locator sentence asserts no more than a location | consistent; location unverified | N03 |
| 1.9 against the index entry | statement lines 1030–1037 | hypotheses (i), (ii) ⇒ one inequality at the scale `x`; no converse, no window `[Y, Y^λ]`; `ψ = 1`: `G_1(x) ≤ x^{1/2+(C+4)ε}` | index entry wrong | C01 |

The rows for the untouched statements stand as in the previous review, of `801a05b`.

- Source locators checked against the text: 0. The two added at this head (`ShortIntervalPrimes.lean`, `MainSup.lean`) could not be opened.
- Library declarations opened: none; the diff changes no Lean statement and names no library declaration.
- Cross-roadmap citations resolved: RieszSumsOverPrimesAndExceptionalZeros §1.4i at its open head (heading at its line 305; the form (c′) "under a zero-free interval" at line 404), cited by the Route and the Needs line beside the changed locator. No other roadmap names `LitThin` or `ShortIntervalPrimes`.
- Automatic checks: the worker's all passed at this head. Dependency check rerun: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration of `Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 109, 232, 362), nothing else. The file is unchanged since `801a05b`, so the one-tactic probe and the `#check` comparison of that review stand.
- Outside the folder the pull request changes only the family index (README rewritten at this head: 55 insertions, 10 deletions; its `Suggested.lean` and `metadata.toml` unchanged), which is its own; read in full as far as it concerns this roadmap.
- Headlines: three (1.2, 1.9, 0.8), all stated, as before.
- Title and description read against this head: one sentence contradicted (C02); the counts (3 theorems, 25 definitions) and the validation sentence still agree.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, LocalGainOfThetaChains, RiemannHypothesisStatementsAndConsequences, ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts (open) and QuadraticCharactersAndReduction, ExplicitNumberFields, QuasiRiemannHypothesis (main) as far as the diff bears on them; nothing shared: the diff adds a locator and no object. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 1 changed passage of the folder and the changed paragraphs of the index read, compared with 0 sources (the one source they cite, [FormalProof], could not be read); largest share [FormalProof]; no layer added, removed or reordered, so the arrangement was not compared again; wording and arrangement against [FormalProof] remain untested.

Research link: 1.9 is the analytic frame of the proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026): chains of theta lifts of length `√X` for the normalised von Mangoldt sum (Announcement lines 32–38, 125; README Summary). 0.8 extends Behrend (1946) and Ruzsa (1993); 1.4 rests on Landau–Page. Rests on the README and the Announcement.

## Not verifiable

- [FormalProof], all its locators, among them `Formalism.MainNotions.ShortIntervalPrimes.Conclusion6` and `Formalism.MainNotions.LitThin` added to 1.4 at this head: the repository, tried at the commit the index names, is on a host in no class the sources service reads, and it is not the author's page.
- The index's sentences about that repository (that the proof belongs to its author, has no license, and is mirrored unmodified at its first commit): same reason.
- Behrend 1946, Ruzsa 1993, Washington, Neukirch, Davenport, Chebyshev 1852: as in the previous review; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: targets 1.1 and 1.7–1.9 rest on [FormalProof] alone, a Lean formalisation announced on 20 November 2026 (Announcement, 4 pages), with no written exposition; no refereed source states them.
- Licence: the family index (lines 16–18) now says the repository states that the proof belongs to its author and was published without a license, mirrored for verification only. The roadmap cites its files and declaration names throughout.
- Licence: docstrings of `Suggested.lean` say five definitions are "as in [FormalProof]" (lines 77, 88, 100, 136, 149). The agreement of names and statements with that source could not be read.
- Licence: the index names the first commit of the GitHub repository as the source as published; the Announcement (line 53) gives a 14-part archive on the author's page. This README's References name neither the commit nor the archive.
- Not tested: [FormalProof], the source with the largest share of the locators, could not be read; wording, arrangement and the declaration names, those added at this head included, were not compared with it.
- Scope: the third Check of 1.4 rests on AnalyticNumberTheoryPartI §0.34 on main, an unconditional exclusion of Landau–Siegel zeros; no target here depends on it.
- Policy: the index gained a section "When a roadmap is wrong" (lines 46–76) that says what a review of a contribution carrying out these roadmaps may not block. Whether a family index may set review policy is not a referee's question.
