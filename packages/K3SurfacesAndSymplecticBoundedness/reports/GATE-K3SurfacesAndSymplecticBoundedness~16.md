# GATE-K3SurfacesAndSymplecticBoundedness~16: answers to the review of head 28714c3

One review (CBirkbeck, 2026-10-26T09:29:28Z) with three numbered findings. Finding 1 makes five distinct points, so there are seven points, H01–H07. H01–H04 are edits to the pull-request description, which is outside this job's files: each answer gives the exact line for the worker to add. H05 asks for a README change, which is disputed. H06 and H07 are non-blocking and need no change. No file changed: the head stays `28714c3`, and there is no commit.

Line numbers below are file lines at these heads: this roadmap at 28714c3; main at 0301bb0; ComplexKahlerGeometry revision #1234 at 1c03b0e; K3Surfaces #1285 at 43784f8; McKaySkewGroup #223 at a9ef22a; GroebnerGeometry #899 at 163d43c; IndexTheory #1077 at 819f43f; NeronModelsAndSemistableAbelianVarietiesPartII #870 at e974688.

## H01 (CBirkbeck) — answered

The README already gives this chain by section at line 74: ComplexKahlerGeometry's exponential comparison → K3Surfaces K1 → §§1.3, 3.1 and 4.4. The only gap is in the description. Verified edges:
- #1285 lists "CKG K1–K4, K4.P" in its supplier table (line 21) and uses the exponential/Chern comparison in K1 (line 52).
- #1234 states K4.P at lines 568–649.

Line for the worker to add to the description's dependencies and merge order: "#1234 ComplexKahlerGeometry K4.P → #1285 K3Surfaces K1 → this roadmap §§1.3, 3.1, 4.4 (transitive)".

## H02 (CBirkbeck) — answered

The README already gives this chain at line 233: ReflectionInvariantTheory §1 and GroebnerGeometry G1 → McKaySkewGroup §§7.0–7.1 → §7.2 → gap:tame-quotient-singularities → §§6.1–6.1a. It also calls GroebnerGeometry a transitive supplier and says G2–G6 supply no premise. Verified edges:
- #223 names GroebnerGeometry G1 in its supplier list (line 1110) and uses GG1 elimination/standard-monomial verification in §7.1 (line 1145).
- #899 states G1 at lines 63–102.

Line for the worker to add: "#899 GroebnerGeometry G1 → #223 McKaySkewGroup §§7.0–7.1 → §7.2 → this roadmap §§6.1–6.1a (transitive)".

## H03 (CBirkbeck) — answered

The README already gives this edge at line 74: IndexTheory I7.3 → K3Surfaces K1 → K2 → the complex/Betti applications, with IndexTheory named as a transitive supplier. Verified: #1077 states I7.3 (the Dolbeault index of a holomorphic Hermitian bundle) at line 750, and #1285 consumes it in K1 at line 52.

Fix for the worker: add #1077 to the description's "must merge first" list, before #1285.

## H04 (CBirkbeck) — answered

The description's sentence calling every other non-main roadmap a consumer contradicts the README. The README's own direct/transitive split is below; the worker can use it to replace that sentence.

- **Direct suppliers not on main** (supplier sections at lines 70–76, 209–233):
  - K3Surfaces #1285 and McKaySkewGroup #223.
  - Roadmaps earlier in the merge order: CrystallineCohomology #857, NoncommutativeAndEquivariantIwasawa #1307, AlgebraicModuliForArithmeticGeometry #853 and ComplexComparisonPartII #848.
- **Transitive suppliers:**
  - IndexTheory #1077 and the ComplexKahlerGeometry revision #1234, through K3Surfaces K1 (line 74).
  - GroebnerGeometry #899 (with ReflectionInvariantTheory, on main), through McKaySkewGroup §§7.0–7.1 (line 233).
  - TopologicalSheafCohomology #973 and CharacteristicClasses #896, through ComplexComparisonPartII C6.1 (line 213).
- **Consumers or no premise:**
  - PeriodsAndSpecialValues #1496 (lines 21 and 1445) and NeronModelsAndSemistableAbelianVarietiesPartII #870 (line 1443) are consumers.
  - AbelianSchemesAndArithmeticModuli #849, ArithmeticDynamics #1335 and ErdosProgressionPowers #1336 supply no premise (line 21).
  - Line 1448: no consumer supplies a premise.

## H05 (CBirkbeck) — disputed

The README cannot cite "ComplexKahlerGeometry K4.P". ComplexKahlerGeometry is on main, and #1234 revises it rather than adding a new roadmap. This roadmap's supplier rule is that a revising pull request is never a supplier: the roadmap is cited as it is on main. At main 0301bb0:
- K4 runs from line 444 to 567, and K5 starts at line 568.
- The only "exponential" occurrences are Lie-group exponentials, at lines 1563–1565.

So a "K4.P" citation would name a section that the cited roadmap does not have. The README therefore treats the missing stage as the first item of the gap contract on ComplexKahlerGeometry (line 198). Line 196 says the base K3–K4 have no exponential sequence, and line 74 identifies that item as the comparison K3Surfaces K1 consumes. That item matches K4.P point for point: exp(2πif), Pic_hol≅H¹(Oˣ), the connecting map as integral c₁ with pullback naturality, e_j=e_i g_ij, O(1) of degree +1, and only the exact segment used without the vanishing hypotheses. K4.P discharges it once #1234 is on main. The second half of the suggestion is already the state of the file: the intersection adapter (line 199) is the separate extension.

## H06 (CBirkbeck) — answered

No change here; the finding is marked non-blocking. Line 1443 states the direction, §6.0b's generic prefix (lines 776–888, ending before "Rank-five K3 pencils" at line 889) → the companion's §§2.1, 2.3, 2.5, 4.1–4.2, 4.7–4.8 and 4.16–4.17. At #870 head e974688:
- Those sections exist at lines 3796, 3870, 3940, 8859, 8881, 8996, 9020, 9226 and 9268.
- The name K3SurfacesAndSymplecticBoundedness occurs 0 times.

So the adoption is an edit to #870. This roadmap takes no premise from the companion, and the dependency check finds no reciprocal edge.

## H07 (CBirkbeck) — answered

No change is needed. Earlier replies' requests addressed to the worker are not content of this roadmap. The README and Suggested.lean contain no process text: the gate counts are prnum=0, residue=0 and round-labels=0.

## Citation checks (no statement changed)

| Claim | Where checked | Value found | Result |
| --- | --- | --- | --- |
| K4.P absent from ComplexKahlerGeometry on main | main 0301bb0 | "## K4." at line 444, "## K5." at line 568; no K4.P; "exponential" only at lines 1563–1565 (Lie groups) | H05 stands |
| K4.P content equals gap item 1 (line 198) | #1234 lines 568–649 | exp(2πif); Pic_hol≃H¹(Oˣ); segment H¹(O)→Pic→H²(ℤ)→H²(O); e_j=e_i g_ij; O(1) degree 1; conditional iso under H¹(O)=H²(O)=0 | Item for item; the K3 guard at line 198 excludes the conditional iso (h²(O)=1) |
| K1 consumes K4.P and I7.3 | #1285 lines 21, 52 | table row "CKG K1–K4, K4.P"; K1 "Index Theory I7.3 already owns…", "first Chern class/exponential sequence comparison identifies Pic(X)…" | Line 74 correct |
| McKay §7.1 consumes G1 | #223 lines 1110, 1145; #899 lines 63–102 | GG1 in supplier list; §7.1 "GG1 supplies exact elimination/standard-monomial verification"; G1 spans to "## G2" at line 103 | Line 233 correct |
| Merge order | ORDER.txt | this roadmap at 45; CrystallineCohomology 21, NoncommutativeAndEquivariantIwasawa 29, AlgebraicModuliForArithmeticGeometry 35, ComplexComparisonPartII 42; consumers PeriodsAndSpecialValues 204, NeronModelsPartII 58 | No upward edge |

Ownership: no construction was added or moved, and no notion moved down. Ownership against the open pull requests was checked for every stage cited above at the heads listed.

Lean signatures: Suggested.lean has not changed since 8b08c6e (`git diff 14c5246..28714c3` touches only README.md). It has no `variable` or `include` block, so no binder can drop. No new scratch elaboration was needed.

## Build

`lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested`: exit 0, "Build completed successfully (9040 jobs)". There are 6 warnings, all "declaration uses `sorry`", at lines 96, 108, 122, 146, 155 and 167.

## Gate

`gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`--movable`): `depcheck: 55 roadmaps, 638 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

## Sources

No new source was cited and no text was fetched. `needs-references.toml` was not created.
