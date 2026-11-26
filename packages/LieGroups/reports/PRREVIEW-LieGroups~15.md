# Review of LieGroups (pull request #3170 at f17d28c)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 65 changed lines since `87e7f72`. I checked the new §6.1 equivalence of compact connected commutative Lie groups with their exponential lattices, its three Checks, the Lean statement of its full faithfulness, the Layer 6 dependency line and the scope sentence, against the pinned Tau Ceti and Mathlib and against §4.3, which the change cites; all are correct, and there is no finding. The folder is the same as at the head the previous review read, so its three small corrections and two format notes stand unrepaired and are restated below; none blocks. Nothing is left for the human reviewers.

## C01 — The case `G' = Circle` of the new full-faithfulness theorem is the character duality of ConvexityToric T1, and neither roadmap says how the two relate

A reader cannot tell whether ConvexityToric should derive its duality, restriction and quotient formulas from §6.1 or prove them independently. With `G' = Circle` and `Lie(Circle) ≅ ℝ` by `circleLieAlgebraEquiv`, the kernel is `2πℤ`, and the theorem identifies `Hom(T, Circle)` with `Hom(ker exp_T, 2πℤ)`, the integral dual of `Λ_Z = (2π)⁻¹ ker(exp)`. ConvexityToric on main plans that dictionary ("Build the 2π-normalized period/weight dictionary … Prove duality, restriction, quotient and integral basis-change formulas", its README lines 104–106), and this README still leaves "character periods and integral-lattice refinements" to ConvexityToric T1 (line 2264). LieGroups is ConvexityToric's supplier, so the direction of supply is sound; only the boundary is unstated.

One clause would settle it, in the new paragraph (line 1064) or in the scope sentence the change edits (line 2209), for example: "ConvexityToric T1's character duality is the case `G' = Circle` of this equivalence; its 2π normalization and its restriction and quotient formulas stay there."

## C02 — The new §6.1 target cites no source

A reader cannot check the equivalence against the literature: every other claim of §6.1 carries the Bröcker–tom Dieck locator, and the lattice paragraph (lines 1064–1078) carries none. Knapp, Cor. 1.103 (knapp2002 line 4128) gives only the object part (a compact abelian analytic group is a torus, as `ℝⁿ/D`); it does not state the bijection on homomorphisms. A locator for that bijection at the claim would settle it.

## C03 — The existence route ends at the descended homomorphism and does not say why its Lie map is the linear extension, which is what the theorem asserts

An implementer who follows the route has `f` with `f ∘ lieExp = lieExp ∘ L` and still owes `lieMap f X = g X`. The step is short: by `ContinuousMonoidHom.map_lieExp` also `f ∘ lieExp = lieExp ∘ lieMap f`, so `t ↦ lieExp (t • L X)` and `t ↦ lieExp (t • lieMap f X)` are one one-parameter subgroup, and the uniqueness of §0.3 (Tau Ceti `oneParameterSubgroupEquiv`, `Geometry/Lie/Exponential/Classification.lean` line 318) gives `lieMap f X = L X`. Adding that sentence after "descend it through …" (line 1076), and §0.3 to the *Needs:* line (line 1078), would close the route.

## N01 — The supplier contracts do not list the declarations the new §6.1 paragraph uses by name

The scope section says the declarations used by name are in the supplier contracts; `TauCeti.lieExpAddMonoidHom`, `TauCeti.isZLattice_ker_lieExpAddMonoidHom`, `TauCeti.span_ker_lieExpAddMonoidHom_eq_top`, `TauCeti.lieExpQuotientKerContinuousAddEquiv`, `ContinuousMonoidHom.map_lieExp` and `ContinuousMonoidHom.lieMap_injective` (Tau Ceti), and `Prod.instLieGroup` and `ModuleCat` (Mathlib), are not there. The "Tori and Weyl groups" entry (line 2405) already names the `Exponential/CommutativeGroup/` path and could take the first four.

## N02 — Untouched text: README, References (lines 2558–2562): Serre and Varadarajan are listed but cited nowhere above

Carried from the previous reviews. Citing the two books where they are used, or dropping the entries, would settle it.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_continuousMonoidHom_lieMap_ker` (Lean line 265; README line 1071) | `G = G' = Circle`, `g(2π) = 2πk` | unique `f = (z ↦ zᵏ)`; `lieMap f = ×k`; `2π ↦ 2πk = g(2π)` | holds |
| same | `G` a point (`E = 0`); `G'` a point | kernel `0` so `g = 0`; exactly one `f`, the trivial one, on each side | holds |
| same, non-abelian or cyclic controls | `ℤ/2` (0-dimensional, disconnected) as `G = G'` | `Λ = 0`, `g = 0`; `f` ∈ {id, trivial}: two solutions | `∃!` fails without `ConnectedSpace G`; hypothesis present |
| same, without `CompactSpace G` | `G = ℝ`, `G' = Circle` | `Λ = 0`; every `t ↦ Circle.exp (ct)` satisfies the condition | `∃!` fails; hypothesis present |
| same, hypotheses on `G'` | `G' = ℝ`; `G' = Circle × ℤ/2` | `Λ' = 0`, only trivial `f`; image in `G'⁰`, unique `f` | true without them; they delimit the subcategory |
| same, elaborated type | `#check @…` on a scratch copy | six universes; `IsMulCommutative`, `CompactSpace`, `ConnectedSpace`, `T2Space`, `BoundarylessManifold` kept for both groups | equals the README statement |
| same, one-tactic probe | `simp`, `rfl`, `infer_instance` | unsolved goals; not defeq; not a class | not padding |
| Functor on morphisms (README line 1069) | `X` with `exp X = 1`; `map_lieExp` (`Geometry/Lie/ContinuousFunctor.lean` line 92) | `exp (lieMap f X) = f (exp X) = f 1 = 1` | kernel into kernel |
| Uniqueness route (line 1073) | `span_ker_lieExpAddMonoidHom_eq_top` (`CommutativeGroup/Basic.lean` line 241, compact); `lieMap_injective` (line 105, preconnected) | linear maps equal on a spanning set agree; then `f` is determined | true |
| Existence route (lines 1074–1076) | `G = Circle²`, `G' = Circle`, `g(a, b) = a` | `L` = first projection, `L(Λ) ⊂ Λ'`; descends to `(z, w) ↦ z`, Lie map `L` | true; last step unstated (C03) |
| Essential surjectivity (line 1076) | `n = 0`, `n = 2` | kernels `0` and `(2πℤ)² ≅ ℤ²` | true |
| Check: `Circle`, `z ↦ z²` | `lieExp_circle` (`Exponential/Circle.lean` line 104): `lieExp (e.symm t) = Circle.exp t` | kernel `2πℤ`; `2πk ↦ 4πk`, i.e. `k ↦ 2k` | true |
| Check: connectedness | `ℤ/2`, trivial group | both kernels `0`; identity and trivial map restrict to `0` | true |
| Check: compactness | `ℝ`, `exp = id` | kernel `0`; all `t ↦ ct` restrict to `0` | true |
| Layer 6 dependency line (1331) and *Needs:* (1078) | §4.3 against Layer 6 | Layer 4 precedes Layer 6; §4.3 does not use Layer 6 | no cycle |
| §4.3's category against the Lean carrier | smooth against continuous homomorphisms | `lieMap f` is defined through `toContMDiffMonoidMorphism` (`ContinuousFunctor.lean` line 49): same hom-sets | consistent |
| Module docstring bullet (Lean line 42) | search of both pins for a statement of the bijection | `nonempty_continuousMulEquiv_pi_circle` (object part only, `CommutativeGroup/Classification.lean` line 127); no hom bijection | "not statable as a functor; full faithfulness stated" is true |
| ConvexityToric T1 (C01) | `G' = Circle` against its README lines 104–106 | `Hom(T, Circle) ≅ Hom(Λ, 2πℤ) ≅ Hom(Λ_Z, ℤ)` | special case at the consumer; boundary unstated |

- Source locators read: 1 (knapp2002 Cor. 1.103, line 4128, against the new target). No seeded target falls in the changed or affected passages, and the README flags no locator as unverified.
- Library declarations opened at the pin: 11 (Tau Ceti `lieExpAddMonoidHom`, `lieExpQuotientKerContinuousAddEquiv`, `span_ker_lieExpAddMonoidHom_eq_top`, `isZLattice_ker_lieExpAddMonoidHom` at `Geometry/Lie/Exponential/CommutativeGroup/Basic.lean` lines 85, 199, 241, 248; `ContinuousMonoidHom.lieMap`, `map_lieExp`, `lieMap_injective` at `Geometry/Lie/ContinuousFunctor.lean` lines 49, 92, 105; `circleLieAlgebraEquiv`, `lieExp_circle`; `oneParameterSubgroupEquiv`; Mathlib `Prod.instLieGroup`, `Geometry/Manifold/Algebra/LieGroup.lean` line 183).
- Cross-roadmap citations: the change adds none; ConvexityToric read on main for C01.
- Dependency check: `depcheck: 110 roadmaps, 1275 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 26 `sorry` warnings and nothing else; one `import Mathlib`, then `TauCeti.*` modules (the two added exist at the pin); no `set_option`, no `lemma`.
- Record: no layer or item of the README at the merge base is removed, renumbered or retitled; nothing outside the pull request's sixteen roadmap folders changes.
- Pull request text: the LieGroups bullet matches the head (one README paragraph in §6.1, one Lean declaration, no supplier added).
- Previous review (of `57376f9`, same folder text): no finding; C01–C03, N01 and N02 not repaired, restated here. The worker's automatic checks all passed.

Overlap check: read ConvexityToric, LieGroupsPartII, RealSemisimpleLieGroups, HamiltonianReduction and GeometricQuantization on main, and the open CompactGroupsPartII, ReductiveGroups and SymplecticGeometry. One shared object: ConvexityToric T1 owns the 2π-normalized character duality, which is the case `G' = Circle` of the §6.1 equivalence that LieGroups owns as its supplier (C01); GeometricQuantization cites ConvexityToric for it. ReductiveGroups' diagonalizable anti-equivalence concerns algebraic tori, another category. Nothing else shared.

Source independence: changed passages only; 6 passages (the §6.1 paragraph, its Checks, the dependency line, the scope sentence, the Lean docstring, the module-docstring bullet) compared with 1 source (knapp2002 at Cor. 1.103), none shared; largest share kirillov2008 by my count of author-named locators; no layer added, removed or reordered, so contents not compared again.

Research link: the §6.1 lattice equivalence underlies the 2π-normalized period and weight dictionary that ConvexityToric T1 uses towards Delzant-type classification and that GeometricQuantization consumes; the roadmap's Layer 8 targets Borel–Weil–Bott. Rests on the README and those roadmaps' text.

## Not verifiable

- Bröcker–tom Dieck, Ch. IV, §1 (the locator of the untouched part of §6.1): settled as uncertified, not read.
- The seeded targets (1.3, 1.4, 2.2–2.4, 3.3, 6.6, 6.7, 7.7, 7.8, 8.1–8.3, 8.7, 9.4): all outside the changed and affected passages, so not re-read in this review of the change.

## Source issues

- none

## For the human reviewers

- none
