# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 4735f07)

**Verdict:** accepted

Incremental re-review of 2 changed lines since 5fdb342: the prior-work paragraph added to §3.5 (`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` line 503). No finding.

## Previous findings

- The previous report, of 5fdb342, had no finding of its own (its R01–R03 bullets recorded repairs of an earlier report, all repaired); there is nothing to carry.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §3.5 law `Π_K P̂₊(1;X)=1`, with `P̂₊(1;X)=∏_(j≥1)(1−Xʲ)` (README line 181) | coefficients of degree 0–5 over ℤ; p = 1,1,2,3,5,7; product = 1−X−X²+X⁵+… | 1; 1−1=0; 2−1−1=0; 3−2−1=0; 5−3−2=0; 7−5−3+1=0 | Keep; agrees with the Check "1,0,0,0,0 through degree 4" |
| Same law over 𝔽₂ and the zero ring | 𝔽₂: Π = 1+X+X³+X⁴+…, `P̂₊` = 1+X+X²+… (README line 201) | degrees 0–4: 1, 0, 0, 0, 0 (mod 2); zero ring: 0 = 0 = 1 | Keep; "over every commutative ring" holds |
| Wrong model: `P̂(1;X)` (factor j=0 kept) in place of `P̂₊` | `P̂(1;X) = (1−1)·P̂₊ = 0` | Π·0 = 0 ≠ 1 in a nonzero ring | Excluded by the text, which names `P̂₊` |
| Line 503: "proves (Σₙp(n)Xⁿ)·∏_(i≥1)(1−Xⁱ)=1 … over a commutative ring carrying a Hausdorff ring topology" | the cited file at commit f8b9b72, lines 68–84 | `variable (R) [CommRing R] [TopologicalSpace R] [T2Space R]`; `powerSeriesMk_card_partition_mul_tprod_one_sub_pow [IsTopologicalRing R]`: `mk (card n.Partition) * ∏' i, (1 - X ^ (i + 1)) = 1`, `open scoped PowerSeries.WithPiTopology` | README sentence agrees |
| Line 503: "(Weiyi Wang, Apache-2.0)" | file header lines 2–4; the repository's `LICENSE` at that commit | "Authors: Weiyi Wang", "Released under Apache 2.0"; Apache License 2.0 | Agrees |
| Line 503: "Prior work, not a supplier" | `*Needs:*` of §3.5 (line 505), supplier contracts, `Suggested.lean` imports | no LeanPool entry in any `*Needs:*` line or contract; imports are `import Mathlib` only; no declaration of `Suggested.lean` states the §3.5 law | Agrees |

The rows for the other statements stand as in the previous review, of 5fdb342.

- External locator checked against its text: 1 (the LeanPool file at the pinned commit; statement, hypotheses, author and licence).
- Library declarations opened at the pin: `Nat.Partition.genFun` and `Nat.Partition.hasProd_genFun` (`Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean` lines 57, 170), `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow` (`Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean` line 183). Neither pinned Mathlib nor pinned Tau Ceti has the product law for the partition series (searched `card_partition`, `powerSeriesMk_card`), so citing it as outside prior work rather than as a library declaration is right.
- Pull request text against this head: the added paragraph names no supplier, removes nothing and changes no statement; the description's dependencies paragraph speaks of roadmaps and is not contradicted. Title right (the pull request adds the roadmap). No sentence needs changing.
- Gate, run for this review at 4735f07: every counter 0, `OK`; the worker's run adds `build=0`.
- `gate --depcheck … --movable --pr 1391`: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean`: 19 `declaration uses sorry` warnings, nothing else. The file is unchanged since 5fdb342.
- Outside-folder diff against origin/main: empty. `overlaps.md`: no other pull request changes this roadmap, no cited id dropped, no id only an open revision defines, no second copy. Seeded sample: none of the fifteen targets lies in the changed passage.
- Overlap check: read HalfIntegralWeightModularForms, HabiroNahmSeries, SpecialFunctionsTheta, SiegelModularForms, ModularFormsPartII, ModularForms, AnalyticNumberTheoryPartII, ThetaSeries; nothing shared (as in the previous review; the changed passage adds no object).
- Source independence: changed passages only; 1 passage compared with 1 source (the cited file's docstring at its line 77), none shared (the README gives the formula, not the docstring's sentence); arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified and cited by locator only, as in the previous reports.

## Source issues

- none

## For the human reviewers

- none
