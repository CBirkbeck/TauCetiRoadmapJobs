# Review of GroupActionsOnRiemannSurfaces (pull request #1728 at bb14724)
**Verdict:** needs changes

Incremental re-review of 0 changed lines since bb14724: the folder is byte-identical to the head the previous review read. This round reran the gate and read the pull request's title and description against the head. **README** means `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md`.

## R01 (P2) — SurfaceTopology is cited as a supplier; the gate's `dropped` rule fails

**Location** README:104, 339–341, 751, 752, 816, 913, 974 (and README:821, "Surface topology Layer 9"): "From *Surface topology* (`../SurfaceTopology`): Layer 7 … Layer 8 (classification of compact surfaces), Layer 9 (mapping class groups `MappingClassGroupPlus`, Dehn twists, Lickorish generators)."

**Claim** SurfaceTopology is on the project's list of roadmaps that are never cited as suppliers, so the compact-surface presentation of §2.4 and the boundary-relative mapping classes of §3.4 have no admissible owner; the gate fails (`dropped=7`).

**Witness** Gate at bb14724: `dropped: line 104, 339, 751, 752, 816, 913, 974`. The same objects have owners earlier in the order: TeichmullerGeometry §0.0f, §0.0h, §4.3 (open head 417bd27); GeometricTopology Layer 1.7.2 and AlgebraicTopology Layer 1 on main.

**Repair** Remove every mention of SurfaceTopology and repoint:
- README:104 → "closed and boundary-relative mapping class groups (GeometricTopology Layer 1.7.2, TeichmullerGeometry §0.0h) and the classification of compact surfaces (TeichmullerGeometry §0.0f)".
- README:339–341 → "From TeichmullerGeometry §0.0f: polygon schemas, the standard models `StandardSurface.orientable g b` with word of handle blocks and hole blocks, and the classification of compact surfaces with boundary; §0.0h: `MappingClassGroupFull`. From GeometricTopology Layer 1.7.2: `Mod(F)` and `Mod⁺(F)` relative to the boundary, Dehn twists and Lickorish's twist theorem. From AlgebraicTopology Layer 1: the van Kampen presentation."
- README:751–752 → "… using TeichmullerGeometry §0.0f for the polygon word of the compact surface with `r` boundary circles and AlgebraicTopology Layer 1 for the presentation. *Needs:* §§1.2–1.4; BelyiMaps Layers 5–6; TeichmullerGeometry §0.0f; AlgebraicTopology Layer 1."
- README:816 → replace "SurfaceTopology Layers 7–8" by "TeichmullerGeometry §0.0f; AlgebraicTopology Layer 1".
- README:821 → replace "Surface topology Layer 9" by "GeometricTopology Layer 1.7.2".
- README:913 and 974 → replace "SurfaceTopology Layers 7–9" by "TeichmullerGeometry §§0.0f, 0.0h; GeometricTopology Layer 1.7.2".

Tested on the instances §2.4 and §3.3 use: `orientable 0 3` has `χ = 2 − 0 − 3 = −1`, free `π₁` of rank 2 on `γ₁, γ₂, γ₃` with `γ₁γ₂γ₃ = 1` (signature `(0;2,3,7)`); `orientable 1 1` has `χ = −1`, one relation `[a,b]c = 1` (signature `(1;3)`). The generated `<!-- depends-on -->` block of the description then loses its `#271 SurfaceTopology` line, and the `<!-- merge-order -->` block its `#271` entry, when they are regenerated.

## R02 (P3) — the description names two consumers as roadmaps this one builds on

**Location** Pull request description, prose: "Builds on the sibling drafts #1726 (CanonicalModelsAndGonality), #1708 (FiniteGroupInvariants), #1707 (HyperellipticCurves)."

**Claim** The head contradicts the sentence: CanonicalModelsAndGonality and FiniteGroupInvariants are consumers of this roadmap, not suppliers, and four open suppliers are not named in the prose.

**Witness** README:1696–1698: "CanonicalModelsAndGonality consumes the complex action criteria …; FiniteGroupInvariants can compare … The supply runs from this roadmap to those consumers." Neither name occurs elsewhere in the README; README:102–103, 110, 336 cite the four other open suppliers.

**Repair** Replace the sentence by: "Builds on the open roadmaps HyperellipticCurves (#1707), TeichmullerGeometry (#1169), InverseGaloisAndArithmeticFundamentalGroups (#850), MordellLawrenceVenkatesh (#1231) and ArithmeticGaloisRepresentations (#856). The sibling drafts CanonicalModelsAndGonality (#1726) and FiniteGroupInvariants (#1708) consume it."

## Previous findings

- The previous report (of bb14724) listed no finding; nothing to account for.

## Verified sound

| Statement | Instances tried; computed values on both sides | Result / change |
| --- | --- | --- |
| §2.4 presentation of the punctured quotient (touched by R01) | Compact model `orientable h r`: `χ = 2 − 2h − r`. `(0;2,3,7)`: `χ = −1`, free rank `1 − χ = 2`, three peripherals with product 1. `(1;3)`: `χ = −1`; S₃ `a=(12), b=(23)`: `[a,b] = (123)² = (132)`, `(132)(123) = 1`. | Statement stands; supplier repointed (R01). |
| §3.4 mapping-class action (touched by R01) | Boundary-relative group: annulus `ℤ` (twist nontrivial rel boundary), full group lets the boundary move (twist trivial). Sphere: `Mod⁺` trivial, full group of order 2; §3.6 uses the orientation-preserving one. | Statement stands; supplier repointed (R01). |
| §3.3 Hurwitz move (cited by the changed text of R01's repair) | S₃: `((12),(23)) ↦ ((13),(12))`; products `(123)` and `(123)`; both pairs generate six elements. | Pass. |

Rows for all other statements stand as in the previous review, of `bb14724`.

- Gate, rerun at bb14724: every scanner 0 except `dropped=7` (R01); FAIL. The full gate's `depcheck: NOT IN ORDER` line is placement only, not a finding.
- Dependency check with the candidate order: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with nine `declaration uses sorry` warnings (lines 117, 127, 132, 140, 147, 153, 159, 171, 176) and nothing else.
- Cross-roadmap citations resolved for R01's repair: TeichmullerGeometry §§0.0f, 0.0h, 4.3 at its open head 417bd27 (README lines 215, 251, 540); GeometricTopology Layer 1.7.2 (main, README line 36); AlgebraicTopology Layer 1 (main, README line 895).
- Description against the head: 9 layers (0–8) and 48 numbered subsections, `metadata.toml` topic `math.AG`, 21 Lean declarations, the folder added (not on main), no file outside the folder: all as the description says. The summary block agrees with the head's headings and with README:1694–1699.
- Overlap check: read CanonicalModelsAndGonality, BelyiMaps, TeichmullerGeometry, FuchsianOrbifolds; shared objects (classification of compact surfaces, mapping class groups) are owned by TeichmullerGeometry and GeometricTopology and are to be cited from them (R01); nothing else shared.
- Source independence: changed passages only; 0 passages changed, so 0 compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Unchanged from the previous report: Macbeath 1973 §2, Farkas–Kra V.2.9, Breuer beyond the excerpt, Broughton, Harvey Theorem 4, Singerman Theorem 1, Ries §3, Chevalley–Weil, Kani–Rosen (paywalled or not held); no line changed cites them.

## Source issues

- none

## For the human reviewers

- **Scope.** SurfaceTopology is on the project's never-cite list while its pull request #271 is still open and appears in this description's generated depends-on and merge-order blocks; whether #271 stays a dependency is not settled by this review.
