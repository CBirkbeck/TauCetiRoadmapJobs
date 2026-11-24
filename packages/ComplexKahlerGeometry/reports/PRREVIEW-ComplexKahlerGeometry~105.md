# Review of ComplexKahlerGeometry (pull request #2536 at 6de659d)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review of `6de659d`, and the pull request's title and description, read sentence by sentence against this head and against the change from the base, agree with both. There are no findings, no small corrections and no format notes. Two licence questions about sources remain for the humans.

## Previous findings

- The previous review of `6de659d` raised no finding, small correction or format note; there is nothing to account for.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Description: 2.5 "takes acyclicity from SmoothBundlesConnections B6.1" (soft sheaves acyclic; module form) | `S¹`: constant sheaf ℝ versus smooth one-forms | B6.1 on main (lines 1623–1647): soft ⇒ `Sheaf.H`=0 in positive degrees on paracompact Hausdorff; modules over `smoothSheafCommRing` soft. Constant ℝ: `H¹=ℝ`, not a module, excluded | agrees | none |
| Description: Tau Ceti "already declares" refinement maps, homotopies, cover colimit | declarations opened at the pin | `cechComplexMap` (`Cech/Basic.lean` 278), `cechComplexMapHomotopy` (377), `cechComplexHomologyMap_eq` (419), `cechCohomologyDiagram` (`Cech/Colimit.lean` 92), `cechCohomology` (127), `cechCohomologyδ` (`LongExactSequence.lean` 79) | agrees | none |
| Description: 4.5 "proves that the sheaf of continuous functions is soft, takes the softness of the smooth one from B6.1's module form" | README 4.5, lines 1123–1126 | head: `C⁰_ℂ` soft by continuous partitions of unity, `C^∞_ℂ` as a module over smooth real functions; both acyclic by B6.1; `S¹` Check: locally constant ℂ has `H¹=ℂ≠0` | agrees | none |
| Description: "No other statement and no Lean declaration changes; only … README.md is touched" | diff from the merge base `4306cc7` | 100 lines (76 insertions, 24 deletions), README only; 0 headings, 0 layers, 0 Lean declarations changed; no file outside the folder | agrees | none |
| Description: "the Tau Ceti contract gains two entries"; Needs lines of 2.5 and 4.5, Layer 2 and Layer 4 dependencies, scope and contract for SmoothBundlesConnections "follow" | each hunk of the diff | two new bullets in the Tau Ceti contract (Čech complexes; Čech cohomology results); seven further hunks at the places named, none elsewhere | agrees | none |
| Description: TopologicalSheafCohomology's scope "names ComplexKahlerGeometry K2 as the owner of fine-sheaf acyclicity" and does not consume K2 | that README on main | line 12 says K2 owns "analytic resolutions, fine-sheaf acyclicity and Čech/derived comparison"; it is the only mention of this roadmap there | agrees | none |
| Summary block: eight layers; headline theorems Newlander–Nirenberg, Dolbeault–Grothendieck, Serre duality, Hodge decomposition, Hard Lefschetz "remain unchanged" | README headings and opening overview at head | Layers 1–8 present with the titles of the base; all five theorems stated in the overview; `Suggested.lean` identical to the base | agrees | none |
| Title | against the diff | soft-sheaf acyclicity now cited from B6.1 (2.5, 4.5); refinement maps cited from Tau Ceti (2.5, 4.5) | agrees | none |

The rows of the previous review for the statements of the folder stand as in that review, of `6de659d`.

- Source locators checked against the text: none new; the folder did not change, and the description cites no source locator.
- Library declarations opened at the Tau Ceti pin: 6 (listed in the second row).
- Cross-roadmap citations resolved on main: SmoothBundlesConnections B6.1 (heading line 1614, soft sheaves lines 1623–1647); TopologicalSheafCohomology scope line 12. No other roadmap on main names a fine-sheaf acyclicity target of this roadmap.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 27 `sorry` warnings and nothing else.
- Automatic checks: all passed on this head. Changes outside the folder: none.
- Another open pull request (RiemannHypothesisForDirichletLFunctions and others, #3027) also changes this roadmap's README and conflicts with this head; the description's merge-order block states the order (this pull request first), so nothing is raised.
- Seeded sample: no changed passage, so no sampled section was reopened.

Overlap check: read TopologicalSheafCohomology, SmoothBundlesConnections and ComplexComparisonPartII on main for what the description assigns; soft-sheaf acyclicity: owner SmoothBundlesConnections B6.1; Čech refinement maps, cover colimit, its exact sequence, finite Leray and compact-normal shrinking: owner Tau Ceti at the pin; paracompact Čech/derived comparison: owner this roadmap. Nothing has two owners.

Source independence: changed passages only; the folder has no changed passage since `6de659d`, so 0 passages compared; largest share `demailly-agbook`, 43 of 58 locators; no layer added, removed or reordered, so the contents comparison of the earlier review (independent) stands.

Research link: Layer 8's Iwasawa-manifold computation and nilmanifold comparisons are the starting point of Angella (2012) on the cohomologies of the Iwasawa manifold and its small deformations; 7.8's unitary-character lines are the elliptic input of Berwick-Evans and Tripathy (2021). This rests on the README's References.

## Not verifiable

- `webster-nn`, `koszul-malgrange`, `griffiths-harris`, `hormander-alpdo1`, `raghunathan-discrete-subgroups`, `nomizu-nilmanifolds`, `wells-dacm`: recorded as uncertified, cited by locator only; none is cited in a changed passage.
- The seeded sample was not reopened: an incremental re-review checks it only where it falls in changed passages, and there are none.

Automatic checks set aside as false positives: the scan of cited Lean names reports two as found nowhere, `TauCeti.Analysis.Distribution.DeltaSeries` and `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`. Both are module paths whose files exist at the Tau Ceti pin; the scan looks for declarations, not modules.

## Source issues

- **Misprint** in demailly-agbook at Chapter IV, (5.22), p. 211: the source says the sign rule for alternate cochains holds for permutations of {1,…,q}; it should be permutations of {0,…,q}, since the displayed formula permutes the indices α₀,…,α_q; affects nothing.

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes linked from their authors' university pages (README References); `hormann-steinbauer-distributions` is a 2009 draft of lecture notes on an author's page.
- **Licence.** `ballmann-kahler` (EMS, 2006) is linked from a third party's course page at people.maths.ox.ac.uk, not from the publisher or the author (README References).
