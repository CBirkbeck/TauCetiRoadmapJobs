# Review of RiemannHypothesisStatementsAndConsequences (pull request #2885 at 9574a3f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RiemannHypothesisStatementsAndConsequences/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The only change since the previous review is that the reference to the formal proof now names the first commit of its repository, `40e56bab`, instead of `e50d098`; all 15 files the README cites are byte-identical at the two commits, so every statement the README records from the formal proof stands as read before. There is one small correction (a clause of the family index) and one format note carried over, neither blocking; the human reviewers decide on the scope, on the unlicensed status of the formal proof's source, and on a new section of the family index that addresses reviewers.

## C01 — The family index says the repository's notes list the changes made since the first commit; they summarise them and give a command

In the family index, `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` lines 17–18: "unmodified at that first commit, and with the changes listed in its notes since". A reader who opens the notes to see whether a cited file changed finds no list. The repository's README says the source "has been changed since" and that `git diff --stat 40e56bab HEAD -- src` lists the changes; its `verification/NOTES.md` says that merged pull requests mainly deleted unused files and shortened proofs, and gives the same kind of command. Would read correctly as "and changed since, as its notes describe".

## N01 — The book citations are at chapter level, and 3.2a has none

Unchanged from the previous rounds: 8.4b, 9.7, 9.8 and 9.9 cite a chapter (Titchmarsh, Chapter XIV; Iwaniec–Kowalski, Chapter 5; Ingham, Chapter IV), and 3.2a cites no source. A theorem or section number at each would let a reader check the statement.

## Previous findings

- N01 of the previous report — not repaired: "Iwaniec, E. Kowalski, *Analytic Number Theory* … — Chapter 5"; "Ingham … — Chapter IV … Cited by chapter"; 3.2a has no locator (N01 above). The previous report had no finding and no small correction.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| References, [FormalProof]: "The files and declarations cited are those of the first commit of that repository … `src/`" | the 15 cited files, at `40e56bab` (public repository) against the copy at `e50d098` read in the previous review | git blob hashes equal for all 15, e.g. `ClaimStrip.lean` `60b3e96d…` both sides, `StatementOC.lean` `12ab19c0…` both, `CharFamily.lean` `81c8dfd6…` both | true |
| Same sentence: "the first commit" | history ending at `40e56bab` | one commit, "Mirror the submission exactly as published", 20 Nov 2026; the repository's README calls it the first commit and the unmodified copy | true |
| 9.4 strip form, citing `ClaimStrip.lean` (`Claim.strip`, `Claim.prim_zero`, `Claim.prim_reflect`) | declarations present in the file whose hash matches | `prim_zero` line 23 (one χ, `[NeZero χ.conductor]`), `prim_reflect` line 42 (primitive ψ), `strip : HalfPlane → Strip` line 59: one implication, as the README says | agrees |
| 8.4a (a), (b), citing `CharFamily.lean`, `Analytic.lean`, `StatementOC.lean` | declarations present | `ramp (f : ℕ → ℂ) (y : ℝ) : ℂ` line 10, `Gchi` line 15; `sumLamChi` line 18, `gChi` line 23; `Sz`, `Gz : ℝ → ℝ` lines 11, 13 | agrees |
| Family index: "belongs to its author and was published without a license … mirrored there for verification only" | the repository's README | it says the submission belongs to its author, was published without a license, and is mirrored so that it can be checked | true |

The rows for the untouched statements stand as in the previous review, of `893348b`.

- Locators into [FormalProof]: 15 files compared by blob hash between the commit now cited and the copy read before, all equal; 11 declarations reopened in 5 of them.
- The diff changes no Lean statement and no docstring. `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else. `#check` comparison not repeated: the file is unchanged since `893348b`.
- Library declarations: none new. Cross-roadmap citations: none added or changed.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`.
- Outside the folder the pull request changes only the family index; since `893348b` its README changed (the commit of the formal proof, a section "When a roadmap is wrong", the line on BernoulliBoundsForClassGroupEigenspaces, which agrees with that roadmap's summary at its open head).
- Pull request text: read against this head; the change alters nothing it describes (13 theorems and 6 declarations with bodies, the suppliers, the three index files as the only changes outside the folder).

Overlap check: the diff adds no object; the lists are those of the previous reviews (ZerosOfLFunctions, LFunctions, QuasiRiemannHypothesis, FrobeniusRestrictedRieszSums, GeneralizedRiemannHypothesisFromWindowBounds, RieszSumsOverPrimesAndExceptionalZeros), with the owners recorded there; not read again; nothing newly shared.

Source independence: changed passages only: 1 passage (the reference entry) compared with 1 source (the README of the formal proof's repository), none shared; largest share of the locators [FormalProof], 25 of 34; the diff adds, removes and reorders no layer, so the arrangement was not compared again. The cited books and Littlewood 1928 remain unread.

Research link: 8.4a, 9.3, 9.4, 10.2 and 10.3 are the forms used in the Lean formalization by Alpöge (announced 2026) of the Riemann hypothesis for Dirichlet L-functions; 9.7–9.9 are the classical consequences (Littlewood 1928; Titchmarsh–Heath-Brown, Chapter XIV; von Koch) under a zero-free half-plane. Rests on the README's References and on the Lean source read.

## Not verifiable

- Titchmarsh–Heath-Brown, Chapter XIV; Iwaniec–Kowalski, Chapter 5; Ingham, Chapter IV; Littlewood 1928: no legal copy, as in the previous reviews; Davenport §§18, 20 is settled as uncertified.
- Whether the formal proof compiles or proves what the announcement says was not checked; only the statements of the cited declarations were read.
- That every pull request of the family carries the family index with identical content, as the description says, was not checked.

Automatic checks set aside as false positives: the citation resolver lists as found nowhere the declaration names of the formal proof (they are names in the cited source, not in the pinned libraries) and three names declared in this roadmap's own `Suggested.lean`; and the listing of Lean declarations reads the words "theorem 3.2a," in the module docstring as a declaration.

## Source issues

- none

## For the human reviewers

- Scope: the family follows a formal proof announced on 20 November 2026 (Alpöge); the announcement, 4 pages, states no theorem and is not refereed. README References, [FormalProof] and [Announcement]; `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`.
- Scope: 9.9 states `ψ(x) − x = O(x^{11/12} log² x)` unconditionally from QuasiRiemannHypothesis §10.7, which cites the preprints `openai2026quasiRH` and `liu2026improved` for its half-plane.
- Licence: the repository of the formal proof says the source belongs to its author and was published without a license. The README cites 15 of its files by path and declaration name; no text of it is in the folder, and no declaration of `Suggested.lean` shares a name with it.
- Policy: the family index gains a section "When a roadmap is wrong" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` lines 46–76) saying what reviews of contributions to this family may and may not block. Whether an index sets review rules is yours to decide.
- Not tested: of the book sources, Titchmarsh–Heath-Brown has the largest share (4 of 9) and no legal copy; wording and arrangement were compared with none of the five cited books and articles.
