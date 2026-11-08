# Review of HomotopySpheres (pull request #1287 at bb91dff)

**Verdict:** needs changes

This is an incremental re-review of the 6 lines of `TauCetiRoadmap/HomotopySpheres/Suggested.lean` changed since `0705b9a`: the import at line 3 and the docstring sentence at lines 9–11. The new import resolves at both Tau Ceti pins, so the P1 core of the previous R01 is repaired: the merged file no longer fails at its third line. Three findings remain. The first is R01's residual, downgraded to P3: the branch still pins Tau Ceti `a91d3aa` while the README is written at `2fd255d`. The other two are carried unchanged, because the folder diff does not touch them and the description is unchanged: double ownership against three later open roadmaps (P2), and supplier items that only open revisions define (P3).

## R01 (P3) — The branch still pins Tau Ceti `a91d3aa`, while the README and the docstring describe main's `2fd255d`

**Location.** `lake-manifest.json` (branch: Tau Ceti `a91d3aa`, Mathlib `6b7abb3`). `TauCetiRoadmap/HomotopySpheres/Suggested.lean`:3 `import TauCeti.Geometry.Diffeomorphism.Disc` and :9–11 "reached through `TauCeti.Geometry.Diffeomorphism.Disc`, whose public imports re-export them". The same file at :37–38: "Tau Ceti's `TauCeti.OrientedConnectedSum`. The pins have that connected sum". README:331–380, the Tau Ceti supplier contract.

**Claim.** This is the previous R01, partly repaired.

- **What is repaired.** The import is now valid at both pins (table below). The merged file therefore no longer fails at line 3, which was the P1. The previous report was wrong to say that no module name serves both pins: `Disc` does.
- **What remains.** The branch has not moved to main's manifest. 12 of the README's 25 backticked `TauCeti.*` names exist only at `2fd255d`:
  - the 6 `OrientedConnectedSum` names (the structure and five lemmas), plus `ConnectedSum`;
  - `dense_isRegularValue`, `isNullSet_image_criticalPoints`;
  - `degreeAtRegularValue`, `exists_bandHomeomorph`;
  - `Manifold.Orientation.IsOrientationPreservingAt`.

  At the branch pin, README:332 (`Orientation/OrientedAtlas.lean`) and `Suggested.lean`:38 ("the pins have that connected sum") are false. The `Disc` import is a workaround for exactly this split, and imports a module whose own declarations the file never uses.
- **Why P3 and not P1.** Nothing is false or fails at the pin the merge produces. The pull request does not touch `lake-manifest.json`, so the merge takes main's pins, and no edit inside the folder can repair the split.

**Witness.** At `a91d3aa`, `Geometry/Manifold/` has no `ConnectedSum/`, `Sard/` or `Degree/` directory, and `Orientation.lean` is a file, not a directory. At `2fd255d`, `ConnectedSum/Oriented.lean`:143 has `def OrientedConnectedSum` and `Sard/EqualDimension.lean`:112 has `theorem dense_isRegularValue`.

**Repair.**
1. At the worker's rebase, merge main into the branch, so that `lake-manifest.json` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.
2. Build `TauCetiRoadmap.HomotopySpheres.Suggested` at those pins.
3. Replace line 3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`, the module that declares both names, and delete the sentence at lines 9–11.

I tested this by reading at `2fd255d`:
- `OrientedAtlas.lean`:129 and :283 have the same binders as `a91d3aa` `Orientation.lean`:178 and :332.
- `Boundary/Charts.lean` is byte-identical at the two pins.
- The Mathlib diff `6b7abb3..1b1ccf4` of the 13 files the statements use has no rename or signature change.

The README needs no edit.

## R02 (P2) — Three later open roadmaps still own, at their heads, objects this roadmap owns

**Location.** README Layers 3B (James reduced product, word filtration, James map, connected James equivalence, James splitting), 4A.1–4B.8 (convenient substrate, stable `O`/`SO`, real Bott periodicity) and 7B–7C (Wall forms and formations, `L_n(ℤ)`).

**Claim.** This is the previous R02, not repaired. The folder needed no edit and none was made. The description is unchanged and still names none of the three pull requests. None of the three heads cites this roadmap, and each still owns the same objects:

- **GeneralAlgebraicKTheoryPartII** (#1742, head `3f10248`). README:274: "Layer 4 first supplies the chromatic interfaces and the James construction its proofs need". Headings `### 4.30b The James reduced product` at :1208 and `### 4.30c The stable James splitting` at :1243.
- **DGFloerPartII** (#1799, head `4e506b6`). README:21–23 builds "the convenient category of compactly generated spaces … and the stable orthogonal groups with real Bott periodicity". README:110 says "Bott periodicity is proved here in its real form". Its 4.2a–4.2c are at :1240, :1294 and :1352.
- **GeometryOfNumbersAndQuadraticArithmetic** (#851, head now `6143cad`). README:103–104: "The Wall form and formation groups of §6.8 with their calculations are specified with the integral L-theory they feed". `### 6.8 Formations` is at :2702.

**Witness.** `grep -c HomotopySpheres` returns 0 in each of the three READMEs at those heads. In `ORDER.txt`, HomotopySpheres precedes all three.

**Repair.** As in the previous report, and outside the folder: the description names #1742, #1799 and #851 as consumers that must replace §§4.30b–c, 4.2a–4.2c with their Layer 1, and §6.8 by citations of 3B, 4A.1–4B.8 and 7B–7C. Alternatively, it states the reverse settlement as a human's decision.

## R03 (P3) — Two supplier items are defined only in open revisions the description does not name

**Location.** README *Needs* lines and contracts that cite "AlgebraicTopology Stage 4 item 8" (25 occurrences, e.g. :145, :434, :862, :870). README:96 and :728 cite "GeometricTopology §1.4".

**Claim.** This is the previous R03, not repaired. The description's merge-order paragraph is unchanged (#861 → … → #942 → this pull request).

- **AlgebraicTopology Stage 4 item 8.** On main (`c4fb24e`), AlgebraicTopology Stage 4 has items 1–7 only (README:499–848). Main's README:115–117 still assigns the compactly generated adjunction to HomotopySpheres §3A. Item 8 exists at #1663 (`a6488e3`, README:1039). #1652 (`9cac1ae`) has it as §4.8 (README:1342), with an old → new numbering map (README:563–581), so either head serves.
- **GeometricTopology §1.4.** Main's GeometricTopology has no §1.4. #1797's head has `### 1.4 Connected sum` at README:708, and #903's at README:763.

**Witness.** `scratch/overlaps.md`: "GeometricTopology §1.4 (lines 96, 728): #903 … #1797 … that pull request must merge first". Main's AlgebraicTopology README has no `8.` item between :499 and :849.

**Repair.** Name #1663 (or #1652) and #1797 in the description's merge-order paragraph, as merging before this pull request. The README needs no edit.

## Previous findings

- R01 — partly repaired: `Suggested.lean`:3 is now `import TauCeti.Geometry.Diffeomorphism.Disc`, which reaches the oriented-atlas module through public imports at both `a91d3aa` and `2fd255d`. The manifest still pins `a91d3aa`/`6b7abb3`, and 12 README Tau Ceti names exist only at `2fd255d`. Carried as R01 above, at P3.
- R02 — not repaired: the description is unchanged; #1742 (§4.30b–c), #1799 (4.2a–c) and #851 (§6.8) still own the objects and cite no HomotopySpheres section. Carried as R02 above.
- R03 — not repaired: the merge-order paragraph is still "#861 (HilbertModules) → … → #942 (TangentialBordism) → **this pull request**", naming neither #1663/#1652 nor #1797. Carried as R03 above.

## Verified sound

**Gate, dependency check and outside-folder diff.** My run of the push gate at `bb91dff`:

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 236 roadmaps, 2421 edges, 0 problem(s)
```

- There is no UPWARD or CYCLE line.
- The worker's gate at this head records `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty.

**The changed import, traced at both pins.**

- At `a91d3aa`:
  - `Diffeomorphism/Disc.lean`:9 `public import TauCeti.Geometry.Manifold.Instances.ClosedBall`;
  - `Instances/ClosedBall.lean`:16 `public import TauCeti.Geometry.Manifold.Orientation`;
  - `Orientation.lean`:178 `def orientationPreservingGroupoid` and :332 `structure IsOrientedAtlas`.
- At `2fd255d`:
  - `Disc.lean`:9 `public import …Instances.ClosedBall.Basic`;
  - `ClosedBall/Basic.lean`:17 `public import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`;
  - `OrientedAtlas.lean`:129 and :283, with the same `variable (I) in` and `(I) (n) [NeZero n]` binders and the same three fields.
- The docstring sentence at :9–11 is therefore true at both pins.
- Only six modules exist under the same name at both pins and publicly re-export the declarations. By import-closure size, `Disc` is the second lightest; only `TauCeti.KnotTheory.Slice.Basic` is lighter. The choice is reasonable for the workaround.

**Elaboration at the branch pin (`a91d3aa`/`6b7abb3`).** I ran `lake env lean` on a scratch copy with `#check @name` appended for all 19 declarations. The output was 16 `declaration uses sorry` warnings and nothing else. The 19 signatures are identical to the previous report's: every binder listed there is present, and no declaration lost a section variable.

The worker's `signatures.md` lists two pseudo-declarations, `below);` and `*,`, and errors at "line 233/237". These come from its extractor reading docstring text at `Suggested.lean`:41 and :90; they are not errors of the file.

**Padding probe.** In a second scratch copy, every `sorry` became `first | rfl | simp | infer_instance | trivial | decide | exact Subsingleton.intro (fun _ _ => rfl)`. All 16 theorems still fail: 12 type mismatches (probe lines 131–203) and 4 unsolved goals (107, 120, 219, 228). So nothing is padding.

**Reading the merged state (Mathlib `6b7abb3..1b1ccf4`, Tau Ceti `a91d3aa..2fd255d`).** In the 13 Mathlib files behind the statements, the changes are:

- `convert!`→`convert` in proofs;
- `HomotopyGroup` proof refactors;
- additive `interior_quadrant`/`𝓡c` lemmas;
- new `Matrix` unitary lemmas.

The files are `Instances/Sphere`, `Instances/Real`, `HomotopyGroup`, `Diffeomorph`, `UnitaryGroup`, `InteriorBoundary`, `VectorBundle/Tangent`, `SimplyConnected` and the `OpenPartialHomeomorph` files. None renames or re-signs `Matrix.orthogonalGroup`, `EuclideanHalfSpace`, `𝓡∂`, `ModelWithCorners.boundary`, `HomotopyGroup.Pi`, `ContinuousMap.HomotopyEquiv`, `TangentBundle` or `Homeomorph.toOpenPartialHomeomorph`. Tau Ceti's `Boundary/Charts.lean` is byte-identical at the two pins.

**Sources at the sampled targets the change touches** (`milnor_hcobordism`; printed page = PDF page − 5).

| Target | Locator and finding |
| --- | --- |
| 1.7 (README:640, :654–656, :659; `Suggested.lean`:89–90) | Theorem 9.1 is at line 2784 (PDF 112 = p.107). Hypotheses (lines 2786–2789): W, V, V′ simply connected; H_*(W,V)=0; dim W ≥ 6. Conclusion: W ≅ V×[0,1]. Definition 9.2 is at line 2804, and the remark after it runs over lines 2807–2823 (PDF 112–113 = pp.107–108), deriving that both ends are deformation retracts. Correct as stated. |
| 10.3/10.4 (README:3089–3110) | Only the import behind `IsOrientedAtlas`/`orientationPreservingGroupoid` changed. The route (Milnor 9.1 in dimension 7, then a reflection) and the elaborated statement are unchanged. |

The other seeded targets (1.1–1.4, 2.2, 2.4, 5.0b, 9.1–9.3, 9.5, 9.6, 10.2) are in untouched README text and are carried from the r9 and r10 tables.

**Adversarial table.** Rows for unchanged statements cite r10 (which carries r9). Rows for the changed passages, and for the statements whose elaboration context changed, carry computed values.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `Suggested.lean`:3 import | `a91d3aa` vs `2fd255d` | Disc→ClosedBall→Orientation (all `public`) vs Disc→ClosedBall.Basic→Orientation.OrientedAtlas (all `public`) | resolves at both; Pass |
| Docstring :9–11 | both pins | `orientationPreservingGroupoid` at :178 / :129 and `IsOrientedAtlas` at :332 / :283, identical binders | true at both; Pass |
| Docstring :37–38 "the pins have that connected sum" | `a91d3aa` vs `2fd255d` | no `ConnectedSum/` directory vs `Oriented.lean`:143 | false at the branch pin; R01 |
| README Tau Ceti names | 25 backticked `TauCeti.*` | 13 at both pins, 12 only at `2fd255d` | R01 |
| `smoothPoincareSix_oriented`, context | `#check` before and after the import change | binders T2, SecondCountable, Compact, `IsManifold (𝓡 6) ∞`, `IsOrientedAtlas (𝓡 6) ∞` on A and B, `HomotopyEquiv M (Sphere 6)`: identical | Pass |
| `PreservesOrientedAtlases`, sign | M = S⁶, A = B an oriented atlas; B′ = B composed with the reflection r(x₀) = −x₀ | f = id: det of the coordinate changes > 0; against B′, det(Dr) = −1, so id fails and f = r gives (−1)(−1) = +1 | the existential needs the reflection, as 10.3 routes; Pass |
| `PreservesOrientedAtlases`, degenerate pair | e ∈ A and e′ ∈ B with f(e.source) ∩ e′.source = ∅ | the composite is the empty partial homeomorphism, which lies in every groupoid | no spurious constraint; Pass |
| 16 admitted theorems, probe | one-tactic chain above | 12 type mismatches, 4 unsolved goals | none is padding |
| 1.7 locator and hypotheses | Milnor 9.1 / Lean | p.107, remark pp.107–108; simple connectivity of W plus both inclusions homotopy equivalences ⇔ Milnor's 1)–2) (r10 rows) | Pass |
| `exists_diffeomorph_prod_Icc_of_hCobordism` (S⁵×I; D⁶; M₀ = ∅; S⁵×I minus a ball; n = 4) | r10 / r9 rows | r9 | Pass (unchanged) |
| 1.1, 1.2–1.6, 2.1–2.4, 5.0, 5.1, 6B, 8.2, 9A.4 | r10 / r9 | r9 | Pass (unchanged) |
| `sphere_parallelizable_iff`, 3C.5 | r9 (n = 1, 2, 3, 7, 8) | r9 | Pass (unchanged) |
| Bott periodicity and the seven base entries | r9 (sharp instances at n − 1) | r9 | Pass (unchanged) |
| Fourth to seventh stems | r9 (sharp instances) | r9 | Pass (unchanged) |
| `nonempty_diffeomorph_sphere_six`, 10.2 | r10 / r9 | r9 | Pass (unchanged) |

**Library declarations opened** (file:line at the pin named).
- `a91d3aa`:
  - `Geometry/Diffeomorphism/Disc.lean`:9;
  - `Geometry/Manifold/Instances/ClosedBall.lean`:16;
  - `Geometry/Manifold/Orientation.lean`:178 and :332;
  - `Boundary/Charts.lean`:195.
- `2fd255d`:
  - `Disc.lean`:9;
  - `Instances/ClosedBall/Basic.lean`:17;
  - `Orientation/OrientedAtlas.lean`:129 and :283;
  - `ConnectedSum/Oriented.lean`:143;
  - `Sard/EqualDimension.lean`:112.

**Cross-roadmap citations resolved this round.**
- Main at `c4fb24e`: AlgebraicTopology Stage 4 (items 1–7, README:499–848) and README:115–117; GeometricTopology layer headings (no §1.4).
- AlgebraicTopology at #1663 (`a6488e3`, item 8 at :1039) and #1652 (`9cac1ae`, §4.8 at :1342, numbering map at :563–581).
- GeometricTopology at #1797 (§1.4 at :708) and #903 (§1.4 at :763).
- GeneralAlgebraicKTheoryPartII at #1742 (`3f10248`), DGFloerPartII at #1799 (`4e506b6`), GeometryOfNumbersAndQuadraticArithmetic at #851 (`6143cad`).
- The conflict with #284 has a stated order: the description says this pull request carries #284's baseline.

**Remarks on untouched text (no change requested).** None this round.

## Not verifiable

- **Elaboration at main's pin (`2fd255d`/`1b1ccf4`).** The brief allows Lean only in this worktree, which pins `a91d3aa`. The merged-state check above is by reading the two library diffs.
- **5.0/5.1 and 9.2.** 5.0/5.1 rest on Milnor, *Topology from the Differentiable Viewpoint*, §7; 9.2 also cites Gray and Fomenko–Fuchs locators. Both are untouched since r9, and no legal text was found (r9).
- **Ownership against open pull requests.** I checked through `roadmaps show`/`grep` and the heads named above. Pull requests without supplied files were not searched beyond that.

## Source issues

- none
