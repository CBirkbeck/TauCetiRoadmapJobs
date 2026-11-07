# GATE-TangentialBordism~4: answers to the review of 7 November (reviewed head 72a97ac, current head ac710dc)

One review comment, with two findings (F01, F02), numbered H01 and H02. Line numbers refer to
`TauCetiRoadmap/TangentialBordism/README.md` at `ac710dc` unless another file is named. Both
findings concern the pull-request description, and neither needs a change to `README.md` or
`Suggested.lean`. This job made no file change and no commit. The description text the worker
should install is under "Description repair" below.

## H01 (CBirkbeck) — applied differently

The finding holds. "8.13" does not occur in AlgebraicTopology on main, where Stage 8 ends at item 12 (`:2061`). It does not occur at #1652 (c686921), where Layer 8 ends at `### 8.12` (`:3300`). It exists only as Stage 8 item 13 at #1663 (8029fe9, `:2371`: smoothing `:2410`, relative transversality with its parametric step `:2448–2454`). The two heads conflict in `AlgebraicTopology/README.md`, so #1663 must be named in the description beside #1652.

The repair differs from the suggested one in one respect. It does not pick which of #1652 and #1663 merges first, because this roadmap's ids resolve in either order. #1663's Stage 8 items 1–12 are #1652's 8.1–8.12 one for one: for example item 10 (`:2196`) is 8.10 Ordinary representability (`:3055`), and item 12 (`:2356`) is 8.12 Classical EM comparisons (`:3300`). #1663's Stage 6 item 3 (`:1327`) is #1652's 6.3 (`:1936`). So whichever head is rebased second carries "Layers 2–4, 6, 8", "6.3" and "8.13" together. Rebasing those two pull requests is for their author to do, not this pull request.

## H02 (CBirkbeck) — applied

The finding holds, and the repair is in the description (text below). The README is unchanged, as the review says. On main, DifferentialGeometry has "5.5 Densities, and Stokes with corners" (`:528`). #886 (a565de6) splits it into 5.5a (`:841`) and 5.5b (`:850`), and no bare 5.5 bullet remains. So 5.5b is main's 5.5 cited at the head that drops it, and #886 becomes a named prerequisite. The content claimed in the supplier row `:244` is present at that head: the face structure (`:850`), the abstract boundary ∂̃M, the outward-first sheet orientation (`:914`) and the (−1)^m product boundary sign (`:923–924`).

## Same pattern: GeometricTopology at #903

After the reviewed head, commit ac710dc moved the GeometricTopology citations to #903's numbering: Layer 11.1 (`:342`, `:630`, `:659`, `:804`, `:2200`, `:2222`, `:2273`) and Layer 11.3 (`:343`, `:628` and the same *Needs:* lines). The move was needed because #903 (b647e5c) drops main's section "The smoothing-and-triangulation comparison" (main `:930`, item 1 at `:938`). At #903 that heading occurs 0 times, and its anchor table (`:517–523`) maps item 1 to Layer 11.3. Layer 4.3.1, the declared gap gap:finite-quadratic-arf (`:84`, `:245`, `:270`, `:296`, `:316`, `:325`), also exists only at #903 (`:3460`). The description must therefore name #903 too.

The content matches the supplier row `:245`:
- 11.1 (`:12944`) gives the CW structure on `Realization K` whose closed cells are the realized simplices.
- 11.3 (`:13010`) is the Cairns–Whitehead smooth triangulation.
- 4.3.1 specifies the Arf algebra exactly as the gap paragraph `:259–274` requires: the symplectic-basis formula, the Gauss sum, the zero count and the Lagrangian criterion, with m = 0 included.

The overlap scan misses all of these for the same reason it missed 8.13: they are subsection ids.

## Description repair (for the worker)

Replace "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652" with:

> Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652 (AlgebraicTopology Layers 2–4, 6 and 8, and 6.3), #1663 (AlgebraicTopology 8.13), #886 (DifferentialGeometry 5.5b) and #903 (GeometricTopology Layers 4.3.1, 11.1 and 11.3). #1652 and #1663 conflict in `TauCetiRoadmap/AlgebraicTopology/README.md`. Either may merge first, with the other rebased on it, and this pull request merges after both. The cited ids resolve in either order.

## Only an open revision defines

| Cited id | Lines | Defined at | Why the revision is a dependency |
| --- | --- | --- | --- |
| AlgebraicTopology Layers 2–4, 6, 8; 6.3 | `:243` and the *Needs:* lines (e.g. `:892`, `:931`, `:1046`, `:2222`, `:2273`); 6.3 at `:513–613` | #1652 (c686921) | renames main's Stage headings to Layers |
| AlgebraicTopology 8.13 | `:75`, `:243`, `:388`, `:412`, `:423`, `:445`, `:486`, `:804`, `:2879–2882` | #1663 (8029fe9) | new item, not a renumbering (see the first item under "Open for the human decision") |
| DifferentialGeometry 5.5b | `:244`, `:338`, `:373`, `:453`, `:486`, `:498`, `:565`, `:613`, `:712`, `:804` | #886 (a565de6) | splits main's 5.5 |
| GeometricTopology 4.3.1, 11.1, 11.3 | listed under "Same pattern" above | #903 (b647e5c) | drops main's smoothing-and-triangulation comparison; 4.3.1 is new and declared as a gap |

Every other supplier id was checked on main (eaf17b1):
- SpinGeometry G4, G4.3, G4.4, G5.0, G6.0, G6.7.
- SmoothBundlesConnections B1.4.
- GeneralizedCohomology G2.10, G3.3, G3.8, G3.9, G4.3, G5.2, G5.4, G5.5, and G1.1 as G1 item 1 (`:141`).
- CharacteristicClasses C1.3, C1.4, C3.3, C3.6, C6, C7.3, C7.3a, as item numbers inside sections C1–C7 (`:212`, `:1000`, `:1731`, `:1817`).
- TopologicalKTheory T1, T5, T7.
- ClassifyingSpaces Stage 4.
- RiemannianGeometry R1.
- AffineMorseLefschetz A0, A5, A6.
- ComplexKahlerGeometry K7.1.
- SpinRepresentations Layer 7.
- LieGroups Layers 2 and 4.
- LieHighestWeight Layer 8.
- PseudodifferentialOperators P5–P6.
- DGFloer Layer 1.

StringOrientation and IndexTheory are new-roadmap pull requests that come earlier in the merge order.

## Open for the human decision

- **AlgebraicTopology 8.13 is new content, not a renumbering.** #1663 adds it to Stage 8, whose items on main stop at 12. It does not renumber an id this roadmap cited on main. The dependency on #1663 therefore rests on the ownership settlement of the earlier review that moved the boundaryless case to AlgebraicTopology: AlgebraicTopology is earlier in the merge order, and #1663 names TangentialBordism as the consumer (`:73`). B1.6's own route (2.1, `:385–445`) already proves the general corner statements, whose interior stratum is the boundaryless case. So if #1663 does not merge, no target loses its proof. The only repair then is to drop the 8.13 attribution at the lines above and keep B1.6 as the sole owner.
- **Order of #1652 and #1663.** That is for their author to settle. This roadmap needs only that both merge before it.

## Noted, not changed (outside the comment)

- **"By an arbitrarily small homotopy" (`:408–409`).** B1.6's prose says the smoothing homotopy can be made arbitrarily small. Neither the Lean headline `exists_contMDiff_homotopicRel` (`∃ g, ContMDiff … ∧ f.HomotopicRel g C`) nor AlgebraicTopology 8.13 (`:2410`) states smallness. This is a P3 README/Lean strength mismatch, not touched here.
- **"Dropping second countability" (`:411`).** README 2.1 says the smoothing statement differs from AlgebraicTopology 8.13's "only in admitting corners and dropping second countability". The second difference is empty: a Hausdorff sigma-compact manifold over a finite-dimensional model is second-countable, by Mathlib's `ChartedSpace.secondCountable_of_sigmaCompact` (`Mathlib/Geometry/Manifold/ChartedSpace.lean:236`) with `ModelWithCorners.secondCountableTopology` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean:452`). So the Lean docstring's "When `I` is boundaryless this is AlgebraicTopology 8.13's smoothing theorem" is exact.

## Adversarial pass

No statement was added or changed. The rows below cover the statements that the two findings and the pattern repair rely on.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier row `:243`: 8.13 owns smoothing, parametric and relative transversality for boundaryless σ-compact T2 second-countable sources | #1663 `:68–74`, `:2410`, `:2448–2454` | AT: M boundaryless σ-compact T2 second-countable, P compact boundaryless T2 second-countable, A closed, U ⊇ A open, f smooth on U. TB row: same source class; same three theorems | Pass | none |
| Lean docstring: boundaryless `I` gives AT 8.13's theorem | I = 𝓘(ℝ,E); M T2 σ-compact; P compact | M second-countable by `ChartedSpace.secondCountable_of_sigmaCompact`, since H second-countable by `ModelWithCorners.secondCountableTopology`; P compact ⇒ σ-compact ⇒ second-countable; hypothesis sets equal | Pass | none |
| Same, degenerate | M = ∅; C = M; P = point | ∅: g the empty map, both sides; C = M: g = f (f smooth on U ⊇ M); P = pt: g = f constant | Pass | none |
| 8.13 survives either rebase | #1663 Stage 8 items 1–12 against #1652 8.1–8.12 | 1 relative homotopy / 8.1; 2 Kan / 8.2; 3, 4 absolute and relative Hurewicz / 8.3, 8.4; 5 Whitehead / 8.5; 6 sphere normalization / 8.6; 7 smooth-manifold CW type / 8.7; 8 classifying spaces / 8.8; 9 obstruction / 8.9; 10 representability / 8.10; 11 EM loops / 8.11; 12 EM comparisons / 8.12. #1652 has 0 occurrences of 8.13 | Pass, no collision | none |
| 6.3 survives either rebase | #1663 Stage 6 item 3 against #1652 6.3 | `:1327` orientation local system on a boundaryless m-manifold; `:1936` homological orientation and fundamental classes | Pass | none |
| DG 5.5b is main's 5.5 at #886 | main `:528`; #886 `:841`, `:850` | main: 1 bullet "5.5"; #886: 0 bare 5.5, plus 5.5a and 5.5b | Pass (drop clause) | none |
| DG 5.5b facet signs used by B1.1 | Q² with (e₀,e₁); facets i = 0, 1 (0-based, as at #886) | outward −e₀: det(−e₀,e₁) = −1; outward −e₁: det(−e₁,e₀) = +1; #886 `:916–918` gives (−1)^(i+1), i.e. −1 and +1; n = 1: endpoint 0 of [0,∞) has −1 (`:919–921`), the [1]−[0] convention of `:109` | Pass | none |
| GT 11.3 is main's comparison item 1 at #903 | main `:930`, `:938`; #903 `:517–523`, `:13010` | main: heading present; #903: heading 0 times, anchor mapped to 11.3, which states Cairns–Whitehead | Pass (drop clause) | none |
| GT 11.1 matches row `:245` "one cell per simplex" | K = one vertex; K = interval | 1 zero-cell; 2 zero-cells + 1 one-cell, equal to TB Check `:657` | Pass | none |
| GT 4.3.1 matches gap paragraph `:259–274` | m = 0; H; A | Arf 0 with Gauss sum 1 and zero count 1; Gauss sums 2 and −2 = (−1)^Arf·2; zero counts 3 = 2+1 and 1 = 2−1 | Pass | none |

## Elaborated signatures

`Suggested.lean` is unchanged (byte-identical since 1d3ca3f), so it was not re-elaborated with `#check`. Both declarations in the signature file were compared with their README statements:
- `exists_contMDiff_homotopicRel`: arbitrary `I`; M with `T2Space`, `SigmaCompactSpace` and `IsManifold I ∞`; P with `T2Space`, `CompactSpace` and `BoundarylessManifold`; `C` closed, `U` open, `C ⊆ U`, f smooth on `U`. This matches `:406–411`, apart from the smallness clause noted above.
- `orientedThreeManifold_parallelization`: T2 and second-countable M over `EuclideanHalfSpace 3`, a chosen `TauCeti.IsOrientedAtlas`, a positive pointwise basis, and both total-space maps smooth. This matches `:2177–2183`.

No section binder was lost (0 flagged).

## Ownership

The smoothing and transversality objects were searched in main and in the open heads.
- Owners of the general statement: AlgebraicTopology 8.13 at #1663 (boundaryless sources) and B1.6 (corners).
- Narrower relative transversality elsewhere:
  - GeometricTopology #903 `:1010` proves a relative transversality only for a disc map into ℝ³ inside its surface-separation proof.
  - DeRhamCohomologyAndDuality (a new roadmap pull request) owns finite-parameter transversality of families against maps into a vector space, and names TangentialBordism §2.1 as adjacent with a different object (`:64`).
  - HomotopySpheres consumes B1's relative transversality.
  - HeegaardFloer and KhovanovHomology on main use only local relative transversality conditions.
- No other owner of the general compact-target theorem exists.

Ownership against open pull requests outside the heads read here was not checked.

## Build and gate

- `lake build TauCetiRoadmap.TangentialBordism.Suggested`: `Build completed successfully (18244 jobs).` The only warnings are `declaration uses 'sorry'` at `Suggested.lean:51:8` and `:71:8`.
- depcheck (`--movable`): `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- gate: `gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- No file changed, so there is no commit. The head stays `ac710dc`.
- No source was fetched, and `needs-references.toml` was not created.
