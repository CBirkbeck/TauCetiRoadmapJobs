# Review of LengthBoundsInPadicFamilies (pull request #2898 at 58478ef)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 2 lines changed since `842edcb` finds no finding, no small correction and no format note. The change is one sentence of the References: the files and declarations of the formal proof are now to be read at the first commit of its repository (`40e56ba`, paths relative to `src/`) instead of at `e50d098`; no statement, layer, supplier or Lean declaration changes, and the family index and the pull request's description say the same thing as the new sentence. The repository could not be read, so that `40e56ba` is its first commit and carries the named files is unverified; the human reviewers decide the scope and licence questions about that source, which the family index now describes as published without a licence.

## Previous findings

- none — the previous report, of `842edcb`, has no finding, no small correction and no format note; the points it accounted for (R01, C01–C03, N01–N04 of the review before it) are in passages this change does not touch.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.8b (1′), cited by the changed sentence as the form of the formal proof; fourth Lean theorem | `𝒜 = O × O`, two projections, `g = 1`, `Rel = ϖ^aO × ϖ^bO`, residue field with more than 2 elements | arrays `(xϖ^a, yϖ^b)`: products `xyϖ^{a+b}`, smallest `J = ϖ^{a+b}O`, colength `a + b`; `Sol` lengths `a`, `b`: `a + b ≤ a + b` | holds | none |
| 1.8b (1), cited by the changed sentence as this roadmap's generic form; its link to (1′) | `m = 1`, one array `Θ`; `𝒜 = O`, `g = d = 1`, `Rel = ϖⁿO` | `det ψ_b(X_1Θ) = X_1^{gd_b}·det ψ_b(Θ)`, so `∏_b det ψ_b(Θ)` is the coefficient of `X_1^{gΣd_b}`; `n ≤ n` | holds; (1) follows from (1′) where (1′) applies, as stated | none |

The rows for the untouched statements stand as in the previous review, of `842edcb`.

- Source locators checked against the text: none new; the change alters the commit at which the declaration locators into [FormalProof] are read, and that repository was not readable (below).
- Consistency of the changed sentence: the commit `40e56bab026552e089d7afcfeff08d2defb9c005` and "first commit … `src/`" agree with the family index (its opening paragraph) and with the description's "in the `src/` tree of its repository at a fixed commit given in the References"; no other passage of the README or of `Suggested.lean` names a commit.
- Library declarations opened at the pins: none; the change names none.
- Cross-roadmap citations resolved: none touched by the change.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at this head: four `sorry` warnings (lines 77, 102, 134, 160) and nothing else; the file is unchanged since `842edcb`, so the one-tactic probe was not rerun.
- Automatic checks: all passed at this head. Outside the folder the pull request changes only the family index, which since `842edcb` rewrites its opening paragraph (the first-commit link, the statement on the licence of the formal proof), adds the section "When a roadmap is wrong" and rewords the entry of BernoulliBoundsForClassGroupEigenspaces.
- The pull request's title and description agree with this head: a new roadmap folder, two of three headlines in four declarations, locators into the formal proof at a commit given in the References, the family index, the open supplier SelmerLengthBoundsAndLocalLifting.

Overlap check: read CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, WachLatticesOverTheCyclotomicTower (open) and PadicFamilies, IntegralHeckeAndGaloisDeterminants (main), as in the previous review; nothing shared. The change adds no object and no layer; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 1 passage compared with 0 sources (the changed sentence is a bibliographic locator; its source, [FormalProof], could not be read); largest share [FormalProof], unread, so the locators and the wording beside them were not compared with it; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: 1.7a extends Hida's modules of congruences of Hecke algebras (Hida 1986, §§0, 3). 1.8c–1.8e give Ribet's construction of unramified extensions (Ribet 1976) a length form, with the generalized matrix algebras of Bellaïche–Chenevier (2009, Chapter 1). They feed CongruenceModulesOfThetaLifts in the family built on Alpöge's formal proof (2026). Rests on the README, Hida and BC09.

## Not verifiable

- [FormalProof]: the sources service has no licence class for the repository's host, so the repository was not opened. That `40e56ba` is its first commit, that the files named in the README exist under `src/` there, and that each declaration states what is recorded are unchecked.
- [Ribet76] §§2–4: no legal copy found, as before.

## Source issues

- none

## For the human reviewers

- Scope: the most-cited source, [FormalProof] (README References), is an unrefereed Lean formalization announced on 20 November 2026; the announcement says no written proof is presented. The other sources are refereed (Hida 1986, Ribet 1976, Bellaïche–Chenevier 2009).
- Not tested: [FormalProof], the source with the largest share of the citations, could not be read; its file and declaration locators, now at commit `40e56ba`, the wording, the arrangement and the Lean statements were not compared with it.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, opening paragraph) now says the formal proof was published without a licence and is mirrored for verification only; whether the four `Suggested.lean` statements resemble its declarations was not checked.
- Scope: the family index gains a section, "When a roadmap is wrong", telling reviewers of later contributions not to block one that corrects a roadmap in agreement with the formal proof; whether an index sets review policy is yours to decide.
