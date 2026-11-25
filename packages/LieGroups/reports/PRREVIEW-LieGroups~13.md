# Review of LieGroups (pull request #3119 at 5f2bc30)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 62 lines changed since `080c300`. The previous review had no finding; its small correction (the four §4.4 Lean statements stated for groups in `Type` only) and three of its four format notes are repaired, and the repairs introduce no new problem: the four statements now elaborate for groups, models and chart spaces in every universe, as §4.4 says, and the supplier contracts name the four library declarations at the pins. No finding and no small correction; one format note is carried on untouched text, not blocking. Nothing is left for the human reviewers to decide.

## N01 — Untouched text: README, References (lines 2535–2539): Serre and Varadarajan are listed but cited nowhere above

Carried from the three previous reviews. Citing them where they are used, or dropping the two entries, would settle it.

## Previous findings

The previous review (of `080c300`) had no finding, one small correction and four format notes.

- C01 — repaired: `Suggested.lean` lines 145–147 and 157–159 now read `{E : Type u}`, `{H : Type v}`, `{G : Type w}`, `{E' : Type u'}`, `{H' : Type v'}`, `{G' : Type w'}`; the file elaborates.
- N01 — repaired: §4.3 (lines 695–699) reads "The names in this paragraph are proposals, and `Suggested.lean` does not state them", with LieGroupCat and FGLieAlgCat in prose; the docstring no longer names `LieGroupCat.lieFunctor`.
- N02 — repaired: the Mathlib contract lists `GaloisConnection`, `GaloisCoinsertion` and `LieSubalgebra.map_le_iff_le_comap` (lines 2269–2271); the Tau Ceti contract lists `TauCeti.Lie.lieSubalgebraOfSubgroup_mono` and `TauCeti.Lie.lieSubalgebraOfSubgroup_inf` (line 2325).
- N03 — repaired: the Needs line of §5.1 (line 837) reads "§4.3 for the refinement to connected sources; Tau Ceti as named."
- N04 — not repaired: the two entries of References (lines 2535–2539) are still cited nowhere; untouched text, carried as N01.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `map_integralLeafSubgroup`, universes `u v w u' v' w'` | `#check`; `φ : ULift ℝ → Circle` (`w ≠ w'`), `𝔥 = ⊤`; `φ` trivial | six distinct universe levels in the elaborated type; `φ(ℝ) = Circle = leaf(Lie Circle)`; both `{1}` | sound; agrees with §4.4 |
| `normal_iff_exists_lieIdeal` | `#check`; `SU(2)` diagonal circle; `K = ⊥`, `⊤` | type over `Type u_1 u_2 u_3`, `[ConnectedSpace G]`, `[T2Space G]` kept; not ideal and not normal; ideal and normal | sound |
| `lieSubalgebraOfSubgroup_integralLeafSubgroup` | `#check`; `𝔥 = 0`, `𝔥 = ⊤`; `rfl`, `simp` | `{1} ↦ 0`, `G⁰ ↦ 𝔤`; `rfl` fails (not definitional), `simp` makes no progress | sound; not padding |
| `gc_integralLeafSubgroup_lieSubalgebraOfSubgroup` | `#check`; `𝔥 = ℝ`, `Q = ℚ ⊂ ℝ`; `simp` | `ℝ ≰ ℚ` and `ℝ ≰ 0`, both false; `simp` makes no progress | sound; not padding |
| §4.3 universe sentence (reworded) | `exists_simplyConnected_lieGroup` | `L : Type u`; `E`, `H`, `G : Type u` in the statement | true |
| §5.1 Needs line | §5.1's construction against its refinement | construction cites only Tau Ceti `UniversalCover` declarations; only the last sentence uses §4.3's integration | true; no cycle with §4.3 |
| Supplier contracts, five added names | opened at the pins | `lieSubalgebraOfSubgroup_mono` holds for all subgroups; `lieSubalgebraOfSubgroup_inf` assumes both closed, as §4.4 says ("beyond closed ones") | true |

The rows for the untouched statements stand as in the previous review, of `080c300`.

- **Source locators read** (1): kirillov2008 Thm. 2.5 (line 216), cited by §5.1, the one seeded target the change touches (its Needs line); the source states the Lie group structure on the universal cover of a connected group, as the README has it. The other seeded targets (0.2, 1.2, 2.1, 2.2, 2.3, 3.1, 6.7, 7.4, 7.5, 7.11, 8.3, 8.4, 9.1, 9.4) lie outside the change.
- **Library declarations opened at the pin** (6): `TauCeti.Lie.lieSubalgebraOfSubgroup_mono` and `lieSubalgebraOfSubgroup_inf` (`TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean`, lines 359 and 370), `LieSubalgebra.integralLeafSubgroup` (`TauCeti/Geometry/Lie/InvariantVectorField/Foliation.lean`, line 156), `LieSubalgebra.map_le_iff_le_comap` (`Mathlib/Algebra/Lie/Subalgebra.lean`, line 605), `GaloisConnection` and `GaloisCoinsertion` (`Mathlib/Order/GaloisConnection/Defs.lean`, lines 40 and 218). Neither pin declares any of the four §4.4 targets.
- **Cross-roadmap citations:** the change adds none; the overlap data lists no dropped id, no other pull request changing this roadmap and no second copy.
- **Dependency check:** `depcheck: 2 roadmaps, 8 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 25 `sorry` warnings and nothing else; single `import Mathlib` followed by `TauCeti.*` modules, no `set_option`, no `lemma`. `#check @name` on the four changed declarations: each elaborated type agrees with §4.4 and keeps `[I.Boundaryless]` and `[T2Space G]`.
- **One-tactic probe:** `simp` and `rfl` fail on the two order statements; none of the four is padding.
- **Pull request text:** title and description read against this head; no sentence is contradicted (the description already says the §4.3 names are proposals and that §4.4 holds for every finite-dimensional real Lie group), and the change since `080c300` removes or renumbers nothing.
- **Automatic checks:** all passed.

Overlap check: read LieGroupsPartII, RealSemisimpleLieGroups and HamiltonianReduction on main, and the open CompactGroupsPartII, ReductiveGroups, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, AutomorphicFormsOnReductiveGroups and DifferentialGeometry, as in the previous review; the change adds no object, so nothing shared. DifferentialGeometry owns Frobenius and leaves, which §4.1 cites.

Source independence: changed passages only. 3 passages compared with 1 source (kirillov2008): the reworded §4.3 paragraph, the §5.1 Needs line and the Layer 4 docstring bullet; none shared beyond forced terms. Largest share kirillov2008, about 15 of about 62 locators. No layer was added, removed or reordered, so the contents comparison of earlier reviews stands (independent).

Research link: §4.4's closure operator `Q ↦ integralLeafSubgroup (lieSubalgebraOfSubgroup Q)` is the finite-dimensional case of Neeb's Problem IV.1 (2015 text), settled there by Yamabe's theorem; §7.3 is the construction Heins (2025, Prop. 2.1) uses; RealSemisimpleLieGroups and LieGroupsPartII consume Layer 9. Rests on the README and neeb2015 lines 3337–3341.

## Not verifiable

- The seeded targets outside the change were not read again: an incremental re-review checks the sample only where it falls in changed passages.

## Source issues

- none

## For the human reviewers

- none
