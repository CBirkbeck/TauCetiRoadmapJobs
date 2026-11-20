# Review of GeometricMeasureTheory (pull request #2581 at a6197f3)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 33 lines changed since `69b050e` found no false statement, no missing hypothesis and no supply problem. The small correction and the format note of the previous review are both repaired: §6.4 and the supplier contract now apply the topological Jordan index theorem of ConformalMapping §5.6 through the induced circle homeomorphism, with §5.4 for the change of parameter, and the two layer headings that RiemannianGeometry links carry their former anchors. There is one small correction, to a sentence of the description that the new anchors make out of date; it does not block. The human reviewers have four points, unchanged from the previous review, and one text (Federer 1969) could not be read.

## C01 — The description still says that the links from RiemannianGeometry need new anchors, and this head keeps the old ones

The description says: "The headings change, so the three anchored links into this README (from RiemannianGeometry, to `#g1--…` and `#g3--…`) now need the `#layer-1-…` and `#layer-3-…` anchors." At this head the headings of Layers 1 and 3 are preceded by explicit anchors `g1--rectifiable-curves-and-arclength` and `g3--distributional-bv-and-variation-measures` (README lines 119 and 384), which are exactly the three targets RiemannianGeometry uses on main (its lines 974, 3008 and 3026). A maintainer who reads the description would edit RiemannianGeometry for nothing.

A sentence that would be right: "The headings change; the two anchors that RiemannianGeometry links (`#g1--…`, `#g3--…`) are kept as explicit anchors on Layers 1 and 3, so its three links still resolve."

## Previous findings

The previous review, of `69b050e`, had no finding (no R01); its other remarks are accounted for here.

- C01 (ConformalMapping §5.6 is stated for a circle homeomorphism) — repaired: "stated there for a homeomorphism of the circle onto `C` read as a loop on `[0, 1]`. It applies to `γ`: …" (lines 913–918); the contract (lines 1458–1464) and the *Needs:* line (957) agree.
- N01 (three links from RiemannianGeometry would dangle) — repaired: explicit anchors `g1--rectifiable-curves-and-arclength` (line 119) and `g3--distributional-bv-and-variation-measures` (line 384) before the two layer headings. The description was not updated: C01 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §6.4, reduction of the index theorem to ConformalMapping §5.6 (changed prose; Lean statement unchanged) | `γ(t) = exp(it)` on `[0, 2π]`; its reverse `exp(−it)`; the figure eight; `γ` not closed; `a = b` | induced circle map: identity, `σ = 1`; conjugation, degree `−1`, `σ = −1`; not injective, no bijection, lobes `+1`, `−1`; discontinuous at `1` without `γ a = γ b`; excluded by `a < b` | holds: continuity at `1` uses closedness, bijectivity uses injectivity on `[a, b)` and `γ b = γ a`, compact-to-Hausdorff gives the homeomorphism |
| §6.4, change of parameter (changed) | loop of the induced map on `[0, 1]`: `s ↦ γ(a + s(b − a))`; `a = 0`, `b = 2π` | index on `[0, 1]` = index of `γ` on `[a, b]` by the affine transport of ConformalMapping §5.4 (slope `b − a > 0`, increasing); circle: `1 = 1` | holds; a decreasing change would negate, none is used |
| Supplier contract for ConformalMapping §5.4–§5.6 (changed) | each clause against the supplier on main | §5.4 line 838 "transport along increasing affine changes of parameter"; §5.5 lines 871–880 comparison and proximity; §5.6 lines 908–910 circle homeomorphism, `σ` on `filledHull C \ C` | the contract says what the supplier says |
| Anchors on Layers 1 and 3 (changed) | the three link targets in RiemannianGeometry on main | `#g3--distributional-bv-and-variation-measures` (lines 974, 3008), `#g1--rectifiable-curves-and-arclength` (line 3026); identical strings at README lines 384, 119 | the links resolve |

The rows for the untouched statements stand as in the previous review, of `69b050e`.

- Source locators: the diff adds no locator into a source. Of the seeded sample only §6.4 falls in a changed passage; its changed sentences cite ConformalMapping §5.4 and §5.6, both opened; the Federer 1958 sentence is untouched.
- Cross-roadmap citations resolved: ConformalMapping (Completed) on main, §5.3 (line 787), §5.4 (822–867), §5.5 (869–904), §5.6 (906–949); the open revision of ConformalMapping keeps the four sections and the same statements (its lines 788–909). No open pull request drops an id cited here; none changes this roadmap.
- Library declarations: the diff names none that the previous review did not open (`AbsolutelyContinuousOnInterval.windingNumber_eq_of_dist_lt_dist`, checked there at the pin).
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder. The automatic checks all passed.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings, nothing else. The diff does not touch the file, so the `#check` comparison and the one-tactic probe of the earlier reviews stand.
- Description against the head: "ConformalMapping §5.3–§5.6" now matches the contract exactly; the paragraph on the Jordan index theorem agrees with §6.4; one sentence is out of date (C01).

Overlap check: read Isoperimetry (main and its open revision), GaussianIsoperimetryAndClusters (main), Varifolds (main and its open revision), ConformalMapping (Completed and its open revision), as in the previous review; nothing has two owners. The topological index, its affine transport and the topological Jordan index theorem: ConformalMapping §5.4–§5.6; the index theorem for absolutely continuous curves, the perimeter and the normal: this roadmap.

Source independence: changed passages only; 3 passages compared with 0 readable sources (the changed sentences cite ConformalMapping only, and were set beside its §5.4 and §5.6: no sentence shared); largest share Simon1983, 12 of 19 locators; no layer was added, removed or reordered, so the comparison of contents stands: independent.

Research link: Layers 2 and 5 are the rectifiability, area–coarea and De Giorgi–Federer structure theory of Simon 1983 (§§11–14) and Maggi 2012 (Chapters 15–16, per its contents), on which the varifold and regularity theory of the same texts is built; §6.3 is Anzellotti–Giaquinta 1978. Rests on the README and the texts read.

## Not verifiable

- Federer1969, 4.5.11 (the criterion of §5.4, in the whole space): the text is paywalled and recorded as cited by locator only; untouched by this change.
- Maggi2012 §13.2, p. 150 and Chapter 16, pp. 183–184: only the author's extract (contents, synopses, index) is legally readable, as before.

Automatic checks set aside as false positives: none failed.

## Source issues

- none

## For the human reviewers

- Licence: the Maggi2012 extract was read from the CVGMT server of the Scuola Normale Superiore, linked in the README's References; classed as an institutional copy.
- Licence: the References name prior formalisations (MovingSofa, a Hugging Face problem archive, hojonathanho/isoperimetric and its LeanPool copy, kim-em/isoperimetric). The declarations of `Suggested.lean` were not compared with them.
- Not tested: Maggi2012's statements at §13.2 and Chapter 16, and Federer1969 4.5.11, could not be read; wording and hypotheses were not compared with them. Simon1983, the source with the largest share, was read where cited.
- Fact: the folder's generated `STATUS.md` reports Lipschitz coarea, the blow-up theorem and the Jordan index theorem as landed in Tau Ceti after the pin; at a later pin those statements of `Suggested.lean` would restate library theorems.
