# Review of RankOneConverse (pull request #1805 at 9b5c88a)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 9b5c88a; this round reads the pull request's title and description against the head. No finding, new or carried.

## Previous findings

- none to account for: the previous report, of this same head, has no finding (its R01 of the round before was recorded there as repaired, and §3.1 still reads "lettered (a)–(e) as in the source and cited elsewhere in this roadmap as B(a)–B(e)").

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description: "Theorem B … a simple zero of L(f/K,s), rank d and finite Sha" against README §3.1 | d=1, d=2; factor orders (0,1), (1,0), (1,1) | d=2: ord L(f/K)=1, ord L(A_f/K)=1+1=2, rank 2; sums 1, 1 allowed, 2 excluded | description and §3.1 agree | none |
| Description: BFH "stated here on the pinned newforms, Fricke signs, analytic ranks and fundamental-discriminant characters" against `infinite_twist_analyticRank_eq_zero` / `_eq_one` | level 11, k=2, S₀={11}; D=5, −4, 1 | w₁₁=−1, so ε=i²·(−1)=+1; D=5: χ₅(11)=1, εD=5>0 admitted; D=−4: χ(11)=−1 rejected; D=1 one element, set still infinite-claim nonvacuous | Lean signature as described; `#check` types match §4.1 | none |
| Description: "A and A′ (rank d with finite Sha forces analytic order one) … C … E" against §§4.3, 4.4, 5.3, 6.2 | d=2 in A; twist order 0 vs 1 | A: each conjugate order 1, product 2=d; B then 1−0=1 (A, C), 1−1=0 (E) | agrees with the README | none |
| Description: "no main-conjecture equality or nondegenerate p-adic height is assumed" against §§2.2, 2.4, 3.1 | X=Λ, Λ/(t²), Λ/(p,t) | char 0, (t²), (1); coinvariant ranks 1, 1, 0: only the inclusion is used | agrees ("single inclusion", "No … nondegeneracy of a p-adic height") | none |

The rows for every other statement stand as in the previous review, of 9b5c88a.

- Title and description, read sentence by sentence against the head (step 8): 9 sentences of the summary block and 9 of the prose; none is contradicted. It adds a new roadmap (not on main; 54 headings and 3 Lean declarations added, 0 removed), which the title and "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" state; nothing is removed or renumbered. The head commit after the one the description was written for only letters the hypotheses of §3.1 and changes nothing the description describes.
- The description's "Validation" line recomputed: gate re-run at this head, `gate RankOneConverse: … OK` with every counter 0 (readme-ids-missing=0, set_option=0, sorry-data=0, outside-folder=0); the worker's gate adds build=0; `git diff --stat origin/main...HEAD` outside the folder lists 0 paths; worktree clean.
- Dependency check: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; RankOneConverse is line 399 of the merge order, after every supplier.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RankOneConverse/Suggested.lean` gives exactly two warnings (`declaration uses sorry`, lines 69 and 84). The `#check @name` probe on a scratch copy prints the three types: `IsPrimitiveQuadraticTwist` keeps `{N M} [NeZero N] [NeZero M] {k : ℤ}`; both theorems keep `hχ`, `hk`, `ε`, the Fricke-sign equation, `S₀` and its two hypotheses. Nothing changed.
- Library declarations opened at the pin: 1 (`TauCeti.Multiquadratic.IsFundamentalDiscriminant`, `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean` line 68; the lead in the citation list is a false alarm).
- Cross-roadmap citations resolved again at the open heads: 9 (EllipticCurveModularityPartII §6.0e; ModularIwasawaMainConjectures §5.4; AutomorphicCongruences §2.22; MetaplecticAutomorphicForms §§8.85–8.87; ArithmeticStatisticsPartI §0.6 target "Squarefree integers in residue classes"; ArithmeticStatisticsPartVI "Rank one selmer criterion", "Twisted rank one selmer criterion"; GrossZagierAndArithmeticHeights §§8.17, 9.20, 9.22; HeegnerPointEulerSystems §§7.11–7.12; ModularForms Layers 5 and 9 on main). All 18 suppliers the README names are on main (EllipticCurves, PadicMeasuresIwasawaAlgebras, ModularForms) or among the 15 of the description's dependency list.
- Source locators checked against the text this round: 0 (no passage of the folder changed, so no target of the seeded sample falls in a changed passage; they stand as verified in the earlier reviews of this text).
- Remarks, no change asked: the description's "everything else named in the README is a consumer, not a prerequisite" also covers ModularIwasawaMainConjectures §5.4, which the README names to delimit scope, neither as supplier nor consumer; it is not a prerequisite, as the sentence says. RankZeroOneBSDPartII (open) still cites "RankOneConverse §§PC.0–PC.6", labels this README does not have; that is a matter for that pull request.

Overlap check: read RankZeroOneBSDPartII, CMRankZeroConverse, HeegnerPointEulerSystems, AutomorphicCongruences, ModularIwasawaMainConjectures, ModularForms; nothing shared (RankZeroOneBSDPartII and CMRankZeroConverse name RankOneConverse as owner of the rank-one localization criteria; Wan's divisibility is owned by AutomorphicCongruences §2.22, the main-conjecture rank-zero converse by ModularIwasawaMainConjectures §5.4, cross-level multiplicity one and twists by ModularForms, each cited here).

Source independence: changed passages only: 0 passages compared with 0 sources (the folder is unchanged since 9b5c88a), none shared; largest share skinner-2020, 29 of 42 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Licence.** bsw-2026 (arXiv:2603.20886v2, 2026) is an unpublished preprint; README §1.2 and the GrossZagierAndArithmeticHeights contract rest the eigenlogarithm nonvanishing on its Theorems 1.1 and 2.3.
