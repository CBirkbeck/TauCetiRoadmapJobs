# Review of LieGroups (pull request #3170 at 57376f9)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 65 changed lines since `87e7f72`. I checked the new §6.1 equivalence of compact connected commutative Lie groups with their exponential lattices, its Checks, the Lean statement of its full faithfulness, the Layer 6 dependency line and the scope sentence, against the pinned Tau Ceti and Mathlib and against §4.3, which the change cites. They are correct, and there is no finding. Three small corrections and two format notes, none blocking:
- the case `G' = Circle` of the new theorem is ConvexityToric T1's character duality, and nothing says how the two relate;
- the new target has no source locator;
- the existence route leaves out why the Lie map of the descended homomorphism is the extended map.

The previous review's one format note, on untouched text, is carried. Nothing is left for the human reviewers.

## C01 — The case `G' = Circle` of the new full-faithfulness theorem is the character duality that ConvexityToric T1 proves, and neither roadmap says how the two relate

A reader of either roadmap cannot tell whether ConvexityToric should take its duality, restriction and quotient formulas from §6.1 or prove them again. Take `G' = Circle` with `Lie(Circle) ≅ ℝ` by `circleLieAlgebraEquiv`, so that the kernel is `2πℤ`. Then the theorem identifies `Hom(T, Circle)` with `Hom(ker exp_T, 2πℤ)`, that is, characters with the integral dual of `Λ_Z = (2π)⁻¹ ker(exp)`. ConvexityToric on main plans exactly that ("Build the 2π-normalized period/weight dictionary … Prove duality, restriction, quotient and integral basis-change formulas", its README lines 104–106, with the restriction bullet at line 126). This README's scope still leaves "character periods and integral-lattice refinements" to ConvexityToric T1 (line 2241). LieGroups is ConvexityToric's supplier, so the direction is sound; only the boundary is unstated.

One clause would settle it. It could go in the new §6.1 paragraph (line 1064) or in the scope sentence the change edits (line 2209), for example: "ConvexityToric T1's character duality is the case `G' = Circle` of this equivalence; its 2π normalization and its restriction and quotient formulas stay there."

## C02 — The new target in §6.1 cites no source

Without a locator, a reader cannot check the equivalence against a source. Every other claim of §6.1 cites Bröcker–tom Dieck, but the lattice paragraph (lines 1064–1078) cites nothing. Knapp, Cor. 1.103 (knapp2002 line 4128, p. 91) gives only the object part: a compact connected abelian group is `ℝⁿ/D`, a torus. It says nothing about the bijection on homomorphisms. A locator for that bijection, placed at the claim, would settle it.

## C03 — The existence route stops at the descended homomorphism `f` and does not say why its Lie map is the extension `L`, which is what the theorem asserts

An implementer who follows the route has `f` and still owes the conclusion `lieMap f X = g X`. The missing step is short. Descending `L` through `TauCeti.lieExpQuotientKerContinuousAddEquiv` gives `f ∘ lieExp = lieExp ∘ L`. By `ContinuousMonoidHom.map_lieExp`, also `f ∘ lieExp = lieExp ∘ lieMap f`. So `t ↦ lieExp (t • L X)` and `t ↦ lieExp (t • lieMap f X)` are the same one-parameter subgroup, and the uniqueness of §0.3 (`existsUnique_eq_oneParameterSubgroup`; Tau Ceti `oneParameterSubgroupEquiv`, `Geometry/Lie/Exponential/Classification.lean` line 318) gives `lieMap f X = L X`. Adding this sentence after "descend it through …" (line 1076), and §0.3 to the *Needs:* line (line 1078), would close the route.

## N01 — The supplier contracts do not list the declarations the new §6.1 paragraph uses by name

The scope section says that the declarations used by name are in the supplier contracts, but these are missing:
- Tau Ceti: `TauCeti.lieExpAddMonoidHom`, `TauCeti.isZLattice_ker_lieExpAddMonoidHom` and `TauCeti.span_ker_lieExpAddMonoidHom_eq_top` (both compact), `TauCeti.lieExpQuotientKerContinuousAddEquiv` (preconnected), all for commutative `G`, and `ContinuousMonoidHom.map_lieExp`;
- Mathlib: `Prod.instLieGroup` and `ModuleCat`.

Adding them to the "Tori and Weyl groups" entry (line 2405), which already names the `Exponential/CommutativeGroup/` path, and to the Mathlib list would make the scope section's statement true.

## N02 — Untouched text: README, References (lines 2558–2562): Serre and Varadarajan are listed but cited nowhere above

This is carried from the previous reviews. Citing the two books where they are used, or dropping the two entries, would settle it.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_continuousMonoidHom_lieMap_ker` (Lean line 265; README line 1071) | `G = G' = Circle`, `g(2π) = 2πk` | unique `f = (z ↦ zᵏ)`; `lieMap f = ×k` on `ℝ`; `2π ↦ 2πk = g(2π)` | holds |
| same | `G` a point (`E = 0`); `G'` a point; `G = Circle`, `G'` a point | every kernel `0` or `g = 0`; exactly one `f`, the trivial one | holds |
| same, without `ConnectedSpace G` | `G = G' = ℤ/2` (0-dimensional) | `Λ = Λ' = 0`, `g = 0`; `f` ∈ {identity, trivial}: two solutions | `∃!` fails: hypothesis needed (Check 2) |
| same, without `CompactSpace G` | `G = ℝ`, `G' = Circle` | `Λ = 0`; every `t ↦ Circle.exp (ct)` restricts to `0` | `∃!` fails: hypothesis needed (Check 3) |
| same, the hypotheses on `G'` | `G' = ℝ` (not compact); `G' = Circle × ℤ/2` (disconnected) | `Λ' = 0`, only trivial `f`; image in `G'⁰`, unique `f` | holds without them; they cut out the subcategory, harmless |
| same, elaborated type | `#check @…` on a copy of the file | six independent universes; `[IsMulCommutative G] [CompactSpace G] [ConnectedSpace G]`, the same for `G'`, `T2Space`, boundaryless all kept | matches README; Lean as general |
| same, one-tactic probe | `simp`, `rfl`, `infer_instance` | unsolved goals; not definitionally equal; not a class | not padding |
| Functor on morphisms (README line 1069) | `X ∈ ker exp_T`, `ContinuousMonoidHom.map_lieExp` (`ContinuousFunctor.lean` line 92) | `exp (lieMap f X) = f (exp X) = f 1 = 1` | kernel into kernel: true |
| Uniqueness route (line 1073) | `span_ker_lieExpAddMonoidHom_eq_top` (`CommutativeGroup/Basic.lean` line 241); `lieMap_injective` needs preconnected (line 105) | two ℝ-linear maps equal on a spanning set agree; connected implies preconnected | true |
| Existence route (lines 1074–1076) | `G = Circle × Circle`, `G' = Circle`, `g(a, b) = a` | `L` = first projection; descends to `(z, w) ↦ z`; its Lie map is `L` | true; one step unstated (C03) |
| "a Lie map since both algebras are abelian" | `isLieAbelian_of_isMulCommutative` (`Subgroup/Commutative.lean` line 179) | `⁅X, Y⁆ = 0` in both algebras | true |
| Essential surjectivity (line 1076) | `n = 0` (point); `n = 2`, `Prod.instLieGroup` (Mathlib `LieGroup.lean` line 183) | kernels `0` and `(2πℤ)² ≅ ℤ²` | true |
| Check: `Circle`, `z ↦ z²` | `lieExp_circle` (`Exponential/Circle.lean` line 104) | kernel `2πℤ`; Lie map `×2`; `2πk ↦ 4πk`, i.e. `k ↦ 2k` | true |
| Check: connectedness | `ℤ/2` and `1` | both kernels `0`; identity and trivial endomorphism both restrict to `0` | true; fails faithfulness |
| Check: compactness | `ℝ`, `exp = id` | kernel `0`; all `t ↦ ct` restrict to `0` | true |
| Layer 6 dependency line (1331), §6.1 *Needs:* (1078) | Layer 4 against Layer 6 | §4.3 inside Layers 0–5A; no edge into a later layer | true; no cycle |
| §4.3, seeded and cited by the change | kirillov2008 lines 1113, 1223, 1233 | Thm. 3.38: `Hom(G₁, G₂) = Hom(𝔤₁, 𝔤₂)`, `G₁` connected and simply connected; Cors. 3.49–3.50: unique group; equivalence | supports §4.3 as written |
| Category of Lie groups (§4.3, lines 695–714) against the new paragraph | smooth against continuous morphisms | §4.3 uses smooth homomorphisms; Lean uses `G →ₜ* G'`; same sets by automatic smoothness (§2.3) | consistent |
| Module docstring bullet (Lean line 42) | grep both pins for categories of Lie groups or tori | none at either pin; `ModuleCat ℤ` exists, with no full subcategory of finitely generated free modules | true |
| ConvexityToric T1 overlap (C01) | `G' = Circle` against ConvexityToric lines 104–106 | `Hom(T, Circle) ≅ Hom(Λ, 2πℤ) ≅ Hom(Λ_Z, ℤ)`: T1's duality | special case at the supplier; boundary unstated |

- **Source locators read (6):**
  - kirillov2008 Thm. 3.38 and Cors. 3.49–3.50 (lines 1113, 1223, 1233), cited by §4.3, which the change cites.
  - knapp2002 Props. 1.100–1.101 and Cor. 1.103 (lines 4091, 4097, 4128), against the new §6.1 target.
  - The other seeded targets (0.3, 0.4, 2.3, 4.1, 4.2, 5.3, 6.3, 6.6, 7.1, 7.3, 7.10, 8.2, 9.5) lie outside the change.
- **Library declarations opened at the pin (14):**
  - Tau Ceti `lieExpAddMonoidHom`, `lieExpQuotientKerContinuousAddEquiv`, `span_ker_lieExpAddMonoidHom_eq_top` and `isZLattice_ker_lieExpAddMonoidHom` (`Geometry/Lie/Exponential/CommutativeGroup/Basic.lean`, lines 85, 199, 241, 248).
  - Tau Ceti `ContinuousMonoidHom.lieMap`, `map_lieExp` and `lieMap_injective` (`Geometry/Lie/ContinuousFunctor.lean`, lines 49, 92, 105).
  - Tau Ceti `circleLieAlgebraEquiv` and `lieExp_circle` (`Exponential/Circle.lean`, lines 87 and 104), `oneParameterSubgroupEquiv`, `isLieAbelian_of_isMulCommutative` and `nonempty_continuousMulEquiv_pi_circle`.
  - Mathlib `Prod.instLieGroup` and `IsMulCommutative` (`Algebra/Group/Semigroup.lean` line 184).
  - Neither pin states the bijection on homomorphisms.
- **Cross-roadmap citations:** the change adds none. No other open pull request changes this roadmap, and no id is dropped. The resolver's one lead (README line 171) is the namespace name, not a declaration.
- **Dependency check:** `depcheck: 120 roadmaps, 1388 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changed outside the sixteen roadmap folders of the pull request.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 26 `sorry` warnings and nothing else. The file has a single `import Mathlib` followed by `TauCeti.*` modules (two added, both at the pin), no `set_option` and no `lemma`.
- **Pull request text:** the LieGroups bullet of the description matches the head. The change removes or renumbers nothing and adds no supplier.
- **Previous review** (of `5f2bc30`): no finding and no small correction. Its one format note, on untouched text, is not repaired and is carried as N02.
- **Automatic checks:** the worker's run passed every check. My rerun flagged only files outside the folder (set aside below).

Overlap check: read ConvexityToric, HamiltonianReduction, LieGroupsPartII, RealSemisimpleLieGroups and CompactGroups on main, and the open CompactGroupsPartII, ReductiveGroups, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, LieHighestWeightPartII and DifferentialGeometry. Only one shared object: ConvexityToric T1 (owner of the 2π-normalized character duality) proves the case `G' = Circle` of §6.1, whose general equivalence LieGroups owns as ConvexityToric's supplier (C01). CompactGroupsPartII §6.2 consumes ConvexityToric T1 for the same dictionary. ReductiveGroups' anti-equivalence of algebraic tori with Galois lattices is another category. Nothing else is shared.

Source independence: changed passages only. 6 passages compared with 2 sources (knapp2002, kirillov2008): the §6.1 lattice paragraph, its Checks, the Layer 6 dependency line, the scope sentence, the Lean docstring and the module-docstring bullet. None shares wording beyond forced terms. The largest share is kirillov2008, about 15 of about 61 locators. No layer was added, removed or reordered, so the contents comparison of earlier reviews stands (independent).

Research link: the §6.1 lattice equivalence underlies the 2π-normalized period and weight dictionary that ConvexityToric T1 uses for Delzant-type classification, and that CompactGroupsPartII §6.2 reads as Knapp's analytic integrality (Prop. 4.58). §7.3 is Heins's (2025, Prop. 2.1) construction. Rests on the README and those roadmaps' text.

## Not verifiable

- The §6.1 locator to Bröcker–tom Dieck, Ch. IV, §1 (seeded): the text is settled as uncertified, so it was not read.
- The seeded targets outside the change: a review of a change checks the sample only where it falls in changed or affected passages.

Automatic checks set aside as false positives: my rerun of the checks without the pull request's list of its own folders flagged the 29 files of the fifteen other roadmap folders this pull request revises as edits outside the folder; each folder belongs to this pull request.

## Source issues

- **Misprint** in knapp2002 at Proposition 1.101, p. 90: the source says the most general group with the given Lie algebra is the universal cover modulo a central discrete subgroup D of G; it should be D of the universal cover G̃; affects nothing; corrected in print at the errata list, p. 814 (knapp2002 line 34684).

## For the human reviewers

- none
