# Review of ArithmeticStatisticsPartVI (pull request #1176 at ca973dc)

**Verdict:** accepted

No finding. The three findings of the previous review, all in the pull request's description, are repaired, and the one README sentence changed since `26c32bd` is correct.

## Previous findings

- R01 — repaired: the description now says "Seventeen suppliers are open roadmap pull requests and merge first: ArithmeticStatisticsPartI, ArithmeticStatisticsPartII, ArithmeticStatisticsPartIII and ArithmeticStatisticsPartV (… in §4.8, the sparsity of cubic fields totally ramified at large primes) …".
- R02 — repaired: the summary block now says "Part VII builds on the two-Selmer mean and height moments"; Part VIII is no longer named.
- R03 — repaired: the summary block now says "Weights, masses and Kummer indices cover every prime, 2 and 3 included; solubility away from square discriminants assumes p odd."

## Verified sound

Incremental re-review of 2 changed lines since `26c32bd` (one sentence of `## Downstream consumers`, `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md:2499`); the diff changes no Lean statement. This round also read the title and description against the head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| README 2499: Part VII consumes §4.12 height moments, §4.10 mean two-Selmer, §4.13 density-zero for rational p-torsion | Part VII README at its open head `ddbc3d0`, every link into this README | Three anchors only: `#412-height-moments` (lines 70, 884 and 20 more), `#410-…` (70, 904), `#413-…` (70, 988, 990). Headings here at 991, 827, 1045 | agrees | none |
| §4.13 "Rational p torsion has density zero" (cited by the changed sentence), p = 2 | X = 10⁶ | \|A\| ≤ 63, \|B\| ≤ 192: about 127·385 ≈ 48,900 pairs; integer root \|t\| ≤ 16 gives ≤ 127·33 = 4,191; ratio ≤ 0.086; exponents 1/2 against 5/6 | agrees | none |
| §4.10 mean three, as Part VII uses it (its line 904: PR(2) gives average 3) | m = 1, p = 2 | `∏_{i=1}^{1}(2^i+1)` = 3; here 1 + τ(PGL₂)·1 = 1 + 2 = 3 | agrees | none |
| Description: "Seventeen suppliers are open roadmap pull requests" | every roadmap name in the README against main `276e711` and the 473 open heads | 20 open names: 17 suppliers as listed, plus PartVII (consumer, line 2499), EllipticCurveModularity and FaltingsFinitenessAndIsogenyTheorems (later owners, line 19) | agrees | none |
| Description: "The other suppliers are on main:" twelve names | folders of main `276e711` | 12 README names on main, the twelve listed (GlobalNumberFields under `Completed/`; RepresentationTheory.InductionRestriction a subfolder) | agrees | none |
| Description: PartV supplies "in §4.8, the sparsity of cubic fields totally ramified at large primes" | README lines citing PartV | lines 71 (contract), 755 and 773, both between 711 (§4.8) and 807 (§4.9) | agrees | none |
| Description: "ArithmeticStatisticsPartVII consumes §§4.10, 4.12 and 4.13"; "Part VII builds on the two-Selmer mean and height moments" | as row 1 | same three anchors; merge order: PartVI line 146, PartVII line 147 | agrees | none |
| Description: "ten `sorry` declarations", "imports `Mathlib` and one Tau Ceti module" | elaboration; import lines | 10 warnings (lines 138–270), 10 theorems; `import Mathlib` and `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup` | agrees | none |

The rows for the untouched statements stand as in the previous review, of `26c32bd`.

- Title: equals the README's `# Roadmap:` subtitle.
- Description sentences checked against the head: 16; contradicted: 0. It states that the pull request adds the roadmap (not on main; 2876 insertions, 0 deletions, 3 files), which the head confirms; no section, declaration or supplier is removed.
- Changes outside the folder against `origin/main`: none (the files listed since `26c32bd` come from the merge of main into the branch).
- Dependency check: `depcheck: 245 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line. The changed sentence names PartVII as a consumer, not a supplier; PartVII is later in the merge order.
- Gate, rerun at this head: every counter 0, `OK`; the worker's gate with the targeted build passed (`build=0`).
- Elaboration of `TauCetiRoadmap/ArithmeticStatisticsPartVI/Suggested.lean`: ten warnings, each `declaration uses sorry` (lines 138, 146, 155, 167, 178, 192, 202, 214, 261, 270); no error, no other warning.
- Resolver: no cross-roadmap citation or Lean name found nowhere; overlaps: no other pull request changes this roadmap, no cited id dropped.
- Remark, generated blocks (outside the check of the text): the `depends-on` block lists 14 open suppliers and the `merge-order` chain omits ArithmeticStatisticsPartV, while the prose correctly names 17; regenerating the blocks would align them.

Overlap check: read ArithmeticStatisticsPartI, PartII, PartIII, PartV, PartVII; nothing shared: PartVII cites §§4.10, 4.12 and 4.13 here by link and restates none of them.

Source independence: changed passages only: 1 passage compared (README line 2499, a statement of which sections a later part uses, with no source behind it), 0 sources, none shared; largest share Reference 1 (Bhargava–Shankar, binary quartic forms), 68 of 173 locators; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The seeded sample's fifteen sections are unchanged text; their source locators were not read again this round and stand as in the earlier reviews.
- The five sources an earlier review lists as uncertified (References 121, 122, 123, 125, 127) were not reopened.
- The description past any cut in the quoted text was not checked.
- "Lake's advisory that the file does not opt into the module system" (description, Validation): the direct elaboration does not print Lake's advisories; the worker's targeted build passed.

## Source issues

- none (no source was opened this round; the entries of the earlier reviews stand).

## For the human reviewers

- **Not tested.** No report of this folder records a comparison of the README's arrangement with Reference 1 (Bhargava–Shankar, 68 of 173 locators): each incremental round compared changed passages only.
