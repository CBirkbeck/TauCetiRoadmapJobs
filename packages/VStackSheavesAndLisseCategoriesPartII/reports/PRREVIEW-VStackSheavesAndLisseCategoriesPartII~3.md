# Review of VStackSheavesAndLisseCategoriesPartII (pull request #2288 at 8b71332)

**Verdict:** accepted

No finding. Incremental re-review of 0 changed lines since 8b71332; this round read the pull request's title and description against the head.

## Deferred findings

- D01 — stands

## Previous findings

The previous report (of 8b71332) raised no finding of its own; the bullets it carried are accounted for again at this unchanged head.

- R01 — not repaired: deferred (D01).
- R02 — repaired: README line 473 keeps the punctured-disc witness for non-quasiseparatedness of the identity of Spd ℤ_p; line 670 cites that Check.
- R03 — repaired: README line 323 separates the origin (residue field C) from the Gauss point of infinite residual transcendence degree.
- R04 — repaired: README line 224 has the closed parenthesis and names q; line 2014 uses Fix(c̃).
- R05 — repaired: README line 142 cites Stacks07LT, Tag 07LT, for compact = perfect, supplied by DGAInfinity Layer 5.
- R06 — repaired: the description says `Suggested.lean` declares nothing, lists the six supplier requirements and names the build's only warning.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: "commutative coefficients killed by an integer prime to p", "arbitrary prime-to-p torsion coefficient rings" against Conventions (README line 31) and the two EtaleDualityAndPerverseSheaves requirements (lines 109–111) | p = 2: Λ = 𝔽₃, 𝔽₃ × 𝔽₅, ℤ/6, the zero ring | n = 3, 15: admitted (15 is no prime power, so outside the supplier's ℓ-power range: the requirement is needed); ℤ/6: n even, excluded; zero ring: n = 1, admitted. | Description, Conventions and requirements agree | none |
| Description: "categorical traces"; VS8.10 Check, README line 845, with VS8.4 | (S, Λ ⊕ Λ[1]), Λ = 𝔽₃, identity | Signed symmetry: 1 − 1 = 0, equal to the Lefschetz number rank − rank = 0. Unsigned symmetry: 1 + 1 = 2 ≠ 0 in 𝔽₃. | The Check separates the two conventions | none |
| Description: headlines "VS7.5, VS8.9, VS9.1–VS9.3, VS9.6, VS9.8, VS11.4, VS11.9, VS11.12" against the module docstring of `Suggested.lean` | each id | Description: 10 ids. Docstring: VS7.5; VS8.9; VS9.1, VS9.2; VS9.3, VS9.6, VS9.8; VS11.4; VS11.9, VS11.12 = 10 ids, the same set. | Equal | none |
| Description: "six requirements", four on `EnhancedDerivedSheaves` §E3.4 (VS7.4–VS7.5), two on `EtaleDualityAndPerverseSheaves` §§6.2–6.3 (VS9.7–VS9.8) | README lines 91–113 | Four `What EnhancedDerivedSheaves must provide` lines, line 103 names VS7.4 and VS7.5; two for EtaleDualityAndPerverseSheaves (§6.2, §6.3), line 113 names VS9.7 and VS9.8. | 4 + 2 = 6 on each side | none |
| Description: CoCorr_S, trace maps, Lefschetz–Verdier identity, base change of local terms "owned here (VS8.7, VS8.10, VS9.1, VS9.6)"; Igusa §7.9b "later in the merge order" | README lines 26, 2067; merge order | README names the same four ids; merge order: this roadmap at line 131, IgusaVarietiesAndTorsionConcentration at line 189. | Agree; the second owner at the open head is D01 | none |

Rows for the README's own statements stand as in the previous review, of `8b71332`.

- Folder diff since the previous review: 0 lines; outside-folder diff against the base: 0 paths; head `8b71332`, worktree clean.
- Title and description read sentence by sentence against the head: the three summary paragraphs against the README Summary, Scope, Conventions (lines 5–40), `## How to read the build` and `## Downstream consumers` (lines 2064–2069); layer names VS6–VS11 against the six layer headings; folder contents (README, `Suggested.lean`, `metadata.toml`) against the diffstat; "adds a roadmap" against the base (not on main; 96 headings added, 0 removed; 0 Lean declarations). 0 sentences contradicted, 0 unstated changes.
- Cross-roadmap citations: resolver reports 0 unresolved; the 13 supplier headings of `## Exact supplier contracts` each name a roadmap on main or earlier in the merge order (8 confirmed on main by folder: EnhancedDerivedSheaves, SchemeAndStackFoundations, PivotalSpherical, AdicSpacesPartIII, DGAInfinity, EtaleCohomologyFoundations, SmoothRepresentationsOfLocalGroups, DiamondsAndVStacks).
- D01 re-read at the open head of IgusaVarietiesAndTorsionConcentration: §7.9b (README line 2456 there) still constructs a dualizable cohomological-correspondence category with trace maps and proves a relative Lefschetz–Verdier identity; nothing in this folder can settle it.
- Gate rerun on this head: every check 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/VStackSheavesAndLisseCategoriesPartII/Suggested.lean`: exit 0, no output (no `sorry`: the file declares nothing). 0 declarations, hence no signature comparison and no one-tactic probe.
- No source locator was re-read this round (no passage changed, so no seeded target falls in a changed passage); the two entries the previous report filed under `## Source issues` (HKW22 Theorem 4.1.8, p. 24; HKW22 §4.6, p. 44) are not repeated here.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas, AdicCoefficientsAndComparisons, GeometricSatakeAndFusion, DiamondsAndVStacks, SmoothRepresentationsOfLocalGroups and EnhancedDerivedSheaves (the third list is empty); representable exceptional operations: DiamondSixOperations; smooth-stack descent and ULA: VStackSheavesAndLisseCategories; proper maps of v-stacks: DiamondsAndVStacks; Haar measures and admissibility: SmoothRepresentationsOfLocalGroups; scheme comparison: AdicCoefficientsAndComparisons; generic enhancements: EnhancedDerivedSheaves; the fine-stack operations and CoCorr_S: this roadmap (second owner at an open head: D01).

Source independence: changed passages only; 0 passages changed, so 0 compared; the previous comparison (6 passages with 5 sources, none shared; dominant source HKW22; contents independent) stands, no layer having been added, removed or reordered.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- GHW22, the source of Layers VS6–VS7, is an arXiv preprint (2202.12467v1, 2022) with one public version; HKW22, the published article, cites a later numbering of it that is not public.
- The README carries a section `## Corrections to the sources` (lines 2045–2062); no roadmap on main has a section of that name.
