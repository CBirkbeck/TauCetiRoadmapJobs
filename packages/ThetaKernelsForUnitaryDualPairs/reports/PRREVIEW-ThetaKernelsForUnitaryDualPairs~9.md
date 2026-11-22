# Review of ThetaKernelsForUnitaryDualPairs (pull request #2907 at 54e111f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** accepted

**Summary.** Accepted on an incremental re-review of the 13 lines changed since `3ccfcd4`: the small correction of the previous review (the seminorm bound of the formal proof on the absolute theta sum in 5.7a) and its format note on the commit of the formal proof are both repaired, and the repaired sentences agree with the two declarations opened at the commit the References now name. There is no finding and no small correction; one format note carries over the seven format notes of the earlier reviews, whose passages the change does not touch. Six points are left to the human reviewers, as before.

## N01 — The seven format notes of the earlier reviews stand

The change touches none of their passages: the two letters for the variable of `U(V)` in headline (3); `p`, `q`, `a` in 3.47b and 5.7d; "Propositions 4.1, 4.3–4.5" of Kudla96 (4.4 is a lemma); "the formal proof that the family follows" in the Conventions; the Hermitian form in 3.9a (iii); "characteristic zero" missing in the Summary and the docstring for split matching; "with trivial splitting character" in the Corollary of 6.4a.

## Previous findings

The previous report had no finding (P1 or P2); its small correction and its two format notes are accounted for here.

- C01 — repaired: "for each basis of `E/F`, in the coordinates it gives, the integral is at most `ν(φ)` for a seminorm `ν` continuous in the archimedean component for each fixed finite component (the first clause of `GlobalTheory.Published.WeilSiegelFormulaUnitary` …)".
- N01 — repaired: "The files and declarations of FormalProof named in this README are those of the first commit of that repository, the source as published, with the file paths relative to its directory `src/`"; the family index names the same commit.
- N02 — not repaired (untouched text): written again as N01 of this report.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 5.7a, absolute sum in the formal proof (finiteness) | `WeilThetaConvergence` at the first commit; `(m,r,n) = (2,1,1)`, `(3,1,1)`, `r = 0` | hypothesis `1 ≤ n`, `r = 0 ∨ n + r < m`: `2 < 2` false, `2 < 3` true; conclusion `absThetaInt V ν Φ < ⊤`, no bound | README: finite if `r = 0` or `m − r > n`; agrees | none |
| 5.7a, absolute sum in the formal proof (bound) | first clause of `WeilSiegelFormulaUnitary` at the first commit; same triples | same hypotheses; for every `d` and basis `ε` of `E/F`: `∃ ν`, `IsContSeminorm ν` (continuous in `f` on pure tensors, each fixed finite `g`), `absThetaInt(φ ∘ coord ε) ≤ ν(φ)` | README's new clause agrees: basis-dependent seminorm, continuity in the archimedean component, split `W`, `h = 1` | none |
| 5.7a, "That clause for arbitrary `W` and `h`, with its bound … are this roadmap's own" | both declarations | both integrate over `[U(V)]` only, `Y` of dimension `n` with `W = Y ⊕ Y^*` (matrices `m × n` over `E`), no `h` variable | still true after the repair | none |
| 6.4a, locator "the file cited in 6.4a" | 6.4a at this head | 6.4a names `…/TwistedTraceFormula/WeilSiegelFormulaUnitary.lean` (`GlobalTheory.Published.WeilSiegelFormulaUnitary`); the file exists at the first commit, 143 lines, declaration at line 56 | pointer resolves | none |
| References, FormalProof commit | first commit of the repository | root commit is `40e56bab026552e089d7afcfeff08d2defb9c005`; it carries `src/` with both files of 5.7a; no other commit named in the README | agrees with the family index | none |

The rows for the untouched statements stand as in the previous review, of `3ccfcd4`.

- Source locators checked against the text: 2 formal-proof declarations at the commit of the References (`GlobalTheory.Published.WeilThetaConvergence`, `GlobalTheory.Published.WeilSiegelFormulaUnitary`, with `absTheta`, `absThetaInt`, `coord`, `IsContSeminorm`); of the seeded sample, none other than 5.7a's neighbourhood falls in the changed passages.
- Library declarations opened: none needed; the change names no Mathlib or Tau Ceti declaration.
- Cross-roadmap citations: the change adds none; no supplier added or dropped.
- Dependency check: `depcheck: 133 roadmaps, 1486 edges, 0 problem(s)`; no upward or cyclic edge.
- Automatic checks: all passed at this head. `Suggested.lean` is unchanged, elaborates with no message and declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Outside the folder the change is in the family index only: it now says the files are looked up under `src/` of the first commit and that each roadmap's reference names that commit (true of this README), and it rewords the line for BernoulliBoundsForClassGroupEigenspaces, which agrees with that roadmap's Summary at its open head.
- Pull request text: the title and description agree with the head; the change alters an attribution and a reference only, nothing the description states.
- Overlap check: read RowTowerAndRallisIdentities, LocalFactorsOfTwistsAndTypes, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII as in the previous reviews; the change adds no object, and ownership stands as recorded there (unramified unitary doubling value: MetaplecticAutomorphicForms §6.11 and AutomorphicLFunctionsAndLocalFactorsPartII §2.3; doubling series: LocalFactorsOfTwistsAndTypes §3.3); nothing else shared.

Source independence: changed passages only; 2 passages compared with 1 source (FormalProof), none shared beyond declaration names and formulas; largest share FormalProof, 80 of about 129 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: The targets are the local and global theta correspondence for unitary dual pairs: Kudla's persistence (1996), J.-S. Li's and Ichino's lifts of discrete series (1990, 2020), the Siegel–Weil formula of Weil (1965) and Ichino (2007), and the Rallis inner product formula as in Gan–Qiu–Takeda; README References, GQT §1.7 and Ichino20 §1.

## Not verifiable

- Weil65 §§V–VI (5.7a, 6.4a): recorded as uncertified; cited by locator only.
- Ichino 2007 (6.13a, 6.4a): recorded as uncertified; only GQT's attribution to it was read.
- Rallis 1982 and Howe 1979 (3.21a, 3.47a): not among the texts recorded for this roadmap.
- The formal-proof locators other than the declarations opened in this and the earlier reviews: not opened.

## Source issues

- none

## For the human reviewers

- Scope: the family records an unpublished formal proof announced on 20 November 2026 (Announcement, FormalProof); about 80 of about 129 locators of this README point into it.
- Scope: 3.47c, 5.7b, 6.13c and the Fock-module clauses of 3.46a state that no publication is cited and that the route is the proof; the inert case of 3.21a (ii)–(iv) is also marked as this roadmap's own.
- Licence: the family index says the formal proof was published without a licence and is mirrored for verification only; the README reproduces its file paths and declaration names, no text.
- Scope: the roadmap extends MetaplecticAutomorphicForms and continues its section numbers (3.45–3.47c, 3.3b, 6.11) under another title; MetaplecticAutomorphicFormsPartII is a different open roadmap.
- Not tested: FormalProof has the largest share of the locators and its text was read at eight declarations only; wording and arrangement were not compared with it beyond those.
- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) has a section "When a roadmap is wrong" that says what a review of a contribution may not block; whether a roadmap index sets review rules is a project decision.
