# Review of RefinedTraceMethods (pull request #1493 at 91f73dc)

**Verdict:** accepted

Incremental re-review of 0 changed lines in `TauCetiRoadmap/RefinedTraceMethods/` since 8bad9df (the head only merges main), and a check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "ChromaticHomotopyTheory the K(1)-localization formula, THH, TC, K-theory and trace, and the Dundas–Goodwillie–McCarthy theorem", matching README:4141 and ChromaticHomotopyTheory's citations of §§2.6, 2.9–2.10, 4.9, 4.11, 4.17, 6.8.
- R02 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti" and "since the file has no declaration it contains no `sorry`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result/change |
|---|---|---|---|
| §9.4 K-theoretic Beilinson square (README:4091), cited by the description as the form "for commutative rings henselian along (p)" | R = ℤ_p, π₁, p odd and p = 2 | `K₁(ℤ_p;ℚ_p)` = `(ℤ_p^×)^∧[1/p]` = ℚ_p (p=2: `(±1×ℤ₂)^∧[1/2]` = ℚ₂); `K₁, K₂(𝔽_p;ℚ_p)` = 0; so π₁ of the fibre = ℚ_p. `π₁ΣHC(ℤ_p;ℚ_p)` = HC₀ = ℚ_p. | Pass. |
| Same, negative control for the henselian hypothesis | R = ℤ, π₁ | `K₁(ℤ;ℚ_p)` = `(ℤ/2)^∧_p[1/p]` = 0, `K₂(𝔽_p;ℚ_p)` = 0: fibre π₁ = 0. `π₁ΣHC(ℤ;ℚ_p)` = ℚ_p. 0 ≠ ℚ_p. | Pass; the hypothesis is needed, as README:4133 and the description say. |
| §4.17 Dundas–Goodwillie–McCarthy, named in the description's ChromaticHomotopyTheory clause | f : k[ε] → k, char k = 0, π₁ | `π₁K(f)` = ker(`k[ε]^× → k^×`) = 1+εk ≅ k; relative HC₀ = εk ≅ k. | Pass; agrees with the Check at README:2009. |

The rows for untouched statements stand as in the previous review, of 8bad9df.

- Folder diff 8bad9df..91f73dc: empty (README, `Suggested.lean`, `metadata.toml` unchanged). Outside-folder diff against origin/main: empty; the files listed as changed since 8bad9df come from merging main.
- Gate rerun on 91f73dc: every counter 0, `OK`. Dependency check output: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean`, exit 0, no output, no warning. The file has no declaration: no binder comparison and no one-tactic probe to run.
- Description sentences checked against the head, 14, none contradicted: the three-file folder; the empty `Suggested.lean` (lines 8, 31–33); the end comparisons (README:3, 7, 4079, 4091); "arbitrary commutative ground rings, unbounded mixed complexes" and integral HKR before factorials (README:81); "arbitrary finite groups" and bounded-below genuine comparison (README:9, 58); every prime including 2 in the framed comparison (README:3142, 3202); the K-theoretic syntomic restriction (README:73); the three consumer clauses (README:4141–4143). The pull request adds the roadmap, removes no heading or declaration; the description says so.
- Cross-roadmap citations resolved: ChromaticHomotopyTheory at its open head (README lines 15, 23, 25, 345, 449) cites §§2.6, 2.9–2.10, 4.9, 4.11, 4.17, 6.8, all existing here. Every roadmap the README names as a supplier is on main (SpinRepresentations under `TauCetiRoadmap/RepresentationTheory/`) or earlier in the merge order.
- Seeded sample: none of the 15 targets falls in a changed passage (there is none); no locator is flagged unverified. Source locators rechecked this round: 0.
- Overlap report: no other pull request changes this roadmap; no dropped or revision-only id. The four `AInf.Trace.*`/`Prismatic.Trace.*` names of README:64–65 are in untouched supplier text passed at 8bad9df.

Overlap check: read HabiroCohomologyFoundationsPartII, HabiroCohomologyFoundations, GeneralAlgebraicKTheoryPartII (open heads fefa1f2, 410d536, 76a08ce: each names RefinedTraceMethods as supplier or consumer of the sections this README owns), StableHomotopyKTheory, EnhancedDerivedSheaves, BordismFormalGroups (main); nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); largest share w, 66 of 318 locators; contents not compared again, the diff adds, removes or reorders no layer.

## Not verifiable

- The description's "0 independent review rounds and 2 red-team rounds on the job board": a statement about the job board, not about the head.

## Source issues

- none

## For the human reviewers

- **Scope/Licence.** The source with the largest share of locators, `w` (66 of 318), is an arXiv preprint (v1, 2025), and the framed comparison of §6.10 rests on its Theorem 6.10; `d-thesis` is a 2025 Ph.D. thesis.
