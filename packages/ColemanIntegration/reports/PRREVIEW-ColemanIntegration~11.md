# Review of ColemanIntegration (pull request #2864 at cc29686)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the previous review, which had no finding; this round read the pull request's title and description against the head, and every sentence of them holds except one clause of the opening summary that places a correction in the wrong part of the README. There are one small correction and two format notes (both carried over), none blocking. One fact about two unopened author copies is left for the human reviewers.

## C01 — The description's summary places the zeta-series correction in the supplier contracts; it is in L2.30

The opening summary of the description says "The contracts replace L3.6’s open-disc and evaluation prototypes with `PowerSeries.OnOpenDisc`, `PowerSeries.evalAt` and its evaluation homomorphism, and correct induction, curve-duality and zeta-series citations." A reader looking for the zeta-series change in the supplier contracts finds none: the Mathlib contract names `HurwitzZeta.hasSum_expZeta_of_one_lt_re` identically at the merge base and at the head. The change is in the proof sketch of L2.30 (line 1837), where the unqualified `hasSum_expZeta_of_one_lt_re` and `expZeta(x, k)` become `HurwitzZeta.hasSum_expZeta_of_one_lt_re` and `HurwitzZeta.expZeta x k`; the curve-duality namespaces likewise change in L1.9 as well as in the JacobianChallenge contract. The bullet "Namespaces" further down the same description says this correctly.

Text that would be right: "The contracts replace L3.6’s open-disc and evaluation prototypes with `PowerSeries.OnOpenDisc`, `PowerSeries.evalAt` and its evaluation homomorphism and correct the induction citation; L1.9, L2.30 and the JacobianChallenge contract give the curve-duality and zeta-series declarations their namespaces."

## N01 — A few words are still fused into code spans or split from them

Carried over unchanged. Examples: "by `a ℂ_p` constant" (L2.3), "locally analytic `primitive F`" (L0.9), "A `primitive G` gives" (L1.19), "`padicValNat` p" (L0.1), "`annulusResidue` A `0 = 0`" (L0.11), "a a branch" (L1.11), and the *Needs* line of L3.11 (line 2914), where "Layer `0, gaussSum, gaussSum_mulShift_eq`" runs a layer number and two Mathlib names into one span.

## N02 — The *Needs* line of L3.13 ends with "2.Fa"

Carried over unchanged (line 2934): the target is L2.Fa, as the proof sketch of the same item writes it.

## Previous findings

- none: the previous report, of the same head, has no finding (R-numbered remark). Its two format notes N01 and N02 are not repaired (the folder did not change) and are written again above.

## Verified sound

| Statement | Instances tried | Values computed (README or description side / library or source side) | Result | Change |
|---|---|---|---|---|
| L0.10 (Lemma), cited by the description's "Logarithm" bullet and summary | `r < 1`; `ℚ₂`, `u = 2`; `q = p⁻ⁿ` in `ℚ≥0` | `n^s rⁿ → 0`; `‖2ⁿ/n‖ ≤ n·2⁻ⁿ → 0`, derivative `1/3`; `p⁻ⁿ → 0` in `ℚ≥0` but `‖p⁻ⁿ‖_p = pⁿ` | true; Tau Ceti's two theorems carry `[ContinuousSMul ℚ≥0 𝕂]` (Logarithm/Basic.lean line 68), which fails p-adically | none |
| "Expansion centred at 1" (description summary) | `HasFPowerSeriesOnBall NormedSpace.log (NormedSpace.logSeries K K) 1 1` | centre `1`, radius `1`: `log(1+u) = Σ (−1)^(n+1)uⁿ/n` at `x − 1 = u` | description = README line 224 | none |
| L3.Fd.1, L3.Fd.2(a) supplier (description "Artin" bullet) | AnalyticNumberTheoryPartI §2.18a on main; AdelicAlgebraicGroups on main | README lines 2671, 2690, 3313, 3354 cite §2.18a; no occurrence of AdelicAlgebraicGroups at the head; its Artin factors are for `X*(G) ⊗ ℂ` | description true | none |
| L0.1–L0.5 *In Tau Ceti* lines (description "Formal primitive" bullet) | five lines, 89, 112, 129, 145, 155 | each names the declarations and the coverage the description lists (`c = 0` case; radius equality and `C(r,ρ)` excluded) | description = README | none |
| Zeta-series and namespace citations (C01) | merge base against head | contract line names `HurwitzZeta.hasSum_expZeta_of_one_lt_re` on both sides; L2.30 sketch changes | summary clause misplaced | C01 |

The rows of the previous review for the untouched statements stand as in the previous review, of `cc29686`.

- Description against the head, claim by claim: pins (`lake-manifest.json` has Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, and the two contract headings name them); "Only `TauCetiRoadmap/ColemanIntegration/README.md` changes" (diffstat: that one file, 261 insertions, 250 deletions; nothing outside the folder); "No section, target or headline theorem is added or removed, and `Suggested.lean` is unchanged" (the only headings that change are the two pin headings; 4 layers at the merge base and at the head; 0 Lean declarations changed); supplier dropped and added stated (AdelicAlgebraicGroups, AnalyticNumberTheoryPartI); "four layers" and the headline list agree with the README's Summary.
- Library declarations opened at the pins this round: 8. Tau Ceti `NormedSpace.one_le_logSeries_radius` and `NormedSpace.log_hasFPowerSeriesOnBall` (Analysis/Normed/Algebra/Logarithm/Basic.lean lines 71, 102, variables line 68), `Subgroup.indClassFun_indClassFun_subgroupOf` (RepresentationTheory/Induction/ClassFunction.lean line 349), `PowerSeries.OnOpenDisc` (RingTheory/PowerSeries/OpenDisc/Basic.lean line 100), `PowerSeries.evalAt` (RingTheory/PowerSeries/EvalAt.lean line 96), `PowerSeries.OnOpenDisc.evalAtHom` (RingTheory/PowerSeries/OpenDisc/Eval.lean line 110); Mathlib `HurwitzZeta.hasSum_expZeta_of_one_lt_re` (used in NumberTheory/LSeries/ZMod.lean line 157). `NormedSpace.logOneAdd` occurs in neither pinned library, as the description says.
- Cross-roadmap citations resolved this round: AnalyticNumberTheoryPartI §2.18a (on main); the absence of AdelicAlgebraicGroups from the head. Main has not changed this roadmap since the merge base.
- Source locators: none re-opened; the diff since the previous review is empty, so the seeded sample falls in no changed passage.
- Automatic checks: every check passed, on the worker's run and on a rerun. Dependency check output: `depcheck: 132 roadmaps, 1475 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ColemanIntegration/Suggested.lean` gives five `declaration uses sorry` warnings (lines 52, 68, 76, 97, 118) and nothing else.
- Headline theorems and padding: unchanged file; the previous review's result stands (only L3.13 statable and stated; the others named in the module docstring; no theorem closes in one tactic).

Overlap check: read PadicHodgeRegulators, PeriodsAndSpecialValues, ZagierConjecturePolylogarithms, HabiroNahmSeries (open), ColemanIntegrationPartII, PolylogarithmFunctions and PadicDifferentialEquationsAndRigidCohomology (main) in the previous review of this same head; no open pull request changes this roadmap, drops an id it cites or cites an id it drops; nothing shared.

Source independence: changed passages only; the folder has no changed passage since the previous review, so 0 passages were compared this round. As the previous review found: 68 locators and 6 further passages compared with 10 sources, none shared; largest share RJW, 107 of about 535 locators; contents compared with RJW §§1–13 and BDJ §§1–7: independent.

Research link: L3.28 is Coleman's 1982 formula for Kubota–Leopoldt values at positive integers (RJW Thm. 6.7; BHYY Thm. 1.1). L3.15 is Besser–de Jeu 2003, Thm. 1.12; L3.36 is Besser–Buckingham–de Jeu–Roblot 2009, Prop. 4.17. L1 underlies Chabauty–Coleman (Balakrishnan–Bradshaw–Kedlaya 2010). Rests on the README and these sources as read.

## Not verifiable

- BH and MP (author copies on their authors' pages), W, FPZ, DJ, Lazard, Kedlaya, Serre, Weibel, Quillen, Feliu, BC and the Stacks tag: not opened this round, as in the previous review.
- RJW page numbers marked "published" (Essential Number Theory 4, 2025): the version of record was not opened.

## Source issues

- **Error** in RJW at Theorem 6.7(ii), p. 39 (arXiv v2): the source gives the left side as the p-adic L-value of `θ` itself at `k`; it should be that of `θω^(1−k)`, since for `p = 5`, `θ = χ₋₃`, `k = 2` the right side is a 5-adic unit while the untwisted value vanishes by parity; affects a stated result.

## For the human reviewers

- **Licence.** BH (lecture notes, 35 locators) and MP (4 locators) are cited from copies on their authors' pages (README References); neither was fetched in this or the previous round, so their host class was not confirmed.
