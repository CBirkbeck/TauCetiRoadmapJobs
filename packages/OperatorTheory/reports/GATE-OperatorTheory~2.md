# GATE-OperatorTheory~2: answers to human review

One comment needed an answer: CBirkbeck, 2026-11-08T15:05:13Z. It is 468 characters long and the posted text itself stops mid-word at "All PlanarTopology citatio". It reports on head `c4c2442` and makes three points, numbered H01–H03 below. The pull-request head has since moved to `7bddd40`, which deleted §2.3a and cited MordellLawrenceVenkatesh Layer LV.5 for the surface topology. This round adds two commits:
- `fa2b42c` revises `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md`;
- `b46d79f` restores `TauCetiRoadmap/OperatorTheory/README.md` and `TauCetiRoadmap/OperatorTheory/Suggested.lean` to their state on main, so the pull request now changes nothing outside `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`.

## H01 (CBirkbeck) — applied differently

The roadmap no longer takes any surface topology from PlanarTopology, but it does not own that material either. At `fa2b42c`, README §2.4 (lines 306–308) computes `χ(M) = −6`, `H₁(M; ℤ) ≅ ℤ⁸`, `H₂(M; ℤ) ≅ ℤ` and genus `4` (defined as `½ rank H₁`) directly from the 8/16/2 cell structure. It does this through Tau Ceti's `cellularIncidence_zero`, `cellularIncidence_eq_inv_cellLocalClass`, `cellularSingularHomologyIsoUniv` and `finsum_finrank_singularHomology_of_finite_cwComplex`. The old text (`7bddd40`, lines 306 and 316) read genus 4 off MordellLawrenceVenkatesh §§5.4 and 5.6.

Neither earlier route was sound:
- **`c4c2442` (§2.3a).** It still took the classification of surfaces from SurfaceTopology, which is on the never-cite list: 5 README lines and 2 Lean lines.
- **`7bddd40` (MordellLawrenceVenkatesh).** OperatorTheory is on main, so this citation fails the dependency check: `UPWARD: OperatorTheory (on main) -> MordellLawrenceVenkatesh (#160) at README lines [92, 316, 348]`. Checked as a candidate instead, it is a cycle, because NoncompactQuantumSymmetry (#156) consumes UO-B04/B05/E03.
- **Owning Radó's theorem and the classification here** would plan MordellLawrenceVenkatesh §§5.3–5.4 a second time inside an unbounded-operator roadmap.

## H02 (CBirkbeck) — answered

At `fa2b42c` neither `README.md` nor `Suggested.lean` mentions PlanarTopology or SurfaceTopology (0 occurrences of each). At `c4c2442` the counts were PlanarTopology 0 and SurfaceTopology 5 + 2. The scope paragraph (README line 13) used to say MordellLawrenceVenkatesh Layer LV.5 owns this surface topology. It now says that §2.4 reads its invariants off the cell structure through Tau Ceti's cellular homology, and that general surface topology (the manifold boundary, triangulations, the classification of compact surfaces) is neither owned nor used.

## H03 (CBirkbeck) — answered

The gate as a whole was not green at `c4c2442`, whatever the four named checks showed:
- That head cited SurfaceTopology, a never-cite roadmap, at README lines 13, 81, 314, 318, 350 and `Suggested.lean` lines 61 and 219.
- Its `IsCombinatorialManifold.boundary_realization` (`Suggested.lean` lines 122–130) wrote the set-builder binder as `(x : ι →₀ ℝ)`. The right-hand side is then a set of finitely supported functions that contains `0`, whose coordinates sum to 0, so it is not a point of the realization. The statement is false.

At `b46d79f` every gate count is 0 and the gate reports `OK` (details below).

## Build and gate

- `lake build TauCetiRoadmap.OperatorTheory.UnboundedOperators.Suggested` at `b46d79f`: `Build completed successfully (18242 jobs).` The only warnings are 8 `declaration uses 'sorry'` warnings (lines 45, 62, 74, 87, 116, 124, 184, 196) and the `module` advisory. `TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean` is unchanged in this round.
- Gate, with `--folder OperatorTheory/UnboundedOperators --base origin/main`, at `b46d79f`:

      gate OperatorTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **The `outside-folder=2` finding at `fa2b42c`.** The gate flagged `TauCetiRoadmap/OperatorTheory/README.md` and `TauCetiRoadmap/OperatorTheory/Suggested.lean`. Both belong to the OperatorTheory family index, not to this roadmap. Commits `9eab1ec` and `27437a1` of this pull request had changed them in round 1, when the job's scope was the whole family:
  - `9eab1ec` added a family `Suggested.lean` that declares nothing.
  - `27437a1` cut the family dependency table down to intra-family prerequisites.

  Commit `b46d79f` restores both files to main: the README is byte-identical to main and the family `Suggested.lean` is deleted. `git diff --stat origin/main...HEAD` now lists only `UnboundedOperators/README.md` and `UnboundedOperators/Suggested.lean`.

  Nothing this roadmap depends on is lost:
  - The build target is the child module, and main has no family `Suggested.lean`.
  - Neither UnboundedOperators file refers to the family table. They cite only the sibling `../PolarDecomposition/README.md`, which is on main.

- **Effect of the restore on the family table.** With the table back in its main form, a depcheck of the family README as it is on main reports `UPWARD: OperatorTheory (on main) -> OperatorKTheory (#9) at README lines [83]`. That line is the `ToeplitzOperators` row, which lists `OperatorKTheory` K4 and `CStarAlgebras` C1/C5/C8. The defect exists on main independently of this pull request. Fixing it means editing the family index, which belongs in its own pull request on `TauCetiRoadmap/OperatorTheory/README.md`; the `27437a1` table can be reused there.

## Dependency check

Before (`7bddd40`):

    UPWARD: OperatorTheory (on main) -> MordellLawrenceVenkatesh (#160) at README lines [92, 316, 348]
    depcheck: 229 roadmaps, 2319 edges, 1 problem(s)

Checking UnboundedOperators as a candidate gave `CYCLE: UnboundedOperators consumes MordellLawrenceVenkatesh (#160) and is consumed by NoncompactQuantumSymmetry (#156), which comes first`.

After (`fa2b42c`, and again at `b46d79f`), with the brief's command:

    depcheck: 229 roadmaps, 2318 edges, 0 problem(s)

As a candidate: `depcheck: 230 roadmaps, 2327 edges, 0 problem(s)`.

All remaining suppliers are on main:
- HilbertModules, VonNeumannAlgebras, BanachSpaceTheory, BanachAlgebras, PDE and GeneralizedCohomology;
- RepresentationTheory/LieGroups;
- OperatorTheory/SelfAdjointSpectralTheory and OperatorTheory/PolarDecomposition.

VariationalMethods appears only as a consumer.

## What changed (`7bddd40` → `fa2b42c` → `b46d79f`)

- **Line 13 (scope).** The MordellLawrenceVenkatesh LV.5 sentence is replaced. It now says that §2.4 reads χ, integral homology and genus off the cell structure through Tau Ceti's cellular homology, and that general surface topology is neither owned nor used.
- **Lines 48–57 (From Tau Ceti).** `riemannianVolume` is now attributed to §2.3, which is where it is used. Added for §2.4, each with its hypotheses:
  - `TauCeti.cellularSingularHomologyIsoUniv`: `TauCeti/AlgebraicTopology/Cellular/Comparison.lean:300`, with the finite-dimensional `IsIso` instance at `:219`;
  - `TauCeti.cellularIncidence_zero`: `TauCeti/AlgebraicTopology/Cellular/EdgeIncidence.lean:58`;
  - `TauCeti.cellularIncidence_eq_inv_cellLocalClass`: `TauCeti/AlgebraicTopology/Cellular/LocalDegree.lean:659`.
- **Old lines 92–98.** The MordellLawrenceVenkatesh supplier paragraph is deleted.
- **§2.4, line 304.** "a closed connected oriented surface in the sense of MordellLawrenceVenkatesh §5.1" becomes "a compact connected oriented topological surface without boundary".
- **§2.4, line 308.** New paragraph with the integral cellular computation (incidence numbers, kernel of `∂₂`, a bidiagonal 7×7 minor, homology `ℤ, ℤ⁸, ℤ`, comparison with singular homology, and genus `½ rank H₁ = 4`). It replaces the classification argument through §§5.4 and 5.6.
- **Checks (lines 314–316).** The `(4, 0, 1)` Check is restated without the MordellLawrenceVenkatesh vocabulary. Two Checks are added: the self-glued square, and the `𝔽₂` ranks.
- ***Needs:* (line 320) and Layer 2 Dependencies (line 352).** MordellLawrenceVenkatesh is replaced by the Tau Ceti declarations.

No notion moves down: §2.4 no longer needs the classification or the type-`(g, b, n)` Euler characteristic. No id that other roadmaps cite is dropped.

`b46d79f` (`fa2b42c` → `b46d79f`, family index only): `TauCetiRoadmap/OperatorTheory/README.md` returns to its main text (13 lines, the dependency table and the paragraph after it), and `TauCetiRoadmap/OperatorTheory/Suggested.lean` (26 lines) is deleted. Nothing in `TauCetiRoadmap/OperatorTheory/UnboundedOperators/` changes, so no statement is added or changed and the adversarial pass below is unaffected.

## Adversarial pass (statements added or changed)

The cell complex is the one in §2.3. Squares are `[i,i+1]×[j,j+1]` for `(i,j) ≠ (1,1)`, oriented counterclockwise. Edges are oriented in the `+x` and `+y` directions and glued by the five translation rules of §2.3. Every value below was computed by exact integer Smith normal form and determinants over this complex, not estimated.

| statement | instances tried | values computed | result | change |
| --- | --- | --- | --- | --- |
| Cells of `M₁` before gluing | vertex, edge and square count | 16 vertices (12 removed, 4 corners), 24 edges, 8 squares; `χ = 0` | holds | none (Check 1 kept) |
| 8/16/2 structure after gluing | edge classes, vertex classes | 16 boundary edges in 8 classes, plus 8 interior edges, gives 16; vertex classes p, q; `χ = 2 − 16 + 8 = −6` | holds | none |
| "Twelve edges are loops at p, four join p and q" | endpoint classes of all 16 edges | 12 loops, 4 p–q edges | holds | new text |
| `im ∂₁ = ℤ·(q − p)` | SNF of `∂₁` (2×16) | invariant factors `[1]` | holds | new text |
| Every edge class occurs exactly twice in `∂₂`, with opposite signs | all 16 classes | every class contributes `{+1, −1}`; the classes `h(1,0)~h(1,1)`, `h(1,2)~h(1,3)`, `v(0,1)~v(1,1)`, `v(2,1)~v(3,1)` occur twice in one square | holds; my first wording ("in exactly two square boundaries") was false for these four and was corrected before the commit | wording fixed |
| A hole-adjacent square's boundary is the difference of its remaining sides | squares (1,0), (0,1), (2,1), (1,2) | `∂S(1,0) = v(2,0) − v(1,0)`, `∂S(0,1) = h(0,1) − h(0,2)`, `∂S(2,1) = h(2,1) − h(2,2)`, `∂S(1,2) = v(2,2) − v(1,2)` | holds | new text and Check |
| Bidiagonal 7×7 minor of `∂₂` | ring order (0,0),(1,0),(2,0),(2,1),(2,2),(1,2),(0,2),(0,1); interior edges v(1,0), v(2,0), h(2,1), h(2,2), v(2,2), v(1,2), h(0,2) | upper bidiagonal with diagonal `1,1,−1,−1,−1,−1,1`; determinant `1` | holds | new text |
| `∂₂` has rank 7 with invariant factors all 1; `ker ∂₂ = ℤ·Σ squares` | SNF of `∂₂` (16×8) | `[1,1,1,1,1,1,1]`; `H₂` rank 1 | holds | new text |
| Homology `ℤ, ℤ⁸, ℤ` | ranks and torsion | `H₀` rank 1, `H₁` rank 8 with no torsion, `H₂` rank 1; `∂₁∘∂₂ = 0` checked | holds | new text |
| Genus `½ rank H₁ = 4`, `χ = 2 − 2g` | g = 4 | `2 − 8 = −6`, matching `1 − 8 + 1` | holds | new text |
| Check: `M ∖ {p}` | non-compact surface | ranks `1, 8, 0`; `χ = −7`; `2 − 2g = −7` gives `g = 9/2` | holds | Check restated |
| Check: wrong boundary maps give `H₂ = 0` | (a) glued pair kept as two edges; (b) identified class counted with the same sign twice | `H₂` rank 0 in (a) and in (b); correct map gives 1 | holds | new Check |
| Check: `𝔽₂` ranks | mod-2 ranks of `∂₁`, `∂₂` | 1 and 7, so dimensions `1, 8, 1`; by the universal coefficient theorem a `ℤ/2` in `H₁` would add 1 to both `H₁(𝔽₂)` and `H₂(𝔽₂)` | holds | new Check |
| Gauss–Bonnet and cone angle (Check 2, recomputed) | corner angles | 8 non-corner perimeter points × π plus 4 inner corners × 3π/2 gives 14π; outer corners 4 × π/2 = 2π; `Σ(2π − θ) = −12π = 2π·(−6)`; chart `θ/7` gives `14π/7 = 2π` | holds | none |
| Euler–Poincaré input | `k = ℚ`, coefficient module `ℚ` | `finrank ℚ ℚ = 1`, so the alternating sum of rational Betti numbers equals the cell count; `M`, `ℤ` and `ℚ` all live in `Type` | holds | none |
| Cellular–singular comparison hypotheses | `Comparison.lean:266` (section variables) and `:300` | needs `[T2Space M]` (§2.4 proves Hausdorff), `[CWComplex (Set.univ : Set M)]` (constructed), exact coproducts (modules), and the `IsIso` instance for `[FiniteDimensional]` (`:219`) | holds | stated in the contract |
| Scope: no target uses general surface topology | grep for orientab, triangulat, boundaryComponent, classification, genus | only §2.4 and Check text; no target cites a boundary, triangulation or classification result | holds | scope sentence |

## Signatures, ownership, sources

- **Signatures.** `UnboundedOperators/Suggested.lean` is identical at `7bddd40`, `fa2b42c` and `b46d79f`, so the 14 elaborated types in the job's signature listing are current. Each was compared with its README statement:
  - The listing flags no lost binder.
  - The binders that need it are present: `[CompleteSpace V]` in `existsUnique_selfAdjoint_of_closed_form`, `[CompleteSpace H]` in the Friedrichs and both Nelson theorems.
  - No README edit of this round touches a Lean-declared statement. No separate `#check` file was elaborated, because only the targeted build is permitted.
- **Ownership.** General surface topology has an owner in the pool: MordellLawrenceVenkatesh Layer LV.5 at the head of its open pull request (§5.1 surfaces, §5.3 Radó, §5.4 classification, §5.6 `χ = 2 − 2g − b − n` and `H₁`). GeometricTopology on main does not own the classification: its Layer 11 is triangulations and PL structures. This roadmap now neither owns nor consumes that material. The genus is defined only for the example surface `M`, and no generic carrier is added.
- **Sources.** No new citation and no fetched source; `needs-references.toml` is not created.
- **Untrusted text.** The comment contains no instruction to run anything. Nothing suspicious.
