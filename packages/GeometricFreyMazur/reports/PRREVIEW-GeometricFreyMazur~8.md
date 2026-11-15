# Review of GeometricFreyMazur (pull request #2130 at 50d3389)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 50d3389. The folder is unchanged; this round reads the pull request's title and description, as they stand now, against the head. No finding. The acceptance is conditional on the nine declared supplier gaps.

## Previous findings

- R01 — repaired: the summary block now reads "Tau Ceti's modular-group, triangle-group and isogeny interfaces supply the pinned foundations; gonality and Abramovich's bound come from the CanonicalModelsAndGonality roadmap", which agrees with `TauCetiRoadmap/GeometricFreyMazur/README.md` line 11.

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
| `gonality` (description: "repeats its one-line gonality definition") | K=k(t), f=t; K=k; supplier body at CanonicalModelsAndGonality `Suggested.lean` line 86 (head ed90937) | finrank 1, so sInf=1; K=k has no transcendental f, set empty, sInf=0 as the Conventions say; supplier's set is the same | same body, as described | none |
| `full_monodromy` / §9.6 (description: "full SL₂(𝔽_p) torsion monodromy") | N=1; N=2 with p=227, 229; least proper index of PSL₂(𝔽_p) at p=7, 11 | N=1: gon<1 impossible on a function field, vacuous. 800·2=1600: 7·227=1589 excluded, 7·229=1603 admitted. Indices 7, 11 ≥ p, so (7/800)·index ≥ 7p/800 > N | `800 * N < 7 * p` is what the 7/800 bound needs | none |
| `geometric_frey_mazur` / §9.8 (description: "actual p-torsion isomorphism … yields an isogeny") | N=0; W′=W with e=id and e=−id | gon<0 impossible, any M works; id and −id commute with every σ, and the identity isogeny witnesses `Nonempty` | holds; M is quantified before k and K, as "uniform" says | none |
| §7.5 / §9.5 (description: "every integral curve on Z(p) of gonality less than N lies in a cyclic Hecke locus") | N=1, N=3 | N=1: no curve has gon<1, vacuous; N=3: genus 0 (gon 1) and genus 1 (gon 2) are both <3, the case §10.2 uses | holds; the bound "depending only on N" is that of §9.5 | none |

The rows for all other statements stand as in the previous review, of 50d3389.

- **Description against the head, sentence by sentence (title, 3 summary paragraphs, 3 prose paragraphs): 0 contradicted.** The folder is not on main (1734 insertions, 0 deletions), so "roadmap"/"Adds" is right; the three files named exist. Endpoints match README §§7.5, 8.3, 9.5–9.8, 10.4–10.5 (lines 1096, 1134, 1246–1290, 1376, 1388); "wreath cover and a Hurwitz contradiction" matches line 133; the `Suggested.lean` paragraph matches the file (3 declarations, one `TauCeti.*` import, 8 not-statable groups in the docstring).
- **Library claims of the description opened at the pins (5):** `TauCeti.TriangleGroup` and `lift` (`TauCeti/GroupTheory/TriangleGroup/Basic.lean` lines 80, 174–175), `TauCeti.ModularGroup.triangleGroupEquiv` (`TauCeti/Analysis/Complex/Fuchsian/LevelOne/TriangleGroup.lean`), `TauCeti.Isogeny` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` line 139); the entrywise norm is the README's `Matrix.norm_eq_sup_sup_nnnorm` contract; a whole-word search for "gonality" in pinned Tau Ceti and Mathlib returns 0 files, as the repaired sentence implies.
- **Suppliers named in the description.** The seven "direct open roadmap dependencies" are exactly the README's cited roadmaps not on main; the other five (ModularCurves, SchemeAndStackFoundations, AlgebraicCurves, FuchsianOrbifolds, ComplexKahlerGeometry) are on main. All nine pull-request numbers resolve to the named roadmaps in the open index. CanonicalModelsAndGonality (#1726, another author, new folder, head ed90937) cites MotivesAndAlgebraicCycles, HeightsRationalPointsAndObstructions and CongruenceSpectralGap; they are lines 93, 144 and 159 of the merge order, before GeometricFreyMazur at line 315.
- **Cross-roadmap citation re-resolved.** "CanonicalModelsAndGonality §§1.1–1.7, 8.1–8.7 and 9.1": all fifteen headings exist at head ed90937 (README lines 465–595, 1827–1970, 1995); the 7/800 constant is in its §8.6 (line 1956).
- **Seeded sample and source locators:** no passage changed, so none of the 15 sampled targets falls in a changed passage; no locator was re-read this round.
- **Overlaps.** The overlap report lists no other pull request changing this folder, no dropped id, no id only an open revision defines, and no result-level near-duplicate.
- **Declared gaps.** The nine `What … must provide (gap:…)` sentences (README lines 65–69, 75, 81, 87–91, 109) are unchanged, each with a named supplier; the acceptance is conditional on them.
- Remark (no change requested): the merge-order file has no CanonicalModelsAndGonality line yet; the generated `merge-order` block already places #1726 before this pull request.

Overlap check: read FuchsianOrbifoldsPartII, ModularCurvesPartII, CanonicalModelsAndGonality, FuchsianOrbifolds, ConformalMappingPartII; gonality, analytic gonality and Abramovich's 7/800 bound: owner CanonicalModelsAndGonality (§§1.1–1.7, 8.1–8.7, 9.1), cited here; the projective scalar-level curve, its polygon compactification and the cyclic boundary Hecke correspondence: owner ModularCurvesPartII, cited here; effective projective action, cusps, compactification and hyperbolic trigonometry: owner FuchsianOrbifolds (Layers 0–5; Layer 2 under `gap:hyperbolic-trigonometry`), cited here; nothing shared with FuchsianOrbifoldsPartII (its scope excludes gonality) or ConformalMappingPartII.

Source independence: changed passages only; 0 passages compared with 0 sources, because the folder did not change; largest share and contents comparison stand as in the earlier full review (BT16); the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Sil09 Corollary III.9.4 (§9.2): recorded as uncertified (paywalled); cited by locator alone, not read.
- BLR90 §1.2 Proposition 8 and §1.4 Proposition 2: recorded as uncertified; not read.

## Source issues

- none

## For the human reviewers

- none
