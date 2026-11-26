# Review of LieGroups (pull request #3170 at 198459f)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 16 README lines changed since `f17d28c`, and of the pull request's title and description against this head. The three small corrections of the previous review are repaired correctly: the existence route of the §6.1 lattice equivalence now ends with `lieMap f = L` by the uniqueness of one-parameter subgroups, the target carries two Knapp locators that I read and that support it, and the scope section states the boundary with ConvexityToric T1. There is no finding; two format notes carried from the previous review remain, neither blocking, and the title and description agree with the head. Nothing is left for the human reviewers.

## N01 — The supplier contracts do not list the declarations the §6.1 lattice paragraph uses by name

The scope section says the declarations used by name are in the supplier contracts; `TauCeti.lieExpAddMonoidHom`, `TauCeti.isZLattice_ker_lieExpAddMonoidHom`, `TauCeti.span_ker_lieExpAddMonoidHom_eq_top`, `TauCeti.lieExpQuotientKerContinuousAddEquiv` and `ContinuousMonoidHom.map_lieExp` (Tau Ceti), and `Prod.instLieGroup` and `ModuleCat` (Mathlib), are not there (`ContinuousMonoidHom.lieMap_injective` is, at line 2379). The "Tori and Weyl groups" entry (line 2413) already names the `Exponential/CommutativeGroup/` path and could take the first four.

## N02 — Untouched text: README, References (lines 2566–2570): Serre and Varadarajan are listed but cited nowhere above

Carried from the previous reviews. Citing the two books where they are used, or dropping the entries, would settle it.

## Previous findings

The previous review (of `f17d28c`) had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: "The character duality of ConvexityToric T1 is the case of §6.1's lattice equivalence with target `Circle` … its 2π normalization and its restriction, quotient and integral basis-change formulas are T1's" (line 2218).
- C02 — repaired: "(Knapp, Cor. 1.103(c), for the objects; Knapp, Prop. 4.58, for the morphisms into `Circle`, by the same descent.)" (line 1081); both read at their locators.
- C03 — repaired: "the one-parameter subgroups `t ↦ lieExp (t • L X)` and `t ↦ lieExp (t • lieMap f X)` coincide for each `X`, and the uniqueness of §0.3 gives `lieMap f = L`"; §0.3 added to *Needs:* (lines 1076–1083).
- N01 — not repaired: the supplier contracts still lack the Tau Ceti and Mathlib names of the lattice paragraph; restated above.
- N02 — not repaired: Serre and Varadarajan are still listed in References and cited nowhere; restated above.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| New route step, `lieMap f = L` (README lines 1076–1079) | `G = G' = Circle`, `g(2π) = 2πk` | `L = ×k`; descended `f = (z ↦ zᵏ)`; `lieMap f = ×k`; `exp(itkx)` on both sides for all `t` | holds |
| same, why all `t` is needed | single `t = 1`, `X = 1`, `L X − lieMap f X = 2π` | `lieExp` agrees at `t = 1` but not at `t = 1/2` (`−1 ≠ 1`); equality for all `t` forces `L X = lieMap f X` | step uses the one-parameter subgroup, correctly |
| same, degenerate | `G` a point; `G'` a point | `E = 0`, `L = 0 = lieMap f`; `Λ' = 0`, `L = 0`, `f` trivial | holds |
| same, inputs at the pin | `map_lieExp` (`Geometry/Lie/ContinuousFunctor.lean` line 92); `existsUnique_eq_oneParameterSubgroup` (`Geometry/Lie/Exponential/Classification.lean` line 338) | `f (lieExp Y) = lieExp (lieMap f Y)`; `∃! X, φ = oneParameterSubgroup X` for continuous `φ` | both exist as cited through §0.3 |
| §0.3 One-parameter subgroups (seeded; cited by the change) | kirillov2008 line 663 (Prop. 3.1) against README lines 224–232 | source: unique Lie-group morphism `ℝ → G` with given velocity; README says "for smooth homomorphisms" | supports the statement |
| Locator: Knapp, Cor. 1.103(c) | knapp2002 line 4132 | compact abelian analytic group is a torus; (b) gives `ℝⁿ/D` | supports "for the objects" |
| Locator: Knapp, Prop. 4.58 | knapp2002 lines 11115–11136; `T = Circle`, `λ = ik` | `λ(2π) = 2πik ∈ 2πiℤ` iff character `e^{iθ} ↦ e^{ikθ}` exists; proof descends from the cover | supports "morphisms into `Circle`, by the same descent" |
| Scope sentence on ConvexityToric T1 (line 2218) | `G' = Circle`; ConvexityToric README lines 104–106 | `Hom(T, Circle) ≅ Hom(Λ, 2πℤ) ≅ Hom(Λ_Z, ℤ)` with `Λ_Z = (2π)⁻¹ ker exp`; T1 lists duality, restriction, quotient, basis change | true; one owner each |
| `existsUnique_continuousMonoidHom_lieMap_ker` (Lean line 266; cited by the changed text, itself unchanged) | `Circle → Circle`, `g = ×2` on `2πℤ` | unique `f = (z ↦ z²)` | holds, as in the previous review |

The rows of the previous review for untouched statements stand as in that review, of `f17d28c`.

- Source locators read: 3 (knapp2002 Cor. 1.103 at line 4128, Prop. 4.58 at line 11115; kirillov2008 Prop. 3.1 at line 663). Of the seeded sample only §0.3 falls in or is cited by the changed passages.
- Library declarations opened at the pin: 5 (`ContinuousMonoidHom.map_lieExp` and `lieMap_injective`, `Geometry/Lie/ContinuousFunctor.lean` lines 92, 105; `existsUnique_eq_oneParameterSubgroup`, `Geometry/Lie/Exponential/Classification.lean` line 338; `lieExpQuotientKerContinuousAddEquiv`, `Geometry/Lie/Exponential/CommutativeGroup/Basic.lean` line 199; Tau Ceti pin `2fd255d`, as the description says).
- Cross-roadmap citations resolved: 1 (ConvexityToric T1, on main under `SymplecticGeometry/ConvexityToric`, README lines 66 and 104–106).
- Dependency check: `depcheck: 93 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds no supplier.
- Elaboration: `lake env lean` on `Suggested.lean` gives 26 `sorry` warnings and nothing else; the Lean file is unchanged since `f17d28c`; one `import Mathlib`, then `TauCeti.*` modules; no `set_option`, no `lemma`.
- Record: no layer or item of the README at the merge base is removed, renumbered or retitled; nothing outside the pull request's sixteen roadmap folders changes.
- Pull request text: title ("sixteen roadmaps": sixteen folders change) and the LieGroups bullet (§6.1 equivalence, one Lean declaration) agree with the head; the folder's change removes no heading or declaration and adds no supplier, so nothing a reader must know is unstated.
- The worker's automatic checks all passed.

Overlap check: read ConvexityToric, LieGroupsPartII, RealSemisimpleLieGroups and HamiltonianReduction on main, and the open CompactGroupsPartII and ReductiveGroups, as in the previous review; one shared object, the character duality: LieGroups owns the §6.1 lattice equivalence and ConvexityToric T1 owns its 2π-normalized `Circle` case with the restriction, quotient and basis-change formulas, now stated at line 2218. Nothing else shared.

Source independence: changed passages only; 3 passages (the route sentence, the locator sentence, the scope sentence) compared with 2 sources (knapp2002 at Cor. 1.103 and Prop. 4.58, kirillov2008 at Prop. 3.1), none shared; largest share kirillov2008, as in the previous review; no layer added, removed or reordered, so contents not compared again.

Research link: the §6.1 lattice equivalence underlies the 2π-normalized period and weight dictionary that ConvexityToric T1 uses towards Delzant-type classification and that GeometricQuantization consumes; the roadmap's Layer 8 targets Borel–Weil–Bott. Rests on the README and those roadmaps' text.

## Not verifiable

- Bröcker–tom Dieck, Ch. IV, §1 (the locator of the untouched part of §6.1): settled as uncertified, not read.
- The seeded targets other than §0.3 (1.1, 1.4, 3.1, 4.4, 5.1, 5.4, 6.6, 7.2, 7.4, 7.7, 7.9, 7.10, 8.1, 9.5): outside the changed and affected passages, so not re-read in this incremental re-review.

## Source issues

- none

## For the human reviewers

- none
