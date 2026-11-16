# Review of K2SymbolsBrauerPartII (pull request #1432 at 4916d30)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since `4916d30`; this round read the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads "the later review-repair commits name Claude Fable 5.1 (three commits) and Claude Opus 5.5 (two commits) as co-authors"; the commit trailers give Fable 5.1 on d3eace43, a495ae1e, 158e932e and Opus 5.5 on e96bc520, 4916d30c.

## Verified sound

The folder's diff is empty, so no statement changed; the rows are for statements the description cites.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Description: "identifies `conicSymbol` with `hilbertSymbol` on units" over characteristic ≠ 2 (`conicSymbol_eq_hilbertSymbol`; pin `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:47`) | F=ℝ, r=s=−1; F=𝔽₃, r=s=2 | ℝ: −x²−y²=1 insoluble, −1; pin: −1=x²+y² insoluble, −1. 𝔽₃: 2+2=1 at x=y=1, +1; pin: 2=1+1, +1 | agree; description matches the Lean hypothesis `(2 : F) ≠ 0` and `r s : Fˣ` |
| Description: "a total real criterion" (`conicSymbol_real_eq_neg_one_iff`) | (r,s) = (1,−1), (0,0), (−1,0), (0,1) | (1,−1): x=1 solves, +1, right side false. (0,0): 0=1, −1, true. (−1,0): −x²=1, −1, true. (0,1): y=1, +1, false | both directions hold on zero coefficients; "total" is accurate |
| Description: "a cubic witness over Q₇ pins the Artin, residue and Chern signs" (README lines 550, 849, 887) | 𝔽₇, m=3 | cubes of 1..6 are 1,1,6,1,6,6, so 3 is no cube and T³−3 is irreducible mod 7; 3²=9=2 in 𝔽₇, as line 266 uses | as described |
| Description: "`SymbolAlgebra` with no irreducibility assumption", "matrix corner" (`symbolAlgebra_matrix_corner`) | m=2, a=1 (T²−1 reducible): α=1, d=1, s=2, c=1 | c^s=1=a; inner algebra is the degree-one presentation, F; target Mat₂(F), dimension 4=m² | consistent with `symbolAlgebra_isCentralSimple` and the summary |
| Description: "the five `sorry`s", "README, `Suggested.lean`, `metadata.toml`", "outside-folder diff has 0 path(s)" | head | warnings at lines 54, 65, 83, 117, 124; folder holds exactly the three files (935, 129, 1 lines); outside-folder diff empty | as described |

The rows for the statements of `Suggested.lean` and of the README stand as in the previous review, of `4916d30`.

- Pull-request text: title, summary block and four prose paragraphs read sentence by sentence against the head. Each claim was located: Matsumoto/symbol generation (README lines 3, 250, 773), residue-characteristic coefficients (15, 54, 546), ℓ=2 with real places (86, 788, 820), global function fields (15, 691, 714, 831), integral-reduction restriction (887, 916), consumers RefinedTraceMethods and EllipticKTheory (926). It states that the folder is added (1065 insertions, 55 headings, 8 declarations, none removed); nothing is left unstated.
- Library declarations opened at the pins: 1 (`TauCeti.hilbertSymbol`, `Basic.lean:47`, norm-equation form `b = x² − a·y²`).
- Gate, my run at 4916d30: every count 0, OK; the worker's run adds `build=0`. Worktree clean; no change outside the folder against `origin/main`.
- Dependency check: `depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/K2SymbolsBrauerPartII/Suggested.lean` exits 0; the only warnings are the five `sorry`s. The file is unchanged, so signatures and one-tactic probes stand.
- Sources: no seeded target falls in a changed passage (the folder's diff is empty); no locator was re-opened.
- Citations and overlaps: no cross-roadmap citation unresolved; the two flagged Lean names (README line 70) are untouched text that earlier reviews passed; no cited id dropped, no other open pull request changes this roadmap, no second copy on main.

Overlap check: closest roadmaps K2SymbolsBrauer, KTheoryFiniteLocalFields, ArithmeticKTheory, EllipticKTheory, K3BlochGroups (open) and QuadraticFormInvariants (main), scope read in the earlier review of this unchanged text; nothing shared.

Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources at this round; largest share weibel, 21 of 50 locators, carried from the earlier review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The description's account of how the package was produced ("ported the package after 2 red-team rounds on the job board") is not a claim about the head and was not checked.

## Source issues

- none

## For the human reviewers

- none
