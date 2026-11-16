# Review of CountableStructureSpacesPartII (pull request #2418 at 6279c84)

**Verdict:** accepted

Incremental re-review of the 8 lines changed since `e5ed4f8` (`TauCetiRoadmap/CountableStructureSpacesPartII/README.md` lines 10–12 and 1486–1487). No finding.

## Previous findings

- none: the previous review, of `e5ed4f8`, had no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Changed passages (Summary lines 10–12; Layer 6 Dependencies lines 1486–1487) | word sequence of the whole README at `e5ed4f8` against this head | identical word for word; only line breaks moved, two lines over 100 characters wrapped | no statement changed | none |
| 6.4 Check cited at line 1486 (`not_borelComplete_of_rank_bounded` on `wellOrderClass lt`, `ρ` = order type) | `K = wellOrderClass lt`; `α = ω`; `α = ω + 1` | `K_ω`: one orbit; `K_{ω+1}`: two; each `K_α` countably many Borel orbits, `K_α ≠ K`. Types: `ℵ₁`, against `𝔠` in 6.3, decisive only if `ℵ₁ < 𝔠` | holds | none |
| 6.5 use of CountableStructureSpaces worked example 2 (line 1487) | one unary predicate | orbits indexed by `(|P|, |¬P|)` with sum `ℵ₀`: countably many, so smooth; `eZero` has `𝔠` classes; Scott height at most `ω` | holds | none |

The rows for the untouched statements stand as in the previous review, of `e5ed4f8`.

- Cross-roadmap citations of the changed passage resolved again at the supplier's open head: 3 (CountableStructureSpaces §4.4 with `exists_uniform_bfSeparation`; §6.2 with `wellOrderClass`, `analytic_type_bounded`, `exists_mem_wellOrderClass_type_eq`, `analyticSet_compl_wellOrderClass`, `not_measurableSet_wellOrderClass`; worked example 2, "One unary predicate"). NoncompactQuantumSymmetry M1.BorelRealization and `exists_polishTopology_continuousSMul` are still at its open head.
- Dependency check: `depcheck: 241 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at 6279c84: every check 0, OK; the worker's targeted build OK. Elaboration of `TauCetiRoadmap/CountableStructureSpacesPartII/Suggested.lean` (unchanged since `e5ed4f8`): 13 `sorry` warnings, no error, no other warning.
- No file changed outside the folder; `Suggested.lean` and `metadata.toml` are unchanged, so the 20 signatures, the one-tactic probe and the headline list stand as in the previous review.
- Pull-request text read against this head: title, summary block and prose agree with the folder (new roadmap, 40 headings, 20 declarations, suppliers CountableStructureSpaces and NoncompactQuantumSymmetry still open); the change alters nothing they describe.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped or defined only by an open revision.

Overlap check: read CountableStructureSpaces, CountableModelCounting, BorelEquivalenceRelations; nothing shared (as in the previous review; the change adds no object).

Source independence: changed passages only; 2 passages compared with 5 sources, none shared (the wording is that of `e5ed4f8`, re-wrapped); no layer added, removed or reordered, so the arrangement was not compared again; largest share paolini-shelah-tfab, 13 of 54 locators.

## Not verifiable

- friedman-stanley-1989, gao-idst, becker-kechris-1996, hjorth-kechris-1996, mekler-1981, kechris-cdst: uncertified, cited by locator only, as in the previous review; the change adds no locator.

## Source issues

- none

## For the human reviewers

- **Licence.** montalban-cst1 and montalban-cst2 are cited as author's drafts (`TauCetiRoadmap/CountableStructureSpacesPartII/README.md` lines 1511–1514), 11 of 54 locators; their numbering was not compared with the published volumes.
- **Not tested.** The headline theorems' primary source, friedman-stanley-1989, is uncertified: its wording and section order were not compared with Layers 2, 3 and 6.4.
