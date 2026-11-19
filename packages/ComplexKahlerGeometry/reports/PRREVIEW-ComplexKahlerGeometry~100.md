# Review of ComplexKahlerGeometry (pull request #2536 at 6de659d)

**Verdict:** accepted

**Summary.** Accepted: the 37 lines changed since `4a51aa5` repair the one small correction of the previous review, and they introduce no new problem. Each of the seven newly cited Tau Ceti declarations exists at the pin with the hypotheses the README gives for it. The pull request's title and description agree with the head. There are no findings, no small corrections and no format notes; two licence questions about sources remain for the humans.

## Previous findings

- C01 — repaired: 2.5 now reads "with the long exact coefficient sequence of that colimit (`TauCeti.CategoryTheory.cechCohomologyδ`, …)" and says its Leray comparison and shrinking extend `homologyCechComplexIsoH` and `exists_cechComplexMap_f_eq_zero_of_locally_eq_zero`; the Tau Ceti contract lists all seven.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.5 Leray comparison "extends" `TauCeti.Topology.homologyCechComplexIsoH` (pin `Topology/Sheaves/Leray.lean` 293) | two-disc cover of ℂP¹; cover of ℂ by all unit discs | pin has `[Finite ι]`, vanishing of `H^(k+1)` on nonempty finite intersections: first cover covered by pin, second (infinite index) needs the extension; Demailly IV (5.17) has no finiteness | sound | none |
| 2.5 long exact coefficient sequence (`Cech/LongExactSequence.lean` 79, 136, 144, 160) | `0→ℤ→𝒪→𝒪×→0` on the one-set cover of ℂ× | pin asks Čech complexes short exact on every family: `exp` on sections over ℂ× misses `z`, so it applies to the presheaf-image sequence, as the contract's wording says; needs `HasExactColimitsOfShape J` | sound | none |
| 2.5 vanishing by refinement (`Cech/ModuleCat.lean` 43) | R=ℤ; class dying on finer cover | stated for presheaves into `ModuleCat R`, hypothesis: each class of each family killed by some `E k ⟶ E j`, `j ≤ k`; contract says "presheaf of modules" | sound | none |
| 2.5 paracompact shrinking "extends" `exists_cechComplexMap_f_eq_zero_of_locally_eq_zero` (`Topology/Sheaves/Cech/LocallyZero.lean` 70) | M=ℂ; constant presheaf ℤ | pin has `[CompactSpace X] [NormalSpace X]`, `P(∅)=0`, locally zero sections; ℂ is paracompact, not compact, so the extension is needed; constant presheaf fails `P(∅)=0` | sound | none |
| 2.5 Čech/derived comparison locators | Demailly IV (5.17), (5.19)–(5.21) | (5.17) Leray, printed p. 209 (line 10439); (5.21) paracompact comparison, p. 211 (line 10512), proved from the direct-limit exact sequence (5.19) and refinement lemma (5.20) | sound | none |
| Pull request title and description | against the diff from the base (100 lines, README only) | 0 headings and 0 Lean declarations changed; every named declaration, the 4.5 changes, both new Tau Ceti contract entries and the SmoothBundlesConnections entries are in the diff; TopologicalSheafCohomology on main line 12 reads as described | agrees | none |

The rows of the previous review for untouched statements stand as in that review, of `4a51aa5`.

- Source locators checked against the text: 4 in `demailly-agbook` (IV (5.17) p. 209, (5.19) p. 210, (5.20) and (5.21) p. 211; lines 10439–10515), plus (6.13)–(6.15) p. 216 (lines 10730–10742). All agree.
- Library declarations opened at the Tau Ceti pin: `cechCohomologyδ` (`LongExactSequence.lean` 79), `cechCohomology_exact₂` (136), `cechCohomology_exact₃` (144), `cechCohomology_exact₁` (160), `isZero_cechCohomology_obj_of_forall_exists_homologyMap_eq_zero` (`ModuleCat.lean` 43), `homologyCechComplexIsoH` (`Leray.lean` 293), `exists_cechComplexMap_f_eq_zero_of_locally_eq_zero` (`LocallyZero.lean` 70). The four files named in the contract exist at the paths given.
- Cross-roadmap citations resolved on main: SmoothBundlesConnections B6.1 (soft-sheaf acyclicity and module form, lines 1719–1743); TopologicalSheafCohomology's scope line 12, which the description says must change in that roadmap's folder. No other roadmap on main cites this roadmap's former fine-sheaf target.
- Dependency check: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 27 `sorry` warnings and nothing else; the file is unchanged since `4a51aa5`, so the signature comparison of that review stands.
- Automatic checks: all passed on this head. Changes outside the folder: none.
- Seeded sample: only 2.5 falls in the changed passages; checked above.

Overlap check: read TopologicalSheafCohomology, SmoothBundlesConnections and ComplexComparisonPartII on main for the changed passages; soft-sheaf acyclicity: owner SmoothBundlesConnections B6.1; Čech refinement maps, cover colimit, its exact sequence, finite Leray and compact-normal shrinking: owner Tau Ceti at the pin; paracompact Čech/derived comparison: owner this roadmap. Nothing has two owners.

Source independence: changed passages only; 3 passages compared with 1 source (`demailly-agbook` at IV (5.17), (5.19)–(5.20), (5.21)), none shared beyond theorem names; largest share `demailly-agbook`, 43 of 58 locators; the diff adds, removes or reorders no layer, so the contents comparison of the previous review (independent) stands.

Research link: Layer 8's Iwasawa-manifold computation and nilmanifold comparisons are the starting point of Angella (2012) on the cohomologies of the Iwasawa manifold and its small deformations; 7.8's unitary-character lines are the elliptic input of Berwick-Evans and Tripathy (2021). This rests on the README's References.

## Not verifiable

- `webster-nn`, `koszul-malgrange`, `griffiths-harris`, `hormander-alpdo1`, `raghunathan-discrete-subgroups`, `nomizu-nilmanifolds`, `wells-dacm`: recorded as uncertified, cited by locator only; none is cited in a changed passage.
- The seeded sample outside 2.5 was not reopened: an incremental re-review checks it only where it falls in the changed passages.

Automatic checks set aside as false positives: the scan of cited Lean names reports two as found nowhere, `TauCeti.Analysis.Distribution.DeltaSeries` and `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`. Both are module paths whose files exist at the Tau Ceti pin; the scan looks for declarations, not modules.

## Source issues

- **Misprint** in demailly-agbook at Chapter IV, (5.22), p. 211: the source says the sign rule for alternate cochains holds for permutations of {1,…,q}; it should be permutations of {0,…,q}, since the displayed formula permutes the indices α₀,…,α_q; affects nothing.

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes linked from their authors' university pages (README References); `hormann-steinbauer-distributions` is a 2009 draft of lecture notes on an author's page.
- **Licence.** `ballmann-kahler` (EMS, 2006) is linked from a third party's course page at people.maths.ox.ac.uk, not from the publisher or the author (README References).
