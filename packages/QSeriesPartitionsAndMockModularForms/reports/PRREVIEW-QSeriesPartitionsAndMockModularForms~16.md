# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 5fdb342)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since 5fdb342. This round read the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the summary now reads "rank equidistribution modulo 5 and 7, crank equidistribution modulo 5, 7 and 11, and prime-power congruences", which is what `rank_equidistribution_five_seven` and `crank_equidistribution_five_seven_eleven` state.
- R02 — repaired: "Over every commutative ring … formal q-binomial and Euler identities and Bailey pairs; over ℂ, where they converge, basic hypergeometric series and the q-binomial, Euler and Ramanujan ₁ψ₁ summations."
- R03 — repaired: the dependencies paragraph now names AutomorphicFormsOnReductiveGroups (#1037) and QWittVectors (#1351) as ownership boundaries only, and the three Part II extension contracts with their owners and sections, before "Everything else the README names is on main or is a consumer."

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `rank_equidistribution_five_seven` (summary, R01) | sizes 4, 9, 14 mod 5; 5, 12, 19 mod 7 | every class 1, 6, 27; every class 1, 11, 70 | Keep |
| Rank modulo 11 (the reading the description no longer makes) | sizes 6, 17 | classes 1,2,1,1,0,1,1,0,1,1,2 and 29,29,28,26,26,25,25,26,26,28,29: unequal | Description right to exclude it |
| `crank_equidistribution_five_seven_eleven` (summary, R01) | sizes 4, 9, 14 mod 5; 5, 12, 19 mod 7; 6, 17, 28 mod 11, with `partitionCrank` as defined | every class 1, 6, 27; 1, 11, 70; 1, 27, 338 | Keep |
| `rogersRamanujan_count`, `rogersRamanujan_count_two` (summary: "counting theorems") | n = 0, 1, 2, 9, 15, 20 | first: 1=1, 1=1, 1=1, 5=5, 14=14, 31=31; second: 1=1, 0=0, 1=1, 3=3, 9=9, 20=20 | Keep |
| Carriers of the Layer 2 headlines (summary, R02) | declarations at the head | `qBinomial`, `euler_qExponential`, `ramanujanOnePsiOne_hasSum`, `rogersRamanujan_hasSum`: `ℂ`, `‖q‖ < 1`; `baileyPair`, `baileyLemma_transform`: `{K} [CommRing K]`, unit denominators | Description agrees |
| Location of every roadmap the README names (dependencies paragraph, R03) | 21 names against main (2248bbb) and the open list | on main 9 (ContourIntegration under `Completed/`); open suppliers 5 (#1172, #925, #851, #1314, #1063); open, boundary only 2 (#1037, #1351); open consumers 5 | Description agrees |

The rows for the other statements stand as in the previous review, of 5fdb342: the folder is unchanged.

- Description sentences checked against the head, 14, none contradicted: the three sentences repaired above; the four consumers (`README.md` line 1770); "Maass spaces admitting every half-integral weight and exponential cusp growth" (line 11); the zero-ring claim (line 237); the Schur recurrence (§3.2), the eta-quotient modules and the basis at 11 (§§4.8a, 4.9), the cone models (Layer 7, §10.4); ModularForms §0.2 "The eta transformation and eta quotients" and the normalized Fricke operator on main; the three extension contracts (lines 15, 95, 103, 123); the folder's three files. The title is right: the pull request adds the roadmap (0 headings and 0 declarations removed).
- Merge order: suppliers at lines 47, 55, 98, 116, 153; this roadmap at 252.
- Gate, run for this review at 5fdb342: every counter 0, `OK`; the worker's run adds `build=0`.
- `gate --depcheck … --movable --pr 1391`: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean`: 19 `declaration uses sorry` warnings, nothing else.
- Outside-folder diff against origin/main: empty. `overlaps.md`: no other pull request changes this roadmap, no cited id dropped, no id defined only by an open revision, no second copy (main has no such folder).
- Seeded sample: none of the fifteen targets lies in a changed passage (the folder diff is empty); no source locator was re-read this round.
- Remark on untouched text, no change asked: HabiroCohomologyFoundations (`README.md` line 1770, and the description after it) is named as a consumer although its README at its open head does not cite this roadmap.
- Remark on untouched text, no change asked: the pinned Tau Ceti has `TauCeti/Analysis/SpecialFunctions/QPochhammer.lean` (`multipliable_one_sub_pow_mul` line 106, `tprod_one_sub_pow_mul_ne_zero` line 129, `qTheta` line 95), which the "From Tau Ceti" contract does not name; the README takes the analytic product from GeometryOfNumbersAndQuadraticArithmetic §4.3.
- Overlap check: read HalfIntegralWeightModularForms, HabiroNahmSeries, SpecialFunctionsTheta, SiegelModularForms, ModularForms, ThetaSeries, AnalyticNumberTheoryPartII; nothing shared (the eta multiplier §5.2 and theta coordinates §9.1 are cited from here by the first and fourth; SpecialFunctionsTheta excludes the quintuple product and Rogers–Ramanujan; the Lerch transcendent of AnalyticNumberTheoryPartII §4.1 is a different object from the Appell–Lerch sum).
- Source independence: changed passages only; 0 passages changed, none compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "after 3 independent review rounds and 2 red-team rounds on the job board": the job board's history was not read.
- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified and cited by locator only, as in the previous reports.

## Source issues

- none

## For the human reviewers

- none
