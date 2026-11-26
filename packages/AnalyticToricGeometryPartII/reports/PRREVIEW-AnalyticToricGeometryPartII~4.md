# Review of AnalyticToricGeometryPartII (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 45 changed lines since `87e7f72`. I checked the new §0.7 (the orbit–cone correspondence as an order isomorphism), its two Checks and two proof routes, the new theorem in `Suggested.lean`, and the sentences added to the overview, the scope and the AnalyticToricGeometry contract. I checked them against the pinned Tau Ceti and Mathlib, against AnalyticToricGeometry Layer 4 on `main`, and against the pull request's description. There is no finding. The statement, its direction, both Checks and both routes are correct, and the new theorem compiles from three pinned lemmas. There is one small correction: the closure order of §0.7 is already Mathlib's specialization preorder on the orbit space. There is also one format note, and one placement question is left for the human reviewers.

## C01 — The closure order of §0.7 is Mathlib's specialization preorder on the orbit space, so the order isomorphism needs neither a new order nor antisymmetry first

Both texts lead an implementer to put a second order structure on `MulAction.orbitRel.Quotient`. §0.7 (line 168) says "order the torus orbits … by O≤O′ when O⊆closure O′". The module docstring of `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean` (lines 43–47) says the order isomorphism "needs that partial order on `MulAction.orbitRel.Quotient`, which the pins lack". Mathlib already provides that order.

The orbit space has Mathlib's quotient topology (`instTopologicalSpaceQuotient`, `Mathlib/Topology/Constructions.lean:57`). The torus action on the realization is continuous (`TauCeti/Geometry/Toric/Analytic/Fan/TorusAction/Basic.lean:113`), so the quotient map is open (`MulAction.isOpenQuotientMap_quotientMk`, `Mathlib/Topology/Algebra/ConstMulAction.lean:616`). Hence q′ ⤳ q exactly when q.orbit ⊆ closure q′.orbit, and `specializationPreorder` (`Mathlib/Topology/Defs/Filter.lean:234`), through the type synonym `Specialization` (`Mathlib/Topology/Specialization.lean:23, 60, 66`), is exactly O ≤ O′ ⟺ O ⊆ closure O′.

I proved all of the following at the pins:
- this identification;
- an order isomorphism `Φ.cones ≃o (Specialization Q)ᵒᵈ`, where Q is the orbit space, with a real body built from `coneEquivOrbitRelQuotient`, `orbit_coneEquivOrbitRelQuotient` and `analyticConeOrbit_subset_closure_iff`, using no antisymmetry;
- that the theorem of `Suggested.lean` is equivalent to `T0Space Q` (`t0Space_iff_inseparable`, `Mathlib/Topology/Separation/Basic.lean:78`), which then makes `specializationOrder` (line 146) the partial order.

The repair is two sentences:
- In §0.7, say that the order is the specialization preorder of the orbit space with its quotient topology.
- In the docstring, replace the two sentences starting "is data and needs that partial order" with, for instance, "is data; its order is Mathlib's specialization preorder on the orbit space, and the theorem below is its antisymmetry, equivalently `T0Space` of the orbit space."

You could also state the theorem as `T0Space (MulAction.orbitRel.Quotient (TauCeti.Toric.ComplexTorus N) (Φ.analyticRealization hΦ))`.

## N01 — The two books §0.7 cites are missing from References

Line 168 cites Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6. `## References` (lines 782–788) lists only SCH12, FS94, FS25 and STACKS. Add the two entries with publisher and year, as AnalyticToricGeometry's References gives them.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.7: the bijection is an order isomorphism onto the order dual of the orbits (line 168) | ℙ¹ fan (cones 0, ρ₊, ρ₋); rank-0 fan | 0≤ρ₊; O(ρ₊)={0}⊆cl ℂ×=ℙ¹, so O(ρ₊)≤O(0): reversed. Rank 0: one cone, one orbit | holds; built at the pins onto `(Specialization Q)ᵒᵈ` | C01 |
| Reflexivity and transitivity of O⊆closure O′ (line 168) | three orbits O, O′, O″ | O⊆cl O; O⊆cl O′⊆cl(cl O″)=cl O″ | holds | none |
| `orbit_eq_of_subset_closure_of_subset_closure` (`Suggested.lean` line 65) | probe proof; one-tactic probe; empty fan | four tactic lines from Orbit/Basic.lean 307, 327, 384 and `le_antisymm`; `simp_all` makes no progress; `exact?` finds nothing; empty fan: Q empty, vacuous | true, not padding; ⟺ `T0Space Q` | C01 (optional form) |
| Route 1, the closure criterion applied twice (line 170) | q=e σ, q′=e τ by surjectivity | the criterion gives τ≤σ and σ≤τ, then σ=τ | compiles | none |
| Route 2, locally closed orbits (line 170) | any action with locally closed orbits, no fan | x∈O lies in the open coborder of O and x∈cl O′, so some y∈O′ is in coborder O ∩ cl O, hence y∈O | compiles | none |
| ℙ¹ Check (line 174) | orbits ℂ×, {0}, {∞} | {0},{∞}⊆cl ℂ×=ℙ¹; {0}⊄cl{∞}={∞}; ρ₊∩ρ₋=0, so the rays are incomparable | true; rules out an order-preserving map | none |
| Irrational-flow Check (line 175) | ℝ acting on ℝ²/ℤ² with slope √2; orbits of (0,0) and (0,½) | both orbits dense (Kronecker); same orbit would need t∈ℤ with t√2≡½ mod 1, which is impossible | true | none |
| "AnalyticToricGeometry Layer 4, item 2, asks for this order-reversing equivalence" (line 168) | `Completed/AnalyticToricGeometry/README.md` lines 425–426 | item 2: "orbit–cone correspondence as an order-reversing equivalence between cones and torus orbits" | agree | none |
| README generality against Lean | regular fan; Conventions: nonempty and finite | `Fan i` is finite (`finite_cones`, Fan/Basic.lean:103), takes `IsRegular`, admits the empty fan (vacuous) | Lean ≥ README; regularity forced by `analyticRealization` | none |
| Docstring: the isomorphism "needs that partial order …, which the pins lack" (`Suggested.lean` lines 43–47) | the pinned Mathlib order API | there is no `PartialOrder` instance on Q, but the specialization preorder is the closure order, and the `OrderIso` needs only the preorder | reason inaccurate | C01 |
| Overview (line 15), scope (line 695), AnalyticToricGeometry contract (line 723) | Orbit/Basic.lean:307; `Completed/` on main | type `Φ.cones ≃ orbitRel.Quotient (ComplexTorus N) (analyticRealization)`; AnalyticToricGeometry is under `Completed/` | agree | none |
| Description: "new §0.7 … `Suggested.lean`: `orbit_eq_of_subset_closure_of_subset_closure`" | head | heading at line 166, declaration at line 65, the only warning is its `sorry`; Tau Ceti pin `2fd255d` | agree | none |

- Change: 45 lines (41 added, 4 removed); headings: 1 added, 0 removed; declarations: 1 added, 0 removed. The 7 layers of the merge base are kept with their ids and titles, and no item is removed or reduced to a name.
- Source locators: 1 cross-roadmap locator checked against its text (AnalyticToricGeometry Layer 4 item 2). The two book locators could not be opened. No sampled target falls in a changed or affected passage.
- Library declarations opened at the pins: 7 in Tau Ceti (Orbit/Basic.lean 307, 327, 371, 384; Fan/Basic.lean 97–110, 136; TorusAction/Basic.lean 113) and 14 in Mathlib (Topology/Defs/Filter.lean 234; Separation/Basic.lean 78, 146; Specialization.lean 23, 60, 63, 66; Inseparable.lean 119, 459; ConstMulAction.lean 616; Constructions.lean 57; GroupAction/Defs.lean 349, 360, 369).
- Elaboration of `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean`: one warning, the `sorry` at line 65. I ran `#check @` on the single declaration: it has every binder in its own signature and none was lost. Three probe files compile: the proof, the T0 equivalence with the identification, the order isomorphism, and route 2.
- Automatic checks: they pass on the folder. Dependency check: `depcheck: 122 roadmaps, 1391 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The outside-folder diff is empty apart from the pull request's other fifteen folders.
- Cross-roadmap citations: AnalyticToricGeometry Layer 4 resolves on `main`. The resolver's three leads (`Chow.gysin`, and two PerfectoidTowers Check names) are names proposed by the supplier roadmaps, in untouched text.
- Previous review: no findings, so nothing was to be repaired. No open pull request changes this roadmap or drops an id it cites.

Overlap check: read DeligneWeightsAndPurityPartII, AnalyticToricGeometry, PerfectoidShimuraVarieties, ClassicalAdicEtaleCohomologyPartII, RelativeFarguesFontainePartII, MotivesAndAlgebraicCyclesPartII, DiamondsAndVStacks and CrystallineCohomology, and searched every roadmap for the orbit–cone order. One object is shared: the orbit–cone correspondence, owned by AnalyticToricGeometry Layer 4 item 2 (completed); §0.7 cites it and owns only the order structure. Nothing else is shared.

Source independence: changed passages only. I compared 6 passages with 2 texts (the docstrings and proofs of `TauCeti/Geometry/Toric/Analytic/Fan/Orbit/Basic.lean`, and AnalyticToricGeometry's README, Layer 4 and acceptance checks). They share nothing beyond standard terms. The two books cited in §0.7 could not be read. The largest share of locators is SCH12, 145 of 186. The contents were not compared, since no layer was added, removed or reordered.

Research link: Layers 3–6 are Scholze's toric comparison, cohomology and approximation theorems (Scholze 2012, Theorem 8.5 to Corollary 8.8). Scholze uses them to deduce weight–monodromy for complete intersections (SCH12 line 10, §9), and DeligneWeightsAndPurityPartII consumes them. §0.7 is the classical orbit–cone correspondence. This rests on the README's summary and SCH12.

## Not verifiable

- Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6 (§0.7, line 168): commercial books, not in the roadmap's source manifest, not opened. The pinned Tau Ceti file cites the same locators.
- The description's sentence that two repository scripts pass: they check the whole repository; not run.

Automatic checks set aside as false positives: my own run of the checks reported as edits outside this folder the 29 files of the fifteen other roadmap folders that this pull request also revises; those are the pull request's own folders.

## Source issues

- none

## For the human reviewers

- §0.7 (README line 166) is complex-analytic, used by no other section here, and placed in Layer 0 (invariant divisors) of this nonarchimedean Part II. Line 695 gives the reason: AnalyticToricGeometry, whose Layer 4 item 2 it completes, is under `Completed/`.
