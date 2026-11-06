# GATE-GeometricTopology~4: answers to the review of `309be2f` (repairs at `c8664b7e`)

The review by roed-math (2026-11-06) makes two points: H01 is the duplicate ownership, and H02 is the conditional question about Milnor's Theorem 7.6. Its closing line, moving the PR to `awaiting-author`, is a status instruction, not a point about the roadmap, so it is not numbered.

## H01 (roed-math) — applied differently

The single owner is HomotopySpheres (§§1.2–1.6, as at its head `52ebd6f`), not §1.6 here. README §1.6 "Handle decompositions, cancellation and the Whitney move" (old lines 721–763) is deleted, and the Scope Layer 1 bullet (lines 28–33) no longer claims it. A new Scope deferral (lines 121–126) names HomotopySpheres §§1.2–1.6 as the owner, built on Layer 1.3's handle attachment and Layer 1.5's tubes, and says that no layer here uses them. *Downstream consumers* (lines 12861–12866) changes from "…and the handle decompositions" to say that HomotopySpheres builds them on Layer 1.3 and Layer 1.5.

The evidence is listed under *Details for H01* below. In short: §1.6 has no consumer in this roadmap. It is new in this revision, since main has handle attachment only. HomotopySpheres is a new roadmap earlier in the merge order, so it cannot depend on a revision PR. And PositiveScalarCurvature on main already consumes HomotopySpheres §§1.2, 1.4 and 1.5 for these theorems.

## H02 (roed-math) — answered

No, §1.6 did not cover what HomotopySpheres' handle trading uses. It mentioned "handle slides and the reordering of handles of the same index" in one phrase. It stated neither Milnor's Theorem 7.6 (the same-index basis change by slides) nor the ordered self-indexing decomposition (Theorem 4.8). It also lacked the arcs-and-connectedness condition and the separate `(dim P, dim Q) = (2, 3)` level. HomotopySpheres §1.2 states Theorem 7.6 itself (pp. 92–96, for `2 ≤ λ ≤ N − 2`), so with HomotopySpheres as owner there is nothing left to confirm against §1.6.

## Details for H01

**Why HomotopySpheres and not §1.6.**
- Main's GeometricTopology Layer 1 ("manifold-library buildout") plans gluing, handle attachment, tubes and connected sum, with no handle decomposition, cancellation or Whitney move (`git show origin/main:…/README.md`, lines 177–290). So §1.6 is new in this revision. A pull request that revises an existing roadmap is never a dependency of another roadmap, so HomotopySpheres (merge-order line 66, a new roadmap) cannot defer to it.
- HomotopySpheres claims this as scope item 1 ("Morse handle decompositions, Whitney moves, cancellation", `52ebd6f` line 27). It plans it at the generality its consumers need:
  - §1.2: ordered decomposition (Milnor 3.13–3.15, 4.8), reordering, creation and cancellation (5.4), slides and the Theorem 7.6 basis change.
  - §1.4: local Whitney move (6.6).
  - §1.5: Whitney discs for `p, q ≥ 3`, with arcs in connected components (Lemmas 6.10–6.12).
  - §1.6: the `(2, 3)` level under injectivity of `π₁(V∖Q) → π₁(V)`.
- PositiveScalarCurvature, on main, routes these theorems to HomotopySpheres: "Consume HomotopySpheres §1.2 for ordered handle decompositions, cancellation and slides, §1.4 for the local Whitney move, §1.5 …" (lines 230–231, 766, 783).
- No target here consumed §1.6. A grep of the README for Morse functions, handle decompositions, cancellation and Whitney moves outside the new deferral and the downstream entry returns nothing. The Heegaard splittings of Layer 9.1 come from triangulations (Layer 11.2). Layer 5.4.1's 2-handles are Layer 1.3 attachments.
- The other roadmaps that cite this roadmap for handles cite only handle attachment or tubes, and that stays here:
  - FourManifolds README lines 512, 967, 3072 ("GeometricTopology Layer 1's handle attachment", "…tubular neighbourhoods and handle attachment");
  - TangentialBordism lines 649, 1892;
  - HomotopySpheres lines 467, 495, 601;
  - PositiveScalarCurvature (main) lines 669, 746, 788.
- §1.6 also carried a false Check: "In dimension 4 … the Whitney move fails in general: the hypothesis `d ≥ 5` is essential". Given an embedded framed Whitney disc whose interior misses both submanifolds, the move works in any dimension; the dimension and `π₁` hypotheses are needed to *find* the disc. A witness in dimension 2 is in the adversarial table. HomotopySpheres keeps the given-disc move (§1.4) separate from the disc construction (§§1.5–1.6).

**Further edits made because §1.6 was deleted.**
- Summary (lines 5–6): "connected sums, tubular neighbourhoods and handle decompositions (Layer 1)" → "handle attachment, connected sums and tubular neighbourhoods (Layer 1)".
- *How to read the build* (line 465): "…tubular neighbourhoods and handles" → "…handle attachment, connected sums and tubular neighbourhoods".
- *From Tau Ceti*: deleted the "Morse functions" bullet (`TauCeti.IsMorse`, `TauCeti.IsMorseOn`, `TauCeti.IsManifoldNondegenerateCriticalPoint`; old lines 285–286). Only §1.6 used it.
- Layer 1 *Examples* (line 993): "the height-function handle decompositions of `S²` and `T²`" → "the annulus and the Möbius band as `D²` with one `1`-handle attached" (§1.3's Check).
- Layer 1 *Dependencies* (line 999): dropped "Morse predicates".
- *References*: deleted the Milnor *Lectures on the h-Cobordism Theorem* entry (old lines 12944–12945). Nothing else cites it.
- Renumbering, so that no gap is left:
  - §1.7 "PL manifolds through charts" → §1.6 (line 730);
  - §1.8 "Compact smooth surfaces" → §1.7 (line 769);
  - §1.8.1 → §1.7.1 (line 815);
  - 31 internal references updated (nine `1.7`→`1.6`, seven `1.8.1`→`1.7.1`, fifteen `1.8`→`1.7`). §1.7.1's `*Needs:*` range "1.1–1.5,1.7–1.8" → "1.1–1.7" (line 982).
  - Hatcher's "Proposition 1.7" (lines 12041, 12896) is unchanged.
  - No roadmap on main or at any open head cites GeometricTopology §§1.6–1.8 (`roadmaps grep 'GeometricTopology[^.;]{0,30}(Layer ?|§)1\.[6-8]'`: no match outside this PR).

**Follow-up outside this folder.** ComplexCurveModuli on main (D0, README lines 17 and 27) consumes "GeometricTopology Layer1's … `smoothElementaryMorseCobordismHandleComparison`, finite smooth handle decompositions rel marked collars, handle slides/cancellation/creation/reordering". That citation was written against an older head of this PR (`c0916c29`). Main's GeometricTopology never planned these, and the name was already dropped at `3196a195`, so the citation did not resolve before this round either. Its content is HomotopySpheres §1.2 (ordered decomposition, reordering, creation and cancellation, slides). A ComplexCurveModuli revision should cite that section; this job cannot edit it.

**Which HomotopySpheres.** Two open PRs carry HomotopySpheres: #1287 (`52ebd6f`, the checkout this brief gives) and #284 (`fb7c47e`, which numbers the same content as items of a different section). The README cites §§1.2–1.6 as numbered at #1287.

## Other repairs in this commit

**Gate statement-hygiene (not a review point).** At the reviewed head the gate failed with `statement-hygiene=1`. The flagged declaration was `poincare_conjecture`, whose conclusion is `Nonempty (M ≃ₜ sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)`.
- No homeomorphism to `S³` is canonical, and naming one as data would be sorry'd data. So the existence form is the honest statement, and it now carries the `nonempty_*` name the check asks for.
- Rename: `poincare_conjecture` → `nonempty_homeomorph_sphere_of_simplyConnected` (`Suggested.lean` line 183). The docstring now cites Morgan–Tian Corollary 0.2(a) and says why the statement is existential.
- README §8.6 (line 12443) is renamed to match. Binders and statement are unchanged.

**Anchors that other roadmaps link to (overlaps item).** RealAnalyticGeometry (main, line 674) links `#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, and KhovanovHomology (main and #1187, line 22) links `#layer-4-knot-theory-done-properly-owned-here`. Neither heading exists in this revision. The gate's `residue` check rejects `<a id>` anchors, so *How to read the build* (lines 483–486) now gives one line per anchor (old anchor → Layer 1, old anchor → Layer 4), as the overlap rule allows.

## Overlaps with open pull requests

- **#1517** (SmoothCircleEmbedding versus SmoothLinkEmbedding) edits main's *Principles* and *Inventory* text, which this revision replaces. This README already uses the two native carriers separately; for example, `smoothAmbientIsotopic_unknot_of_knotGroup` takes a `TauCeti.SmoothCircleEmbedding` and compares `TauCeti.SmoothLinkEmbedding.singleton`s. #1517 is rebased on #903, or closed as subsumed.
- **#1791** (draft) adds SurfaceTopology and PlanarTopology links to main's Layer 9 and 11 text. This README already has *From TauCetiRoadmap.SurfaceTopology and TauCetiRoadmap.PlanarTopology* and the Radó deferral in *Scope*. #1791 is rebased on #903.
- **#1797** is a second full revision of this README and `Suggested.lean`, keeping main's layer headings. It has handle attachment only, in its §1.2, so it agrees with the new ownership. The two heads conflict file-wide, so #1797's GeometricTopology part is rebased on #903, the dedicated revision, before either merges.
- **Ids this README cites that an open PR drops:** none. **Ids that only an open revision defines:** none. HomotopySpheres is a new roadmap, not a revision.
- **Closest in vocabulary.** FourManifolds consumes only Layer 1's handle attachment and tubes (lines above). Its own handle slides are Kirby moves on framed links, which are four-dimensional and distinct. KhovanovHomology, SurfaceTopology/PlanarTopology and TeichmullerGeometry: their ownership boundaries are unaffected by this change.

## Ownership

I checked ownership of handle decompositions, cancellation, slides and Whitney moves with `roadmaps grep -i --readme-only 'handle decomposition|handle cancellation|whitney move|handle slide'` over main and all 459 open heads. The owner is HomotopySpheres (#1287 and #284), now cited. The other owners are distinct objects:
- MorseNovikov: Novikov and deck handle slides;
- FourManifolds: Kirby moves;
- MorseTheory M2 on main: topological handle attachment at a critical level, a homeomorphism statement, which HomotopySpheres consumes.

No ownership is moved down, and no declaration name is shared with another roadmap.

## Adversarial pass on what this commit adds or changes

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Deferral: HomotopySpheres §§1.2–1.6 contain the listed items | each item against `52ebd6f` lines 465–531 | §1.2 (469–481): ordered decomposition, reordering, creation/cancellation, slides, Thm 7.6 basis change for `2≤λ≤N−2`. §1.4 (493–500): local move. §1.5 (502–514): `p,q≥3`. §1.6 (516–531): `(2,3)` level | every listed item is present; §1.3 (h-cobordism trading) lies in the range unlisted; no change |
| "built on Layer 1.3's handle attachment and Layer 1.5's tubes" | HomotopySpheres `*Needs:*` lines 467, 495 | 467: "GeometricTopology Layer 1 handle attachments" = §1.3 here. 495: "GeometricTopology Layer 1 tubes and isotopies" = §1.5 here | true |
| "No layer of this roadmap uses them" | grep for `IsMorse`, "handle decomposition", "cancel", "Whitney move/disc"; Layers 5.4.1, 9.1 | hits outside the deferral and downstream entry: 0. 9.1 existence goes through triangulation (11.2). 5.4.1 uses 2-handle *attachment* | true |
| Deleted Check "`d ≥ 5` is essential for the Whitney move" (given disc) | `d = 2`, `P: y = 0`, `Q: y = x² − 1`, both oriented by increasing `x` | crossings at `x = ±1`. Signs `det[(1,0),(1,2x)] = 2x` give `−2` and `+2`: opposite. The bigon `{x²−1 < y < 0}` is embedded and its interior misses `P ∪ Q`. With a bump `ψ = 1` on `[−1,1]` supported in `(−2,2)`, `Q₁: y = x² − 1 + 2ψ(x)` has `y ≥ 2` on `[−1,1]`, `y ≥ x²−1 ≥ 0` (with `y = 2` at `|x| = 1`) on `1 ≤ |x| < 2`, and `y ≥ 3` for `|x| ≥ 2`, so `Q₁ ∩ P = ∅` | the Check was false for the move with a given disc; deleted with §1.6 |
| Renumbering 1.7→1.6, 1.8→1.7, 1.8.1→1.7.1 | all `1.[678]` tokens not preceded by a digit or dot | 9 + 7 + 15 substitutions plus one range; residual `1.8` layer references: 0; "Proposition 1.7" ×2 untouched; external citations of GT 1.6–1.8: 0 | consistent; §1.7.1 `*Needs:*` = 1.1–1.7 (it excluded only the deleted handle section) |
| Examples: annulus and Möbius band as `D²` ∪ one `1`-handle | both attachments | `χ = 1 − 1 = 0` for both. Boundary circles: 2 (annulus) and 1 (Möbius). Orientable versus not, as in §1.3's Check | true |
| `nonempty_homeomorph_sphere_of_simplyConnected` (rename only) | `M = S³`; `M = ∅`; `S¹×S²`; Poincaré sphere; `ℝ³`; `D³` | `S³`: hypotheses hold, the identity is a witness. `∅`: excluded, since `simply_connected_iff_unique_homotopic` (Mathlib `AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean` line 43) requires `Nonempty X`. `S¹×S²`: `π₁ = ℤ`, excluded. Poincaré sphere: `|π₁| = 120`, excluded. `ℝ³`: not compact. `D³`: no boundaryless `ℝ³` chart at boundary points | statement unchanged; only the name and docstring changed |
| Anchor lines | GitHub slugs of main's headings "Layer 1: manifold-library buildout (general dimension, general structure group)" and "Layer 4: knot theory, done properly (owned here)" | lowercased, punctuation dropped, spaces → `-`: `layer-1-manifold-library-buildout-general-dimension-general-structure-group` and `layer-4-knot-theory-done-properly-owned-here`, the strings cited at RealAnalyticGeometry 674 and KhovanovHomology 22 | match |
| Removed Morse supplier bullet and Milnor reference | grep after the edit | `TauCeti.IsMorse*` / `IsManifoldNondegenerateCriticalPoint`: 0. "h-Cobordism": 0. Remaining Milnor citations: the unique-decomposition paper and Fox–Milnor | nothing left dangling |

**Signatures.** The only Lean change is the name and docstring of one theorem. `Suggested.lean` has no `variable` or `include` lines (`grep -n 'variable\|include'`: none beyond docstring prose), so every binder of every declaration is in its own signature and none can be lost. No `#check` scratch file was elaborated, because the brief limits Lean commands to the targeted build. The worker's `signatures.md` was not available (an elaboration error on a TauCeti `.olean`).

**Sources.** No source was added. One citation was removed (Milnor, *Lectures on the h-Cobordism Theorem*), which was not in the roadmap's source manifest. Milnor's locators quoted in H01/H02 are HomotopySpheres' own, and I did not re-read them. No `needs-references.toml` request was made.

## Build

`lake build TauCetiRoadmap.GeometricTopology.Suggested`: `Build completed successfully (9131 jobs).` There are 17 `declaration uses sorry` warnings (lines 72–200) and no other diagnostic.

## Gate

At the reviewed head `309be2f` the gate printed `statement-hygiene=1 … FAIL`. After the commit:

`gate GeometricTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (no UPWARD, CYCLE or moved line):

```text
depcheck: 239 roadmaps, 2347 edges, 0 problem(s)
```

`roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is found nowhere.
