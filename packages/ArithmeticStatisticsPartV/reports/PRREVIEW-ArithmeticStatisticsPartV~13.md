# Review of ArithmeticStatisticsPartV (pull request #1175 at 2a99ce1)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 2a99ce1; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- none: the previous report (of `2a99ce1`) listed no finding; its R01 of the round before was recorded there as repaired, and the passages it names (README:60, 62, 2143, 2145, 2721) are unchanged.

## Verified sound

### The pull request's text against the head

| Sentence of the title or description | What the head shows | Result |
| --- | --- | --- |
| Title "fields and class-group statistics" | README:1 has the same title | agrees |
| "`FieldStatistics.davenportHeilbronn_cubicFields`, `FieldStatistics.davenportHeilbronn_threeTorsion`" | `Suggested.lean:64`, `:76`, inside `namespace FieldStatistics` (line 51) | agrees |
| "with their secondary terms, quartic and quintic field counts, Fouvry–Klüners four-rank moments, nonabelian … moments, fixed-degree upper bounds, monogenic and binary-form lower bounds" | `roberts_cubicFieldsSecondary`, `davenportHeilbronn_threeTorsionSecondary`, `bhargava_quarticQuinticFields`, `fouvryKluners_fourRankMoments`, `lowDegree_alternatingMoment` and §3.27, `schmidt_fieldCount_uniform`, `monogenicField_lowerBound`, `binaryFormField_lowerBound` | agrees |
| "Isomorphism-class, embedded and rigid field counts stay separate; Parts VI–VIII consume the results" | README:3 and README:7; README:2725 | agrees |
| "Klüners' counterexample to Malle's conjecture" | §3.9 (README:1076), `kluners_cyclotomic_lowerBound` | agrees |
| "Maximality criteria, scalar moment determinacy and Artin reciprocity are imported" | README:11, 15, 16 (Tau Ceti `eq_maximal_of_squarefree_discr`, `Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp`, ClassFieldTheory) | agrees |
| "polynomial-to-field transfers that avoid the trace-zero sieve"; "conjectures stay propositions" | README:2438, 2710; README:34 | agrees |
| "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | the folder holds exactly these three files; the change is 3601 insertions, 0 deletions, the roadmap is not on main | agrees |
| "the Lean imports none of them" | `Suggested.lean:2–6`: `import Mathlib` and four `TauCeti.*` modules | agrees |
| "The open pull requests that must merge first are in the merge order below. Roadmaps on main are cited by name" | the nine suppliers not on main (ArithmeticStatisticsPartI–IV, GenericDoublePointInterpolation, GeometryOfNumbersAndQuadraticArithmetic, InductionRestrictionPartII, InverseGaloisAndArithmeticFundamentalGroups, SieveMethodsAndPrimePatterns) are all in the chain; the fifteen others named as suppliers, ClassicalArithmeticCompletion among them, are on main | agrees |
| "the targeted Lake build succeeds with `sorry` as the only warning; … no `set_option` overrides; the dependency gate shows no upward edge" | gate and elaboration below | agrees |

Nothing a reader must know is left unstated: the pull request adds one roadmap folder, removes no heading and no declaration, and changes nothing outside the folder.

### Computed adversarial pass

The diff changes no statement; the rows are for the two declarations the description names.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| `davenportHeilbronn_cubicFields` (`Suggested.lean:64`) | weight on a non-Galois and a cyclic cubic field; `ε=±1`; `X=1000` | non-Galois: 3 embedded conjugates × `1/3` = 1; cyclic: 1 × `3/3` = 1. Limits `1/(12ζ(3))=0.06933`, `1/(4ζ(3))=0.20798`. Known counts below 1000: 27 real, 127 complex, ratios 0.027, 0.127, below the limits as the negative `X^(5/6)` term requires | Pass |
| `davenportHeilbronn_threeTorsion` (`Suggested.lean:76`) | `m=1`; `ε=−1`, `X=100`; small `X` | `total 1` counts fields (one class with `c¹=1`). 31 imaginary fundamental discriminants above −100; three-torsion 3 at −23, −31, −59, −83, −87, else 1: mean `41/31=1.32<2`. For `X≤3`, `0/0=0`, which the limit ignores | Pass |

The rows for all other statements stand as in the previous review, of `2a99ce1`.

- Gate: run on this head against the moved merge order with the targeted build: every count zero, `depcheck=0`, `build=0`, `OK`; the worker's gate agrees.
- Dependency check (the brief's command, `--movable`): `depcheck: 247 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 41 `declaration uses sorry` warnings and no other output.
- Cross-roadmap citations: all 48 distinct link targets (215 uses, 11 roadmaps) resolve to a heading or anchor of the cited README, on main for 4 roadmaps (HeightsAndUnits under `Completed/`) and at the open head for 7.
- Outside the folder: `git diff --stat origin/main...HEAD` with the folder excluded is empty.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped by an open pull request; none is defined only by an open revision.
- Overlap check: read ArithmeticStatisticsPartI, ArithmeticStatisticsPartIII, AnalyticNumberTheoryPartI; nothing shared: they own families and local specifications, orbit counts and sieves, and the analytic inputs, which README:7, 22 and 68–78 cite; none owns a field or class-group statistic.
- Source independence: changed passages only: 0 passages compared (the folder is unchanged since `2a99ce1`); largest share reference [5], 27 of 162 linked locators; the arrangement was not compared again, since no layer was added, removed or reordered.
- Remark on untouched text (no change requested): references [5] and [91] of the README are the same arXiv version of one paper.

## Not verifiable

Carried from the previous report; nothing in this round depends on them.
- Reference [134] (Bruin–Hemenway, Acta Arithmetica 159, 2013), cited at README:2110 and README:2127: no legal copy was read; the criterion is restated in ref103 line 1375 and ref135 line 268.
- Friedman–Skoruppa, the source of the relative regulator-ratio bound: not read.
- The integral-basis data of the degree-eight field of §3.30 (README:2085) are hypotheses of the application and were not recomputed.
- The description's sentence on AI assistance describes the author's process and cannot be checked against the head.

## Source issues

- **Gap** in ref103 at §5, proof of Theorem 3, p.22: the source says the character on the enlarged governing field is defined through the modulus of the smaller field, with no divisibility shown; it should be an enlargement whose discriminant is divisible by eight times that modulus; affects the proof.
- **Misprint** in ref103 at (5.2), p.23: the source says the indicator tests sixteen dividing the class number of discriminant `−p`; it should be discriminant `−4p`, as in the first line of §5; affects nothing.

## For the human reviewers

- none
