# Review of LieGroups (pull request #3119 at 080c300)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 164 changed lines since `3496bd2`. I checked the repair of both earlier findings, the new §4.3 paragraph, all of §4.4, the corrected §4.1 Check and the four new Lean statements against computed examples, the pinned libraries, the cited sources, elaboration and the dependency check. Both findings are repaired and no finding remains: the mathematics of the adjunction, the Galois coinsertion, naturality and the normal-subgroup criterion is sound. There is one small correction (the new Lean statements are stated for groups in `Type` only) and four format notes (one on untouched text), none blocking; nothing is left for the human reviewers to decide.

## C01 — The four new Lean statements are stated only for groups, models and chart spaces in `Type`, while §4.4 states them for every finite-dimensional real Lie group

A proof of the statements as written would not apply to a Lie group in a higher universe, and every other section of `Suggested.lean` is universe-polymorphic (`Type u`, `Type v`, `Type w`). The `Correspondence` section declares `{E : Type}`, `{H : Type}`, `{G : Type}` (lines 145–147) and `map_integralLeafSubgroup` declares `{E' : Type}`, `{H' : Type}`, `{G' : Type}` (lines 157–159), whereas §4.4 opens "These results hold for every finite-dimensional real Lie group" (README line 724). Nothing at the pin forces the restriction: `LieSubalgebra.integralLeafSubgroup` (`TauCeti/Geometry/Lie/InvariantVectorField/Foliation.lean`, line 156) is declared over `Type*`, and `TauCeti.Lie.ImmersedLieSubgroupData` over `Type u`, `Type v`, `Type w`. A copy of the file with these six binders changed to `Type u`, `Type v`, `Type w`, `Type u'`, `Type v'`, `Type w'` (the universes the file already declares) elaborates with the `sorry` warnings only.

Changing the six binders would make the Lean statements say what §4.4 says.

## N01 — §4.3 puts `LieGroupCat`, `FGLieAlgCat ℝ`, `LieGroupCat.lieFunctor` and `Γ` in code font although `Suggested.lean` declares none of them (lines 696–702)

The paragraph does say that they are defined here, and the module docstring says why they are not stated; writing them as proposed names in prose ("a category we call `LieGroupCat`") would keep code font for declarations.

## N02 — The supplier contracts do not list four library declarations that §4.4 uses

`TauCeti.Lie.lieSubalgebraOfSubgroup_mono` (line 738) and `TauCeti.Lie.lieSubalgebraOfSubgroup_inf` (line 751) are absent from the Tau Ceti contract, and `LieSubalgebra.map_le_iff_le_comap` (line 765) and `GaloisCoinsertion` (line 737) from the Mathlib contract. All four exist at the pins (`TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean`, lines 359 and 370; `Mathlib/Algebra/Lie/Subalgebra.lean`, line 605; `Mathlib/Order/GaloisConnection/Defs.lean`, line 218).

## N03 — The Needs line of §5.1 (line 836) still reads "§4.3" for the whole section

§4.3 now needs §5.1's construction of the cover for the counit, and says that the construction does not use §4.3. The line under §5.1 would agree with that if it read "§4.3 for the refinement to connected sources".

## N04 — Untouched text: README, References (lines 2531–2535): Serre and Varadarajan are listed but cited nowhere above

Carried from the two previous reviews. Citing them where they are used, or dropping the two entries, would settle it.

## Previous review

The previous review (of `19032d8`) had two findings, three small corrections and five format notes.
- R01 (the §4.3 coreflection stated on carriers that neither the pins nor any layer provide): repaired. §4.3 now reads "Neither pin has the categories, so define them here", builds the Lie functor from §3.1's `lieMap`, `lieMap_id` and `lieMap_comp`, takes the hom-set bijection from `exists_monoidHom_of_lieHom` and `lieMap_injective`, and rests the universe choice on the statement of Lie's third theorem, which does produce its group, model and chart space in the universe of `L` (`Suggested.lean`, lines 194–200). The docstring says the pins have neither category nor the functor.
- R02 (four absent Tau Ceti lemma names and a false reason for second-countability): repaired. The four names are replaced by steps of this roadmap, the identity `lieSubalgebraOfSubgroup (integralLeafSubgroup 𝔥) = 𝔥` is now a declared target, and the hypothesis is gone: "These results hold for every finite-dimensional real Lie group", with the leaf topology applied in `G⁰`.
- C01 (no locators in §4.4): repaired; the three locators stand in the opening paragraph of §4.4, with the clause on Kirillov's missing connectedness hypothesis.
- C02 (two Lean names absent from the README): repaired (lines 757 and 771).
- C03 (the description's second-countability sentence): repaired; the description now says "§4.4 states its results for every finite-dimensional real Lie group".
- N01 (`haveI`), N02 (docstring bullet order), N03 (§3.2 in the Needs line), N04 (namespaces): repaired.
- N05 (Serre and Varadarajan): not repaired; untouched text, carried as N04.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §4.4 `gc_integralLeafSubgroup_lieSubalgebraOfSubgroup` | `𝔥 = 0`; `𝔥 = ℝ`, `Q = ℚ ⊂ ℝ`; `𝔥 = ℝ²`, `Q` dense line in `(ℝ/ℤ)²` | `{1} ≤ Q` and `0 ≤ 𝔮` true; `ℝ ≰ ℚ` and `ℝ ≰ 0` false; `T² ≰ Q` and `ℝ² ≰ ℝ(1,√2)` false | sound |
| §4.4 `lieSubalgebraOfSubgroup_integralLeafSubgroup` | `𝔥 = 0`; `𝔥 = 𝔤`; `𝔥 = ℝ(1,√2)` in `(ℝ/ℤ)²` | `{1}` gives `0`; `G⁰` gives `𝔤`; dense line gives `ℝ(1,√2)`, a closure-based leaf would give `ℝ²` | sound |
| Joins and meets (Checks) | circles `(t,0)`, `(t,2t)`; Heisenberg; `(ℝ/ℤ)³` slopes `(1,√2,0)`, `(0,1,√3)` | intersection `{(0,0),(1/2,0)}`, algebras meet in `0`; product set dim 2, join dim 3; `a ∈ ℤ`, `b√3 ∈ ℤ`, `a√2 + b ∈ ℤ` force `a = b = 0`, no integer normal vector, so dense | sound |
| §4.4 `map_integralLeafSubgroup` and range formula | `φ : ℝ → Circle`, `𝔥 = ℝ`; `φ` trivial; `id` on `ℤ/2` | `φ(ℝ) = Circle = leaf(Lie Circle)`; both `{1}`; range `ℤ/2 ≠ {1} = leaf(0)` | sound; connectedness needed for the range |
| `K.map φ ≤ Q' ↔ K ≤ leaf(comap)`; `(φ⁻¹Q')⁰` | `φ(x,y) = x`, `Q' = ℤ`; `K = ℝ×0`, `0×ℝ` | `ℝ ≰ ℤ` and `ℝ×0 ≰ 0×ℝ`; `{0} ≤ ℤ` and `0×ℝ ≤ 0×ℝ`; `(ℤ×ℝ)⁰ = 0×ℝ` | sound |
| §4.4 `normal_iff_exists_lieIdeal` | `SU(2)` diagonal circle; `K = {1}`, `K = G`; `ℝ² ⋊ ℤ/2`; finite `ℤ/2 ⊂ SO(3)` | ideals of `𝔰𝔲(2)` are `0`, `𝔰𝔲(2)`, circle not normal; `⊥`, `⊤` and normal; ideal, not normal, `G` disconnected; excluded: pinned predicate requires connected source | sound |
| §4.3 adjunction `Γ ⊣ Lie` | `L = ℝ`; `H = Circle`, `ℤ/2`, `O(2)` | `Hom(ℝ, S¹) ≅ ℝ ≅ Hom(ℝ, ℝ)`; counits `ℝ → S¹`, `{1} ↪ ℤ/2`, `ℝ → SO(2) ↪ O(2)`; unit `e_L⁻¹` invertible | sound; carriers now targets |
| §4.3 universe sentence | `exists_simplyConnected_lieGroup` | `L : Type u`; `E`, `H`, `G : Type u` | true |
| §4.1 corrected Check | `K = {1}`, `K = SL₂(ℤ)` without connectedness | both Lie algebras `0`, so `K ↦ lie K` not injective | true |
| C01, universe of the new statements | six binders changed to `Type u … w'` | copy elaborates, `sorry` warnings only | narrower than README |
| Hausdorff binder | `[T2Space G]` deleted in a copy | three statements fail to elaborate (`T2Space G` not synthesized) | binder needed |

- **Source locators read** (7): kirillov2008 Def. 2.6 and Thm. 2.8 (lines 228–236: "Lie subgroup" there is closed), Thm. 3.19 (870–877), Thm. 3.38 (1113), Thm. 3.43 (1137), Thm. 3.48 (1214); knapp2002 Ch. I §10 (heading 3195, image statement 3360–3362); neeb2015 Rem. II.6.5(b) (1924–1926), Problem IV.1 (3337–3341). Seeded targets 4.1, 4.2 and 4.3 fall in changed or affected text and were checked there.
- **Library declarations opened at the pin** (12): `LieSubalgebra.integralLeafSubgroup` (`Geometry/Lie/InvariantVectorField/Foliation.lean` 156), `TauCeti.Lie.ImmersedLieSubgroupData` and `IsImmersedLieSubgroup` (`Subgroup/Immersed/Basic.lean` 59, 161; `ConnectedSpace X` is a field), `TauCeti.Lie.lieSubalgebraOfSubgroup` (`Subgroup/LieAlgebra.lean` 277, a `lieSpan`), `lieSubalgebraOfSubgroup_mono` (359), `lieSubalgebraOfSubgroup_inf` (370), `hasDerivAt_Ad_lieExp_smul_apply_zero` (180), `TauCeti.Lie.conj_lieExp` (`Adjoint/Exponential/Basic.lean` 110), `LeftInvariantDerivation.Ad_lieExp` (`Adjoint/Exponential/Formula.lean` 292), `map_lieExp` (`Functor.lean` 315), `lieMap_id`, `lieMap_comp` (222, 239); Mathlib `LieSubalgebra.map_le_iff_le_comap`, `GaloisCoinsertion`. Neither pin has a category of Lie groups or of Lie algebras.
- **Cross-roadmap citations:** the change adds none; no roadmap on main or at an open head names the four new declarations or the proposed categories.
- **Dependency check:** `depcheck: 121 roadmaps, 1392 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 25 `sorry` warnings and nothing else. The elaborated types of the four new declarations were compared with §4.4: they agree except for the universe (C01); each carries `[I.Boundaryless]` and `[T2Space G]`.
- **One-tactic probe:** `rfl`, `simp` and `infer_instance` fail on all four new theorems, and `exact?` finds only the statement itself. None is padding.
- **Headlines:** the overview's headlines are unchanged; the four §4.4 statements are stated; the §4.3 adjunction is named in the docstring as not statable, with the reason.
- **Automatic checks:** all passed.

Overlap check: read LieGroupsPartII, RealSemisimpleLieGroups and HamiltonianReduction on main, and searched every open head (CompactGroupsPartII, ReductiveGroups, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, AutomorphicFormsOnReductiveGroups and DifferentialGeometry among them) for integral leaf subgroups, the Galois coinsertion, normal subgroups against ideals and categories of Lie groups; nothing shared. HamiltonianReduction's closed normal subgroups are quotients, not this criterion; DifferentialGeometry owns Frobenius and leaves, which §4.1 cites.

Source independence: changed passages only. 8 passages compared with 3 sources (kirillov2008, knapp2002, neeb2015): the §4.3 paragraph, the opening and three paragraphs of §4.4, the §4.1 Check and two docstrings; none shared beyond forced terms. Largest share kirillov2008, about 15 of about 62 locators. No layer was added, removed or reordered, so the contents comparison of earlier reviews stands (independent).

Research link: §4.4's closure operator `Q ↦ integralLeafSubgroup (lieSubalgebraOfSubgroup Q)` is the finite-dimensional case of Neeb's Problem IV.1 (2015 text), settled there by Yamabe's theorem; §7.3 is the construction Heins (2025, Prop. 2.1) uses; RealSemisimpleLieGroups and LieGroupsPartII consume Layer 9. Rests on the README and neeb2015 lines 3337–3341.

## Not verifiable

- Seeded targets outside the change (1.4, 2.2, 3.2, 5.2, 5.4, 6.4, 6.5, 6.7, 7.7, 7.9, 8.4, 9.3) are untouched and unaffected, apart from the uses of §3.2 checked above; they were not read again.
- The printed page of the Knapp passage: the cached text carries the file's page numbers, not the printed ones.

## Source issues

- **Error** in kirillov2008 at Theorem 3.19(2), p. 26 (lines 875–876): the source says a connected Lie subgroup whose Lie algebra is an ideal is normal, with no condition on `G`; it should assume `G` connected (in `ℝ² ⋊ ℤ/2`, `ℝ × 0` is a counterexample); affects a stated result.
- **Gap** in kirillov2008 at Theorem 3.19, p. 26 (line 877): the source prints a placeholder where the proof should be; it should prove both parts (for instance by `Ad(exp X) = e^{ad X}` and generation by exponentials); affects the proof.

## For the human reviewers

- none
