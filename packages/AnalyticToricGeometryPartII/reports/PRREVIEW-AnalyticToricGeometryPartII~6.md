# Review of AnalyticToricGeometryPartII (pull request #3170 at 0c3be17)

**Verdict:** accepted

**Summary.** An incremental re-review of the 9 lines changed since `f17d28c`, together with the pull request's title and description. The change takes up the previous small correction: §0.7 and the module docstring of `Suggested.lean` now identify the closure order on orbits with Mathlib's specialization preorder, and both new sentences are true (proved at the pins, direction included). There is no finding; the title and the description agree with this head for this folder. One format note is carried over (two books missing from References), not blocking, and one placement question is left to the human reviewers.

## N01 — The two books §0.7 cites are missing from References

README line 168 cites Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6; `## References` lists only SCH12, FS94, FS25 and STACKS. Add the two entries with publisher and year, as AnalyticToricGeometry's References gives them.

## Previous findings

The previous report had no finding (R); its two remarks are accounted for here.

- C01 — repaired: §0.7 now reads "This is Mathlib's specialization preorder `specializationPreorder` on the orbit space with its quotient topology", and the docstring calls the theorem "its antisymmetry, equivalently `T0Space` of the orbit space".
- N01 — not repaired: References still lists SCH12, FS94, FS25 and STACKS only; written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.7 (line 168): O≤O′ ⟺ O⊆closure O′ is `specializationPreorder` on the orbit space, as the quotient map is open | compiled probe for any group G acting with `ContinuousConstSMul`; ℙ¹ orbits {0}, ℂ× | Mathlib: x≤y is y ⤳ x (Topology/Defs/Filter.lean 234). Probe: q≤q′ ⟺ q.orbit⊆closure q′.orbit. ℙ¹: {0}≤ℂ×, ℂ× ⤳ {0} | holds, direction right | none |
| §0.7: antisymmetry "is equivalent to `T0Space` of the orbit space and makes the preorder a partial order (`specializationOrder`)" | compiled probe; irrational flow on ℝ²/ℤ² | T0 ⟺ (x ⤳ y ∧ y ⤳ x → x=y) proved; `specializationOrder` needs `[T0Space X]` (Topology/Separation/Basic.lean 146). Flow: orbit space indiscrete, not T0, orbits distinct | holds | none |
| §0.7: "The order isomorphism needs only this preorder" | cones τ, σ | e τ ≤ e σ in the order dual ⟺ O(σ)⊆closure O(τ) ⟺ τ≤σ by `analyticConeOrbit_subset_closure_iff`, `orbit_coneEquivOrbitRelQuotient`; no antisymmetry used | holds | none |
| `orbit_eq_of_subset_closure_of_subset_closure` (`Suggested.lean` line 66; statement unchanged, docstring bullet changed) | elaborated type; empty fan | binders `Φ`, `hΦ`, `q q'` all kept; hypotheses are q≤q′ and q′≤q of the preorder above; empty fan: no orbits, vacuous | agrees with README and new docstring | none |
| Description: "new §0.7: the orbit–cone correspondence as an order isomorphism onto orbits ordered by closure, reversed. `Suggested.lean`: `orbit_eq_of_subset_closure_of_subset_closure`" | head | heading at README line 166; one declaration added against main, that one; `*Needs:*` line present; no heading or declaration removed | agrees | none |

The rows for untouched statements stand as in the previous review, of `f17d28c`.

- Change since `f17d28c`: 9 lines (5 added, 4 removed) in two passages, README line 168 and `Suggested.lean` lines 43–48; no heading, layer or declaration added or removed. Against main: 1 heading and 1 declaration added, all 7 layers keep their ids and titles.
- Source locators: none in the changed passages; no target of the seeded sample lies in or depends on them.
- Library declarations opened at the pins: Mathlib `specializationPreorder` (Topology/Defs/Filter.lean 234), `specializationOrder` (Topology/Separation/Basic.lean 146), `MulAction.isOpenQuotientMap_quotientMk`, `specializes_iff_mem_closure`, `IsOpenMap.preimage_closure_eq_closure_preimage`, `t0Space_iff_inseparable`, `inseparable_iff_specializes_and` (used in the compiled probe); Tau Ceti `coneEquivOrbitRelQuotient`, `analyticConeOrbit_subset_closure_iff`, `orbit_coneEquivOrbitRelQuotient`, `isLocallyClosed_analyticConeOrbit` (`#check`ed).
- Elaboration of `Suggested.lean`: one warning, the `sorry` at line 66. `#check @name` on its single declaration compared with §0.7: no binder lost, nothing changed.
- Automatic checks: all pass. Dependency check output: `depcheck: 100 roadmaps, 1127 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing is changed outside the pull request's own sixteen folders.
- Title and description: "sixteen roadmaps" matches the sixteen folders changed; the pin `2fd255d` is the Tau Ceti revision of the manifest; the AnalyticToricGeometryPartII bullet agrees with the head. The bullets of the other fifteen folders belong to their reviews.
- Overlaps: no other open pull request changes this roadmap or drops an id it cites; this change drops none.

Overlap check: read DeligneWeightsAndPurityPartII, AnalyticToricGeometry, PerfectoidShimuraVarieties, RelativeFarguesFontainePartII, MotivesAndAlgebraicCyclesPartII, DiamondsAndVStacks, CrystallineCohomology and EtaleDualityAndPerverseSheaves as in the previous review, for the changed object only; the one shared object is the orbit–cone correspondence, owned by AnalyticToricGeometry Layer 4 item 2 (completed), which §0.7 cites, owning only the order structure. The change adds no object: the order is now attributed to Mathlib.

Source independence: changed passages only; 2 passages compared with 2 texts (the Mathlib docstrings of `specializationPreorder` and `specializationOrder`), none shared beyond the declaration names; largest share SCH12, 145 of 190 source mentions; contents not compared, since no layer is added, removed or reordered.

Research link: Layers 3–6 are the toric comparison, cohomology and approximation theorems of Scholze 2012 (§8, Theorem 8.5 to Corollary 8.8), used there for weight–monodromy of complete intersections and consumed by DeligneWeightsAndPurityPartII; §0.7 is the classical orbit–cone correspondence. Rests on the README's summary and References.

## Not verifiable

- Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6 (§0.7, line 168): commercial books, not in the roadmap's source manifest, not opened; the citation is untouched by this change.
- The description's sentence that two repository scripts pass: they concern the whole repository and were not run.

## Source issues

- none

## For the human reviewers

- §0.7 (README line 166) is complex analytic, is used by no other section, and sits in Layer 0 of this nonarchimedean Part II; line 695 gives the reason: AnalyticToricGeometry, whose Layer 4 item 2 it completes, is under `Completed/`.
