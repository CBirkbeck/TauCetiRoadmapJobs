# Review of GeometricMeasureTheory (pull request #2581 at 69b050e)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 76 lines changed since `df9d9fa` found no false statement, no missing hypothesis and no supply problem, and the three small corrections of the previous review are repaired. The new derivations (the perimeter bound of §5.4 from Federer's criterion, the Jordan index theorem of §6.4 from the topological index theorem through inscribed polygons) were recomputed and their suppliers opened; the description agrees with this head. There is one small correction and one format note, neither blocking. The human reviewers have four points, unchanged from the previous review, and one text (Federer 1969) could not be read.

## C01 — ConformalMapping §5.6 states its index theorem for a homeomorphism of the circle, not for a loop on `[a, b]` injective on `[a, b)`

In §6.4 (README line 909) the topological Jordan index theorem is described as one "whose hypotheses on `γ` are continuity, closedness and injectivity on `[a, b)`", and the supplier contract (lines 1451–1453) repeats that form. ConformalMapping §5.6 (Completed, README lines 908–911) states `continuous_jordan_index` for a homeomorphism `Circle → C` onto a Jordan curve, read as a loop on `[0, 1]`; the form on `[a, b]` with injectivity on `[a, b)` is, in that section, only the piecewise-`C¹` case. An implementer who looks for the cited statement finds another carrier.

The two forms are equivalent: a closed loop continuous on `[a, b]` and injective on `[a, b)` factors through a continuous bijection of the circle onto its trace, a homeomorphism by compactness, and the index is invariant under increasing affine changes of parameter (ConformalMapping §5.4). One clause saying that §5.6 is applied to the induced circle homeomorphism, with §5.4 for the affine change of parameter, would make the contract say what the supplier says.

## N01 — Three links into this README from RiemannianGeometry will dangle

RiemannianGeometry on main links the anchors `#g1--rectifiable-curves-and-arclength` (line 3026) and `#g3--distributional-bv-and-variation-measures` (lines 974 and 3008), and its open revision keeps them. The table of former labels (README lines 1022–1031) lets a reader follow and the description says so; an explicit anchor on the two layer headings (`<a id="g1--rectifiable-curves-and-arclength"></a>`, likewise for `g3`) would keep the old links working.

## Previous findings

The previous review, of `df9d9fa`, had no finding (no R01); its other remarks are accounted for here.

- C01 (four headline theorems without a source) — repaired: §5.4 cites "Federer 1969, 4.5.11, in the whole space" and derives the bound; §6.4 says the equality and the normal are "derived here … from §1.1, §5.3, §5.4 and §6.1"; the four docstrings agree.
- C02 (the dimension-one sentence of §5.2) — repaired: "a union `W` of nondegenerate intervals with pairwise disjoint closures whose endpoints in `Ω` form a locally finite subset of `Ω`" (lines 693–695).
- C03 (the hypotheses `hu`, `hfin` of the two De Giorgi statements) — repaired: both docstrings say they are "those of README §5.3, kept for agreement with it" and why the conclusion holds without them.
- N01 (dangling anchors from RiemannianGeometry) — not repaired: no explicit anchor at the two layer headings; kept as N01.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §5.2 dimension-one sentence (changed) | `s = (0,2)`: `W = (0,2)`, and the former `W = (0,1) ∪ (1,2)`; `Ω = (0,1) ∪ (1,2)`, `W = (½, 3⁄2)`; `W ∋` a point; `Ω` the complement of a fat Cantor set | endpoints `{0,2}` = reduced boundary; old `W` now excluded (closures meet at `1`); endpoints in `Ω` `{½, 3⁄2}` = jumps; degenerate interval excluded; `W = ℝ ∖ closure(Ω ∖ s)` has disjoint closures | holds for every admitted `W`, and such a `W` exists |
| §5.4 perimeter bound, derivation (changed; Lean statement unchanged) | `s` of locally finite perimeter; `s = ⋃(1/(2k+1), 1/(2k))` in `(0,1)`; `dim E = 0`; `(−1,1)∖{0}` | `P = H(∂*s ∩ Ω) ≤ H(∂ᴹs ∩ Ω)`; `∞ ≤ ∞` by the contrapositive of the criterion; `0 ≤ 0`; `2 = 2` | holds, given the criterion |
| §5.4 criterion, localization (changed) | `x ∈ B`; `x ∉ closure B`; `x ∈ frontier B`; `n = 1` | densities of `s ∩ B` and `s` agree; density `0`; third term; `H⁰(frontier B) = 2`, so `H(∂ᴹ(s ∩ B)) ≤ H(∂ᴹs ∩ closure B) + H(sphere) < ∞` | inclusion and reduction hold; whole-space criterion not readable |
| §6.4 index theorem, derivation (changed; Lean statement unchanged) | `z` inside, polygon `p` with `sup‖p − γ‖ < dist(z, C)`; both circles; figure eight | `dist(p t, γ t) < dist(γ t, z)` for all `t`, the hypothesis of the pinned lemma with `γ₀ = γ`, `γ₁ = p`; `σ = 1`, `−1`; injectivity fails, lobes `+1`, `−1` | holds; chain: winding(`γ`) = winding(`p`) = index(`p`) = index(`γ`) = `σ` |
| §6.4 perimeter equality and normal, attribution (changed) | Federer1958 lines 142–144 | the source gives finiteness iff finite length only, as the text now says; equality routed through §1.1, §5.3, §5.4, §6.1 | consistent |
| De Giorgi statements, docstring notes (changed) | `s` not of locally finite perimeter in `Ω` | reduced boundary `∅` (pinned lemma's hypothesis is exactly `¬(hu ∧ hfin)` after `perimeter_def`); variation measure `0` by its `else` branch | notes true |

The rows for the untouched statements stand as in the previous review, of `df9d9fa`.

- Source locators: the diff adds one, Federer 1969, 4.5.11 (not readable, below), and rewords the sentence on Federer1958 p. 450, re-read at Federer1958 lines 142–144. No target of the seeded sample has a locator in a changed passage (the changed sentence of §5.2 carries none).
- Library declarations opened at the pins: `AbsolutelyContinuousOnInterval.windingNumber_eq_of_dist_lt_dist` (`Analysis/Contour/Winding/AbsolutelyContinuous/Proximity.lean`:104; closed AC `γ₀`, `γ₁`, `dist(γ₁ t, γ₀ t) < dist(γ₀ t, z)` on `uIcc a b`), as the contract states it; `TauCeti.reducedBoundary_eq_empty_of_not` (`Analysis/BoundedVariation/ReducedBoundary.lean`:171); `TauCeti.variationMeasure` (`Analysis/BoundedVariation/VariationMeasure.lean`:136); `TauCeti.essentialBoundary` (`MeasureTheory/Covering/EssentialBoundary.lean`:143, the complement of the density-one and density-zero points); `TauCeti.essentialBoundary_subset_frontier` (same file, 345).
- Cross-roadmap citations resolved on main: ConformalMapping (Completed) §5.4 (lines 822–867), §5.5 (869–904: the piecewise-`C¹` comparison and the proximity criterion for continuous loops) and §5.6 (906–949). ConformalMapping names this roadmap as a consumer, not a supplier: no cycle. No open pull request drops an id cited here.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder. The automatic checks all passed.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings, nothing else. The diff changes docstrings only; no signature changed, so the `#check` comparison and the one-tactic probe of the previous review stand.
- Description against the head: five references, eleven conventions, twenty numbered sections, 49 Checks, the ConformalMapping §5.3, §5.5, §5.6 citations, the Federer 1969 locator, the fourteen stated theorems and the unchanged progress files all match; no sentence is contradicted and no change is left unstated.

Overlap check: read Isoperimetry (main and its open revision), GaussianIsoperimetryAndClusters (main), Varifolds (main and its open revision), ConformalMapping (Completed); as in the previous review nothing has two owners. The topological index and the topological Jordan index theorem: ConformalMapping §5.4–§5.6; the index theorem for absolutely continuous curves, the perimeter and the normal: this roadmap; signed area as `σ` times area: Isoperimetry I3.

Source independence: changed passages only; 6 passages compared with 1 readable source (Federer1958 lines 138–146), none shared; Federer1969 is not readable, so the criterion's wording was not compared. Largest share Simon1983, 12 of 19 locators; no layer was added, removed or reordered, so the comparison of contents stands: independent.

Research link: Layers 2 and 5 are the rectifiability, area–coarea and De Giorgi–Federer structure theory of Simon 1983 (§§11–14) and Maggi 2012 (Chapters 15–16, per its contents), on which the varifold and regularity theory of the same texts is built; §6.3 is Anzellotti–Giaquinta 1978. Rests on the README and the texts read.

## Not verifiable

- Federer1969, 4.5.11 (the criterion of §5.4, in the whole space): the text is paywalled and recorded as cited by locator only; the statement and its numbering were not read. The reduction to an open `Ω` and the derivation of the bound from it were recomputed.
- Maggi2012 §13.2, p. 150 and Chapter 16, pp. 183–184: only the author's extract (contents, synopses, index) is legally readable, as before.

Automatic checks set aside as false positives: none failed.

## Source issues

- none

## For the human reviewers

- Licence: the Maggi2012 extract was read from the CVGMT server of the Scuola Normale Superiore, linked in the README's References (line 1470); classed as an institutional copy.
- Licence: the References (lines 1485–1492) name prior formalisations (MovingSofa, a Hugging Face problem archive, hojonathanho/isoperimetric and its LeanPool copy, kim-em/isoperimetric). The declarations of `Suggested.lean` were not compared with them.
- Not tested: Maggi2012's statements at §13.2 and Chapter 16, and Federer1969 4.5.11, could not be read; wording and hypotheses were not compared with them. Simon1983, the source with the largest share, was read where cited.
- Fact: the folder's generated `STATUS.md` (lines 12–18) reports Lipschitz coarea, the blow-up theorem and the Jordan index theorem as landed in Tau Ceti after the pin; at a later pin those statements of `Suggested.lean` would restate library theorems.
