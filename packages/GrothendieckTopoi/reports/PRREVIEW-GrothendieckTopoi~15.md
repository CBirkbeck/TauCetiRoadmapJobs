# Review of GrothendieckTopoi (pull request #1520 at 7d5de30)

**Verdict:** accepted

This is an incremental re-review of the 2 lines changed since 38e9e22: one line of `## Downstream consumers` in `TauCetiRoadmap/GrothendieckTopoi/README.md`. No finding. The gate passes at this head, and `Suggested.lean` elaborates with `sorry` as its only warning.

## Previous findings

- None. The review of 38e9e22 raised no finding: it accepted with R01–R04 of the review before it repaired.

## Verified sound

**The changed line (README line 1472).** The new line says that TotallyDistributiveTopoi consumes 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5 and 7.1. I resolved it against TotallyDistributiveTopoi at the head of its open pull request (#1927, `roadmaps show TotallyDistributiveTopoi`):

- **Its supplier contract.** "From GrothendieckTopoi" (its lines 125–136) names exactly these eight sections.
- **Its build paragraph.** "How to read the build" (its lines 146–147) gives 1.1, 1.2, 1.4, 2.3, 5.2, 5.6 and 6.5 for its Layer 2, and 7.1 for its Layer 3.
- **Its `*Needs:*` lines.** Lines 273, 317, 384, 443, 459, 476, 499, 520 and 581 cite no other section of this roadmap.
- **Its references.** The reference entry at its line 656 gives the same §§1.1–7.1.
- **Every citation in the file.** A tally of every `GrothendieckTopoi <n>` in that file finds no section outside the eight.

The old line, "5.2, 5.6, 6.5 and 7.1", missed four of them. The new list is exact.

**Each consumed section supplies what the consumer assumes of it.** I compared each section of this README with that roadmap's contract:

| Consumer's assumption | This README | Suggested.lean |
|---|---|---|
| 1.1: `IsGrothendieckTopos`, satisfied by `Sheaf J (Type u)` and `Type u` | lines 264–268 | `IsGrothendieckTopos`, line 102 |
| 1.2: balanced; every morphism into an initial object is an isomorphism | lines 292–293 | — |
| 1.4: `isGrothendieckTopos_iff_giraudAxioms` (disjoint and universal coproducts, a small separating family) and every topos as sheaves on a small subcanonical site | lines 334–346 | line 164 |
| 2.3: global sections of `Sheaf J (Type u)` with inverse image `constantSheaf` | lines 436–438 | — |
| 5.2: for `F = Type u`, locally connected iff the constant functor has a left adjoint; `Sh(X)` locally connected iff `X` is | lines 786–792 | — |
| 5.6: `GeometricMorphism.IsEssential` and `isEssential_iff_preservesProducts` | lines 867–869 | lines 428 and 434 |
| 6.5: `exists_equiv_presheaf_iff_essential_points`, `epi_piMap_presheaf`, `isIso_sigma_pi_presheaf` | lines 1019–1028 | lines 466, 478 and 484 |
| 7.1: `Frame.grothendieckTopology`, subcanonical, equal to `Opens.grothendieckTopology X` | lines 1064–1068 | line 496 |

**The rest of the paragraph (lines 1469–1475).**
- **"No roadmap on main cites this one."** This still holds: a grep of main at 754650d finds no file under `TauCetiRoadmap/` naming GrothendieckTopoi.
- **HomotopyTheoryOfCategories.** Its #1521 line 65 marks this roadmap "not used", as the paragraph says.
- **Citations of TotallyDistributiveTopoi.**
  - Its 3.5 (lines 508–520) proves `productsPreserveEpis_and_distrib_sh_lowerIco` and `not_isPresheafTopos_sh_lowerIco`.
  - Its 2.4 (lines 364–384) proves `productsPreserveEpis_and_distrib_iff_exists_essential`.
  - So both citations say what the paragraph uses them for.
- **LocallyPresentableCategories (#1926).** It names this roadmap only in its Scope (line 72) and in Examples (line 348), and has no `*Needs:*` line citing it. Leaving it out of the consumer list is correct.

**Gate, build, direction.**
- **Gate.** The gate run here on 7d5de30 (`gate … --base origin/main`) gives 0 on every check, OK. The worker's `scratch/gate.md` also reports `build=0`.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 with 40 `declaration uses sorry` warnings and nothing else, the same as at 38e9e22.
- **Dependency check.** Output: `depcheck: 238 roadmaps, 2424 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. GrothendieckTopoi is line 398 of the merge order. TotallyDistributiveTopoi is a consumer, not in the merge order yet, and is cited only as a consumer.
- **Pins and outside changes.** The three-dot diff outside the folder is empty. The pins are unchanged: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (`lake-manifest.json` lines 22 and 10).

**Overlaps and citations.**
- **Overlaps.** `scratch/overlaps.md` reports no other open pull request changing this roadmap, no cited id that a pull request drops, and no id that only an open revision defines.
- **Citation leads.** `scratch/citations.md` reports no cross-roadmap citation missing. Its 19 Lean-name leads are the same as at 38e9e22, on unchanged lines: this roadmap's own declared names, a generated Mathlib instance name, `IsLocallyConnectedSite` (Mathlib's open work, named in Scope) and AdicSpacesPartII `Topos.*` (resolved on main in earlier rounds).
- **Ownership.** The diff adds no object, so ownership against the open heads is as in the previous review.

**Seeded sample.** No target of the sample falls in the changed line. It names 1.2 and 6.5 by number only, and their content is unchanged; their consumer-facing content was checked above. Their locators were verified, or recorded under Not verifiable, in earlier rounds.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Downstream consumers, line 1472 (changed) | The set of sections of this roadmap that TotallyDistributiveTopoi cites, from its contract, build paragraph, `*Needs:*` lines and references | Consumer side: {1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5, 7.1}, 8 sections. This README: the same 8. Old line: {5.2, 5.6, 6.5, 7.1}, missing 4 | holds | none |
| Lines 1472–1475: (A) and (B) without being a presheaf topos (unchanged sentence; the changed line opens it) | `Sh([0, 1))` with the lower topology; `B G`; `Sh(ℝ)` | `Opens` is the complete chain `[0, 1]`, which is completely distributive, so (A) and (B) hold. Every `a > 0` is `⨆_{b<a} b`, so no nonzero element is completely join-prime. There is then no essential point, and by 6.5 the topos is not a presheaf topos. `B G` satisfies both and is a presheaf topos. `Sh(ℝ)` fails (A), as computed in 6.5 Check 2 | holds | none |
| 5.6 `IsEssential`, 6.5 Roos, 4.4 Check 3, 8.5 Isbell locator | as in the previous review | the values in the previous review's table, carried forward; the diff touches none of them | unchanged | none |
| Unchanged statements 1.1–1.4, 2.1–2.5, 3.1–3.3, 4.1–4.3, 4.5, 5.1–5.5, 6.1–6.4, 7.1–7.4, 8.1–8.4, 9.1–9.5, Convention 9 and their Checks | as in the r13 table, carried by the previous review | the values in those reports; the diff touches none of them | unchanged | none |

**Principles.**
- No route-specific shortcut, re-planned roadmap, copied passage, algorithm, sorry'd data or `set_option`.
- The Lean file is unchanged since the previous review. Its imports are still `Mathlib` plus `TauCeti.Topology.Sheaves.LocalCohomology.Basic`.

**Declared gaps.** None are declared: there is no readable `design/plan.json`, and the README states none.

## Not verifiable

- SGA 4 IV, Exercice 7.6 (a)–(i), cited by the 5.6 and 6.5 sections that the changed line names, is paywalled, as in earlier rounds. Their mathematics was recomputed in earlier tables, and they are cited by locator alone.

## Source issues

- none
