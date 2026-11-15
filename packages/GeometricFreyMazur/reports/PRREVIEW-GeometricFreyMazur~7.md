# Review of GeometricFreyMazur (pull request #2130 at 50d3389)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 50d3389. The folder is unchanged; this round reads the pull request's title and description against the head. One P3 finding, in the description; nothing in the folder needs to change.

## R01 (P3) — The summary block attributes gonality to Tau Ceti

**Location:** pull request description, `roadmap-summary` block, "Approach and generality": "Mathlib’s matrix groups and norms and Tau Ceti’s modular, gonality and isogeny interfaces supply the general foundations."

**Claim:** The head contradicts it. The pinned Tau Ceti has no gonality interface; gonality and Abramovich's bound come from the CanonicalModelsAndGonality roadmap, which is why `Suggested.lean` repeats the definition.

**Witness:** A whole-word search for "gonality" in the pinned Tau Ceti (2fd255d9) and Mathlib returns 0 files. `TauCetiRoadmap/GeometricFreyMazur/README.md` line 11 and `Suggested.lean` lines 11–13 name CanonicalModelsAndGonality §1.1 as the owner.

**Repair:** Replace the sentence with: "Mathlib’s matrix groups and norms and Tau Ceti’s modular-group, triangle-group and isogeny interfaces supply the pinned foundations; gonality and Abramovich’s bound are imported from the CanonicalModelsAndGonality roadmap."

## Previous findings

The previous report (of 50d3389) had no finding; there is nothing to account for.

## Verified sound

**Gate, dependency check, elaboration (rerun at 50d3389).**

```text
gate GeometricFreyMazur: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 244 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The worker's gate reports `build=0`. `lake env lean` on `TauCetiRoadmap/GeometricFreyMazur/Suggested.lean` exits 0 with two warnings, both `declaration uses sorry` (lines 58 and 78). The diff outside the folder is empty.

**Adversarial table** (statements the description cites; no statement changed).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| `gonality` (description: "repeats its one-line gonality definition") | K=k(t) with f=t, f=t²; body at CanonicalModelsAndGonality `Suggested.lean` line 85 (head ed90937) | finrank 1 and 2, so sInf=1; the supplier's body is `sInf {n \| ∃ x, Transcendental k x ∧ finrank k⟮x⟯ F = n}`, the same set | same body, as described | none |
| `full_monodromy` / §9.6 (description: "full SL₂(𝔽_p) torsion monodromy") | N=2; least proper index of PSL₂(𝔽_p) at p=7, 11, 13 | 800·2=1600: 7·227=1589 fails, 7·229=1603 passes; indices 7, 11, 14 ≥ p, so (7/800)·index ≥ 7p/800 > N > gon | hypothesis `800 * N < 7 * p` is the one the 7/800 bound needs | none |
| `geometric_frey_mazur` / §9.8 (description: "actual p-torsion isomorphism … yields an isogeny") | N=0; W′=W with e=id and e=[2], p odd | gon<0 is impossible, so any M works; id and [2] are equivariant and the identity isogeny witnesses the conclusion | holds; M is quantified before k and K, as "uniform" says | none |
| §7.5 / §9.5 (description: "every integral curve … of gonality less than N lies in a cyclic Hecke locus") | N=1, N=3 | N=1: no curve has gon<1, vacuous; N=3: genus 0 has gon 1 and genus 1 has gon 2, both <3, matching the threshold M_3^geom of §10.4 | holds; description's bound "depending only on N" is M_N^geom | none |

The rows for all other statements stand as in the previous review, of 50d3389.

- **Description against the head, sentence by sentence.** Title: the folder is not on main and the change is 1734 insertions, 0 deletions, so "roadmap" (an addition) is right. Endpoints named in the description match README §§7.5, 9.5–9.8 and 10.4–10.5 (lines 1096, 1246–1290, 1376, 1388). "Wreath cover and a Hurwitz contradiction" matches the build paragraph (line 133). The `Suggested.lean` paragraph matches the file: three declarations, one `TauCeti.*` import (`TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic`), eight not-statable groups in the docstring.
- **Suppliers named in the description.** The seven "direct open roadmap dependencies" are exactly the README's suppliers that are not on main (ModularCurvesPartII, ComplexComparisonPartII, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, InverseGaloisAndArithmeticFundamentalGroups, CongruenceSpectralGap, CanonicalModelsAndGonality); ModularCurves, SchemeAndStackFoundations, AlgebraicCurves, FuchsianOrbifolds and ComplexKahlerGeometry are on main. The nine pull-request numbers resolve to those roadmaps in the open index. CanonicalModelsAndGonality (#1726, another author, new folder) cites MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions and CongruenceSpectralGap; they are lines 93, 144 and 159 of the merge order, before GeometricFreyMazur at line 315.
- **Cross-roadmap citation re-resolved.** "CanonicalModelsAndGonality §§1.1–1.7, 8.1–8.7 and 9.1": all fifteen headings exist at head ed90937 (README lines 465–595, 1827–1970, 1995); the 7/800 constant is in its §8.6 (line 1956).
- **Library declarations opened this round:** none new; the pinned search for a gonality interface (0 files in Tau Ceti, 0 in Mathlib) is the witness of R01.
- **Seeded sample and source locators:** no passage changed, so none of the 15 sampled targets falls in a changed passage; no locator was re-read this round.
- **Overlaps.** The overlap report lists no other pull request changing this folder, no dropped id, no id only an open revision defines, and no result-level near-duplicate. Overlap check: read FuchsianOrbifoldsPartII, ModularCurvesPartII, CanonicalModelsAndGonality (scope compared in the previous reviews; unchanged text); gonality is owned by CanonicalModelsAndGonality and cited, nothing else shared.
- **Declared gaps.** The nine `What … must provide (gap:…)` sentences are unchanged; an acceptance after R01 is repaired remains conditional on them.
- Remark (no change requested): the merge-order file has no CanonicalModelsAndGonality line yet; the generated `merge-order` block already places #1726 before this pull request.

Source independence: changed passages only; 0 passages compared with 0 sources, because the folder did not change; largest share and contents comparison stand as in the earlier full review (BT16); the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Sil09 Corollary III.9.4 (§9.2): recorded as uncertified (paywalled); cited by locator alone, not read.
- BLR90 §1.2 Proposition 8 and §1.4 Proposition 2: recorded as uncertified; not read.

## Source issues

- none

## For the human reviewers

- none
