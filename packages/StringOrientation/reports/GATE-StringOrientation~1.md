# GATE-StringOrientation~1: answers to human review

The review was written against `b297b8e`. The PR head `4397700` already rewrote S3 and S6 in
response to it. Each point below was checked against that head. Review-time repairs are in commit
`2faaf46` (README and Suggested.lean only).

## H01 (roed-math) — applied

The unrestricted connective claim is now recorded as false and given as a counterexample target
(README S6, lines 557–578). Under `π_n S → π_n MString → π_n tmf`, framed `SU(3)` with its
left-invariant lift `s_L` and the metric `−B` (`Ric = g/4`) maps to the order-2 element of `π_8 tmf`,
and framed `S³` maps to a generator of `π_3 tmf ≅ ℤ/24`. Both Witten genera are zero. The evidence:
Hopkins2002 line 397 gives `π_3 tmf = ℤ/24` and `π_8 tmf = ℤ ⊕ ℤ/2`. Lines 403–405 say the unit is
an isomorphism in degrees ≤ 6 and is nonzero on framed `SU(3)`. The image of a finite group lands in
the torsion, so it is the unique order-2 element `(0,1)`. Review repair: the curvature identities
depended on an unstated sign convention, which is now pinned. Old: `` `R(X,Y)Z=−[[X,Y],Z]/4` ``.
New: `` With `R(X,Y)=∇_X∇_Y−∇_Y∇_X−∇_[X,Y]` and `Ric(Y,Z)=tr(X↦R(X,Y)Z)` … `` (line 563). Recomputed
under that convention: `R(X,Y)Z = ¼[[X,Y],Z] − ½[[X,Y],Z]`, and `tr(X↦[[X,Y],Z]) = tr(ad_Z ad_Y) = B(Y,Z)`, so `Ric = −B/4 = g/4`.

## H02 (roed-math) — applied

The periodic question now names its localization map. It is `tmf → tmf[D⁻¹] ≃ TMF` with
`D ∈ π_576 tmf` detected by `Δ²⁴` (S6 lines 580–600). The counterexample classes are checked
separately through `x/1 = 0 ↔ ∃j, Dʲx = 0`. This needs `D_(2) = d₂³` (192·3 = 576), `D_(3) = d₃⁸`
(72·8 = 576), and that `d₂ʲu₈` and `d₂ʲν` have orders 2 and 8 and `d₃ʲν` has order 3. Therefore the
periodic images have orders 2 (`SU(3)`) and 24 (`S³`), and a zero q-expansion is explicitly not used.
The coefficient inputs come from EllipticCohomology E4, which plans the `Δ²⁴` lift in degree 576,
`Tmf[(Δ²⁴)⁻¹] ≃ TMF`, and the `Δ⁸` (prime 2) and `Δ³` (prime 3) periodicities (that roadmap's README,
lines 722–728).

## H03 (roed-math) — applied

Redden's formulation was not adopted, as the review allowed. S6 (lines 611–614) says that Redden's
condition `H_(S,g) = 0` is not `Ric > 0` alone. It also says that S3's arbitrary compatible String
connections do not supply a metric-canonical 3-form. Redden2011 lines 1023–1028 confirm that the
naive refinement fails for left-invariant framings, and lines 1045–1050 confirm that Question 4.3
adds `H_(S,g) = 0`.

## H04 (roed-math) — applied

S3 (lines 356–390) now builds on Mathlib's own diffeology declarations. These are
`DiffeologicalSpace`, `Diffeology.IsPlot`, `Diffeology.DSmooth`, `CorePlotsOn`/`ofCorePlotsOn`,
`dTopology`, `IsDTopologyCompatible` and `IsContDiffCompatible`, all checked at the pin in
`Mathlib/Geometry/Diffeology/Basic.lean`. S3 assigns:
- the manifold diffeology and `DSmooth ↔ ContMDiff`;
- the functional diffeology on the bundled `ContMDiffMap`;
- the comparison between open-domain plots and plots on all of Euclidean space;
- evaluation and currying, plotwise forms, fibre integration and descent;
- explicit D-topology compatibility rather than identifying arbitrary products with their D-topologies.

Review repair: the pin's diffeology folder contains only `Basic.lean`, which has no product, subspace
or pullback diffeology, so "use native diffeological products, subspaces and pullbacks" was a false
claim about the library. Old: "Use native diffeological products, subspaces and pullbacks, building
their missing API on the same class." New: "Mathlib's diffeology file has no product, subspace or
pullback diffeologies: construct them as instances of this same class, with their universal
properties." (lines 365–367).

## H05 (roed-math) — applied

lean-catdg is cited at a fixed commit as the comparison for the manifold and functional-map
constructions (S3 line 396; References line 687). Ownership of what is missing stays with S3, and
nothing waits for upstream.

## H06 (roed-math) — applied

S6 (lines 550–555) states the conjecture only for closed String manifolds of **positive
dimension**. It records the dimension-zero calibration: a point has genus 1 and positivity of Ricci
curvature is vacuous there, so the point is excluded.

## H07 (roed-math) — answered

The review lists checks that produced no objection: λ, the classifier and lift data, the S3
connection quotient, McTague's criterion in S5, the degree-16 normalization `G₄²/2 − G₈/240`, and
the dependency order. None of them asks for a change, so nothing was edited. The OP² genus check in
the review is a finite consistency test and is not a roadmap claim.

## Other repairs made with these answers (gate findings that predate the review)

- `Suggested.lean`: `import Mathlib.Topology.Homotopy.Basic` → `import Mathlib`. The module
  docstring now has the "target signatures" form and names the headline statements that cannot be
  stated at the pins. Stolz's conjecture and the S6 counterexamples need Ricci curvature, `MString`
  and `tmf`/`TMF`. The S4 and S5 theorems need String bordism and the Witten genus. None of these is
  in Mathlib or Tau Ceti at the pins; a grep for Ricci, `MString` and `tmf` found nothing.
- README: the HomotopySpheres citations no longer use a pull-request number or a blob link. Old:
  "PR284 §9.1 / §4C / §4B" and a pinned blob URL. New: "Stage 9 item 1 / Stage 4C / Stage 4B /
  Stage 9", each checked against the HomotopySpheres head (Stage 9 item 1 is `π_3^S ≅ ℤ/24{ν}`;
  Stage 4B is the real Bott chain; Stage 4C is stable J).
- README line 422: TeX-style `∏_{n≥1}` → `∏_(n≥1)`.

## Adversarial pass on changed or added statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `Ric = g/4` for `g = −B` | su(2), su(3), left-invariant fields | `R(X,Y)Z = −¼[[X,Y],Z]`; `tr(ad_Z ad_Y) = B(Y,Z)` gives `Ric = −B/4 = g/4 > 0` | true under the pinned convention | convention pinned (line 563) |
| framed SU(3) → `π_8 tmf` | `π_8 tmf = ℤ ⊕ ℤ/2` | torsion of the image, nonzero (Hopkins2002 l.403–405), gives `(0,1)` | unique order-2 element | none |
| framed S³ → `π_3 tmf` | unit iso in degrees ≤ 6 | `π_3 S = ℤ/24 → π_3 tmf = ℤ/24`, generator ↦ generator | true | none |
| `D_(2) = d₂³`, `D_(3) = d₃⁸` | degrees | 192·3 = 576; 72·8 = 576 | degrees consistent | none |
| periodic orders | localization criterion | 2-part of 24 is 8, 3-part is 3, product 24; SU(3): 2 | true given E4 | none |
| Witten-genus vanishing in dims 4–20, 28 | weights 2,4,6,8,10,14 | dim M_k = 0,1,1,1,1,1; weight 12 has dimension 2 | dims 24 correctly excluded | none |
| positive-dimension condition | n = 0 point | genus 1 ≠ 0, Ric > 0 holds vacuously | correctly excluded | none |
| "no product diffeology at pin" | grep of the pinned Mathlib | only `Geometry/Diffeology/Basic.lean`; instances only for ℝ and `EuclideanSpace` | true | wording fixed (l.365) |
| `ClassifierNullhomotopy.start/finish` | `#check` | types as in the table above: `H (0,x) = lambdaMap (c x)`, `H (1,x) = k` | binders intact | none |

Elaborated signatures: I put `#check @name` for all three declarations in one scratch file and
elaborated it once. Their types match the signatures file and README S1. No section binder was
dropped, and nothing in the declarations changed.

Ownership against open pull requests: the moved and new content consumes EllipticCohomology E4/E5
(open roadmap folder, read at its head) and HomotopySpheres (open roadmap folder, read at its head).
This roadmap adds no new generic carrier. The diffeology bridges are owned by S3 because no roadmap
on main or in the listed heads plans the manifold or functional diffeology; `roadmaps grep` was not
re-run beyond these citations.

No suspicious instructions were found in the review text.

## Build and gate

- `lake build TauCetiRoadmap.StringOrientation.Suggested`: `Build completed successfully (8976 jobs).`
- Gate after commit `2faaf46`: `gate StringOrientation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`.
  The only failure is `depcheck: NOT IN ORDER: StringOrientation (insert it after its last supplier)`.
  The roadmap is not yet in the merge order, which the brief says is not a defect at the design stage.
- Depcheck (`--movable`):
  ```
  NOT IN ORDER: StringOrientation (insert it after its last supplier)
  depcheck: 148 roadmaps, 1002 edges, 1 problem(s)
  ```
  There is no UPWARD or CYCLE line.
