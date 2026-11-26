# Review of AnalyticToricGeometryPartII (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 45 changed lines since `87e7f72`. The folder is identical to the one the previous review read, so I checked again, at the pins, the new §0.7 (the orbit–cone correspondence as an order isomorphism), its two Checks and two proof routes, the new theorem of `Suggested.lean`, the sentences added to the overview, the scope and the AnalyticToricGeometry contract, and the pull request's description. There is no finding: the statement, its direction, both Checks and both routes are correct, and the new theorem is true and not padding. The previous review's small correction and format note are not taken up and stand unchanged (one small correction, one format note, neither blocking); one placement question is left to the human reviewers.

## C01 — The closure order of §0.7 is Mathlib's specialization preorder on the orbit space, so the order isomorphism needs no new order and no antisymmetry first

Both texts lead an implementer to build a second order structure on `MulAction.orbitRel.Quotient`. §0.7 (README line 168) says "order the torus orbits … by O≤O′ when O⊆closure O′", and the module docstring of `TauCetiRoadmap/AnalyticToricGeometryPartII/Suggested.lean` (lines 43–47) says the order isomorphism "needs that partial order on `MulAction.orbitRel.Quotient`, which the pins lack". Mathlib already has the relation.

The torus action on the realization is continuous (`TauCeti/Geometry/Toric/Analytic/Fan/TorusAction/Basic.lean:113`), so the quotient map to the orbit space is an open quotient map (`MulAction.isOpenQuotientMap_quotientMk`). I proved at the pins that for orbits q, q′ one has q′ ⤳ q exactly when q.orbit ⊆ closure q′.orbit (from `specializes_iff_mem_closure` and `IsOpenMap.preimage_closure_eq_closure_preimage`), and that the theorem of `Suggested.lean` is equivalent to `T0Space` of the orbit space (`t0Space_iff_inseparable`). So the order is `specializationPreorder`, the order isomorphism onto its order dual needs only the pinned bijection and `TauCeti.Toric.Fan.analyticConeOrbit_subset_closure_iff`, and antisymmetry is what upgrades the preorder to `specializationOrder`.

Two sentences repair it. In §0.7, say that the order is the specialization preorder of the orbit space with its quotient topology. In the docstring, replace "is data and needs that partial order …, which the pins lack. Its one missing order axiom, antisymmetry, is stated below" by, for instance, "is data; its order is Mathlib's specialization preorder on the orbit space, and the theorem below is its antisymmetry, equivalently `T0Space` of the orbit space." The theorem could also be stated as that `T0Space` instance; either form is fine.

## N01 — The two books §0.7 cites are missing from References

README line 168 cites Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6; `## References` (lines 783–788) lists only SCH12, FS94, FS25 and STACKS. Add the two entries with publisher and year, as AnalyticToricGeometry's References gives them.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.7: the pinned bijection is an order isomorphism onto the order dual of the orbits, τ≤σ ⟺ O(σ)⊆closure O(τ) (line 168) | ℙ¹ fan (0, ρ₊, ρ₋); zero-cone fan; empty fan | 0≤ρ₊ and O(ρ₊)={0}⊆cl ℂ×=ℙ¹: reversed. Zero cone: one cone, one orbit. Empty fan: both sides empty | holds; follows from Orbit/Basic.lean 307, 327, 384 | C01 |
| Reflexivity, transitivity of O⊆closure O′ (line 168) | O, O′, O″ | O⊆cl O; O⊆cl O′⊆cl cl O″=cl O″ | holds | none |
| `orbit_eq_of_subset_closure_of_subset_closure` (`Suggested.lean` line 65) | probe proof; `simp_all`, `aesop`, `exact?`; empty fan | proof: two `surjective`, rewrite by lines 327 and 384, `le_antisymm`; `simp_all`, `aesop` no progress, `exact?` fails; empty fan vacuous | true, not padding; ⟺ `T0Space` of orbit space (proved) | C01 (optional form) |
| Route 1: closure criterion twice (line 170) | q=e σ, q′=e τ | criterion gives τ≤σ and σ≤τ, so σ=τ | compiles | none |
| Route 2: locally closed orbits, no fan (line 170) | O, O′ with cl O=cl O′, O open in cl O | O′ dense in cl O, O nonempty open there, so O′∩O≠∅, orbits equal | correct | none |
| ℙ¹ Check (line 174) | orbits ℂ×, {0}, {∞} | {0},{∞}⊆cl ℂ×=ℙ¹; cl{0}={0}∌∞; ρ₊, ρ₋ not faces of each other | true; an order-preserving map would fail it | none |
| Irrational-flow Check (line 175) | ℝ on ℝ²/ℤ², slope √2; orbits of (0,0), (0,½) | both dense; equal orbits need t∈ℤ with t√2≡½ mod 1, impossible since √2 irrational | true | none |
| "AnalyticToricGeometry Layer 4, item 2, asks for this order-reversing equivalence" (line 168) | `Completed/AnalyticToricGeometry/README.md` line 422 on main | item 2 asks for the correspondence "as an order-reversing equivalence between cones and torus orbits" | agrees | none |
| README generality against the Lean signature | regular fan | `Fan i` has `finite_cones`; `IsRegular` is required by `analyticRealization`; elaborated type keeps all binders | equal | none |
| Docstring: the isomorphism "needs that partial order …, which the pins lack" (lines 43–47) | Mathlib order API on the orbit space | no `PartialOrder` instance, but ⤳ on the quotient equals the closure relation (proved) | reason imprecise | C01 |
| Overview (line 15), scope (line 695), contract (line 723), Dependencies (line 185) | Orbit/Basic.lean 307; main | type `Φ.cones ≃ orbitRel.Quotient (ComplexTorus N) (analyticRealization)`; Part I is under `Completed/` | agree | none |
| Description: "new §0.7 … `Suggested.lean`: `orbit_eq_of_subset_closure_of_subset_closure`" | head | heading at line 166; declaration at line 65 | agrees | none |

- Change: 45 lines (41 added, 4 removed); 1 heading added, 0 removed; 1 declaration added, 0 removed. All 7 layers of the merge base keep their ids and titles; no item removed or reduced to a name. The folder is unchanged since the head the previous review read.
- Source locators: 1 cross-roadmap locator read (AnalyticToricGeometry Layer 4 item 2); the two book locators could not be opened. No target of the seeded sample lies in a changed or affected passage.
- Library declarations opened at the pins: Tau Ceti Orbit/Basic.lean 307, 322, 327, 371, 384; TorusAction/Basic.lean 113; `Fan` (structure printed), `IsRegular` (Algebraic/Regular.lean 441); Mathlib `MulAction.isOpenQuotientMap_quotientMk`, `specializes_iff_mem_closure`, `IsOpenMap.preimage_closure_eq_closure_preimage`, `t0Space_iff_inseparable`, `inseparable_iff_specializes_and`, `MulAction.orbitRel.Quotient.mem_orbit` (used in compiled probes).
- Elaboration of `Suggested.lean`: one warning, the `sorry` at line 65. The single declaration's elaborated type was compared with §0.7: no binder lost. Two probe files compile (the proof; the specialization identity and the T0 equivalence).
- Automatic checks: all pass. Dependency check output: `depcheck: 115 roadmaps, 1314 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No file is changed outside the pull request's own sixteen folders.
- Cross-roadmap citations: AnalyticToricGeometry Layer 4 resolves on main. The three names found nowhere (`Chow.gysin` and two PerfectoidSpaces Check names) are in untouched text.
- Previous review: no findings to repair; its C01 and N01 are not taken up (the folder is unchanged) and are repeated above.
- Overlaps: no other open pull request changes this roadmap or drops an id it cites; this change drops none.

Overlap check: read DeligneWeightsAndPurityPartII, AnalyticToricGeometry, PerfectoidShimuraVarieties, RelativeFarguesFontainePartII, MotivesAndAlgebraicCyclesPartII, DiamondsAndVStacks, CrystallineCohomology and EtaleDualityAndPerverseSheaves for the changed object only, by a search of every roadmap on main and at the open heads for the orbit–cone correspondence; the one shared object is that correspondence, owned by AnalyticToricGeometry Layer 4 item 2 (completed), which §0.7 cites, owning only the order structure. Nothing else is shared.

Source independence: changed passages only; 6 passages compared with 2 texts (the docstrings of `TauCeti/Geometry/Toric/Analytic/Fan/Orbit/Basic.lean` and AnalyticToricGeometry Layer 4), none shared beyond standard terms; the two books cited in §0.7 could not be read; largest share SCH12, 145 of 190 source mentions; contents not compared, since no layer is added, removed or reordered.

Research link: Layers 3–6 are the toric comparison, cohomology and approximation theorems of Scholze 2012 (§8, Theorem 8.5 to Corollary 8.8), used there for weight–monodromy of complete intersections and consumed by DeligneWeightsAndPurityPartII; §0.7 is the classical orbit–cone correspondence. Rests on the README's summary and References.

## Not verifiable

- Fulton, *Introduction to Toric Varieties*, §3.1, and Cox–Little–Schenck, *Toric Varieties*, Theorem 3.2.6 (§0.7, line 168): commercial books, not in the roadmap's source manifest, not opened. The pinned Tau Ceti file cites the same locators.
- The description's sentence that two repository scripts pass: they concern the whole repository and were not run.

## Source issues

- none

## For the human reviewers

- §0.7 (README line 166) is complex analytic, is used by no other section, and sits in Layer 0 of this nonarchimedean Part II; line 695 gives the reason: AnalyticToricGeometry, whose Layer 4 item 2 it completes, is under `Completed/`.
